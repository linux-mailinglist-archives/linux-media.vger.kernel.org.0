Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6282E3E4FA6
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 00:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236961AbhHIW7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 18:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236959AbhHIW7b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 18:59:31 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABAEC0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 15:59:10 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id m36-20020a05600c3b24b02902e67543e17aso726297wms.0
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 15:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o0f/gjsur0m8agv5cRQaJTm50HmVIODuIKfnxjp3LKE=;
        b=mvPLiFUy3sGIamuOnz2TUQFxmtnIsPvWU/aCg4EXTuBz+aS788myRcQdU8syCx2U8L
         p55ZVcpmWcxgEUo1WX3j61KcAyUvfYIsbFRhSry44mnykZXTgvz42wEw2YVypIub8ru8
         r88l+uy9VUgmR540ZFqAccq+klWX9KaVFGu58HK73pcHU3bKiD85U1iBTkG5jG+WsZfh
         jAisgKeT/NrvkibTocBb9O2ANjXZ674Ztiz5SVevLvL12Cj/ajOtAFsj/D7UuN/x1EBu
         h9KWtWYzSR528z5YVxvBSd0Ct8CdK2PVSJokXQDexs+b2sfs/Ma/aTYoHsaV70QDv9PD
         TC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o0f/gjsur0m8agv5cRQaJTm50HmVIODuIKfnxjp3LKE=;
        b=VQsox3MNfWNgvWWlhK0pMBOCTqhi/XwQ3y1UIjTsMDtDyX06MRybEP8xHD0zrwAtAa
         iIaYhd1ddFGfqT00c/BzUI9HTT1fbgpn7Kyq+kLlOll7HsvOU3zDl1I7bZDojRRsQsNn
         0GHvPx7TsP/1GjS74i7G1tZa7Te+pGrZ631V0/MwZAFYNxA0s5CqpCzMidBTUDI3JiWG
         DQkOFczY+ovTFvU78CazRj/7aAN3HYVBZrzC2V1rGrqWJS96ZsLoGZneQfppXpdm9c4L
         qnHPs13Jt42DzlSOqqllnUax2VogpB/CNrVOHiDFCoy2+qqvy0zhwyCu6xAQwQLN6gV9
         skDg==
X-Gm-Message-State: AOAM5314dUKmWLdoH2a07E7TIOIH9FVx8NkcR0danDu95sQ4FjzMRoJn
        fjJOMFMaKxw6fbMS7bf/Yuw=
X-Google-Smtp-Source: ABdhPJyKvLsEUeRohFQZShsc780pr4pMuWG0gfBBY4F7CHY0K9kZqlOo+CAGk9QuSf0SoeoeHfOStg==
X-Received: by 2002:a1c:a90d:: with SMTP id s13mr9167435wme.132.1628549948986;
        Mon, 09 Aug 2021 15:59:08 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v12sm20437957wrq.59.2021.08.09.15.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:59:08 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     djrscally@gmail.com, sakari.ailus@linux.intel.com,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v2 11/12] media: i2c: Switch exposure control unit to lines
Date:   Mon,  9 Aug 2021 23:58:44 +0100
Message-Id: <20210809225845.916430-12-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809225845.916430-1-djrscally@gmail.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 driver currently has the unit of the V4L2_CID_EXPOSURE control
as 1/16th of a line. This is what the sensor expects, but isn't very
intuitive. Switch the control to be in units of a line and simply do the
16x multiplication before passing the value to the sensor.

The datasheet for this sensor gives minimum exposure as 2 lines, so take
the opportunity to correct the lower bounds of the control.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- None

 drivers/media/i2c/ov8865.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index d7926cadce70..ce4e0ae2c4d3 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2132,6 +2132,9 @@ static int ov8865_exposure_configure(struct ov8865_sensor *sensor, u32 exposure)
 {
 	int ret;
 
+	/* The sensor stores exposure in units of 1/16th of a line */
+	exposure *= 16;
+
 	ret = ov8865_write(sensor, OV8865_EXPOSURE_CTRL_HH_REG,
 			   OV8865_EXPOSURE_CTRL_HH(exposure));
 	if (ret)
@@ -2531,8 +2534,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Exposure */
 
-	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16,
-					    1048575, 16, 512);
+	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 2,
+					    65535, 1, 32);
 
 	/* Gain */
 
-- 
2.25.1

