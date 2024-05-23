Return-Path: <linux-media+bounces-11830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1C08CD988
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 19:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E53BB21BA1
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 17:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBE87F496;
	Thu, 23 May 2024 17:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="tHHXyUBW"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F072628D;
	Thu, 23 May 2024 17:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716486961; cv=pass; b=aM+UWSdIS5WHtMhYpHMRIPkKpzr+8zqpMuNXJr3N0eR2mtXziWWorj1ekcNC7X+MoORN91IaUeRSupwfvl57d2XrcB9kqrCw/Hbyj3Ldbrt+iIA4Qx8YPtHoE2xEC9aK+/mfGuZWAH8X9TiUJc5TFFPRXR3r3Q3kleBEVQuLg5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716486961; c=relaxed/simple;
	bh=YplcTJCGw4DR3KGZcjn8t+aHGYhGtP1JeLsDIaFdpcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yta6Gm7UxAGNqZn9W4kFo+P+ENzD0t+bix8s/exf6s42s0iLJMGMrbEfWLb23J0J+NvZmk7mwnYf7eAt1dT1soHVnIiktLqEubF6L8YKiNkMDZE4RgYoGoH0CB2ddiPS+wfA1SaPHVxnD+8OZUV0H5TKiwnwesutUivJUmP7RbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=tHHXyUBW; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VlbST6t1QzyQq;
	Thu, 23 May 2024 20:55:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1716486954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+c+GW5pHAqfA3tI7UbjkwKBlWYbEbBo4+2ZrQFNWYpA=;
	b=tHHXyUBWWZYsbxON0Lshg0XE/aAmbKuxTYIGl0+Q77h98OidReu+KOEPtodqeIORrsfPVs
	6r01HJoZhxiFuWv/Z+GxgGyMQ+A4mRqg7zf/xswKaudLgZLxbCC8Ae1b7+J58HWL2ruMKh
	gY3jAVBqCGt2vo+YpNf/Rtq/tLwyiL0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1716486954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+c+GW5pHAqfA3tI7UbjkwKBlWYbEbBo4+2ZrQFNWYpA=;
	b=aJYJ8RJ7vYnJrN+dJrZLn3Ycdk2ImUmwGlkFpMGCoKon8rHkvsbpopXp6sBTxw5UbievJb
	2bxMVuU2/1KCK3r030Syfoj/jXKHChJ58bESMtL9k618fygB3Cr0xU2dCF/l++lvFTrgrF
	Rloi9zzqrzR/xAtlLHHEgxFvU2LdBfo=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1716486954; a=rsa-sha256; cv=none;
	b=Sa/lC5WRNWk7E70LBg7VjhjUG5d/QM46yDFymKlyoB7XWse5P8Ewru30GxEHCTpZifw+Yc
	eZIS6ui/nSYdjCeTN/A7aZnYFscdr0CSKFTA2rBGFe087QXkSve1slEBxbR9u+9Mx3gcY4
	k2+/Q/3GS6a/4hmmSo76YnVTfYLeToc=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5C182634C94;
	Thu, 23 May 2024 20:53:14 +0300 (EEST)
Date: Thu, 23 May 2024 17:53:13 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 3/5] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <Zk-CiRmQ5QRIyTgR@valkosipuli.retiisi.eu>
References: <20240418090825.624747-1-dan.scally@ideasonboard.com>
 <20240418090825.624747-4-dan.scally@ideasonboard.com>
 <Zk74ZZqn568-Wa3M@valkosipuli.retiisi.eu>
 <20996978-aace-4d59-92b8-39041da2ebd3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20996978-aace-4d59-92b8-39041da2ebd3@ideasonboard.com>

Hi Dan,

On Thu, May 23, 2024 at 02:44:06PM +0100, Dan Scally wrote:
> Hi Sakari - thanks for the review. Snipping some bits for which I have no comment...
> 
> On 23/05/2024 09:03, Sakari Ailus wrote:
> 
> <snip>
> > > +
> > > +static unsigned int mali_c55_calculate_bank_num(struct mali_c55 *mali_c55,
> > > +						unsigned int crop,
> > > +						unsigned int scale)
> > > +{
> > > +	unsigned int tmp;
> > > +	unsigned int i;
> > > +
> > > +	tmp = (scale * 1000) / crop;
> > This looks like something that can overflow. Can it?
> 
> 
> Shouldn't be able to; maximum scale width is 8192.

Ok.

1000U in that case?

> > > +	for (i = 0; i < MALI_C55_RESIZER_COEFS_NUM_BANKS; i++) {
> > > +		for (j = 0; j < MALI_C55_RESIZER_COEFS_NUM_ENTRIES; j++) {
> > > +			mali_c55_write(mali_c55, haddr,
> > > +				mali_c55_scaler_h_filter_coefficients[i][j]);
> > > +			mali_c55_write(mali_c55, vaddr,
> > > +				mali_c55_scaler_v_filter_coefficients[i][j]);
> > > +
> > > +			haddr += 4;
> > > +			vaddr += 4;
> > sizeof(u32) ?
> > 
> > Up to you.
> 
> 
> I think I'll keep it if it's all the same to you

Well, not the same but I'll let you decide. :-)

...

> > > +static int mali_c55_tpg_init_state(struct v4l2_subdev *sd,
> > > +				   struct v4l2_subdev_state *sd_state)
> > > +{
> > > +	struct v4l2_mbus_framefmt *fmt;
> > > +
> > > +	fmt = v4l2_subdev_state_get_format(sd_state, MALI_C55_TPG_SRC_PAD);
> > Can be assigned in the declaration.
> 
> 
> How would you make it fit that way?

	struct v4l2_mbus_framefmt *fmt =
		v4l2_subdev_state_get_format(sd_state, MALI_C55_TPG_SRC_PAD);

-- 
Regards,

Sakari Ailus

