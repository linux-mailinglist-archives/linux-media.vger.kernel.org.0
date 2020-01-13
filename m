Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29420139408
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 15:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgAMOyy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 09:54:54 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46177 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgAMOyy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 09:54:54 -0500
Received: by mail-lf1-f68.google.com with SMTP id f15so7062327lfl.13
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2020 06:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/4VDJozUtUDRjtxB/kp8itvm7M638W5AdxJEFSJoD5Y=;
        b=jeR/VQc0PulVYOUfup/ulU2nIDU3eIPyVE1weFWd76SjMLSZRil90wY2EOshZQzElQ
         nkdh6c/fMQ38jXiVKrtgxkYluellmr2kx98HQExcEtz4VSZLtdTjRNlW30Cu/iMQ7X8k
         xRYnX5Vji9x/H58DTFq/VVsQkZB6hvVj8yBwTEj/klOgcOawK1ufqLcZmT3nPsub+4ZH
         gLg3/9zmkHJ+o/dVlWO6M6RNSxonmkF/GNAZb2o3/8NXXkgz6ZXp8YEvOCEVL3ifEYM4
         qjpsGeguLTyPjw/iY/1lz0BXq9nyWnboyFX0eNafZyNNNcWd/wG2EnUDK+LPz1r1GoSc
         L3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/4VDJozUtUDRjtxB/kp8itvm7M638W5AdxJEFSJoD5Y=;
        b=sSCduQJ7dbXM/LtKlAig39Yzauw4T2R5CH23lm62EH90oBZbok5bhttkM8zw1dxm3R
         36HCJ+ayJTf5luv65z/1jJ5boYTX0qOCyh9PzAxqHFFFfadHY/mXmP/WzhYyYvr6nZ/L
         nYgJ4nfBcjijx5qGtsdsTCpoMa2inLf6CmeOYPC5gIlTcwbJPmiV1/96r5x8hYTtv1Sk
         TlL5y24rupZzhwojJSRtoal3Y8W9VNEDrPk83RHLQuZR7VJeeFPhrsDhMLNIMEnHTJMu
         QudLYBL2y+GoMALfuE6mNHRKFDzAOuLceUZ/K32JK3hJ7rKT/T6zVTFQAenaZkJKmrFo
         I1ig==
X-Gm-Message-State: APjAAAV/CyAa/K4iu2iDBs+U3oF16JCvIbSr2oQD88E5TmoZCwsDrkgX
        lSf351llbNcL6Vg2v9elJLWqzQ==
X-Google-Smtp-Source: APXvYqxXGFZweM5WZczXbpuahrbpAK1LP3x1QwThF2hCHZ3knvtCEIHnQooimEJkoHWuXmCGMGXEXg==
X-Received: by 2002:a19:4849:: with SMTP id v70mr9680953lfa.30.1578927291997;
        Mon, 13 Jan 2020 06:54:51 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id w71sm6822281lff.0.2020.01.13.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 06:54:51 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] MAINTAINERS: Add dt-binding files for Venus
Date:   Mon, 13 Jan 2020 16:54:24 +0200
Message-Id: <20200113145424.4867-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds a path to devicetree dt-binding files.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 983d3c97edd1..8c97d1e7ea50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13732,6 +13732,7 @@ L:	linux-arm-msm@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/platform/qcom/venus/
+F:	Documentation/devicetree/bindings/media/*venus*
 
 QUALCOMM WCN36XX WIRELESS DRIVER
 M:	Kalle Valo <kvalo@codeaurora.org>
-- 
2.17.1

