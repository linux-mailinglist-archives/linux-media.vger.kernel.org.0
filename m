Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305DE377714
	for <lists+linux-media@lfdr.de>; Sun,  9 May 2021 16:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhEIOvr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 May 2021 10:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbhEIOvp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 May 2021 10:51:45 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7D2C061573;
        Sun,  9 May 2021 07:50:40 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id k19so11879395pfu.5;
        Sun, 09 May 2021 07:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bz8P1nZoUMT1v+PZjFbkPen/qOCExDvSHfDWKtBldgY=;
        b=k/Efj0VxOLnEitzgW/jLeQUTvNCDM1rnJkA1jWgkvJx+ic7PPM1mFNamQy/29LQiBb
         6S0WQjY5cEvp0fgqqFNO5Xpj30M0Sl1MQL2do3pekttEaR62JYdXpxCYiS/ZjZSl0gnC
         Wa+Ykz/2O1A1wedeTI5ql780tHgdegHObqerCSdMkFh8PN4VyLpz4dZ/IbfuM72YXrl+
         1KVSnSURz8NGBy/sbZYFxbXm7/99Yl37EjYrPpFEcgjzbZpup8acOatrRmVBeq2D7odX
         mmBt6WjjHOQI9Yl1wKYRwGDZYOHPOUnIBp1rp3EzW1ydhKw+5QrQ82y20XDBh3/ZB1V8
         WldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bz8P1nZoUMT1v+PZjFbkPen/qOCExDvSHfDWKtBldgY=;
        b=CmJUboHT8VNqRXTPELPA1XhE2yRQlEob06NU6FXwoMLl2QUE+rn21DWzaDxrjMVH5j
         W/IUTz0hZuLqc06yDeAUYzKv11Q6x/kpe19Z0hpvKf62/t+9+k42ONeFKPKkG7X4amN3
         199RlLQWdOqlEwJKMHRo/gKGd7dFhdFj52+rEGf5GWM7xFmjp4HD/OFVQ9gZCNmyyD/f
         nthnQBbgG/+r0O8jhWxlZkbfnxQ/beKw32/eEJy6Iin3U9HjhVWjVLN9Trv6X6wDYuSQ
         5/L4WU7FifVELWTwXjcyAmYOrBCfW8Z2WUFg9nBDYx0kAkRK0OvwDVnTpZ3SQkj186R+
         s4qw==
X-Gm-Message-State: AOAM530+H5hrSZ2add9kffmjA9S7T/9fm74RVu/VsMmjWHHO+IJWCzQF
        KBHrY2cD+/xpdeaO4hyXjLc=
X-Google-Smtp-Source: ABdhPJxtOy3inc148leudhozlWQYkcstye2E7St5sE+gvTakogQlfT5Ml/TJK5sfdIi/CscHWhigQg==
X-Received: by 2002:a63:9612:: with SMTP id c18mr1553295pge.29.1620571840169;
        Sun, 09 May 2021 07:50:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6c18:2a60:b7b4:ea0e:f455])
        by smtp.gmail.com with ESMTPSA id r63sm17043720pjg.46.2021.05.09.07.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 07:50:39 -0700 (PDT)
From:   Dwaipayan Ray <dwaipayanray1@gmail.com>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     lukas.bulwahn@gmail.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [PATCH] drm/amd/amdgpu: Fix errors in function documentation
Date:   Sun,  9 May 2021 20:19:23 +0530
Message-Id: <20210509144923.6316-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a couple of syntax errors and removed one excess
parameter in the function documentations which lead
to kernel docs build warning.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index ae9fb2025259..312f24004413 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -320,11 +320,14 @@ static int amdgpu_ras_debugfs_ctrl_parse_data(struct file *f,
  * "disable" requires only the block.
  * "enable" requires the block and error type.
  * "inject" requires the block, error type, address, and value.
+ *
  * The block is one of: umc, sdma, gfx, etc.
  *	see ras_block_string[] for details
+ *
  * The error type is one of: ue, ce, where,
  *	ue is multi-uncorrectable
  *	ce is single-correctable
+ *
  * The sub-block is a the sub-block index, pass 0 if there is no sub-block.
  * The address and value are hexadecimal numbers, leading 0x is optional.
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 16252d48e5a4..7e1a67295106 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2796,7 +2796,6 @@ long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout)
  *
  * @adev: amdgpu_device pointer
  * @vm: requested vm
- * @vm_context: Indicates if it GFX or Compute context
  * @pasid: Process address space identifier
  *
  * Init @vm fields.
-- 
2.30.2

