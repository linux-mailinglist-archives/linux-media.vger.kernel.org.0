Return-Path: <linux-media+bounces-51825-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKAqEMCpfGkaOQIAu9opvQ
	(envelope-from <linux-media+bounces-51825-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:53:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DC5BABCD
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0161F30740D2
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34CA37F102;
	Fri, 30 Jan 2026 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHEGwcVk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72347376BF8
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777398; cv=none; b=CcTcrZY1OWHtqXRHT5icLsbwm8W0OpEmEk/5eVpwsgYfOqRVpYXjExhs7kPKdO1XuzmNMsnZpo+IwVodGvA62SJgygKNcXaTuubjnOptuj/TBNaj4RrxMQbQlZ9M8RUmN9IemDKH3pSwxrO8g4epnHzV8B2kAE3C/cpCmHhdT4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777398; c=relaxed/simple;
	bh=HoHrBtYNXY/SaE9OzlXfq5/j1Mx321YZxOI1YdRsAkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RXCj1ouRq3YJ6k4KDBGU+MEgJ6WlNEWAQ32yxRfasC96dWke/tHpce3+czrqXsysyX7RsDHljhXr9/Ci9T2dTqYBmgJs/gnCPKH8rCUFGFhP4lIYb2U7b1v3B9xhWqFQBkHJ7bQ0NXYX95ceRHJmLpUs7JfV283E2P14Ji0Q6YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHEGwcVk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43590777e22so1320379f8f.3
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 04:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777395; x=1770382195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5acCy6OTSjM6pJSucEyPYN85YsF77rdFjU9Wvmbua0=;
        b=RHEGwcVkxtDpG6TYt6FoPFUjzn28eJE8NYOtHvo2cResc+ujOxXeloni3SGqcd+W6F
         MEn3jrDFGxDtluO1XaUGnpq8QZoXYH7QXQlSh61QJSVsiy7rLT3PvdaZ0okLLB7lmpxt
         dEM90+LehMWguZJP5+FVaQhbZF43J0jpzNEg0WUnd5u41Ebja1SxcapGHdJFOBDLgC5Z
         VuYoDIlvicfkeRuVj95Zikj5kE47Pzhc+xIKHE7a/SgbOSplCu7VegAMr0nrC7pSknl/
         vf11QhClv1TfRxWtgEmZnSXli42cViUR+ORL5zqvM+Bur6752uppQkdnPQWfz86Z28zj
         x0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777395; x=1770382195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5acCy6OTSjM6pJSucEyPYN85YsF77rdFjU9Wvmbua0=;
        b=jZDG3KJ92xpn5NSghqjRip6DGkQ2bVquuPog/zRVOki6WPv8qHan4M01ag0x0XGzhE
         RYxuMt3I+MAamabtHT7yqcCuDELV9X4u2FeEHkl+pskT0uisVFrZ6BVsz4AgD4gL18dW
         KPhuFv1pWdCIMBQ4OC2YkxnP9fo1mTDenhSke+0lle9ciLv/v4slpHf5OZWGJism+Occ
         tYKzsbn+4iLdTxplKcfe/evRxRtvSQUh7i2iQ4KiYrib/JKPY41qVwrcaH0t6mXzpTRq
         oa7yykZPTuGQJgl/I6otPCpJ5dZzftBLq1+yafl0fvl+sUo5YCQMwVqP/H9ZgElY3/RC
         SmdA==
X-Forwarded-Encrypted: i=1; AJvYcCWBs+odPt9Clj7Zjo83MqdjSKJFp0d8dCiD0lQneN2RO4Y8ovabskwn89rQeBKTqV9f2seZOBt+44d8xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW3Ct5PJVOGAg2BSxTdd+j4a6K+nzh8JN7oFASTWvarg5WajHq
	/oG9hDp0wWGaFIZp2Qu5nCtb60r5S+5AUmipNMGx4H8gEDxTxvnTTWBp
X-Gm-Gg: AZuq6aLO6+CZgpjXIba/Lf2IgpEHMzownqLrGepWcNdA/FdpAGCHG1EguiBLA/6l9vY
	/DSipmKO+mRG5YZyXkfpocRi+9VZPTJ+sfW0AfopWokbCKY6KqXqyF4TBwuufqWjTG6/oTf8dcb
	HcsqyUTlDk3leUatqlSEE+AzpNqJPAkl7PfEZZrDBqSB9boiTZT5faKc5uC1V8u+BJzzuQ756Qh
	um7AmpB5vXb/pH0ErW6EB86J6h4zMHpUT69DKT+ZJJyBO0cHv/9b1td/a+y2/U8ry41FUYDOZKU
	Dugf/IgAv7FUSWHXW+u5liX2tAPknJ5KzC7h1MgnsqlSkcUHqxao+HXsbx701q6F0M0TIyEAXpJ
	cIy7TFwdaeTnsLTKjs5BfcNKsP0cob9xDY/EVerC00AVudnRsZLKIWJq8JhgUTmJ9ODm2NKbMUg
	Q+
X-Received: by 2002:a05:6000:2404:b0:430:8583:d189 with SMTP id ffacd0b85a97d-435f3aa928amr4307852f8f.39.1769777394637;
        Fri, 30 Jan 2026 04:49:54 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:49:54 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 00/15] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Fri, 30 Jan 2026 14:49:17 +0200
Message-ID: <20260130124932.351328-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51825-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 98DC5BABCD
X-Rspamd-Action: no action

Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
with a set of changes required for that.

---
Changes in v2:
- vi_sensor gated through csus
- TEGRA30_CLK_CLK_MAX moved to clk-tegra30
- adjusted commit titles and messages
- clk_register_clkdev dropped from pad clock registration
- removed tegra30-vi/vip and used tegra20 fallback
- added separate csi schema for tegra20-csi and tegra30-csi
- fixet number of VI channels
- adjusted tegra_vi_out naming
- fixed yuv_input_format to main_input_format
- MIPI calibration refsctored for Tegra114+ and added support for
  pre-Tegra114 to use CSI as a MIPI calibration device
- switched ENOMEM to EBUSY
- added check into tegra_channel_get_remote_csi_subdev
- moved avdd-dsi-csi-supply into CSI
- next_fs_sp_idx > next_fs_sp_value
- removed host1x_syncpt_incr from framecounted syncpoint
- csi subdev request moved before frame cycle

Changes in v3:
- tegra20 and tegra30 csi schema merged
- removed unneeded properties and requirements from schema
- improved vendor specific properties description
- added tegra20 csus parent mux
- improved commit descriptions
- redesigned MIPI-calibration to expose less SoC related data into header
- commit "staging: media: tegra-video: csi: add support for SoCs with integrated
  MIPI calibration" dropped as unneeded
- improved tegra_channel_get_remote_device_subdev logic
- avdd-dsi-csi-supply moved from vi to csi for p2597 and p3450-0000
- software syncpoint counters switched to direct reading
- adjusted planar formats offset calculation

Changes in v4:
- removed ifdefs from tegra_mipi_driver
- document Tegra132 MIPI calibration device
- switched to use BIT macro in tegra114-mipi
- pinctrl changes moved to a separate patch
- ERESTARTSYS workaround preserved for now
- tegra_mipi_add_provider replaced with devm_tegra_mipi_add_provider
- reworked bytesperline and sizeimage calculaion

Changes in v5:
- dropped patch 1/24 of v4 since it was picked to pinctrl tree
- added reasoning for tegra132 comaptible into commit desctiption
- moved clocks into common section in tegra20-csi schema
- added note regarding ERESTARTSYS

Changes in v6:
- dropped patches 1, 2, 3, 4, 10, 13, 21, 22 of v5 since they were picked
- rebased on top of linux next/master
- improved description of commit
  "staging: media: tegra-video: vi: adjust get_selection operation check"
---

Svyatoslav Ryhel (15):
  staging: media: tegra-video: expand VI and VIP support to Tegra30
  staging: media: tegra-video: vi: adjust get_selection operation check
  staging: media: tegra-video: vi: add flip controls only if no source
    controls are provided
  staging: media: tegra-video: csi: move CSI helpers to header
  gpu: host1x: convert MIPI to use operation function pointers
  staging: media: tegra-video: vi: improve logic of source requesting
  staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
    CSI
  staging: media: tegra-video: tegra20: set correct maximum width and
    height
  staging: media: tegra-video: tegra20: add support for second output of
    VI
  staging: media: tegra-video: tegra20: adjust format align calculations
  staging: media: tegra-video: tegra20: set VI HW revision
  staging: media: tegra-video: tegra20: increase maximum VI clock
    frequency
  staging: media: tegra-video: tegra20: expand format support with
    RAW8/10 and YUV422/YUV420p 1X16
  staging: media: tegra-video: tegra20: adjust luma buffer stride
  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30

 drivers/gpu/drm/tegra/dsi.c                 |   1 +
 drivers/gpu/host1x/Makefile                 |   1 +
 drivers/gpu/host1x/mipi.c                   | 525 ++-----------
 drivers/gpu/host1x/tegra114-mipi.c          | 483 ++++++++++++
 drivers/staging/media/tegra-video/Makefile  |   1 +
 drivers/staging/media/tegra-video/csi.c     |  64 +-
 drivers/staging/media/tegra-video/csi.h     |  22 +
 drivers/staging/media/tegra-video/tegra20.c | 820 +++++++++++++++++---
 drivers/staging/media/tegra-video/vi.c      |  58 +-
 drivers/staging/media/tegra-video/vi.h      |   6 +-
 drivers/staging/media/tegra-video/video.c   |   8 +-
 drivers/staging/media/tegra-video/vip.c     |   2 +-
 drivers/staging/media/tegra-video/vip.h     |   2 +-
 include/linux/host1x.h                      |  10 -
 include/linux/tegra-mipi-cal.h              |  57 ++
 15 files changed, 1415 insertions(+), 645 deletions(-)
 create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
 create mode 100644 include/linux/tegra-mipi-cal.h

-- 
2.51.0


