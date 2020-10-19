Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B32FE2931A1
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 01:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388718AbgJSW70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 18:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgJSW7Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 18:59:25 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0E0C0613CE;
        Mon, 19 Oct 2020 15:59:25 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q5so64017wmq.0;
        Mon, 19 Oct 2020 15:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NkSBSdUPbcEJE8oJE4080OpL9aAPqNO0wD+WCdQ/YSw=;
        b=WQMffKFF0jbg2f2UDLeIIDszWX7UJe6YInxjV7Ir87+vjWfigoRxOqwI0p8v7NKC7m
         Y/aBL0S7/SDSQWI8AAYpqzhG5Gsybxj5TJ0KBipPcsCQoIQBfgqrQfVMEoihRqu5+Zrg
         PLiFuRBOXIW/1JY1yzJ8XJYkglM8kIVf4tUFuElykwVt85VwCtv07TVeo4V7DGrjsgW8
         wvo3HpGE2SE4NvbTMb3cxGxc0983H+laDEvOGrIUVQ+jn5H7nwFUryRFbxhCXrcBAo9E
         W7MN2GhsMgAyCQ+A/aO6gyp2uqCIgMZYKKJKBzffDMze2L3DzWbJAsQBZ3TKZNUQMpDX
         t+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NkSBSdUPbcEJE8oJE4080OpL9aAPqNO0wD+WCdQ/YSw=;
        b=IkPphmiq1Dfqc0Vv+ZGX+0nE+kTWOfSdniCjE4dOcomvNCyeCc70folZlauighqOX2
         FD3dRFcMTOcCanZnWDRKn4m/5fb6qK/3a/6F2laslXdRnrK9F3Zll4zjKp6PW7gngsib
         sue4ybECUkXFs6ZcIlsHD6nzCrUl4sMB6TXfeslDIpFx6bCkUwlqIXbbEJHgdbq4LD1d
         Gi86YzNPq/rLD0Me6d7+MhC+0YBfCfGbfwLidRXFMilTKN39z0cNpcYQ87kW71HCPFoW
         Pb+AKAjXSmqRNiqWMXqA0J9MDU8JR68XSo9G98/actxgL4sCfDgx/+ZTXwkPJoaXAoIk
         Fk5w==
X-Gm-Message-State: AOAM533c/JQxFs6cfhuW9fE1/8+L2aUYrqCsoSmQ3UxWFw9u3JaVlE5v
        SuK2+B/iZFs1diMQ7Dc1m/fY41Q1zgQrRLFR
X-Google-Smtp-Source: ABdhPJwkC49Cy168JW7thFo30KkLCK9nMOEX2O8JfJO7bUeD8pnIACyewldcBGvL//a1WfMKRQ+Npg==
X-Received: by 2002:a1c:81c9:: with SMTP id c192mr103658wmd.1.1603148363551;
        Mon, 19 Oct 2020 15:59:23 -0700 (PDT)
Received: from djrscally-MIIX-510-12ISK.home ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id u20sm76505wmm.29.2020.10.19.15.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:59:23 -0700 (PDT)
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
Subject: [RFC PATCH v3 2/9] lib/test_printf.c: Use helper function to unwind array of software_nodes
Date:   Mon, 19 Oct 2020 23:58:56 +0100
Message-Id: <20201019225903.14276-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019225903.14276-1-djrscally@gmail.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new software_node_unregister_nodes_reverse() function to
unwind this array in a cleaner way.

Suggested-by: Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:
	- patch introduced.

 lib/test_printf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/lib/test_printf.c b/lib/test_printf.c
index 7ac87f18a..c63365570 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -644,9 +644,7 @@ static void __init fwnode_pointer(void)
 	test(second_name, "%pfwP", software_node_fwnode(&softnodes[1]));
 	test(third_name, "%pfwP", software_node_fwnode(&softnodes[2]));
 
-	software_node_unregister(&softnodes[2]);
-	software_node_unregister(&softnodes[1]);
-	software_node_unregister(&softnodes[0]);
+	software_node_unregister_nodes_reverse(softnodes);
 }
 
 static void __init
-- 
2.17.1

