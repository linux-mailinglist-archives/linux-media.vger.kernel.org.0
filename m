Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6296D498558
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241252AbiAXQzg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:55:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243450AbiAXQze (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:55:34 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38243C06173B;
        Mon, 24 Jan 2022 08:55:34 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id e81so26400071oia.6;
        Mon, 24 Jan 2022 08:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rU7StC0vWHC6lDgyRB9OrYSRZCxJxqMjaJg6rAe9Yu8=;
        b=SbKgG2c+STKyf1fu/56122rac9jR+PH+pXSU2ntKiPGdvRHBeEoOjbzAfddbFcmBlP
         oTC0UABtn1j98kdYSHU2MDgsDcEl60C03yJXzsTg3hh5EYZWgkqlsL3SgQ//bnq7uQa4
         l7zMsnwhfTEdG/M2itjyr3MQq3abiNDcKWNvU3yGUzcz6m6zesSkhp7efE/lmBSs4eU1
         ZMHqwmhDCFQPu5JIZQhIa9r30dN/rsOAkb4JQAN2lSe9g23GsSrqG/P6+TRd05JqUNyR
         wqMoI0laFObT0hU/+Qv67i5YasWkAed2xLGwUopkgpw0y305QpW0IOPj9JKIkboXu3+N
         fktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rU7StC0vWHC6lDgyRB9OrYSRZCxJxqMjaJg6rAe9Yu8=;
        b=n6n9ct2R5U2X/2SDBMwl5M/LiyMCH42DlqLF1FBEYiK57hG7SKmHjC7FPV/6erslAD
         QyBotBl8zyT5wPTf0HwxNnVGizeHCc3VUk1X+62d+bDHvgPH5GCZWE4QvkkvdwxoaOBl
         0SF5QKKvbe+++Kg/9sTba3ZbYTBtSywTjfaQ5nLp/sUlywLG9MRzmSFSBevfuj3C4+7M
         QAJD2fMwA8OlfBd7qMfQGoD4Ttqy9fj53JYbaeqY4xqyOyMb46KQsqDztzdFIvhpiOBU
         WMS0LXXCax0fqMVuF+k9NnC2mRewvZmvvq+PHiwZCO9RZ8bzYQxIhCxB/Qnl/j3cS/Cd
         YW8g==
X-Gm-Message-State: AOAM533+LmEIYuChdzM/KdLZQq0UQ6BXJY8lTBlYV7+z97COUk2CTzUR
        tQjI0rxHfh7isRwFvQZY92QTcn6eods=
X-Google-Smtp-Source: ABdhPJwCzE3kihzj0hMg6jGxBCbVT5pJNxTin21Ous/7hNUaGdinQd3cdZsTbygXQ25Z9VgKxNYnCg==
X-Received: by 2002:aca:c104:: with SMTP id r4mr2130359oif.93.1643043333646;
        Mon, 24 Jan 2022 08:55:33 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id v22sm4418370oot.10.2022.01.24.08.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 08:55:33 -0800 (PST)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mchehab@kernel.org, emma@anholt.net,
        mripard@kernel.org, linux-media@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/6 v2] dt-bindings: vendor-prefixes: Add Geekworm
Date:   Mon, 24 Jan 2022 10:55:21 -0600
Message-Id: <20220124165526.1104-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124165526.1104-1-macroalpha82@gmail.com>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add vendor prefix for Geekworm (https://geekworm.com).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 294093d45..c0c7627c6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -455,6 +455,8 @@ patternProperties:
     description: General Electric Company
   "^geekbuying,.*":
     description: GeekBuying
+  "^geekworm,.*":
+    description: Geekworm
   "^gef,.*":
     description: GE Fanuc Intelligent Platforms Embedded Systems, Inc.
   "^GEFanuc,.*":
-- 
2.25.1

