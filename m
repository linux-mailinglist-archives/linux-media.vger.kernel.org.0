Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7736E5EC22
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 21:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbfGCTDB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 15:03:01 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:32784 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbfGCTDA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 15:03:00 -0400
Received: by mail-pg1-f195.google.com with SMTP id m4so1704365pgk.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 12:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=x1DRYxM4S/B7SoxMDhNxSzKMNHFlAjuQUN144vOww2A=;
        b=EiT8BWbl+xHvb7JFvpcjaMBfzfBwNgp5IyVQl4JjzJ7b6sxwpmksLvde9vYcrpQreD
         sRJqJbjhYOYJBEZompfAK7sofYrjSgbr3fdLQJ2n4MyEJ/tNP4N8IInWdCHMZ7wjDu6g
         ofrPqbN6sZFxyvHDXBpRnX31lju59FJeiu5ao9NWIoOajR3+rnbMoO9tb6S1+cVNT5WK
         HOUWSNdjAjNLEk8ssEXpuoRe33pQouijP6A8ueGkJJ7KeJNAmfDcfhq3SmmrXvFM0rIE
         MWHD64RlAdRvOL/6ylNB8a9b9WZENN2Zn6wKnLQjbEys6SQJHq03eJP2+jKrOWhuJcPU
         MAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=x1DRYxM4S/B7SoxMDhNxSzKMNHFlAjuQUN144vOww2A=;
        b=WhSRxTo7o/CzD9wPoDiucvsgNV+UMhSQWUHStoDUiUSkK073SuCXjMU8gfIWfXDOrU
         GAozWDi5tEi9t6w+uVdw/iY4waddN9a8TEj5efoOXgEt0hiZVMPtY3XA1CskV/R/GNbH
         cDyMrg0cqUleJYcQ6M8vK4fEhIoYcCQOKi1Q+KEfS50Rkrp5+YrH9BeqGOu6kN9dFznf
         zQWaT2ZFNvcLV53uxiG3Mxw2IMKV8NDaqQCGd+RunvnwY3pYYz642s9Q6kdQUUBdmG8x
         hoeqH7ztlukH/0k/v1GQy8FW0zFAKQ4N2sQfeIMJs+lT6zJRpJIIVQiVHoHqoPvoeEdX
         HF5g==
X-Gm-Message-State: APjAAAVSIx3mWiBSHPba7w8L3BsUcqXfAij43Z1+yOmm5WMsy+sr8uqG
        SImcmAa+IROUyk23GAasP4fl
X-Google-Smtp-Source: APXvYqy8mtloT40dRnY/gaVB9FpkscYftIb1iPR1fDiwsvm8UFmgRrDb0Wh22kBTCyQyQyviBDgDXw==
X-Received: by 2002:a63:d04e:: with SMTP id s14mr13153497pgi.189.1562180579800;
        Wed, 03 Jul 2019 12:02:59 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:117:d72f:1d34:d0bb:bb4e:3065])
        by smtp.gmail.com with ESMTPSA id j14sm3631503pfn.120.2019.07.03.12.02.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 12:02:59 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/3] MAINTAINERS: Add entry for IMX290 CMOS image sensor driver
Date:   Thu,  4 Jul 2019 00:32:30 +0530
Message-Id: <20190703190230.12392-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190703190230.12392-1-manivannan.sadhasivam@linaro.org>
References: <20190703190230.12392-1-manivannan.sadhasivam@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add MAINTAINERS entry for Sony IMX290 CMOS image sensor driver.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d0ed735994a5..27e4c1f57b61 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14669,6 +14669,14 @@ S:	Maintained
 F:	drivers/media/i2c/imx274.c
 F:	Documentation/devicetree/bindings/media/i2c/imx274.txt
 
+SONY IMX290 SENSOR DRIVER
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	drivers/media/i2c/imx290.c
+F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
+
 SONY IMX319 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.17.1

