Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9662860C13D
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 03:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbiJYBnh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 21:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbiJYBnX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 21:43:23 -0400
X-Greylist: delayed 1387 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 24 Oct 2022 18:26:54 PDT
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com [192.185.149.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC55F0B
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 18:26:51 -0700 (PDT)
Received: from atl1wswcm04.websitewelcome.com (unknown [50.6.129.165])
        by atl3wswob05.websitewelcome.com (Postfix) with ESMTP id 2D3BF15CBF
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 01:03:45 +0000 (UTC)
Received: from br984.hostgator.com.br ([162.241.203.37])
        by cmsmtp with ESMTP
        id n8M4oiK3JgEOMn8M4oANrz; Tue, 25 Oct 2022 01:03:45 +0000
X-Authority-Reason: nr=8
Received: from [177.194.67.221] (port=43054 helo=arch-avell.meuintelbras.local)
        by br984.hostgator.com.br with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <pedro.guilherme@espectro.eng.br>)
        id 1on8M4-001BYl-76;
        Mon, 24 Oct 2022 22:03:44 -0300
From:   Pedro Guilherme Siqueira Moreira <pedro.guilherme@espectro.eng.br>
To:     laurent.pinchart@ideasonboard.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pedro Guilherme Siqueira Moreira 
        <pedro.guilherme@espectro.eng.br>
Subject: [PATCH 1/3] media: uvc_driver: fix missing newline after declarations
Date:   Mon, 24 Oct 2022 22:03:01 -0300
Message-Id: <20221025010303.570815-1-pedro.guilherme@espectro.eng.br>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - br984.hostgator.com.br
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - espectro.eng.br
X-BWhitelist: no
X-Source-IP: 177.194.67.221
X-Source-L: No
X-Exim-ID: 1on8M4-001BYl-76
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (arch-avell.meuintelbras.local) [177.194.67.221]:43054
X-Source-Auth: pedro.guilherme@espectro.eng.br
X-Email-Count: 2
X-Source-Cap: ZXNwZWN0ODU7ZXNwZWN0ODU7YnI5ODQuaG9zdGdhdG9yLmNvbS5icg==
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLpaOJuzFnAtADDDDNq0S2RGfNwC46e0AUhV1UcfQDXebN0yYF1m/EpYOyJADM2hWcYSQ4ZaxEFtfNrKtRPosWSwpsDTi+iEEsPtx7NqMzhyvmfyZ7wI
 JC5RKyJD0TeHe6C4k/2yzCUmWkCWR4glSttTS3GBxiDGrHpWZBPhQFK5vpu3A/QcanxemQ48fLB1ZbVLcrIfFjdaIacqyLHXl0Rxy4nOaoDTIXB7Ognx+zbA
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Pedro Guilherme Siqueira Moreira <pedro.guilherme@espectro.eng.br>
---
 drivers/media/usb/uvc/uvc_driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 215fb483efb0..b591ad823c66 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -732,6 +732,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	/* Parse the alternate settings to find the maximum bandwidth. */
 	for (i = 0; i < intf->num_altsetting; ++i) {
 		struct usb_host_endpoint *ep;
+
 		alts = &intf->altsetting[i];
 		ep = uvc_find_endpoint(alts,
 				streaming->header.bEndpointAddress);
@@ -1859,12 +1860,14 @@ static void uvc_delete(struct kref *kref)
 
 	list_for_each_safe(p, n, &dev->chains) {
 		struct uvc_video_chain *chain;
+
 		chain = list_entry(p, struct uvc_video_chain, list);
 		kfree(chain);
 	}
 
 	list_for_each_safe(p, n, &dev->entities) {
 		struct uvc_entity *entity;
+
 		entity = list_entry(p, struct uvc_entity, list);
 #ifdef CONFIG_MEDIA_CONTROLLER
 		uvc_mc_cleanup_entity(entity);
@@ -1874,6 +1877,7 @@ static void uvc_delete(struct kref *kref)
 
 	list_for_each_safe(p, n, &dev->streams) {
 		struct uvc_streaming *streaming;
+
 		streaming = list_entry(p, struct uvc_streaming, list);
 		usb_driver_release_interface(&uvc_driver.driver,
 			streaming->intf);
-- 
2.38.1

