Return-Path: <linux-media+bounces-58722-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOAQLsAI3mlRmQkAu9opvQ
	(envelope-from <linux-media+bounces-58722-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 11:28:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ACC3F7E62
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 11:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AAA23027B55
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 09:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E613BE17F;
	Tue, 14 Apr 2026 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wlum3Qmp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3E93B6BE8;
	Tue, 14 Apr 2026 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158883; cv=none; b=jUsdihR4ss+ZNXdfucUN2CPGwrNKgztq+CWc9a8X7RhAys6XqI/ktm2Ml2JdxFjCxeVpnLYP+YvBrSKOUj5mMK8PSMg6S4IR9gsQxbnQqI2WZPZO/T6GMccB7qUn0oVa7LsVXEHiKco+W0zflqKsKnqUyKT/zJNwK4WE7qUwKoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158883; c=relaxed/simple;
	bh=M+1EIrh0XuJ6H/adXzJxIGYbrkMw3R+m8bSKxW7aXKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/EkETGc0rMs2aKpHGKMYF30mBYRYUxdfwSrlt2dIxDSTTyljIlw7GTsuinGbsyahsX8IUYonJ5uca7J9RWKe5SJ7/l4pYVSo/Dh0lk+sLpNd338sIoYfxNI8Fdy8dMg5ujDv0jAf4v85WgSVP3ihnU3fvnIh+N07fzrQuhwqHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wlum3Qmp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0C88E63C;
	Tue, 14 Apr 2026 11:26:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776158787;
	bh=M+1EIrh0XuJ6H/adXzJxIGYbrkMw3R+m8bSKxW7aXKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wlum3QmpERI8ViOFBlV7S3CQ6fqBswPoYWDCuMOGJHQSbNXlF8aJeMp8Zox1i9xUL
	 hEgZSy7PJ2X8uDj9wt5CaYtkNWFJdydJ3ivn8k3RKVikLJgqIsLL6U7DOJBvYJezZ2
	 H7q+PyKpHzEakzef0sdxj5WGrVRReOOpnX1lQryo=
Date: Tue, 14 Apr 2026 12:27:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Message-ID: <20260414092758.GE4061@killaraus.ideasonboard.com>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
 <20260414084952.217215-3-elgin.perumbilly@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414084952.217215-3-elgin.perumbilly@siliconsignals.io>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58722-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,siliconsignals.io:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 34ACC3F7E62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Elgin,

I sent a review comment on v1.

On Tue, Apr 14, 2026 at 02:19:45PM +0530, Elgin Perumbilly wrote:
> Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.
> 
> The Omnivision os02g10 is a CMOS image sensor with an active array size of
> 1920 x 1080.
> 
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - vflip/hflip control support
> - Test pattern control support
> - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)
> 
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  MAINTAINERS                 |    1 +
>  drivers/media/i2c/Kconfig   |   10 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/os02g10.c | 1039 +++++++++++++++++++++++++++++++++++
>  4 files changed, 1051 insertions(+)
>  create mode 100644 drivers/media/i2c/os02g10.c

[snip]

-- 
Regards,

Laurent Pinchart

