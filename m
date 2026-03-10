Return-Path: <linux-media+bounces-55054-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCUcJ3zar2kzdAIAu9opvQ
	(envelope-from <linux-media+bounces-55054-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:46:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C542478F4
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A86B43064CF4
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EF14301AB;
	Tue, 10 Mar 2026 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="fT5cMsFZ"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F31136827B;
	Tue, 10 Mar 2026 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132271; cv=none; b=X4Ofn44qJb2xdfOK2/dVT5GVQ6i50I05TswqldSnW0+F7xWfONc+L7pguL+wZ7Y28urayGqv73+HLh0E7oDT8UocVKNvm/kQnpxTeSl+txhwgtSs95p405MQFQeXFf8PL0jgS1dYiVP4cbFsUK+cMCIl4sey9Vs09Pl7Lt2NBmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132271; c=relaxed/simple;
	bh=x4SOnHKXXQbowMIWvcYVrwE1RkVQ2mphrd4QHH7FDxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oumY7WFQcDyqA80pNyB0A5SRRH+yvyWJA37B7taVbRJ4zHlmc2tXNyICh4YVnDrfUQgGpGmw7y8YeICaL6TY6oT5UCmvdE9mHiGSAPxdFJERQo/MQ/UC590jmCtQByOLFsCBY0+LLXd60cLbxmtl7/u3Igjnzst/DFFTXkyDHgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=fT5cMsFZ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=bpD5NoxtizmPqHZoG2v1zD3kMN7TqUhqxGbUTcYDjOA=; b=fT5cMsFZM7UhJIUYmz8AlXMJVJ
	eGThAa2YjlC9LmkfI8+pPI2b9fs3FAN8qJxtsgvju89DlrGI9w2fiLzIFGdAs+Ly2vO0iYPMe8Cdo
	xWtPycH8ncvZBU+qtEpiUYCXeSUnJN/U6aaExRrvy45SP2bCL0pnpIRPINj4/X1oImluK3cCcwdD2
	KWYI9b0ZUgU4W/gbmtAcwP6Q7P0bravi92cQ8k9FAQZ8KdU0rk1fLAndGWlOi+bHFiLNIpuITSIKe
	Zol9mzrw1Dc9XRGuy4KzmgCZsv4dLCL3uOKWYZetoKTwmk2M0v4hG/yS1yzCOP0L6hAc4l+7VCWs/
	eguzc2oQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-media@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject:
 Re: [PATCH v5 0/4] arm64: dts: rockchip: Fix vdec register blocks order on
 RK3576/RK3588
Date: Tue, 10 Mar 2026 09:44:21 +0100
Message-ID: <4358847.1IzOArtZ34@phil>
In-Reply-To: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
References: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 16C542478F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55054-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[sntech.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sntech.de:dkim,27b00000:email]
X-Rspamd-Action: no action

Am Mittwoch, 4. M=C3=A4rz 2026, 22:00:39 Mitteleurop=C3=A4ische Normalzeit =
schrieb Cristian Ciocaltea:
> When building device trees for the RK3576 based boards, DTC shows the
> following complaint:
>=20
>   rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@=
27b00000: simple-bus unit address format error, expected "27b00100"

[...]

> Cristian Ciocaltea (4):
>       media: dt-bindings: rockchip,vdec: Mark reg-names required for RK35=
{76,88}
>       media: dt-bindings: rockchip,vdec: Add alternative reg-names order =
for RK35{76,88}

due to media "applied" messages most of the time not reaching all Cc'ed
recipients, please tell me once the binding patches landed somewhere.

Thanks a lot
Heiko

>       arm64: dts: rockchip: Fix vdec register blocks order on RK3576
>       arm64: dts: rockchip: Update vdec register blocks order on RK3588
>=20
>  .../devicetree/bindings/media/rockchip,vdec.yaml   | 22 ++++++++++++++--=
=2D-----
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  6 +++---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 12 ++++++------
>  3 files changed, 23 insertions(+), 17 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98
>=20
>=20





