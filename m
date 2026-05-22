Return-Path: <linux-media+bounces-62646-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN0MCSvKEGpAdwYAu9opvQ
	(envelope-from <linux-media+bounces-62646-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 23:27:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B4C5BA6E8
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 23:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5A97304642E
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 21:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEAC38E8D3;
	Fri, 22 May 2026 21:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxoVb17k"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB973890FD;
	Fri, 22 May 2026 21:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484997; cv=none; b=Blgzh9tSff0BpDS0Kv2zXOkO6ugz8fcf1/5Jzb+4c/9rEJrc23rmFL7mTVWQRt2xkhEh6a17p4edS5EhBuzIIwB2JNfzzXawds8zcR7PXk+IuX+znJLWSCaUCxMB5EA7iQ6qRA1uJ9M24v1uZsbci3/JFYmVpvcLvPaovB+F2E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484997; c=relaxed/simple;
	bh=7dBimS9yTMeVi3YGzWSR1N6dnI5S9rFVSVxFqlZzDs4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n/rW/Af9qOHUJuZr5gwQBMC2THIBI4Dzuf3y3+C+LZktIToWwKnvB9P99bNFAkmBDKtfJk/8wEq6pF46xBxvznAsqOhx9tRyoUbCtQVY7tW9Gn9Xp7WJQVXipGAw9CD1HW7r2QhZ+iz7K4rCRAUsDDeBldJT/HqrJxvEv0gqFRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxoVb17k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8943AC2BCB8;
	Fri, 22 May 2026 21:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779484996;
	bh=7dBimS9yTMeVi3YGzWSR1N6dnI5S9rFVSVxFqlZzDs4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nxoVb17ku8eAftySgr3kydzqZrPJzNrru2vTxa4LyhvICMXGvydJZfyFvfaUSVWMr
	 YUndrhGm5q9VV9hlQh4fwU6mZv89MBJhwCi9TYTM5qmAJqc5wqJXD+KjrDMiveDm4x
	 AzJBDCYjYTmUjzegvvp0KsYGa7fPvgpMp1fAQOqrKGJSHOqDaO5K3E7iM5cWsJM3i/
	 gNXlXCJeK6AgXYoZXnVP5wV/TjeUphdpgDvCLqxaXxZppOyg0mD3+lXVk+KPMIH2UR
	 RDPxQ9ZTuFKiCIWsHi9NcnyXZMQJ4zE1zr/69ASEMpKkiETuvhWmn5Zgl+N+9j8glj
	 odHye+QIgD4uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75641CD5BB3;
	Fri, 22 May 2026 21:23:16 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v5 0/8] media: rockchip: rkcif: add support for rk3588
 vicap
Date: Fri, 22 May 2026 23:23:06 +0200
Message-Id: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADvJEGoC/33PTU7DMBAF4KtEXmPk+C92VtwDsbDHY2pRmuAUi
 6rK3XETRaAq6vKNNN+buZIJc8KJ9M2VZCxpSsOpBvXUEDi40zvSFGomnHHFpGA0fwhlDC0J3Eh
 taLUEo7hxHakrY8aYfhbu9W3NGb++q3peh39o31RSMs5XUm+kt15Ea7mKUvbFkP+HLDuK6VZvZ
 8CUaBgPFwoWA3dBQrCxLy25tR/SdB7yZfmtjm71+2+UljLqhQ8hdtLaVr7AcDw6P2T3DMPnghX
 +COAV6LqACtEyaXAPEI8AUQEUBiU3RhuAPUBugGaKmTtAVkA7DUHHDizz98A8z7/NQWSy7QEAA
 A==
X-Change-ID: 20250430-rk3588-vicap-9d164c8528a7
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779484994; l=5953;
 i=michael.riesch@collabora.com; s=20260428; h=from:subject:message-id;
 bh=7dBimS9yTMeVi3YGzWSR1N6dnI5S9rFVSVxFqlZzDs4=;
 b=08Y5G/YTms6gOOd9f+zB0NkpL+MJSfoAlHosLqhn394g01JW12AO4j+B/OjcE/8GTKimI82he
 jDtxBSBXy7xCBR63qlZHNxeH9iMcfkuv5N8DZ+5C0O0nfxYp8uUprmy
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=tAbmpPTE1MELYweXqqDU40fa18uCO6s32GJL/RzyW2Y=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20260428
 with auth_id=759
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62646-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,posteo.net,collabora.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.10:email,collabora.com:replyto,collabora.com:mid,collabora.com:email]
X-Rspamd-Queue-Id: 92B4C5BA6E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Habidere,

The RK3588 Video Capture (VICAP) constitutes an essential piece of the 
RK3588 camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop 
units, and a data path multiplexer (to scaler units, to ISP, ...). This 
series introduces basic support for the RK3588 VICAP unit to the rkcif 
driver, thus paving the way for video capture in general and for camera 
sensor image processing in particular.

The changes have been tested successfully on a Radxa ROCK 5B+ with two 
Radxa 4K cameras attached to it. The raw images from the sensors can be 
streamed after configuring the hardware pipeline with

media-ctl -d 0 --set-v4l2 '"dw-mipi-csi2rx fdd30000.csi":0
  [fmt:SGBRG10_1X10/3864x2192 field:none colorspace:raw xfer:none]'

media-ctl -d 0 --set-v4l2 '"rkcif-mipi2":0
  [fmt:SGBRG10_1X10/3864x2192 field:none colorspace:raw xfer:none]'

media-ctl -d 0 --set-v4l2 '"dw-mipi-csi2rx fdd50000.csi":0
  [fmt:SGBRG10_1X10/3864x2192 field:none colorspace:raw xfer:none]'

media-ctl -d 0 --set-v4l2 '"rkcif-mipi4":0 
  [fmt:SGBRG10_1X10/3864x2192 field:none colorspace:raw xfer:none]'

and using e.g., GStreamer

gst-launch-1.0 v4l2src \
  device=/dev/v4l/by-path/platform-fdce0000.video-capture-video-index0 \
  ! video/x-bayer,format=gbrg10le,width=3864,height=2192 ! bayer2rgb \
  ! ...
(or -index4 for the other camera sensor).

Note that this series requires the RK3588 MIPI CSI-2 receiver patches [0]. 
The dt-bindings patch is already included in media-committers/next and the 
DT patch is already in Heiko's tree. I included the DT patch here to avoid 
nasty merge conflicts.

Looking forward to your comments!

[0] https://lore.kernel.org/all/20260305-rk3588-csi2rx-v2-0-79d01b615486@collabora.com

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
Changes in v5:
- renamed "iclk0" -> "iclk" to simplify dt-binding (Rob)
- fixed power supply name in cam1 overlay (Sashiko) 
- simplified ctrl0 assignment (Sakari)
- Link to v4: https://lore.kernel.org/r/20260508-rk3588-vicap-v4-0-6a6cd6f7c90b@collabora.com

Changes in v4:
- rebased onto latest media-committers/next
- applied Conor's A-b and Mehdi's R-b
- reflowed commit messages
- Link to v3: https://lore.kernel.org/r/20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com

Changes in v3:
- fixed copy-paste mistake "RK3568" -> "RK3588" in docs (Charalampos)
- fixed reg properties of ports in dtsi (port@10 <=> <16>, ...)
- added comment w.r.t. RKCIF_MIPI_CTRL_CAP_EN bit (Mehdi)
- removed redundant minItems and maxItems from dt-binding (Conor)
- revised device tree overlays for the Radxa CAMs according to the
  schematics that I recently received
- Link to v2: https://lore.kernel.org/r/20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com

Changes in v2:
- modified rockchip,rk3568-vicap binding instead of creating a new one
  (Conor)
- aligned clock names and reset names with rockchip,rk3568-vicap
- Link to v1: https://lore.kernel.org/r/20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com

---
Michael Riesch (8):
      Documentation: admin-guide: media: add rk3588 vicap
      media: dt-bindings: add rockchip rk3588 vicap
      media: rockchip: rkcif: add support for rk3588 vicap mipi capture
      [DONOTMERGE] arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3588
      arm64: dts: rockchip: add vicap node to rk3588
      arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam0
      arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam1
      arm64: defconfig: enable designware mipi csi-2 receiver

 .../admin-guide/media/rkcif-rk3588-vicap.dot       |  29 ++++
 Documentation/admin-guide/media/rkcif.rst          |  32 ++++
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 173 ++++++++++++++++++---
 arch/arm64/boot/dts/rockchip/Makefile              |   7 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 143 +++++++++++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      |  99 ++++++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      |  99 ++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 148 +++++++++++++++++-
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |   2 +-
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  18 +++
 12 files changed, 727 insertions(+), 25 deletions(-)
---
base-commit: a3d78e74dd3ed04797ea351edb7f0a19b961c063
change-id: 20250430-rk3588-vicap-9d164c8528a7
prerequisite-change-id: 20240220-rk3568-vicap-b9b3f9925f44:v8
prerequisite-patch-id: 150941d095374b150cd42fb7fc80af6d8dbb8c86
prerequisite-patch-id: 30d5217a4407e6ace34fd4be24a4641648713a13
prerequisite-patch-id: 466779634f7b55d70ac7046915ef5ef506d77976
prerequisite-patch-id: 5df54cf4ca76e8de8537513f8bc7f6c31a5106d8
prerequisite-patch-id: 693172b2bb630bd6e6390c55503cb5860d162124
prerequisite-patch-id: baf24b164ddd829d69ec6a50a870a0d6d281b561
prerequisite-patch-id: eb8ab8365c9772b8329199944c6f9821eef162b3
prerequisite-patch-id: fcc8cbab463cb4350c2b660d27d235d17484eb4f
prerequisite-patch-id: 91f6289b43121946f8e0dbfad3851a30be4b693e
prerequisite-patch-id: 594a59bef892e49482d8d2ed8db02d5ff7375c06
prerequisite-patch-id: da8e3b4a4d7a035e101b9921daa64a3f8e231983
prerequisite-patch-id: c8b88c860169b2c36865935c2624e91b1241888f
prerequisite-patch-id: 39bd0d207bd5edd18e54864c6123871f71f103e0
prerequisite-change-id: 20250616-rk3588-csi-dphy-c9ed2ad4cd9f:v1
prerequisite-patch-id: 8fb47b87efb5bb9a818fc5743e4d0b2d859614b7
prerequisite-patch-id: f0c121481b08b70e32e5d03b166d87e0c0e051e8
prerequisite-patch-id: aa2c6542eaaf49350681ce4d0f124d4b1cc9b9f5
prerequisite-patch-id: 66a77411c75b2acde23a199a4521493949d14a14
prerequisite-patch-id: e1d4bea12bf7688d6dacb9d724ff5dd9078c5975

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



