Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1542931A4
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 01:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgJSW7Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 18:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgJSW7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 18:59:23 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93313C0613CE;
        Mon, 19 Oct 2020 15:59:23 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id i1so1544795wro.1;
        Mon, 19 Oct 2020 15:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=c5ER8cP3cucsV77mGxxpFyB7Tqr6Pw3Z0TQYOJ1VJdI=;
        b=t2Brk9LZbMqwpIWntkfjgEvvcLQ53C0tR83uD/ux6mlneQDMiDz1c444RtWV4Dr6ra
         XkC0ZKS/ZHZkWA0wn83eaycthDnIORtkLxD9cMviAx4C3PjnnRZzwHSe5ZAEZoOLobID
         3UlWg/IDTdYaO82WnhXEy5t48rI+bRr2O3aD2mLm8QheDXmoTjup0LtyqJR9Y3NileWU
         HiW7YSnWxPTuOKVwPaL8Q8bpjwUpO7j7Rygx0Q9bYCPch3Rb2k0+U062Hogrvj6eiqJU
         V7vOn1PxiYXCit9zeRN/iXn0TSooarhI8BfmHrKjSnwp5+TJSylmajwccj3JrYzxJTDg
         B2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=c5ER8cP3cucsV77mGxxpFyB7Tqr6Pw3Z0TQYOJ1VJdI=;
        b=QTVPzraFIB4R7AQ9JXJ6EpUVwv0kcC/nmUTth2U1INcDgJV1VQBSXgsHJUpGMEKUMh
         NAASei44QtxhPPIGt7quycIdEUsYfbtPh9KtJOoLRBulpKCT/wIsVboEMIhu8dbOqc0i
         3vizEORAjDFw4NCFdhlZYfaYigSC+jExoORBXP/fzpSFT0BvzRtmHmnzOpRSyvwpc0+1
         iZ/4lcre5cym0SHMxWoRNjAW56f/oJy7qmhCv7Qz8fi7OcNmWGf+lENxW5QCvu4oz1Zp
         PxaGV4JBH7CbUIh/bROOh/X4Itkytx2jwQX/Y+pvnHO0P6kl7GhfLLCcWozvmljnGPpy
         tpRg==
X-Gm-Message-State: AOAM533/SmnPHMNJu5vusnRknEmDm3DcnpNo1zWNlK1b4pVpzk1NY0tL
        QGR4CdKykdyOtajk5X85Jb/7FzBPpvVz+Ut5
X-Google-Smtp-Source: ABdhPJzJyS51sp5Sx5Ja04Ju9snSWOpfZCdV1y4iW5KVSUaoj7YV3Npqpfx7qTD839ceRxcrmymPng==
X-Received: by 2002:adf:e50b:: with SMTP id j11mr1627509wrm.263.1603148361993;
        Mon, 19 Oct 2020 15:59:21 -0700 (PDT)
Received: from djrscally-MIIX-510-12ISK.home ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id u20sm76505wmm.29.2020.10.19.15.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:59:21 -0700 (PDT)
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
Subject: [RFC PATCH v3 1/9] software_node: Add helper function to unregister arrays of software_nodes ordered parent to child
Date:   Mon, 19 Oct 2020 23:58:55 +0100
Message-Id: <20201019225903.14276-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019225903.14276-1-djrscally@gmail.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Software nodes that are children of another software node should be
unregistered before their parent. To allow easy unregistering of an array
of software_nodes ordered parent to child, add a helper function to loop
over and unregister nodes in such an array in reverse order.

Suggested-by: Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:
	- patch introduced.

 drivers/base/swnode.c    | 21 +++++++++++++++++++++
 include/linux/property.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 010828fc7..f01b1cc61 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -727,6 +727,27 @@ void software_node_unregister_nodes(const struct software_node *nodes)
 }
 EXPORT_SYMBOL_GPL(software_node_unregister_nodes);
 
+/**
+ * software_node_unregister_nodes_reverse - Unregister an array of software
+ * nodes in reverse order.
+ * @nodes: Array of software nodes to be unregistered.
+ *
+ * NOTE: The same warning applies as with software_node_unregister_nodes.
+ * Unless you are _sure_ that the array of nodes is ordered parent to child
+ * it is wiser to remove them individually in the correct order.
+ */
+void software_node_unregister_nodes_reverse(const struct software_node *nodes)
+{
+	unsigned int i = 0;
+
+	while (nodes[i].name)
+		i++;
+
+	while (i--)
+		software_node_unregister(&nodes[i]);
+}
+EXPORT_SYMBOL_GPL(software_node_unregister_nodes_reverse);
+
 /**
  * software_node_register_node_group - Register a group of software nodes
  * @node_group: NULL terminated array of software node pointers to be registered
diff --git a/include/linux/property.h b/include/linux/property.h
index 9f805c442..b6410258b 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -444,6 +444,7 @@ software_node_find_by_name(const struct software_node *parent,
 
 int software_node_register_nodes(const struct software_node *nodes);
 void software_node_unregister_nodes(const struct software_node *nodes);
+void software_node_unregister_nodes_reverse(const struct software_node *nodes);
 
 int software_node_register_node_group(const struct software_node **node_group);
 void software_node_unregister_node_group(const struct software_node **node_group);
-- 
2.17.1

