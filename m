Return-Path: <linux-media+bounces-12732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D2C90044C
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A3531C2414B
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CA41940AA;
	Fri,  7 Jun 2024 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ie1j7Fkh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4D818732D
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717765452; cv=none; b=ATAAs25HYabo99nzcJouKII18CuTxDl0YOKNjeZduxl1AKFJqj7g2NsYbG47oSnkDg5zf1aaYoYdq6xBBGCSaNWaMm2jccXT5RKLB7G/OvLHT0dvfLGhfzLlshRLudYv0cLKtF1OI1+xE8zI1RgWrTacfSb4Bzz19nSuT4JlYJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717765452; c=relaxed/simple;
	bh=iCQLYmprlaAQWpAMxh9Mc/US0SNHlFGe+GDZ0+wbjM8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lyqzamiyVBE4qARisXvJ9C/YqvQAmAvsVcV28LHHhQ4ZLu1Ak5mLYiJHGOxQWsgxJKowkUyxcE+ButMlTRPP25T+p5hmvjNgFVNqdXC+jvr8plDrNU8Qa8PdqdOaH1jrs9xbeGrXyVS81Rq8ZeZVqUDXNu1wRR7zFNO3bMzsBQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ie1j7Fkh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717765451; x=1749301451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iCQLYmprlaAQWpAMxh9Mc/US0SNHlFGe+GDZ0+wbjM8=;
  b=Ie1j7FkhzWnS0m7EBe0kAJID1Ly7xkqWga5PfUKtD05SfKUOT2MVw56o
   UlpjaQjEmWoomx6nS2TApZR1HkRAN1gwUfm+cinbaWi+i14TcPUI+inmG
   EbqeQ1WvoMhFlJws8jkvOdQZETO6snVGu2EO9JL/d+aDHOHfgzzds9Itv
   dYtHZ9309Zw2NfXyIr503Cj27b3vJNSwKHeKzyRj+4y266GiYR9pE9Ix8
   H32cED2Y6uNbky2cgPpNPeM4VqdbaFmme/YjhWBj+TWw/mc6d1fT4tC8S
   uZy3KKRUlnpJbMGdIOaRMUT6/kwLfgEwSWMwOB9XvBGllLSIODQMHUVDm
   A==;
X-CSE-ConnectionGUID: Pswy8zc9QBWrrqmZnyt5vQ==
X-CSE-MsgGUID: Vs1iPX7UQZKVRNnYFv+tFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18311944"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="18311944"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 06:04:11 -0700
X-CSE-ConnectionGUID: SX76SQMMTj2UhISYtQlAWQ==
X-CSE-MsgGUID: z+oyKIeASfaAw8YNZ9QrJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="42734311"
Received: from wentongw-optiplex-8070.sh.intel.com ([10.239.154.12])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jun 2024 06:04:09 -0700
From: Wentong Wu <wentong.wu@intel.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: hao.yao@intel.com,
	Wentong Wu <wentong.wu@intel.com>,
	Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH v2 3/3] media: ivsc: csi: remove privacy status in struct mei_csi
Date: Fri,  7 Jun 2024 21:25:47 +0800
Message-Id: <20240607132547.2820515-4-wentong.wu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607132547.2820515-1-wentong.wu@intel.com>
References: <20240607132547.2820515-1-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The privacy status is maintained by privacy_ctrl, on which all
of the privacy status changes will go through, so there is no
point in maintaining one more element any more.

Reported-by: Hao Yao <hao.yao@intel.com>
Signed-off-by: Wentong Wu <wentong.wu@intel.com>
Tested-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index a46a012b301f..bff0176fc8f1 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -138,9 +138,6 @@ struct mei_csi {
 	u32 nr_of_lanes;
 	/* frequency of the CSI-2 link */
 	u64 link_freq;
-
-	/* privacy status */
-	enum ivsc_privacy_status status;
 };
 
 static const struct v4l2_mbus_framefmt mei_csi_format_mbus_default = {
@@ -271,10 +268,9 @@ static void mei_csi_rx(struct mei_cl_device *cldev)
 
 	switch (notif.cmd_id) {
 	case CSI_PRIVACY_NOTIF:
-		if (notif.cont.cont < CSI_PRIVACY_MAX) {
-			csi->status = notif.cont.cont;
-			v4l2_ctrl_s_ctrl(csi->privacy_ctrl, csi->status);
-		}
+		if (notif.cont.cont < CSI_PRIVACY_MAX)
+			v4l2_ctrl_s_ctrl(csi->privacy_ctrl,
+					 notif.cont.cont == CSI_PRIVACY_ON);
 		break;
 	case CSI_SET_OWNER:
 	case CSI_SET_CONF:
-- 
2.34.1


