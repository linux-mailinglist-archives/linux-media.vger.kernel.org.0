Return-Path: <linux-media+bounces-40583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D8DB2F9E1
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 373151CC171F
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B034322A1F;
	Thu, 21 Aug 2025 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Vo6tXthg"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1179322741;
	Thu, 21 Aug 2025 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755781791; cv=pass; b=F7Na3qsQuQhP8GZp2ZrertgyXb+FlT+peiMkHUKAobTLEV7AsHS9kBeLTJ5/jpDwnPA5lSLO/LKBaNU8yw0Cr3p/I2tTIAOZovHbZ4C/Pfy/IdPHwJhAd6Ezhf3w5I5UXRkhTjhc1b5khZ6T9LNeOkbb/bLNjtjgTP+Q8wsc9jA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755781791; c=relaxed/simple;
	bh=c6z2Anh6sbb5NivOvu50DI5uIAsCrwWMa55qQX9GMCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGsiTABL/WLOb5WP1oT6L2MnT/Lr3NZq5b6YThC/IuHev7RmbG8ejPZkn+PPmX91i6vmy9qo5mXn/CIRMeGmrZYsHIsI8vpVqrVBO5CfFBP6NMl6sgG9b9QRdD2522465HRNUbmOzkkOe5J8AMy3d9ve1/j1esexElmXGmy5qjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Vo6tXthg; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4c73ZH3YdZz49PyC;
	Thu, 21 Aug 2025 16:09:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1755781783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RG7FdxGayk/FT0R62hdmtMFE2/mK6pkaoyT3IzHXIaw=;
	b=Vo6tXthgccMZmtWu2QBRLpsm3Qay2pZX9qfLnMzBct6LBwbZO0UKh+XUFOWhpGzm33bRYE
	eGB2kyFR6Fj0794U/2ez/vYAkyzzlawq4F3T0dGLyoueeFk56ons1Dyc47zzUBiSELe0gc
	c6DdHsoZBSh3vyLpSbgeRtiObHh2suB2Qq6yadM0Ty4kLDD/Nbs6K/Rz1EcNupPbcPA64A
	Gky5huTHSmv2w+JpTo+1pFo1kzYzSyA0X5+6OgPLV8bco74PScrz9XjH+fBCJin8wYPlU8
	gm0Jv/mpV4vAXaXD7V9qdYxnb2qpbTcodxtElC17OO7jMgQ6C+0XvJgx9WK+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1755781783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RG7FdxGayk/FT0R62hdmtMFE2/mK6pkaoyT3IzHXIaw=;
	b=XlxMkKEiXF/zZPvPnppC1yOUqSMq8u8SbV8Hiig8S9XdBbbUMCs4juAc0264rkDVUUS+L0
	xD+JM90M4v9JeVLtzDt2wT5zKktLIGI6s1VN6jpYnuV2yoq+uJWIoHX7Di/T94nJXWuzbl
	n6CAIHMEIsLMslqzbUsmmTdzQjK12N061Vg/67y0L2GYNuYyrJyh+STWWy1MJnQb7z0S4z
	IeFFL9esk4g3ElxUAL1W+3/ab/J1WTh4j6Otl2Kd5irzjdl/JGQDM1IWTafgHOh8kAabkT
	aaN98VaDb6R6DLmp65kOa422amfE9g9xra6WIuPPAuZe1SWkpF5Oauzqpp6wxw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1755781783; a=rsa-sha256;
	cv=none;
	b=A3Np8sImhwJccJz+4U+x/yU8qaL2TcD5WuITJkgbhgXx8o1F9FkK7e2H3iQY0VLaRMEGcK
	Gsd7Fb4QEHLxQE1wc8ioIWFNvJ6fPJqBtAMpF68OwRJbCgpgTO25QKlmqgzh4i64uPVjh3
	4wQFn/m0x1Zmf3aOZEwFhLLBqJ7zG9ucFy8+srZTSabaAb7oiPNCmqCYys5PFYkvaZ0+Nl
	td/mIq5sbSKY5A341OcGi+/PPOiwm3gX3PXbJx6ocAVgpCOhSntQ72q2Ob3c16oDnBzdRW
	c3qx0/JTHhEs+0mnfcYVatWpY/3cvbzlMHw3W0hgFDBn3VbTKhcwK7oQtGXkbA==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0064F634C96;
	Thu, 21 Aug 2025 16:08:18 +0300 (EEST)
Date: Thu, 21 Aug 2025 13:08:19 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v4 4/5] docs: media: document media multi-committers
 rules and process
Message-ID: <aKcaQ7R1LTWRf3rd@valkosipuli.retiisi.eu>
References: <cover.1733218348.git.mchehab+huawei@kernel.org>
 <01acc93fd8780265ea55772ba793f3f09a43ffa7.1733218348.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01acc93fd8780265ea55772ba793f3f09a43ffa7.1733218348.git.mchehab+huawei@kernel.org>

Hi Mauro, Hans,

On Tue, Dec 03, 2024 at 10:35:48AM +0100, Mauro Carvalho Chehab wrote:
> As the media subsystem will experiment with a multi-committers model,
> update the Maintainer's entry profile to the new rules, and add a file
> documenting the process to become a committer and to maintain such
> rights.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Overall it looks like the review comments are fine tuning with probably
little effect in practice right now. Do you think you could re-spin the
series, taking the discussion into account?

-- 
Kind regards,

Sakari Ailus

