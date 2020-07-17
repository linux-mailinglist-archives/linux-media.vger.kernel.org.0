Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F3D223010
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 02:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgGQApY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 20:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgGQApX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 20:45:23 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902F4C061755;
        Thu, 16 Jul 2020 17:45:23 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id o2so1073435qvk.6;
        Thu, 16 Jul 2020 17:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wg5/1Fkg8BOz2dSqGU1QYGzqUcdw8lqCYTdfPP+rUZA=;
        b=fTZSYZ9+W6mDjCq+J8sdq35hf7dox570k52ZdHZNT9T8mwhr5b9KO25iwMhDJkIR1P
         fGtCEBjPU6CllxiR3dNoECiJfASX3PgVX0ItG6rTWDVMLbKr2RHvZcpr5HMJ/bfqFhtR
         tgbspApi7RdAtJRyf8PvzlqCp0iDf47KOwjRzyMHbyNKGnbkbc+jk1DuOE9anNxzGALb
         3snx9EMCiloGjuJF0i+sJvn/UBhCGBjl2RbKorjHV4nAXVBf359uScKLo22qQBRi+sUG
         EplP21WWbOESWKBgthz36uyDKud8/OpNWvAJyMwJglivW6ueIzB740ojDJFuenoUMqGS
         49Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wg5/1Fkg8BOz2dSqGU1QYGzqUcdw8lqCYTdfPP+rUZA=;
        b=Zf4k+RXkNR/eHkUku53JLuJ35B7X0UFRIK+3NoF6/EgZ6EJ3Zhk0/kD6qG6+hv6Ltn
         oWDqkkhMp8PU6luVw5Iy+tQ4m1DJZxLXtMtmfEyCGerb0/eQvx1h+8Jajdpj3z6qlddm
         usem9gyg+bne05HVxbQQCvo4vBaJ9QOwim19ZJIuxrx30jAckKvkJ30bC3joYwXOXWeA
         1hgky9JF4awlukGbqC6AAhnLPUIy8DZqMb8RLoPqfpGHHjn+zpOsh0mTDXUlbjxHn6so
         7AVzu50hGoXSAvdqsF71EOPAfpuhO+AZXAbHJpBI9b6p2RrYPicPKh/7T5r/MZ2WYHn2
         aZUg==
X-Gm-Message-State: AOAM531/nH/gwD8UV2U6a8aoPMWXiOb/f6UPsRLUSu1W8zAJxXvnSWlB
        5f2bf1RFr/pCDWGmPZEvl2AlaPPtPFwTwQ==
X-Google-Smtp-Source: ABdhPJwEuc5wUV4xqElNihNl4PseOEFgTokVt0gJItZYRFEoth7sUtmC8rrQuxbqDS9QFuwu4lyBwA==
X-Received: by 2002:a05:6214:12c:: with SMTP id w12mr6596584qvs.78.1594946722627;
        Thu, 16 Jul 2020 17:45:22 -0700 (PDT)
Received: from localhost.localdomain ([192.58.132.250])
        by smtp.gmail.com with ESMTPSA id y22sm8890042qth.46.2020.07.16.17.45.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jul 2020 17:45:22 -0700 (PDT)
From:   Santiago Hormazabal <santiagohssl@gmail.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org
Cc:     Santiago Hormazabal <santiagohssl@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add KT Micro
Date:   Thu, 16 Jul 2020 21:44:39 -0300
Message-Id: <20200717004441.116248-2-santiagohssl@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200717004441.116248-1-santiagohssl@gmail.com>
References: <20200717004441.116248-1-santiagohssl@gmail.com>
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
index 9aeab66be85f..35985934a672 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -545,6 +545,8 @@ patternProperties:
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

