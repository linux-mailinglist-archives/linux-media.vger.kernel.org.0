Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5432A1871
	for <lists+linux-media@lfdr.de>; Sat, 31 Oct 2020 16:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgJaPGX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Oct 2020 11:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbgJaPGV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Oct 2020 11:06:21 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC06C0617A6;
        Sat, 31 Oct 2020 08:06:20 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id n63so746235qte.4;
        Sat, 31 Oct 2020 08:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QsiEQVnJgPtjofsvEVgHEaYNKMcgYG0VOfEEFck/Y0E=;
        b=Ons3IwtlqNwytQZtrJPFI7YpsmxmFn+1eH1/8Omx15U4RqEb/fAv8Rwh7d7t4rt/ad
         kHQbCxounm/RC56gORVH5ZFtncdzhWmizPfjRxECz2LXXtaAuYcRMCAvmvKCSCHCW8Fd
         XRMQIcxb3bluBOsB6ebcbi40+D5PQ8w9QUj8y5cO3KiyCw8kIPpzvWBBoMKLDEcXZeH0
         Nwy5Xtc9imzU/A8pgly6eo7JXachxTaZZq8BdGsNTKmPwyK7H0xjpmfPhAhENsOhbzff
         +sXvgk9fe0xEuRopT3m9CE99FcSLOTzDz8tbgHNr/1X0momp52dxy4LvnZylqhwjnfDE
         A6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QsiEQVnJgPtjofsvEVgHEaYNKMcgYG0VOfEEFck/Y0E=;
        b=OkQ8YH80n1crc0CB89K1GzCUNOyD1gCVSuQL4M7ErZCVNps5jZqw5VXPr54VLtli/Y
         PllrfGnAq/l5qlkiDGwRnkfu49unx2ARLY2u7ShFJ1hFDBxazzIUYAEQS2uEsWTtpDJn
         Yr6CGoS/ZLZE8niZ1fNlWE1C0osT//VBnIEUmvPi9D7eGHMxz95lbaR7tM6DuZ7lPDpI
         6mdvCFBoZwFTX+lhuhmQABfH3jtq4F8XA8dZj1FVZw40Bwyn7rfVun5Mqcjqg0RCxgvj
         MQjqthx94J2iw22XTKMVg89KxhoHX+Cqs31/0T2k7Hqc3eYlo/PuQ5c+OeU2EHirV4Ob
         IadA==
X-Gm-Message-State: AOAM533vkPKBYcPgPt1b5/cY5szpJFXDkW4ToQwhxMFzW0tK2D1CIBiW
        VWu7yJYjKK7FNKCq37WhMEA=
X-Google-Smtp-Source: ABdhPJyvKzMo/EH6egGHLYSZQaM7wCaxJM3USy6Z5R1ireViCAw3ezh7IY6TjlAFQAHtlivtdy64mw==
X-Received: by 2002:aed:3383:: with SMTP id v3mr1261185qtd.353.1604156780081;
        Sat, 31 Oct 2020 08:06:20 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id z125sm2317030qke.54.2020.10.31.08.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 08:06:19 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] media: vidtv: psi: fix missing assignments in while loops
Date:   Sat, 31 Oct 2020 12:05:52 -0300
Message-Id: <20201031150552.663598-7-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201031150552.663598-1-dwlsalmeida@gmail.com>
References: <20201031150552.663598-1-dwlsalmeida@gmail.com>
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
index ad2957efa483..4dda5b0004a3 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -1175,9 +1175,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 
 	struct vidtv_psi_desc *table_descriptor   = args.pmt->descriptor;
 	struct vidtv_psi_table_pmt_stream *stream = args.pmt->stream;
-	struct vidtv_psi_desc *stream_descriptor  = (stream) ?
-						    args.pmt->stream->descriptor :
-						    NULL;
+	struct vidtv_psi_desc *stream_descriptor;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
@@ -1237,6 +1235,8 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 
 		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
 
+		stream_descriptor = stream->descriptor;
+
 		while (stream_descriptor) {
 			/* write the stream descriptors, if any */
 			d_args.dest_buf           = args.buf;
@@ -1324,9 +1324,7 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_sdt_service *service = args.sdt->service;
-	struct vidtv_psi_desc *service_desc = (args.sdt->service) ?
-					      args.sdt->service->descriptor :
-					      NULL;
+	struct vidtv_psi_desc *service_desc;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
@@ -1373,6 +1371,8 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 
 		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
 
+		service_desc = service->descriptor;
+
 		while (service_desc) {
 			/* copy the service descriptors, if any */
 			d_args.dest_buf           = args.buf;
@@ -1616,9 +1616,7 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 
 	struct vidtv_psi_desc *table_descriptor     = args.nit->descriptor;
 	struct vidtv_psi_table_transport *transport = args.nit->transport;
-	struct vidtv_psi_desc *transport_descriptor = (transport) ?
-						       args.nit->transport->descriptor :
-						       NULL;
+	struct vidtv_psi_desc *transport_descriptor;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
@@ -1686,6 +1684,8 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 
 		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
 
+		transport_descriptor = transport->descriptor;
+
 		while (transport_descriptor) {
 			/* write the transport descriptors, if any */
 			d_args.dest_buf           = args.buf;
@@ -1823,9 +1823,7 @@ u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
 	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_eit_event *event = args.eit->event;
-	struct vidtv_psi_desc *event_descriptor = (args.eit->event) ?
-						   args.eit->event->descriptor :
-						   NULL;
+	struct vidtv_psi_desc *event_descriptor;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
-- 
2.29.2

