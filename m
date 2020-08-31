Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF632583E2
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 00:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730393AbgHaWGU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 18:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729100AbgHaWGN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 18:06:13 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFE4C061573;
        Mon, 31 Aug 2020 15:06:13 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id x12so6002738qtp.1;
        Mon, 31 Aug 2020 15:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OhO+uvWe7P3fu0I/Pp9og1RpdLfyNy+3/CGSilWCLe4=;
        b=joQjTVWC0noPX4GZvWUPuVDCEQM7dbJpRx8Vjw4OyzR2kzYFxGOvN8m3hEcgY9eeow
         7iBrhwZaVqBSF5CU9QE+rylOS0loECLR/bkSzu3nKiyTM+2oH+VdwjGF+qKiZUfnFe6U
         BoPBEse3NiwCVcZqLq9ppXn20+Opt6w24KMhFYW64Tr5GuAYq2Jx2XRlyUcY5T5C3srJ
         pU5lTY03TXr1txXqL8+Z3e/glsLfMQi/JvuH+w2DXhsHwpArzBgqpWvq1vhxYWHqXxTb
         u5sxzRY+kyPTBZmvB1VeTayajTJmTHCQ+xyAfRXtDL+BLaAd8qv6zsrD4GKmTE9uAjI8
         4vwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OhO+uvWe7P3fu0I/Pp9og1RpdLfyNy+3/CGSilWCLe4=;
        b=XANDwFScEwf0isgv0jnwtdxsEwe0H+DAKMNyt+3P/hMW3lg0xtnAsNul2Tin+SSmlg
         CvLRTO9CY7iw+pX7+Mv5gkTkz5YYuMGMZ3JPQVrkOau7cg6G3TOKEUEfoSsZYLDi+xkh
         /SarNcV1ikekLadqoLv7RQ84af5yiw3TGvqfVr2E7cQ9WfGfGzHhdD5tELg9lldoYZy3
         1v1yALI0cXVattVocYu5eZHNG1h71OSln+xdES/jxAJ2+Na3McF+/gSuz4JcFWjbxqLy
         Wt+iFoFSWOlVrOk5zJ2bu7YTw70JKHURn3WQ04l5gxX1lq/GbUi8IR/8+8BU+uomcEeF
         BJIg==
X-Gm-Message-State: AOAM530eJMNaNpWzcDVPpz2EK74Vqkp2/m9v5H9V6cs6zTZOuEHx417D
        SHG/j9PltGKY93UfgdFoIR0Y9f5CEpObFF3N
X-Google-Smtp-Source: ABdhPJzUxE6KANwOrP/KX+Kzebp21T6iydI90Vz2qXvmqwyMf6zlyzIcHkY7p1oazuj7XeMcCMlU4Q==
X-Received: by 2002:ac8:3714:: with SMTP id o20mr3625776qtb.0.1598911572506;
        Mon, 31 Aug 2020 15:06:12 -0700 (PDT)
Received: from localhost.localdomain ([190.189.67.136])
        by smtp.gmail.com with ESMTPSA id d10sm3051232qkk.1.2020.08.31.15.06.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 15:06:11 -0700 (PDT)
From:   Santiago Hormazabal <santiagohssl@gmail.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Cc:     Santiago Hormazabal <santiagohssl@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add KT Micro
Date:   Mon, 31 Aug 2020 19:05:59 -0300
Message-Id: <20200831220601.20794-2-santiagohssl@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200831220601.20794-1-santiagohssl@gmail.com>
References: <20200831220601.20794-1-santiagohssl@gmail.com>
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
index 2baee2c817c1..42fcbe256113 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -551,6 +551,8 @@ patternProperties:
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

