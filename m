Return-Path: <linux-media+bounces-26262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A53A39682
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 10:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 570F01720E7
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 09:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0139022FF4F;
	Tue, 18 Feb 2025 09:03:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77E322E401
	for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739869432; cv=none; b=vAgJSuFuEceheZUCFnZXDc3HyqJC3Cyt3DzBG1hmULEEXN33k+U1V69g7DBT70wXlS++SmFSZS0/XZoH8XmIK1dFWHGAQsrvEiqpiBtQtQ80C7n0IUF7b78FqrectaGcruIqK+ekPPs3RSKKiBdWSGxikzf/kvZmSACPT7r8gkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739869432; c=relaxed/simple;
	bh=Rb/oEzPquB0AN3zNExVOUPkHhu2SKGcn8YilK2l8ikA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cLR0LGc4g3lNqJHhH1qGyVtvvQBT9HUApRUkNnRjLRvISUdJA8FbkpKgmklwU39VpXtYJn/VWir5i8k7G3Yd9Ys3hNJWsJ3siPkSnZCBHmZN1z5qu3xLuf0MwUUecO0ckuxSrJQElVagU2IlNHodvjh9WWT/pEF2PxO8rfuu/u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJVw-0005iJ-9J; Tue, 18 Feb 2025 10:03:36 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJVv-001YXQ-2k;
	Tue, 18 Feb 2025 10:03:35 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJVv-0002g6-2W;
	Tue, 18 Feb 2025 10:03:35 +0100
Message-ID: <15bbca6567ff640fdcfbe1a9525989887a94732c.camel@pengutronix.de>
Subject: Re: [PATCH v2] media: verisilicon: Fix AV1 decoder clock frequency
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner <heiko@sntech.de>, Hans Verkuil
 <hverkuil@xs4all.nl>
Cc: linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, kernel@collabora.com,  stable@vger.kernel.org
Date: Tue, 18 Feb 2025 10:03:35 +0100
In-Reply-To: <20250217-b4-hantro-av1-clock-rate-v2-1-e179fad52641@collabora.com>
References: 
	<20250217-b4-hantro-av1-clock-rate-v2-1-e179fad52641@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Mo, 2025-02-17 at 16:46 -0500, Nicolas Dufresne wrote:
> The desired clock frequency was correctly set to 400MHz in the device tre=
e
> but was lowered by the driver to 300MHz breaking 4K 60Hz content playback=
.
> Fix the issue by removing the driver call to clk_set_rate(), which reduce
> the amount of board specific code.
>=20
> Fixes: 003afda97c65 ("media: verisilicon: Enable AV1 decoder on rk3588")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

I was going to ask whether there might be any device trees without the
assigned-clock-rates around that this patch could break, but the DT
node was introduced with 400 MHz clock setting in the initial commit
dd6dc0c4c126 ("arm64: dts: rockchip: Add AV1 decoder node to rk3588s").

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

