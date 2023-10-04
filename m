Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2CA67B8DE0
	for <lists+linux-media@lfdr.de>; Wed,  4 Oct 2023 22:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbjJDULn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Oct 2023 16:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbjJDULn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Oct 2023 16:11:43 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC55BF;
        Wed,  4 Oct 2023 13:11:39 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c746bc3bceso286125ad.1;
        Wed, 04 Oct 2023 13:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696450299; x=1697055099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NhDdNi3g5C1VlVNO0OVGqb7ZJFMfPpJmBhwKqaNZakk=;
        b=NTK3hn1rEerjtMl0Tq8DCjNqltj/leXLZTyM3LKjytjrtHa1YSkl/xvQpydx30FsQr
         xfEY4xfK3oDosB05ze12yGxyCjtLee3qwbhyh7wNt0FfwRUgHeuh0XhXEUghlU81CP+x
         MTFnVbpFv5AR+mcQxLHpcvhqFGn996HdVKRN8Q0OJS6cR+Yf4g6YcexN1oxhrDFjHkMD
         CDQnHrQnjeTyI+8TSE+MwnpgAS10E7rfLcOSk779SozNC/9KR+InHv4aJfYcofWRG+5v
         yMmBAszIQUZocxwiEzrLDZfptJJtAbsSIq1bmbx7X5WB/YZgaGHqOLpgTzyHpUQC7xzK
         nU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696450299; x=1697055099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhDdNi3g5C1VlVNO0OVGqb7ZJFMfPpJmBhwKqaNZakk=;
        b=xB3WcZ/FBwWc/f32obGuHSnxG3fW1nM+st9/pJgVFgMY+Nv41SKMOg40LnBUlBRmw2
         P34DvFnPc9+sxK32x5ABd9bVWbl2odUSa7Hr6UIqqhAIML2sDJtCxe47K56PB0K1cvuR
         uIVyOxV53Igz4UvXLGMfimc+1xvnCOEdn5+S7sQw4QUZS+6sQ6orkxznUumfKfYtVlWy
         HRnOQUzxVTb/D/VrZ90GCKpWW+tKXlVdVvz8xbsjVpTdR57TOahafe+AiUh2KqiKg70R
         63AmaNbZa2vXw0s5qBx9TjELrrlZ/5UgcDIIR83hPrj09+j5dQokOcmhr1cRP4JUVL9o
         JdFA==
X-Gm-Message-State: AOJu0Yxe2VptQ2x6cxeWnMsVTASelU/Nxneab7AHsITwbz+wxgEZOwon
        GXB2acqoj5xj8j8TuE1zmow=
X-Google-Smtp-Source: AGHT+IGHesDAysb9gsPgwNg7V+XH8O51hmKjy1rEmnD3n/nOTfCDxjcWCW0xa6dDjiuWsAh0t/VIwA==
X-Received: by 2002:a17:90a:1f86:b0:26d:1eff:619f with SMTP id x6-20020a17090a1f8600b0026d1eff619fmr2994132pja.2.1696450299070;
        Wed, 04 Oct 2023 13:11:39 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cb87:d6f:eb43:afca])
        by smtp.gmail.com with ESMTPSA id go16-20020a17090b03d000b00276a58e37c1sm1946987pjb.38.2023.10.04.13.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 13:11:38 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     rmfrfs@gmail.com, martink@posteo.de, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, marex@denx.de,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH] media: dt-bindings: imx7-csi: Make power-domains not required for imx8mq
Date:   Wed,  4 Oct 2023 17:11:05 -0300
Message-Id: <20231004201105.2323758-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

On i.MX8MQ the MIPI CSI block does have an associated power-domain, but
the CSI bridge does not.

Remove the power-domains requirement from the i.MX8MQ CSI bridge
to fix the following schema warning:

imx8mq-librem5-r4.dtb: csi@30a90000: 'power-domains' is a required property
from schema $id: http://devicetree.org/schemas/media/nxp,imx7-csi.yaml#

Fixes: de655386845a ("media: dt-bindings: media: imx7-csi: Document i.MX8M power-domains property")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---

 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
index 358019e85d90..326284e151f6 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
@@ -59,7 +59,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - fsl,imx8mq-csi
               - fsl,imx8mm-csi
     then:
       required:
-- 
2.34.1

