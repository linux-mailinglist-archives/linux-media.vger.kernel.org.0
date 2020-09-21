Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624CD2722D9
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 13:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgIULoB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 07:44:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:60130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726584AbgIULnv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 07:43:51 -0400
Received: from mail.kernel.org (ip5f5ad5b1.dynamic.kabel-deutschland.de [95.90.213.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52D752151B;
        Mon, 21 Sep 2020 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600688630;
        bh=h4vw0dOiXQMRt/AgAEMeZykxfRjEd/JNCK+k10oChk8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q5HZsyoPMbZrvC5iY8+VF1LATDlMwulISpbaKTw2gz88/j1UO2HkNHIUuYSx2JaAW
         5GXeHu+uNOeetx/v+2/8SH7Z0WiBLHTl6TwIIwILFHKNQNgUEu2QGQPJVGxshJS4+b
         hrZiPWtVQzFH9vSMCs2ClrWhTEyAyQ7P7doKh2DA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kKKEW-0004VE-4N; Mon, 21 Sep 2020 13:43:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 5/9] media: vidtv: cleanup SDT string identifiers
Date:   Mon, 21 Sep 2020 13:43:42 +0200
Message-Id: <1eaa1a66b0aa56d76c4a5b248cca7baf8a9053d3.1600688419.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600688419.git.mchehab+huawei@kernel.org>
References: <cover.1600688419.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to better test userspace applications, add an encoding
for the strings. The original channel string is also too big.
As we're just playing the first compasses of the 5th Beethoven
Symphony, change the service name to just "Beethoven". Also,
add a provider's name. For such purpose, let's point it to
the Linux media community website.

With such changes, the SDT table now looks more like one got
from a real digital TV channel:

SDT
| table_id         0x42
| section_length      44
| one                 2
| zero                1
| syntax              1
| transport_stream_id 1860
| current_next        1
| version             0
| one2                3
| section_number      0
| last_section_number 0
| network_id          65281
| reserved            255
|\
|- service 0x0880
|   EIT schedule          0
|   EIT present following 0
|   free CA mode          0
|   running status        4
|   descriptor length     27
|        0x48: service_descriptor
|           service type  1
|           provider      'LinuxTV.org'
|           name          'Beethoven'
|_  1 services

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_channel.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index 0a62b97e6a27..f2b97cf08e87 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -43,6 +43,8 @@ static void vidtv_channel_encoder_destroy(struct vidtv_encoder *e)
 	}
 }
 
+#define ENCODING_ISO8859_15 "\x0b"
+
 struct vidtv_channel
 *vidtv_channel_s302m_init(struct vidtv_channel *head, u16 transport_stream_id)
 {
@@ -55,7 +57,8 @@ struct vidtv_channel
 	const u16 s302m_es_pid              = 0x111; /* packet id for the ES */
 	const __be32 s302m_fid              = cpu_to_be32(VIDTV_S302M_FORMAT_IDENTIFIER);
 
-	char *name = "S302m: Sine Wave PCM Audio";
+	char *name = ENCODING_ISO8859_15 "Beethoven";
+	char *provider = ENCODING_ISO8859_15 "LinuxTV.org";
 
 	struct vidtv_channel *s302m = kzalloc(sizeof(*s302m), GFP_KERNEL);
 	struct vidtv_s302m_encoder_init_args encoder_args = {};
@@ -68,7 +71,7 @@ struct vidtv_channel
 				     vidtv_psi_service_desc_init(NULL,
 								 DIGITAL_TELEVISION_SERVICE,
 								 name,
-								 NULL);
+								 provider);
 
 	s302m->transport_stream_id = transport_stream_id;
 
-- 
2.26.2

