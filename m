Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E20D3293199
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 00:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388813AbgJSW7m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 18:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388777AbgJSW7e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 18:59:34 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EAF6C0613D0;
        Mon, 19 Oct 2020 15:59:34 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id p15so51061wmi.4;
        Mon, 19 Oct 2020 15:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uXAvp5LtBdgbmLALmSSkahZ9MLe+wKaeLg7vdYQ5N7s=;
        b=Ju9qu2KVU0kjcYhZtRrgsEZobWmPqSRsa1sUQxIaabHIlhXB/5GnDaMp18EAqaxEeA
         1ITA1BoCcxRAEIvYzFwmKUjmXKkMUdqJv41Rh0/gtF6IKgPQVoMPhKPFZ2j/9sDaaHcl
         y8GwLmrg/PTnNzqaoEUHokTdyHxbaDksWub4pfL4FlqaYSFZ4qs0Tw1+YUS1D1AFT2vr
         7B0DEukrXPppkF9zt+aUk231pLPriBkmAJasfW13ryy3Y/BT4rvNmLRB6Wr6SoRa5IEG
         VD0fOlWnIIoGYKtLrE8BirOcvTtYY67H+PDUQGkD89HyOU3gxdAQNM+9kluBHPl4QJMd
         VllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uXAvp5LtBdgbmLALmSSkahZ9MLe+wKaeLg7vdYQ5N7s=;
        b=YcDGQD9f3wZMNmXkZZM8Ovy/nsg6lMvOPPFFC4Ybd6EwYuVdC1auksjsZ3f7S6Sbo2
         DN/QSsdzvrqb6T/BpNIkqhOJrMeMm4KmwzC6IFlmEUaXK1REJrYrBiQnW2SCZf7Bx2AQ
         jIjH/le+krskLue5dh+vkgMOc27TotGaq8j9P6oZbe8GChRfPUVbJuyPABhDo6ju36Q6
         0gVqi+AfuC4nS0PEGZ0JK6XGy4Ty+6AxXb86kZilJfA1ofkUyGQnq0IZ1lrOD1Lb/ToT
         h+8ipxcEC0A6lDYVJ5FD6pgxlNx4N4w8b0EPZQ9cz6+pI96Y0yQy/ConahY6VWGZ6GND
         k1Cw==
X-Gm-Message-State: AOAM531nELD8eiKAgWV9jB1AwSSVZ/aN4RrCc1YQdT3T8nN+S9P+S/+2
        g7sI2FGHBTPUXZ8poFlm6bcETYVNF6hdY4HR
X-Google-Smtp-Source: ABdhPJzM2kg+xorqYoAsmGjO7WFk+5jvwnUtwkzDb++X6p/fab4dwmYI/Cp6SZ82G03V6zVGv64+Og==
X-Received: by 2002:a1c:3285:: with SMTP id y127mr89507wmy.183.1603148372632;
        Mon, 19 Oct 2020 15:59:32 -0700 (PDT)
Received: from djrscally-MIIX-510-12ISK.home ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id u20sm76505wmm.29.2020.10.19.15.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:59:32 -0700 (PDT)
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
Subject: [RFC PATCH v3 8/9] media: v4l2-core: v4l2-async: Check possible match in match_fwnode based on sd->fwnode->secondary
Date:   Mon, 19 Oct 2020 23:59:02 +0100
Message-Id: <20201019225903.14276-9-djrscally@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019225903.14276-1-djrscally@gmail.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Where the fwnode graph is comprised of software_nodes, these will be
assigned as the secondary to dev->fwnode. Check the v4l2_subdev's fwnode
for a secondary and attempt to match against it during match_fwnode() to
accommodate that possibility.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:
	- patch introduced

 drivers/media/v4l2-core/v4l2-async.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index e3ab003a6..6486dbde7 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -87,6 +87,14 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	if (sd->fwnode == asd->match.fwnode)
 		return true;
 
+	/*
+	 * Check the same situation for any possible secondary assigned to the
+	 * subdev's fwnode
+	 */
+	if ((!IS_ERR_OR_NULL(sd->fwnode->secondary)) &&
+	    sd->fwnode->secondary == asd->match.fwnode)
+		return true;
+
 	/*
 	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
 	 * endpoint or a device. If they're of the same type, there's no match.
-- 
2.17.1

