Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA281268DF
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 19:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfLSSWq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 13:22:46 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:38910 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbfLSSWq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 13:22:46 -0500
Received: by mail-pj1-f68.google.com with SMTP id l35so2918276pje.3
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 10:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=KXwFzfFzkYhY2Rnva/wezf54bh0dmerJAZ0lGR8bFSM=;
        b=Ob3u1ZS5Y2lM+xNn3smagXJWwa+13n2h9N1s/MqmA/ZeLp8npgsWnqOQglR44wkR8t
         HwDBZruhxNK+aDv7mQMK68l5P/N4C3O2JckUUbSHKkEGsbWvu/qUFOcQqSTODZhCRUse
         9ZFwm+rdTllSQV5tl4j2ccySo67lLA6HifXiCaRp6gpWjStS4Q1/fijvecPvOoij2Dex
         /nlE6Yr5Z6tQIWzXKs/NOpbaV/umuWhjvUfJbruMq16PVbMR5XloFfGuajjYq39ELwgO
         kP56uIFCttgb3blX2KKbPrbwhtXs+SqvS9ZIUvRI9tsPaZky9umRogofXWZc2EA75coY
         +XRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KXwFzfFzkYhY2Rnva/wezf54bh0dmerJAZ0lGR8bFSM=;
        b=L26QL0KcEk52oMH3uEqwqXc4l+qXy2PtCJl67emJLQHrp3kAoBsRWxJknpFyq2u0jr
         6CXuMrScKU8FctdwezCDOqfbxpgXk3byKglYYiWEgrAOkUAqdBOsYYvXFDiNTexx9EBn
         3rHvtilv27oGY67ylgIUI/75xN9M/vwh3QCLPa3jBfZ/4lzkRRS8XNSoGQzHAAaf23bp
         MRjH9ya/AjaeQyQX7IO4BeO2V10UGLmFB87T28L3ipWArMpG/+j2FWHPt2MPOhUVn0D1
         NQiEABrOF5lyn8wQj4A0Z5Pr7l4V0dyB1dvzy72PmzVsv1ZO5mPm2KCO2MCECNaxixHL
         F32A==
X-Gm-Message-State: APjAAAWUZX4FX6hxi5zektIUS1RqBy2jZxFHkS37irREuRMQ+sUg8EyF
        dTLCF8zSA2AuWnPY9Auq4XFu
X-Google-Smtp-Source: APXvYqwHxxL4wmdr1ywy2f+7iVqrfz0NIx6K6ZuFNh1p+BD48pNF3UuYWRUx2XBjCUe57WmKnFOgdA==
X-Received: by 2002:a17:90a:f84:: with SMTP id 4mr11269191pjz.74.1576779765730;
        Thu, 19 Dec 2019 10:22:45 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6010:65a5:a416:e9bd:178a:9286])
        by smtp.gmail.com with ESMTPSA id i3sm9085735pfg.94.2019.12.19.10.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 10:22:45 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/6] Improvements to IMX290 CMOS driver
Date:   Thu, 19 Dec 2019 23:52:16 +0530
Message-Id: <20191219182222.18961-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patchset adds improvements to the existing media driver for IMX290
CMOS sensor from Sony. The major changes are adding 2 lane support, test
pattern generation, RAW12 mode support, configurable link frequency &
pixel rate.

The link frequency & pixel rate combinations depend on various factors like
lane count, resolution and image format as per the datasheet.

Thanks,
Mani

Changes in v2:

* Incorporated review comments from Sakari
  https://lkml.org/lkml/2019/11/29/428
* Added a patch to move settle time delay out of for loop in
  imx290_set_register_array()

Manivannan Sadhasivam (6):
  media: i2c: imx290: Add support for 2 data lanes
  media: i2c: imx290: Add support for test pattern generation
  media: i2c: imx290: Add RAW12 mode support
  media: i2c: imx290: Add support to enumerate all frame sizes
  media: i2c: imx290: Add configurable link frequency and pixel rate
  media: i2c: imx290: Move the settle time delay out of loop

 drivers/media/i2c/imx290.c | 337 +++++++++++++++++++++++++++++++------
 1 file changed, 283 insertions(+), 54 deletions(-)

-- 
2.17.1

