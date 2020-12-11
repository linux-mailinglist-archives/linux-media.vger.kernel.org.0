Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA342D7A76
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 17:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406668AbgLKQAw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 11:00:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406340AbgLKP7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 10:59:38 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF18C0613D6
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 07:58:53 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id i9so9537456wrc.4
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 07:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eI9svEscFFEDHjZ/6rb7PQ6fCEwvLqPuRGZ41CR0IOE=;
        b=Ul4NgJKZ+VuEJ9Ke4828Uu1XNWega/19OpNJ46AF4xjJu73b0OspZ1/CGB+nNarjj+
         Fwg3F/1wwm77oFGYETrnmGi4o+RcS07Kil3LNJKXFtMLqiD+n7wvHC3A5qSoWeyADFKu
         c4ES6nJPLpl8XYU+Rtr27hX3fLhwVaY3YJgs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eI9svEscFFEDHjZ/6rb7PQ6fCEwvLqPuRGZ41CR0IOE=;
        b=nYnwCylDNrey7JaS0OmfT0W2ikn2TofqKj7dKYNO1DDBvm2sSQeDLoQNSwBm96MLdm
         bR0zBmCK7XKx2UemNrBd2dLqf4Me0wDkZTuJb+u5k6MyT2kRtbDwqjLj3WGf+vERnhug
         bToTJ4wcgv/vCxYRnDkYcF59gCb3fAFSy7/4UwP3wE8eMvco4PSo0z7LsOFyZACuDwup
         8bPw/jO8Vv9iXNPbyW2fT0uAla3pxIqpiGEG9dmIBj1oCf7rwBP1dUfbSqxGbgOcxr3p
         mWDoyc6PiTnP5b3Twbk7KV+kjQnPMd04M0agldE9zKKo+x3nLrRm2rpnlN19COQwChkN
         EnnA==
X-Gm-Message-State: AOAM531Mju8z2wuVC3jj+11QU7ThwjXk3A+kweu8SK55N3YjXo7ykz0R
        53iV181Ni6BuKIDaN9Cgqu/E3w==
X-Google-Smtp-Source: ABdhPJyFxZCqemzt/g6P2XoqMBFJ21XrRke48okT8FQRyUvc+wuGP5q3+cNwooS9ousLaFZvzrTnDw==
X-Received: by 2002:a5d:4a10:: with SMTP id m16mr14958011wrq.18.1607702331851;
        Fri, 11 Dec 2020 07:58:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z21sm14828241wmk.20.2020.12.11.07.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 07:58:51 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/4] dma-buf: begin/end_cpu might lock the dma_resv lock
Date:   Fri, 11 Dec 2020 16:58:42 +0100
Message-Id: <20201211155843.3348718-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
References: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At least amdgpu and i915 do, so lets just document this as the rule.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-buf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e1fa6c6f02c4..00d5afe904cc 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1118,6 +1118,8 @@ int dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 	if (WARN_ON(!dmabuf))
 		return -EINVAL;
 
+	might_lock(&dma_buf->resv.lock);
+
 	if (dmabuf->ops->begin_cpu_access)
 		ret = dmabuf->ops->begin_cpu_access(dmabuf, direction);
 
@@ -1151,6 +1153,8 @@ int dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 
 	WARN_ON(!dmabuf);
 
+	might_lock(&dma_buf->resv.lock);
+
 	if (dmabuf->ops->end_cpu_access)
 		ret = dmabuf->ops->end_cpu_access(dmabuf, direction);
 
-- 
2.29.2

