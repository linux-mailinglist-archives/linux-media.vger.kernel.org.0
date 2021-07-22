Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795C23D2DCB
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 22:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbhGVTyS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 15:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbhGVTyF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 15:54:05 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5712FC061575;
        Thu, 22 Jul 2021 13:34:40 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id z7so12437wrn.11;
        Thu, 22 Jul 2021 13:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rd2Uui4SgiL/O80dzJvFPj/8vT3gw3tY+/vUri5pveI=;
        b=IkQN4IJ/lADESUa47LmCZNJWrIUr7g+J6HXO8onCHCzoFN6Ii2khOlUL43nHdqpJ3t
         sPQER/hJ9y6UV8d6B5YXuX76iw0r/InpzWoEJGtVATUbDekcyNQY5YZGSVPS+GcP+67k
         miLUyFyjZ8aluJx07rx7QUqC71LAyWuwz69tHblgT/UrVXCWfSM1FGnq8PBY8vlzqU5H
         2gTqWP0SXh1VgF+7MQ3cSPLWY0iieDkc3yyVBw39j+g9oIlK3TNhOY3ygZ8d4kJCgDvL
         Kgh98RkXMunp9TwyCZkOJu43nfXh1jv1L7nNbsCztKhlVUWJuaiiI4/RlW1GbGevBOrT
         sG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rd2Uui4SgiL/O80dzJvFPj/8vT3gw3tY+/vUri5pveI=;
        b=PF35jPci7bLyrWMeBGB3sVbSi9NVOd00aCNIQTSmF6+RaNkrgcjzk36Qa/79gVfInA
         zteek8nE/B8Kc/+T6R76ayPJP649ppUyLgAQKvkVztMoPkOwajzJAZwtEsmotCA7Ptse
         9/Qq+jTMI+CMP2FA0u+l9s2hTKyhxAzHySC5Ronqg+hmRrN3D70c1LmNnq5WCyEgAhw+
         lBqb7P7as3G5AWj0ceU6vTrJXfSi/2JZDDraWta4dmT5pNNeTj7wgDE0RK+uKXqLrC99
         AHfSSHPfu7VZdaOo110VgBvwr9AU9nhMWkGT2lBWv1Y9hh3Bq3ynJRS5ymlrNCo+omC3
         pI/g==
X-Gm-Message-State: AOAM532F/vWtDpHdthr3ZYVnvdjNSVARPdLaK0i+f6xHll8Oj4g2mM4Q
        L0XR8YP0uuO3mRbPIgxyt9M=
X-Google-Smtp-Source: ABdhPJz9qYMOzyFPMiivE7abF/GUFcLsf6t8t8Bl0fQ2Wh0HtjQZoALY7LIqznQJDe99xhktf6L3kA==
X-Received: by 2002:a05:6000:180b:: with SMTP id m11mr1802385wrh.6.1626986079030;
        Thu, 22 Jul 2021 13:34:39 -0700 (PDT)
Received: from valhalla.home ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id b16sm31036455wrw.46.2021.07.22.13.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:34:38 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 13/13] media: ipu3-cio2: Add INT347A to cio2-bridge
Date:   Thu, 22 Jul 2021 21:34:07 +0100
Message-Id: <20210722203407.3588046-14-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722203407.3588046-1-djrscally@gmail.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ACPI _HID INT347A represents the OV8865 sensor, the driver for which can
support the platforms that the cio2-bridge serves. Add it to the array
of supported sensors so the bridge will connect the sensor to the CIO2
device.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 4657e99df033..6195abd7582c 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -24,6 +24,8 @@ static const struct cio2_sensor_config cio2_supported_sensors[] = {
 	CIO2_SENSOR_CONFIG("INT33BE", 0),
 	/* Omnivision OV2680 */
 	CIO2_SENSOR_CONFIG("OVTI2680", 0),
+	/* Omnivision OV8865 */
+	CIO2_SENSOR_CONFIG("INT347A", 1, 360000000),
 };
 
 static const struct cio2_property_names prop_names = {
-- 
2.25.1

