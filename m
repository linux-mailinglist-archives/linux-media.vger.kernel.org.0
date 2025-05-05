Return-Path: <linux-media+bounces-31686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B838DAA8E0C
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 10:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECD5F3A762A
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 08:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAC91E7640;
	Mon,  5 May 2025 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="PZ/cZx6C"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E154F8C;
	Mon,  5 May 2025 08:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433074; cv=pass; b=iGj6c7x8we/Fe3HCkT9ERqW9xZcjT6DT4s49AfaaOi234yBWII0kl1qnxk4K8wKewkTXt4EGfxERiiWZZlxk6SJbP8CcR5xBlM60ZsBVHFsrSR43oK0lEA+yEuhi5I9LFLlcI+tl8BvqJuGNfW6dWWCdxVfMgYdbNIhlgCX+uJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433074; c=relaxed/simple;
	bh=aU6q/hLEJlDYddLVp0qB4Sh64oToLbHo/SeZqiBvYGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnNflITdBipOffMRx92djdY4EC4DaH723nN3uMQ2YEAD1h9a95fPf8uPvtJ3yvL8qXpNU9SJLs9Xa/51JBmqXbKIj+8oIHWb3D4SV9thjswDNeicoURaqKQ+4HJCP1IPabcZBHOK5+qpdi/c/842Bqm4xlRDRWnLsCf/tG41xPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=PZ/cZx6C; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4ZrZCJ2GRBzyVF;
	Mon,  5 May 2025 11:17:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1746433069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gBIZnh1OkGTxH+f6ILMZeaWXA00dbZcm92xt+MSF/Hg=;
	b=PZ/cZx6CNVwgJqzLEV/bvfwhFnS5bdsAAok/UyfDRMa8z4DkuON0BfzndK2145AxYL9q8b
	mCgj928UqdAWlhA9xs9MvIFyi0w8aXc35PnHGhSVZ43JXiw1rGzzZvnax+Ozzv5fjI5Iyi
	vsG7F+Ca/f60iyckUMFWbc7TomyMBos=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1746433069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gBIZnh1OkGTxH+f6ILMZeaWXA00dbZcm92xt+MSF/Hg=;
	b=pTPU53Tnq3UK9pG+wTqXxIiTOaRJYNI2G2/WhlGt2jrCOmTcmQAzXkcMaw5Vw0Ln1/UsQE
	IDqZty8J1WU8bCdhJMb+vmQPqd0l4GTsF+fTHYpvzo1UBSmcjn9VauGrroTsAHBflTl4O6
	1zinpdFXgpPeGX5k5aqfgIKoOcQ4g4Y=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1746433069; a=rsa-sha256; cv=none;
	b=bBQYIIb7onkNxkXyOHsj7kPAx+ETAwu2UdZq/lQU05169oNU7aevFQANrt6c6oupyJYyau
	WPmLtUccmWmsSIxgBvEV7gdhrKteX6fg29qw0xIrUvNdo/0Pxel+7v/yfLXxt1LTuAKetQ
	rzxNZ4FG6lkCDnvL/d7fTiyJTpC4z/k=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7ADA4634C93;
	Mon,  5 May 2025 11:17:47 +0300 (EEST)
Date: Mon, 5 May 2025 08:17:47 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: i2c: ds90ub9x3: Remove unneeded
 of_gpio_n_cells assignment
Message-ID: <aBh0K2YGhgxk6ipv@valkosipuli.retiisi.eu>
References: <20250331070200.3985562-1-andriy.shevchenko@linux.intel.com>
 <c7fd0bd4-4fc8-43f0-b980-b49472e76445@ideasonboard.com>
 <Z-5pwpoYEKKmtmPA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-5pwpoYEKKmtmPA@smile.fi.intel.com>

Hi Andy, Tomi,

On Thu, Apr 03, 2025 at 01:58:10PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 03, 2025 at 11:07:40AM +0300, Tomi Valkeinen wrote:
> > On 31/03/2025 10:02, Andy Shevchenko wrote:
> > > The default for of_gpio_n_cells is 2, no need to assign the same
> > > in the user.
> > 
> > Where is this documented? I'm also having trouble finding the
> > implementation.
> 
> The idea was introduced back in 391c970c0dd1 ("of/gpio: add default of_xlate
> function if device has a node pointer"). But now I realised that it was never
> assumed that default is 2 for the cases when the ->of_xlate() explicitly
> provided. So, this is wrong patch, thanks for the review!

Does the same conclusion apply to the similar max96717 patch as well?

-- 
Sakari Ailus

