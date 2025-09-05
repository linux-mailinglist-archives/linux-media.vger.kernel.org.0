Return-Path: <linux-media+bounces-41848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC18CB45C19
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 17:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A14151BC02CB
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 15:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C015B31B812;
	Fri,  5 Sep 2025 15:11:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84471C6B4
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 15:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757085112; cv=none; b=f0duHex7C0AFdVKI/KltaijzCWgPUqRIz70YIQuC8Px43L0hB4Xc9O7pc+tKubkERof6l1RTeqFRXxqi+SuCtUFuXtBihFLtGOGolhAhcZDYen/SFfFZ+qNxNhVMwOkFjCc/Ptx0+Op3u1Nqac6GxvaW6heJmwCWmUY01Ee9Xqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757085112; c=relaxed/simple;
	bh=KV7JC/qJFBJYr5ksw6moyOYvDCmV8x0dgy5Oa2ziLqM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BIUW3DK+Nw4sVyLt6/57TwS1eb9BJFg/EtH6G5lYOZhHWVQ2dsqHzPJJlJE9SWv2OPzd0iaC2MXo3zi4Gqjnqwgk77Z49oIzpeKvMrbrBF6EaGbzpc63XcV7rrzjwU/EWK643zh3f/EtZRbhyqbB7VDPaXI5GnCJqGMs8GxNR6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uuY6L-0005sF-3o; Fri, 05 Sep 2025 17:11:45 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uuY6J-004ORu-1J;
	Fri, 05 Sep 2025 17:11:43 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uuY6J-000XUc-14;
	Fri, 05 Sep 2025 17:11:43 +0200
Message-ID: <83a8a8a8258eb08d8ef0988dc43e3c9101f6532d.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] MAINTAINERS: media: nxp: Add Frank Li as reviewer
 for nxp SoC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>, slongerbeam@gmail.com, rmfrfs@gmail.com, 
 laurent.pinchart@ideasonboard.com, martin.kepplinger@puri.sm,
 kernel@puri.sm,  linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org,  mchehab@kernel.org
Date: Fri, 05 Sep 2025 17:11:43 +0200
In-Reply-To: <20250904161720.514889-1-Frank.Li@nxp.com>
References: <20250904161720.514889-1-Frank.Li@nxp.com>
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

On Do, 2025-09-04 at 12:17 -0400, Frank Li wrote:
> Add Frank Li as reviewer for nxp SoC.
>=20
> Add nxp open source mail list imx@lists.linux.dev.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>


regards
Philipp

