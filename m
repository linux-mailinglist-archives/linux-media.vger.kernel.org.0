Return-Path: <linux-media+bounces-19739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABE19A0725
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D18F1C223CB
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 10:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1932208D66;
	Wed, 16 Oct 2024 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sM+4KM7g"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512D42071E3;
	Wed, 16 Oct 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074158; cv=none; b=si2FfNrmDc5OluGW/sEm8bK0vZGodc5BH0Aihfg6vlv5YS5LXA3z8L6Sbvq3uqSli6FXBCKEHf8Jipwv4QHFPAcWcyNtLH6CtvriyTuTnhprmKvNSZmoihHuKlZsU3aNL/GaoybpwNww/DN0EuE3N7PMPArfjPNhA72LXWWRWYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074158; c=relaxed/simple;
	bh=M83xBFS9S663CxkeQb0fWjPDQTjOp02H0JrOmRYP17M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tKC4o44R89OX3rC+cPZgk14GFIibGa/eP7UYZAQkJRmA00Bvmdu2G6+fJf1GMAMBz0NVyEFZEWtqf8a8QC9RPxXYiQH38ZqgCAdQQB9Pi1HsR66kbmyQXKiHjjbsSw1mScWMJ62T2VZK74KQwjQ+T1v9AXSYG/2NpTtHJH+1P+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sM+4KM7g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37E5C4AF09;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729074157;
	bh=M83xBFS9S663CxkeQb0fWjPDQTjOp02H0JrOmRYP17M=;
	h=From:To:Cc:Subject:Date:From;
	b=sM+4KM7gVF5iMzI05voPXTSJkOlxmHbMEwUYiUYMg6sUqysD5BQ6MFKG333XoQgcQ
	 PGiBA65U98bcAzfoLIalv2rgp30FJcPHifkCyaU6u7QymhmQzm6rY5Wqt0vS4RYCYV
	 bPDpTEOFFEw0/CNFdj+ZUBhoDBKfCZ+czOFOtgHG51/ykl6lPGbZNR0wkm6Gj4cHvc
	 YRmSB8E5Wn9XYNmZIuuZcG4uXrdnxKVmyCWNnkHfrFMkI/YEVnDRWKK5xZ/+UHt3xP
	 A4pb4KELC+Olp1JOW1FcLI78jbRMxNSOkqY4Er2MtUr9V92PxtlIrYOp1FhNyDHPB8
	 vIXRCqR7Zl6bg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t11Ap-00000004YmO-1gnd;
	Wed, 16 Oct 2024 12:22:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 00/13] Media: fix several issues on drivers
Date: Wed, 16 Oct 2024 12:22:16 +0200
Message-ID: <cover.1729074076.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There are a number of issues that aren't passing on some static analyzer
checks.

Address some of them.

Mauro Carvalho Chehab (13):
  media: v4l2-ctrls-api: fix error handling for v4l2_g_ctrl()
  media: v4l2-tpg: prevent the risk of a division by zero
  media: dvbdev: prevent the risk of out of memory access
  media: dvb_frontend: don't play tricks with underflow values
  media: mgb4: protect driver against spectre
  media: av7110: fix a spectre vulnerability
  media: s5p-jpeg: prevent buffer overflows
  media: ar0521: don't overflow when checking PLL values
  media: cx24116: prevent overflows on SNR calculus
  media: adv7604 prevent underflow condition when reporting colorspace
  media: stb0899_algo: initialize cfr before using it
  media: cec: extron-da-hd-4k-plus: don't use -1 as an error code
  media: pulse8-cec: fix data timestamp at pulse8_setup()

 .../extron-da-hd-4k-plus.c                    |  6 ++---
 drivers/media/cec/usb/pulse8/pulse8-cec.c     |  2 +-
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c |  3 +++
 drivers/media/dvb-core/dvb_frontend.c         |  4 +--
 drivers/media/dvb-core/dvbdev.c               | 17 ++++++++++--
 drivers/media/dvb-frontends/cx24116.c         |  7 ++++-
 drivers/media/dvb-frontends/stb0899_algo.c    |  2 +-
 drivers/media/i2c/adv7604.c                   | 26 ++++++++++++-------
 drivers/media/i2c/ar0521.c                    |  4 +--
 drivers/media/pci/mgb4/mgb4_cmt.c             |  2 ++
 .../platform/samsung/s5p-jpeg/jpeg-core.c     | 17 +++++++-----
 drivers/media/v4l2-core/v4l2-ctrls-api.c      | 10 ++++---
 drivers/staging/media/av7110/av7110.h         |  4 ++-
 drivers/staging/media/av7110/av7110_ca.c      | 25 ++++++++++++------
 14 files changed, 90 insertions(+), 39 deletions(-)

-- 
2.47.0



