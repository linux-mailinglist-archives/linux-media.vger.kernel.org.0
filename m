Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4AFF9AED
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 21:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbfKLUmY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 15:42:24 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:44108 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbfKLUmY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 15:42:24 -0500
Received: by mail-yb1-f194.google.com with SMTP id g38so9316ybe.11
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2019 12:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DjCiefqhC9NfqWC/1OWuy32sE5JWmV0rJU7JOPNgew0=;
        b=W944HHeBKCxkA8DrDh1k5jwoR6EZOWptr72GU329mg37lMtwT4iUEUZ8MibJm1WXxY
         mp7Vd5ttNkK4CKdk10wHGc7YF9Rmc7Qp+ybpA4tYo7/O523giEtR7c+XhEyDLATnYhVb
         IHC5y7twtbRJyIHHZRzoKP5vi4ejGXVr27T0mo7g73zutfQIeyf6oGcvFewyLk2NPWyf
         q8dSyuNzqh3edUolXoBkZG1uAJt7F9zXjjeQZ8cmV2aXlwTzMa1bBwazwh9AoGVjpztq
         ROJ96zgqiMdd32cZMSWhMI6OeGD1IF1ynEhs9KMTYO6cZ/2BMyturVgRm8wJtwJzGjPa
         d2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DjCiefqhC9NfqWC/1OWuy32sE5JWmV0rJU7JOPNgew0=;
        b=tVniRTTePvRad6jM/ogCvUPzqOoYvwF8f0prAqgzQ8ZwwBeA+tURQxlmjc9HljvZPT
         xYETkTMqeRBTLkCziu0B12XLdP52K9K6OWQ4QXxvdHH75tw7H6YaXg8VeuBxRYycyaQf
         iENUiL/U+OrtEZRKTlmib3/7fdxaaRY+CaEB5IrrClIvYZ9L/AKGFCPRn6uOZzKHqWel
         2566/zpVUHwU0ZnKRa5eDxKwcfDunuhwQT7g4uhRPudS8rvWbXle7e6m+djQoCgc0YCK
         CEYClhcxYkSgDymSivtzFOsxwjtd6m9dL7mqVpvEMWBujpwTwouykivlsKusQjGm4I67
         MYIw==
X-Gm-Message-State: APjAAAXpXYEAN/CJks+3OImXoz7Ke4PKtb2Td3WWQUZKeMQ3wSofUxqW
        b2EIrHe97I+vYraXap/AfsvSYQ==
X-Google-Smtp-Source: APXvYqyYtUgeVlNwdv9fMm8VoUMF8TaIvGt5yJhxR65GCBa+3/C4/0mBjyFFaaUNb80Ijg+1jMj5gA==
X-Received: by 2002:a25:7583:: with SMTP id q125mr2877735ybc.28.1573591343192;
        Tue, 12 Nov 2019 12:42:23 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id 138sm9476213ywr.46.2019.11.12.12.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 12:42:22 -0800 (PST)
Date:   Tue, 12 Nov 2019 15:42:22 -0500
From:   Sean Paul <sean@poorly.run>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Johan Hovold <johan@kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, linux-s390@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable <stable@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/4] drm/msm: fix memleak on release
Message-ID: <20191112204222.GB25787@art_vandelay>
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010131333.23635-2-johan@kernel.org>
 <20191030100146.GC4691@localhost>
 <20191112104001.GP11035@localhost>
 <20191112140155.GJ23790@phenom.ffwll.local>
 <CAF6AEGvom2wZ89434VLhhgAHCk_MMCGRbxSO+DQsX=+LPOCy8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGvom2wZ89434VLhhgAHCk_MMCGRbxSO+DQsX=+LPOCy8A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 12, 2019 at 08:32:07AM -0800, Rob Clark wrote:
> On Tue, Nov 12, 2019 at 6:01 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Nov 12, 2019 at 11:40:01AM +0100, Johan Hovold wrote:
> > > On Wed, Oct 30, 2019 at 11:01:46AM +0100, Johan Hovold wrote:
> > > > On Thu, Oct 10, 2019 at 03:13:30PM +0200, Johan Hovold wrote:
> > > > > If a process is interrupted while accessing the "gpu" debugfs file and
> > > > > the drm device struct_mutex is contended, release() could return early
> > > > > and fail to free related resources.
> > > > >
> > > > > Note that the return value from release() is ignored.
> > > > >
> > > > > Fixes: 4f776f4511c7 ("drm/msm/gpu: Convert the GPU show function to use the GPU state")
> > > > > Cc: stable <stable@vger.kernel.org>     # 4.18
> > > > > Cc: Jordan Crouse <jcrouse@codeaurora.org>
> > > > > Cc: Rob Clark <robdclark@gmail.com>
> > > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > > ---
> > > >
> > > > Rob, Sean,
> > > >
> > > > Sending a reminder about this one, which is not yet in linux-next.
> > > >
> > > > Perhaps Daniel can pick it up otherwise?
> > >
> > > Another two weeks, another reminder. This one is still not in -next.
> >
> > Well msm is maintained in a separate tree, so the usual group maintainer
> > fallback for when patches are stuck doesn't apply.
> 
> oh, sorry, this wasn't showing up in patchwork.. or rather it did but
> the non-msm related series subject made me overlook it.
> 
> I've already sent a PR, but this shouldn't conflict with anything and
> I think it can go in via drm-misc/fixes
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Thanks for the patch, pushed to drm-misc-next-fixes

Sean

> 
> > Rob, Sean, time to reconsider drm-misc for msm? I think there's some more
> > oddball patches that occasionally get stuck for msm ...
> >
> > Also +Dave.
> > -Daniel
> >
> > >
> > > Johan
> > >
> > > > >  drivers/gpu/drm/msm/msm_debugfs.c | 6 +-----
> > > > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> > > > > index 6be879578140..1c74381a4fc9 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_debugfs.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> > > > > @@ -47,12 +47,8 @@ static int msm_gpu_release(struct inode *inode, struct file *file)
> > > > >   struct msm_gpu_show_priv *show_priv = m->private;
> > > > >   struct msm_drm_private *priv = show_priv->dev->dev_private;
> > > > >   struct msm_gpu *gpu = priv->gpu;
> > > > > - int ret;
> > > > > -
> > > > > - ret = mutex_lock_interruptible(&show_priv->dev->struct_mutex);
> > > > > - if (ret)
> > > > > -         return ret;
> > > > >
> > > > > + mutex_lock(&show_priv->dev->struct_mutex);
> > > > >   gpu->funcs->gpu_state_put(show_priv->state);
> > > > >   mutex_unlock(&show_priv->dev->struct_mutex);
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Sean Paul, Software Engineer, Google / Chromium OS
