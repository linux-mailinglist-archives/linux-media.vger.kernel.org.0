Return-Path: <linux-media+bounces-56012-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yE+6N0oiuWkrrwEAu9opvQ
	(envelope-from <linux-media+bounces-56012-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:43:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3722A7143
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C352D30437C1
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5DB37757C;
	Tue, 17 Mar 2026 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJjgu9C/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B2636EA8B;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739944; cv=none; b=FCcT4jgk5G7lJ36OSqDZo6gsuapONRJMTp+iA0C/ydP9EPF8BKvlDmXhaJ72NcmCiC8xRb6PhRLoYEhD7680njI9rtHaH64a9z/6hGkHtPobs4/Xe2N+Kpkd9xxmSyuJXdRGI2VVlOGJ+ojNxbz5K6xm/3/HOEjadbVb4q7+EVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739944; c=relaxed/simple;
	bh=OScWDJNVIXSkH9JdH7eb/Xp1LXka3za6IEC5iCx5Yj8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G0X5C72SK68UkQ1iCMdJ2EO6AEUCUqs+/CuDgc9UtNDF/bK3u2t2RVAwU913CbVv2EkvsRRb6pL1vJcKvcprmj/9twQqhUA9LoKIRZNqBde2D4mUyaHqIhi1h1jBFuTdvDo4nn8aQXwCPm5tVIDGSLYZ9vqcGtFNKwVMBgrMSoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJjgu9C/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE66DC4CEF7;
	Tue, 17 Mar 2026 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739943;
	bh=OScWDJNVIXSkH9JdH7eb/Xp1LXka3za6IEC5iCx5Yj8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kJjgu9C/3XQjSgBKhqcn5HczX0zhTm17yn5XD78OkbJJ8svjOds9OIt4MsbCkCn0n
	 7i1/aBggUjlOddzTmk0jb4bFyLWiQQNba+sLWoOuWJAeDbOb7SutPr2YUFC5liiiMf
	 kk41B4T84ofC3tvHm6oXhWKEbMsESq2o2V9DRwQiSiGqhek9B0T406jpjdtLf8E8L4
	 nWejI5Z/OjBeHKG68vefR4AhvEom9jJ8yD77zPpJi9A9qQicwweE4ikuCdGQDAOFy4
	 iZMmodQn4AVVFkOIls5gcBKakrdG9wWBcKhO4S0lW8FkNlnh2rSVp5JibpB+dMGIp3
	 gjBb2lmv00gfA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF397F33825;
	Tue, 17 Mar 2026 09:32:23 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v2 0/9] media: rockchip: rkcif: add support for rk3588
 vicap
Date: Tue, 17 Mar 2026 10:32:18 +0100
Message-Id: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKIfuWkC/22Py27DIBREfyW661DBNTjgVf+jyoJnjPLAhRQli
 vzvIbaidtHljDRnZh5QfI6+wLB5QPY1lpguTeB2A3bUl4Mn0TUNSFFQ3lGSj52QktRo9USUYz2
 3UqDUO2iRKfsQbwvua7/q7L9/GvW6mr/Q1kGRU8QV2b+RRpkuKIUicD5UCX+HLBlBe9a/Z9gSi
 ZvGO7HKO9SOW6fCUBm82sdYrinfl2/NetX/f6MyQonpjHNhx5Vi/NOm00mblPWHTWfYz/P8BA0
 k94QqAQAA
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739942; l=3744;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=OScWDJNVIXSkH9JdH7eb/Xp1LXka3za6IEC5iCx5Yj8=;
 b=6PadDWPx3oeafAOPBjI+855zmsp4/DBpg0970EhEGcI3wlC9fw5+HzDA3AnGkhnt4ql5h4cfj
 SdE9UDjYeWLCnksoiXzSUbGSndDfQDbNMeo/k4kinKfvi6+jc20ffeY
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56012-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:replyto,collabora.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ED3722A7143
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Habidere,

The RK3588 Video Capture (VICAP) constitutes an essential piece of the
RK3588 camera interface with one DVP, six MIPI CSI-2 receivers,
scale/crop units, and a data path multiplexer (to scaler units, to ISP,
...). This series introduces basic support for the RK3588 VICAP unit
to the rkcif driver, thus paving the way for video capture in general
and for camera sensor image processing in particular.

The changes have been tested successfully on a Radxa ROCK 5B+ with two
Radxa 4K cameras attached to it. The raw images from the sensors can
be streamed after configuring the hardware pipeline with

media-ctl -d 0 --set-v4l2 '"dw-mipi-csi2rx fdd30000.csi":0 \
  [fmt:SGBRG10_1X10/3864x2192 field:none colorspace:raw xfer:none]'
media-ctl -d 0 --set-v4l2 '"rkcif-mipi2":0 \
  [fmt:SGBRG10_1X10/3864x2192 field:none colorspace:raw xfer:none]'
media-ctl -d 0 --set-v4l2 '"dw-mipi-csi2rx fdd50000.csi":0 \
  [fmt:SGBRG10_1X10/3864x2192 field:none colorspace:raw xfer:none]'
media-ctl -d 0 --set-v4l2 '"rkcif-mipi4":0 \ 
  [fmt:SGBRG10_1X10/3864x2192 field:none colorspace:raw xfer:none]'

and using e.g., GStreamer

gst-launch-1.0 v4l2src \
  device=/dev/v4l/by-path/platform-fdce0000.video-capture-video-index0 \
  ! video/x-bayer,format=gbrg10le,width=3864,height=2192 ! bayer2rgb \
  ! ...
(or -index4 for the other camera sensor).

Note that this series requires the RK3588 MIPI CSI-2 receiver patches
[0]. I included them here to provide the possibility to test the changes
without any nasty merge conflicts.

Looking forward to your comments!

[0] https://lore.kernel.org/all/20260305-rk3588-csi2rx-v2-0-79d01b615486@collabora.com

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
Changes in v2:
- modified rockchip,rk3568-vicap binding instead of creating a new one
  (Conor)
- aligned clock names and reset names with rockchip,rk3568-vicap
- Link to v1: https://lore.kernel.org/r/20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com

---
Michael Riesch (9):
      Documentation: admin-guide: media: add rk3588 vicap
      media: dt-bindings: add rockchip rk3588 vicap
      media: rockchip: rkcif: add support for rk3588 vicap mipi capture
      [DONOTMERGE] media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3588 compatible
      [DONOTMERGE] arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3588
      arm64: dts: rockchip: add vicap node to rk3588
      arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam0
      arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam1
      arm64: defconfig: enable designware mipi csi-2 receiver

 .../admin-guide/media/rkcif-rk3588-vicap.dot       |  29 ++++
 Documentation/admin-guide/media/rkcif.rst          |  32 ++++
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |   8 +-
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 191 ++++++++++++++++++---
 arch/arm64/boot/dts/rockchip/Makefile              |   7 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 143 +++++++++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      |  89 ++++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      |  89 ++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 136 +++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |   2 +-
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  18 ++
 13 files changed, 719 insertions(+), 27 deletions(-)
---
base-commit: bb2a3912549d3b5cef5ed27200402fe8f6fb0694
change-id: 20250430-rk3588-vicap-9d164c8528a7

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



