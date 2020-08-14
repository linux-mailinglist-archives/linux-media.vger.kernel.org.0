Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837202448DA
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 13:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgHNLe5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 07:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgHNLe5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 07:34:57 -0400
X-Greylist: delayed 2087 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 14 Aug 2020 04:34:56 PDT
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A51C061384
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 04:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=YP0DmDDXRMajgdF+3ZbtNv5wrRmW65V8N8OdjpKYDpE=; b=leGqr0E227Y9gJV+vDo/BWkfo7
        rz4vKGwN9qXGehZO/Ma4IW3cq7rhcE8me2UiAal0enFAuij6tnxqgzY0bpzkTjg86chSB3Op39OFG
        hQXpz8+wn2NjEcXlsv6rcKI4IQFOpKJerRvp2H8z5P5VrLnGOMg+ZyjwSlMlciXuRjK8h7wPBswVq
        CH8jY9cFjEV8XV/gG++ReJiCs2ooh+wnx/7dlR0EMnkk9/m3TwrqJU7kKH37qf54Fl1GLrX0YHviU
        Hcx+g3MdwY/6QrCLzdtx6e5AHtcK7dg//fCycTfxw9TFtU8+/+LDQkd111ylgrqdxpta/DvqpiC36
        LY5L250w==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1k6XRF-0002xP-Gn; Fri, 14 Aug 2020 13:59:57 +0300
To:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media@vger.kernel.org, john.stultz@linaro.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Subject: Role of DMA Heaps vs GEM in allocation
Message-ID: <57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi>
Date:   Fri, 14 Aug 2020 13:59:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
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

Hi,

I'm currently working on a new UAPI for Host1x/TegraDRM (see first draft 
in thread "[RFC] Host1x/TegraDRM UAPI"[1]). One question that has come 
up is regarding the buffer allocation mechanism. Traditionally, DRM 
drivers provide custom GEM allocation IOCTLs. However, we now have DMA 
Heaps, which would be sufficient for TegraDRM's needs, so we could skip 
implementing any GEM IOCTLs in the TegraDRM UAPI, and rely on importing 
DMA-BUFs. This would mean less code on TegraDRM's side.

However, one complication with using DMA Heaps is that it only provides 
DMA-BUF FDs, so it is possible that a user application could run out of 
free file descriptors if it is not adjusting its soft FD limit. This 
would especially be a problem for existing applications that might have 
worked with the traditional GEM model and didn't need to adjust their FD 
limits, but would then fail in some situations with the increased FD 
usage of DMA-BUF FDs.

My question is then: what is the role of DMA Heaps? If it is to be used 
as a central allocator, should the FD issue be left to the application, 
or addressed somehow? Should it be considered a potential alternative 
for GEM allocations?

Thanks,
Mikko

[1] https://www.spinics.net/lists/dri-devel/msg262021.html
