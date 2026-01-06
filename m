Return-Path: <linux-media+bounces-50013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 87373CF81E4
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 12:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A45E304F2DF
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 11:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7692B32BF49;
	Tue,  6 Jan 2026 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q0Fl79Uq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0F9328B44;
	Tue,  6 Jan 2026 11:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767699254; cv=none; b=Z8bU1TvFK1bp1Rp5sjGoDQQWcPAA/Sue1sOvrEa3GONehC8S/eFrcNdKd+6Cm7ZouSeAqKEPLKMbH0cSKZJGZW3xm3IsF8sDaJm+IEOvSyDJUM1dovsjV1eUlWLuZ+f1pGiwALkeowotW8jLJ2WGgYXBWMM3qzaujFlpmbceRf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767699254; c=relaxed/simple;
	bh=zMcdo2laUfSx50OHoBCGJf3xGGkRUIAMKEVth5EdGdc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=OFIp0VNjtbdvehqo9qrveSyjmC8OXUjSUKnmgah1AVxj+lgni/qqYHvow0tvO0mO1FZksDWCfMjfxFeautZElIY1WY5DMyafRkV0x/QGJaJyEoYoyOm3ikeXuLH7WcJYW6LR1Q8Gn3ritkp9seTjuI9uPmTxl9/Ysc41cc3kzmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q0Fl79Uq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:7a27:be73:8a11:8e2e:dcd3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E605F56D;
	Tue,  6 Jan 2026 12:33:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767699229;
	bh=zMcdo2laUfSx50OHoBCGJf3xGGkRUIAMKEVth5EdGdc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Q0Fl79Uq7swKqAFnFBlQOBqWBUsJBzjQdlKB02Uhi7VZRmr8Fu2CKaCnGDelhG5JN
	 bdKOsNUYsPPsHAs/Vly+AtH3SwB1pA1IfD2QdIBwF7L2lnDkeCftt8/zmOxnMoUVUo
	 3wA3KkdWx6uq79cuvg+6UyGgrtLT/bW1lJCUSt9c=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251219122955.2078270-5-y-abhilashchandra@ti.com>
References: <20251219122955.2078270-1-y-abhilashchandra@ti.com> <20251219122955.2078270-5-y-abhilashchandra@ti.com>
Subject: Re: [PATCH V3 4/4] media: i2c: ds90ub960: Add support for DS90UB954-Q1
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hansg@kernel.org, mehdi.djait@linux.intel.com, ribalda@chromium.org, git@apitzsch.eu, vladimir.zapolskiy@linaro.org, benjamin.mugnier@foss.st.com, dongcheng.yan@intel.com, u-kumar1@ti.com, jai.luthra@linux.dev, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, y-abhilashchandra@ti.com
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, conor+dt@kernel.org, hverkuil@xs4all.nl, krzk+dt@kernel.org, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org, sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com
Date: Tue, 06 Jan 2026 17:04:05 +0530
Message-ID: <176769924521.1604677.11258559573163518409@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Hi Abhilash,

Quoting Yemike Abhilash Chandra (2025-12-19 17:59:55)
> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
> compatible with DS90UB960-Q1. The main difference is that it supports half
> of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX port.
>=20
> A couple of differences are between the status registers and the
> strobe setting registers. Hence accommodate these differences in
> the UB960 driver so that we can reuse a large part of the existing code.
>=20
> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Changelog:
> Changes in v3:
> - Remove redundant reads and writes to the same register. (Tomi)
> - Correct the bit positions for data delay in set_strobe_pos for UB954. (=
Tomi)
> - Address a few minor nitpicks in code comments. (Tomi)
>=20
>  drivers/media/i2c/Kconfig     |   4 +-
>  drivers/media/i2c/ds90ub960.c | 182 ++++++++++++++++++++++++----------
>  2 files changed, 129 insertions(+), 57 deletions(-)
>=20

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

[...]

