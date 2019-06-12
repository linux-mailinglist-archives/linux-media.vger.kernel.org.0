Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B47C241ECC
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 10:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730665AbfFLIPw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 04:15:52 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38559 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730629AbfFLIPw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 04:15:52 -0400
Received: by mail-lj1-f195.google.com with SMTP id o13so14288811lji.5
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2019 01:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YqGT5WThCZMYA26dhJESzrde7q0JaRkvOxBfpGhYiSg=;
        b=SBRcAI8Z6fAG9UCaaNYTY7J5flOEau3Q95n3B+63Ji14jC7ffereQ1kDgrEzrGQVAy
         qqk1BBt5epoNMk9KCmMaqWO1oOQt0E33BjEbPYJHrIhKA2K9B7A1vb0zVO5kitd7grCq
         YGqPNL7y8c5KwAciDFdRIfHrGDrDnp2O64sT3b2VCwJJY6OAmZ2YK8WFgplqADdfvqVU
         HnNBzkYpCdO2iyA50XY/+wjHoa9mVNnFfXhkGjeMyqSpElXZ1YnHtAU5iaxG6uSng4ZX
         7XAX2ZxseontlFnq3QrJV3yh5iPDu1eGKTuDb23rk5gfmitlfViLvxsMt+35D9fng3TB
         GEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YqGT5WThCZMYA26dhJESzrde7q0JaRkvOxBfpGhYiSg=;
        b=VcYFc+I2mMAkG0l6OB4GHNGDaJKQ42Aszb5JOQD1MC56qyLyuU8kPtB/r3+k3sW4nM
         atQUfQ6fMLQ0RWE2ImyQE7xSFmGi0448c9DTz9LUw2zMsMMJ5WFU+yXY+jxdelsdeA3l
         ho0mwbJMZfM7dwb/1e/Pn1HeN8XuhORrwYmt/FJQ9mrF00SdBKiVTclQzWMN/ou2j5ox
         QHc6yUSpeCE29urYIdmYdQpdpKXnJrsSq0VPr810D+IJfrPAsfg2DdWJlFO2zENrZG6V
         c4Fs5I4Z3V4Pdct8G8+HbzF8FpDUs9Pt4B64MTImD5eC1MQWUxctCvQiYfDbb2Y7S9KK
         4QSw==
X-Gm-Message-State: APjAAAW45fiJPEZlFb3RKbcI55qfm0cGQYKjeaXvQivORKpMiGThShf/
        Og897S0EN9qqomwewvBnVRhEAA==
X-Google-Smtp-Source: APXvYqw2uuQIsph0FSSUmix0xfxuRcDLTNX799JDtGMDRbK14OBdc5uh+H81PNxZyzepgjjwPIJwxQ==
X-Received: by 2002:a2e:4a1a:: with SMTP id x26mr28290659lja.207.1560327349966;
        Wed, 12 Jun 2019 01:15:49 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se. [213.112.54.28])
        by smtp.gmail.com with ESMTPSA id z26sm3003303ljz.64.2019.06.12.01.15.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 01:15:49 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v2 2/3] drivers: media: i2c: don't enable if CONFIG_DRM_I2C_ADV7511=n
Date:   Wed, 12 Jun 2019 10:15:43 +0200
Message-Id: <20190612081543.2203-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CONFIG_DRM_I2C_ADV7511 and CONFIG_VIDEO_ADV7511 bind to the same
platform device, so whichever driver gets loaded first will be used on
the device. So they shouldn't be enabled at the same time.

Rework so that VIDEO_ADV7511 and VIDEO_COBALT depends on
DRM_I2C_ADV7511=n or COMPILE_TEST.

Sugested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/media/i2c/Kconfig        | 1 +
 drivers/media/pci/cobalt/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 95d42730745c..79ce9ec6fc1b 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -511,6 +511,7 @@ config VIDEO_ADV7393
 config VIDEO_ADV7511
 	tristate "Analog Devices ADV7511 encoder"
 	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
+	depends on DRM_I2C_ADV7511=n || COMPILE_TEST
 	select HDMI
 	help
 	  Support for the Analog Devices ADV7511 video encoder.
diff --git a/drivers/media/pci/cobalt/Kconfig b/drivers/media/pci/cobalt/Kconfig
index 6c6c60abe9b1..e0e7df460a92 100644
--- a/drivers/media/pci/cobalt/Kconfig
+++ b/drivers/media/pci/cobalt/Kconfig
@@ -3,7 +3,7 @@ config VIDEO_COBALT
 	tristate "Cisco Cobalt support"
 	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
 	depends on PCI_MSI && MTD_COMPLEX_MAPPINGS
-	depends on GPIOLIB || COMPILE_TEST
+	depends on (GPIOLIB && DRM_I2C_ADV7511=n) || COMPILE_TEST
 	depends on SND
 	depends on MTD
 	select I2C_ALGOBIT
-- 
2.20.1

