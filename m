Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0F2181A48
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 14:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729760AbgCKNwH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 09:52:07 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37765 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729746AbgCKNwF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 09:52:05 -0400
Received: by mail-wr1-f68.google.com with SMTP id 6so2724173wre.4
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 06:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EdSiddoWJSbLr+HoD/rzQuDxDnh96tXalnlSTnjDyNk=;
        b=uyovfVmHoUpJGca3KPR3hEuZGZPkjcpdS+oPRNeqe3FtcmEkco8RfEZ2xTLTtEi8lS
         RYds8e20jUlD9+jclVVXCmCVJf73noEot1YssBGGUbb3i0ZsythHwvkjU1NXZopwyfOG
         vQ5jVXhjU5H2EFzJyOVvhLg1Y1z7SrBPaE2buNnnixU6mjAwqmTITAodgyukgpqZdQ0A
         MA3IhakWtrS2dIRD4VGSQxVa5Rr0uO3TnQBt5s1rK8wP9KPcq/+uYQ+XKRo1Y6M8LoG6
         jAfv6lYa/nz2nfKB5zqIMiHnLdyovUdsYNF5zGcZqdYwav3UyaX8/g8BO19BzmJ5QI1b
         spFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EdSiddoWJSbLr+HoD/rzQuDxDnh96tXalnlSTnjDyNk=;
        b=GbP7S9JcJaUzXRO6Xh1iQJhN22PO6ygRZaL3Tm3h9o9OuUbCBDNgO1Ke0iuYvitw6t
         aenpbpxxm+FkILMyaOS2UdTUPRbMS0tkws7ohC2bJKrYDqeecJRaeVVdJi9pE7NjjCT3
         g8DmeyCGMoIqPWPnruYrDE0GD2mcmPuKuYC7O5TehfqYgSOQpLAXBDJOiqJQXEqojTTP
         /14pOfNRjDyCII5i57fBJVkEJLiXu4LTPJtjgY0Rzmaz9VbSgO2+XY/fZngT6kft3zn5
         qfIG336jK0cKVGltpTmX9WZpWize3J7Tl5MK3nDoMPxCa7Rbhe+oyepi1halJKpbQsFi
         truA==
X-Gm-Message-State: ANhLgQ1G9jdUc+POFYUwh1K0BKN3K6C8j/h6kU9RX7AXixW5iGgQpg6t
        VRamvXGpCcBKkNx9C9mZhsLbaefh
X-Google-Smtp-Source: ADFU+vvDQZoAP5t9Kngx119jPf9FnMzZ0/34dIRh4GcUnTweoHDleFgPZOnhX6aF+GPkB1qrkgUMDg==
X-Received: by 2002:a5d:410a:: with SMTP id l10mr4361775wrp.380.1583934723968;
        Wed, 11 Mar 2020 06:52:03 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8dc:e796:e7da:a319])
        by smtp.gmail.com with ESMTPSA id 138sm3183811wmb.21.2020.03.11.06.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 06:52:03 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     David1.Zhou@amd.com, hch@infradead.org, jgg@ziepe.ca,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/amdgpu: note that we can handle peer2peer DMA-buf
Date:   Wed, 11 Mar 2020 14:51:55 +0100
Message-Id: <20200311135158.3310-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311135158.3310-1-christian.koenig@amd.com>
References: <20200311135158.3310-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Importing should work out of the box.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index ffeb20f11c07..aef12ee2f1e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -514,6 +514,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
 }
 
 static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops = {
+	.allow_peer2peer = true,
 	.move_notify = amdgpu_dma_buf_move_notify
 };
 
-- 
2.17.1

