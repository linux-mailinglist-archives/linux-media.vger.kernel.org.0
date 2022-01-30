Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746FE4A3BF2
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 00:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239158AbiA3X7J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jan 2022 18:59:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236438AbiA3X7I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jan 2022 18:59:08 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2989C061714
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 15:59:08 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id c23so22070464wrb.5
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 15:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KKgmf5edtGbJ9h0LX6rTJGe7gf+2myJfiAdHSNMIYE4=;
        b=nYgorl02OBSDDoz2QxOJC326/TYULEbc85Zv6g28GOEBMSx3GXxLBU58R7vfoLOH5g
         rV8QrgkA0jVq+M9+xwDY+wpEroN2jdpiptPsihygQ3DF++4UqU47ewCcUwmoe+fJ64dZ
         EbhGt3Saxr6gnQYDdsDKVGjd1SzP6RXM/XYi8zmC0aJb24CdWGEo3/7r32Sq+zedfJi2
         kmldQkOU62qPVo5mglljgwhW3YMj5TuluAPn54d7nM5QBwYzqiTLRZRzrvjANSEkYNp4
         ovhsLy4a4E3xVJM7OzD6W6aGyMekp4x/1vGY+ltj4TVh1Q3rJRckcZWobVow9OJXHuV3
         YxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KKgmf5edtGbJ9h0LX6rTJGe7gf+2myJfiAdHSNMIYE4=;
        b=UnrcsAbzPoY8JlQKl2o7XHCYVYE/6EWEWFiN74slj3HllnYjMXJXJqNiGBR3t3J7N6
         pKicSqSKW1L9LJuR2VB5Sv7pOlqz/aSeGQYzSJuz3v+W7S3e/cf/U6Ku/+w7vE6XbQUX
         FjJt9Zu4G0rtLaN0ivNGPZerZsK83++ZkEuaJLXpWrWGkBofqVRkZSATgRdxd2XO+c06
         Xz3nGXYgIlwlESz8eIQYFrpw+z5qhVQP7cbobrM3HjgQTCYsmw5QN9cKx5kRzky4URNF
         cecHtKvM5m1POJHjUahM+LlsjNr05dgdbHycR9DExc5a0p1x36X8304poQz6KnazUfLS
         70Ug==
X-Gm-Message-State: AOAM532uNIXapZxzJ84lL2OZz6i5tGCqFPOtsjWtQK4zwIcaUoz3D0OO
        ZSUAocbhydfELFEv0ckY9g/5+oP0zi4=
X-Google-Smtp-Source: ABdhPJy6S71fEhugp7GLdCYTygZWbK5lcBNNm0V6Ac0Tba1URoZGFjJWELe82FhEZDh+HHnuWLxBCw==
X-Received: by 2002:adf:f312:: with SMTP id i18mr14806019wro.441.1643587147127;
        Sun, 30 Jan 2022 15:59:07 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 11sm11993663wrb.30.2022.01.30.15.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 15:59:06 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH v2 1/6] media: entity: Skip non-data links in graph iteration
Date:   Sun, 30 Jan 2022 23:58:16 +0000
Message-Id: <20220130235821.48076-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130235821.48076-1-djrscally@gmail.com>
References: <20220130235821.48076-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When iterating over the media graph, don't follow links that are not
data links.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---

Changes since v1:

	- Moved to the head of the series
	- s/pad-to-pad/data (Sakari)
	- Dropped the debug message (Laurent)

Changes since the rfc:

	- new patch

 drivers/media/mc/mc-entity.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index f40f41977142..2a6e16fb0048 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -313,6 +313,12 @@ static void media_graph_walk_iter(struct media_graph *graph)
 
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

