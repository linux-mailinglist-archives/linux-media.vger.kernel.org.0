Return-Path: <linux-media+bounces-16699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4864695DE57
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 16:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F10FB21BF6
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 14:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28D51714CD;
	Sat, 24 Aug 2024 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="PWrdHwLS"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E09156F42
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 14:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724509715; cv=pass; b=IlhNvxB/9DttnJAw821EIyKTvHHcVXWMXm20KIzKonEwaxyUE07ymIehGefoYOyDwZuOIj5FrNCLiePETkhNs6NbbKN0HeyUigGz4/or9/b0t27i/eLvu1NaVU0rEOgmDxo/xMc07VnAE8ZRoo9BL8+x+MtmyM7qNfWo1Ttw8Tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724509715; c=relaxed/simple;
	bh=vjQPS/UXhJGa5ohcDyauUw1BqhScHrQPTTaKXRVljnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eoz7p+cQ6+fJzLvBd2HzA4cJB6UA2DtjyLAZX2R4t9xzd/oHjjYHpvqL6ix9tPO1FfMI/U3FRV9MtE2Hny9IZXD2Cla6Qb6NZcedJ3NriJ/Es48jq0Eq5mjK8LwvuMHQiI1bKnQfjDBEKLhqWd5i56mRfPPtyEQsCV1WyOwLoYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=PWrdHwLS; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WrfS70jtvz49Q3M
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 17:28:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1724509703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Azq7Q1iR7FwxN280k6lsqMROHbF62XfNByShKgh0kxw=;
	b=PWrdHwLSDRuABKow8GjH7tkLH1Pdwe9ZCr+SlbmFDcJ4NxXoShd0BZEfAttlHWzqCkdXYz
	8s6WEE+puw/hNqiXsyixxLbQryPcBei1GZNyMJ5MMr2GkEf4Nu+utIj0JOP0l9xE4VnWdJ
	4Wgy4upz2WcCGLv4CQUZhThhuaxjHuOhHy26EA1sySA1hOQy81Z3WHyOoa5gThV1wTc7Z3
	Y0375uEg13oN/XQX2m4ZY9J8SBYv3j3YAuKWfuVjl8QQCPIPWfZvFQmEu2zQV8ydvmnqyi
	1rAgCOgRKI6vKtEHj2AT+5WrEtfwG6xmdH9KqksmMBabXAGPBp3JJStGlOVHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1724509703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Azq7Q1iR7FwxN280k6lsqMROHbF62XfNByShKgh0kxw=;
	b=Nxb7pzZpFTORUyDwxRpTenRCRNt8+KuEx1wI+Zt2bREvEdDvPeqhJ1gqwxYCtk9S1EhO+r
	0plAQRaqfj/gNsBBhYZkGX3qi5kWybJPM7wXuCAIhLDP7TLdjgMuOHDt1CIqbwO1XnECNX
	cZlofysXQo5PYLp3PKGBGI9+4ksx4lVwPE6uTG5Y0xOaDoDN++Vw6Iy6pLa0LyMXOvuDYf
	efpy1VOZe0GMLz8SIT6N3Jya1U2cV+zNRU1EbnVCwoM9+OSOi9eydbtonvLQOLYsSC+jMD
	Ksq2HszC+k4Zz2+21uoc3ZLV2iV9cjlU6wsaDY78YHwVBREltJWWZA/efMjWmQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1724509703; a=rsa-sha256;
	cv=none;
	b=iHLAGYKeQ0tQqeReCs0NLSvssPoqB5G37u+uC1xN+RQa/CttkwqUhUQzmRKCb5PEqj0mCp
	mXeEmm9EKrP2r5Jht+fczfNuKIIb9lcKFF6EdISEGqHnlnWFDe+FEhvbmHHKEMFODIH4vC
	KDA/0ipM8fmhZEgBmttNGBDq91Fa3rh6/Wo6c21nJMgdyASChHBoTuKWIIY9yoqCvUd2AU
	duH1ymcVYQHKoq9tK7mubnQ3mvgfbAqKeS1jAe69GGu2aIUmwc6Xts9ymH+5KwPTwEhFdA
	TjjaYrEtWSo1pPIeXIKQ7ZJWRJY7AM3XHRqrDOSDx5Y1C/G0/rnUodmRGsS8Tg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 93E84634C93;
	Sat, 24 Aug 2024 17:28:22 +0300 (EEST)
Date: Sat, 24 Aug 2024 14:28:22 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-mc: Mark v4l2_pipeline_link_notify() as
 deprecated
Message-ID: <ZsnuBtFIiEb316cf@valkosipuli.retiisi.eu>
References: <20240822214125.3161-1-laurent.pinchart+renesas@ideasonboard.com>
 <Zsg3WojLqfNprMIp@valkosipuli.retiisi.eu>
 <20240823135728.GL26098@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823135728.GL26098@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Aug 23, 2024 at 04:57:28PM +0300, Laurent Pinchart wrote:
> On Fri, Aug 23, 2024 at 07:16:42AM +0000, Sakari Ailus wrote:
> > On Fri, Aug 23, 2024 at 12:41:25AM +0300, Laurent Pinchart wrote:
> > > Commit b97213a41140 ("media: v4l2-mc: Make v4l2_pipeline_pm_{get,put}
> > > deprecated") marked the v4l2_pipeline_pm_get() and
> > > v4l2_pipeline_pm_put() functions as deprecated, but forgot to address
> > > the related v4l2_pipeline_link_notify() function similarly. Fix it.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > How about adding a warning for the use of these functions? Possibly on
> > debug level if pr_warn_once() is considered too drastic?
> 
> I think we need to do a bit of homework first, as there's a large number
> of drivers using these, directly or indirectly. We should at least
> convert the sensor drivers still using .s_power() to runtime PM, to make
> it possible to convert the other drivers.

With that, we could just drop the implementation of the pipeline PM stuff
and replace it with a warning.

I think a pr_debug_once() would still be appropriate, at least. People
generally won't read the documentation unless something is broken.

> 
> > > ---
> > >  include/media/v4l2-mc.h | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
> > > index ed0a44b6eada..1837c9fd78cf 100644
> > > --- a/include/media/v4l2-mc.h
> > > +++ b/include/media/v4l2-mc.h
> > > @@ -178,6 +178,9 @@ void v4l2_pipeline_pm_put(struct media_entity *entity);
> > >   * @flags: New link flags that will be applied
> > >   * @notification: The link's state change notification type (MEDIA_DEV_NOTIFY_*)
> > >   *
> > > + * THIS FUNCTION IS DEPRECATED. DO NOT USE IN NEW DRIVERS. USE RUNTIME PM
> > > + * ON SUB-DEVICE DRIVERS INSTEAD.
> > > + *
> > >   * React to link management on powered pipelines by updating the use count of
> > >   * all entities in the source and sink sides of the link. Entities are powered
> > >   * on or off accordingly. The use of this function should be paired
> > > 
> > > base-commit: a043ea54bbb975ca9239c69fd17f430488d33522

-- 
Kind regards,

Sakari Ailus

