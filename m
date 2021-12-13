Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C84D4738B7
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 00:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244255AbhLMXnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 18:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244245AbhLMXnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 18:43:09 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08253C061574
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:43:09 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id i12so13108182wmq.4
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/FM5lJgSblkiQRy6I2XnHiIitHe+h/ds8OLMIyjzGYs=;
        b=CUO9PCmIA/jLOdtawZ24PyEzxGqOJtP15w9SWt0bYyroTBi7tKjvbVHhlTZFhfoYBi
         oGps18WFeXhaKxpFu0vmrIfVj10i+fmDrfWl3lDj+q1xKueYMWUVa7Jgr2AgaVQ9cIdK
         AMgeG8AQKnGTgn40vmVG/w2FPeWxTZ0giibPTgo6uWixnu1613qQbLSnUF6RLZkjQK8U
         CTkFtKGG8TZGdhHoeQ+BylrQizMRQWS4xmTgCeBkVprybfHCf51ojCZRso3M0rrxYHPH
         GM7TcuIO+mrx6MJUTZsqkRm9dZtVbCOivwOMv9NcpqI/69LrU6yyIKMk/Y4LDFsHOwVc
         Bbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/FM5lJgSblkiQRy6I2XnHiIitHe+h/ds8OLMIyjzGYs=;
        b=EHlfq4I4M5xyygZ1btBudj71HhkxYWBRVLy/fwTYSXc3DGud/wRSNH+0qaZvtMzMHt
         ah1sdZKdkHSQ3XFItzmy7nU4wIkOgnw/7CZYVSh8jVeSElK6L6aBYMM71zHGvgkZoSI7
         XExWWsgAoam2JkCZFABCt01XkLXSGJMmnURMv/iV0rBtE4djIVydu/fCHWQZSC9wjXV2
         EqzmD9/PLQhfm/8/U9GqWg1OWdUatm0qWijLWsVlMqrb/NQldTvB5ulh8EYfEt2b3O+t
         dAVsTJJSxfvbsLbnIjKlOwz0JKY2G3qUsFn1CMiSIxaa1MdgEbUoZSQXKoYXoN5MivK8
         rmLA==
X-Gm-Message-State: AOAM533yBS82M36RuiVS5v6Z4o2JVBCaE3pbz/Dmf8vCtRM6e6GwgFGT
        x8sMOLjbIsrORWmfeLxRWyHVbzrIlSE=
X-Google-Smtp-Source: ABdhPJyj78yNSKf7/PPSxzm0VjlSdmKoVF5pQm545BKnVWVlzvWK8BTDgekzvfa6ZS+M5ir8PV7MRQ==
X-Received: by 2002:a05:600c:3505:: with SMTP id h5mr41207699wmq.22.1639438987623;
        Mon, 13 Dec 2021 15:43:07 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id p19sm435516wmq.4.2021.12.13.15.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 15:43:07 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [v4l-utils 3/3] v4l2-compliance: Account for ancillary links
Date:   Mon, 13 Dec 2021 23:42:58 +0000
Message-Id: <20211213234258.41411-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213234258.41411-1-djrscally@gmail.com>
References: <20211213234258.41411-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update v4l2-compliance to account for ancillary links, since there
are a couple of places in it that explicitly assume only two types
of links exist.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 utils/v4l2-compliance/v4l2-test-media.cpp | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-media.cpp b/utils/v4l2-compliance/v4l2-test-media.cpp
index 28af0d83..85b1eab5 100644
--- a/utils/v4l2-compliance/v4l2-test-media.cpp
+++ b/utils/v4l2-compliance/v4l2-test-media.cpp
@@ -261,7 +261,8 @@ int testMediaTopology(struct node *node)
 
 	for (unsigned i = 0; i < topology.num_links; i++) {
 		media_v2_link &link = v2_links[i];
-		bool is_iface = link.flags & MEDIA_LNK_FL_LINK_TYPE;
+		bool is_iface = (link.flags & MEDIA_LNK_FL_LINK_TYPE) ==
+				MEDIA_LNK_FL_INTERFACE_LINK ? true : false;
 
 		fail_on_test(check_0(link.reserved, sizeof(link.reserved)));
 		fail_on_test(!link.id);
@@ -460,7 +461,8 @@ int testMediaEnum(struct node *node)
 				link_disabled = links.links[i];
 
 			// This ioctl only returns data links
-			fail_on_test(fl & MEDIA_LNK_FL_LINK_TYPE);
+			fail_on_test((fl & MEDIA_LNK_FL_LINK_TYPE) !=
+				     MEDIA_LNK_FL_DATA_LINK);
 			fail_on_test(links.links[i].sink.entity == links.links[i].source.entity);
 			if (is_sink) {
 				fail_on_test(links.links[i].sink.index >= ent.pads);
-- 
2.25.1

