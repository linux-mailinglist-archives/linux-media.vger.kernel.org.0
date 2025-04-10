Return-Path: <linux-media+bounces-29938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB07DA84740
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 17:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A70753A798E
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 15:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D62D1D90DF;
	Thu, 10 Apr 2025 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="iDZB2ITN"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC731D88A6
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 15:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297347; cv=pass; b=pU25SrsHxZEkeCj7gxyALUO6PzNa9XFZrtPJrGn4Xj2G0kHVP/Qw9PL73NA1qOW8DkHvtpCFjl4nc5bvpxMi5B/IAT7Dl60YRQtk6jTfL19Gj47nP8p/1T8UMj52EPToOcQ3UOi9EWklAEtjQmaBQcDknzArIDuRuuVD7LQdAaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297347; c=relaxed/simple;
	bh=/1FbbmJsFBLMxX7PccvowVztdrgy5tXdoyx0LNW5dUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELRyQspkDoYNYrb4ugg+rItvK/ZAN0UOGY9gqjLBynaMuv99H1aEX8e6Pua7SGG1VQDN+0JWohowrUi9aYCL2fw0b0Q2Uj8t/8Q7YGRYFRGwacq9a7Rmk/7AumXyZBc2VYd9U2Aeo1/ODlpo9iB/iVEwDNrVlB5nZtP683Ucq4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=iDZB2ITN; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4ZYNMV3Y3WzyV3;
	Thu, 10 Apr 2025 18:02:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1744297334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qFdlvNU3M823Kq3x1w8z9Y81Lts2WhRQCiSq0u0SMUE=;
	b=iDZB2ITNqZ15mPhAClmbQd7HUXhFlvyIxFZPS2+qzWAl3wzxb1TSuUrixMtBNt/Ug7hj16
	YksNtf9sQTOKvJbJ05WgpxOS4+Cp4mTa93vMaUnxQWg0J8Ot8PBVbSMslTVX+6BEdR7Eiw
	zU7Zbczunl3T1SAECNARKH8X5gLOTYs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1744297334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qFdlvNU3M823Kq3x1w8z9Y81Lts2WhRQCiSq0u0SMUE=;
	b=Imw3K+II5Xv8HqrXHXzkypPOStIUw4+FS+MhwvV1RH18DvrFIEMkcXO5pa2GVgnYTNRlHo
	xzeiRSgP+JjjiXYsVIHyvWcy2unVrDzMDTD3oNOUL9F2OzP1m7PjXA9PtuKom5bIRLuxzM
	33OHHiuEUEYXXwTH1PrX18pu551aCNk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1744297334; a=rsa-sha256; cv=none;
	b=fxV8YdDeKnWCJ5Lp3CPFalzF3ZF1H7V/bX+H0loMGC1HIaIQXraEXI1kCRCCxM0utdjaUt
	8/6dH6QI31mE/NNklywmpRK0Fs7i4QX2XGx3inXxUF8SGenkaSmKIPQlhnZu0ddNtyDl1n
	VySezJt5BWhhthNZkAOHOqe4+qKH5UQ=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 70E58634C93;
	Thu, 10 Apr 2025 18:02:12 +0300 (EEST)
Date: Thu, 10 Apr 2025 15:02:12 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] utils: media-ctl: Set V4L2_MBUS_FRAMEFMT_SET_CSC flag to
 set colorspace
Message-ID: <Z_fddMD_9GanGDjg@valkosipuli.retiisi.eu>
References: <20250408161051.10472-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408161051.10472-1-laurent.pinchart@ideasonboard.com>

On Tue, Apr 08, 2025 at 07:10:51PM +0300, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> When setting colorspace fields on a source pad, the V4L2 subdev API
> requires setting the V4L2_MBUS_FRAMEFMT_SET_CSC flag. This is missing
> in libv4l2subdev, resulting in colorspace fields being ignored for
> source pad. Fix it by setting the flag.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

