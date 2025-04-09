Return-Path: <linux-media+bounces-29702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DC0A819EA
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 02:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED8821906341
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 00:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E644DA04;
	Wed,  9 Apr 2025 00:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rU+4sAyL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE86B67E;
	Wed,  9 Apr 2025 00:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159123; cv=none; b=N5Q4rHJGFIDeqNdi6ODucLqIyzz1OUKRorL13z/FwaPxq5oxAkljIisXtnZLMCm6F+YYTu3/ZniiK7Log6lbOkTfhQMfpNqIvG0YOKv8rp+e3rfHQqPDMDxFeTS0r08UnJeeA9rAPMkZ+hIDljD7f5N0RVXdw1h1Oky6QkZwguU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159123; c=relaxed/simple;
	bh=OHgNql4AQJVfdCqx1U/8vI49/FwzbukmKa3wx9G8yEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PwHTA9n9O18YQFqZfiRvQPTua/m/Fieilk8VCGES7uSdN5MQxtnETlUvWB9qepuoCA9Qc75fuqHBgB+8OkcgAzHzxDRqNyOh6tgOl6Ak7RygR1tN4nvRgu9rkUn18BxS13gLFMbWKOvQtB9ULiBVuYvy50tC97vZ16Iy/VaGj74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rU+4sAyL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68AC882E;
	Wed,  9 Apr 2025 02:36:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159002;
	bh=OHgNql4AQJVfdCqx1U/8vI49/FwzbukmKa3wx9G8yEw=;
	h=From:To:Cc:Subject:Date:From;
	b=rU+4sAyLqegRkPlgs9iA/vjXI6iUjlFqPg3wu4R2zP8xX2GaMeOLcfTVzdbxFM4w6
	 VvoxP/qKyebBbSHZjB6fk1DBIWUfy+FefGSp8qa6z3aqm5E6Uk9dbQ+tXwQ2QpJNxC
	 72oshZU7HMp5UMztEPZD1CE8C0FDUAUDHF3sTNFY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 0/6] media: renesas: vsp1: Add colorspace support
Date: Wed,  9 Apr 2025 03:38:09 +0300
Message-ID: <20250409003815.10253-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series extends the VSP1 driver with colorspace support. It
turns out that the VSP RPF and WPF entities can convert between RGB and
YUV, a feature that we have failed to test so far. The hardware support
BT.601 and BT.709, in both limited and full range. Proper configuration
of colorspace is crucial for accurate image rendering.

Patch 1/6 starts by implementing pixel format enumeration in the driver,
a feature that was surprisingly missing. Patch 2/6 then continues with
another fix, restricting the creation of the HSI and HST entities to VSP
instances that include them. Following with another fix, patch 3/6
addresses format setting on the RPF and WPF source pad to disable HSV
<-> { RGB, YUV } conversion, a feature *not* supported by the hardware.

After those initial fixes, patch 5/6 starts implementing colorspace
support by reporting the related information to userspace. The driver
currently hardcodes limited range BT.601 when programming the hardware,
so that is the value that the patch reports to userspace for YUV
formats. Patch 6/6 finally makes the YCbCr encoding and quantization
configurable.

The series has been tested with the vsp-tests suite. Patches that add
CSC support to the test suite will be posted soon, in the meantime you
will need to use the csc branch ([1]). Updates to media-ctl and yavta to
support setting colorspace on video capture devices and on subdev source
pads are also needed. The corresponding patches have been posted to [2]
and [3] respectively, I expect them to be merged soon.

The series has also been tested with the latest v4l2-compliance. The bad
news is that the test flags 56 errors when run on a Renesas Salvator-X
2nd version board based on r8a77965:

Grand Total for vsp1 device /dev/media1: 757, Succeeded: 701, Failed: 56, Warnings: 0

The good news is that none of those are regressions, quite the contrary:
without this series applied, the total number of failures is 95, and the
diff shows no new error. I will therefore address those issues
separately.

[1] https://git.ideasonboard.com/renesas/vsp-tests.git/log/?h=csc
[2] https://lore.kernel.org/linux-media/20250408161051.10472-1-laurent.pinchart@ideasonboard.com/T/#u
[3] https://lore.kernel.org/linux-media/20250408233323.7650-1-laurent.pinchart@ideasonboard.com/T/#t

Laurent Pinchart (6):
  media: renesas: vsp1: Implement pixel format enumeration
  media: renesas: vsp1: Make HSI and HST modules optional
  media: renesas: vsp1: Fix HSV format enumeration
  media: renesas: vsp1: Fix media bus code setup on RWPF source pad
  media: renesas: vsp1: Report colour space information to userspace
  media: renesas: vsp1: Allow setting encoding and quantization

 drivers/media/platform/renesas/vsp1/vsp1.h    |   1 +
 .../media/platform/renesas/vsp1/vsp1_brx.c    |   9 +-
 .../media/platform/renesas/vsp1/vsp1_drv.c    |  59 +++---
 .../media/platform/renesas/vsp1/vsp1_entity.c |  22 +-
 .../media/platform/renesas/vsp1/vsp1_entity.h |   2 +
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  11 +-
 .../media/platform/renesas/vsp1/vsp1_pipe.c   | 188 ++++++++++++++++--
 .../media/platform/renesas/vsp1/vsp1_pipe.h   |   5 +
 .../media/platform/renesas/vsp1/vsp1_rpf.c    |  29 ++-
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  53 ++++-
 .../media/platform/renesas/vsp1/vsp1_sru.c    |   9 +-
 .../media/platform/renesas/vsp1/vsp1_uds.c    |   9 +-
 .../media/platform/renesas/vsp1/vsp1_video.c  |  50 ++++-
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |  29 ++-
 14 files changed, 407 insertions(+), 69 deletions(-)


base-commit: 9ddc3d6c16ea2587898a315f20f7b8fbd791dc1b
-- 
Regards,

Laurent Pinchart


