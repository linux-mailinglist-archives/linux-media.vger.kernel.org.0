Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 641034DE881
	for <lists+linux-media@lfdr.de>; Sat, 19 Mar 2022 15:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243177AbiCSOgb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Mar 2022 10:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240346AbiCSOga (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Mar 2022 10:36:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3C3D51AD8E
        for <linux-media@vger.kernel.org>; Sat, 19 Mar 2022 07:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647700508;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=GAQCYGXnCBLWEzIGkshbYT42tHmWJ6Z4cQSEVkWfLQ8=;
        b=JbCoM5AOHDxSmUcsb7j16XMS5OOYiLWgE08SWBaTdclJtuKY4O9371JrcGxawXN0pvaV6Y
        AmWC0LORtqxMuMIyALJschqAF3QxiiHQrSLPq1PfXMlfPvNU0bzqz/fpoQLJ9sx7aTIio/
        ZNJBNcD6w9Sk/VI0cS/0e4fkfEJDsuU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-cO1Lrft5PAeLeiR8gB6ulA-1; Sat, 19 Mar 2022 10:35:06 -0400
X-MC-Unique: cO1Lrft5PAeLeiR8gB6ulA-1
Received: by mail-qk1-f197.google.com with SMTP id b133-20020a37678b000000b0067d24942b91so6967304qkc.12
        for <linux-media@vger.kernel.org>; Sat, 19 Mar 2022 07:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GAQCYGXnCBLWEzIGkshbYT42tHmWJ6Z4cQSEVkWfLQ8=;
        b=GbZqkdN59Ip2plFQq4pJePUFeEVONogzLBVx6CRGDi1huPomFYMihFsZ2huHh7Ewz+
         F6TxdVrT7zPRmPSP/KaTgSGijswUm2yZIJWrHLiPKCd4tNMfA5jcvHYGZQ/kLhvijKxv
         /ct7MP/nV2fof24QtlVfDT+lg2GKUmofjQEXwvhiiFnQLbtJ+UblPgk6m8RiHQ4cXR+8
         ppyafnOh4dioydt53p+WCK6T4uDVE3RC6JU8Bgsz69f457E/89D/PWFyzbJEOrBoTaxp
         HlFvSOBbJVkkaoQYoVAAprdUejARkcObtChcXrDQdtXHbPVEME60PAlQ1RDeUrs+pdF3
         /WrA==
X-Gm-Message-State: AOAM53243emBGpgWsXOGoV7ia/+o+EkNrI8hVFl71FXdm7bW/ODsaWWq
        0tp2A7dGSmSt/y01Ua/f0DHG8vGykIiTtQNVahrPQc9GPXGqKSMIj7uiCT/jgYTAZ/Z1rxDwRJ/
        Se3bJyeqJABYMBPt5edCDeGE=
X-Received: by 2002:ad4:5be5:0:b0:441:97c:a97a with SMTP id k5-20020ad45be5000000b00441097ca97amr3246785qvc.16.1647700506531;
        Sat, 19 Mar 2022 07:35:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfq4jDK0s9fZuB9ykHKFmiu2hbf/+DxEjamwDJENi7TA1z4CyHuQ0jJDFVJV4prFMQKdzZdA==
X-Received: by 2002:ad4:5be5:0:b0:441:97c:a97a with SMTP id k5-20020ad45be5000000b00441097ca97amr3246765qvc.16.1647700506284;
        Sat, 19 Mar 2022 07:35:06 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id d13-20020a05622a15cd00b002e1df990d01sm7891564qty.71.2022.03.19.07.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 07:35:05 -0700 (PDT)
From:   trix@redhat.com
To:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        nathan@kernel.org, ndesaulniers@google.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] media: platform: return early if the iface is not handled
Date:   Sat, 19 Mar 2022 07:34:56 -0700
Message-Id: <20220319143456.2159540-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this issue
ispcsiphy.c:63:14: warning: The left operand of '<<'
  is a garbage value
        reg |= mode << shift;
               ~~~~ ^
The iface switch-statement default case falls through
to ISP_INTERFACE_CCP2B_PHY1.  Which is later checked
to set the mode.  Since the default case is left out
of this check mode is never set.  Instead of falling
through and assuming a ISP_INTERFACE_CCP2B_PHY1
iface, return.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/platform/ti/omap3isp/ispcsiphy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispcsiphy.c b/drivers/media/platform/ti/omap3isp/ispcsiphy.c
index 6dc7359c5131d..1bde76c0adbee 100644
--- a/drivers/media/platform/ti/omap3isp/ispcsiphy.c
+++ b/drivers/media/platform/ti/omap3isp/ispcsiphy.c
@@ -31,7 +31,8 @@ static void csiphy_routing_cfg_3630(struct isp_csiphy *phy,
 
 	switch (iface) {
 	default:
-	/* Should not happen in practice, but let's keep the compiler happy. */
+		/* Should not happen in practice, but let's keep the compiler happy. */
+		return;
 	case ISP_INTERFACE_CCP2B_PHY1:
 		reg &= ~OMAP3630_CONTROL_CAMERA_PHY_CTRL_CSI1_RX_SEL_PHY2;
 		shift = OMAP3630_CONTROL_CAMERA_PHY_CTRL_CAMMODE_PHY1_SHIFT;
-- 
2.26.3

