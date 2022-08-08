Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1F3D58C99E
	for <lists+linux-media@lfdr.de>; Mon,  8 Aug 2022 15:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243406AbiHHNlN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Aug 2022 09:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243400AbiHHNlM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Aug 2022 09:41:12 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31BF6D9F
        for <linux-media@vger.kernel.org>; Mon,  8 Aug 2022 06:41:10 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id o22so11330453edc.10
        for <linux-media@vger.kernel.org>; Mon, 08 Aug 2022 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fO7ABEO5Xwrjp6kqGJO7f/Lr8ytP4yra3ZRgOSAJwuE=;
        b=IDMydXOMV8BhAY9EQ88FYUw71eo/73SBhhfqCGwqwoYtiHrn/662diBR4pxc8Mid3R
         QGab26vfZSgdCnEc/Ulgd1s8eQ2aEw3D5/A8/4wIk65mwel98l+yA9RpJ4Cfi1x7e/uf
         dEJPKSoVDTAl+1kSViPtSYZFPG2GYn2dvtQvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fO7ABEO5Xwrjp6kqGJO7f/Lr8ytP4yra3ZRgOSAJwuE=;
        b=pHUhw4Nq7Dv/u0Xv3boz+ssVM+maXNterNUsSheEgNgt2w8E6QeHhWaOoZWTUXFoIe
         EYtz0d3oyGbWxAI58rXMAUvNWJZMlmQYrvQa32P+zXDr91BR6pPgjRFQXTfX9/oqVmgf
         LJye3b+qmddQoIYqqkG/mxWS4h0cnMAeMvok2VhoSud4msYOMNzdnzThlpXh1SMUUp8x
         K6PePo8HoXtXPjf3W6J0L/McFZib4RUf995nPeqU7k9J3wdiOD2mt/ZRM+f3W5553sF0
         X0j0OU3xv3yq9rYiK0xIIFnY7M5TvkuvpxtPvyqYSGjwhg1A1i4E4/578S0WrpMNW134
         4G7A==
X-Gm-Message-State: ACgBeo3EduuKXD8fiavmUrSzoWTWtzK3lTngyvHCN52R0oXMDDSrVSIm
        rtHf3qtD4WJLuSioIyw4+oETMg==
X-Google-Smtp-Source: AA6agR4tZp5W1HHDIk6HvKvNF0aFthlxPiCWHTjPciOa+s/cF6TTh0OLEdX/3kUmRQ9zu4uInjle/A==
X-Received: by 2002:a05:6402:189:b0:437:8a8a:d08a with SMTP id r9-20020a056402018900b004378a8ad08amr17660344edv.241.1659966068810;
        Mon, 08 Aug 2022 06:41:08 -0700 (PDT)
Received: from alco.corp.google.com ([2620:0:1059:10:af25:6fc1:a55d:28d2])
        by smtp.gmail.com with ESMTPSA id gj6-20020a170907740600b0072b31307a79sm5081681ejc.60.2022.08.08.06.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 06:41:08 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] media: uvcvideo: Fix InterfaceProtocol for Quanta camera
Date:   Mon,  8 Aug 2022 15:41:06 +0200
Message-Id: <20220808134106.70100-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.37.1.559.g78731f0fdb-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The device is using a different InterfaceProtocol than the one set in
the original quirk.

Fixes: 95f03d973478 ("media: uvcvideo: Limit power line control for Quanta cameras")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---

This was fixed on the last version of the patchset. Unfortunately I did
checked that it was the version merged :(.

It is too late to land it in this version?


 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 9c05776f11d1..6556158a8888 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2740,7 +2740,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .idProduct		= 0x4034,
 	  .bInterfaceClass	= USB_CLASS_VIDEO,
 	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
+	  .bInterfaceProtocol	= 1,
 	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
 	/* LogiLink Wireless Webcam */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-- 
2.37.1.559.g78731f0fdb-goog

