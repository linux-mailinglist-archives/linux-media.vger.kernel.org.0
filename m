Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7F85B5033
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiIKRR3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiIKRR0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8A4275E9
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916644;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mMnljO4T8Haas6Q91q3nT75alGNz35E/nxql8BRwq5A=;
        b=cEYTOlm57r3yjesM0pvfHzZ5Q8MczS4Ymq7+fbXHhMbjx3pnMYwEOBWjZpLVuDiBaM6VQh
        THTCSiH3KpfKGTQ+tnNSYpwZdmnrkQCTUD6OPfiTf8zAppq0awGFzyRoKzOEhcsyPhN27v
        mGBEDUkKZptVVF/Lty5npHoMeJFWSbc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-aq1oYjYeMtK6woS49NoKCg-1; Sun, 11 Sep 2022 13:17:22 -0400
X-MC-Unique: aq1oYjYeMtK6woS49NoKCg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1A783C025B6;
        Sun, 11 Sep 2022 17:17:21 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4FBFC492C3B;
        Sun, 11 Sep 2022 17:17:20 +0000 (UTC)
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
Subject: [PATCH 14/17] media: atomisp: Remove unused atomisp_css_get_dis_statistics()
Date:   Sun, 11 Sep 2022 19:16:50 +0200
Message-Id: <20220911171653.568932-15-hdegoede@redhat.com>
In-Reply-To: <20220911171653.568932-1-hdegoede@redhat.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the unused atomisp_css_get_dis_statistics() function. This seems to
be a leftover variant / older version of atomisp_css_get_dis_stats() which
is actually used.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat.h |  4 ----
 .../media/atomisp/pci/atomisp_compat_css20.c       | 14 --------------
 2 files changed, 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index af6ab8434b5e..a6d85d0f9ae5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -129,10 +129,6 @@ int atomisp_alloc_metadata_output_buf(struct atomisp_sub_device *asd);
 
 void atomisp_free_metadata_output_buf(struct atomisp_sub_device *asd);
 
-void atomisp_css_get_dis_statistics(struct atomisp_sub_device *asd,
-				    struct atomisp_css_buffer *isp_css_buffer,
-				    struct ia_css_isp_dvs_statistics_map *dvs_map);
-
 void atomisp_css_temp_pipe_to_pipe_id(struct atomisp_sub_device *asd,
 				      struct atomisp_css_event *current_event);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 0154ebf2cba5..64dd63ddc29c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1574,20 +1574,6 @@ void atomisp_free_metadata_output_buf(struct atomisp_sub_device *asd)
 	}
 }
 
-void atomisp_css_get_dis_statistics(struct atomisp_sub_device *asd,
-				    struct atomisp_css_buffer *isp_css_buffer,
-				    struct ia_css_isp_dvs_statistics_map *dvs_map)
-{
-	if (asd->params.dvs_stat) {
-		if (dvs_map)
-			ia_css_translate_dvs2_statistics(
-			    asd->params.dvs_stat, dvs_map);
-		else
-			ia_css_get_dvs2_statistics(asd->params.dvs_stat,
-						   isp_css_buffer->css_buffer.data.stats_dvs);
-	}
-}
-
 void atomisp_css_temp_pipe_to_pipe_id(struct atomisp_sub_device *asd,
 				      struct atomisp_css_event *current_event)
 {
-- 
2.37.3

