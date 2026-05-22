Return-Path: <linux-media+bounces-62577-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EOZDEkvEGrIUgYAu9opvQ
	(envelope-from <linux-media+bounces-62577-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:26:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7176D5B2071
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E349E300D749
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108BA3CAA3C;
	Fri, 22 May 2026 10:17:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5583A7F62;
	Fri, 22 May 2026 10:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445036; cv=none; b=cQiryo0UiNey6Dj5BcdNkqfNeA9v2qzMpfjhFatRzIOqVTkb0XDd6C57+Wcu2U9BdkbZWwUFu/V8YVCUAxVRctFdSP6ZkplzJV86LEIXL9wrE8W+f4WVpq8CGFFDiDVulgdNrPJdOlnzKQZtbHUKgQSXKSaPp+uVBbYKazA3yOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445036; c=relaxed/simple;
	bh=s9dmwcwZ71kKCbbcMh+MDPbYaPsMCeOL+9L4hEaBbjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=okhJavVVeMADBVDOZ6HWS0oni5afzCSzagBmOyCVNP4V42JQvgFVii1ApsFA69fT70OKxv55chlK+kf2w8YvOt+mjZbemLfjuUFGwPI1z/z688xx9p/mE/AYfaZNQKnKgRm/cueO1ZtHqwaD9eM31h7LgK18m5ZVurOBtjktBYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 49D273700293;
	Fri, 22 May 2026 10:17:03 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id C4F6CB408CB; Fri, 22 May 2026 10:17:02 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 311CAB408C8;
	Fri, 22 May 2026 10:16:56 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
Date: Fri, 22 May 2026 12:16:39 +0200
Message-ID: <20260522101653.2565125-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62577-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.837];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sys-base.io:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7176D5B2071
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series introduces support for the V4L2 H.264 stateless encode uAPI,
core and support in the hantro driver for the Verisilicon VC8000E.

While this is a first version that will likely need some level of rework,
it is already usable for most common use-cases and supports constant
bitrate rate-control.

A GStreamer tree can be used to test the series at:
https://github.com/paulkocialkowski/gstreamer/tree/v4l2codecs/h264enc
And an example pipeline would look like:
gst-launch-1.0 videotestsrc pattern=smpte num-buffers=25 ! video/x-raw,width=640,height=480 ! v4l2slh264enc rate-control=cbr bitrate=8000000 qp-min=8 qp-max=42 ! h264parse ! matroskamux ! filesink location=encode.mkv

Note that documentation for the new uAPI is intentionally left out of
this series since it has not yet received approval.

Marco Felsch (2):
  media: hantro: use hantro_decoded_buffer only for dst_vq
  arm64: dts: imx8mp: add VC8000E encoder node

Paul Kocialkowski (12):
  media: h264: Add a more generic reflist builder init
  media: uapi: Add H.264 stateless encode support
  media: h264: Add SPS video definitions
  media: h264: Add stateless encode core
  media: h264: Add stateless encode rbsp
  media: h264: Add stateless encode reference management
  media: h264: Add stateless encode rate control
  media: verisilicon: Report default pixel coding for non-JPEG and fix
    JPEG case
  media: verisilicon: Cancel job with runtime pm put/clk disable on
    failure
  media: verisilicon: Add common encoder parm and frameintervals ioctls
  media: verisilicon: Add support for the VC8000E H.264 encoder
  media: verilisicon: imx8m: Add support for the VC8000E on i.MX8MP

 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   11 +
 drivers/media/platform/verisilicon/Kconfig    |    1 +
 drivers/media/platform/verisilicon/Makefile   |    2 +
 drivers/media/platform/verisilicon/hantro.h   |   17 +
 .../media/platform/verisilicon/hantro_drv.c   |  180 +-
 .../media/platform/verisilicon/hantro_h264.c  |    6 +-
 .../media/platform/verisilicon/hantro_hw.h    |   28 +
 .../media/platform/verisilicon/hantro_v4l2.c  |  123 +-
 .../platform/verisilicon/hantro_vc8000e.c     |   68 +
 .../verisilicon/hantro_vc8000e_h264_enc.c     |  883 +++++++
 .../verisilicon/hantro_vc8000e_regs.h         | 2129 +++++++++++++++++
 .../media/platform/verisilicon/imx8m_vpu_hw.c |  113 +
 drivers/media/v4l2-core/Kconfig               |    4 +
 drivers/media/v4l2-core/Makefile              |    2 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   62 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    4 +
 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c  | 1173 +++++++++
 drivers/media/v4l2-core/v4l2-h264-enc-rc.c    |  558 +++++
 drivers/media/v4l2-core/v4l2-h264-enc.c       | 1322 ++++++++++
 drivers/media/v4l2-core/v4l2-h264.c           |   69 +
 include/media/v4l2-ctrls.h                    |    2 +
 include/media/v4l2-h264-enc-rbsp.h            |   72 +
 include/media/v4l2-h264-enc-rc.h              |  108 +
 include/media/v4l2-h264-enc.h                 |  135 ++
 include/media/v4l2-h264.h                     |  146 ++
 include/uapi/linux/v4l2-controls.h            |   33 +
 include/uapi/linux/videodev2.h                |    1 +
 27 files changed, 7231 insertions(+), 21 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_h264_enc.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_regs.h
 create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
 create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rc.c
 create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc.c
 create mode 100644 include/media/v4l2-h264-enc-rbsp.h
 create mode 100644 include/media/v4l2-h264-enc-rc.h
 create mode 100644 include/media/v4l2-h264-enc.h

-- 
2.53.0


