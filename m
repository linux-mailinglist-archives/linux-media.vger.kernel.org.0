Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9FBE44DC0F
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 20:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbhKKTWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 14:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhKKTWk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 14:22:40 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AE6C061766;
        Thu, 11 Nov 2021 11:19:51 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id gx15-20020a17090b124f00b001a695f3734aso5564030pjb.0;
        Thu, 11 Nov 2021 11:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mnClQSjEhm/eSZEhg1ceDCJC2RbfYwpO3EmjSoG3eiY=;
        b=iZ28J2QtEw2msl6DLSAVdUtNxIys3SxqnhCyXq6fahn7le6CDS9sArDiDVKVfy9P3A
         oPkDdQWWW8l7yfjQfB8WjT31NomdncUfih8eIhdJDaNKE+YCdYuq/GbPPM7ihk8g1Z/h
         Nf0mBpyNz3XfF8z8JD7u4ReFIJjQEYOVbJBlMYqnbg47AH42cxdfB7GPeveZzPYaBYYg
         E9heRYsoX25eHWEZx3X8KABGrZ1qLjeDRaXmbfs/uRWGLKiXTPk4cZCc+PJ4lxvoCC1t
         rIaL5zM4bjARwcKcXHFz2YOJwMceJfQJuyadlGQSNh/hFle70LQC0bhBfgVMVnbOzhWn
         qNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mnClQSjEhm/eSZEhg1ceDCJC2RbfYwpO3EmjSoG3eiY=;
        b=gNivtI0yBgzYHp3yLjMJZK3VpMQf6DsKIQxK8/j8diwhoBZ55nFNH2GC8L8DiVrp1W
         7S2BlG52+sPR7zyUWplLq58/CgCiQt9viQUSppdX4rTfULJafjTmDOORi58uwtbZQ3Vy
         DZSvbuv1YC5WWF7i+OTB3U/9RrE+6godF+SPO6Qjxc7brRNiVsZQqvARpZVO40+9D33O
         ENYNthQTwnCuF/R/JJh1Ozx/D+YvJRz3HIcsRq9koFm3uzsIAYjsDCYsAhQYn/AWq0cQ
         iw6+3tyALpO1rZtLN4TleoDrIks0chP4Tu661mwh9ll9a9X1C7QMYzTOaBzp1wuYMD6q
         PgKg==
X-Gm-Message-State: AOAM5324/B5cA3KE7MST6uJZ8TTImcXZRA1DMSyU12/rZ2D/OB2eNJMt
        9F/7sFR1ulo498ZWCpMUN30=
X-Google-Smtp-Source: ABdhPJzxwyWl9UV6QH6/mW38wRX+pZlUKYcDNARu6F5mlIBszSzIsI5pOWC6EJQCrYXo0YQR95WKNw==
X-Received: by 2002:a17:90a:ba03:: with SMTP id s3mr10906891pjr.116.1636658390904;
        Thu, 11 Nov 2021 11:19:50 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id fs21sm8193034pjb.1.2021.11.11.11.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 11:19:49 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK), linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK)
Subject: [PATCH 0/2] drm/msm: wait_fence fixes
Date:   Thu, 11 Nov 2021 11:24:54 -0800
Message-Id: <20211111192457.747899-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

A couple of wait_fence related fixes.

Rob Clark (2):
  drm/msm: Fix wait_fence submitqueue leak
  drm/msm: Restore error return on invalid fence

 drivers/gpu/drm/msm/msm_drv.c        | 49 ++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_gem_submit.c |  1 +
 drivers/gpu/drm/msm/msm_gpu.h        |  3 ++
 3 files changed, 36 insertions(+), 17 deletions(-)

-- 
2.31.1

