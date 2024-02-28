Return-Path: <linux-media+bounces-6082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE1486B009
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 14:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50CB81F27779
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 13:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F5D14A4F9;
	Wed, 28 Feb 2024 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="C3C2aOoe"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C1C73508;
	Wed, 28 Feb 2024 13:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709125914; cv=pass; b=NmU/ifutosj03sqQ9T5c+vGFU2H6tWNVCx8yj/iW0AuTk0VBpz84dxqMYRo3Lriwm55Llfv01xVbPBMFzG3pdXMoxdTSJS10Q6J+JUCGACo3BIKqP298gZWyjc0W6aBB143CCBCBWBlDYcRzkcB1xzocGSI16Y9S2oMNm0UJJAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709125914; c=relaxed/simple;
	bh=YERzhlNK/eni5qTtQELjZDM3OIo62GmiInYyteIJONI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3Qjp3MBiMITmiE5hYqGFaUw5Ch0e9OS443N7Uqkq2VSPOog3ATotSl1wbCTvzH/R7lQSSdpuGIo6O809o+CYMRX8LLsLIjzlfK4RVpUPZMyaZQsscIxduBHHxUtIZbK683JG4FTvsO2L/2XX86Wncki7tbnH99jC7eRRlZwXUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=C3C2aOoe; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TlF9m1l01zySM;
	Wed, 28 Feb 2024 15:11:40 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1709125903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FBBExQ0pM2cV2w8yzVd81EMn1Sqv6sxuVMC+oFXlnuM=;
	b=C3C2aOoeSeBIoKNOr4R/rK5XRYTPuvQjFPzMvBzWAlZQEtA5h1x5h6G7lAmKFTW93DzM8O
	qIOVU/8drxQkkUS4Xktcdb5WEwod2sgb3XvnfYbxAtu77c0oNxuw2zEc+pYGisvBwX4uo1
	+PyNQ7W6/l1THjMfNxwHk6qzYlStxRU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1709125903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FBBExQ0pM2cV2w8yzVd81EMn1Sqv6sxuVMC+oFXlnuM=;
	b=AhqLOy8wCOZe9wogRs35An0vLyCc6QwbT75mvDCWyze2uLqSsmTqrYYV+axTTd+Qm2AToq
	qiNg5yovn0lwq5J/Adu/bRR2iJjcDCxJ1qjH805XUvvTM3FoFyS/ruu3nBCTNDjtl/ESL5
	a1eJOor2SCWu4pq50GlG9LPOJ4DeokE=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1709125903; a=rsa-sha256; cv=none;
	b=f4AzzPidev9c9vAo9Xt5cXV3PACUw2Qe/pjpzLHjGeRcGxF8RtjNwkfuwaeKLJ/uWqNN3d
	NIRLfaeJu2/vhBCfGv7i3kzQqzXaI9v9LCt79ODDn2ut7v9UdZWoppn/s9CggDLo+/K66G
	B1Vt+7l9bJs/zMGSEyIALZAXssSEC4Q=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 51031634C93;
	Wed, 28 Feb 2024 15:11:39 +0200 (EET)
Date: Wed, 28 Feb 2024 13:11:39 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 3/5] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <Zd8xC0HkZfSo29id@valkosipuli.retiisi.eu>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-4-dan.scally@ideasonboard.com>
 <ZdxwE3omXmUjfLMn@valkosipuli.retiisi.eu>
 <mylttlhcnxe5e37m2ar6xgtus6dbr56teyyp74qm7l2d3wejwv@ewpbhpjr3v4m>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mylttlhcnxe5e37m2ar6xgtus6dbr56teyyp74qm7l2d3wejwv@ewpbhpjr3v4m>

Hi Jacopo,

On Wed, Feb 28, 2024 at 01:50:14PM +0100, Jacopo Mondi wrote:
> > > +const struct mali_c55_fmt *mali_c55_cap_fmt_next(const struct mali_c55_fmt *fmt,
> > > +						 bool allow_raw, bool unique)
> > > +{
> > > +	if (!fmt)
> > > +		fmt = &mali_c55_fmts[0];
> > > +	else
> > > +		++fmt;
> >
> > fmt++, please.
> >
> 
> Can I ask why ? (here and in the next occurrences you have reported)

It's much, much more common and using that form makes the code easier to
read. The rest of the driver primarily uses variable++, too, AFAIR.

So you should use ++variable only when you need it.

-- 
Sakari Ailus

