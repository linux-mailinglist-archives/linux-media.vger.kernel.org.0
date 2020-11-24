Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2185B2C23BE
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732706AbgKXLHZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:07:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:33800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732477AbgKXLGf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:35 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0235220BED;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=jF37p9fqkLFxnsNXowqOLtPhQfvlJaFKrZ9NBGd4nrM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U5jdYiXkm5QHGQibSOz4z4MdJxgSdbSGA7kt8a2d9Pac8VcsGbfnPFa+Na2e6/mzj
         BsL+Xau6NJWmNI/ueUj0WclnANqknaVM1ulJ4LkxTTrpB3nBwhotIJgHJNcBRAOJpn
         QyRMpg17pzfl1d83DeYpz8HZ+VyO98CuiD2D40/Q=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000Fa8-2M; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 18/31] media: vidtv: fix service_id at SDT table
Date:   Tue, 24 Nov 2020 12:06:14 +0100
Message-Id: <73dd5dbc98b68f9c47cae01017a0617862a5c87c.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606215584.git.mchehab+huawei@kernel.org>
References: <cover.1606215584.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The service_id there should be equal to the one used
on other tables, otherwise, EIT entries won't be valid.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_channel.c | 3 ++-
 drivers/media/test-drivers/vidtv/vidtv_psi.c     | 5 +++--
 drivers/media/test-drivers/vidtv/vidtv_psi.h     | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index eaa596f5520f..023e3dc04ce2 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -425,7 +425,8 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
 	if (!m->si.pat)
 		return -ENOMEM;
 
-	m->si.sdt = vidtv_psi_sdt_table_init(m->transport_stream_id);
+	m->si.sdt = vidtv_psi_sdt_table_init(m->network_id,
+					     m->transport_stream_id);
 	if (!m->si.sdt)
 		goto free_pat;
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 5c887639b676..77bb560342a6 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -1271,7 +1271,8 @@ void vidtv_psi_pmt_table_destroy(struct vidtv_psi_table_pmt *pmt)
 	kfree(pmt);
 }
 
-struct vidtv_psi_table_sdt *vidtv_psi_sdt_table_init(u16 transport_stream_id)
+struct vidtv_psi_table_sdt *vidtv_psi_sdt_table_init(u16 network_id,
+						     u16 transport_stream_id)
 {
 	struct vidtv_psi_table_sdt *sdt;
 	const u16 RESERVED = 0xff;
@@ -1307,7 +1308,7 @@ struct vidtv_psi_table_sdt *vidtv_psi_sdt_table_init(u16 transport_stream_id)
 	 * This can be changed to something more useful, when support for
 	 * NIT gets added
 	 */
-	sdt->network_id = cpu_to_be16(0xff01);
+	sdt->network_id = cpu_to_be16(network_id);
 	sdt->reserved = RESERVED;
 
 	vidtv_psi_sdt_table_update_sec_len(sdt);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index 3937d1dde3f4..1bf0103e6840 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -366,7 +366,8 @@ struct vidtv_psi_table_pat *vidtv_psi_pat_table_init(u16 transport_stream_id);
 struct vidtv_psi_table_pmt *vidtv_psi_pmt_table_init(u16 program_number,
 						     u16 pcr_pid);
 
-struct vidtv_psi_table_sdt *vidtv_psi_sdt_table_init(u16 transport_stream_id);
+struct vidtv_psi_table_sdt *vidtv_psi_sdt_table_init(u16 network_id,
+						     u16 transport_stream_id);
 
 struct vidtv_psi_table_sdt_service*
 vidtv_psi_sdt_service_init(struct vidtv_psi_table_sdt_service *head,
-- 
2.28.0

