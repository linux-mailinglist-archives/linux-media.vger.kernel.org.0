Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F70239D65
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 04:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgHCCJy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Aug 2020 22:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgHCCJx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Aug 2020 22:09:53 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E0AC06174A;
        Sun,  2 Aug 2020 19:09:53 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id ed14so16728533qvb.2;
        Sun, 02 Aug 2020 19:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YNsoK3KOOTDKOlm423I4wyXXKHArPOY0+JN2KGnQMf0=;
        b=NiyspEtcw7tJK0rsi4qeywBv/yPE8c2X38uRM9x1Y/9/1I+bEMEGz8CmUSg0t1zvv9
         O0bFeUHRwQxJqpXIs89annTT8Bd73LUutcXXn+d/4UaIFEZkif7SgCyy/UqMeQYfM+7C
         UeEBp+VykglrNyfnPUw5U1Hm7OhTaSFD1i13HQsQU4474ingNUYRrrPL1D+4uL6EzGV2
         OLD298Ut5VaJMI+k3YeKJ74/ZTspXPjFII80R/9St8g3O3pYlZL0g4QeYxFmdmvBwCBs
         KsxGYU/Kf1WOIt8vmQcwmMPGCgYyCILFQLgHdGH/9UtE37evyAZO08gEpkbzz8ccmj+i
         nCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YNsoK3KOOTDKOlm423I4wyXXKHArPOY0+JN2KGnQMf0=;
        b=K6ZZIHGtdGiU+Xq6Acabe8CswdYrRbaTJRSvv5GmPCWJpiUVnJf6YAqfgC4eOwzQgu
         xal+7aQt14oJDsob7yJlMg80ahN/MTAlbI0ZwEoWgu+DsXVk2xN71h5EVt+/0IEgaYsm
         XZXZnW3+mJyBlwpmdOmOLnDmNrPW6VeClEJd1LNq+tveJco52fLohOV4eKULFSdVgxAz
         AYzxlWacOfd1Sr4OQEfTVEOYhDq3BAL/v5IxhsOfCS+VbhxvsUXNC1jh+sjZeN/ZbQSH
         Gxs4OseYmYgb7zGZQR+5Qs6HoeK4471oRueSCBTpZlTtFPM8zjuVa/vX0XEPP+pqRvcb
         M8jg==
X-Gm-Message-State: AOAM530JpQamALMGHWY6Ig7COvqqBkIXYy880acalHhadkCLr7/q/dtn
        VY+mHQRkbt8y5bq2OjClb524aTSMryM=
X-Google-Smtp-Source: ABdhPJzHPkgcs+KS6q6/ahqZxSpHuXMIkSHis9TzS5iBfgik5bjwy45gztWdoWW2pMgredDC6pvQEg==
X-Received: by 2002:a0c:d98d:: with SMTP id y13mr14872811qvj.203.1596420592499;
        Sun, 02 Aug 2020 19:09:52 -0700 (PDT)
Received: from localhost.localdomain ([190.189.67.136])
        by smtp.gmail.com with ESMTPSA id d124sm18458083qkg.65.2020.08.02.19.09.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2020 19:09:52 -0700 (PDT)
From:   Santiago Hormazabal <santiagohssl@gmail.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Cc:     Santiago Hormazabal <santiagohssl@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add KT Micro
Date:   Sun,  2 Aug 2020 23:09:19 -0300
Message-Id: <20200803020921.64151-2-santiagohssl@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200803020921.64151-1-santiagohssl@gmail.com>
References: <20200803020921.64151-1-santiagohssl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds ktm as the prefix of KT Micro, Inc.

Signed-off-by: Santiago Hormazabal <santiagohssl@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 8261ede298f8..34809300fddd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -547,6 +547,8 @@ patternProperties:
     description: Kontron S&T AG
   "^kosagi,.*":
     description: Sutajio Ko-Usagi PTE Ltd.
+  "^ktm,.*":
+    description: KT Micro, Inc.
   "^kyo,.*":
     description: Kyocera Corporation
   "^lacie,.*":
-- 
2.24.1

