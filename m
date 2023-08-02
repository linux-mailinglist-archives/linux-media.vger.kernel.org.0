Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7942F76C9F7
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 11:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbjHBJ5u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 05:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232533AbjHBJ5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 05:57:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12265E4C
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 02:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690970218;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6Nsg66m0yg/qEPYdZNgAIvwYyyckJYI36WYsteMTVv0=;
        b=M6NTQEbeC/WXf09h2ZeljlOnpJf4/AOGQjREN35HNuyTIb/J0tdRHG/0XxEFbox6T7ns1O
        e0REbBje5olytXpkG9/ooEbSmYDpp/BYrk35HVXIoeLmXmX3+XMNSGhTtS8tM+muGaJwgS
        A14hfBTp4KwEoIOzizCAQ+7iDDXGMXU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-36_35a-YPGygQl2vJOMQtw-1; Wed, 02 Aug 2023 05:56:53 -0400
X-MC-Unique: 36_35a-YPGygQl2vJOMQtw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D841E1044592;
        Wed,  2 Aug 2023 09:56:52 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0C2D2401061;
        Wed,  2 Aug 2023 09:56:49 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 03/12] media: atomisp: hive_isp_css_include: Removed #ifdef ISP2401 to make driver generic
Date:   Wed,  2 Aug 2023 17:55:57 +0800
Message-ID: <20230802095606.1298152-4-hpa@redhat.com>
In-Reply-To: <20230802095606.1298152-1-hpa@redhat.com>
References: <20230802095606.1298152-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed #ifdef ISP2401 to make the driver generic.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h | 2 --
 .../atomisp/pci/hive_isp_css_include/host/pixelgen_public.h     | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
index 3d6621f2fa96..693154e8ec2f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
@@ -16,7 +16,6 @@
 #ifndef __CSI_RX_PUBLIC_H_INCLUDED__
 #define __CSI_RX_PUBLIC_H_INCLUDED__
 
-#ifdef ISP2401
 /*****************************************************
  *
  * Native command interface (NCI).
@@ -132,5 +131,4 @@ void csi_rx_be_ctrl_reg_store(
     const hrt_address reg,
     const hrt_data value);
 /* end of DLI */
-#endif /* ISP2401 */
 #endif /* __CSI_RX_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
index 40a9fb6d7761..da10e6b98c63 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
@@ -16,7 +16,6 @@
 #ifndef __PIXELGEN_PUBLIC_H_INCLUDED__
 #define __PIXELGEN_PUBLIC_H_INCLUDED__
 
-#ifdef ISP2401
 /*****************************************************
  *
  * Native command interface (NCI).
@@ -76,5 +75,4 @@ STORAGE_CLASS_PIXELGEN_H void pixelgen_ctrl_reg_store(
     const hrt_data value);
 /* end of DLI */
 
-#endif /* ISP2401 */
 #endif /* __PIXELGEN_PUBLIC_H_INCLUDED__ */
-- 
2.41.0

