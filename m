Return-Path: <linux-media+bounces-38810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0399FB194AD
	for <lists+linux-media@lfdr.de>; Sun,  3 Aug 2025 19:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DCA51890C70
	for <lists+linux-media@lfdr.de>; Sun,  3 Aug 2025 17:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888531DF258;
	Sun,  3 Aug 2025 17:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0ZEVntA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2321C5496;
	Sun,  3 Aug 2025 17:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754243451; cv=none; b=maH+Hz6JQCSsHSn/iYUClD1zNgRAj3Ns1/3htWIb2r0bulDpiwq/g2A7mVCXTAOVVd30E3c+OQpabFMUORPAKvw9hazB38Gui5E5Smg4TZq7/BqptlA5k+1n8KYOR0/jat8NV++N5tvn/cDCKXZKj2+yxtXogxktenHcnaCxHUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754243451; c=relaxed/simple;
	bh=DJiSK5yw31vSZeaWgFi3HoD1YTH8Ir78jDdMH+9lJz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ALWh+qp3zo3V5Who35f6Gs4teIajEZHc/w2dIV/x2pyG6rhSCBXeSd4nCDRLhSnAsDgabP12Z1bnoZtICP0p3pVJgnqK8QglFSzAkWVBd8pFinTB9lSLHE93AI9yxXxfHgJfg1wW7H/djCi8f/PdtX9T/BFkU6U3v3jy4acMtlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0ZEVntA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23fd3fe0d81so32932215ad.3;
        Sun, 03 Aug 2025 10:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754243449; x=1754848249; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WDyaOvtCXv9NJO8ZoH8TFWDjjaf7wJBFVeWQpU5YhM=;
        b=d0ZEVntAzBQ96cX2/iRrTxY8MWbudQKCnc5YTYhMcD/CUnojuEEpTd3+2u9e5NgqcZ
         bdJ/RntuZG4iGTticPwN2NZ2E/lJzJErz6iSDRP8myijnCDcMDITMOroOmetGmS0d98w
         OMadTs3RoVMrftvKbzNLdtnjIX1rXKW7LEybLSugC3042EgYEY38Mswe7VAUHN4hEHPo
         yEo5KMlsAs+15XsP8M9fk1Ql5Wn6BE6zrplRxUR05DJ72uxCoXRizQV3l5/5Lieerg6e
         Zy/bjE3W/4KTJZwy2KpTAnXZcchNVRvDW+ef5lxoV05LppkCYrzuZJ6yasjS6LPyFoY3
         yaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754243449; x=1754848249;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WDyaOvtCXv9NJO8ZoH8TFWDjjaf7wJBFVeWQpU5YhM=;
        b=cmP/171P3tnxYR8vFj1Et6flEnKfMpEbN75mvbqsb4Hq7A85J8pkfOeZXMqOM0PWdS
         4wrLnWWerZsd0KPkD46qc9GE73xHdtLfNVm34ff0t8yT3pyHVA/QfXWBT/R80qBe/XRL
         KvZiMBeAyYesM0AgVH+4YdAYRm7u2WqPlw1Lw4UhfNg4pjJLEHc10vh1aRXAOg8vnNK0
         lQxii+lq6Y430sFfTors/2JMM+LTFTR+R2wlq1I+f4N3GCuTSqeRv9cYS/BaK/tvDQq0
         e5sDXD1bbbkEOp+NkZYZ85FKQpzf/nAfHfW4xojo5fMX3/NgkbhRHz3sHet3zlSqidYz
         D0iw==
X-Forwarded-Encrypted: i=1; AJvYcCUhlv+kCRWIX0G+IqgDddUJvOaZ9VFDBGcg2nKTgn0dGJitsKVJcyObwi4tBmW2cm3jOOSjSVmF3NXv9Jw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKSueGQVUu8q5mbyI6MbUd2oiqdSK7msZZ2q7WdNQ0vv7rCmnP
	gACdyqdzGF7eTDCtKg5EESQlPZFdQlA/A4dyYhpsk8Q8poerIewdRbaa
X-Gm-Gg: ASbGncvoegSP8Usv70MBSUMsDuQVDDabxyCeypFyruPnS3a5JfrJSfuDlFEACGj99Su
	+i0Uod8oj367bgpnLhmBSiEdbf8Pg02+RMqjzjWQKFoFOc16VDngNBhC+JupX0sMYYLMJLDwJCR
	0aGYbuDsKAsp4GMnDH6sD10dl+Qzh+LcJJZJ5EBJfq+FBwuZ2VZy6zXA35U+mOFtDFF/JLrGAkl
	SDkZGtllhGFDxhMpe+ojm+jdNQ/68Gz+W7JYNKzTGlOz+sxZcf/elGt6WT20OffuWYln1UxaRdS
	ZeyKv0ObUodRC69C+DWK2fHz8uA2E9EuPQltiWYUUh5uk+IlBY2UDdeCZVPDeJzkCyfeOAdModm
	GS2XLk101GZrAgUgdSOIEqB9LC/7b7MGh
X-Google-Smtp-Source: AGHT+IGX/HUMKV1bH9ywZLaMy2B08//y844ZJnjF/5ErmKsBhlBzUgfoooG0/8ewYodeApVof0bBbg==
X-Received: by 2002:a17:903:32c1:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2424701ae4fmr102641745ad.38.1754243448705;
        Sun, 03 Aug 2025 10:50:48 -0700 (PDT)
Received: from localhost ([106.105.221.253])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241e899a48esm91069455ad.114.2025.08.03.10.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Aug 2025 10:50:48 -0700 (PDT)
From: Nai-Chen Cheng <bleach1827@gmail.com>
Date: Mon, 04 Aug 2025 01:49:55 +0800
Subject: [PATCH] staging: media: ipu3: use string_choices API instead of
 ternary operator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-ipu3-string-choices-v1-1-506834a013b5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEKhj2gC/x3MPQqAMAxA4atIZgOx/hWvIg5SY5ulSqMiiHe3O
 H7Dew8oJ2GFoXgg8SUqW8yoygJcmKNnlCUbDJmWLDUo+1mjHkmiRxc2caxo5o6oWc3SWwu53BO
 vcv/XcXrfDxJfyBZlAAAA
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Nai-Chen Cheng <bleach1827@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754243443; l=2507;
 i=bleach1827@gmail.com; s=20250730; h=from:subject:message-id;
 bh=DJiSK5yw31vSZeaWgFi3HoD1YTH8Ir78jDdMH+9lJz8=;
 b=htjeU4Zc0Y182neDXxTA5WYFV023GLFtax2bY9msrCmY8VaQM8iVUxmWzyM0JUIi3ZHu9z7/z
 OmLsS9HRoqQA5z2KpiaaEdGLpQuXW22+thgPtEFK/gf8MK2zCxs3XVf
X-Developer-Key: i=bleach1827@gmail.com; a=ed25519;
 pk=jahFPRplw20Aaim8fIt8SxlFMqkHbJ+s8zYBGbtHH5g=

Use string_choices API instead of manually determining the output using
ternary operator to improve code readability and consistency.

This also fixes cocci warning.

Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c  | 3 ++-
 drivers/staging/media/ipu3/ipu3-v4l2.c | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 1b0a59b78949..777cac1c27bf 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -4,6 +4,7 @@
 #include <linux/device.h>
 #include <linux/iopoll.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include "ipu3.h"
 #include "ipu3-css.h"
@@ -226,7 +227,7 @@ int imgu_css_set_powerup(struct device *dev, void __iomem *base,
 	state = readl(base + IMGU_REG_STATE);
 
 	dev_dbg(dev, "CSS pm_ctrl 0x%x state 0x%x (power %s)\n",
-		pm_ctrl, state, state & IMGU_STATE_POWER_DOWN ? "down" : "up");
+		pm_ctrl, state, str_down_up(state & IMGU_STATE_POWER_DOWN));
 
 	/* Power up CSS using wrapper */
 	if (state & IMGU_STATE_POWER_DOWN) {
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index ad6095bf717d..2f6041d342f4 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -3,6 +3,7 @@
 
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/string_choices.h>
 
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
@@ -287,7 +288,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 flags & MEDIA_LNK_FL_ENABLED ? "enabled" : "disabled");
+		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -302,7 +303,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 flags & MEDIA_LNK_FL_ENABLED ? "enabled" : "disabled");
+		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }

---
base-commit: 186f3edfdd41f2ae87fc40a9ccba52a3bf930994
change-id: 20250804-ipu3-string-choices-2a6004f2d788

Best regards,
-- 
Nai-Chen Cheng <bleach1827@gmail.com>


