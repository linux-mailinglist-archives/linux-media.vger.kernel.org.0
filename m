Return-Path: <linux-media+bounces-54260-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I+sFxefpmlqRwAAu9opvQ
	(envelope-from <linux-media+bounces-54260-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:43:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B921EAED2
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F1E7303AAAC
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 08:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF20388363;
	Tue,  3 Mar 2026 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASA7C3/9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7B337AA91
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 08:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527374; cv=none; b=CNJhsJ4GOM6TQ3OSujijODz+nL1KfturzIEb7DXxwSJFIFN9KYjYU8FzxnAhFLudK24mviV35BgLGCHoUiC0dIxJfcOokYnLEosBJGQdHogp+IlPyYjMK3DQelxMyJWS3naGiiOW/d+ePEd1pf7wXsE2UOHnQqcql94b8S+eCW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527374; c=relaxed/simple;
	bh=KtwBlnc2I6dJ4eOZ4EjMPfuJuBTRHMBICisI5PmzfUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uqdsv6zqBriFEL10ISRAt7h7NcXoY+viEFrxy3h6dk6wRyshiFZqE1xowCa2lQA6Ouhkky2P3BHzqlNLRF//DaEO6Wkga3sCRvU2KxDJkSJ4maE3oVoUQX6zxO5Bf5J/tB0da6WUDCjMRjMt+qM2qq5mJ/LeABqs8Axi8WEb0o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASA7C3/9; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38704f70ea3so94270921fa.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 00:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527371; x=1773132171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=scIblvKwdHM9UE2R1JwRsKiQl+NnqelAVvJdkvvFH1E=;
        b=ASA7C3/9w0vFIunOfnvmPTjinE1iXgapmj7yQ6r2YqZ1YY64hRBEaOIlueBE6/HFJ/
         AXLCtKChGaUTzBrSQzVTfd9CVi2kJAP7afRRhk3ea/BJ9gN3JyHwbq4lg5HlTP4QrOZE
         5QgaUoq7KMIe81QMJqZ0prN6p6sZksZzrLTsNzTz2caOEQTDWBxCbj4gRiqfkFhg2eEU
         IeE98c+BqLQ06UWWO/yskKo8+VL4AAkLtr/PUu6LKm3OBAV3gjJ0GraYUyQcFGtmmepD
         +7Je5CLmIAg779keruLlgZEEMKkAEQ6QcDPepSFxloKk3cTJS0KnOWTCw4wWGm2d8qkW
         0/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527371; x=1773132171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scIblvKwdHM9UE2R1JwRsKiQl+NnqelAVvJdkvvFH1E=;
        b=pDW065o52X+MXhxEoZA5+9Gxg0EaF9wzGHGKsnyJcM/9lRRNy71AfM2Zbg0dCmDZHS
         BDsV37F50RhgR9CN4QWtL+QgKvd8ODQJolfkTViHMxDgrbdHtAA8VGSPwsT0T/WyAngi
         l/YlW7/jJMObgr+VtH650X4AdeNBJJqd9uB9WXElxnUV/aGwUha5+nLh+ItYTvbLctSN
         k7osNAsfg9KewW7suRRgvzeZQ0zphXDWG+wYJ/zIVP9DZ1FkZSyPb+buBHc+LZMn3lyp
         ygMMiJDqumlQU8EkJQ+ls7hywHPNyXxef610BUQMlfmcR6kCdK0c09AM1ovkpF0/gKJs
         ORgA==
X-Forwarded-Encrypted: i=1; AJvYcCXHsxWFxzKHyllo/g/MvcFWiwpgaaaV8tQDsDad87iq9HJXWWZCTb0g0blt7R7hjP17GqNh25L5t0J+Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKxIdu66rQ0rsQeJGr7kvUZVX4x7K/H3yg7AJFlXVyutlMONj5
	SxPZCS7wbwUDroP8f9BJDhhAkHZ3xndlSW/VBhY0e39t6RYbFlfuCSFhNFkBRw==
X-Gm-Gg: ATEYQzwhcmi6bgO38gdS8N7y7AP2O75fjDLdi0jvBYYz5O0X5Am2PzFLH+5kAFuXln+
	i13+yED/sLy+gMxoBCftk+IUtm5vy4nZjnCQxCjzCKAd33Cmu9FRWqTXSE6IChVcJFmBmBFxqtG
	G33kLniyP6rGWdtgfLIAJNQMELU2kOnAPtgKB0GVkSkUqhKTch0AO1r3DP8mb5uFgpzm5CXC8VV
	rJeYB/kfvXMvPXeIrYQRfjcoNp3TocuqcbykdqqtbvQYhwq8lMRjh1YJ0SjduoyZUea0f4yT4Hh
	7ijcTiqkTmt5byH0yeffD3MwaI2qvdQ/ZQOT01jE6IFxNiPgD8x/jOtInsMFQ4HjLF0X5QMMBKs
	6rKB+RQKs+eo5f12Cu+A/tNKcE7OH7yGKk/GqLep2NvFEw6hHvfWgbqBGYnOzY/hrQDofGpg4Oo
	AUpocoJ9fxAwwg
X-Received: by 2002:a2e:a10b:0:b0:388:127c:224d with SMTP id 38308e7fff4ca-389ff34fa10mr103976761fa.22.1772527370524;
        Tue, 03 Mar 2026 00:42:50 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:50 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
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
Subject: [PATCH v7 00/15] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Tue,  3 Mar 2026 10:42:23 +0200
Message-ID: <20260303084239.15007-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B7B921EAED2
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
	TAGGED_FROM(0.00)[bounces-54260-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
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

Changes in v7:
- rebased on top of v7
- kzalloc > kzalloc_obj in mipi.c
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
 drivers/gpu/host1x/mipi.c                   | 592 +++-----------
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
 15 files changed, 1482 insertions(+), 645 deletions(-)
 create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
 create mode 100644 include/linux/tegra-mipi-cal.h

-- 
2.51.0


