Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B570D296028
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 15:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900150AbgJVNh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 09:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgJVNh4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 09:37:56 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839A8C0613CE;
        Thu, 22 Oct 2020 06:37:56 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t14so963823pgg.1;
        Thu, 22 Oct 2020 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=IuqDlc/9sVmn6w8y6S9W6kIXAO5b3CW/ksiq6MJe4cw=;
        b=IN5ulN/lhVpkv0cSxQVYeQmL8e6XC9Ui0ongH71NZy+wDEtGl/7jnitdi0qhAAyIZY
         fC7g6ckIDcNipQDDU/l95Zz5SIw5WgFDHGPbZsnqwhcPDWDUeYQ+K0+pZ4exBAq4gbcw
         rqJ6yYA5w6lq9ZOLdFbpsKUwr7R6EDI8UsYT73x2NUL9/nh4In959E24DYHQiR4z5JBY
         3PhmcpvnBuuDiLX7PaDg4d9j17853UB9O1sXkM4XGUKK+pIkSbJwNUlF7Kq7ZfYzjjTA
         UDpUqi4GQ2QwwzVjXoCBSJUnNgaE17+WjxzlHjS3QXF8s9sEEYtv9MqLfP/Xm8h49QZ4
         R9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=IuqDlc/9sVmn6w8y6S9W6kIXAO5b3CW/ksiq6MJe4cw=;
        b=VJwqjDXoNBq9BNhc7XL0N07Ds9zE5iCn8vf63eWa5xjFMp6bLNrmwpUqiMr+hNToFP
         JXFdICoYU0QFNA8zoVzoXPsLjnOuGoLudY+Hdx0ETK9m3cKoxvN26L3Xc6Bx08EKpywW
         1dUNrJ+T641Pl62M7XR5Z5v6gOPSLHyPE2maAGE7O/YnAsYqTyZLWOMEaC5I4N/RvsNf
         9Wh0qgWhtvgK2f9yNHyaz7hQV63Oas0DRRjtl059L9pmJqWGR/WYor2oK59myfs57zx7
         NiHix+l5LVQXzoIiI9JtlIfTRrd8ZFRYZtdZ8adtl3k+jlSoF5TqKEqwf9DRpNOeq3bA
         dVjw==
X-Gm-Message-State: AOAM5315b9zha/lpLSWzXjuRgZQhK1gfZCblNSH/UEa1UM3n5Rdpj4AH
        jcPmSAUAlsfPKghoDrD2Jrw=
X-Google-Smtp-Source: ABdhPJxzYwjbdLDADhpa8w757osNj5Hty2iFA+tEbvr3E1nQBdPpkX6BpAdeBon6QKBNbFuEjHUUvw==
X-Received: by 2002:aa7:9e9d:0:b029:152:5ebd:42a with SMTP id p29-20020aa79e9d0000b02901525ebd042amr2500221pfq.4.1603373875970;
        Thu, 22 Oct 2020 06:37:55 -0700 (PDT)
Received: from adolin ([49.207.204.75])
        by smtp.gmail.com with ESMTPSA id a22sm2538214pfk.29.2020.10.22.06.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 06:37:55 -0700 (PDT)
Date:   Thu, 22 Oct 2020 19:07:50 +0530
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     outreachy-kernel@googlegroups.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        melissa.srw@gmail.com, linux-media@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [Outreachy kernel][PATCH 0/5] drm/amdgpu: Replace snprintf() with
 sysfs_emit
Message-ID: <cover.1603371258.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using snprintf() for show() methods holds the risk of buffer overrun
as snprintf() does not know the PAGE_SIZE maximum of the temporary
buffer used to output sysfs content.

This patchset is a series of Coccinelle cleanups across the staging
directory to convert snprintf with scnprintf in the relevant files.

Sumera Priyadarsini (5):
  gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
  gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
  gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
  gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
  gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()

 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   | 8 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c      | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c      | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.25.1

