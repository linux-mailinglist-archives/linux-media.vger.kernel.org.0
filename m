Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678CF48FF47
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 22:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbiAPVwP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 16:52:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55195 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233782AbiAPVwO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 16:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642369933;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FBFnWvgcrYpJ9MThj/22dUVsFhYmMpemjqGRrijtr88=;
        b=KAYHk8KMOFUI3vH1egNijt4/PAZbpaA0Nz6Bn+3aOB9kjxulUMbYo96pNVzyjOTSS+tTFN
        hL+HqFRne1aFFDSdyR+ytFMmvOB4DUbiaR+w34O7iHQyrdz6UcDYVZkJLSUmg/hX+NbNqR
        z+Cj+zqX3aR2CguQ4pb/Bt0hikRFLM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-HHL40vT-Otyb7CP3EOLTgg-1; Sun, 16 Jan 2022 16:52:12 -0500
X-MC-Unique: HHL40vT-Otyb7CP3EOLTgg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA37A802924;
        Sun, 16 Jan 2022 21:52:10 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.40.192.3])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3D04D12E37;
        Sun, 16 Jan 2022 21:52:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 1/9] media: atomisp: Don't use ifdef on IS_ISP2401
Date:   Sun, 16 Jan 2022 22:51:56 +0100
Message-Id: <20220116215204.307649-2-hdegoede@redhat.com>
In-Reply-To: <20220116215204.307649-1-hdegoede@redhat.com>
References: <20220116215204.307649-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

IS_ISP2401 is a function like macro which is always defined, so it must
not be used together with #ifdef. #ifdef checks should check for
"ISP2401", not "IS_ISP2401".

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 7edee293b132..49f235f9c365 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -972,7 +972,7 @@ int atomisp_css_irq_translate(struct atomisp_device *isp,
 void atomisp_css_rx_get_irq_info(enum mipi_port_id port,
 				 unsigned int *infos)
 {
-#ifndef IS_ISP2401
+#ifndef ISP2401
 	ia_css_isys_rx_get_irq_info(port, infos);
 #else
 	*infos = 0;
@@ -982,7 +982,7 @@ void atomisp_css_rx_get_irq_info(enum mipi_port_id port,
 void atomisp_css_rx_clear_irq_info(enum mipi_port_id port,
 				   unsigned int infos)
 {
-#ifndef IS_ISP2401
+#ifndef ISP2401
 	ia_css_isys_rx_clear_irq_info(port, infos);
 #endif
 }
-- 
2.33.1

