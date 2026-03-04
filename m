Return-Path: <linux-media+bounces-54533-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL9HDs2dqGmHwAAAu9opvQ
	(envelope-from <linux-media+bounces-54533-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 22:02:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB29C207CAA
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 22:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5C4C302D952
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 21:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F111A386C08;
	Wed,  4 Mar 2026 21:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d7zhqCPR"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6173845D3;
	Wed,  4 Mar 2026 21:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772658085; cv=none; b=XRdZC9t2v5LFExvojsKBimyOoP2K503LvILOS+jpPQJyexSJX+5ejN5Rd4BfB5VVxT2dGnok++R+HF+Pb3y3iwg0PdbFjAQLNaZfJ1+gCQTxI1VrNU/9LzdNw4o0rK3c965+/K+eyrdocjf13a7r8Lh5X7VKMZuwnAxrwNbu1Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772658085; c=relaxed/simple;
	bh=NHH8SBtZtWB7oWeNE/nBz0iDxmUAd/1nD1eoFs5xpMo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pLidyJeGYpSW8jhwW35RBCE+lMI6cvBSJQbNnok+/WjuhK1bPacv030tYq0tjjaw2rCim4UxlDyl31+4HTIknHzUJmZ19FMuzK5KO5bl/HLARS/dudX9rZBJ5VK5ucwjhYGUvPfie7Q90u5Ich8WOTNj7aZp/w7lIT8nA3UTRMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d7zhqCPR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772658082;
	bh=NHH8SBtZtWB7oWeNE/nBz0iDxmUAd/1nD1eoFs5xpMo=;
	h=From:Subject:Date:To:Cc:From;
	b=d7zhqCPR2H904v31dWDKFETKjTzLVAdJNlokaggb0/y86gvLCYDEiaT4eCDLeEk/z
	 hna1M7B16kbB8OUR8ba6md9Xrb3vF9WGaEorHd42S/onyJYp5BKyuw65WqP3Br9+VZ
	 tsSuPyDq4zBBixeX7k5710chLolNBrTp7HpwFbWAUR99siCjH9fMZXNm1nFwFGQUiE
	 t09ek7dodB76scI+XmTXkHGwfs4ZCoYEThw6yNPMys2sBxVEdlMNFoo6DR8evqJ7uG
	 aTTgZwP+7bkT/vJO5fpdphkqC90Uoj7QMaxUSZKetnVfzMsJ1Wl8N1z/+BxzzVTQN+
	 f1/FS29V2qM+w==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE5A017E0DC0;
	Wed,  4 Mar 2026 22:01:21 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v5 0/4] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576/RK3588
Date: Wed, 04 Mar 2026 23:00:39 +0200
Message-Id: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NwW7CMAzG8VdBOc9T4tRpu9PeA3FIHBeiMTKlU
 wRCffcFTgiB2PH/Sf75rGYpSWb1sTqrIjXNKR9a0NtK8c4ftgIptlao0WlECzUKQ5Et5BKlQPm
 y1DtgRmEnmmQcVLv9KTKl49Vdb1rv0vyby+n6pprL+kqsBgyQ02PvyLkQ7Sfn/d6HXPw75291U
 Sv+S0LQEP3UjR3GiTU+kuytRM8k2yTyKEFMMMYPj6TuVnLPpK5JYYg9Ru4JSd9Ly7L8ARiBtoq
 cAQAA
X-Change-ID: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 linux-media@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: AB29C207CAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54533-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

When building device trees for the RK3576 based boards, DTC shows the
following complaint:

  rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"

The first two patches updates 'reg-names' property in rockchip,vdec
binding to make it mandatory for RK3576 & RK3588, since this is what the
driver expects, as well as to allow providing the register blocks
following the address-based order and, consequently, ensure the video
decoder unit address points to the primary register range.

The next two patches reorder 'reg' and 'reg-names' for the impacted
RK3576 & RK3588 vdec nodes.

While the binding changes introduce an ABI break, the expected impact on
potential users should be minimal, if any, since the old SoCs are
unaffected, while the video decoder support for these newer variants in
mainline driver and devicetrees hasn't been released yet, it just landed
in v7.0-rc1.  Therefore this series is intended to be part of upcoming
v7.0 kernel release.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v5:
- Addressed feedback from Krzysztof and Conor resulting in further
  updates to the commit descriptions, as well as marking reg-names
  required for RK35{76,88}, handled in a dedicated (prerequisite) patch
- Collected R-b and (re)added Fixes tags indicating patches should land
  as part of the upcoming v7.0 release
- Link to v4: https://lore.kernel.org/r/20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com

Changes in v4:
- Removed the unnecessary one-entry item from the reg-names oneOf clause
- Minor adjustment of the commit descriptions as 'function' naming was
  not used in the context of the older SoCs
- Link to v3: https://lore.kernel.org/r/20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com

Changes in v3:
- Mark the current 'reg-names' listing in the binding as deprecated and
  introduce an alternative 'link,function,cache' one
- Drop the Fixes tags from all patches and updated commit descriptions
- Link to v2: https://lore.kernel.org/r/20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com

Changes in v2:
- Added patch for updating rockchip,vdec.yaml binding
- Added patch for updating RK3588 vdec nodes
- Link to v1: https://lore.kernel.org/r/20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com

---
Cristian Ciocaltea (4):
      media: dt-bindings: rockchip,vdec: Mark reg-names required for RK35{76,88}
      media: dt-bindings: rockchip,vdec: Add alternative reg-names order for RK35{76,88}
      arm64: dts: rockchip: Fix vdec register blocks order on RK3576
      arm64: dts: rockchip: Update vdec register blocks order on RK3588

 .../devicetree/bindings/media/rockchip,vdec.yaml   | 22 ++++++++++++++--------
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 12 ++++++------
 3 files changed, 23 insertions(+), 17 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98


