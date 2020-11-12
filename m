Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112412B1206
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 23:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgKLWt3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 17:49:29 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36857 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgKLWt3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 17:49:29 -0500
Received: by mail-oi1-f194.google.com with SMTP id d9so8305602oib.3;
        Thu, 12 Nov 2020 14:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p5GGg8Ebp0FeaFVzCFVQ9l+zj8+LXU70iqTZI+zTHD0=;
        b=Vy2DY7zQwujZLz5g/5UZVy+KU4FPPD2o+3r2acI1JEzL+11oXV01OFfzI7Hph0CSTg
         z3UCSQzdMtSIrS6D+TZLEYxlTHamxhzCSxcMTxzwxiqCPdu08rc1jpt1zWrGk5E+oM+D
         XL85F7slk9cmiy9EZWfs5B0xhGl1yscjU6N9Y1HgV9WD1ejysgalZCZEjXrW6/fa5NLV
         8LqRTAjpA2b7nHLP6olnFt53vdKD8HQJHo392qA4rvz+0Zyuws5UzHwzGzDkbAKapDaH
         uB+HnSsywSlAMjsjfxxkVeDi1ILwYCg+Xx5saHdI3VKM75ruVjY1+ELvzlBSYPJ96qJ9
         /f9g==
X-Gm-Message-State: AOAM531G73wA6moad5RlCIuYHPmw7RahhlDWy3Rqv4xG661NCADOQkZN
        dOct3yWKIl+ZHdZ90GzzgPXbSpcgVg==
X-Google-Smtp-Source: ABdhPJySpnsKn9+o+tgwoWSqIfpLXkoKOXrNb1Yb0LvpW9xgnJ4FksDkQjTOw4CkClChlGG6TniRRQ==
X-Received: by 2002:aca:c6cb:: with SMTP id w194mr44102oif.27.1605221358652;
        Thu, 12 Nov 2020 14:49:18 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id 85sm1456641oie.30.2020.11.12.14.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 14:49:17 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: dt-bindings: coda: Add missing 'additionalProperties'
Date:   Thu, 12 Nov 2020 16:49:17 -0600
Message-Id: <20201112224917.165544-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'additionalProperties' is now required by the meta-schema. Add it for
coda.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/coda.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/coda.yaml b/Documentation/devicetree/bindings/media/coda.yaml
index 7bac0057faf7..be6218354631 100644
--- a/Documentation/devicetree/bindings/media/coda.yaml
+++ b/Documentation/devicetree/bindings/media/coda.yaml
@@ -59,6 +59,8 @@ required:
   - clocks
   - clock-names
 
+additionalProperties: false
+
 allOf:
   - if:
       properties:
-- 
2.25.1

