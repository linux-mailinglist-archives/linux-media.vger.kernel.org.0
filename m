Return-Path: <linux-media+bounces-35527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9CAAE2962
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 16:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8062E1693FF
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 14:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6955472613;
	Sat, 21 Jun 2025 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYulUpGb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF052E62C
	for <linux-media@vger.kernel.org>; Sat, 21 Jun 2025 14:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750514460; cv=none; b=lmpcGk0y5w+J4hfb/Vowuhf5WfHV9vDhOVC5k2rYf6zVXNkZT9hQEVwLSvdNG0Khulkn+fsWeMfkwPF/e1lyt+m7s08zR8X/b/Hmlr2Yg4oaiaLcTclNUaFtAkk8VdEZH7dUSceVl3MGbk1EmeD6+xwR2/yEOdxZzeHBNczjpe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750514460; c=relaxed/simple;
	bh=9i8uiatyMw1RdzjZjwSQ0hZw7kq5HfaNGFEFtdfCJaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ssyZPE5BgqGAbbzaw56BLm5cRcK8UplgXBP8ByuQ87c1GRDEyw6w1FLhx+aoGbI0F2bxWL9GCFFHkIcCk6jrQ9a/ii8F2w96F0M21mqHlwrF4kW+ZIaMSaBr0LzsnarW6Npl/pZdDt7S3vRTTwDvjyoYYgnsJzhtqG+/dZAqa/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYulUpGb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2B8C4CEE7;
	Sat, 21 Jun 2025 14:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750514460;
	bh=9i8uiatyMw1RdzjZjwSQ0hZw7kq5HfaNGFEFtdfCJaM=;
	h=From:To:Cc:Subject:Date:From;
	b=IYulUpGbAO2BmvLggA+pL07kMwZH2Eb0uV8WJAalK6MDYI2ZYjllH0lM9K1ailQob
	 vOpa33+T5ehsTvzWuii7rC6/rAiWJ4bQ38Ex3rnOiYBcuy6fGhKZKx4pDIgkqDgznk
	 nG3iC/HpG56+95DEVm79pzJKQd1OmYpw8bXOetFG+lc1vOx1gUfWv7y3ZDM/++Hlii
	 MGEPu8vwBrQDDj76YDNJnubcOXaB3Rp04eoemgMYKetCsBQc8+xnDa0htwXBTNqV5/
	 P9TdPHMSkfdPp3RKsf5bpY99CohIbDaNxR3BHlA2ZyzXYzYtQOBcIpwPmHr5C+NHQM
	 JMGh9EnChLm7Q==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH] media: ivsc: Fix crash at shutdown due to missing mei_cldev_disable() calls
Date: Sat, 21 Jun 2025 16:00:52 +0200
Message-ID: <20250621140052.67912-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the ACE and CSI driver are missing a mei_cldev_disable() call in
their remove() function.

This causes the mei_cl client to stay part of the mei_device->file_list
list even though its memory is freed by mei_cl_bus_dev_release() calling
kfree(cldev->cl).

This leads to a use-after-free when mei_vsc_remove() runs mei_stop()
which first removes all mei bus devices calling mei_ace_remove() and
mei_csi_remove() followed by mei_cl_bus_dev_release() and then calls
mei_cl_all_disconnect() which walks over mei_device->file_list dereferecing
the just freed cldev->cl.

And mei_vsc_remove() it self is run at shutdown because of the
platform_device_unregister(tp->pdev) in vsc_tp_shutdown()

When building a kernel with KASAN this leads to the following KASAN report:

[ 106.634504] ==================================================================
[ 106.634623] BUG: KASAN: slab-use-after-free in mei_cl_set_disconnected (drivers/misc/mei/client.c:783) mei
[ 106.634683] Read of size 4 at addr ffff88819cb62018 by task systemd-shutdow/1
[ 106.634729]
[ 106.634767] Tainted: [E]=UNSIGNED_MODULE
[ 106.634770] Hardware name: Dell Inc. XPS 16 9640/09CK4V, BIOS 1.12.0 02/10/2025
[ 106.634773] Call Trace:
[ 106.634777]  <TASK>
...
[ 106.634871] kasan_report (mm/kasan/report.c:221 mm/kasan/report.c:636)
[ 106.634901] mei_cl_set_disconnected (drivers/misc/mei/client.c:783) mei
[ 106.634921] mei_cl_all_disconnect (drivers/misc/mei/client.c:2165 (discriminator 4)) mei
[ 106.634941] mei_reset (drivers/misc/mei/init.c:163) mei
...
[ 106.635042] mei_stop (drivers/misc/mei/init.c:348) mei
[ 106.635062] mei_vsc_remove (drivers/misc/mei/mei_dev.h:784 drivers/misc/mei/platform-vsc.c:393) mei_vsc
[ 106.635066] platform_remove (drivers/base/platform.c:1424)

Add the missing mei_cldev_disable() calls so that the mei_cl gets removed
from mei_device->file_list before it is freed to fix this.

Fixes: 78876f71b3e9 ("media: pci: intel: ivsc: Add ACE submodule")
Fixes: 29006e196a56 ("media: pci: intel: ivsc: Add CSI submodule")
Cc: Wentong Wu <wentong.wu@intel.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/pci/intel/ivsc/mei_ace.c | 2 ++
 drivers/media/pci/intel/ivsc/mei_csi.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
index 3622271c71c8..50d18b627e15 100644
--- a/drivers/media/pci/intel/ivsc/mei_ace.c
+++ b/drivers/media/pci/intel/ivsc/mei_ace.c
@@ -529,6 +529,8 @@ static void mei_ace_remove(struct mei_cl_device *cldev)
 
 	ace_set_camera_owner(ace, ACE_CAMERA_IVSC);
 
+	mei_cldev_disable(cldev);
+
 	mutex_destroy(&ace->lock);
 }
 
diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 92d871a378ba..955f687e5d59 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -760,6 +760,8 @@ static void mei_csi_remove(struct mei_cl_device *cldev)
 
 	pm_runtime_disable(&cldev->dev);
 
+	mei_cldev_disable(cldev);
+
 	mutex_destroy(&csi->lock);
 }
 
-- 
2.49.0


