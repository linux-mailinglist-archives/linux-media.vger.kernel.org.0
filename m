Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1622A186D
	for <lists+linux-media@lfdr.de>; Sat, 31 Oct 2020 16:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbgJaPGQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Oct 2020 11:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728018AbgJaPGO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Oct 2020 11:06:14 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DAA4C0617A6;
        Sat, 31 Oct 2020 08:06:14 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id l2so7722632qkf.0;
        Sat, 31 Oct 2020 08:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FMq/fNztpvR6n0lvwq5zHAzZev9KmjvO/2C4S+XGV2g=;
        b=sqy0RFY/MfeOPhhl6rIR6CG+D4m0Tf72yTGfCX4LITFhoJygziZP1epGUEkiheK2Lg
         vGOwjCJDpjOCnsLzyCgaQh0dV3avfK8uS5/RN8OUhrHSVI+HzIyGamHvf7ErqiW5yb8F
         ldidCKKLd1nlawbCaVFBV0CUsf8Ju0EkZxhxZvAFyobhozjHmRVdNiRRh3Hr31Q9AIpu
         cDFD8nTZFHfXmnJTRLkJYRdKZeQ6b6ameR62Nap4v9/vPROYzLhQYShhq4wgWyxfofNT
         w+iaRK6Dsy5hHkLFCOO8g3HWvRbJqhCPBfFNmWMB1gESx+Wuv7DNPQ8Ce3bsWyVsTOC4
         6Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FMq/fNztpvR6n0lvwq5zHAzZev9KmjvO/2C4S+XGV2g=;
        b=ahEoVKOqhfqu60Ns2UZIM4M7Tb2aou5MapCRqUgvcBh47hLfeECljRswn3dXKdBzs/
         TeNVIfQeU0Myg7GsydpK6JuiSoPb8PjtqcxSSv34MB8DL4MF2bunY44TLbmCvhcKNZhK
         1x8O8t8MqKTquMq/vINnYIyFCAsOnomc+ukyvOrmd6Q7ugjfLAA1y2fy/I6qVYVb9N3G
         iEoltnSt8cKEHbqls4ovWZEuobrB9dJrpW/OeZzTv+hvUd89uL9BdGzVi/yhrPI5W9Qb
         q8MrXXOCE8KyFjbHG3MDBwV0oiktEwcI3v/hq5TAdZ6ohZ4SaZTVpfPOA9P2yaattbcP
         sTEQ==
X-Gm-Message-State: AOAM532GvHUk2z2Ye1Jbzm+XIL7DLKdY4GSaHHRlvT+aMHOG2g3g1yez
        NR0z7uh/H3c6MPUSD50eDMc=
X-Google-Smtp-Source: ABdhPJyjTFJT+02XBYj2Z0l4NloJ0n9c5KIdCYNieyDIhWSq8Dr6YTJWriFSPA4/GGI4cheUHRJTmA==
X-Received: by 2002:ae9:e856:: with SMTP id a83mr6639664qkg.142.1604156773609;
        Sat, 31 Oct 2020 08:06:13 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id z125sm2317030qke.54.2020.10.31.08.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 08:06:13 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] media: vidtv: psi: extract descriptor chaining code into a helper
Date:   Sat, 31 Oct 2020 12:05:50 -0300
Message-Id: <20201031150552.663598-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201031150552.663598-1-dwlsalmeida@gmail.com>
References: <20201031150552.663598-1-dwlsalmeida@gmail.com>
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
index b0b476545d65..ad2957efa483 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -314,6 +314,16 @@ static u32 table_section_crc32_write_into(struct crc32_write_args args)
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
@@ -345,12 +355,7 @@ struct vidtv_psi_desc_service *vidtv_psi_service_desc_init(struct vidtv_psi_desc
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
 
@@ -376,13 +381,7 @@ struct vidtv_psi_desc_registration
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
 
@@ -401,13 +400,7 @@ struct vidtv_psi_desc_network_name
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
 
@@ -445,13 +438,7 @@ struct vidtv_psi_desc_service_list
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
 
@@ -490,13 +477,7 @@ struct vidtv_psi_desc_short_event
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
2.29.2

