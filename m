Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEC55A4090
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 03:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiH2BP0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 21:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbiH2BPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 21:15:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6CE2126B
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 18:15:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00DE7481;
        Mon, 29 Aug 2022 03:15:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661735720;
        bh=Ba9NEVynImbqQsQhzDSqvY6tG1WqJxzvfG579ebYhgc=;
        h=From:To:Cc:Subject:Date:From;
        b=eZfKGu08R5YeffRWw8F1kUTN10bgpbQrSHO4pB7QNcsr470VBtc9Am6M8SueaAdMF
         Va7QpQQBRsJYQf4Enmp1XG+1wPRESSoCYtWfgEspurzmq3uRGiyhPbxxY6cZAVLfvb
         Mjxg8ahCUkgYBDUFv0zoHjpjSaT8nXO8CEYwtpRM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Gregor Jasny <gjasny@googlemail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] libdvbv5: Fix invalid header file name in Doxygen INPUT
Date:   Mon, 29 Aug 2022 04:15:11 +0300
Message-Id: <20220829011511.1992-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The list of INPUT files in doxygen_libdvbv5.cfg contains
desc_descriptor_id.h, which doesn't exist. The correct file name is
desc_registration_id.h. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 doxygen_libdvbv5.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doxygen_libdvbv5.cfg b/doxygen_libdvbv5.cfg
index b25301a05bf5..83f33a23ebf4 100644
--- a/doxygen_libdvbv5.cfg
+++ b/doxygen_libdvbv5.cfg
@@ -776,7 +776,6 @@ INPUT                  = $(SRCDIR)/doc/libdvbv5-index.doc \
 			 $(SRCDIR)/lib/include/libdvbv5/desc_event_extended.h \
 			 $(SRCDIR)/lib/include/libdvbv5/desc_event_short.h \
 			 $(SRCDIR)/lib/include/libdvbv5/desc_extension.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_descriptor_id.h \
 			 $(SRCDIR)/lib/include/libdvbv5/desc_frequency_list.h \
 			 $(SRCDIR)/lib/include/libdvbv5/desc_hierarchy.h \
 			 $(SRCDIR)/lib/include/libdvbv5/desc_isdbt_delivery.h \
@@ -784,6 +783,7 @@ INPUT                  = $(SRCDIR)/doc/libdvbv5-index.doc \
 			 $(SRCDIR)/lib/include/libdvbv5/desc_logical_channel.h \
 			 $(SRCDIR)/lib/include/libdvbv5/desc_network_name.h \
 			 $(SRCDIR)/lib/include/libdvbv5/desc_partial_reception.h \
+			 $(SRCDIR)/lib/include/libdvbv5/desc_registration_id.h \
 			 $(SRCDIR)/lib/include/libdvbv5/desc_sat.h \
 			 $(SRCDIR)/lib/include/libdvbv5/desc_service.h \
 			 $(SRCDIR)/lib/include/libdvbv5/desc_t2_delivery.h \

base-commit: f50720c40409bfd27056011da1350462b41af9d3
-- 
Regards,

Laurent Pinchart

