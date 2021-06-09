Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C18D3A1275
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 13:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238995AbhFILW2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 07:22:28 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44610 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238912AbhFILWP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 07:22:15 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 19DE7219E6;
        Wed,  9 Jun 2021 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623237620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hk665B6tEfCs3+xiggyrmaaBVgfZTuKVzd+3pkK7Ryg=;
        b=0riftsnENuEtlKaO45VfMLILTW7CVsIiXdx49o3MHlH7Q+EKEz+QeJkuwWMGzAEhU6UHHH
        3ts3WOmOU4iussIVGweeahprcgL7L9c+tNdjKY5Dk6n3NaNwC28S1xW4RjYy+UmH7VLOjH
        k2GIcXr/JV10H9i/R8LvGdlonJJ8RMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623237620;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hk665B6tEfCs3+xiggyrmaaBVgfZTuKVzd+3pkK7Ryg=;
        b=Wcvg3bkzQ+lyHvS1B+AJdv/5DCMi0f2Em4b89mhyz0mHV8DFPdA7XrbwOT44PzMYlcG3sD
        mYqnz4K5nYFXyzDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 74EFE11A98;
        Wed,  9 Jun 2021 11:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623237620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hk665B6tEfCs3+xiggyrmaaBVgfZTuKVzd+3pkK7Ryg=;
        b=0riftsnENuEtlKaO45VfMLILTW7CVsIiXdx49o3MHlH7Q+EKEz+QeJkuwWMGzAEhU6UHHH
        3ts3WOmOU4iussIVGweeahprcgL7L9c+tNdjKY5Dk6n3NaNwC28S1xW4RjYy+UmH7VLOjH
        k2GIcXr/JV10H9i/R8LvGdlonJJ8RMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623237620;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hk665B6tEfCs3+xiggyrmaaBVgfZTuKVzd+3pkK7Ryg=;
        b=Wcvg3bkzQ+lyHvS1B+AJdv/5DCMi0f2Em4b89mhyz0mHV8DFPdA7XrbwOT44PzMYlcG3sD
        mYqnz4K5nYFXyzDg==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id SIS9G/OjwGBTUgAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Wed, 09 Jun 2021 11:20:19 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        robdclark@gmail.com, sean@poorly.run, airlied@redhat.com,
        kraxel@redhat.com, hjc@rock-chips.com, heiko@sntech.de,
        oleksandr_andrushchenko@epam.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc:     dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 9/9] drm: Update documentation and TODO of gem_prime_mmap hook
Date:   Wed,  9 Jun 2021 13:20:12 +0200
Message-Id: <20210609112012.10019-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609112012.10019-1-tzimmermann@suse.de>
References: <20210609112012.10019-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The hook gem_prime_mmap in struct drm_driver is deprecated. Document
the new requirements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/todo.rst | 11 -----------
 include/drm/drm_drv.h      | 11 +++++++----
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 12e61869939e..50ad731d579b 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -268,17 +268,6 @@ Contact: Daniel Vetter
 
 Level: Intermediate
 
-Clean up mmap forwarding
-------------------------
-
-A lot of drivers forward gem mmap calls to dma-buf mmap for imported buffers.
-And also a lot of them forward dma-buf mmap to the gem mmap implementations.
-There's drm_gem_prime_mmap() for this now, but still needs to be rolled out.
-
-Contact: Daniel Vetter
-
-Level: Intermediate
-
 Generic fbdev defio support
 ---------------------------
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index b439ae1921b8..40d93a52cf7a 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -385,11 +385,14 @@ struct drm_driver {
 	 * mmap hook for GEM drivers, used to implement dma-buf mmap in the
 	 * PRIME helpers.
 	 *
-	 * FIXME: There's way too much duplication going on here, and also moved
-	 * to &drm_gem_object_funcs.
+	 * This hook only exists for historical reasons. Drivers must use
+	 * drm_gem_prime_mmap() to implement it.
+	 *
+	 * FIXME: Convert all drivers to implement mmap in struct
+	 * &drm_gem_object_funcs and inline drm_gem_prime_mmap() into
+	 * its callers. This hook should be removed afterwards.
 	 */
-	int (*gem_prime_mmap)(struct drm_gem_object *obj,
-				struct vm_area_struct *vma);
+	int (*gem_prime_mmap)(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
 	/**
 	 * @dumb_create:
-- 
2.31.1

