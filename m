Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D79902C23CD
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732764AbgKXLHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:07:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:33792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732412AbgKXLGf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:35 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4295208C3;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=D2CIC5mHikcm2IfoTzSspH85X5GlEWYNzT/FcfUcSVc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KnDs3jRUzvzSLQu4S7okgLoDiqN6fs6UJF2Xr67aQR5ZwbCF0z0uSN3chKIvfHGTw
         6bTqXO9gkyN4JH0nABvH+e63fyofxgmuaRdaQW9/t/kVcidrK3mrwp9cVSfSxDHmAo
         HjQ6Ybqs/U5qBbeGgRkHNpkfdKB5xfJduFoDAs2M=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9U-000FZz-W0; Tue, 24 Nov 2020 12:06:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 15/31] media: vidtv: properly fill EIT service_id
Date:   Tue, 24 Nov 2020 12:06:11 +0100
Message-Id: <9c43dd04a208ee9a9aa19962d1da56b7c16bccf3.1606215584.git.mchehab+huawei@kernel.org>
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

The EIT header ID field should not contain the network ID, but,
instead, the service_id of the program described at EIT.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_channel.c | 3 ++-
 drivers/media/test-drivers/vidtv/vidtv_psi.c     | 5 +++--
 drivers/media/test-drivers/vidtv/vidtv_psi.h     | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index 84c4f3f25f77..d1d312566bc0 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -451,7 +451,8 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
 		goto free_service_list;
 
 	m->si.eit = vidtv_psi_eit_table_init(m->network_id,
-					     m->transport_stream_id);
+					     m->transport_stream_id,
+					     programs->service_id);
 	if (!m->si.eit)
 		goto free_nit;
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 341af312ad56..02dd217bdbf6 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -1809,7 +1809,8 @@ void vidtv_psi_eit_event_assign(struct vidtv_psi_table_eit *eit,
 
 struct vidtv_psi_table_eit
 *vidtv_psi_eit_table_init(u16 network_id,
-			  u16 transport_stream_id)
+			  u16 transport_stream_id,
+			  __be16 service_id)
 {
 	struct vidtv_psi_table_eit *eit;
 	const u16 SYNTAX = 0x1;
@@ -1824,7 +1825,7 @@ struct vidtv_psi_table_eit
 
 	eit->header.bitfield = cpu_to_be16((SYNTAX << 15) | (ONE << 14) | (ONES << 12));
 
-	eit->header.id = cpu_to_be16(network_id);
+	eit->header.id = service_id;
 	eit->header.current_next = ONE;
 
 	eit->header.version = 0x1f;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index 866fdf3d00e5..26b2c2f5774c 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -739,7 +739,8 @@ struct vidtv_psi_table_eit {
 
 struct vidtv_psi_table_eit
 *vidtv_psi_eit_table_init(u16 network_id,
-			  u16 transport_stream_id);
+			  u16 transport_stream_id,
+			  u16 service_id);
 
 
 /**
-- 
2.28.0

