Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48CE2B0D4C
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 20:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgKLTBz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 14:01:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727049AbgKLTBy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 14:01:54 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3497C0613D4
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 11:01:53 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id d142so6188450wmd.4
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 11:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xZd7d6xqls8jDl+M8ybA/csJQ/XOet7ACTV4JHLbfR4=;
        b=JKv9Y9oU0JhE2143HXtvB0mFtf5ERN77Q+DLf+PeSGB5sCN2dC7AZILVbxIh31xHSc
         8k1pm/1KJOEo3/ArxZJ8DKvzExo09zMPG4iXTqFFGnj8nrSFCh7c7sq4z79vWFjaCUhF
         cu4fJW1K//nCA7e7k0RRLxi0M51e5DxMihSLptphtScOCeHe/hfDg4S0voMBktpD+0/i
         JZEIwYVDd4b7qpIp1CcSn8FE9VB/WPm1Sm4sIHFjeDyxvJKAuMC+KMKBxCwuGgwTwt+K
         hE4wStSmmI2U1HpMNaEeHCn09SRh/SW0rrv3fFBLfXRzIfDor1UtNowtcSPSrC1A1GO8
         Lplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xZd7d6xqls8jDl+M8ybA/csJQ/XOet7ACTV4JHLbfR4=;
        b=jstpksWp/FK13IRWw2mz80Sa6ULwYxB5/eTcIi18HH6SqStlLrIpbEwIzzfHG5yW3N
         r9Loa0exaDBUxQltLI1O/R2fFQVYI5erKsGBTA1TXWmBIoEk+/iYydMkkVQcBHIYkrkT
         R/tNQfU/IU83MjLjMUHn0GmyqHPMBYJ0SfqndRQRSqiuHINt+cM8jfAA6F5VH0MuSyhM
         FMkORgRBJ+B4N+TUuMfo0p3NZzeJpAqIy0fxOUk8X1o8mguSb8q7tW/1hj66NxGguvD2
         kiARMtRqq7cSzAQ2bzkxYIjmAOMTwNKbA7t/KqN28RBoGP3gWWE3QNHXLH6XWGp6bLPS
         vHcg==
X-Gm-Message-State: AOAM530tK0TuYxmpvWHDpM3jwBWWz7yyQWqV9uKyI84773zQCLlrdS6B
        qunwBDqy+Fi3iuKIJBGfyzpCOw==
X-Google-Smtp-Source: ABdhPJxssIxVYH+hdM3iTUSfocLV+rScXqNtIh5LmjSZQBzffjCk/HPBo0B9+7pPvlDzmWHoFcUuMw==
X-Received: by 2002:a1c:dd06:: with SMTP id u6mr1084482wmg.155.1605207684974;
        Thu, 12 Nov 2020 11:01:24 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 11:01:24 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 19/30] drm/amd/amdgpu/amdgpu_cs: Add a couple of missing function param descriptions
Date:   Thu, 12 Nov 2020 19:00:28 +0000
Message-Id: <20201112190039.2785914-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:685: warning: Function parameter or member 'backoff' not described in 'amdgpu_cs_parser_fini'
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1655: warning: Function parameter or member 'map' not described in 'amdgpu_cs_find_mapping'

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Jerome Glisse <glisse@freedesktop.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 8d2878e950dab..594a0108e90fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -676,6 +676,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
  * cs_parser_fini() - clean parser states
  * @parser:	parser structure holding parsing context.
  * @error:	error number
+ * @backoff:	indicator to backoff the reservation
  *
  * If error is set than unvalidate buffer, otherwise just free memory
  * used by parsing context.
@@ -1644,6 +1645,7 @@ int amdgpu_cs_wait_fences_ioctl(struct drm_device *dev, void *data,
  * @parser: command submission parser context
  * @addr: VM address
  * @bo: resulting BO of the mapping found
+ * @map: Placeholder to return found BO mapping
  *
  * Search the buffer objects in the command submission context for a certain
  * virtual memory address. Returns allocation structure when found, NULL
-- 
2.25.1

