Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31DF12C23C7
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732731AbgKXLHd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:07:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:33794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732449AbgKXLGf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:35 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0F4C208FE;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=EwdfPBRBK4GHOWP3HdgH+B1ESAMSzzhcWsJ0nh0T0RY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dIOLX4r6T7SRp8kKkIkh6vHBzC3lxYn9PJZT81LzTITmLlIkDD2NeIssfWSOrR/oI
         df09V3Px/5rg4zmXj0BnkiqQk/d1O0FhaDb6rmfFCErgALSAz7qaQmlqQhPEeED+CU
         dHXaU3qZTdknXPwL+sC8G9uPyXkL9P9LGqIwJ6jk=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000Fa4-1R; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 17/31] media: vidtv: fix service type
Date:   Tue, 24 Nov 2020 12:06:13 +0100
Message-Id: <d32ea0433270b29467330f8ffee1a01f7f3cd049.1606215584.git.mchehab+huawei@kernel.org>
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

As the service currently broadcasts just audio, change the
service type to reflect that.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_channel.c | 2 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.h     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index b7cf8caaeb40..eaa596f5520f 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -81,7 +81,7 @@ struct vidtv_channel
 
 	s302m->service->descriptor = (struct vidtv_psi_desc *)
 				     vidtv_psi_service_desc_init(NULL,
-								 DIGITAL_TELEVISION_SERVICE,
+								 DIGITAL_RADIO_SOUND_SERVICE,
 								 name,
 								 provider);
 	if (!s302m->service->descriptor)
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index 8f98bcaf6229..3937d1dde3f4 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -220,6 +220,7 @@ enum service_running_status {
 enum service_type {
 	/* see ETSI EN 300 468 v1.15.1 p. 77 */
 	DIGITAL_TELEVISION_SERVICE = 0x1,
+	DIGITAL_RADIO_SOUND_SERVICE = 0X2,
 };
 
 /**
-- 
2.28.0

