Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F66DB62A0
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 14:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729222AbfIRMBN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 08:01:13 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40418 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbfIRMBN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 08:01:13 -0400
Received: by mail-pg1-f193.google.com with SMTP id w10so3943438pgj.7
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2019 05:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=WkQ76CITam9F7JiZEHEwL0RX83IOrZqz3Y++2Xoowf4=;
        b=eCbt59BqCWohhKOx9Y+Z8ftqpShDtgftW5+zz/dI+Ju0QCOAJrpXZrFORiiEptuIvK
         vhaDaD8/3pYuo+FrATD9qYuWzYLvQ0VZhqNfBX0TOh5x+ZjETAmFftVs2GzCGx0ENEIT
         cWJDlROlkMGsN+Ve2tEMn4TINILoLkNIr3ASNBPBbmqflF1dtZsIdyXJ2gFnresOc0Gv
         ZdLO/i7iTr6bC9IZ2eoT2XzBhLm/dwEPnG/8XzWtWbrDlho2sNidw7Xm0l5lEBbJQwi0
         tHitqC51imBnyvE+ZVAsrmvobrsRHw/s2SaB7sDs5bI66RgQkw8ZiHo4PUYTWBAzuAq6
         NJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WkQ76CITam9F7JiZEHEwL0RX83IOrZqz3Y++2Xoowf4=;
        b=RyHzB0kb4cI4F3303yGoBTzqfLkFVcuNE5hBsWYSXgJ3m6uNsyZdsvcjZQTFyXWCBm
         jKnsbgxqjcwL5jEQUQL21n8Kav6pokchtam351L6wGa1xeG4DgtoRl5Z6MEkxDWX7P4A
         06IiaN0TQSSRbtzu5XJ/wpr+9V4zI2UkqLGgrruhXTDz5jQkKK+meWcxUG5jv/MqszAx
         +q7g3ImnxipXPtmjhR/eML2yn6gkBo/iW8hlwW2eS5Dc0M/cx0zLN1QT8V8D4wyoPj+n
         QIbmvVZE2t2w0ynYNIB4QYVjvXrabz1sRxNcNDvUzYP4vMaTuoxrKL20VvO3KL9NJX2H
         W7iw==
X-Gm-Message-State: APjAAAU/6HWbzJkguN5OzLIAObza5Eg6qGMKcxdQ61pBSJY718U9gBBR
        a6C0FA9nhy/EaBWSaRUfgDTXFLpaxcQ=
X-Google-Smtp-Source: APXvYqybyNmzYSLFX4gGeI++WncUy4zJYIdFMkUqy0VPaTasXIn9sKMgm6+FthWofH2FZyQmGqRg8w==
X-Received: by 2002:a63:5626:: with SMTP id k38mr3667623pgb.134.1568808072722;
        Wed, 18 Sep 2019 05:01:12 -0700 (PDT)
Received: from pragneshp.open-silicon.com ([114.143.65.226])
        by smtp.gmail.com with ESMTPSA id z13sm6882241pfq.121.2019.09.18.05.01.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 18 Sep 2019 05:01:12 -0700 (PDT)
From:   Pragnesh Patel <pragnesh.patel@sifive.com>
To:     mripard@kernel.org
Cc:     Pragnesh Patel <pragnesh.patel@sifive.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: dt-bindings: Fix building error for dt_binding_check
Date:   Wed, 18 Sep 2019 17:31:00 +0530
Message-Id: <1568808060-17516-1-git-send-email-pragnesh.patel@sifive.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

$id doesn't match the actual filename, so update the $id

Signed-off-by: Pragnesh Patel <pragnesh.patel@sifive.com>
---
 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
index 27f38ee..5dd1cf49 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/allwinner,sun4i-a10-csi.yaml#
+$id: http://devicetree.org/schemas/media/allwinner,sun4i-a10-csi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
-- 
2.7.4

