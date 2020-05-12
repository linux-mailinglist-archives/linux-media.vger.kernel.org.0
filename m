Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F471CF0D8
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 11:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729322AbgELJAD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 05:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729276AbgELJAC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 05:00:02 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E814C061A0F
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 02:00:02 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k12so20802924wmj.3
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z86jDMPjYosEVmpvz8g87itNg+tEFmiX7DLzwmjjruY=;
        b=e347cRrTqkHcsmJyCgB3TVco449DVfioti3xt++37x7bJTFMigGg5EWlMaf/MjZpmR
         eYVFJlx9g9Vm+NEIhg3iXwKg86toJqtzlt+iCudluN0BiyTQqaBnCZJLIa0zEEFILrRP
         R3mU5I3uQHXrIj7OqeDSyBNZDBZCv72rxHs1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z86jDMPjYosEVmpvz8g87itNg+tEFmiX7DLzwmjjruY=;
        b=Kpp3RleOzuO/2Ui3QkAGFnliqgyDCceMIg5TE3HnqktBcmphf1EV3k0cCgLQJtEINM
         nwD6Ag5z61PiFe9+3MPhgs62eU7Pfhn7N7mepbK7Cagq9ChOt/CyAtyitzoeHhjnh4Kg
         NqCwFPbH2dBcq3kTVCriBWm1JblkORN43iM3S7fiemkuk6D/0/6rtwf4Od8lQd6dT0lC
         7sNqCRFMtyrJ4T5nam+D5tO1otekAzzT15HgadZcSsszh3ipdnxlUwC2X26VRgN0c9eT
         Qr/Gp6fI3iim8nnApVPTWXxq5jB/IyFrZHEaDR/Ni7eoTggF/fbWC3jQKLQwIQF/qdNF
         tTKw==
X-Gm-Message-State: AGi0Pua/twqvgIKc4M7LfwvdGflIALSW2VQEfr04LP2xKt47Qt+FemTb
        4DPcmyMrtsoJq2CzjpjHPjA5Ew==
X-Google-Smtp-Source: APiQypJT+3YqWFL2wx/F/qRbovKxB7nonvtIP8MsamotNvxRkHjM8KCOP8ZK10mJhOIGdoSiUWqbbA==
X-Received: by 2002:a1c:6344:: with SMTP id x65mr19610953wmb.51.1589274000857;
        Tue, 12 May 2020 02:00:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y10sm18845457wrd.95.2020.05.12.01.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 02:00:00 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC 04/17] drm/vkms: Annotate vblank timer
Date:   Tue, 12 May 2020 10:59:31 +0200
Message-Id: <20200512085944.222637-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is needed to signal the fences from page flips, annotate it
accordingly. We need to annotate entire timer callback since if we get
stuck anywhere in there, then the timer stops, and hence fences stop.
Just annotating the top part that does the vblank handling isn't
enough.

Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-rdma@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index ac85e17428f8..a53a40848a72 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include <linux/dma-fence.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -14,7 +16,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_crtc_state *state;
 	u64 ret_overrun;
-	bool ret;
+	bool ret, fence_cookie;
+
+	fence_cookie = dma_fence_begin_signalling();
 
 	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
 					  output->period_ns);
@@ -49,6 +53,8 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 			DRM_DEBUG_DRIVER("Composer worker already queued\n");
 	}
 
+	dma_fence_end_signalling(fence_cookie);
+
 	return HRTIMER_RESTART;
 }
 
-- 
2.26.2

