Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 310DE1C1B63
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729513AbgEARQT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728970AbgEARQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:18 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156CCC061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:18 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id z6so3838343plk.10
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FVAjkuoo2ThSpOR4ie/eTODzC5Quk6g8w++NYCnSb4o=;
        b=Rrf4Z4PUWafdLiSKuzKm61CT8hoMw1RETl7sTcQ85T2LZhT/1UDP2Us1oPt/1VD+xN
         mPzKuzUQso6D1/zAv+9Yrk9hIovRQp8Vhu3x6KtCLTNSXZaP0OcUF+pSl1moePSSmw1D
         6VnvnvBO9eqqvZFFxyB7XSKzfBPQgE9rLlAsmFxZBPfR78d4zx8yGr2vpiWDzcWiP+8V
         K0+sAcqyZyZhuF/NFZ9J7nrU4QAsvibug/JJNzMuHsizU5rb6fAqnea74/oRu0l52K2B
         U3WypAPxJb64CU7qHmOWSWY22yObjgNLFe2iJ/W41v/QBOIS/UBJ6MJnTIM2kbLpUE3C
         JRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FVAjkuoo2ThSpOR4ie/eTODzC5Quk6g8w++NYCnSb4o=;
        b=ar06+v+9o65Nnh6ayhKQdJzUUVfkloqLdGe7oyw8mTDV7yXXt1rHfNLOSDj7xIwIHK
         r1Bs5TUR7G1QEpOGDKZIbHk2OWjJbf8GBn3+9Q/qHgbFA5IOQ0Gz9jeY58u+JS+g/SKO
         Fmrj2rnaKBfBSrG7/gijWTogV+0OBw1Fp0fJfU+ek4TmqIEOa+ymPLusENe5xtOlp8sY
         tE7lKiFeLtNQJHS/lE4fd+w/QsEthjXRM4ukkoCH+pWowdG/9Lt4hBvlFhv8/hk0hq40
         4d3Z5Y2/O5ZodcXzFPVokK8OaFUEFeHzSieX3YfjMFXCKSdsSC/B22PUDV6NEe/msG81
         3/CQ==
X-Gm-Message-State: AGi0PuY10XCYyAj+QVNxtLbgqb8VzxeMQqSbTVVZ9AOCaB2ML6KxRfW5
        HJVh55aFpjk1TpviX09h1f3ihR2q
X-Google-Smtp-Source: APiQypKs+BjLihNlS5Hg16b8Sb3jWaed8CTi/j7UBhIApnyn9d+71fYIaHpjvSvrEOuqV2IdejkUSw==
X-Received: by 2002:a17:90b:4d10:: with SMTP id mw16mr663054pjb.19.1588353377356;
        Fri, 01 May 2020 10:16:17 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:16 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 11/22] media: imx: imx7-media-csi: Implement get_fwnode_pad op
Date:   Fri,  1 May 2020 10:15:45 -0700
Message-Id: <20200501171556.14731-12-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use v4l2_subdev_get_fwnode_pad_1_to_1() as the get_fwnode_pad operation.
The i.MX7 CSI maps port numbers and pad indexes 1:1.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index abef59dc22b6..c74455f65b3e 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1179,6 +1179,7 @@ static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
 static const struct media_entity_operations imx7_csi_entity_ops = {
 	.link_setup	= imx7_csi_link_setup,
 	.link_validate	= v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
 };
 
 static const struct v4l2_subdev_video_ops imx7_csi_video_ops = {
-- 
2.17.1

