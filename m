Return-Path: <linux-media+bounces-18411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C4997D1D2
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 09:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 746ABB226B5
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 07:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CE94D8D0;
	Fri, 20 Sep 2024 07:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="HnEA3LwA"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C634D9FB
	for <linux-media@vger.kernel.org>; Fri, 20 Sep 2024 07:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726817804; cv=pass; b=FUUfQLQhS4IHXrOGLgH4K8YgBl0Bcn0BpfbPOCj+Fhn98FVhuasYPMVoQWbJzPsRAiBc2NgAseNfPp5+O36TIuD+AU1rZva5xKsraCzyk7ADV8YNwT/s81GvkvXYRUuvO3gHs9OWNjHuQbhAa91u+FAB7aA5jB/U/UO7gm0XUWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726817804; c=relaxed/simple;
	bh=mvbxh5AvWKpyL6qOprKhSRalLQkB/FYJVh32enZBfZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5lcBz0eN7AnjFQCIqYSRjfWQeP40/A47A2Eu0oxGIzDtJSnNgebucXJhPp/S67EFyotGJmhPHi9HjP3bbQcXwKjGr2QqQW6yItkeJKjI/oVaQaHMer/9UfwcM8Xmdt6Au0D41y+XFtiubkYZSmBH1NpCNAOUWX491jBRUOqux0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=HnEA3LwA; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4X942Z0wpxz49Q3Y;
	Fri, 20 Sep 2024 10:36:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1726817798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ml7Mt8t/89WM6o0ma1Je54LdyMIVwCVpisDtUMJhLtg=;
	b=HnEA3LwA+GAAWCP+9DUp3I1J62NGXBkeSH/Cxn9mW7wg7srgCQxZA0PwBS9R48BR/p6s6t
	PBPGS+Bnn2F5wIhXgssVMUuIiarPbNU+bv/vYS2F2csTaMmbRnKh6AOKeUCecW/wY5MTns
	4sJU1RyEGGOtZWet5CExhhj0zKF9ZM13yIa1miGVxd4z49Oe7bhAD5nRObzLh1vKrJdcrI
	1wU8xLhULHlHLQ6N+alzh/mfomDE+H0zCFRuWoYuiRmVyoMmK6MPy7c64u+wtaT3pYF1Hg
	BnR4bdekGtdjzeurdS6ybIHbrAfhc2SWplfGlwzQ+s4UEIHdp+axKUdlG9W6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1726817798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ml7Mt8t/89WM6o0ma1Je54LdyMIVwCVpisDtUMJhLtg=;
	b=rIvUGzAeJW1cXpfak9fBK5PmYDbdUb9ao4xDuuYmK3xpXbSvMbyfsqF+CGVlB6/AVrtSmr
	3i4UamVepqv+3bzgNzRTaWiZR9J02o0StxvIhyBzBDuiKP/O6Lok7sHXLt9TWSxRYBS5pZ
	mkR6TZBioKA0Tkgt6WpxOIXe8ut2HZWdOK5QluCyFlN/fb39fdzgFdi731+IwHmoTdJQrd
	aECcL2vH8gE9xvOBDRCQ4YogEng7l0AK+OV5NJl0tMd9mtxRws4d5nMTT4H74sE4ZrAZKJ
	7/RCK1nO9h+5mYBBt6yVpI6y5iO6QrTG+nwPOIyeNZhR1s3hNcnrHeTRkgFKgw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1726817798; a=rsa-sha256;
	cv=none;
	b=YKxWmKuUxnuEq4WFySgly59Di2RiNAEsULW/DURjlvI4MrjSXlSHPE2YRg572HCdNqT/6v
	ZhhTj9y+85QbqO11K0GaWICXx1rxHHDYdPmAm844Dv9lmq/ezSNmXObgkGFfvx4gP3Z8J+
	WSB5SHuriZtoq3WNQ0eTP49SnuJwtfdJEtXOx2yniRlTROjqKEl37jUfk7cyaFfCGOVDK3
	0jmmdvhpOb5x+sOV9LnVpuKEH584IcLc5pegEC4/RwP2JZZpRAbg7YqPh5aHJSsrTYvWAQ
	Q2xn1stML9pVuZ0vCLc3i25465cUG22VG3PuwncPzzjihA/LeI5HbZ7v+DMoqA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E7050634C96;
	Fri, 20 Sep 2024 10:36:37 +0300 (EEST)
Date: Fri, 20 Sep 2024 07:36:37 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 0/3] Update streaming related documentation
Message-ID: <Zu0mBZLfSCNcTJFv@valkosipuli.retiisi.eu>
References: <20240917150254.17639-1-sakari.ailus@linux.intel.com>
 <d5068889-ba2b-4397-9b7a-3e1bf05d55d3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5068889-ba2b-4397-9b7a-3e1bf05d55d3@ideasonboard.com>

Huomenta,

On Tue, Sep 17, 2024 at 08:40:28PM +0300, Tomi Valkeinen wrote:
> On 17/09/2024 18:02, Sakari Ailus wrote:
> > Hi folks,
> > 
> > This set updates streaming starting and stopping related documentation.
> > 
> > since v1:
> > 
> > - Document the use of v4l2_subdev_{en,dis}able_streams() and setting the
> >    streams_mask for drivers that do not support streams.
> > 
> > Sakari Ailus (3):
> >    media: Documentation: Deprecate s_stream video op, update docs
> >    media: Documentation: Update {enable,disable}_streams documentation
> >    media: Documentation: Improve v4l2_subdev_{en,dis}able_streams
> >      documentation
> > 
> >   .../driver-api/media/camera-sensor.rst          |  8 ++++----
> >   Documentation/driver-api/media/tx-rx.rst        | 13 ++++++++-----
> >   include/media/v4l2-subdev.h                     | 17 +++++++++++++++--
> >   3 files changed, 27 insertions(+), 11 deletions(-)
> > 
> 
> Still missing addressing 20240917145735.GE17350@pendragon.ideasonboard.com
> comments, but with those fixed:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks! I'll add these while applying / v4 if needed.

-- 
Terveisin,

Sakari Ailus

