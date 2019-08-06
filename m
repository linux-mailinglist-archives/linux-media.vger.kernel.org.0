Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4036783256
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 15:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731864AbfHFNKI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Aug 2019 09:10:08 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39129 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731842AbfHFNKH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Aug 2019 09:10:07 -0400
Received: by mail-pl1-f193.google.com with SMTP id b7so37913644pls.6
        for <linux-media@vger.kernel.org>; Tue, 06 Aug 2019 06:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=x1DRYxM4S/B7SoxMDhNxSzKMNHFlAjuQUN144vOww2A=;
        b=oUkCdFiaTmZ8YWhjKmmX9kta69kGgzWITjsFkueRoaps7eZWMWSw47AOaqC0Pnrmvh
         CvUvtUFYz7JX+4oGPuvOSAIf8R4F9M7yBpZJGKc7DJSJbWCPyjyP4dqe9y+ImdYq5+1c
         CAAQ4HwQZsme5eotFfJV0nlXHowMbBG9WrhEQpAaSDELEB1NuqRh5SIrYH1+V9ZlJv9E
         BQhbdSuje1UEGomUVZy3sBoreZTo0n1gqY3KRSzjVtdaff39gmoTvm4iBVYe2/Ysef3b
         zcPbPDHCaFwcJ5tYfyV99VPOF8pTOYBRSDS842MqlLLctrPytfmbLRIgi2XOXkL8Lcbr
         qD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=x1DRYxM4S/B7SoxMDhNxSzKMNHFlAjuQUN144vOww2A=;
        b=uXQ2OvO+Y6mg5XCeTC8mrPfNtspuW8OjTTy0THJKCfJtNMOy0664id5emkMvClykXo
         Uc6Jc983zu8Lzdb59eLh2cpU0F44hYF9MsMEpX0MQ7BAE5MAOA4L1swia952Xo7Pl6r1
         WFYar9BFnw5jbFEUOi+vSgXUR5YJLvRFa9DTc1S21byE0UIOuEUtxyQKv3kE5p15VlN3
         MuQ+FFcKYXDqVMm8M8raT76vlEOiUWpRC3k/EUfRlOlRuvI0V+9FBaWvcR0kMb0duuj0
         sK2G+x6eFtTNir6/L4+SOIgc3OJRqcnxBKIJwOn4bV4oMjynU0uNH0tGYDsGDZC+UXLr
         dKLA==
X-Gm-Message-State: APjAAAWprucA5FbnTf9f7fnJLtqYlObZ24HGiB6d5O8fNdyaMPfZdccF
        AFRUA3b9Pk1W8S1YJsQP/NHV
X-Google-Smtp-Source: APXvYqyqBD0hvTStxFBTJ8PSsP8JsP8y9JbdoOz6Z54aeKGRi1OhfciLK1A+yM7BTbCaJjLifJASfA==
X-Received: by 2002:a17:902:4222:: with SMTP id g31mr3254070pld.41.1565097006526;
        Tue, 06 Aug 2019 06:10:06 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7180:928a:153d:caa0:477e:f9fd])
        by smtp.gmail.com with ESMTPSA id v8sm73715371pgs.82.2019.08.06.06.10.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 06 Aug 2019 06:10:05 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/3] MAINTAINERS: Add entry for IMX290 CMOS image sensor driver
Date:   Tue,  6 Aug 2019 18:39:38 +0530
Message-Id: <20190806130938.19916-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
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

