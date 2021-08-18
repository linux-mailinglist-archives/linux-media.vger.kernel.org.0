Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E033F012E
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 12:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234212AbhHRKEv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 06:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234294AbhHRKEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 06:04:48 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53952C061764
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 03:04:10 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id i22so2222336edq.11
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=aMU29SN6YoovEcOrsusWnZbE8h+1MpQpJA0/wZfLGeE=;
        b=VuWlpnTGk6pLgRyLxLDnxv4NkP9nRhdxy0N90/5pUe8bPs6Uj9DlrqMj6WsvKlpXXI
         111QEnOZPfJS/mHK8sfTzq5rrN40iXdDm7HI7rmq/xmBL8FDwz+BFyPzr5yB3ovwv8zV
         0GGNgLYV0nqj01x2rcDXp61Hl2zl/sKi6V54I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=aMU29SN6YoovEcOrsusWnZbE8h+1MpQpJA0/wZfLGeE=;
        b=CvLZ125/aYAsDwscB6sNvNZ3RR/IVMS/+wigWVyv2uDWQcKz1j5viIYhM40mA0Zjq7
         lpbBxmdB3T1HLQKKmyaT6mjgdlvfZ3VAyOvde3ZPUrINrmHCvYzHIC/4XFdFrvJz3Ei8
         ddFQXUXO/kgl+DIppn1IKqXSuM5c5Cteg6ythjo6HSsG30urICi2PO2uN5RpYFHCLRdF
         TqsTrTQxuvUltCF7y6FAhMONsHnOU4atXSFeQ1zd8QNacVVS+m3R5KPOBPK84FU2BF4+
         7QqjLk0oSFAyyMm1xxZbAC9Gfevo/eH/rEUiif1f8NLCyIxkavL1iUfk2K60pFOC+sD4
         dRwQ==
X-Gm-Message-State: AOAM530+HXSgOOHXGs15IdCoI2nbNuSXxBAGKpfqtfYUa8PRs3/jmY6X
        IuKzYmkRKPqcnWsdUO0rCqcEbw==
X-Google-Smtp-Source: ABdhPJzQXPwY+sWxgn3k6s9LT4/gWaw0MMn3Os6faeWcHmmeyRNaM7zRWGLx0tEfvU1T3JleVgbcdA==
X-Received: by 2002:a05:6402:14d9:: with SMTP id f25mr9279034edx.343.1629281048926;
        Wed, 18 Aug 2021 03:04:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id d16sm2384140edu.8.2021.08.18.03.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 03:04:08 -0700 (PDT)
Date:   Wed, 18 Aug 2021 12:04:06 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com, axboe@kernel.dk,
        oleg@redhat.com, tglx@linutronix.de, dvyukov@google.com,
        walter-zh.wu@mediatek.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v3 3/9] drm: check for null master in
 drm_is_current_master_locked
Message-ID: <YRzbFnkricE65Hn5@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
        christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
        tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-4-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818073824.1560124-4-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 18, 2021 at 03:38:18PM +0800, Desmond Cheong Zhi Xi wrote:
> There is a window after calling drm_master_release, and before a file
> is freed, where drm_file can have is_master set to true, but both the
> drm_file and drm_device have no master.
> 
> This could result in wrongly approving permissions in
> drm_is_current_master_locked. Add a check that fpriv->master is
> non-NULl to guard against this scenario.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

This should be impossible, drm_master_release is only called when the
struct file is released, which means all ioctls and anything else have
finished (they hold a temporary reference).

fpriv->master can change (if the drm_file becomes newly minted master and
wasnt one before through the setmaster ioctl), but it cannot become NULL
before it's completely gone from the system.
-Daniel


> ---
>  drivers/gpu/drm/drm_auth.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 8c0e0dba1611..f9267b21556e 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -66,7 +66,8 @@ static bool drm_is_current_master_locked(struct drm_file *fpriv)
>  	lockdep_assert_once(lockdep_is_held(&fpriv->minor->dev->master_lookup_lock) ||
>  			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
>  
> -	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> +	return (fpriv->is_master && fpriv->master &&
> +		drm_lease_owner(fpriv->master) == fpriv->minor->dev->master);
>  }
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
