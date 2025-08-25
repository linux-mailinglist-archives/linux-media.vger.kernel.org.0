Return-Path: <linux-media+bounces-41051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB89B34A5C
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 20:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4973217FFB9
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 18:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCAD30DEC9;
	Mon, 25 Aug 2025 18:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="XUF30Yjb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB19306D26
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756146687; cv=none; b=TAHev4qtp6QxFKzex708RYf/8bNVfJgBpO/7vxKe01q15DZXDTj+NBsZK6yykIzNuEeUKCAn4MHaf4sMMa3EDNnJbNtw4ideAPoLXkVBdbo980zsVEf4jFPa/ZFbmwuJs9tAuXSAIXSd4bbElSgrATPCMtw2UbuCS0WqQ7l9oao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756146687; c=relaxed/simple;
	bh=NqoYACXOw8wDP1WvzCpUxeuUy2wpqRUkEhJcPRJdMis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onnK5lUobYa5cVd6IFeQctpiawWDF9vL6QVUDbw95J8vT+ymG5zfGFb4FlXyg04GODEduqI54CKluFMRBxsfjXbDA4uvK7jma0l7h3wrl3QEAaf9uUzx6QRQmJ2XEZfS3QiZd1NG78E/HK0wR1RjCgHQ3MI+PYf1OZmURDjP0PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=XUF30Yjb; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e8702fd3b2so458403185a.0
        for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1756146684; x=1756751484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zWiX+6VTPBW9oMyyTDAuGR0ExNJ3ZNdezl4Ijz6qJzY=;
        b=XUF30Yjbs/HTyJ5gzDd7LujSLObHx00FMxX5NX4tGUOhF8jWYy7BFy/eoGlqBY+IkI
         RXJS1Rb0HoNxv0lvhEFlnB+/rhG0WyEUHAEWHDVmtvtfpX8nxNEtZVI5fcRUe3sW83Zi
         hGZvTAboUs72FJfDsW1J/WIoRoJ3qrAY9u18H70zV2dhfif0oP4dblQPZPVd+hQChTQt
         r7GBSiKtmSz16g8PPf3B+A0QlCLa66xoc3Ry5Dc/MEoAwB3OmT4Cz/SNWiHth4pmHf+S
         eBVVAriL2vl0smgtEuibc/VELAoBf8HNB3/noex3u6GBdLEPqHqe2kHv+ZDMn4HIS3sB
         svbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756146684; x=1756751484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWiX+6VTPBW9oMyyTDAuGR0ExNJ3ZNdezl4Ijz6qJzY=;
        b=pNYL6twnNPb+nltdyfXCyisFrrmegzx6NBPPuxGoO/B4ALRoVHZNMbD1PVI2+ERzUC
         UMr9FHQNRXI+NedAitqTqzYf3NABR2iS9tvinVEhsNxnQxIDI48mkm2fcHjYABTunS+a
         7SMm6pI9KowDFSl5AdXyNrFc18Rpx2esBYy65/cuggHLvOAIgGZruNK2pGaD2N+aI9ZB
         VTmTjSbItSLt7/txEkhyr+LakIOWaFuUKe3IR7AFcebVc+kP0dFWKzL7prH0j5WpdcH5
         fzf/j0qJ9Uzx0mOBsGr8xJn+HXJ/Ntw0nsBd7x5PoRDBDTzb5G/6Oi73YL+LObynfMNA
         uIlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgdM+nzHZXeasE6IJIqVQBwewoj1qv2dpoLu6l+qCgvXnlWYxvnGtA5LTC346cuX6d9HPwVhdWxyhbbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM+KE3W7RAVQYEMaUgTpM10cslXFrJNhXKnEEst9u75vudLlfe
	2BkCThwpEdVQVSh3eP3sqbDwls+X2DZDjKkUrl6GA9y6+Bh6eXMaWv+FBELJiRkraD4=
X-Gm-Gg: ASbGncun8WYv06RApwuFlCU/VGBApEwv7XrTkxKfyOYAHGemiIfXfsvE1ijxs1JvtaA
	Q5Y1uyj1SJS/Ofb7vt2rqpL7tjYorKnQc53r0PLOcYckk/TV2PoMLdrmLoYoeQlts4tG2tRxg7D
	5TSussgVfMXcPB5Nwcxt4NN/+NAWwyKcCEtqTSM0KVHXcGK4mU5LFhcXuBRRF7z8a/jafZ45Quv
	9+C41svzlvXqx/zDNhrdC3OaGdfYGfNBQs+6VpPf7+MvjJwBpQdUTXnGdadZINlJg+yQrDgXCHq
	XKo9fCs+sYvT4UXGhC1mpcmQgZEahLBWKcSAJ1d8TXbdlKBLL6UR4iS9jk64fTg923n9/sKn7Hf
	IUG79uvtbQG5SLBbH81Egnc0SGHpOMEi/fEmBCxYMrldMCGxD5i5dLD5QTsh2EIX/04uK
X-Google-Smtp-Source: AGHT+IGrrqtb5FLiQ6yBv5bSbXionDmSOOeGsus0fmtyrIvrknH2Q5meU+RUaqrB7rQ0ZREIDsRXNA==
X-Received: by 2002:a05:620a:1726:b0:7e9:f820:2b95 with SMTP id af79cd13be357-7ea110baa0emr1337281385a.86.1756146683666;
        Mon, 25 Aug 2025 11:31:23 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8c631b8sm57949871cf.3.2025.08.25.11.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 11:31:23 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uqbyU-00000008lWr-2NRj;
	Mon, 25 Aug 2025 15:31:22 -0300
Date: Mon, 25 Aug 2025 15:31:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v7 4/6] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
Message-ID: <20250825183122.GB1899851@ziepe.ca>
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
 <20250825153450.150071-5-benjamin.gaignard@collabora.com>
 <20250825170531.GA1899851@ziepe.ca>
 <01c327e8353bb5b986ef6fb1e7311437659aea4a.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01c327e8353bb5b986ef6fb1e7311437659aea4a.camel@collabora.com>

On Mon, Aug 25, 2025 at 01:50:16PM -0400, Nicolas Dufresne wrote:

> Jason, the point is that the iommu and the VPU are not separate devices, which
> comes with side effects. On RKVDec side, the iommu configuration get resets
> whenever a decoding error leads to a VPU "self reset". I can't remember who from
> the iommu subsystem suggested that, but the empty domain method was agreed to be

IDK, that seems really goofy too me an defiantly needs to be
extensively documented this is restoring the default with some lore
link of the original suggestion.

> the least invasive way to workaround that issue. I believe Detlev tried multiple
> time to add APIs for that before the discussion lead to this path.

You mean this:

https://lore.kernel.org/linux-iommu/20250318152049.14781-1-detlev.casanova@collabora.com/

Which came back with the same remark I would give:

 Please have some kind of proper reset notifier mechanism - in fact
 with runtime PM could you not already invoke a suspend/resume cycle
 via the device links?

Or another reasonable option:

  Or at worst just export a public interface for the other driver to
  invoke rk_iommu_resume() directly.

Sigh.

> Benjamin, please improve the naming, comment and description, I agree with Jason
> its not completely clear. I'm also surprised that you do that every frame, seems
> excessive.

Indeed if it is just error recovery.

> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ff8c5622f9f7c644e995d013af320b59e4d61b93

This is already merged? And now you want two copies of this? I think
this is a very poor direction..

Jason

