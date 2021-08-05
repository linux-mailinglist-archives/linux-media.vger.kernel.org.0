Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DF73E1224
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 12:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240316AbhHEKIs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 06:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240284AbhHEKIr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 06:08:47 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F224DC0613C1
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 03:08:32 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id x14so7518242edr.12
        for <linux-media@vger.kernel.org>; Thu, 05 Aug 2021 03:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=k6wqR5Bdo/hf86YR+lFfIEge3bTc/2js1IYHLxrLWkI=;
        b=gkUdbiWszms/iCP7GRNJEKiA9CoyKB3GuGPnTB/iOuh/XcRtGT3ITC1QjwvnNRI3ny
         6yFoK1cP3Lzdf7MusUBiAPJDuecdEFRCrXhpUB2v2MKhjdlC4uzptD/84LAgqoH5Ppw/
         MzTV2RNZFpMDF6aU1LC9leQ2AHLdrputXIk9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=k6wqR5Bdo/hf86YR+lFfIEge3bTc/2js1IYHLxrLWkI=;
        b=HTpQEcL4jKyBTAi2FFSkG9Q9KNgXQDyzSYJGw2XR//CVuTTUcUQ4Dr19xoin6B0ZGB
         Bcu91eQH5hnEARFvIL4U3KyFHO73foQIm+Jp68v+YTcJfDunmsxCL9KX6BM1NAjfdspD
         OwMi1iTscII1knOl5zFaLyECmtQXagGIG/TOTxC8RcKtChwa2NCx9YSo3ncq1EZtoqp4
         ddVJIHBqZXBzFIqlL+4Ef1EQ4FrYHyopfgZKdR2mv2FDHJxR1v1F/BnAN19xTl8pZFCZ
         n6raJmQE4eGfxT6I0rfnqpmu0r/yna6858CX2uZoe9B45/zAaLH7ZO3Pq4sPMyYM6EdK
         iPmQ==
X-Gm-Message-State: AOAM530uIa646MLVOKatQrjIn3ViqNPuUhIB487Jc6bRLIIKnZ8e7XIT
        heNDXgC6i3SL817Ys/Hq3caSEw==
X-Google-Smtp-Source: ABdhPJzJzNr2yGRkeakCzfK1k4PTnOjG5zboYz+WBO25moyiJhKeEGmc8cFnax2qMfHn/lgN8Q1BvQ==
X-Received: by 2002:a05:6402:40c4:: with SMTP id z4mr5435513edb.120.1628158111607;
        Thu, 05 Aug 2021 03:08:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p23sm1550407ejc.19.2021.08.05.03.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 03:08:31 -0700 (PDT)
Date:   Thu, 5 Aug 2021 12:08:29 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        peterz@infradead.org, mingo@redhat.com, will@kernel.org,
        longman@redhat.com, boqun.feng@gmail.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [RESEND PATCH v2 2/2] drm: add lockdep assert to
 drm_is_current_master_locked
Message-ID: <YQu4nfxtxyTCVGhn@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, peterz@infradead.org,
        mingo@redhat.com, will@kernel.org, longman@redhat.com,
        boqun.feng@gmail.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20210802105957.77692-1-desmondcheongzx@gmail.com>
 <20210802105957.77692-3-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802105957.77692-3-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 02, 2021 at 06:59:57PM +0800, Desmond Cheong Zhi Xi wrote:
> In drm_is_current_master_locked, accessing drm_file.master should be
> protected by either drm_file.master_lookup_lock or
> drm_device.master_mutex. This was previously awkward to assert with
> lockdep.
> 
> Following patch ("locking/lockdep: Provide lockdep_assert{,_once}()
> helpers"), this assertion is now convenient. So we add in the
> assertion and explain this lock design in the kerneldoc.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> Acked-by: Boqun Feng <boqun.feng@gmail.com>
> Acked-by: Waiman Long <longman@redhat.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Both patches pushed to drm-misc-next, thanks.
-Daniel

> ---
>  drivers/gpu/drm/drm_auth.c | 6 +++---
>  include/drm/drm_file.h     | 4 ++++
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 9c24b8cc8e36..6f4d7ff23c80 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -63,9 +63,9 @@
>  
>  static bool drm_is_current_master_locked(struct drm_file *fpriv)
>  {
> -	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
> -	 * should be held here.
> -	 */
> +	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
> +			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
> +
>  	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
>  }
>  
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 726cfe0ff5f5..a3acb7ac3550 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -233,6 +233,10 @@ struct drm_file {
>  	 * this only matches &drm_device.master if the master is the currently
>  	 * active one.
>  	 *
> +	 * To update @master, both &drm_device.master_mutex and
> +	 * @master_lookup_lock need to be held, therefore holding either of
> +	 * them is safe and enough for the read side.
> +	 *
>  	 * When dereferencing this pointer, either hold struct
>  	 * &drm_device.master_mutex for the duration of the pointer's use, or
>  	 * use drm_file_get_master() if struct &drm_device.master_mutex is not
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
