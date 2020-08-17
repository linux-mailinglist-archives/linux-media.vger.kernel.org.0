Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFF8245ED6
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 10:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgHQIHw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 04:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgHQIHv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 04:07:51 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A67C061388;
        Mon, 17 Aug 2020 01:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=r7WbGzVtm2oC9CC43sPiWDFsv7kDRIWvlltobQO6A+U=; b=MTvnrvwFrm8JUFBGiuWBndScrq
        JtZX0nZCAXs2TvZ6DhMZb16U2PsRt6EpipQQvWj8VHEa6uJ+7un7ppeRx+2K79FZFTaEqKgeIL20i
        mbsDurpS+JVUYYT7eWf1fZiTcqKtk3mn2/H28GyEMu6awfR7hmhwYpNTS76n+hzsO6z+Q/BLT0pVa
        SXShP5BHVvZFg4BRT7I4iT9/trRQM5Ckw+p8BvnMiybPCUiPO15t7Wp3mz+GFL5hUHaT46Qd/NalV
        Z1ILyYf+I87Jc86po7WHH+nhyC5a6ptUS4m12E6dyYle6ygAP95390S8j+mxk2ys0aQXuSDc5WjiG
        Hy8wCXNQ==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1k7aBJ-0005Yn-3l; Mon, 17 Aug 2020 11:07:49 +0300
Subject: Re: Role of DMA Heaps vs GEM in allocation
To:     John Stultz <john.stultz@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi>
 <CALAqxLX4J4bykRis3=Q2Q54Fe1o7A7nFH3Yfjbi-kNXOQPrQpw@mail.gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <186bd573-a6d8-f88c-d87d-bfe766f1fb24@kapsi.fi>
Date:   Mon, 17 Aug 2020 11:07:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLX4J4bykRis3=Q2Q54Fe1o7A7nFH3Yfjbi-kNXOQPrQpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/14/20 11:53 PM, John Stultz wrote:
> On Fri, Aug 14, 2020 at 3:59 AM Mikko Perttunen <cyndis@kapsi.fi> wrote:
>>
>> I'm currently working on a new UAPI for Host1x/TegraDRM (see first draft
>> in thread "[RFC] Host1x/TegraDRM UAPI"[1]). One question that has come
>> up is regarding the buffer allocation mechanism. Traditionally, DRM
>> drivers provide custom GEM allocation IOCTLs. However, we now have DMA
>> Heaps, which would be sufficient for TegraDRM's needs, so we could skip
>> implementing any GEM IOCTLs in the TegraDRM UAPI, and rely on importing
>> DMA-BUFs. This would mean less code on TegraDRM's side.
>>
>> However, one complication with using DMA Heaps is that it only provides
>> DMA-BUF FDs, so it is possible that a user application could run out of
>> free file descriptors if it is not adjusting its soft FD limit. This
>> would especially be a problem for existing applications that might have
>> worked with the traditional GEM model and didn't need to adjust their FD
>> limits, but would then fail in some situations with the increased FD
>> usage of DMA-BUF FDs.
> 
> I'm not sure exactly if this would help, but I am working on some
> exploratory tweaks to DMA BUF Heaps so that there could be an
> in-kernel accessor that returns a struct dma_buf instead of a fd.
> 
> This is motivated as some folks want to use DMA BUF Heaps (if I
> understand your approach) in a similar fashion, where the driver wants
> to generate a DMA BUF but doesn't want to create their own DMA BUF
> exporter which would duplicate one of the DMA BUF Heaps.
> 
> I'm a little mixed on this as part of the reason DMA BUF Heaps exists
> as a userland interface is because its userland which knows the path
> that a buffer will take, so userland is in the best position to
> understand what type of buffer it needs to allocate. It seems to me
> that drivers should instead import a buffer provided to them from
> userland to fill, rather than allocating a buffer from a heap they
> choose (which may constraint later use of that buffer). But, I also
> grant that drivers implementing their own DMA BUF exporters that
> duplicate existing code is silly, so having in-kernel allocation
> interfaces may be reasonable.
> 
> However, the efforts are also somewhat blocked on having a public
> in-kernel user of such an interface, so they are basically only
> exploratory at the moment. So if you have an in-kernel user interested
> in something like this, I'd be glad to get further input.
> 
> This probably doesn't help answer your question wrt to GEM, and I'd
> defer to Daniel there. :)

I think TegraDRM doesn't have a particular need for that (at least in 
its current state), since it already needs GEMs, and has the GEM 
infrastructure from DRM to lean on.

Thanks for the information, anyway :)

> 
> thanks
> -john
> 

Mikko
