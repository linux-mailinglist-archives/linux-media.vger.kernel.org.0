Return-Path: <linux-media+bounces-30247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDF5A89F0C
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 15:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB1E77AC64B
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 13:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3622973DE;
	Tue, 15 Apr 2025 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="E2y9uiI4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1CA2DFA2F
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722659; cv=none; b=fYf5JNUgq6yZKvcS+KJkPOhI7JY7yTo2GI2Xk+tIyDJK4x1Dg2aRcrvi1vz9gdkiHMehOMMAYjMGKtrFz8PX6YVuEX/btKEzjVscmVuEjGx//+RWe+cpW0WHZxGP3GwElIld/vpdXGwmlDiMah/VGwUcmzqhXzT1+a9b+Z+ce5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722659; c=relaxed/simple;
	bh=1iCJd8uGedfuub423dWcueBlvn/GPiOLr0vx8tO47w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6bTWX+8R0/o1R9PJDlvB7BpmYdb8RvIYE9EbxdZvUWty2IQtMHOTmMTj7IT4XiE+4n35YznMI3iVR0gaMZFR74pl+38k8c2MqRh7VMsri1cqKLhuOq1Rt49B9sBJr32xzWcG3VjNPykUbw0WMY0DGRt4zH4ba5fZBuXfaDdGoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=E2y9uiI4; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso7171047f8f.0
        for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 06:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1744722656; x=1745327456; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BeBKJsxdsFRDlkMvWf+IkTqfIZxOxoG2HFQhP0mrG6A=;
        b=E2y9uiI4IpLWw1J4gtc+zrL/a4gunR5KT9NmCIZn4bXG+BsBXAsEuAwMafRgnbjdfx
         tPcFu0BENBwsLkOUqwsE2kQoVnXLjIMUHnaOPSytbrqW35CASGDfFm6fyyFlXnxnDW14
         gKnTGpnhHqwYP1GGWbiN3Oro4HVnelMow3bYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722656; x=1745327456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BeBKJsxdsFRDlkMvWf+IkTqfIZxOxoG2HFQhP0mrG6A=;
        b=cRh+UeVZ9RuD4PIFLTv+weLXzgO5N4136r+POFVAMBqlvmcSsZt3QhuCN4iG2oGjYL
         +gbZDN5KzxYNaILVtMoBPM6HHsGS5vNrJBvWfk1rjfhkrOuxcTEARDlf1gt4H9Q4aqpA
         i3aE7dFSbtGaivVveErU4xdHIVzdw1/PVR0PgwcAt3BGeF7LlFVdfVzdDwVcbt4Cz/Bp
         4OndCZRo2dnoNekEeavq8FMp/ICznY8HA3/hZoQfZKGH1Idn5xJYnM5UyIqoJlHz6N9K
         zAe8qpAu7XFCURVtwwPXJzU4EIEqn8nWwoi80bJxcuHeQDKwb7Q3n5phZUirtlrJw1g9
         oqFg==
X-Forwarded-Encrypted: i=1; AJvYcCWRqJfJ1MIpMZ/pWcbycUjxrX6VWti7CY0YOuPlQMsKi8kEC4fDLEdQyID+/QxaIuCJ8EO+B7TnW43Y6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIxQQZ8ieAWSxKL4M9HvLMoC4H+x4Hm3Zfj7ZG3nzvIQe+fxBI
	BWkfW9xRs4qiXp9q4hAeznf/0wOJvmO5L8UP82c4rv9wpV73oNeoeQZbMB1YWKo=
X-Gm-Gg: ASbGncujer50AjJjO4adMc8UEtH28jfcJc2BI9Amg+mnv6j+5IbP7PLyl6WclZkPBzK
	ouS1c/H81rr9KryfxDwfVYo2swR9L6BOWW087BCDWho9mk+fm+MB25SQnOPuu7fNXmBUiDlgjmv
	anHLqFI3tQiiQJqmDf3kvZWLhRTUpLToGeDOzGYrypvw1M2GVFkQT1OCKvlHOUmlNCuSg/6Areq
	TiXx0Xm7R5QyZYQDsVecjTDtmIvq7Qwp4GqJ6CpUahbFNY9xD40SAKpD4pHmxyDs2SLTire2EA8
	W4V0adgIi1fPXuFY135Lzdh+vyK76CdH+imKfrqM3HAc6c1RsBoM
X-Google-Smtp-Source: AGHT+IH8bfspMLulM47LnkzN+N5h/di9riH+6UFGuNsynasbDT1EWe+urvrobwPqUm2lk0qjV1vE+g==
X-Received: by 2002:a05:6000:4285:b0:39a:c80b:8288 with SMTP id ffacd0b85a97d-39ea5211c47mr12246486f8f.33.1744722655688;
        Tue, 15 Apr 2025 06:10:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96403dsm13920688f8f.4.2025.04.15.06.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:10:55 -0700 (PDT)
Date: Tue, 15 Apr 2025 15:10:53 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
	airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
	mripard@kernel.org, maarten.lankhorst@linux.intel.com,
	dri-devel@lists.freedesktop.org,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/gem: Internally test import_attach for imported
 objects
Message-ID: <Z_5a3ckZiY-fINNW@phenom.ffwll.local>
References: <20250415092057.63172-1-tzimmermann@suse.de>
 <e2e82102-eb9f-4eb6-8ac3-6122ed7fcf28@amd.com>
 <48ab9b82-0d26-4d7c-88b0-feab9762b128@suse.de>
 <b924ffa7-99c0-42f1-9170-069e92299021@amd.com>
 <ddb93e8d-7716-47b3-b06c-0bf862d9c32b@suse.de>
 <ac0aba3d-ec77-4f6b-9ac1-f6077519f30d@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac0aba3d-ec77-4f6b-9ac1-f6077519f30d@amd.com>
X-Operating-System: Linux phenom 6.12.17-amd64 

On Tue, Apr 15, 2025 at 02:52:54PM +0200, Christian König wrote:
> Am 15.04.25 um 14:40 schrieb Thomas Zimmermann:
> > Hi
> >
> > Am 15.04.25 um 14:19 schrieb Christian König:
> >> Am 15.04.25 um 12:45 schrieb Thomas Zimmermann:
> >>> Hi
> >>>
> >>> Am 15.04.25 um 11:39 schrieb Christian König:
> >>>> Am 15.04.25 um 11:20 schrieb Thomas Zimmermann:
> >>>>> Test struct drm_gem_object.import_attach to detect imported objects
> >>>>> during cleanup. At that point, the imported DMA buffer might have
> >>>>> already been released and the dma_buf field is NULL. The object's
> >>>>> free callback then does a cleanup as for native objects.
> >>>> I don't think that this is a good idea.
> >>>>
> >>>> The DMA-buf is separately reference counted through the import attachment.
> >>> I understand that it's not ideal, but testing for import_attach to be set is what we currently do throughout drivers. Putting this behind an interface is already a step forward.
> >>>
> >>>>> Happens for calls to drm_mode_destroy_dumb_ioctl() that eventually
> >>>>> clear the dma_buf field in drm_gem_object_exported_dma_buf_free().
> >>>> That is for exported DMA-buf and should *NEVER* be used for imported ones.
> >>> Did you look at the discussion at the Closes tag? Where else could dma-buf be cleared?
> >> Yeah, I've seen that. The solution is just completely wrong.
> >>
> >> See for the export case obj->dma_buf points to the exported DMA-buf and causes a circle dependency when not set to NULL when the last handle is released.
> >>
> >> But for the import case obj->dma_buf is actually not that relevant. Instead obj->import_attach->dma_buf should be used.
> >
> > So if I understand correctly, the tests in that helper should be done by looking at import_attach->dma_buf.
> 
> At least in theory yes. IIRC we also set obj->dma_buf to the same value
> as import_attach->dma_buf for convenient so that code doesn't need to
> check both.

Uh, given that we already have a confusion between in the importer and
exporter cases I think it'd be better to more strictly separate them than
to mix them up even more for convenience. We need more clarity here
instead.

> But it can be that obj->dma_buf is already NULL while the import
> attachment is still in the process of being cleaned up. So there are a
> couple of cases where we have to look at obj->import_attach->dma_buf.

Yeah this sounds better imo.

> > The long-term goal is to make import_attach optional because its setup requires a DMA-capable device.
> 
> HUI WHAT?
> 
> Dmitry and I put quite some effort into being able to create an import_attach without the requirement to have a DMA-capable device.
> 
> The last puzzle piece of that landed a month ago in the form of this patch here:
> 
> commit b72f66f22c0e39ae6684c43fead774c13db24e73
> Author: Christian König <christian.koenig@amd.com>
> Date:   Tue Feb 11 17:20:53 2025 +0100
> 
>     dma-buf: drop caching of sg_tables
>     
>     That was purely for the transition from static to dynamic dma-buf
>     handling and can be removed again now.
>     
>     Signed-off-by: Christian König <christian.koenig@amd.com>
>     Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>     Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20250211163109.12200-5-christian.koenig@amd.com
> 
> When you don't create an import attachment the exporter wouldn't know that his buffer is actually used which is usually a quite bad idea.

This is im entirely unrelated because ...

> This is for devices who only want to do a vmap of the buffer, isn't it?

... it's for the vmap only case, where you might not even have a struct
device. Or definitely not a reasonable one, like maybe a faux_bus device
or some device on a bus that really doesn't do dma (e.g. spi or i2c), and
where hence dma_buf_map_attachment is just something you never ever want
to do.

I think we might want to transform obj->import_attach into a union or
tagged pointer or something like that, which can cover both cases. And
maybe a drm_gem_bo_imported_dma_buf() helper that gives you the dma_buf no
matter what if it's imported, or NULL if it's allocated on that
drm_device?

Cheers, Sima

> 
> Regards,
> Christian.
> 
> >
> > Best regards
> > Thomas
> >
> >>
> >> Regards,
> >> Christian.
> >>
> >>> Best regards
> >>> Thomas
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
> >>>>> Reported-by: Andy Yan <andyshrk@163.com>
> >>>>> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
> >>>>> Tested-by: Andy Yan <andyshrk@163.com>
> >>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>> Cc: Anusha Srivatsa <asrivats@redhat.com>
> >>>>> Cc: Christian König <christian.koenig@amd.com>
> >>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>>> Cc: Maxime Ripard <mripard@kernel.org>
> >>>>> Cc: David Airlie <airlied@gmail.com>
> >>>>> Cc: Simona Vetter <simona@ffwll.ch>
> >>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>>>> Cc: "Christian König" <christian.koenig@amd.com>
> >>>>> Cc: dri-devel@lists.freedesktop.org
> >>>>> Cc: linux-media@vger.kernel.org
> >>>>> Cc: linaro-mm-sig@lists.linaro.org
> >>>>> ---
> >>>>>    include/drm/drm_gem.h | 8 +++++++-
> >>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> >>>>> index 9b71f7a9f3f8..f09b8afcf86d 100644
> >>>>> --- a/include/drm/drm_gem.h
> >>>>> +++ b/include/drm/drm_gem.h
> >>>>> @@ -589,7 +589,13 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
> >>>>>    static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
> >>>>>    {
> >>>>>        /* The dma-buf's priv field points to the original GEM object. */
> >>>>> -    return obj->dma_buf && (obj->dma_buf->priv != obj);
> >>>>> +    return (obj->dma_buf && (obj->dma_buf->priv != obj)) ||
> >>>>> +           /*
> >>>>> +        * TODO: During object release, the dma-buf might already
> >>>>> +        *       be gone. For now keep testing import_attach, but
> >>>>> +        *       this should be removed at some point.
> >>>>> +        */
> >>>>> +           obj->import_attach;
> >>>>>    }
> >>>>>      #ifdef CONFIG_LOCKDEP
> >
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

