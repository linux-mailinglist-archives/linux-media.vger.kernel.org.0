Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 837944CB1AB
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 23:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242059AbiCBWEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 17:04:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236829AbiCBWEA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 17:04:00 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE2AC9920
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 14:03:16 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id i8so4898639wrr.8
        for <linux-media@vger.kernel.org>; Wed, 02 Mar 2022 14:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GHoWxwMyzuEiKYiB4tkgakdxydoJTJ1L6memTFq7bQY=;
        b=I44u/jpupuxrSxPrnEOPh8ns21kZ9UZQ5Fy9vLxB5XxM26XnG7gCk9Po5De1VeBfzg
         wwoMS+uggL+SJNdR6GpwRq7Fbi84IL5WvMmiy+GOtXm+wSv0no3NgVW0IaHRkxtfFvVP
         09ghhpiXSRds8U3eggpxbNFELwL1WDBp+b+s6hn0nm2gdHI9bTkMjEurS8Yv5om98+P7
         ReQJHjxcJtOYb9LxF2W2GUx7VfadwUsG7MdbaobofDz+cdiDf+VV8dxdA9sr7ayNuZv4
         LSB2y+6F6/He+jHNn5aLkD9kHzwjl1hCxfsZQh3cBuVV+c/5t6SDsBzMWdsi0EsNwANA
         rBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GHoWxwMyzuEiKYiB4tkgakdxydoJTJ1L6memTFq7bQY=;
        b=YOkngqajrkPIByyuz2jYJnjA9thKE8t3yJGgmuQ21VtM7WQTRmwuAbMd5IGGzVN7cG
         C6nk54+craDC1BHmwntwCYCLBjoQ32SLV0QWcrrXxaURo1FKyX5fhuTLeqDyguOkTZpS
         sugLuzaA/r5stT3zJeaWP9hfaE3x6TxaSvaMRP/IDAmU8afxULAyyY0BMmPCOrODdDI2
         NNPOrDl7UryQZxGLnSkughbt1+DrDTySWFdr19l0Pj1HdqnVu79cBD9CfXzlMZbX4wrt
         34W9knSUIRFeFZtKfsMdFF/7OlKpxOU2BtxbrFXGT82f/JlCTGz7QUryp2kiLfy86Or2
         LWYw==
X-Gm-Message-State: AOAM530aaauE12D5D0ymDgyRihIlvRTDVJRiaZNeAGk+1ABIo/Cskg+4
        A7wg2DkvIW03ooPWxNT/RUbRpxSGkjpfOQ==
X-Google-Smtp-Source: ABdhPJxI+8FVaH+gF7/u1qQtIoi5tjku8H+S2JdkiyDFf7cktaVaYVQJuV9HhMc5hKyGUlmf9nwpKg==
X-Received: by 2002:adf:d1e3:0:b0:1ea:7e17:6cff with SMTP id g3-20020adfd1e3000000b001ea7e176cffmr24545717wrd.415.1646258594962;
        Wed, 02 Mar 2022 14:03:14 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b0033383cdeea1sm229258wmq.10.2022.03.02.14.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 14:03:14 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH v3 1/5] media: entity: Skip non-data links in graph iteration
Date:   Wed,  2 Mar 2022 22:03:00 +0000
Message-Id: <20220302220304.1327896-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302220304.1327896-1-djrscally@gmail.com>
References: <20220302220304.1327896-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When iterating over the media graph, don't follow links that are not
data links.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---

Changes since v2:

	- None

Changes since v1:

	- Moved to the head of the series
	- s/pad-to-pad/data (Sakari)
	- Dropped the debug message (Laurent)

Changes since the rfc:

	- new patch

 drivers/media/mc/mc-entity.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index b411f9796191..d0563ee4b28b 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -295,6 +295,12 @@ static void media_graph_walk_iter(struct media_graph *graph)
 
 	link = list_entry(link_top(graph), typeof(*link), list);
 
+	/* If the link is not a data link, don't follow it */
+	if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) != MEDIA_LNK_FL_DATA_LINK) {
+		link_top(graph) = link_top(graph)->next;
+		return;
+	}
+
 	/* The link is not enabled so we do not follow. */
 	if (!(link->flags & MEDIA_LNK_FL_ENABLED)) {
 		link_top(graph) = link_top(graph)->next;
-- 
2.25.1

