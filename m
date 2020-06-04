Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915681EDF7B
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 10:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgFDINd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 04:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbgFDIMu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 04:12:50 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8D9C05BD1E
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 01:12:48 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c71so4284268wmd.5
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 01:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OK1ZbpoTNfccVSYFcsXj8JWZN2H8wb6NBSYBSiY0g+w=;
        b=VVvxH1bHV9p97ank/8LpaorTHKGsJwZyd+JirwJXy0+qZG4TB8H7Oydr9fEe+RFC1/
         k1imVqgdJmEqRkZpgw7mIlLcSS5DA0RAvO2zX5M6vZPa7o9dsbw1v3gmCBgImxZgGaXs
         civc/FbkkhZ5D3KeU5JL9OxvPlSRme8vDYfYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OK1ZbpoTNfccVSYFcsXj8JWZN2H8wb6NBSYBSiY0g+w=;
        b=mdMiZ7068VkiScuk+ic2ieiXh/knR4xQCKx4uFRriyyulr1ClEu1o17Qh3WIVlfM1D
         XKow7U17MWFIT5kke4YD/78Zts0s9IvxKAG8HTB6+GvsD8purbX1bTlinQL9k/ntv0AI
         gWr8mprVi/AORXlGtD+EPV3iHnLy6yu0lgVrXI35Hg5Nyg+WPdmnQgU/KmXIMhx5/9Kq
         yhls64FDotcrFb91FRXq4a8xLi3Uvr70uUQQmNt/PIeeIrOk9boW5trQmVVLqJ9U/Pz+
         Ababo1K4sNORjdA41RAX3iIH/NVIugjcYqTsH31hxCA7VBl6i2EBImIvVC7s+Lh0qZbJ
         6Hvg==
X-Gm-Message-State: AOAM530iQxtBD/XFx8h7EcqUQYBY9NOHOApIthp/o2c5CQRg4FRA/3rq
        Far5o/nWolyh3gToMO3klyePXQ==
X-Google-Smtp-Source: ABdhPJxSRgyDL97CLiAzJiTWnOVc3+E0KQ864iKHEkQpN+0FvKvYO/V8cL0dvx5C878kh5RZWIw8RA==
X-Received: by 2002:a1c:df57:: with SMTP id w84mr3077102wmg.52.1591258367556;
        Thu, 04 Jun 2020 01:12:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f11sm6873305wrj.2.2020.06.04.01.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 01:12:46 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-rdma@vger.kernel.org,
        amd-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 12/18] drm/amdgpu: DC also loves to allocate stuff where it shouldn't
Date:   Thu,  4 Jun 2020 10:12:18 +0200
Message-Id: <20200604081224.863494-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Not going to bother with a complete&pretty commit message, just
offending backtrace:

        kvmalloc_node+0x47/0x80
        dc_create_state+0x1f/0x60 [amdgpu]
        dc_commit_state+0xcb/0x9b0 [amdgpu]
        amdgpu_dm_atomic_commit_tail+0xd31/0x2010 [amdgpu]
        commit_tail+0xa4/0x140 [drm_kms_helper]
        drm_atomic_helper_commit+0x152/0x180 [drm_kms_helper]
        drm_client_modeset_commit_atomic+0x1ea/0x250 [drm]
        drm_client_modeset_commit_locked+0x55/0x190 [drm]
        drm_client_modeset_commit+0x24/0x40 [drm]

v2: Found more in DC code, I'm just going to pile them all up.

Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-rdma@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c                 | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c          | 4 +++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index 4cfc786699c7..1b0c674fab25 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1226,7 +1226,7 @@ static int amdgpu_atom_execute_table_locked(struct atom_context *ctx, int index,
 	ectx.abort = false;
 	ectx.last_jump = 0;
 	if (ws)
-		ectx.ws = kcalloc(4, ws, GFP_KERNEL);
+		ectx.ws = kcalloc(4, ws, GFP_ATOMIC);
 	else
 		ectx.ws = NULL;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index adabfa929f42..c575e7394d03 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6833,7 +6833,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		struct dc_stream_update stream_update;
 	} *bundle;
 
-	bundle = kzalloc(sizeof(*bundle), GFP_KERNEL);
+	bundle = kzalloc(sizeof(*bundle), GFP_ATOMIC);
 
 	if (!bundle) {
 		dm_error("Failed to allocate update bundle\n");
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 45cfb7c45566..9a8e321a7a15 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1416,8 +1416,10 @@ bool dc_post_update_surfaces_to_stream(struct dc *dc)
 
 struct dc_state *dc_create_state(struct dc *dc)
 {
+	/* No you really cant allocate random crap here this late in
+	 * atomic_commit_tail. */
 	struct dc_state *context = kvzalloc(sizeof(struct dc_state),
-					    GFP_KERNEL);
+					    GFP_ATOMIC);
 
 	if (!context)
 		return NULL;
-- 
2.26.2

