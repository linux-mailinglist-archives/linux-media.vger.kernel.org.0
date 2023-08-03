Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB1476E4A8
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235096AbjHCJhd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235123AbjHCJg0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:36:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3ADF30FF
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691055284;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kmFxdIVPuLqC1j0PdkbqpqLArIEzt/Tnmml1oyk6O/E=;
        b=BbwZmPo7thE769ddsRriDiH1s74SWIlgOPM4HVGA23BA3G+/pTeEheWAlwi7bKaYIkQiQk
        HbCyx+vyUwUt3SVKId6csEebyyTfRvM9rhTXu0MbBbyKCJZrlrFWL37s2LsnQbToqGdKxG
        DVq8ZZeYGTEgdEYFEozLqqREGPhLAuM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-690-IPYkAYXNNHu6RfjfgZKa9g-1; Thu, 03 Aug 2023 05:34:40 -0400
X-MC-Unique: IPYkAYXNNHu6RfjfgZKa9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B48F8564EF;
        Thu,  3 Aug 2023 09:34:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 04C962166B25;
        Thu,  3 Aug 2023 09:34:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v5 30/32] MAINTAINERS: Add Hans de Goede as OV2680 sensor driver maintainer
Date:   Thu,  3 Aug 2023 11:33:45 +0200
Message-ID: <20230803093348.15679-31-hdegoede@redhat.com>
In-Reply-To: <20230803093348.15679-1-hdegoede@redhat.com>
References: <20230803093348.15679-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add myself as OV2680 sensor driver maintainer.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0600c2f29080..9369a35c23a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15608,6 +15608,7 @@ F:	drivers/media/i2c/ov13b10.c
 
 OMNIVISION OV2680 SENSOR DRIVER
 M:	Rui Miguel Silva <rmfrfs@gmail.com>
+M:	Hans de Goede <hansg@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-- 
2.41.0

