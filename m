Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97138245E88
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 09:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgHQHw7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 03:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726615AbgHQHwx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 03:52:53 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF03C061388;
        Mon, 17 Aug 2020 00:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=u/oZucHfqNRGkZEZMXMSNk2t2Asa+6aFS12beZBuHdQ=; b=sEAZqPhOKMnbpyt849T8o2ToUN
        RngAd21wnqoS536yT5okpXhhbiwHdkCrsj7/pRcjhQkwykJMqA7l15AqGW+yIEM6DnKMeTFyUnIOh
        GH2cG1aJD9JDsTrLrtJu/i9L9DUbMhWRyQ4NcjsK66TeQiWMlMrV4G1wnUxTuQ9sk3TPtC4Ezt92G
        ryCTB9+97d/HKwyNTWLZ8f0PhLRwb6I2Y00xs257mbu1A8C6vgr71ODySxPu3I7Z8m65vJqGuy+1O
        UEn4xTkJF9Q3C5pMbKLZLUJ63mWLacWtAw2IAcpgY94/688BKhk9xmcMbgI6r6ppIbNRFwC2AdDk7
        5XLNELYw==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1k7Zwh-0006QF-09; Mon, 17 Aug 2020 10:52:43 +0300
Subject: Re: Role of DMA Heaps vs GEM in allocation
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi>
 <CAKMK7uEatNdZ64QmGXLY3GCqDquAr0rcTFF0006K7+L_vySYzg@mail.gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <6765d408-d7cf-31a6-1116-0f673fa61a84@kapsi.fi>
Date:   Mon, 17 Aug 2020 10:52:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEatNdZ64QmGXLY3GCqDquAr0rcTFF0006K7+L_vySYzg@mail.gmail.com>
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

On 8/14/20 3:12 PM, Daniel Vetter wrote:
> On Fri, Aug 14, 2020 at 1:34 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
>>
>> Hi,
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
>>
>> My question is then: what is the role of DMA Heaps? If it is to be used
>> as a central allocator, should the FD issue be left to the application,
>> or addressed somehow? Should it be considered a potential alternative
>> for GEM allocations?
> 
> Atm no one knows. What's for sure is that dma-buf fd are meant to
> establish sharing, and then once imported everywhere, closed again.
> dma-buf heaps might or might be useful for sharing the cross-device
> memory allocator problem (the rough idea is that in sysfs every device
> lists all the heaps it can use, and then you pick the common one that
> works for all devices). But that's for shared buffers only.
> 
> For an acceleration driver you want drm gem ids, because yes fd
> limits. Also constantly having to reimport dma-buf for every cs ioctl
> doesn't sound like a bright idea either, there's a reason we have the
> drm_prime cache and all that stuff.

Couldn't we just import once, and then use the GEM handle afterwards?

> 
> I have also no idea why you wouldn't want to use the existing drm
> infrastructure, it's all there.

Sure; I think I'll add the normal GEM IOCTLs, since as you said, it's 
quite easy to do and standard. I think it was more of a question about 
the philosophy of DMA-BUF Heaps. In the future there may be other issues 
like allocation from certain carveouts, where it'd be better not to 
duplicate the allocation logic in multiple drivers, though there should 
be multiple ways to address that, too.

> 
> Cheers, Daniel

Thanks!
Mikko

> 
>>
>> Thanks,
>> Mikko
>>
>> [1] https://www.spinics.net/lists/dri-devel/msg262021.html
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
> 
