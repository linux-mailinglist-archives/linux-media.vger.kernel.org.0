Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E578549FBA
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347465AbiFMUpN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351446AbiFMUoH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DD6D511C2B
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149905;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WItF9TlAuSbpdmvtCt1lKEPZCt5ewoal6mDnPWEBv3U=;
        b=O8tleuA2umonOZiw2MM54MFzpqFhJ1sfidVWz7qVKQ0cNx1EiOxUbvW3ykR2vbR4yMISP+
        7WS5Lk0ZuXPP2klkICHvit7kBiGyf55E4yBELWd8GZZZ21RlSdZK23VRbcZdPMKDToIDuH
        MlYJKdt3waFln4KTn7YCtteRct9fwn4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150--1P_Ku34PXGkQElrLVzgmA-1; Mon, 13 Jun 2022 15:51:41 -0400
X-MC-Unique: -1P_Ku34PXGkQElrLVzgmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B871185A7B2;
        Mon, 13 Jun 2022 19:51:41 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BB2152166B26;
        Mon, 13 Jun 2022 19:51:39 +0000 (UTC)
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
Subject: [PATCH 01/40] media: atomisp: remove the unused RAW_BUF_STRIDE macro
Date:   Mon, 13 Jun 2022 21:50:58 +0200
Message-Id: <20220613195137.8117-2-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I noticed that the RAW_BUF_STRIDE macro is using the removed
SH_CSS_BINARY_ID_POST_ISP define, which should be a problem except that
the RAW_BUF_STRIDE macro itself is not used at all, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/isp/modes/interface/isp_const.h       | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
index bfe4f5976771..73432dc35ae3 100644
--- a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
+++ b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
@@ -145,12 +145,6 @@ more details.
 
 #define RAW_BUF_LINES ((ENABLE_RAW_BINNING || ENABLE_FIXED_BAYER_DS) ? 4 : 2)
 
-#define RAW_BUF_STRIDE \
-	(BINARY_ID == SH_CSS_BINARY_ID_POST_ISP ? MAX_VECTORS_PER_INPUT_CHUNK : \
-	 ISP_NUM_STRIPES > 1 ? MAX_VECTORS_PER_INPUT_STRIPE + _ISP_EXTRA_PADDING_VECS : \
-	 !ENABLE_CONTINUOUS ? MAX_VECTORS_PER_INPUT_LINE : \
-	 MAX_VECTORS_PER_INPUT_CHUNK)
-
 /* [isp vmem] table size[vectors] per line per color (GR,R,B,GB),
    multiples of NWAY */
 #define ISP2400_SCTBL_VECTORS_PER_LINE_PER_COLOR \
-- 
2.36.0

