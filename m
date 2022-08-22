Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6CE59C233
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 17:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236100AbiHVPJG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 11:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236099AbiHVPIo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 11:08:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555773DBC5
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661180786;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7SEzSX/78Bh95qAF5aYQGfNCcwuCHp9KvSUfTsPPJnI=;
        b=GZghGzsrJETE+hKHfxKlZAkcOF42q8YxmUMDsVj3y2bgq/7pgCnuZg93qWterSUAELmw+p
        XuO95c131FkXGd1nA7V9rPu8lRsmaaGnNfC8hVeOCViC/FbzNOIcrSzW2PwBi+dHvhwzdT
        MkqSFqbzdCTrNavsXmn2d99/Rcnfqow=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-7Ygzhc-8N3WaORhOxDJI8A-1; Mon, 22 Aug 2022 11:06:25 -0400
X-MC-Unique: 7Ygzhc-8N3WaORhOxDJI8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE67385A587;
        Mon, 22 Aug 2022 15:06:24 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CF6EB404C6ED;
        Mon, 22 Aug 2022 15:06:22 +0000 (UTC)
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
Subject: [PATCH v2 05/13] media: atomisp-notes: Add info about sensors v4l2_get_subdev_hostdata() use
Date:   Mon, 22 Aug 2022 17:06:02 +0200
Message-Id: <20220822150610.45186-5-hdegoede@redhat.com>
In-Reply-To: <20220822150610.45186-1-hdegoede@redhat.com>
References: <20220822150610.45186-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add info about sensors v4l2_get_subdev_hostdata() use, to notes.txt.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/notes.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/staging/media/atomisp/notes.txt b/drivers/staging/media/atomisp/notes.txt
index d128b792e05f..d3cf6ed547ae 100644
--- a/drivers/staging/media/atomisp/notes.txt
+++ b/drivers/staging/media/atomisp/notes.txt
@@ -28,3 +28,22 @@ Since getting a picture requires multiple processing steps,
 this means that unlike in fixed pipelines the soft pipelines
 on the ISP can do multiple processing steps in a single pipeline
 element (in a single binary).
+
+###
+
+The sensor drivers use of v4l2_get_subdev_hostdata(), which returns
+a camera_mipi_info struct. This struct is allocated/managed by
+the core atomisp code. The most important parts of the struct
+are filled by the atomisp core itself, like e.g. the port number.
+
+The sensor drivers on a set_fmt call do fill in camera_mipi_info.data
+which is a atomisp_sensor_mode_data struct. This gets filled from
+a function called <sensor_name>_get_intg_factor(). This struct is not
+used by the atomisp code at all. It is returned to userspace by
+a ATOMISP_IOC_G_SENSOR_MODE_DATA and the Android userspace does use this.
+
+Other members of camera_mipi_info which are set by some drivers are:
+-metadata_width, metadata_height, metadata_effective_width, set by
+ the ov5693 driver (and used by the atomisp core)
+-raw_bayer_order, adjusted by the ov2680 driver when flipping since
+ flipping can change the bayer order
-- 
2.36.1

