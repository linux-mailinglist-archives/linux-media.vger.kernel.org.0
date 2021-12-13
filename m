Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F07D47387A
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 00:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244197AbhLMX3K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 18:29:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244195AbhLMX3J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 18:29:09 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A56C061574
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:29:08 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id j3so29690128wrp.1
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YXsT7zHvatos7XfOBq5N+1fMVdHFdvEUedxZf+J7ouc=;
        b=fxhgQRcO3QjWRe/SJ1N8l/dwU94LkdYqBNc73Z3DonjM/hF0CBPS6bIUTinqONJnXI
         Fj5JsTofGIe+mNUj6MQXrhokJ2L1DAfmIgbzO/WhCbm/uwn3CHeW3TXGJl7UtqoNK/iF
         7kVRRs3FARTEZys1ICGAWvwTag8auTAosg3Qf0J/BTFoSBBEuobmLZX41x4uzJD6gUh2
         FIxSe/OLhu40D6B440Xgza0J7zTMhEeYrIuWepq3S4c4valO3XRg6q1roCx58dQC7ksn
         Btd+CWgDx96LGsAJ467f2/fUXnsdy0Tl5mFTmovBRiwD6z3P/OwoEAU6GP0BB8aEtrWf
         zuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YXsT7zHvatos7XfOBq5N+1fMVdHFdvEUedxZf+J7ouc=;
        b=PEE9q4N3G85zW6KWy4ZP4nIN0vUfnWcaFCTJ3Ge1t8azbtAUAf/XxugIro5jlHXAnD
         1Hl+DFgJwbBX4TyIMTxStoodg/YL7MQ5/AMDCmL9Z0QMz+pC+TV3s5wMw5jWpwaOHiEY
         MN/5dYTIFRfiywbQm/VYC2tkTSB8aA3Szq9wPiq0LcJY4ThGLZfQw2TfWUUOSTk3n401
         kmm0UX94zr7dS6ggljpp4LyK+GUvwMKXrpx/lQSWY9iS7imEvXGfdP/OVYcEaT3iziqa
         czQDb1MK5xBA3SR+6PXLSQEISBY8ISFYGVMcz2WeyQewVCb9J6ndzibR/cz1RJlcGoiS
         hJNg==
X-Gm-Message-State: AOAM532N6PB+Zql1ULni90xpsTH0HXp8FxLBVt1f7bdLjFUtsxIZOdH1
        u4W1IJzCbfx6Kpe7FBhWYP0haJDlFbM=
X-Google-Smtp-Source: ABdhPJxeFbxUyR8zW1g6fsTTqYu59SfX5eNdc/kncZmO/Gws0iR95QnRUxeRMq/ihdiJnI3MIsHU4Q==
X-Received: by 2002:adf:f504:: with SMTP id q4mr1724215wro.698.1639438147393;
        Mon, 13 Dec 2021 15:29:07 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 38sm12551643wrc.1.2021.12.13.15.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 15:29:07 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH 3/5] media: entity: Skip non-data links in graph iteration
Date:   Mon, 13 Dec 2021 23:28:47 +0000
Message-Id: <20211213232849.40071-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213232849.40071-1-djrscally@gmail.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When iterating over the media graph, don't follow links that are not
pad-to-pad links.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since the rfc:

	- new patch

 drivers/media/mc/mc-entity.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index d79eb88bc167..aeddc3f6310e 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -325,6 +325,14 @@ static void media_graph_walk_iter(struct media_graph *graph)
 
 	link = list_entry(link_top(graph), typeof(*link), list);
 
+	/* If the link is not a pad-to-pad link, don't follow it */
+	if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) != MEDIA_LNK_FL_DATA_LINK) {
+		link_top(graph) = link_top(graph)->next;
+		dev_dbg(entity->graph_obj.mdev->dev, "walk: skipping %s link\n",
+			link_type(link));
+		return;
+	}
+
 	/* The link is not enabled so we do not follow. */
 	if (!(link->flags & MEDIA_LNK_FL_ENABLED)) {
 		link_top(graph) = link_top(graph)->next;
-- 
2.25.1

