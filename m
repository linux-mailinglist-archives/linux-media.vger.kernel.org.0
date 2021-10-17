Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4837430AA7
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241666AbhJQQY4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344193AbhJQQYz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:24:55 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B767AC06161C;
        Sun, 17 Oct 2021 09:22:45 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id pi19-20020a17090b1e5300b0019fdd3557d3so10839675pjb.5;
        Sun, 17 Oct 2021 09:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lIXhjnsru+rHchNvOAzzDS2YJa0jp6BsYH6fxJksSb4=;
        b=XCGWncoB1dFyIxMSafrAUNhtNY7tSgkaYxuCHzguKUQlCQsVkBH5rjrTHXMrEgWvdH
         2alYns1Ua2QDr6qndu1aJMVwytJAmXZ204m6X8CbnT5amEPmssrt14cBdfgCXHNzaVS7
         WtYvGL/1NHstO0dsu3S74VKB6yDL8cmUmX4Kzm1Vu9TFOcw2dXHR7KFJmhhfN0itzayQ
         F3wJoFG0kYeuVzTDrg4QFmmrjcXp3uoy8DnifrXiZQoJGQoz8MJEA6CXqgv9XeNDnBzt
         Bkua9T/etgPdRakCULCbin87XCCsX4m6voJkAqqOh0Y++EO2R5nj/1VahtZ7fAdd6od0
         7rlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lIXhjnsru+rHchNvOAzzDS2YJa0jp6BsYH6fxJksSb4=;
        b=HhM/9rtC3qI3NRrZ8/e7hdr7aC8cTtIN3jaHS/YzWthQUky5TJmoWEVe132k7EpaCO
         VkfcgrxAQocMfhP+tGLUOrYMEiKlmIOUyxzkj/18jhh8zP1qUrKDkMb2rwY00B7LE1VF
         r4/I8KrJc2/TLxu5EBEtbWwcNCoHtn+nJv5FXDADZRbWiS1yh3BsGrQZsUjFH58mSIEI
         APY2GVHxKyt8L7JgIjBa+fK03tCi1maUbM+0ROpt5kDaRnW7hRdOnCul9mIebZyQEHeX
         rcwHhcVDCos4u1/AH9QkXDXODJz3NfwJptMaMbQNjhW47tF8F6w2W/VMB+uJAj8vMHPz
         o/cw==
X-Gm-Message-State: AOAM530vp6jcKyCzjvtLAI42Ib2wkz6VSKz8EDqYOu/T7z6ZguoER9Kg
        6eDGI0LWXwDZbO8woSZSjhk=
X-Google-Smtp-Source: ABdhPJyzjLpYwU/zAbPhyTcd/mmrU+3ADlvsC4sPn8KLWwM5DAo1+NU2WY64bK/JwdNecPK/Ug77UQ==
X-Received: by 2002:a17:90b:3cc:: with SMTP id go12mr42019419pjb.127.1634487765267;
        Sun, 17 Oct 2021 09:22:45 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:22:44 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Alan <alan@linux.intel.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH 17/17] [NOT-FOR-MERGE] atomisp: Fix up the open v load race
Date:   Mon, 18 Oct 2021 01:19:57 +0900
Message-Id: <20211017161958.44351-18-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alan <alan@linux.intel.com>

Applied this patch as-is for now to pass firmware load on probe.
I haven't looked into this and not written by me anyway.
Thus, NOT-FOR-MERGE. At least I can say this patch works just fine.

>8-----------------------------------------------------------------8<

From: Alan <alan@linux.intel.com>
Patch from https://lore.kernel.org/linux-media/151001137594.77201.4306351721772580664.stgit@alans-desktop/raw

Here is the original commit message:

	Subject: [PATCH 1/3] atomisp: Fix up the open v load race
	From: Alan <alan@linux.intel.com>
	Date: Mon, 06 Nov 2017 23:36:36 +0000

	This isn't the ideal final solution but it stops the main problem for now
	where an open (often from udev) races the device initialization and we try
	and load the firmware twice at the same time. This needless to say doesn't
	usually end well.

	Signed-off-by: Alan Cox <alan@linux.intel.com>

This patch fixes the following "css init failed" error related to
firmware load. This issue often occurs when I insmod the module after
boot.

	kern  :err   : [  234.658869] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.755023] atomisp-isp2 0000:00:03.0: can't change power state from D0 to D3hot (config space inaccessible)
	kern  :err   : [  234.755053] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.755581] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.756146] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.757115] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.757582] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.758885] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.760317] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.760818] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.769102] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.769527] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.771353] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.771804] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.772299] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.774617] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.775090] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.775607] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.776230] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.779059] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	kern  :err   : [  234.787726] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :err   : [  234.788078] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?

Patch is adapted to v5.15-rc4.

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c     | 12 ++++++++++++
 drivers/staging/media/atomisp/pci/atomisp_internal.h |  5 +++++
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c     |  6 ++++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index f82bf082aa79..62535e0f4429 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -772,6 +772,18 @@ static int atomisp_open(struct file *file)
 
 	dev_dbg(isp->dev, "open device %s\n", vdev->name);
 
+	/* Ensure that if we are still loading we block. Once the loading
+	   is over we can proceed. We can't blindly hold the lock until
+	   that occurs as if the load fails we'll deadlock the unload */
+	rt_mutex_lock(&isp->loading);
+	/* Revisit this with a better check once the code structure is
+	   cleaned up a bit more FIXME */
+	if (!isp->ready) {
+		rt_mutex_unlock(&isp->loading);
+		return -ENXIO;
+	}
+	rt_mutex_unlock(&isp->loading);
+
 	rt_mutex_lock(&isp->mutex);
 
 	acc_node = !strcmp(vdev->name, "ATOMISP ISP ACC");
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index c01db10bb735..356a7f1bb757 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -246,6 +246,11 @@ struct atomisp_device {
 	/* Purpose of mutex is to protect and serialize use of isp data
 	 * structures and css API calls. */
 	struct rt_mutex mutex;
+	/* This mutex ensures that we don't allow an open to succeed while
+	 * the initialization process is incomplete */
+	struct rt_mutex loading;
+	/* Set once the ISP is ready to allow opens */
+	bool ready;
 	/*
 	 * Serialise streamoff: mutex is dropped during streamoff to
 	 * cancel the watchdog queue. MUST be acquired BEFORE
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 720963156d24..e2ccace77a73 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1567,6 +1567,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	dev_dbg(&pdev->dev, "atomisp mmio base: %p\n", isp->base);
 
 	rt_mutex_init(&isp->mutex);
+	rt_mutex_init(&isp->loading);
 	mutex_init(&isp->streamoff_mutex);
 	spin_lock_init(&isp->lock);
 
@@ -1749,6 +1750,8 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		pci_write_config_dword(pdev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL, csi_afe_trim);
 	}
 
+	rt_mutex_lock(&isp->loading);
+
 	err = atomisp_initialize_modules(isp);
 	if (err < 0) {
 		dev_err(&pdev->dev, "atomisp_initialize_modules (%d)\n", err);
@@ -1806,6 +1809,8 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	release_firmware(isp->firmware);
 	isp->firmware = NULL;
 	isp->css_env.isp_css_fw.data = NULL;
+	isp->ready = true;
+	rt_mutex_unlock(&isp->loading);
 
 	atomisp_drvfs_init(isp);
 
@@ -1825,6 +1830,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 register_entities_fail:
 	atomisp_uninitialize_modules(isp);
 initialize_modules_fail:
+	rt_mutex_unlock(&isp->loading);
 	cpu_latency_qos_remove_request(&isp->pm_qos);
 	atomisp_msi_irq_uninit(isp);
 	pci_free_irq_vectors(pdev);
-- 
2.33.1

