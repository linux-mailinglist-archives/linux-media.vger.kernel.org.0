Return-Path: <linux-media+bounces-41001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F118CB33C7E
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F23D7189084F
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 10:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F142DA746;
	Mon, 25 Aug 2025 10:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRzU+CHl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940662DE6F6
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117294; cv=none; b=ivhftYuCGNZ8yXi5e/rF4QlJRlHPdO9yjE/pt4W8vOSwIeKFxvbHD36O/srRdp6i749n8y2agCbtj2YROqa0ghgwqbpsB2Mnkos/Jmkwqvnu/p2QxeeowRDRvEcZaJS+p3MlxGP+RzoEiD/d4DDJXo28MLss78KozXVaVzUq3rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117294; c=relaxed/simple;
	bh=oRGPP8A9kD2Ism/GRGLQU6yCPnxuitum1Ux/QV9XLQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IsGfte5RNr3esdA4calpfqsSDckxQByD1GBNybNqo9dkPYX57gAQSLJqaa5aqYFUT6AZTt9HVo2w4/AE7AcrFdA9kphYG1L02sGDDRgrf8p+l0u8Z0wr3n11Mlm6FIawv4C7WC2sF9q6CbHVBd6seCGwb5gO4ATrL8hYomX02Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRzU+CHl; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-70d9f5bdeb4so20594116d6.0
        for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756117275; x=1756722075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sy3EbFCheoNs2cuk9tdwnjT18BnvxZ78GmASClzOWgk=;
        b=jRzU+CHlzsvOERZS1iWy2e2YQZz85Szel19inEF2muj3lrMQy/hXsb8yv9EvOwP8Yh
         r/xz1o0ukPJbrqeyPCY+CN8FooCy3PurH8lXT47/SMVi6LZ/7lZyztevqoQ+crl6tptR
         3lM3SprVf7DijgP24z+dZY+N0JAhvytXkN0l/9tHCsLwb+4BPJ5rH3c91d13CfHjF0YW
         bc+ahiVktFPIUGO6NSpGLMWkno7wNrz4mxQizApcvZaHkdKgYBlAmhTWVH1OBlx4uzAK
         oCQhLwNi64dVkMaxOSwbsHyDxKsIsaEsdVeFch1awBTqJLgopi4bHauHPzQOHsDWizje
         pgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117275; x=1756722075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sy3EbFCheoNs2cuk9tdwnjT18BnvxZ78GmASClzOWgk=;
        b=GE9ph8QOSxRFrm6Naj5FTYwFyWfEhnwU5osq0BHpMBIVT1kaHSOtEA+gkOVNrXzkmN
         Sg++mZQs/5iulP/8YMv2V+cqYMxrsyV8+rx56qJoxUBkuKUgmqhZNWJmsaNcr4IcSDI0
         qwUIqVOvXpjM55HGn9oSvU4qavAlrhzTJ9Gu3WExggYhhMt30RqtBM6QxsWwhaoHzrjE
         FI3hQ0O15c7/UQgPXpaGJzHRB4yjvIZDBJAHkffykT8vvIf81GLA32VUdy/w3ul5Dz5N
         kS2F74b6m0aQerQdOJ1EmmnDbzW3fYD5/BxKJcdZyYFuOmvaPAsypxhwqXXPZCGy72mE
         Vqdw==
X-Forwarded-Encrypted: i=1; AJvYcCUcZ3+NPNMXaOs+5MuWSI+XsGUkvxyGA2tu3EqXH5srLWa76Go1APf10mAlvsiMBWSYZ6bzPk1fLr8p3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeQ1Qx5w1t3jLDy3SWyKfsUhbAOoOddDWnNxoltmDR1/a5poNW
	oGSBNajuEAhHkcsIsZV2KFdaQ7N8Tj67UQeNySkCh6oW0RMUfK6w1Ksw
X-Gm-Gg: ASbGncuSP7SMKVytGjpUHurMpiI9X9LO6VWqh/qKnX6m+l1lPCQwZtS73RwKPUEn1E7
	vmvdEXluB4HaEECu5OTcRgHj2CONvMMB1KKQGY1NNex/KAJRLZ+Wui5zZMSXq8LBjiPiey3WQy6
	dmaJDrOLRVU32ORhKja2X1f0u7ORBHtG4dO7zBnUFT//maZSR1vbyL4Xj5+3huK/FVoZ4SfGGxh
	+n0IQ5ciwwbXZCaOPF4WVdCqck74A45JR+BJbeVdDgYC+lx3/yAGpIp82UqlxwS4PPeovYFn0fI
	HFPVitFL5JuHuZ0ULA37mZIY3VzzMihfx7ojBuhj3IHYUiJS4dMa4n3P3CAIDARZcfu5ocl+vu1
	bIaD/y7ozqs/ATEOXbBTQisyf1+/tK6qoXUwXgnFZaT8LvTbJn7RPo+ZtiVPffFC122dV
X-Google-Smtp-Source: AGHT+IHxj2yFPeKp2UUVuWOYEeQXghedbTJL3FrXP8fm/9MPMZANiTSsDkF7jPaSKQ7YlmWUyEdX7g==
X-Received: by 2002:a05:6214:d03:b0:70d:8166:b7c2 with SMTP id 6a1803df08f44-70d9724502amr115908746d6.65.1756117274535;
        Mon, 25 Aug 2025 03:21:14 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da717df65sm43086836d6.30.2025.08.25.03.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:21:14 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH v2] media: ipu3: Use string choices helpers
Date: Mon, 25 Aug 2025 03:21:04 -0700
Message-ID: <20250825102104.961139-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use string_choices.h helpers instead of hard-coded strings

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
Changes in v2:
 - Split the patch into two: one for staging/media/ipu3 and one for
   staging/media/atomisp
 
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
-- 
2.47.3


