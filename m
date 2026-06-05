Return-Path: <linux-media+bounces-63935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FcGGDTHtImpHfQEAu9opvQ
	(envelope-from <linux-media+bounces-63935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:37:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CD36495E2
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:37:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="O5/WDvK5";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63935-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63935-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 403DD30EE661
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 15:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1884D2EF7;
	Fri,  5 Jun 2026 15:26:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CA64183D3;
	Fri,  5 Jun 2026 15:26:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673201; cv=none; b=pqlRFXS1TtuqYRLbrFZkS3Xqa5n+mUfFmfZHBOHrWqAR/WEp9sLT56N381r4p6pJ63q2XJYY/3paKigcqEZsM6CH3FDdUqQY7vl8t15agbIP97bh+bRmvLRHElO3sQxd1xUFIKSlF8/FlOMCGbLYYCZHXPoflhYV60WK9iiP/EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673201; c=relaxed/simple;
	bh=ua25xHemMar1Qkad5fZ2bNzjU0J5bg5iyea5aIq5xmQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jH0Pw3DXCJC1qBGkxsMbP9hL4G+ysNFWuPOqMHUWGrCb6LU5nBXD4c4SHPgGK9JKqrKS02hxldr+LZQ8yrI1OsYIV00wh1M9TQqz4FEoXH6o4ZTQgG3Pe4OlCH/vfUJWxkWhdb5UwBToW39XtZYwv0MVQ0LrVS2sz/A5iPC4sWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O5/WDvK5; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C18DC20EA;
	Fri,  5 Jun 2026 17:26:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780673173;
	bh=ua25xHemMar1Qkad5fZ2bNzjU0J5bg5iyea5aIq5xmQ=;
	h=From:Subject:Date:To:Cc:From;
	b=O5/WDvK5ZRIR/frR3+5edwp2CPP+r/ujA3vNCylnf1PQGL2ERKhDA4b5JbXHPMwP8
	 v1F7Y3cwafL8UcrvQjqAoYfPBgHZZ1YsTDTjKAK1CJT/Oc6Wx58y0PEUesPFJdC+pn
	 kF+pIO9k1aGlfvXiE8HUKtHKoL2gPjJhKN3Q9vQI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v4 0/2] media: Add bindings and driver for Sony IMX678
Date: Fri, 05 Jun 2026 20:56:27 +0530
Message-Id: <20260605-imx678-v4-0-58e57c67143d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WQy2oDMQxFf2XwOi5+yBpPVv2P0oUfcuLFjFt7O
 qSE/HudBEKg7fJe6RyQzqxRzdTYfjizSltuuSw9wG5g4eiWA/Ece2ZKKBRGap7nE46WmyAd0RR
 kDIn15Y9KKZ9uorf3no+5raV+37ybvLa/FJvkgmuRgpk0RZvca47kWll8cTW+hDKzq2lTzzQ+a
 NVpsAZcQBkx+X9o/UQr8aB1p603acIRwSL9QV/uZ1X6/OpvWe+3Me8a8T6f87oflIEEE2ogkuh
 GLeUIUTnS4IMRPpoEhnrdZZcf9d/UWGsBAAA=
X-Change-ID: 20260513-imx678-5c1aee9c1dcf
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Lachlan Michael <Lachlan.Michael@sony.com>, 
 Ryuichi Tadano <Ryuichi.Tadano@sony.com>, 
 Kengo Hayasaka <Kengo.Hayasaka@sony.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4174;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=ua25xHemMar1Qkad5fZ2bNzjU0J5bg5iyea5aIq5xmQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqIuqk0NdbF7HwkaDbBTajVsYAS6t8X67GmaFWl
 TutQIfSnHWJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaiLqpAAKCRBD3pH5JJpx
 RWy2D/42YOoUSuFaLrdgUhYF9Q8rmVcup3Cy9PF6OQk2AiZV2idG2GJXWvB+ltAx+wr2MOOWazL
 w5xHu7bV/zjgFkLv6gvZC1UFB6uq/kmF8Frsy9357Ph240DtDd88CP5Mw+Ru3MoAzCIUaj0Z+Cf
 GyIxMIwzMK7+nZHgsqwMt6nz6wGAwdX+Z18+gBBCrekaKgjABHbevcUSlSXR09LYjRhyzmw00bU
 Wbl0KMsIrQUQg75VsiTiv6Jzvn9NksX9iXYSxWN65H+Bk5XO1REFwcm8UHRJ4XakWdqldVq+Z2b
 iQQA0Q+lhRzvWGTSoovq281WvP0AMj+FU2EXp90hBTFa29S49cv8G+uM0pO3eX0RPBNo4QLtd7j
 PciZIYpl40J7LZBv4JgaPScnzMlOOcupZ3z4mN9Ukv0cs0Asx1Pk/06s8TdUPUbK/gbTWu1nK6u
 KYNEJLFyaehPIzozUFZg5DY8bzr60BxiEDgcyYHzi/26rxjXrupi2rC+nbg/n1k0EUej9RMPgy6
 1/hHoPBTRUco0SRvO/X/4PkWAHLVrrN+JqP1jtJWY3YZTXg+nnjtGiAX6S7MZwgiGaUktv2aVsc
 I9BLe7yLGPfH9/a4AqG99KLF6nkmkAAoJva3wI6TryDvbJXBCbhPpHYXDQDUcbMJaUEOBQSyzBa
 LLJK8Au5NNuGHsw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-63935-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2CD36495E2

Hi,

This series adds dt-bindings and a V4L2 driver for Sony IMX678 camera
sensor.

More details about the sensor and features supported in the driver are
in the relevant patches.

Support for binning and cropping has been dropped from this series, in
favor of implementing it with the new raw sensor model proposed by
Sakari. [1]

I still have a branch [2] with patches for binning and cropping using
the old model of S_SELECTION/S_FMT on the source pad, fixing the
comments I received on v3 of this series, in case anybody wants to test
or use it while the raw sensor model support is a WIP.

[1]: https://lore.kernel.org/all/20260409201501.975242-1-sakari.ailus@linux.intel.com/
[2]: https://github.com/jailuthra/linux/commits/imx678-v4

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v4:
- Drop support for freely-configurable resolution through cropping and binning
- Expect both specific and generic device name in device tree compatible
- Reduce analogue gain maximum to 100 (30dB) as the gain register
  includes digital gain from 101 (30.3dB) -> 240 (72dB)
- Minor bug fixes and cleanups following review comments from Sakari,
  Tarang on v3
- Link to v3: https://lore.kernel.org/r/20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com

Changes in v3:
- Use `reset-gpios`, mentioning the sensor XCLR acts like RESETN, instead of `xclr-gpios`
- Update minimum crop width and height according to the PIX_[HV]WIDTH
  register limits
- Expect the user to first select a crop rectangle using S_SELECTION,
  and then choose one of two sizes (non-binned or binned) in S_FMT. This
  matches what IMX296 already does, simplifying the selection logic
  quite a bit.
- Enumerate only the frame sizes possible for the current crop rectangle
  in ENUM_FRAMESIZES
- Link to v2: https://lore.kernel.org/r/20260516-imx678-v2-0-4854ac61d6fb@ideasonboard.com

Changes in v2:
PATCH 1:
    - Add per-variant compatibles for mono and colour, alongside the
      generic fallback, so the variant can be declared without powering
      the sensor at probe.
    - Rename reset GPIO to xclr as that's what it's called in the
      datasheet, and how it behaves.
    - Reference the generic video interface devices schema and switch to
      unevaluatedProperties.
    - Drop "link-frequencies: true"
    - Drop the T: entry for media.git from MAINTAINERS.
PATCH 2:
    - Treat the pixel rate as a fixed sensor property rather than deriving
      it from link frequency and bit depth. Removes the iclk<->pixel
      conversion helpers, instead using a fixed 8x ratio.
    - Express HBLANK in pixels with a step of 8.
    - Make VBLANK step = 2 and rewrite the exposure register when VBLANK
      changes, so the effective exposure does not silently shift.
    - Fix power sequencing: hold the sensor in reset until power_on, add the
      missing post-reset delay, and disable the clock before the regulators
      on power_off.
    - Drop the "common regs written" flag, program them in power_on.
    - Add variant match data and cross-check the register-reported type
      against DT; rename detect() to identify_model().
    - Use v4l2_link_freq_to_bitmap() and expose the full link frequency menu
      with the configured one as the selected RO option.
    - Drop unused includes and defines, misc cleanups
    - Kconfig: depend on OF_GPIO
- Link to v1: https://lore.kernel.org/r/20260513-imx678-v1-0-30fc593ed8fa@ideasonboard.com

---
Jai Luthra (2):
      dt-bindings: media: i2c: Add Sony IMX678
      media: i2c: imx678: Add driver for Sony IMX678

 .../devicetree/bindings/media/i2c/sony,imx678.yaml |  130 ++
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx678.c                         | 1527 ++++++++++++++++++++
 5 files changed, 1676 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260513-imx678-5c1aee9c1dcf

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


