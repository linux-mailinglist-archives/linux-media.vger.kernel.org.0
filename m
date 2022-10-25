Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C08B60C136
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 03:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbiJYBnZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 21:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbiJYBm7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 21:42:59 -0400
X-Greylist: delayed 1307 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 24 Oct 2022 18:26:00 PDT
Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com [192.185.144.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D913F317F3
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 18:25:59 -0700 (PDT)
Received: from atl1wswcm04.websitewelcome.com (unknown [50.6.129.165])
        by atl3wswob02.websitewelcome.com (Postfix) with ESMTP id 0BDE23FB85
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 01:04:11 +0000 (UTC)
Received: from br984.hostgator.com.br ([162.241.203.37])
        by cmsmtp with ESMTP
        id n8MUoiKo9gEOMn8MUoAOZz; Tue, 25 Oct 2022 01:04:10 +0000
X-Authority-Reason: nr=8
Received: from [177.194.67.221] (port=43054 helo=arch-avell.meuintelbras.local)
        by br984.hostgator.com.br with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <pedro.guilherme@espectro.eng.br>)
        id 1on8MU-001BYl-6W;
        Mon, 24 Oct 2022 22:04:10 -0300
From:   Pedro Guilherme Siqueira Moreira <pedro.guilherme@espectro.eng.br>
To:     laurent.pinchart@ideasonboard.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pedro Guilherme Siqueira Moreira 
        <pedro.guilherme@espectro.eng.br>
Subject: [PATCH 2/3] media: uvc_driver: fix assignments inside if statements
Date:   Mon, 24 Oct 2022 22:03:02 -0300
Message-Id: <20221025010303.570815-2-pedro.guilherme@espectro.eng.br>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221025010303.570815-1-pedro.guilherme@espectro.eng.br>
References: <20221025010303.570815-1-pedro.guilherme@espectro.eng.br>
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
X-Exim-ID: 1on8MU-001BYl-6W
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (arch-avell.meuintelbras.local) [177.194.67.221]:43054
X-Source-Auth: pedro.guilherme@espectro.eng.br
X-Email-Count: 6
X-Source-Cap: ZXNwZWN0ODU7ZXNwZWN0ODU7YnI5ODQuaG9zdGdhdG9yLmNvbS5icg==
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfN2P3ghtFrddQqpcNmj/eNAWIrSpTu3PFIdv+zP1iVTJTsx284x3ViM9lp61xGWo58h6Yg9OitPdjhMS4mSUQN0ptsv1d2M45iH0NbfYX6OwkIaVOU7q
 prOEYs4VjPB8EXwY+7F+U9D4iPomKmH/nnBbz6WkIeKl6s/y3gmYZY6Q54eaX3wyc0NXzrH7z0MMIHTnky7+1WHAltCv1THxv2u1p7phTKB4C/RScIX4CVpj
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
 drivers/media/usb/uvc/uvc_driver.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index b591ad823c66..7b6c97ad3a41 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1174,7 +1174,8 @@ static int uvc_parse_control(struct uvc_device *dev)
 		    buffer[1] != USB_DT_CS_INTERFACE)
 			goto next_descriptor;
 
-		if ((ret = uvc_parse_standard_control(dev, buffer, buflen)) < 0)
+		ret = uvc_parse_standard_control(dev, buffer, buflen);
+		if (ret < 0)
 			return ret;
 
 next_descriptor:
@@ -2213,7 +2214,8 @@ static int uvc_probe(struct usb_interface *intf,
 	usb_set_intfdata(intf, dev);
 
 	/* Initialize the interrupt URB. */
-	if ((ret = uvc_status_init(dev)) < 0) {
+	ret = uvc_status_init(dev);
+	if (ret < 0) {
 		dev_info(&dev->udev->dev,
 			 "Unable to initialize the status endpoint (%d), status interrupt will not be supported.\n",
 			 ret);
-- 
2.38.1

