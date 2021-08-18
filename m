Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2D193EFDE5
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 09:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239108AbhHRHlC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 03:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238641AbhHRHlB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 03:41:01 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958BAC0613CF;
        Wed, 18 Aug 2021 00:40:27 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id w68so1265375pfd.0;
        Wed, 18 Aug 2021 00:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rPzlSJpSXI27Gad1u8smJdYmSOWjamjBkzviSiNS/Mc=;
        b=MIflcts7D1tN8J3RdN87d9ZHJdOVpi/Y7ERqfgGkMxAqizTDrZnC3zn84IGdMDNRG1
         TsFbeCSOdQo/Py1VHAlmJ2MwCLS58e8AwZ3j0AmDq2lZt9m0I0r4oz1W+KNW0xT6REua
         AI6k7qV4XuH6g9S6w8mtDN7gwjkQWEmR3Fxw92LdtRu9MxRBTRrZi0MJPXEAklNUzX+x
         x/F0npPWDZEuxnkDlDLzFPp7OPuMsmpLPntndLZBFDIjlhQ1TUX3UwYtEu5bOGfndBuw
         3iqn0xCowwCGjsX1K3etz2Bt2fKjWBrGnZTeAbNexlkiWTFYyIYQnvQRIt1410FKUqvh
         fIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rPzlSJpSXI27Gad1u8smJdYmSOWjamjBkzviSiNS/Mc=;
        b=FgCvoXlZDl7fzaf9Ntp61he1r3bB7gBulmbnFyC3cre9Si3yCKM9aHMPCkoDRyUwO8
         sHHl42CKVQEFRG68g4ljh33b0z9HdUm1MYnkMZZmbhHRR/JuBG+eTyI4Gqhc3PiApVMc
         JIfmTSJnTHRAkGStIFqGcNlXmma4VoB/62y6Lk1PtHkvdv/fT9831x9UatOdjpVrg2B5
         IFFgw9PIt6Q9goC01Jym47f8xM0X++GeWdDMy/GyeYkxmWPoFCJ+wg9Wd+cmV19lOdtk
         gFsPBJ7LPmyr6/6OTpaLsyYQv/l1MDQRXzvPgpkXHYaqU4wUpVtFR/lb09ySyoBY/9bU
         Xi8g==
X-Gm-Message-State: AOAM5302CKeT56hSo2AjR/DBrJ6Wve3q+vOCGQCpihmZ/qcKDJhuzA06
        THnsSzwSaWwNVnZiRSejLZM=
X-Google-Smtp-Source: ABdhPJy/fzSnhMD3q0lPJ928lvoZMJnf6R2L7yWez8jfwKjnKO8/BzrE5reAPVzX3+BXN8wNfdHHOQ==
X-Received: by 2002:a65:63d6:: with SMTP id n22mr5409905pgv.74.1629272427179;
        Wed, 18 Aug 2021 00:40:27 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 00:40:26 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com, axboe@kernel.dk,
        oleg@redhat.com, tglx@linutronix.de, dvyukov@google.com,
        walter-zh.wu@mediatek.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3 2/9] drm: hold master_lookup_lock when releasing a drm_file's master
Date:   Wed, 18 Aug 2021 15:38:17 +0800
Message-Id: <20210818073824.1560124-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When drm_file.master changes value, the corresponding
drm_device.master_lookup_lock should be held.

In drm_master_release, a call to drm_master_put sets the
file_priv->master to NULL, so we protect this section with
drm_device.master_lookup_lock.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 8efb58aa7d95..8c0e0dba1611 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -373,8 +373,11 @@ void drm_master_release(struct drm_file *file_priv)
 	}
 
 	/* drop the master reference held by the file priv */
-	if (file_priv->master)
+	if (file_priv->master) {
+		spin_lock(&dev->master_lookup_lock);
 		drm_master_put(&file_priv->master);
+		spin_unlock(&dev->master_lookup_lock);
+	}
 	mutex_unlock(&dev->master_mutex);
 }
 
-- 
2.25.1

