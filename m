Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46166FC84A
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 15:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235639AbjEIN51 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 09:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235587AbjEIN50 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 09:57:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6613C3D
        for <linux-media@vger.kernel.org>; Tue,  9 May 2023 06:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683640590;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=8IPYvoW78FXgysvkalz7yjsnW6cIcRzmEl97/zO0q8M=;
        b=Aj5H+Fkrt8Y/cXIToH8RSl/Eb1pzRQnMqdSNDEtU4qkXlGD6jzNDemc5YHf9M/+k/dW9ru
        RwvQbVKIF2jWKFwFzk4boNHSGMuivB9Wja4SaNnlTZgZrmA7jhGWCao09KEwgnfX4waROm
        4AHnfFMpRfiLjx7gWvyY5HM2OOugCro=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-it34ENCePq69fnnmpvbLQg-1; Tue, 09 May 2023 09:56:29 -0400
X-MC-Unique: it34ENCePq69fnnmpvbLQg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-3f39e818cb5so2892541cf.0
        for <linux-media@vger.kernel.org>; Tue, 09 May 2023 06:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683640588; x=1686232588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IPYvoW78FXgysvkalz7yjsnW6cIcRzmEl97/zO0q8M=;
        b=ZOi9BeLQuResI8V4s1lr0PfdqlsGt7U0DqtdSBBAuPcz8dGrVwbCVdibgLshbnwMKE
         deCgvrsRXxVVw7mbKkE+j+JPzcO2l5k5AeRMjMjDjEPgqTRfjXNoxW40EvpzOBoWXohc
         9EXuavp8E2CjNtr21R8Th/Pvb2rcvZalktcURhZ/I3ValOScILOhua1FPAoi5N1v9yHh
         Pcd2quOhckNRI7eM+fRgLqcSZS64lJ8JeI3yVGC5N5VTA6hB9hL5fHql0MNv0zjN+5Vw
         fVowClxYiukxdBQi7oUbDCd1QG5zvD+SZplMiroh2GNAqg2hN5vougEzs/7xr4x+2dKQ
         z6/Q==
X-Gm-Message-State: AC+VfDzhCfygCBI46WW57eUtvHLsofDBfOJtBqqFfAPprAek1YZm7xnO
        PJXuSClrhICjQaHnVyblrY2wLVfLGI/AJhrMQ5haPP251tsWNKC2vnSBVYTKY4NTMirXoSUXw6U
        TOI3C8RQDVjZoVJpasoyPvlGJvEfYfbs=
X-Received: by 2002:a05:622a:301:b0:3f3:972f:fe14 with SMTP id q1-20020a05622a030100b003f3972ffe14mr3296238qtw.58.1683640588721;
        Tue, 09 May 2023 06:56:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ48Kw4T5gUSUHbowdrubSxYMcVMucGyRIbWI5fOMFV7kOruGm8Ij6ZRUTUV95met3h7+SrZLw==
X-Received: by 2002:a05:622a:301:b0:3f3:972f:fe14 with SMTP id q1-20020a05622a030100b003f3972ffe14mr3296221qtw.58.1683640588456;
        Tue, 09 May 2023 06:56:28 -0700 (PDT)
Received: from fedora.redhat.com ([209.6.199.89])
        by smtp.gmail.com with ESMTPSA id u22-20020a05620a121600b0074e1ee30478sm115834qkj.37.2023.05.09.06.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 06:56:28 -0700 (PDT)
From:   Derek Barbosa <debarbos@redhat.com>
To:     debarbos@redhat.com, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
Subject: [PATCH] Dummy Patch Change for LDF103
Date:   Tue,  9 May 2023 09:56:12 -0400
Message-Id: <20230509135612.2179153-1-debarbos@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Derek Barbosa <debarbos@redhat.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 7aefa76a42b3..4dbd64b2fb90 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2070,6 +2070,8 @@ static int uvc_probe(struct usb_interface *intf,
 	int function;
 	int ret;
 
+	pr_info("I Changed the UVCVIDEO driver in the Linux Kernel\n");
+
 	/* Allocate memory for the device and initialize it. */
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (dev == NULL)
-- 
2.40.0

