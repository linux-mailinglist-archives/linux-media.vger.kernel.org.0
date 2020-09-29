Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B7F27BB88
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 05:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbgI2D0q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 23:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbgI2D0q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 23:26:46 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02BCDC0613D0;
        Mon, 28 Sep 2020 20:26:46 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id cv8so1600626qvb.12;
        Mon, 28 Sep 2020 20:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RiV1cS73QXhrI6Mq3a3ZiuUNhTGoF/5ZbayW8PLZSuA=;
        b=DdTJ6jCqRsVuEG6o3lasj6+OpO0czSAC24H+xck9sse4NmWVHze3PdIm2yKQ0/iZEa
         7/GHDlr/6QS+1GKYqqAIkq9H13SuROOMWVW95M/OTov5XuL8ypsxpPlkzpis8e8hRNju
         OUJi5Iz2nw+nnkXPsXOI+x5HuprSWibwD3nge0G/Fk+Enoj93JdKWAmQrIxiuHYWrLAs
         eLlpnYDEvvgufSVCuJqnLmcNthyhwYaH8bJ5Fl33kvpqmLP8xD3A3fiFao8qqoTBr5vF
         qmHxJc4z3y+T6GARydERQ+G8MTvPycgab4Y9PPo+HWIc0BsPFQ/JNVj0CSAgZdvkaqwc
         9Nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RiV1cS73QXhrI6Mq3a3ZiuUNhTGoF/5ZbayW8PLZSuA=;
        b=PCkXP5nkDh6v3G1BTG0WcFhkyXLhuAC4al7HqaNWsBcwKpBDaubFgh2SxUeM8TOrtv
         MX741Thqck92I8vwKiiU98HyvN57tz6fax2HLzRprFGjQeEIkiCzx8Ti2bfSmZCzy6z+
         QRJB+bhbBv4I6fAN23iX5xO+BqxXvNSq6AZPN7N1n3a9DIqRzGT3hJ4O61Xk+XQvhlv5
         vaP2AE/gINDvZTdLKdNTWTPtsJYNwGdVTFEFWEescu6Hu5c9XSgIuvmpTdBDfQrMP/a/
         FlgYj+kuF33i2JhRuu3mTfddTdK7h70mpgrN3EmJNRbkxQFglF6aIierX3QcPmxaCTYf
         wXsA==
X-Gm-Message-State: AOAM531tL5hMB/uaKXcQmqWRgViN1p9EDM0UJbORhpW6MPmK4L2WCSk3
        Lh33JpNx6AqCJf9olTqUKJE=
X-Google-Smtp-Source: ABdhPJybOoebfnDtiJcEmvLo70f4GxWruP9r8sezS+3jZBt48XFNpkmd+kugfbihJrwkHZ74l9Ub/A==
X-Received: by 2002:a0c:aee0:: with SMTP id n32mr2698991qvd.7.1601350005118;
        Mon, 28 Sep 2020 20:26:45 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c40sm4010313qtb.72.2020.09.28.20.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 20:26:44 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH WIP 4/6] media: vidtv: psi: extract descriptor chaining code into a helper
Date:   Tue, 29 Sep 2020 00:26:23 -0300
Message-Id: <20200929032625.1548909-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
References: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

The code to append a descriptor to the end of a chain is repeated
throughout the psi generator code. Extract it into its own helper
function to avoid cluttering.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 49 ++++++--------------
 1 file changed, 15 insertions(+), 34 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index e331fc7d8eef..2cf103057b19 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -313,6 +313,16 @@ static u32 table_section_crc32_write_into(struct crc32_write_args args)
 	return nbytes;
 }
 
+static void vidtv_psi_desc_chain(struct vidtv_psi_desc *head, struct vidtv_psi_desc *desc)
+{
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = desc;
+	}
+}
+
 struct vidtv_psi_desc_service *vidtv_psi_service_desc_init(struct vidtv_psi_desc *head,
 							   enum service_type service_type,
 							   char *service_name,
@@ -346,12 +356,7 @@ struct vidtv_psi_desc_service *vidtv_psi_service_desc_init(struct vidtv_psi_desc
 	if (provider_name && provider_name_len)
 		desc->provider_name = kstrdup(provider_name, GFP_KERNEL);
 
-	if (head) {
-		while (head->next)
-			head = head->next;
-
-		head->next = (struct vidtv_psi_desc *)desc;
-	}
+	vidtv_psi_desc_chain(head, (struct vidtv_psi_desc *)desc);
 	return desc;
 }
 
@@ -379,13 +384,7 @@ struct vidtv_psi_desc_registration
 		       additional_ident_info,
 		       additional_info_len);
 
-	if (head) {
-		while (head->next)
-			head = head->next;
-
-		head->next = (struct vidtv_psi_desc *)desc;
-	}
-
+	vidtv_psi_desc_chain(head, (struct vidtv_psi_desc *)desc);
 	return desc;
 }
 
@@ -404,13 +403,7 @@ struct vidtv_psi_desc_network_name
 	if (network_name && network_name_len)
 		desc->network_name = kstrdup(network_name, GFP_KERNEL);
 
-	if (head) {
-		while (head->next)
-			head = head->next;
-
-		head->next = (struct vidtv_psi_desc *)desc;
-	}
-
+	vidtv_psi_desc_chain(head, (struct vidtv_psi_desc *)desc);
 	return desc;
 }
 
@@ -448,13 +441,7 @@ struct vidtv_psi_desc_service_list
 	desc->length = length;
 	desc->service_list = head_e;
 
-	if (head) {
-		while (head->next)
-			head = head->next;
-
-		head->next = (struct vidtv_psi_desc *)desc;
-	}
-
+	vidtv_psi_desc_chain(head, (struct vidtv_psi_desc *)desc);
 	return desc;
 }
 
@@ -493,13 +480,7 @@ struct vidtv_psi_desc_short_event
 	if (text && text_len)
 		desc->text = kstrdup(text, GFP_KERNEL);
 
-	if (head) {
-		while (head->next)
-			head = head->next;
-
-		head->next = (struct vidtv_psi_desc *)desc;
-	}
-
+	vidtv_psi_desc_chain(head, (struct vidtv_psi_desc *)desc);
 	return desc;
 }
 
-- 
2.28.0

