Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F358BF914E
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 15:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbfKLOCA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 09:02:00 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38525 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbfKLOCA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 09:02:00 -0500
Received: by mail-wm1-f68.google.com with SMTP id z19so3074870wmk.3
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2019 06:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=MrWmg4S4QVjfl7ElzvbNo6Dq6sBDPaTcM04xou8JMbE=;
        b=ax6nC2UjJtb1u8+MWf7et5sm8f0kIu4FeoVmwb6B7m7QoYHoTqVObl+BovSgMMSj/Y
         9LZMJ3Q78YAesg8YG9NjW3ZTkADp/BoA9hw5aPkSBeQjZwSPGeuvAWEUC2HqA3ZoZqfo
         ZkBPnLF64sC+ifwhNdox79S20LdCKzVH6cupY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=MrWmg4S4QVjfl7ElzvbNo6Dq6sBDPaTcM04xou8JMbE=;
        b=XGLctTV9Xx2rAeY9hr0XlvRN9jDBpdVqzhVkNPNCPQl7MefMbx6dDSvN4EujO3FESe
         6cKBprd+ag1gYzsyOAN//ibeeaSEdWJ/PhjL3L5yothqI0wgEfIfIi5fR7LxGhDQ59T/
         UkJlx12RP8F5Nd9sY1mv3hYFBlJk24jG9XOqiP47S/uQ1/KqHVAuPGSRO0tpAFPcLYIL
         F1zmTaNIPYcGRBMow4iZfBvmvPYSBn8nY34UMw3SHh+Iv8WW827amqA55vsXifwTy00Y
         dHkOWmqFHdCq/h+PzwLX4y47lIuH7C3JNXANKzeoHb6HpjRAxiJkspFMUq5jGJcroZSf
         GH9w==
X-Gm-Message-State: APjAAAV/mZTeVjomR+3HDyF2xmxQOuL39kB3S5ToQgwJr9bznlwEmjKv
        UchSKdWkW6CB9zFfKpK0r2A28A==
X-Google-Smtp-Source: APXvYqwg1um6jg+/qODyeIAqZsG4VJkK0RglxJrSmFgE3PAxS7h90PQ/gBE97aZORkW05LcpoYTR5w==
X-Received: by 2002:a1c:984b:: with SMTP id a72mr4286085wme.78.1573567317930;
        Tue, 12 Nov 2019 06:01:57 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id l4sm3059222wme.4.2019.11.12.06.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 06:01:57 -0800 (PST)
Date:   Tue, 12 Nov 2019 15:01:55 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Johan Hovold <johan@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-s390@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable <stable@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/4] drm/msm: fix memleak on release
Message-ID: <20191112140155.GJ23790@phenom.ffwll.local>
Mail-Followup-To: Johan Hovold <johan@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-s390@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable <stable@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Dave Airlie <airlied@gmail.com>
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010131333.23635-2-johan@kernel.org>
 <20191030100146.GC4691@localhost>
 <20191112104001.GP11035@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112104001.GP11035@localhost>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 12, 2019 at 11:40:01AM +0100, Johan Hovold wrote:
> On Wed, Oct 30, 2019 at 11:01:46AM +0100, Johan Hovold wrote:
> > On Thu, Oct 10, 2019 at 03:13:30PM +0200, Johan Hovold wrote:
> > > If a process is interrupted while accessing the "gpu" debugfs file and
> > > the drm device struct_mutex is contended, release() could return early
> > > and fail to free related resources.
> > > 
> > > Note that the return value from release() is ignored.
> > > 
> > > Fixes: 4f776f4511c7 ("drm/msm/gpu: Convert the GPU show function to use the GPU state")
> > > Cc: stable <stable@vger.kernel.org>     # 4.18
> > > Cc: Jordan Crouse <jcrouse@codeaurora.org>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > ---
> > 
> > Rob, Sean,
> > 
> > Sending a reminder about this one, which is not yet in linux-next.
> > 
> > Perhaps Daniel can pick it up otherwise?
> 
> Another two weeks, another reminder. This one is still not in -next.

Well msm is maintained in a separate tree, so the usual group maintainer
fallback for when patches are stuck doesn't apply.

Rob, Sean, time to reconsider drm-misc for msm? I think there's some more
oddball patches that occasionally get stuck for msm ...

Also +Dave.
-Daniel

> 
> Johan
> 
> > >  drivers/gpu/drm/msm/msm_debugfs.c | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> > > index 6be879578140..1c74381a4fc9 100644
> > > --- a/drivers/gpu/drm/msm/msm_debugfs.c
> > > +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> > > @@ -47,12 +47,8 @@ static int msm_gpu_release(struct inode *inode, struct file *file)
> > >  	struct msm_gpu_show_priv *show_priv = m->private;
> > >  	struct msm_drm_private *priv = show_priv->dev->dev_private;
> > >  	struct msm_gpu *gpu = priv->gpu;
> > > -	int ret;
> > > -
> > > -	ret = mutex_lock_interruptible(&show_priv->dev->struct_mutex);
> > > -	if (ret)
> > > -		return ret;
> > >  
> > > +	mutex_lock(&show_priv->dev->struct_mutex);
> > >  	gpu->funcs->gpu_state_put(show_priv->state);
> > >  	mutex_unlock(&show_priv->dev->struct_mutex);

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
