Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF2A7677BB9
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbjAWMxK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:53:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231529AbjAWMxI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:53:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0A02139
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478348;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zTzUrNnZfNRNmVE2sLOZ7wFmZmOVB1VDCS/iprHSn2M=;
        b=LfZvefDEo8t2FG2B/aUxNDZRc1182bw6EN6gglvYLPg7oH5b0zun2PHzLIL4g3zdB84pR0
        VNg75UWDIUYMJXrPz+x+qa6NUGFXC7RbSFgOAySBNBkKFzciJdWCS2NvCRl0hmc4y54ee5
        1PjApd92jK3VGBSqfqu9VhWNWzctDRg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-kLqEjIWQPp-Oo5CZkDwuzw-1; Mon, 23 Jan 2023 07:52:25 -0500
X-MC-Unique: kLqEjIWQPp-Oo5CZkDwuzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A473D29AA3AF;
        Mon, 23 Jan 2023 12:52:24 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 342F9C15BA0;
        Mon, 23 Jan 2023 12:52:22 +0000 (UTC)
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
Subject: [PATCH 05/57] media: atomisp: Silence "isys dma store at addr, val" debug messages
Date:   Mon, 23 Jan 2023 13:51:13 +0100
Message-Id: <20230123125205.622152-6-hdegoede@redhat.com>
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

These are clearly debug messages, printing these all the time is not
useful.

Silence these by simply removing them altogether.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/css_2401_system/host/isys_dma_private.h   | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
index a313e1dc7c71..d65fe9ec9049 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
@@ -34,8 +34,6 @@ void isys2401_dma_reg_store(const isys2401_dma_ID_t	dma_id,
 
 	reg_loc = ISYS2401_DMA_BASE[dma_id] + (reg * sizeof(hrt_data));
 
-	ia_css_print("isys dma store at addr(0x%x) val(%u)\n", reg_loc,
-		     (unsigned int)value);
 	ia_css_device_store_uint32(reg_loc, value);
 }
 
-- 
2.39.0

