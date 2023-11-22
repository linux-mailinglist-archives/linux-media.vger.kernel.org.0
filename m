Return-Path: <linux-media+bounces-762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 042027F41C6
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34C8C1C2097D
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 09:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500122031B;
	Wed, 22 Nov 2023 09:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFytwr9C"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6DA8483
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700645821; x=1732181821;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C7hKi/H1ThWCnZJ4JEsrBiXUoOcmko6dROmqwDSP+eo=;
  b=mFytwr9CoVevIm0KO09a8J8jxbYYMTib2UGQpy12HH5xMI07dxX1pRXa
   YJvOHg/73g753qFPjfX7juaZy5DBk5fTYJJ5xXFHE63doYVi1/sabwFdv
   oYWxEQ5AzgPkXypz2QWNLrqBEkVh5rfZjbpirAa0rd9V3eN0zOnq/Dfr/
   pXjUt7vRnEQaPIETClhZez86KfANlr6gVTpJrraFTS1k6SC2+JiHutN6y
   WtHpHud2Z+7Sn7B5Jiayx3HXLrt7fKS2z55SlBwuSGIqAARTlxaXmN2PJ
   zNqPPxXCVJMohInFPd5YwaBcb9bstPD+oo/LizuFr4WIkeuuos0nFNkXj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="377049440"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="377049440"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 01:37:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857662404"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="857662404"
Received: from icg-kernel3.bj.intel.com ([172.16.126.107])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2023 01:36:57 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: hdegoede@redhat.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v4 0/4] Enable sensor's runtime PM before registering async sub-dev
Date: Wed, 22 Nov 2023 17:46:05 +0800
Message-ID: <20231122094609.292304-1-bingbu.cao@intel.com>
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
v3->v4: fix the unwrapped commit description
v2->v3: fix ov01a10 driver to set the runtime pm status to be active
	also add pm_runtime_set_suspended() into .remove
v1->v2: move pm_runtime_idle() together with pm_runtime_enable()
---

Bingbu Cao (4):
  media: imx355: Enable runtime PM before registering async sub-device
  media: ov01a10: Enable runtime PM before registering async sub-device
  media: ov13b10: Enable runtime PM before registering async sub-device
  media: ov9734: Enable runtime PM before registering async sub-device

 drivers/media/i2c/imx355.c  | 12 +++++++-----
 drivers/media/i2c/ov01a10.c | 18 ++++++++++++++----
 drivers/media/i2c/ov13b10.c | 14 +++++++++-----
 drivers/media/i2c/ov9734.c  | 19 +++++++++++--------
 4 files changed, 41 insertions(+), 22 deletions(-)

-- 
2.42.0


