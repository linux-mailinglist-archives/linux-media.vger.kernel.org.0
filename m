Return-Path: <linux-media+bounces-65690-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mO/ILscgPmq7AAkAu9opvQ
	(envelope-from <linux-media+bounces-65690-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 08:48:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DA06CAC04
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 08:48:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65690-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65690-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1FC1305F704
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 06:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D3B3DB632;
	Fri, 26 Jun 2026 06:47:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ECC3D567A;
	Fri, 26 Jun 2026 06:47:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782456478; cv=none; b=WbDaLc8fVSR/v8ubG97LR2KxmvTSWu+cJq0CmAWBhz6iLyqmhAiX7woMM1BQw8HHD3zjGdM7DQ2bTktANjcIE7QlSqAaQ/IRSVtPeet6s9x0zprEtdZPASbPLQh28/L161c/oSCBcz7049xZsfqI1aIw0VUraX5gqW2P45c1q2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782456478; c=relaxed/simple;
	bh=RjgNTxh5IYbPYM4mWHY0E5Hm6TL004NYqZSRIb8UqI8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q/GiZEY3JcT1D+dA5nTy497ujrAgKfysfTAJ927JVfq9DFoFakStWb7T5h60D90r91OiK9o97qONP2YeKKrRD323g2nSNwIyXKJ9SN0iLluIelUxeV2LRLOaFpBeIokbwvF6Vw/BkvBJyh6C3wNM0/nf+EfUB7pwU8oRSAec/K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3663920017B;
	Fri, 26 Jun 2026 08:47:53 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wd0Lx-004iBP-0D;
	Fri, 26 Jun 2026 08:47:53 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wd0Lw-000000003K1-45ok;
	Fri, 26 Jun 2026 08:47:52 +0200
Message-ID: <d80cecc3f317e4493207ea3c347dd144390d299f.camel@pengutronix.de>
Subject: Re: [PATCH RFC 1/4] media: imx8mq-mipi-csi2: Make reset release
 SoC-specific
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Vincent Cloutier <vincent.cloutier@icloud.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@puri.sm, Vincent
 Cloutier <vincent@cloutier.co>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Frank Li	 <Frank.Li@nxp.com>, Martin
 Kepplinger-Novakovic <martink@posteo.de>, Rui Miguel Silva
 <rmfrfs@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sascha
 Hauer	 <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 imx@lists.linux.dev
Date: Fri, 26 Jun 2026 08:47:52 +0200
In-Reply-To: <20260626000715.1111803-2-vincent.cloutier@icloud.com>
References: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
	 <20260626000715.1111803-2-vincent.cloutier@icloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-65690-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vincent.cloutier@icloud.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:kernel@puri.sm,m:vincent@cloutier.co,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:mchehab@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[icloud.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[p.zabel@pengutronix.de,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,puri.sm,cloutier.co,ideasonboard.com,posteo.de,gmail.com,kernel.org,pengutronix.de,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,cloutier.co:email,vger.kernel.org:from_smtp,pengutronix.de:mid,pengutronix.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18DA06CAC04

On Do, 2026-06-25 at 20:06 -0400, Vincent Cloutier wrote:
> From: Vincent Cloutier <vincent@cloutier.co>
>=20
> The CSI-2 software reset helper currently asserts the reset control and
> then releases it again unconditionally.
>=20
> That release step is required by the i.MX8QXP path, but it changes the
> reset sequence used by i.MX8MQ. On Librem 5r4, which is i.MX8MQ-based,
> the unconditional release step prevents the camera pipeline from producin=
g
> frames after reset; captures time out waiting for EOF from the CSI bridge=
.
>=20
> This series enables the Librem 5 rear camera on the second i.MX8MQ CSI-2
> receiver. Keep the i.MX8MQ path on the known-working assert-only software
> reset sequence while preserving the explicit release step for i.MX8QXP.
>=20
> Make reset release opt-in through platform data.
>=20
> Tested on Librem 5r4 with the existing HI846 front camera and the S5K3L6
> rear camera added by this series.

I think you are missing [1] ("reset: imx7: Correct polarity of MIPI CSI
resets on i.MX8MQ") instead.

[1] https://lore.kernel.org/all/20260619073115.3778313-1-robby.cai@oss.nxp.=
com/


regards
Philipp

