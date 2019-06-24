Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCC0750064
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 05:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727676AbfFXD6P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jun 2019 23:58:15 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35699 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727552AbfFXD6O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jun 2019 23:58:14 -0400
Received: by mail-pf1-f196.google.com with SMTP id d126so6712578pfd.2;
        Sun, 23 Jun 2019 20:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nWWiPHYit7Qus1hmeGWbbQu5rustmlCbo6YPElzD50s=;
        b=mdj85HFcY0xn+qv5zGY3QGYAb5wwa1GgWRbgrLLEmWzmJhGXOrQEytAz59MpBvV9GO
         rmbVjy8r9cSnHxKiAIu1vBAIOozadSDLcXrM5CTZjNWLbGNPMNXWYuRcVFVbF68AFtPB
         +mJZDRK7+0gxymIYkQa6I9cyGA500fogbjX6HFUDJEWTMn+OsQV9IPqeWKY1Q3CKcX9k
         67vz6cvyHay3T7IF57WogUHgvnDzXOPDn+2rxgz65vZdwd2NroJAKFS4Bj54PvgyT/Vh
         qE/rYLYsigQCZu8QV8YJcnv9WtnUdnGzHfvz+U0J8K3t87f8nWzpByIxHmxKdqAbvz2V
         JNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nWWiPHYit7Qus1hmeGWbbQu5rustmlCbo6YPElzD50s=;
        b=o+An96IjVteyLP3hrubTLuOAwDabsoq0vmHhbYbOBRDyeYvRNS+Z/a77xq3WFTQ501
         6bi0xKYswg48h4DCDT3r+w5MF8rhriX8jLTdXwRH7ixGhcOdqFUB/io4IOTlrj9MBMX1
         nY5FRXMn9O50QuFcDWixS7dbMI60yE67SWseV1eInwJAuNUt0MSTUFU05NZgntov1tQN
         8kHqwpNyLb9PEfv/Wp8C/KtNqfAMataWx0LmDa0YobNjLmVp62j+8MHAK9McPyvebYBQ
         lskubudjSMLsdSxr1D2J4wbe/oISfmFITp1u2FD35kRFQSEAesvMAkzcYs7s9pY60qqO
         X/6w==
X-Gm-Message-State: APjAAAW/X1S7ee+ucb5kFE34ylCwUSmbX0sbKIa33MkvTcZ3CYF8fbbz
        7kmObXoJuJ8vWxgyn0qlfc8=
X-Google-Smtp-Source: APXvYqzh8mSCwlNtO9O8ohKHk9HhjAhYM3nUMzwBz3JCNrOsPcnPsNlo401HSpeUOrKeGOry0Ude9Q==
X-Received: by 2002:a63:d950:: with SMTP id e16mr32232330pgj.271.1561348694184;
        Sun, 23 Jun 2019 20:58:14 -0700 (PDT)
Received: from masabert (150-66-68-254m5.mineo.jp. [150.66.68.254])
        by smtp.gmail.com with ESMTPSA id k3sm8739003pju.27.2019.06.23.20.58.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 20:58:13 -0700 (PDT)
Received: by masabert (Postfix, from userid 1000)
        id 328262011C8; Mon, 24 Jun 2019 12:58:09 +0900 (JST)
From:   Masanari Iida <standby24x7@gmail.com>
To:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org, corbet@lwn.net, linux-media@vger.kernel.org
Cc:     Masanari Iida <standby24x7@gmail.com>
Subject: [PATCH] node: Fix warning while make xmldocs
Date:   Mon, 24 Jun 2019 12:58:07 +0900
Message-Id: <20190624035807.20628-1-standby24x7@gmail.com>
X-Mailer: git-send-email 2.22.0.190.ga6a95cd1b46e
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes following warning while make xmldocs.
./drivers/base/node.c:690: warning: Excess function parameter
 'mem_node' description in 'register_memory_node_under_compute_node'
./drivers/base/node.c:690: warning: Excess function parameter
 'cpu_node' description in 'register_memory_node_under_compute_node'

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 drivers/base/node.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index d8c02e65df68..944ee45d122f 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -673,8 +673,8 @@ int register_cpu_under_node(unsigned int cpu, unsigned int nid)
 /**
  * register_memory_node_under_compute_node - link memory node to its compute
  *					     node for a given access class.
- * @mem_node:	Memory node number
- * @cpu_node:	Cpu  node number
+ * @mem_nid:	Memory node identifier
+ * @cpu_nid:	Cpu  node identifier
  * @access:	Access class to register
  *
  * Description:
-- 
2.22.0.190.ga6a95cd1b46e

