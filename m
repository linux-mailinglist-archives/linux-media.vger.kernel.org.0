Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F08A6677BCA
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbjAWMxx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:53:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231886AbjAWMxw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:53:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AC42102
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478382;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2WTQvgcyTu3aS+c5QfQAht1i8HC7quqbELiRPW8QonA=;
        b=a9DgDLFNdMZZVeZXwhY6yL2+Bsu4bv8N5TpRu6ua9P72TJzYwlVKLcAdYxLpiVO/o/3mcO
        BhI/sdS9lvUF3vQDQ5P0HH7akQ+iSznz4SvnGHOLzFrkVBMuFJQK2B25JlRcYkv1CgUfRa
        bQtwo+9itoXqA3x/K+ZbeD/E5LmRJ30=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-H1NQCQcwMIqh4eb_E_Auvg-1; Mon, 23 Jan 2023 07:52:58 -0500
X-MC-Unique: H1NQCQcwMIqh4eb_E_Auvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FD543C02537;
        Mon, 23 Jan 2023 12:52:58 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A7C9AC15BA0;
        Mon, 23 Jan 2023 12:52:55 +0000 (UTC)
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
Subject: [PATCH 17/57] media: atomisp: Only set default_run_mode on first open of a stream/asd
Date:   Mon, 23 Jan 2023 13:51:25 +0100
Message-Id: <20230123125205.622152-18-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calling v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode) when
the stream is already active (through another /dev/video# node) causes
the stream to stop.

Move the call to set the default run-mode so that it is only done
on the first open of one of the 4 /dev/video# nodes of one of
the 2 streams (atomisp-sub-devices / asd-s).

Fixes: 2c45e343c581 ("media: atomisp: set per-device's default mode")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 7f4934ff9cab..78af97a64362 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -764,13 +764,13 @@ static int atomisp_open(struct file *file)
 		goto done;
 
 	atomisp_subdev_init_struct(asd);
+	/* Ensure that a mode is set */
+	v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
 
 done:
 	pipe->users++;
 	mutex_unlock(&isp->mutex);
 
-	/* Ensure that a mode is set */
-	v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
 
 	return 0;
 
-- 
2.39.0

