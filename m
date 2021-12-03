Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E47467FB8
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 23:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383351AbhLCWQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 17:16:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383349AbhLCWQ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 17:16:29 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EC4C061751
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 14:13:04 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id p18so3427081wmq.5
        for <linux-media@vger.kernel.org>; Fri, 03 Dec 2021 14:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zklKn/bDTlrcVJ9rP836gkaxg/cLp9SeOEeQUV1jW1I=;
        b=XS5iPkbdeTiA3vSNy8PiqNHCxXfpSmM0GIWib5pvOd7274LHravET/u7KNXRzw943l
         uLW8XmR1KXH3J4H0x7qqTRR+KYP53mu4Ii7Wd4/apY+5qQTRwxxINBYb1xFTDiwW6iOS
         Z6iUsgVTbUNZb8FTWCY1Q6TSTRWmpwrLwEgto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zklKn/bDTlrcVJ9rP836gkaxg/cLp9SeOEeQUV1jW1I=;
        b=q28XXdU8yLHkNCI0CpHeGrp7K9KsEYQI/hgKT/Pa1oy0YGrPgtTNNWlWmTO6PsqF65
         qyPCvNwUyjxE+msmOXe7QGw/81A1YVkyEGJ+bm25V4DH+dyHQl6p8FkJbheG6rtpQtDY
         8Vw9uoE1peONIiKPU0V4vK4aIh4P/yLbWWh0fidWK0WhN08cZzdzmdKCBXM+RRCqJSIC
         aXLwjnss/v+4w0VAmmIK7Snd1F0F4cSiCbbZYpUrs6VhkFr2diVKeov2vGhzZaLgKDWi
         in2kuUG0KuaBkzD0T5C0QZotMjAHg689xUIpzc8Ky8yp8A6vtOCpL4xkSh4Jm1tOOA9U
         x1SA==
X-Gm-Message-State: AOAM530m4vbOALpfU3ksTjKOsokSPjVU0XzWHQSK0RzNR9QVprnzjVw+
        SsO3updTK0c6aT+ekkwJ9agKpAY6L5YQxw==
X-Google-Smtp-Source: ABdhPJx1yyuuszoZA+Fpd1OU61tmpHlyp426cjzL4I28ICT8KVhWOZxD8iBR+05BrFRiFMk2fjHmzg==
X-Received: by 2002:a7b:c007:: with SMTP id c7mr18367516wmb.82.1638569582962;
        Fri, 03 Dec 2021 14:13:02 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id f7sm7849710wmg.6.2021.12.03.14.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 14:13:02 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [RFC PATCH 2/5] adds ovm6211 entry to Kconfig
Date:   Sat,  4 Dec 2021 00:12:44 +0200
Message-Id: <20211203221247.46324-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203221247.46324-1-petko.manolov@konsulko.com>
References: <20211203221247.46324-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/staging/media/i2c/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 drivers/staging/media/i2c/Kconfig

diff --git a/drivers/staging/media/i2c/Kconfig b/drivers/staging/media/i2c/Kconfig
new file mode 100644
index 000000000000..2744f654121a
--- /dev/null
+++ b/drivers/staging/media/i2c/Kconfig
@@ -0,0 +1,9 @@
+config VIDEO_OVM6211
+	tristate "OmniVision OVM6211 sensor support"
+	depends on I2C && VIDEO_V4L2
+	help
+	  This is a Video4Linux2 sensor driver for the OmniVision
+	  OVM6211 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ovm6211.
-- 
2.30.2

