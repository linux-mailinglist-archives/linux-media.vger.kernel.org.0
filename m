Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E641E39FF
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 09:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729120AbgE0HMR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 03:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbgE0HMO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 03:12:14 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549F3C061A0F;
        Wed, 27 May 2020 00:12:13 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id u5so11377230pgn.5;
        Wed, 27 May 2020 00:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qw/QOLBu9d2B+96STuqYNI0AftO5l6SG5yefrjTDHdQ=;
        b=rAvssvWz49+fXzXPapINBcDmFBTZ01RO2hMId+vgCJN3AG63BmjX55x7SQCy71kRyl
         Aq0VWotduyCwmPny7lrc0pWTiCgpE0weYmufy41TJVpo1hIV/C2GkMOzqcQzhjRhKz1+
         r/3q1R8nKhc3wAdHpKSCi/CO48ZFFlGTCM2OUa+PNJbGUpzypAhFiqxYq7rnduqbTk4j
         PJz2M1SmoOlh5WLkVTvtL/NyMWz2pHepmil5fNaJhItpgj4fT/Zb4biKCGcYNTRp32lA
         tR+jWjuGDJ+jG9ggkd6y1wPjtHhMpR0j8LjE7SWvY/P4Xf3NvfZ4WG+bPRHcSt04qoZr
         86SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qw/QOLBu9d2B+96STuqYNI0AftO5l6SG5yefrjTDHdQ=;
        b=GpQTR7+78/WT7niShc+vwd1HlMZ3SxvS9J04OwuMvVEYdaEhyTHtSDCEMJj8K5Enzt
         yostugGE+dsoh48LbGTqcjAXgtgNJov1+hcOslifkT75/fsA1jp0ufek2H6/z9HzcjpX
         tX4oDmsE3yEpvN/ghPIU6Y1noi/+V6DPXLyFXivxPRck1urkaOgcuQ0xD4zswC53xND4
         1TpUBelTCx7mMe+fEUV9ER/ptTEbAo/xge6ETZVBte3AVPO7JaYPFooXPPfkIPPMQ7NO
         dgCS4yWtvc2bysQOmG1c6RV46egt18itV3qZ3Ix4OffhE62Eocsw6d3CIbv5Alour/RV
         bA0Q==
X-Gm-Message-State: AOAM533tKtVMXTfHc4Hl6CENW2k95o2sIoo6IIJiWYf7UD6P11Da7rAv
        cEbRiHvq/aAtdEqBK6q5EFA=
X-Google-Smtp-Source: ABdhPJwiMdlTneuDy4qlJ6WknGzBgbOnwG5sxxkqaefuDqkk6jhGJu9u7DEVNg4VjcPowgRDxL0hMg==
X-Received: by 2002:a63:3c0a:: with SMTP id j10mr2734873pga.35.1590563532903;
        Wed, 27 May 2020 00:12:12 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 10sm1306431pfx.138.2020.05.27.00.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 00:12:12 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH 2/7] media: atomisp: Remove second increment of count in atomisp_subdev_probe
Date:   Wed, 27 May 2020 00:11:45 -0700
Message-Id: <20200527071150.3381228-3-natechancellor@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200527071150.3381228-1-natechancellor@gmail.com>
References: <20200527071150.3381228-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Clang warns:

../drivers/staging/media/atomisp/pci/atomisp_v4l2.c:1097:3: warning:
variable 'count' is incremented both in the loop header and in the loop
body [-Wfor-loop-analysis]
                count++;
                ^

This was probably unintentional, remove it.

Link: https://github.com/ClangBuiltLinux/linux/issues/1036
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 694268d133c0..c42999a55303 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1094,7 +1094,6 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 		if (camera_count)
 			break;
 		msleep(SUBDEV_WAIT_TIMEOUT);
-		count++;
 	}
 	/* Wait more time to give more time for subdev init code to finish */
 	msleep(5 * SUBDEV_WAIT_TIMEOUT);
-- 
2.27.0.rc0

