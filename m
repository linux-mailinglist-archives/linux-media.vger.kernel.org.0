Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C284527BB8B
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 05:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgI2D05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 23:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgI2D0x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 23:26:53 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF51C061755;
        Mon, 28 Sep 2020 20:26:52 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id g72so3102508qke.8;
        Mon, 28 Sep 2020 20:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hfFwZ3HlzYS1eMwazP0kendf4o1kSxj79xJD83EYXmk=;
        b=N9pyV5n5SX1MgmqPp0PhpoYzGlcx7tyFmcpwX+iIqE1TsW2jzfdvVAolI0cgC7vnpT
         GGvymtZ+BDYBzrG3fj2WuAKE0DB+1ctYL13/XzeGtHfZOJNhcd/LNshm0UcLs8wO0hQF
         jKkqI1Psv17uazhMldI0acTm3ZMS2CZ0CTJdpgryP2bRL2jcXyR0houZchwA0HzFHyBM
         PMStte6zjpUlk6WnuEXDJCk6rortGXfz6l2mxtwe6gD4a8hU6QuDnjhhcfCkqnPaqPTu
         igB5sLHMihmuCuZHGQGaEL4tBvMh2MkQ5rLM6YyCbtUVGXkAJphqRtKUlcY1Jeg/V+cn
         jFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hfFwZ3HlzYS1eMwazP0kendf4o1kSxj79xJD83EYXmk=;
        b=tHuEDn7vxottMbLyfvGJ6NfnVFC3yckcGcAwWoajKN/Cj90CLbFyY7w1N6Q2SjILaA
         uio9lj6nnLO78GwoEJuWXu/zWKCbp1viRmBAELR+/Bn7ikUXxUPDVDBvnFIOIF7euWtF
         SjkuzlMZLF65WhWxf9ogvCYQh5DOfl4R8ZvEYoK/0Bpymjf8rNmUQSLr/awFwtePJ0x0
         xkrL1YKk8kgc2XvnllTvJiQnBVxHsGhj+TaWzDJIt6DmwMDIrghq0OreksPRyYwoLWHw
         4u6hDA7TbDPqyRkJmJBq/p0t4W9GtdVgLI6msktgQ+QNqdFQxgb1h644tAsUDWFFWr0e
         qp4g==
X-Gm-Message-State: AOAM5339lYnT5e0lsSPE/zVCmPRer54krRU4UU+oPbQ7sme37u+mypZR
        onnBfH1dY2v7PL2ZTvwoO7A=
X-Google-Smtp-Source: ABdhPJzukJqIFWl+XhHi7xs4/P1TciFlOpahd3nHsPNpqjNS4/bwT4nW3dxWF3ObmqWGAxCRHeeDvw==
X-Received: by 2002:a37:9c86:: with SMTP id f128mr2642714qke.30.1601350011843;
        Mon, 28 Sep 2020 20:26:51 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c40sm4010313qtb.72.2020.09.28.20.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 20:26:51 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH WIP 6/6] media: vidtv: psi: fix missing assignments in while loops
Date:   Tue, 29 Sep 2020 00:26:25 -0300
Message-Id: <20200929032625.1548909-6-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
References: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Some variables were only assigned once but were used in while
loops as if they had been updated at every iteration. Fix this.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 22 +++++++++-----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 2cf103057b19..ddbffea4c353 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -1191,9 +1191,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 
 	struct vidtv_psi_desc *table_descriptor   = args.pmt->descriptor;
 	struct vidtv_psi_table_pmt_stream *stream = args.pmt->stream;
-	struct vidtv_psi_desc *stream_descriptor  = (stream) ?
-						    args.pmt->stream->descriptor :
-						    NULL;
+	struct vidtv_psi_desc *stream_descriptor;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
@@ -1253,6 +1251,8 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 
 		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
 
+		stream_descriptor = stream->descriptor;
+
 		while (stream_descriptor) {
 			/* write the stream descriptors, if any */
 			d_args.dest_buf           = args.buf;
@@ -1343,9 +1343,7 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_sdt_service *service = args.sdt->service;
-	struct vidtv_psi_desc *service_desc = (args.sdt->service) ?
-					      args.sdt->service->descriptor :
-					      NULL;
+	struct vidtv_psi_desc *service_desc;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
@@ -1392,6 +1390,8 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 
 		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
 
+		service_desc = service->descriptor;
+
 		while (service_desc) {
 			/* copy the service descriptors, if any */
 			d_args.dest_buf           = args.buf;
@@ -1639,9 +1639,7 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 
 	struct vidtv_psi_desc *table_descriptor     = args.nit->descriptor;
 	struct vidtv_psi_table_transport *transport = args.nit->transport;
-	struct vidtv_psi_desc *transport_descriptor = (transport) ?
-						       args.nit->transport->descriptor :
-						       NULL;
+	struct vidtv_psi_desc *transport_descriptor;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
@@ -1709,6 +1707,8 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 
 		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
 
+		transport_descriptor = transport->descriptor;
+
 		while (transport_descriptor) {
 			/* write the transport descriptors, if any */
 			d_args.dest_buf           = args.buf;
@@ -1846,9 +1846,7 @@ u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
 	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_eit_event *event = args.eit->event;
-	struct vidtv_psi_desc *event_descriptor = (args.eit->event) ?
-						   args.eit->event->descriptor :
-						   NULL;
+	struct vidtv_psi_desc *event_descriptor;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
-- 
2.28.0

