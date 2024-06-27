Return-Path: <linux-media+bounces-14271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CA891AD43
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 18:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 759A91F26FBD
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 16:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20565199E95;
	Thu, 27 Jun 2024 16:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="ZtTkrgkV"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73B1993B2
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 16:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719507328; cv=pass; b=jtJdBpv1F0gjV/ppPJ3k4ELW2SPd0gi22LgVX8sM25czMcWnPsRhpTPrzpsfjDvjYYf4XD0gHpY5ZAaBX2bCZdEwTO5onIn3F+XyMfH32dEu9AcWGsDks6HRRaSAJv3h9XbB21nmuV2DUd8ujYuXqGubeBWaqbjxb2bOAlu6c20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719507328; c=relaxed/simple;
	bh=i60UbsMp3DSIadLqVlaCAlOAn/+coVgxz+85Fg7I6cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYQ5WS1n/yWoP/d8Wu7dXB45YqL2sFs6B7BuuAuoV1TN4bntwEWa21/1QDlHtjCIbalt9UuoP7cEl4UgdrmHvzE+JFCwVlWMDBffLWRhxSHUan10rHH4d1qPMDg8YoaOdm1LsiY7wUiPwH/XfN1UQrdbdp0eRmiKi9I79KcJt0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=ZtTkrgkV; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4W94SV281Tz49Pv3;
	Thu, 27 Jun 2024 19:55:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1719507322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ca1bA8U00z3U5QC7O4eh17iXlcF48UbTnkqsR7FfDDE=;
	b=ZtTkrgkVHPKzR4UR5dnLkBT1q+0e59fxLakWtL9m75p7losSHLYISywniBmj40bScmaHXq
	9ApBxvbaCxm6vy7lCsCWOnEGPRyrLUqlkThiFxOCXHmK6MVtklqdMWTyclOuyj4ezmaIZY
	3v0lU/9lEvZcb9I+rc//OZ/X43KPqGy59sgfUL0PyeKPIxjoc+IA5oNiZwY0HdDbcI92Qq
	J5n0RZIhsNineZoxgnc1nJcApqA2VqJ2OBDyOe5lNRUcdQsDb/VgMKMclbaQ38f0mogor2
	iP1JfXchF/YXkMTDFuP4PTAGqc0W9d5EFEviG9yq1n/MNrwRQXGT3l4KMFAu8A==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1719507322; a=rsa-sha256;
	cv=none;
	b=lInnmzTsVUssZFFxI4f9GLBf+JLu++/LmV9/+SeO96igDbVLkSieOgMgp9Qk+AoFKrU7sG
	pzlK+1tKY5WSxLm0l0ALOp1mUBIac7p2d2CBi7p7bGp125Ns/B23KrAaxlGrWWG7JVRlbj
	9Bzzs5UgH6sZvNKG89L3S3DcKCwSkEKpEgfgRYkIiqPFYgv/YxfhrACcf4759xuCHUSb4g
	mVlRe2lN8Okpqzj60lZ29y7rKPd+//BXrWyPwszJ1btG48egXmNuFtTCiJFGdiAqpaRLS8
	TwI9FlPmRXVsZr2QxkjpcE1O5Pq7ED6C330UlyA1yJBBDjiRC8PqDlnh6hK5Bw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1719507322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ca1bA8U00z3U5QC7O4eh17iXlcF48UbTnkqsR7FfDDE=;
	b=fxWEfI+QedKMiVCDrtXlhdxUXVMfj3Lgxi/8GXy2P3NqbRPZFaL9p+vYNCawG1dwFLewRw
	jneQsWa6WcA+jPuxl36L3tDS6L3PvCwMVSDmHg42NsXDjhc/4SQX4WY2Yt5hi/dbk3rNaQ
	J9OVU4rY0gi7YM3yahehxWVOX1iqcSoBx/qSnEZQdTXe6cmaQVZA3Yfa6/XC8UUW15s/OK
	wpwD4BeL2KZ3yq3ZUX88Hd5GlQoNduQ1UdBfQtyCcebN+IXQLGVDRSnc3whupUwXufwcr1
	kjOEJI76BzmpQEhxeBoVCYUBXJQGbA+1oeBuxknA/CnnGqogigw8bBldDptOuQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2599D634C93;
	Thu, 27 Jun 2024 19:55:21 +0300 (EEST)
Date: Thu, 27 Jun 2024 16:55:20 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 1/2] media: uapi: pisp_be_config: Drop BIT() from uAPI
Message-ID: <Zn2ZeBYlfRnL3Lc1@valkosipuli.retiisi.eu>
References: <20240627143059.300796-1-jacopo.mondi@ideasonboard.com>
 <20240627143059.300796-2-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627143059.300796-2-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

On Thu, Jun 27, 2024 at 04:30:56PM +0200, Jacopo Mondi wrote:
> The pisp_be_config.h uAPI header file contains a bit-field definition
> that uses the BIT() helper macro.
> 
> As the BIT() identifier is not defined in userspace, drop it from the
> uAPI header.
> 
> Fixes: c6c49bac8770 ("media: uapi: Add Raspberry Pi PiSP Back End uAPI")
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  include/uapi/linux/media/raspberrypi/pisp_be_config.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> index 1684ae068d4f..18e313613a50 100644
> --- a/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> +++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> @@ -146,7 +146,7 @@ struct pisp_be_dpc_config {
>   */
>  struct pisp_be_geq_config {
>  	__u16 offset;
> -#define PISP_BE_GEQ_SHARPER BIT(15)
> +#define PISP_BE_GEQ_SHARPER (1 << 15)

s/1/1U/

It's a good practice even if you're not dealing with the MSB.

>  #define PISP_BE_GEQ_SLOPE ((1 << 10) - 1)
>  	/* top bit is the "sharper" flag, slope value is bottom 10 bits */
>  	__u16 slope_sharper;

-- 
Kind regards,

Sakari Ailus

