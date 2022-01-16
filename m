Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85DA748FF4D
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 22:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236290AbiAPVwe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 16:52:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46208 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236275AbiAPVwd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 16:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642369953;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UA1A5VBn8thqziATr7SPyPEjX68UKG5mRdsuDL5RLlk=;
        b=ZbwikX5woWqrtv+TCBgw8Cc4pibN8TSZiL1SCyLdCeZP4NRR93WfZlJYiwoLBeAqk7SXDB
        CxWH7V6U+F2/D9wWh5s7wOso4xFNfSllLT3M/nAcSOC1eJzkPcvQb1YmIZ728WOrpAmGo/
        z9iSPJdzAJ79oPFtCYzM5DTFyNeDfxA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-LuapLLWGOrSpOnCDdLGE3g-1; Sun, 16 Jan 2022 16:52:29 -0500
X-MC-Unique: LuapLLWGOrSpOnCDdLGE3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33237802924;
        Sun, 16 Jan 2022 21:52:28 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.40.192.3])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 954B761F20;
        Sun, 16 Jan 2022 21:52:25 +0000 (UTC)
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
Subject: [PATCH 7/9] media: atomisp_gmin_platform: Do not turn ELDO2 off from axp_v1p8_on()
Date:   Sun, 16 Jan 2022 22:52:02 +0100
Message-Id: <20220116215204.307649-8-hdegoede@redhat.com>
In-Reply-To: <20220116215204.307649-1-hdegoede@redhat.com>
References: <20220116215204.307649-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix axp_v1p8_on() turning ELDO2 off at the end again by removing the bogus
code which turns it off again after just having turned it on.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 1c3fd72895ec..84a453118bd9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -769,11 +769,6 @@ static int axp_v1p8_on(struct device *dev, struct gmin_subdev *gs)
 
 	ret = axp_regulator_set(dev, gs, gs->eldo1_sel_reg, gs->eldo1_1p6v,
 				ELDO_CTRL_REG, gs->eldo1_ctrl_shift, true);
-	if (ret)
-		return ret;
-
-	ret = axp_regulator_set(dev, gs, gs->eldo2_sel_reg, gs->eldo2_1p8v,
-				ELDO_CTRL_REG, gs->eldo2_ctrl_shift, false);
 	return ret;
 }
 
-- 
2.33.1

