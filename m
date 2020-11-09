Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7422AB603
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 12:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgKILHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 06:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729637AbgKILHN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 06:07:13 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA42EC040201
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 03:07:12 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id h62so7526352wme.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 03:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Z+wwi/tFfEYyTBQIvrIHI75+eOD/rtT/HKhEUnLNfQ=;
        b=tjfVVqU7R8IyKW2OW0hqxniG20DAxuXL1U31YiQAfRN+BbUoTlDF20ez4aqC9/5uW0
         00hwc/b1caGHmtDgwFtcQTeA95vSaxFPG5Dn4I4WT//9X1vHXDHfVZSv7b68b2Gk+Ggo
         GuV/WPBhQvweB/8nzh+JOIGU28BaLQQxoW0Qew8uhVen2qKctk4tkH6Xe9kG6J+foPfc
         erqT54DF3qf5z2lmzDigmhC40Lmu2CCaR3SODiQR0zsXHTxRNzgzEn46xeTAsbTqzkbP
         1FKBEQcVgIDxKxzGBxNluYDKXrOoCH+3ipKaqLWCZx68VW0e53YAPO8nIb1YuhtZ+35J
         7AYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Z+wwi/tFfEYyTBQIvrIHI75+eOD/rtT/HKhEUnLNfQ=;
        b=DyTbJjjnp8JMPBc0q0FJKvKe04UKohVVDfoNHhAXMg+9IqBLqvNJqW7kQPt1ElsgE1
         2VXD5vMhvHyjr21mAiGzbi3qUbgz2Fx2WtGHnpo4qhEFo37ZJ/rHHFzH0c2en6a2pJgy
         lSmCU63YDCbgr+dnGDNTNKOezNZROhU5rmnwv5dUDX0H/KsDYa3fxCoN7KHg2KbTMnqy
         s57DMpq0z4lLPPMH7j3gxW7BX676d/oxbOQiVyOabJB8vDQJVWOikJycmsF5GrMIfskP
         irs+ktVrBIcePbjiYoJI0AOb/0hRMQJks7/5crbOMLzXj7a+XhTW4og+soQMlCLgjqBI
         q+tg==
X-Gm-Message-State: AOAM532d/cT+xHakTMcpIVqbFvZgphy+TawGqMebPcTZRQyKyHiAyMxC
        4xS5qrvOkDpruiUygjbFLUh4Fw==
X-Google-Smtp-Source: ABdhPJwkOvrpUKfB7tFd6Uj/97bXlddiGlW4tIGfcvqVJ2uUup2j5kk7Nqp7LIVYpPQ8tPEEkocJmw==
X-Received: by 2002:a1c:5f45:: with SMTP id t66mr7223842wmb.132.1604920031725;
        Mon, 09 Nov 2020 03:07:11 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 03:07:11 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-gpio@vger.kernel.org,
        kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
        netdev@vger.kernel.org, linux-mm@kvack.org,
        alsa-devel@alsa-project.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 7/9] drm: atomic: use krealloc_array()
Date:   Mon,  9 Nov 2020 12:06:52 +0100
Message-Id: <20201109110654.12547-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109110654.12547-1-brgl@bgdev.pl>
References: <20201109110654.12547-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the helper that checks for overflows internally instead of manually
calculating the size of the new array.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_atomic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 58527f151984..09ad6a2ec17b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -960,7 +960,8 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 		struct __drm_connnectors_state *c;
 		int alloc = max(index + 1, config->num_connector);
 
-		c = krealloc(state->connectors, alloc * sizeof(*state->connectors), GFP_KERNEL);
+		c = krealloc_array(state->connectors, alloc,
+				   sizeof(*state->connectors), GFP_KERNEL);
 		if (!c)
 			return ERR_PTR(-ENOMEM);
 
-- 
2.29.1

