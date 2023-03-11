Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D85846B5C6A
	for <lists+linux-media@lfdr.de>; Sat, 11 Mar 2023 14:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCKNtl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Mar 2023 08:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjCKNtk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Mar 2023 08:49:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F58830183
        for <linux-media@vger.kernel.org>; Sat, 11 Mar 2023 05:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678542537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=NcfgF3uxX783RG109c6BFmxXkTNUHbIUH8XfVEOGGVg=;
        b=A+fvRlLPP/GxfynBVn3j7NhSLGzDeoMJZwca0eIQY1Rs/zPes6FFRgFBIKvj5o/2f9KPtW
        9rrVPgs6Go/vb9X98iMUomW3jlyt0++gIJ/52jn058dW1niH0k9EEfWb7EtiAWnPeLXimn
        vcEZEp1LeYszbl5qRDLc6xBbn6QpukI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-uludQLNHPemyialz4stPwA-1; Sat, 11 Mar 2023 08:48:55 -0500
X-MC-Unique: uludQLNHPemyialz4stPwA-1
Received: by mail-qv1-f69.google.com with SMTP id s13-20020ad44b2d000000b00570ccb820abso4441463qvw.5
        for <linux-media@vger.kernel.org>; Sat, 11 Mar 2023 05:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678542535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcfgF3uxX783RG109c6BFmxXkTNUHbIUH8XfVEOGGVg=;
        b=xbcvKz2YrdyatQastG/vsvlNJtn8uX4cM4NUMfPkyPMz/6RM1oXxH4h4CNAi4IfZLL
         cPi4hLehkxKS7w8SsUnv4wj3aIxh1hpSwu3Dd2EaCx+4sKnwhJjTa/hcqqGHLYMk2J9/
         Z2no+IdmxMJ77bupIpKDKfCvTa43JerGebCQgW+64C/2o4M3mKDPXAG4NYcTzAb3zXT0
         Y8K4sjQqwAO2YEeAJ3dEgUTWqCpKuRgQ/IpPhQkuOdk1z8IOB/w4XgyvaqAcDu9VcEUV
         MYxDrXD3c5k6cN+i6k1oozVNUCK+PTAc6ld+i0GAJJiXjjSHuHMvf9IJHdQLijr0OXMd
         j4aA==
X-Gm-Message-State: AO0yUKVGu9D3MD1B4jk6gGfttCja0VaWPovyIgqQfQJQ6Vr2V6nc1vgd
        xgA3IOBZWl9jDvyxAQtuKed33fnvS5ie0o2tverqgG11zgm01Ru4aJ501u3Lh0nz5pHZx7AoK9v
        S2JbNFHHP4rDlSXxIlMYw1qIR0A1qM2A=
X-Received: by 2002:a05:6214:202f:b0:56f:37a:4561 with SMTP id 15-20020a056214202f00b0056f037a4561mr3674082qvf.34.1678542534954;
        Sat, 11 Mar 2023 05:48:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8xesAQjqL0qnNANgZe8UUdI4rz7/wrmwGJkQJnuQKaQ4KY5AhnrWWd4s+kwBtYf47QdZG45g==
X-Received: by 2002:a05:6214:202f:b0:56f:37a:4561 with SMTP id 15-20020a056214202f00b0056f037a4561mr3674066qvf.34.1678542534705;
        Sat, 11 Mar 2023 05:48:54 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id q29-20020a05620a025d00b0071aacb2c76asm359026qkn.132.2023.03.11.05.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 05:48:54 -0800 (PST)
From:   Tom Rix <trix@redhat.com>
To:     isely@pobox.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: pvrusb2: VIDEO_PVRUSB2 depends on DVB_CORE to use dvb_* symbols
Date:   Sat, 11 Mar 2023 08:48:47 -0500
Message-Id: <20230311134847.624910-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A rand config causes this link error
vmlinux.o: In function `pvr2_dvb_create':
(.text+0x8af1d2): undefined reference to `dvb_register_adapter'

The rand config has
CONFIG_VIDEO_PVRUSB2=y
CONFIG_VIDEO_DEV=y
CONFIG_DVB_CORE=m

VIDEO_PVRUSB2 should also depend on DVB_CORE.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/usb/pvrusb2/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/Kconfig b/drivers/media/usb/pvrusb2/Kconfig
index f2b64e49c5a2..9501b10b31aa 100644
--- a/drivers/media/usb/pvrusb2/Kconfig
+++ b/drivers/media/usb/pvrusb2/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_PVRUSB2
 	tristate "Hauppauge WinTV-PVR USB2 support"
-	depends on VIDEO_DEV && I2C
+	depends on VIDEO_DEV && I2C && DVB_CORE
 	select VIDEO_TUNER
 	select VIDEO_TVEEPROM
 	select VIDEO_CX2341X
-- 
2.27.0

