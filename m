Return-Path: <linux-media+bounces-40838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6CCB3310E
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 17:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65FC32037C2
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 15:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26FD2D9ECA;
	Sun, 24 Aug 2025 15:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFhLlgS5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E14119CCF5;
	Sun, 24 Aug 2025 15:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756048031; cv=none; b=jl5QdOkw/M7SNjsNcLuyatK9usfaHqw3R0oprIMKGIbj+2Qy7AKdFOpV7DNKJ4UizFk5HwsQUeY5qDAi/12GsFnkn58U9dwKQt/a4AxBYxG62xTw685sdZpd/wGG0l44FBKr6Smv7JRW9rNlUEIUGKaiWxQqAz0I/0/ZuO+FJIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756048031; c=relaxed/simple;
	bh=ybKM1b1GksEQ1Nqp+0ReyMbJ+xmf5Je3Bch2k5f5kMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aMeFNDwBGqc4Ue7eggDGNNdgPIg2tNOub2QaF9iuGfhFDe+UEsrqyBkwsTvNwR/RWOBmwqbr7DxSvA6LXsjKjOnZjsVOW1YcLyzq7yznGfEXo3ARIv6vfkQfmf18Ej+uhHKrvLtBI0cEuh1/IXUj3H0IBQ+C2ixYZUmvjX3sM6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFhLlgS5; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b28184a8b3so42673811cf.1;
        Sun, 24 Aug 2025 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756048028; x=1756652828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kv4bA7nfEdl5uNe/QY08m+D7Nl0DRN4jThoEaTy25SE=;
        b=AFhLlgS5EAW3Rh1/XzQXTpG+hUI1eRJQe+gPVOXcTmfGyPWg75K1mFoaa15KweljIK
         EgDmrDKiz4zBaHh5emuxzWXVpG1EQ94nSJZN/+T3oALsrOFZOGmfKoVXkj/AJ76s8YdH
         rBCCVHG0XPBnUdRO2VBq9xFcHPd61S8APzIWJv1uGvjdmn4sK7QYqpfoFMdWYAfpvvsB
         AjGOoOWqyt4RJc1hyrDlU5HpHcKoYdgq2N21OVyMN5VEx4jpON0pGYATy90HVkAE6LHP
         zxZ1svc5PaxqefmeWfJjxkk9FMU9pyhannuIgTh26TBOurSMG9x2MggoMMSw95rjDPTh
         vCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756048028; x=1756652828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kv4bA7nfEdl5uNe/QY08m+D7Nl0DRN4jThoEaTy25SE=;
        b=uHvvTvSCuJNTc2v6yCaFlb/sl4Sog3+1VvlQ1dZd7i7zDaDFw1KJx7MtycHDj8nKPo
         Sp0sPHLwb+SGO39bNNCO4+eUJ4XKCALj3zhtv0GmiNbzSpASmsK0KylAG9G/3CMVyqFx
         1O9V3ECDCO1n0pVSsMn7IkZz8ohCwwf2IoZqWt++/+7J91qFaPR0GQ56BgeJrsN3Hrkw
         6RlDCWf/tMGiGliGzgFseR6ccjKaqftPimECR66aRjJDQFegYm4lv7hIl42XJx5b1GsU
         Nw1bvW5JwSE0NxC/5wQ5fbrBcg2onrPGHQo3QXuivgfmcZDMzERH1ooSAv6YDaEzUePG
         rd+w==
X-Forwarded-Encrypted: i=1; AJvYcCXVeMEwM2328XzevOp5YM+cPJ85fF45ezz3lvRnYZhKc5M1J2vHf6VOTG224AHHd4xmamoNjUpNEZQJ9vQ=@vger.kernel.org, AJvYcCXu0i3zK+Avjl8OioE1Q9Bz1ZbrQb6yd9zJjLQLsFneUgSNyHYG7nYxMp3w/OwrCzbi0GUJR9ydo88nPss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv3B72ZTxzRzqMOeAPl7dx6u1PICH5fyN8KIIzFpa9wkIOTRbi
	wmRgXj8tQNm2NZjVm9JVpRPL+daAQu0fDpY1QKkNYEBnal9ZnQRrQsrl
X-Gm-Gg: ASbGncs9CRCnZFuWm1FM9ha2qaNei1bY+hPJA0XoOEuGLSB/cQmU/SFlGUTpitB+I58
	aS6VIYxLO+5lvpE4Rwki2kVEr21lGunHSpjHeM8EmmSTo3A+2HuXgI8HzPcjoMiWQhSAQFijeXU
	Nr2SiXai1jNamhDM/6iCZxX9iK2APizXWng4QdY8csBlLXmS1QBQU3jSMoNIMN/ht1hErA1QhP7
	n8HEHE2tkM6TD9ADNqjarI5Y1Rg9M0tm6iF/9KJ6ih0kI9zrJvUKyaiwqjYjbHsqGToURe+T+Qa
	17Aj7okHBN2B5qerGnCY/FAjEg1eUl3xy5BtieFPTT/QOLgKH0iz+o6j9igWSm1Xb5KMm1HhNNH
	Ta6H1W+3EeLpA1D69+iuY/fD4J6cmzLKclQLYtU6balOv0p4qPEeyGeNoXA==
X-Google-Smtp-Source: AGHT+IFcCmMohJ/EOl+J927133MQPMXagTlB82+HpFWILDSJjTYmPCKCgNy9m2blTGnMXX1QlhxGwQ==
X-Received: by 2002:ac8:57c1:0:b0:4b0:8633:f961 with SMTP id d75a77b69052e-4b2aa8cf134mr111743161cf.0.1756048028116;
        Sun, 24 Aug 2025 08:07:08 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebf2b4f5e7sm310659085a.45.2025.08.24.08.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 08:07:07 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	tian.shu.qiu@intel.com,
	bingbu.cao@intel.com,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] staging: media: Use string choices helpers
Date: Sun, 24 Aug 2025 08:06:56 -0700
Message-ID: <20250824150656.2387516-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use string_choices.h helpers instead of hard-coded strings.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c     | 3 ++-
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c    | 5 +++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c             | 5 +++--
 .../staging/media/atomisp/pci/runtime/binary/src/binary.c    | 3 ++-
 drivers/staging/media/atomisp/pci/sh_css.c                   | 3 ++-
 drivers/staging/media/ipu3/ipu3-css.c                        | 3 ++-
 drivers/staging/media/ipu3/ipu3-v4l2.c                       | 5 +++--
 7 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..e5d80611d009 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -27,6 +27,7 @@
 
 #include <linux/io.h>
 #include <linux/pm_runtime.h>
+#include <linux/string_choices.h>
 
 /* Assume max number of ACC stages */
 #define MAX_ACC_STAGES	20
@@ -841,7 +842,7 @@ int atomisp_css_irq_enable(struct atomisp_device *isp,
 {
 	dev_dbg(isp->dev, "%s: css irq info 0x%08x: %s (%d).\n",
 		__func__, info,
-		enable ? "enable" : "disable", enable);
+		str_enable_disable(enable), enable);
 	if (ia_css_irq_enable(info, enable)) {
 		dev_warn(isp->dev, "%s:Invalid irq info: 0x%08x when %s.\n",
 			 __func__, info,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 964cc3bcc0ac..fef500178117 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include "../../include/linux/atomisp_platform.h"
 #include "../../include/linux/atomisp_gmin_platform.h"
+#include <linux/string_choices.h>
 
 #define MAX_SUBDEVS 8
 
@@ -917,7 +918,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		return 0;
 
 	dev_dbg(subdev->dev, "Setting power state to %s\n",
-		on ? "on" : "off");
+		str_on_off(on));
 
 	if (on)
 		ret = acpi_device_set_power(adev,
@@ -930,7 +931,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		gs->clock_on = on;
 	else
 		dev_err(subdev->dev, "Couldn't set power state to %s\n",
-			on ? "on" : "off");
+			str_on_off(on));
 
 	return ret;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..08b64a2e56cb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -17,6 +17,7 @@
 #include <linux/interrupt.h>
 #include <linux/bits.h>
 #include <media/v4l2-fwnode.h>
+#include <linux/string_choices.h>
 
 #include <asm/iosf_mbi.h>
 
@@ -527,7 +528,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 	u32 val = enable ? MRFLD_ISPSSPM0_IUNIT_POWER_ON :
 			   MRFLD_ISPSSPM0_IUNIT_POWER_OFF;
 
-	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
+	dev_dbg(isp->dev, "IUNIT power-%s.\n", str_on_off(enable));
 
 	/* WA for P-Unit, if DVFS enabled, ISP timeout observed */
 	if (IS_CHT && enable && !isp->pm_only) {
@@ -569,7 +570,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 		usleep_range(100, 150);
 	} while (1);
 
-	dev_err(isp->dev, "IUNIT power-%s timeout.\n", enable ? "on" : "off");
+	dev_err(isp->dev, "IUNIT power-%s timeout.\n", str_on_off(enable));
 	return -EBUSY;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index af93ca96747c..2a4db605c126 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/math.h>
+#include <linux/string_choices.h>
 
 #include <math_support.h>
 #include <gdc_device.h>	/* HR_GDC_N */
@@ -1241,7 +1242,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		dev_dbg(atomisp_dev, "Using binary %s (id %d), type %d, mode %d, continuous %s\n",
 			xcandidate->blob->name, xcandidate->sp.id, xcandidate->type,
 			xcandidate->sp.pipeline.mode,
-			xcandidate->sp.enable.continuous ? "true" : "false");
+			str_true_false(xcandidate->sp.enable.continuous));
 
 	if (err)
 		dev_err(atomisp_dev, "Failed to find a firmware binary matching the pipeline parameters\n");
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 73bd87f43a8c..1de2749f7852 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -8,6 +8,7 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/string_choices.h>
 
 #include "hmm.h"
 
@@ -1478,7 +1479,7 @@ map_sp_threads(struct ia_css_stream *stream, bool map)
 	enum ia_css_pipe_id pipe_id;
 
 	IA_CSS_ENTER_PRIVATE("stream = %p, map = %s",
-			     stream, map ? "true" : "false");
+			     stream, str_true_false(map));
 
 	if (!stream) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
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
-- 
2.47.3


