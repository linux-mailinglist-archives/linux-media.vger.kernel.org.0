Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA79D2BB4
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 15:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfJJNus (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 09:50:48 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43600 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfJJNus (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 09:50:48 -0400
Received: by mail-ed1-f65.google.com with SMTP id r9so5514537edl.10
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2019 06:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=o898Z3trs0jH/OlBQbiOm8e/1sEfrvM2Vk3WyyK56M4=;
        b=TQZ07FMvCXrWciJ7O9lR+yonpxUCVIcHnhmodCVsy5Dh/Y5im2arlnqViBllsFZMoz
         FX1zMJwHMqtbjlVh/VFK76TKJ5qMTJkhvErbbOvUl3k+Ss1ZPSUdmEOoFoKO4bV2Iigr
         iZ9kCTkHefQMk+aqix6L1jZn0EltF9d/5eWS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=o898Z3trs0jH/OlBQbiOm8e/1sEfrvM2Vk3WyyK56M4=;
        b=XKjlqKWKk2fL1UIByWTX7aM9jVRupC6A4+zYDzqGhSLvWPDdWwwOWvMxSCJsgP/Z4B
         tOsKrLoup4ph193FmBUZTOHOXb70KeH1x23DmwQimO//fzSD+eGZRZSll05Jvre+v+U/
         zaZJ7ogwnnf9YPMTIdBH3bfMjQORnE/pB2MJ/Tr99oJvJM/1yQ2J9n1eVrsAHFOWJwlu
         2d+hJ0yexslZzxtyfgtwDkkql0AgbDUlQWrrcYk2OLWqCIO4wQskcohEDxx6Q/yRG63l
         c18vNGb/Y9G1Yg3pH591qUnCNEQ2vo5aCJohT/LxtVYbcYVir/Px2gCdfKNR8wtTeieL
         uMPQ==
X-Gm-Message-State: APjAAAVCbVCIsMGir+sjklqqbq7oy1GPajtVT5sn9vVb2CrWBC/oIsj1
        DPBHCuGIuuRR0Rr1V12C65Gd0A==
X-Google-Smtp-Source: APXvYqwDTtGo4w8HEdRUZir73TR7uahsebmS6NjOfoevZfEYTOWdmz2kjDkxMdcPaAEi5/omDEtt/g==
X-Received: by 2002:a17:906:7e17:: with SMTP id e23mr374597ejr.205.1570715446752;
        Thu, 10 Oct 2019 06:50:46 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id 36sm988776edz.92.2019.10.10.06.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 06:50:45 -0700 (PDT)
Date:   Thu, 10 Oct 2019 15:50:43 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Johan Hovold <johan@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Harald Freudenberger <freude@linux.ibm.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-s390@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/4] treewide: fix interrupted release
Message-ID: <20191010135043.GA16989@phenom.ffwll.local>
Mail-Followup-To: Johan Hovold <johan@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Harald Freudenberger <freude@linux.ibm.com>,
        David Airlie <airlied@linux.ie>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-s390@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20191010131333.23635-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010131333.23635-1-johan@kernel.org>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 10, 2019 at 03:13:29PM +0200, Johan Hovold wrote:
> Two old USB drivers had a bug in them which could lead to memory leaks
> if an interrupted process raced with a disconnect event.
> 
> Turns out we had a few more driver in other subsystems with the same
> kind of bug in them.
> 
> Note that all but the s390 patch have only been compile tested, while
> the s390 one has not even been built.

Random funny idea: Could we do some debug annotations (akin to
might_sleep) that splats when you might_sleep_interruptible somewhere
where interruptible sleeps are generally a bad idea? Like in
fops->release?

Something like non_block_start/end that I've recently done, but for
interruptible sleeps only? Would need might_sleep_interruptibly()
annotations and non_interruptly_sleep_start/end annotations.
-Daniel

> 
> Johan
> 
> 
> Johan Hovold (4):
>   drm/msm: fix memleak on release
>   media: bdisp: fix memleak on release
>   media: radio: wl1273: fix interrupt masking on release
>   s390/zcrypt: fix memleak at release
> 
>  drivers/gpu/drm/msm/msm_debugfs.c             | 6 +-----
>  drivers/media/platform/sti/bdisp/bdisp-v4l2.c | 3 +--
>  drivers/media/radio/radio-wl1273.c            | 3 +--
>  drivers/s390/crypto/zcrypt_api.c              | 3 +--
>  4 files changed, 4 insertions(+), 11 deletions(-)
> 
> -- 
> 2.23.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
