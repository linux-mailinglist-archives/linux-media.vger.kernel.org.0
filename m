Return-Path: <linux-media+bounces-60963-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B1HBlE6/mkroAAAu9opvQ
	(envelope-from <linux-media+bounces-60963-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:32:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE84FB247
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51543306367D
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 19:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595B5423153;
	Fri,  8 May 2026 19:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmQf8gWa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C633264F2;
	Fri,  8 May 2026 19:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268718; cv=none; b=L20pp28G01BtTnUCPV+en/Vopvb53kkE9V7nuVrC1bzJlTSJH2YK/LlDw88+bcNsNtTKUPcswZc02p29aph9LJnQRGd6lESI3Mra4QSOJt/vyyg/Yrhfj8M6/VIb4b9QLGB2VSpfmI9kHSuQHA/ePv2hSWSpPFOU24nHKTJ4vqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268718; c=relaxed/simple;
	bh=zcj5tPO8EGUHQ3PblHwCpCRwy3qPyWzeVvgrXptAkfI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dydTAZpZl6bZWsupWjmAQ7q6jOs4oM6iUL3+qt4lOhu0gdjeWvdNsBQiP9dvpdCQRN9vQGmBtHcMH8ObJV2mAy+6Shm94lWeN2cI9Q14aJ4HISzB7xfRTqQrOtSQo9h3RLgu7/HlTmuy/fUfDolYcPxXfxPqJSIOWJDb2xS7hQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmQf8gWa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C5D4C2BCB0;
	Fri,  8 May 2026 19:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778268718;
	bh=zcj5tPO8EGUHQ3PblHwCpCRwy3qPyWzeVvgrXptAkfI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UmQf8gWaZyEYzOT8y6fs3633M6LUrsASW3Fva38bb8QWqL9fh/kC3USOMe31xStDw
	 o8z4nc9aXszjWwrZphJZ+e9jZ7OqYoQIqIcuNrpuZrjZqZ7G7UvoXaSmTzJ51RAJjE
	 PPgPXJz4yBwps5c0COTea2cHsQ2nzY+mfZq+vb6x1lKsm5bjNuETeVn4LbcNttm00y
	 fVQjH2byGJ183Bxmy/6v6RtAfcBZYJ1ytg1eGfCNVvBuzNwGEgCnGefwM73VGSJfSo
	 dCINePI9k6zxlLNi4i2k6B8eeT2Jb/h52YpR2J7sPm0pZmntfv/CZkbNCIjY1T8qZz
	 aGGgIXXrmm35A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B87BCD37AC;
	Fri,  8 May 2026 19:31:58 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v4 0/8] media: rockchip: rkcif: add support for rk3588
 vicap
Date: Fri, 08 May 2026 21:31:43 +0200
Message-Id: <20260508-rk3588-vicap-v4-0-6a6cd6f7c90b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACA6/mkC/33PTW7DIBAF4KtYrEuFYbDBq96jyoKfoUZNg4MT1
 Cjy3UtsRa2qKMs30nxv5kpmzBFnMjRXkrHEOaZDDfDSEDeawwfS6GsmnHHJQDCaP4VUipbozES
 1bztwSnJlelJXpowhfq/c+27LGY/nqp624S86NJUExvlGdnfSaiuC1lwGgKEo8veQdUeyru3uZ
 7g5Uj+NF+o0em48OK/DUFpyax/jfEr5sv5WR7f6x2+UljJqhfU+9KB1C28u7ffGpmxeXfpascK
 fAbwCfe9RImoGCh8B4hkgKoBCIXClOuXcf2BZlh/OrLhbrAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778268716; l=5682;
 i=michael.riesch@collabora.com; s=20260428; h=from:subject:message-id;
 bh=zcj5tPO8EGUHQ3PblHwCpCRwy3qPyWzeVvgrXptAkfI=;
 b=QfbZin3HGccgWUmIGD7UhdPllAKhiJVq+tje5bF0sxrheQ5A5YX3+5LUERfQfOJC6dkEkVBpY
 C/WG+Nkt1ZpCUsGYZq2HWUqhvCD3wbsDIwAwqyit6WWuHzHYgwVE0sg
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=tAbmpPTE1MELYweXqqDU40fa18uCO6s32GJL/RzyW2Y=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20260428
 with auth_id=759
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Rspamd-Queue-Id: 94EE84FB247
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-60963-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,posteo.net,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com]
X-Rspamd-Action: no action

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
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 187 ++++++++++++++++++---
 arch/arm64/boot/dts/rockchip/Makefile              |   7 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 143 ++++++++++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      |  99 +++++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      |  99 +++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 141 ++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |   2 +-
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  18 ++
 12 files changed, 734 insertions(+), 25 deletions(-)
---
base-commit: bc1ba628e37c93cf2abeb2c79716f49087f8a024
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



