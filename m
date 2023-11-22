Return-Path: <linux-media+bounces-688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAC77F3BEC
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 03:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3DDEB21882
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 02:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57EA3C0B;
	Wed, 22 Nov 2023 02:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkAi4iO6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B99D90
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 18:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700621101; x=1732157101;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=huSRGWuTirnPsTEnc3kAYNHOQFF/1DYGdlcpUSTsjrA=;
  b=dkAi4iO6oHdwxjgaIjkHMXfD5yVTppP8Gkud7BfxbRNVHrsyw+zX60c1
   aWNXOoRFwcGEqhy4KZjtWB46JIEAblREysPnq1YZTuPa8QDCsD/VNcOYW
   ygGrj7yn2NIle3IFiAztS0GdSPbxGK2gqp4POej4rjq0fFQFVIKuuHyyY
   2gZ+v2nb1rjmCA/WEGa9qhJXdUT14gcEADMjRwB+G7SGjkdcgZDGRhpSg
   gvzJ3UcOQNe15l1ufzHNYo8XaDIMmZGqJ95M/ci6zb+cOCIFWflAQckpi
   7I5E0/CfCMi3h1IwQkgMKqzwkCD7N43oDePFm/dPiO6KuIyjRHKJ1Fi/o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="371319994"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="371319994"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 18:45:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857508558"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="857508558"
Received: from icg-kernel3.bj.intel.com ([172.16.126.107])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2023 18:44:58 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: hdegoede@redhat.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v2 0/4] Enable sensor's runtime PM before registering async sub-dev
Date: Wed, 22 Nov 2023 10:54:06 +0800
Message-ID: <20231122025411.2961572-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Following Sakari's patch:
<URL:https://lore.kernel.org/linux-media/20231102090752.1418132-1-sakari.ailus@linux.intel.com/>

The sensor device maybe accessible right after its async sub-device is
registered, so runtime PM should be ready before its async sub-device
is registered.

---
v1->v2: move pm_runtime_idle() together with pm_runtime_enable()
---

Bingbu Cao (4):
  media: imx355: Enable runtime PM before registering async sub-device
  media: ov01a10: Enable runtime PM before registering async sub-device
  media: ov13b10: Enable runtime PM before registering async sub-device
  media: ov9734: Enable runtime PM before registering async sub-device

 drivers/media/i2c/imx355.c  | 12 +++++++-----
 drivers/media/i2c/ov01a10.c | 11 +++++++----
 drivers/media/i2c/ov13b10.c | 13 ++++++++-----
 drivers/media/i2c/ov9734.c  | 18 ++++++++++--------
 4 files changed, 32 insertions(+), 22 deletions(-)

-- 
2.42.0


