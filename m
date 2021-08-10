Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9963E572D
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 11:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239227AbhHJJio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 05:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239216AbhHJJin (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 05:38:43 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 037BBC0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 02:38:22 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id m12so25350606wru.12
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 02:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mEFn88oQtUiILjfkUfL7wKDJQwdHKA6Siy5/iZNttrQ=;
        b=QzsuJ7H045SRY+EKr7KX+4IRGwTs9JMdOkQ64BNZI0N4uLnv3uxoCvRaRayH0Lt+hX
         AqSIbtUx797FV8NmaJYC5r8TekxIkwJMacyl/GJHtvWmhmp+BFeDkCkLt0D9hqg/smHy
         IlKfs8u0gG58/O9r/OgzJAQwk0LK87lnuYgeQqT/0q8+EySFtQBrpL5wWOvytEfeLaZ3
         3+4jG0z6zacEpQvb12LZIdn8PF1+O1HPd4cGPjZmr98MVXzfbOsid9FZyMPlYvWjPz+o
         MZKJfEyFE50J1hZ/bHCGvms05HIAHCnxlmRlgqmbLeoHYuxLi7mh6VzbHGm/Pzc0Nj6U
         Unew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mEFn88oQtUiILjfkUfL7wKDJQwdHKA6Siy5/iZNttrQ=;
        b=Ne0hJg+uRPlzXOP0rN1dUhy9IITYKobWb3GSZ8tEAbFeJJN08Kf1mMNGARRrFTaRDR
         WE3xnrHHkJerJR4fsJ0A7KJXgMrTCyJ4lClwm/2kLon5VaIePO/cna49KmV8qidaOBx9
         clmkH8vszCpeHlhTyFLIFifWcG5w76iDn5w2T8h374PDaE6QtSRBHAmaNvcNpgpHIgbN
         1irQNBGz7KjGHfHAUvECIrLILJlrk3Seo7If9yYvZ8WqRKHSzsTLMVd8QJ2ue5y4/reL
         IzWcXuniADcKkM1BohMgGn2DoQ0xPBYth93tG2TGUVIyzER622tBLj/iLyVpQTgoYx+n
         Hy2Q==
X-Gm-Message-State: AOAM5330/ol7CF73Lmrn2Fcqts5S0PFpLf+ZFShfCoftaYp9rOziOXIM
        LibwKD8jNF0f3VZbY+/ywiJtZp6AAMwlbQ==
X-Google-Smtp-Source: ABdhPJznPBrdmduAZtyEzIr2neWbFPCSV6eg85IP8r545GvhmxvK81C8XlQATjLyQKFfn7bCb0znFA==
X-Received: by 2002:adf:a309:: with SMTP id c9mr12402364wrb.99.1628588300388;
        Tue, 10 Aug 2021 02:38:20 -0700 (PDT)
Received: from davidp-xps-13.pitowers.org ([2a00:1098:3142:14:c482:80d:24db:a016])
        by smtp.gmail.com with ESMTPSA id x12sm22933385wrt.35.2021.08.10.02.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 02:38:19 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v5 2/2] media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAINS control
Date:   Tue, 10 Aug 2021 10:38:11 +0100
Message-Id: <20210810093811.7205-3-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810093811.7205-1-david.plowman@raspberrypi.com>
References: <20210810093811.7205-1-david.plowman@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for the V4L2_CID_NOTIFY_GAINS control.

This control is required by sensors that need to know what colour
gains will be applied to pixels by downstream processing (such as by
an ISP), though the sensor does not apply these gains itself.

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
---
 .../media/v4l/ext-ctrls-image-source.rst      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index de43f5c8486d..ba83cc0867d2 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -72,3 +72,23 @@ Image Source Control IDs
     * - __u32
       - ``height``
       - Height of the area.
+
+``V4L2_CID_NOTIFY_GAINS (integer array)``
+    The sensor is notified what gains will be applied to the different
+    colour channels by subsequent processing (such as by an ISP). The
+    sensor is merely informed of these values in case it performs
+    processing that requires them, but it does not apply them itself to
+    the output pixels.
+
+    The use of an array allows this control to be extended to sensors
+    with, for example, non-Bayer CFAs (colour filter arrays).
+
+    Currently it is defined only for Bayer sensors, and is an array
+    control taking 4 gain values, being the gains for each of the
+    Bayer channels. The gains are always in the order B, Gb, Gr and R,
+    irrespective of the exact Bayer order of the sensor itself.
+
+    The units for the gain values are linear, with the default value
+    representing a gain of exactly 1. For example, if this default value
+    is reported as being (say) 128, then a value of 256 would represent
+    a gain of exactly 2.
-- 
2.30.2

