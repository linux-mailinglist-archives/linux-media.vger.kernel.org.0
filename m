Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A6A31C332
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 21:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhBOUr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 15:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhBOUrW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 15:47:22 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E877DC061756
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 12:46:41 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id e15so5700854qte.9
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 12:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3vnbyd+FSQ7JLkQZLcxkUBRVmalOAVC3JmRRBLUbqks=;
        b=esWzugW0DKNBhrEoOD3RZZJolEW7Ikdy5h5A40L1tqevvbAOT0V/axZemZNOQYOsnx
         ZqD3ZNUy7by/NGsHl09vQs2I9j3jVNSSq/5jppK8df5zAjh2YbuB92wVmlkE6owxZt6Z
         fwPkbPpOrOtuUOH/tqvvcYAUJ7p8hpPxFMCbkziFPOS2od1Xdv+xAzbaRryT395mvWIA
         QyyYXiKXhyZNlxJBfjOYZS5ljhuVQqbKjm+x0+mXk6Y6fxHbxD/TWeJerjITehGHcVPB
         pxTKBBtJtVVSfRfx3vwnolnX6XUXAf2UOCCWDeKRGFqpkPkgkyir6U39VbeZbqeRFUQ0
         u1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3vnbyd+FSQ7JLkQZLcxkUBRVmalOAVC3JmRRBLUbqks=;
        b=D0PI05QS00xro38YFoDUM4pOSgdqjd75otdskYCxqODjA6ETmh0xfJ0uBzYD7P1Btj
         rXsEW3zSl6bP2XCOV/BnrMQ3bCr2etpxFkhFoXg66XZt0Mhj2yUZjk5yUuB+qvN88f3T
         xuP2u5lSE5TrxU7G4bvV6ve7Ua75N+M79U0iQPGuc4WXDbgmlB8jezdZq4WjotFlTP+r
         KTFIkn7poPwAxHEIUgwRQRojemm6IQuxOfK2ZrlammkrH+27RSNlTAI36TAPHgZNvdY1
         MIbS+hakQoqI5dAbS0qzt97/ZyfwPly/Li/ZnN/JLgd6go0o3NsBCB+RloM5fwXr0T2L
         2GJA==
X-Gm-Message-State: AOAM532yETa8Hkx7WPzFi1swFbON8mEDpld37I5pwTGtLtQI1lzEVXw0
        WQi5aj/qUZo/DVXNbUnHpM1FEQ==
X-Google-Smtp-Source: ABdhPJxFh3xw6PwIlF1Y7XPVhEvBoCKjuezA7yM/mz2kCLQ8EzJp2uMSCiO+RZLY6uXhugkk3quoNg==
X-Received: by 2002:ac8:1009:: with SMTP id z9mr15996768qti.347.1613422001232;
        Mon, 15 Feb 2021 12:46:41 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id k187sm13020361qkc.74.2021.02.15.12.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 12:46:40 -0800 (PST)
Message-ID: <6e107811295b7fdd96525453ea5587ee6adc1b06.camel@ndufresne.ca>
Subject: Re: DMA-buf and uncached system memory
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org, lkml <linux-kernel@vger.kernel.org>
Cc:     "Sharma, Shashank" <Shashank.Sharma@amd.com>
Date:   Mon, 15 Feb 2021 15:46:39 -0500
In-Reply-To: <80c42ce0-6df1-71ab-81ec-e46cc56840ba@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
         <e6897f92-4c61-cd42-2822-43c50a744d4c@suse.de>
         <302e06ad-f979-dc77-5d84-fa0923aa4632@suse.de>
         <80c42ce0-6df1-71ab-81ec-e46cc56840ba@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 15 février 2021 à 13:10 +0100, Christian König a écrit :
> 
> 
> Am 15.02.21 um 13:00 schrieb Thomas Zimmermann:
> > Hi
> > 
> > Am 15.02.21 um 10:49 schrieb Thomas Zimmermann:
> > > Hi
> > > 
> > > Am 15.02.21 um 09:58 schrieb Christian König:
> > > > Hi guys,
> > > > 
> > > > we are currently working an Freesync and direct scan out from system 
> > > > memory on AMD APUs in A+A laptops.
> > > > 
> > > > On problem we stumbled over is that our display hardware needs to 
> > > > scan out from uncached system memory and we currently don't have a 
> > > > way to communicate that through DMA-buf.
> > 
> > Re-reading this paragrah, it sounds more as if you want to let the 
> > exporter know where to move the buffer. Is this another case of the 
> > missing-pin-flag problem?
> 
> No, your original interpretation was correct. Maybe my writing is a bit 
> unspecific.
> 
> The real underlying issue is that our display hardware has a problem 
> with latency when accessing system memory.
> 
> So the question is if that also applies to for example Intel hardware or 
> other devices as well or if it is just something AMD specific?

I do believe that the answer is yes, Intel display have similar issue with
latency, hence requires un-cached memory.

> 
> Regards,
> Christian.
> 
> > 
> > Best regards
> > Thomas
> > 
> > > > 
> > > > For our specific use case at hand we are going to implement 
> > > > something driver specific, but the question is should we have 
> > > > something more generic for this?
> > > 
> > > For vmap operations, we return the address as struct dma_buf_map, 
> > > which contains additional information about the memory buffer. In 
> > > vram helpers, we have the interface drm_gem_vram_offset() that 
> > > returns the offset of the GPU device memory.
> > > 
> > > Would it be feasible to combine both concepts into a dma-buf 
> > > interface that returns the device-memory offset plus the additional 
> > > caching flag?
> > > 
> > > There'd be a structure and a getter function returning the structure.
> > > 
> > > struct dma_buf_offset {
> > >      bool cached;
> > >      u64 address;
> > > };
> > > 
> > > // return offset in *off
> > > int dma_buf_offset(struct dma_buf *buf, struct dma_buf_off *off);
> > > 
> > > Whatever settings are returned by dma_buf_offset() are valid while 
> > > the dma_buf is pinned.
> > > 
> > > Best regards
> > > Thomas
> > > 
> > > > 
> > > > After all the system memory access pattern is a PCIe extension and 
> > > > as such something generic.
> > > > 
> > > > Regards,
> > > > Christian.
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > 
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > 
> > 
> 


