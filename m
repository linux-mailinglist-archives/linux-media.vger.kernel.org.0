Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0332A293190
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 00:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388729AbgJSW71 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 18:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgJSW70 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 18:59:26 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F945C0613CE;
        Mon, 19 Oct 2020 15:59:26 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k18so51098wmj.5;
        Mon, 19 Oct 2020 15:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7uUfZg1soq2xI0+BE6Rw0wDJGLmcyUaOTmcQVjq8eP8=;
        b=aRtIkieI/WgDRCPG5wrbIt3p6dJXCTdMoTjTtNGUIKOOJw4AujmEBZEjhUnBCjYDt2
         LMG4pMb7V6kzcJ0vS2JB2WAx+AN7rSLm3d2gX9VZv5InHYmq4wUfCgBspxbkf00L85gG
         jkb5QTK0UOoQGhYthkbFul+OS87iTF8Mg6gaq6E7tNtbs+kO97X1f5FaJgqEdqZGnX4w
         fKvrW9fVEBJT7piiC7zxvMOp8lKOWYUF62OKSat59FoxYcYN/zMo0+0i+9sDmACFu7Kl
         XZr9k8gU1yLpyYqo2uBvlj7vx28GABBlz4e4oe7XPPgb3eIefNNrlB9Z1k6F0zhIJ3KX
         Ol6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7uUfZg1soq2xI0+BE6Rw0wDJGLmcyUaOTmcQVjq8eP8=;
        b=TsC9e4qADHrxndj1day0bvrz8K7qiJXraQeJN9grkIeNPl0l8U9QYj6aI43JOnKbgb
         1MSWqRck4vzT5xqqVeVt3ccCEywuHDWhLmPMjdo36ERAGs5kw2uE1gJGr/kd8psQgVNN
         GsdmG/cwKM1Ji2qFI8lKdvzPLtbjZoUbzs+crA/dCbO4jK5R+UaiNeHBqQJbFkw2DcqX
         6O5e1wQEEeqfWpv0uAgoPw9ps3mPnNnwnyoCpbnLFo167ZZNkoQbzv4t6AY+9/9a5bsr
         BvX/iKHqm5h5Bt/ypEB2IAH/hbSZZA91c4BUEt1hqs/C8j4QJHBtpO1dcLt1ddyoAdKv
         2hIA==
X-Gm-Message-State: AOAM530mDu+vF0Mnfq46XNoNs7yOrknUWz1PSS/vhekZ/mMaBmmNHAmI
        JjlZBLwth4Lo8RTJkEy25VQtVxWpAwucEolO
X-Google-Smtp-Source: ABdhPJw8E1rhSRP1EwLMGvBfQlLlDvWwXFI4jN1sloBne1TZTf323AV9EDadnKXRJpN+NrnEI1rJRw==
X-Received: by 2002:a1c:b78a:: with SMTP id h132mr112916wmf.172.1603148364986;
        Mon, 19 Oct 2020 15:59:24 -0700 (PDT)
Received: from djrscally-MIIX-510-12ISK.home ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id u20sm76505wmm.29.2020.10.19.15.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:59:24 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        sakari.ailus@linux.intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
Subject: [RFC PATCH v3 3/9] software_node: Fix failure to hold refcount in software_node_get_next_child
Date:   Mon, 19 Oct 2020 23:58:57 +0100
Message-Id: <20201019225903.14276-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019225903.14276-1-djrscally@gmail.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The software_node_get_next_child() function currently does not hold a kref
to the child software_node; fix that.

Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the firmware node framework")
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:
	- split out from the full software_node_graph*() patch

 drivers/base/swnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index f01b1cc61..741149b90 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -450,7 +450,7 @@ software_node_get_next_child(const struct fwnode_handle *fwnode,
 		c = list_next_entry(c, entry);
 	else
 		c = list_first_entry(&p->children, struct swnode, entry);
-	return &c->fwnode;
+	return software_node_get(&c->fwnode);
 }
 
 static struct fwnode_handle *
-- 
2.17.1

