Return-Path: <linux-media+bounces-31617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B54DFAA75B1
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2962A7BA124
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D50185955;
	Fri,  2 May 2025 15:09:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55039256C60
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198581; cv=none; b=ZpcS7dE4IpBwSUvwgzGl89gtN/h4LZU3AlAGKV/lkQWrOY7F1Y0Nta7cGOpX32SFzFh4pIKNLsdbiuHfQTK3eqymFmVmy3pyb1qvGr3mpl7UWOFsE0NfXkXTOsJg8SYpw2ZAooJd+f6eoe30bf1lhzOYZByFCAbFfk2XGMKY96Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198581; c=relaxed/simple;
	bh=KLiW+3GE3O9BJ9iffWg/gBq91dbbgNVRFBgQRgd/3eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCiGrhsOddVlCpsg3dgKhXiWSl4F1GyR+6hgY5BTDPBFS0HZKIYUmNLt8lD3hBlaA10LgSmk0O1rgvgmNmvpcPgQrqEaRMw31xKFvHysMlUl5YYLDMnDqxcuHImoRxqv9haQqmHt0cxv8B6VnAykMo+SLh4vkyNhs8b8sSTzHnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAs0u-0006q9-EC; Fri, 02 May 2025 17:09:20 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAs0u-000lq1-0A;
	Fri, 02 May 2025 17:09:20 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAs0t-00GZW3-2r;
	Fri, 02 May 2025 17:09:19 +0200
Date: Fri, 2 May 2025 17:09:19 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.kocialkowski@bootlin.com,
	hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
	sebastian.fricke@collabora.com, ming.qian@nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [RFC PATCH 00/11] VC8000E H.264 V4L2 Stateless Encoder
Message-ID: <20250502150919.e7656nft7yciqfco@pengutronix.de>
References: <20250502150105.4167289-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502150105.4167289-1-m.felsch@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On 25-05-02, Marco Felsch wrote:
> Hi all,

[ ... ]

please ignore this mail as my setup messed up. I've sent it again.

Regards,
  Marco

