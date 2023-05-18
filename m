Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D55E270854E
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbjERPtG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjERPtF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:49:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D4DF1717
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684424874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BNOXaScYcAYGxBfdlGiH9IysKg5HHgXclCsqicNBvlc=;
        b=ZEr8VCGQ9GY1WQ4ZuKkusn7Oo1Wr7ky+wJ+AwH+dKMBCLv39M+Jz0DmmgcKsLTGNRQim+9
        Va/O7AzS1qG0OzesXbPLXc7j1PdI33Kjd8B0Mph4EqFRkhzKYnmkbjmWxJdPB/IgFfOyfN
        pKh7yRa8BJkjXk9+zT9K5bMH3/ohR8k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-mvgqh3JiP_mOMQzW2Q7spw-1; Thu, 18 May 2023 11:37:43 -0400
X-MC-Unique: mvgqh3JiP_mOMQzW2Q7spw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D14710146E1;
        Thu, 18 May 2023 15:37:43 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 663E063F8F;
        Thu, 18 May 2023 15:37:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 4/9] media: atomisp: Rename __get_mipi_port() to atomisp_port_to_mipi_port()
Date:   Thu, 18 May 2023 17:37:28 +0200
Message-Id: <20230518153733.195306-5-hdegoede@redhat.com>
In-Reply-To: <20230518153733.195306-1-hdegoede@redhat.com>
References: <20230518153733.195306-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename __get_mipi_port() to atomisp_port_to_mipi_port(), this is not a
private (not static) function so its name should be properly prefixed.

While at is also cleanup the weird handling of ATOMISP_CAMERA_PORT_TERTIARY
this seems to be a left over from when the driver also supported CSI
receivers with only 2 ports, but those are not supported by the current
code base, so this can be cleaned up now.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 10 ++++------
 drivers/staging/media/atomisp/pci/atomisp_cmd.h |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 9c44ffba2828..f4a0341d1f8d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3893,8 +3893,8 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f)
 	return 0;
 }
 
-enum mipi_port_id __get_mipi_port(struct atomisp_device *isp,
-				  enum atomisp_camera_port port)
+enum mipi_port_id atomisp_port_to_mipi_port(struct atomisp_device *isp,
+					    enum atomisp_camera_port port)
 {
 	switch (port) {
 	case ATOMISP_CAMERA_PORT_PRIMARY:
@@ -3902,9 +3902,7 @@ enum mipi_port_id __get_mipi_port(struct atomisp_device *isp,
 	case ATOMISP_CAMERA_PORT_SECONDARY:
 		return MIPI_PORT1_ID;
 	case ATOMISP_CAMERA_PORT_TERTIARY:
-		if (MIPI_PORT1_ID + 1 != N_MIPI_PORT_ID)
-			return MIPI_PORT1_ID + 1;
-		fallthrough;
+		return MIPI_PORT2_ID;
 	default:
 		dev_err(isp->dev, "unsupported port: %d\n", port);
 		return MIPI_PORT0_ID;
@@ -3980,7 +3978,7 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 		return -EINVAL;
 	input_format = fc->atomisp_in_fmt;
 	atomisp_css_input_configure_port(asd,
-					 __get_mipi_port(asd->isp, mipi_info->port),
+					 atomisp_port_to_mipi_port(asd->isp, mipi_info->port),
 					 mipi_info->num_lanes,
 					 0xffff4, mipi_freq,
 					 input_format,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 783fb1e6f4f9..5270c370e463 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -285,8 +285,8 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 /* Events. Only one event has to be exported for now. */
 void atomisp_eof_event(struct atomisp_sub_device *asd, uint8_t exp_id);
 
-enum mipi_port_id __get_mipi_port(struct atomisp_device *isp,
-				  enum atomisp_camera_port port);
+enum mipi_port_id atomisp_port_to_mipi_port(struct atomisp_device *isp,
+					    enum atomisp_camera_port port);
 
 void atomisp_apply_css_parameters(
     struct atomisp_sub_device *asd,
-- 
2.40.1

