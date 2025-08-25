Return-Path: <linux-media+bounces-40935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A395B33BC6
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4414C7B23BF
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E919E2D5C73;
	Mon, 25 Aug 2025 09:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nfe6SaCZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADD12D46CE
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115489; cv=none; b=YhGQYdLYeUxtGqQ6/75t+wffPRXMRao2XecJPqbjSPibh6ZfSb5LKtRRujRpNy5jP2xwct4v6nq4XGB/z2ZiQVlnLp0HiZyCxAkPBKh/+EE01fdGVycgWVqGysdDPh9H0jnU4eeTfS/qPVDOkSM/UdzKtuC+Or0QeUVRx87/3xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115489; c=relaxed/simple;
	bh=30TMnSRf4KbeanC9k3gHOYKEUsGnotBTOoJUgpcXFJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mn/hyWA3nRndY4FTQ+YXaKXf4e+r3UTmWijWX7TAm/ZbK7gLYDE1JiHhbElLO50I95vEm92V2BBdBkO46DlPGFS9eRvAlfDDtT4wt+MUs3QrhIdzsJ18h3fVPsLlWvxMOMdxwEMNqavVlxPQg9rif0S9IKLw9zvFT7L2oQA+fWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nfe6SaCZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115488; x=1787651488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=30TMnSRf4KbeanC9k3gHOYKEUsGnotBTOoJUgpcXFJ0=;
  b=Nfe6SaCZf297wW2Lq4GfzrG+njIdNK1nuOIvs0rjnfeq2QXAIpZzwlQ6
   ezDHnMZ4/ddTqI86Kg30zPYSWjdPihkTj7k3jdk9b8QvxKoT9qSU7Lslx
   3/p9AyVEL+ovbUSbA+MbXdpEYhe6rZDdz8GTfgMyGHtpiDtFnLn9yn06/
   +VyUR1ME+PVQwFUbUcmHZFbIlr/loJLC1pXDkkuyDxKZIXttNPDGTicGh
   tbIvHOg9x+k2ottVOrqT2B5dPEH6ja2J5a+XlK6juSs+9Mx+DfNPfyNRA
   2O8Dmb/pwZHs3qLyL0L8b1qPV6xz1AZAET9z5IRiM2NVMRJ/l6Gx0zO8X
   Q==;
X-CSE-ConnectionGUID: lLQniODZQzeuIEfeV6UjIg==
X-CSE-MsgGUID: yDKwvMBnRWexq4SQlNNsmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695808"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695808"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:26 -0700
X-CSE-ConnectionGUID: MnFH2VtbQb+XC2/drWIiwA==
X-CSE-MsgGUID: r+T6auqGTAyS+wJEZ7V0Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195414"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 209F5121F6E;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005adg-0PT7;
	Mon, 25 Aug 2025 12:51:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 06/66] media: ccs: No need to set streaming to false in power off
Date: Mon, 25 Aug 2025 12:50:07 +0300
Message-ID: <20250825095107.1332313-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Streaming will have been stopped before the sensor is powered off, and so
sensor->streaming is also false already. Do not set it as part of the
runtime suspend callback.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 487bcabb4a19..48d1f49781ea 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1706,7 +1706,6 @@ static int ccs_power_off(struct device *dev)
 	usleep_range(5000, 5000);
 	regulator_bulk_disable(ARRAY_SIZE(ccs_regulators),
 			       sensor->regulators);
-	sensor->streaming = false;
 
 	return 0;
 }
-- 
2.47.2


