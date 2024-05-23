Return-Path: <linux-media+bounces-11836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A12F8CDBAF
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 23:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F06A11F238A1
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 21:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1053127B77;
	Thu, 23 May 2024 21:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Q+wAFNkU"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7816C127B62;
	Thu, 23 May 2024 21:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716498035; cv=pass; b=XNvPfJL+SkPkGM/AVzTkTqe9fjub89r0Fhccijvy3r3GOjbMDpQQ8sohlrS6icsuODN1T1LKghdrZhhJG23Sm4M+SVLPIynLyoT1Yn7D9e82mmEPcBeOFXav4BT1HlSqUbQODZ9muC+0tiYs7+i+KwkdDODFoV7+isqyQ9gnIZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716498035; c=relaxed/simple;
	bh=TmU8uZAyuPf/d3olY2eGrT/SIjJ0i/0PWwEUduLUpDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzhFaIZ5msmKp+wkCVFG68VtiqNnYcNYmDb0WucP1VuJq4XdFVLWtS5xvRcojaJDleKTP2SUb67EZjiwqLVykYzaaH+Nc5hGeecp9NXjxQBdVFPlMUjMA0otWqUb2nzBJY5gxOyKaKg1cMARnUSzHVnRRSKbG7cXBd8U+FPQ4jY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Q+wAFNkU; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VlgYS3nFtz49Pyk;
	Fri, 24 May 2024 00:00:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1716498029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7cSdFH4YWDFeRqlJCHrqk1NjohC0F1hTAl5N2kO2BzM=;
	b=Q+wAFNkUpEcIgzOYM9IAI9EaQtsRe2NacYFkOG+Cfbu+VugMz1vmHh9LgYtU/RjmVU3Qf3
	KrUIqSfBitWN+ZSWzOhBm0q9inv+36Kwq2JxMyEEA5BKfcHqhXJsGMcL46FVaKAaMIhAYj
	xkMkCIGdnEIpq5eSPJHvKnU6+z3QJ/6gNicIUuGu0AdS4qJy//ja/EJz+X9iALZKIVR4s9
	qtNwseTMGt8QLA/rWUVjD10mhVxJ+QUYDaNtheeepov3a+0ql2ydAahpTT3uw2JCNReevS
	02tB7e8JON+5tNiojQLlYbpjdjSAngzM3Wj5bbaMmOioEfD6Nmu+DU8cveAP3g==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1716498029; a=rsa-sha256;
	cv=none;
	b=OP2sBA0KdLToLWhtHUedDbLNd8vNi4o1p0swlIlh4LdpVgAZW2Liot8txH/tFoXTFtT2Iz
	Av317GKYxGovsE+t/9uP6cNY1GOhb/o6Ru2oa13ZmQy1RsrvrKepP24R2VZaBMnGNBV1e7
	wjMHdS2KZ+ov1zaehY7IUyPM16PV6wgSLPNtI6yn+cggVfKspcg1Y+/q9UxNNdIHejiET6
	CmB8Ec6bOT572ZKCCwBLVmcL4a4Nx2T43102gfBxs0B+Fo3Btx1w6h9aAxRPBUV+vfjrX6
	yHOQtG4yrLRhk+nXsg8Plh8NpledAbYu28RxhFLAep6HE3McGH/S462LEDsk2g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1716498029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7cSdFH4YWDFeRqlJCHrqk1NjohC0F1hTAl5N2kO2BzM=;
	b=aVdGZgmVYxt+JTbT5uOTgcoinSG34h1Fg92fr3gnfsCSV26OiJ34sP4wAmGunYzTk+SB0q
	fIwKU9yD3NaigTYpKL8n4NRBkDQlbMjU1SH3GwVr3n6gRnU7V6wrHbXZZHHk+fTTRDC+8Q
	XG9IvnZa73Znw21M8V5GC5h27VoVQw2QUccVuVSi0IKdg9OZHsLxUWCHwut7Cs1dnTyvPw
	Hk91c4gGkeF7qZCnRGIsp/prigDZ6EXlNbw7tW2VRAxkq3EAAc1wYveQ4gMav/6R+3L6xg
	tQ1OEI4K06s+JesyoN6Bug05dUmwvuSSFYhig8NQNc6RCH3CS2Fmh/pCf6JkCA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BA761634C94;
	Thu, 23 May 2024 23:57:47 +0300 (EEST)
Date: Thu, 23 May 2024 20:57:47 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 3/5] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <Zk-tyxjm-6R-66JO@valkosipuli.retiisi.eu>
References: <20240418090825.624747-1-dan.scally@ideasonboard.com>
 <20240418090825.624747-4-dan.scally@ideasonboard.com>
 <Zk74ZZqn568-Wa3M@valkosipuli.retiisi.eu>
 <4ea66114-37a4-413f-b672-43ec3d4631c6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ea66114-37a4-413f-b672-43ec3d4631c6@ideasonboard.com>

Hi Dan,

On Thu, May 23, 2024 at 03:27:36PM +0100, Dan Scally wrote:
> Hi Sakari - sorry, one part I missed...
> 
> On 23/05/2024 09:03, Sakari Ailus wrote:
> > > +
> > > +int mali_c55_isp_s_stream(struct mali_c55_isp *isp, int enable)
> > Have you considered {enable,disable}_streams? All new drivers should use
> > these instead of s_stream() now.
> 
> 
> Although named s_stream this is actually a purely internal function - it's
> not exposed as part of the subdev video ops. The resizer subdevices
> similarly don't expose an .s_stream() operation, they're simply started in
> the callpath of mali_c55_vb2_start_streaming(). I'll split the stop
> functionality into mali_c55_isp_stop_stream() and rename this
> mali_c55_isp_start_stream() to make that less confusing.

Ack. But this might require some rework, depending on based on what
streaming is actually started. I'm referring to the discussion elsewhere
in the same thread.

> 
> 
> The TPG subdevice on the other hand does expose an .s_stream() operation,
> since the intention was to model it exactly like a connected external
> subdevice. I can switch to the .enable_streams() operation there.

Sounds good.

> 
> > 
> > > +{
> > > +	struct mali_c55 *mali_c55 = isp->mali_c55;
> > > +	struct media_pad *source_pad;
> > > +	struct media_pad *sink_pad;
> > > +	int ret;
> > > +
> > > +	if (!enable) {
> > > +		if (isp->source)
> > > +			v4l2_subdev_call(isp->source, video, s_stream, false);

This call could be v4l2_subdev_disable_streams().

> > > +		isp->source = NULL;
> > > +
> > > +		mali_c55_isp_stop(mali_c55);
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	sink_pad = &isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO];
> > > +	source_pad = media_pad_remote_pad_unique(sink_pad);
> > > +	if (IS_ERR(source_pad)) {
> > > +		dev_err(mali_c55->dev, "Failed to get source for ISP\n");
> > > +		return PTR_ERR(source_pad);
> > > +	}
> > > +
> > > +	isp->source = media_entity_to_v4l2_subdev(source_pad->entity);
> > > +
> > > +	isp->frame_sequence = 0;
> > > +	ret = mali_c55_isp_start(mali_c55);
> > > +	if (ret) {
> > > +		dev_err(mali_c55->dev, "Failed to start ISP\n");
> > > +		isp->source = NULL;
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = v4l2_subdev_call(isp->source, video, s_stream, true);

And this could be v4l2_subdev_enable_streams() as well.

> > > +	if (ret) {
> > > +		dev_err(mali_c55->dev, "Failed to start ISP source\n");
> > > +		mali_c55_isp_stop(mali_c55);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +

-- 
Regards,

Sakari Ailus

