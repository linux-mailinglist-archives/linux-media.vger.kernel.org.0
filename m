Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96EF29ABC0
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 13:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750999AbgJ0MST (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Oct 2020 08:18:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36112 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2899730AbgJ0MRt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Oct 2020 08:17:49 -0400
Received: by mail-wm1-f68.google.com with SMTP id e2so1214743wme.1
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2020 05:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DX4Vpt/5rOOp/h8PsP6BCvcutYZPagP/0wvqhEtDkrc=;
        b=fcBVAav93bPjLTMO/GKGNWbWJSyP9xDWjrQdREKVHUObC2fvcpeMBWbKtOvwqTtDBw
         TYuM0tjJGe4hFI+bJgCEuy05Jhcj7DoPbEbpzYlue9mGnIAJyPrd5G7jnyVyC0ouqYQE
         KUcuZgHebd/KjJ7WpMudfra+Ob5jpn/DPH6XMb8lun7OwUCY62x1ZRk3XnvNkzK8JTfI
         GDSUhxWu1bxiLfQLX/wnkP4DE/r3YkbU7n/g2xdLeTwmRffMBnF1fQyXeAU/KAOUkWXm
         Qr72qjOlysXmXLLv9c8JP8XDyn+yxZSMDREYLPBPXV2IBO4ogKZ9faYnUv5Hy6pUK1mv
         KBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DX4Vpt/5rOOp/h8PsP6BCvcutYZPagP/0wvqhEtDkrc=;
        b=eYCWoUeqhzYoLpC1i+uWkXXnO1S/lYE/jSIHFw90n6pFJ7iYo4GP4ZJ1xpsvnRNfiT
         PIHIRtYSJKBt8/l32avcOgVPTlV5D1hP++jE0TnRNoWvd8uqvIhpUw62GzgmAFcvpvyp
         VZltd/CI/uUhBJFzUnbaCMziiDtl2Ms+W3dBfml3V+0ZLuEUwXhjR6zeTp2IVcBzuSCE
         1YOEI0tbYklPTiJ5l9p6J5+FtT5BPfryi71t3qqUu/W9btgFOZ7nYYSoRs8xO6conBF/
         vmJezHc+NYPJttmiTIuue286RmAr5Ku2RQQdjeu/G28LqlvpTPHky8yaFmo/WPEdl3u2
         tShw==
X-Gm-Message-State: AOAM531+0ylEDXcuBpHsd89DNZN6w95cINvuU/ZjHln/K2zaMdm0LPeX
        H5wBjLaoOQy8jkQn0+6SWeQvYw==
X-Google-Smtp-Source: ABdhPJxpFHC1iDNaVhyqgdX0LXFgCHzNZUEcFDl9D5G1/wCxSZcWoj/5QOXgpccEbzpQpJAT/3s/cw==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr2573033wmi.140.1603801066439;
        Tue, 27 Oct 2020 05:17:46 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id a2sm1731908wrs.55.2020.10.27.05.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 05:17:45 -0700 (PDT)
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
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 5/8] edac: ghes: use krealloc_array()
Date:   Tue, 27 Oct 2020 13:17:22 +0100
Message-Id: <20201027121725.24660-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201027121725.24660-1-brgl@bgdev.pl>
References: <20201027121725.24660-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the helper that checks for overflows internally instead of manually
calculating the size of the new array.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/edac/ghes_edac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/ghes_edac.c b/drivers/edac/ghes_edac.c
index a918ca93e4f7..6d1ddecbf0da 100644
--- a/drivers/edac/ghes_edac.c
+++ b/drivers/edac/ghes_edac.c
@@ -207,8 +207,8 @@ static void enumerate_dimms(const struct dmi_header *dh, void *arg)
 	if (!hw->num_dimms || !(hw->num_dimms % 16)) {
 		struct dimm_info *new;
 
-		new = krealloc(hw->dimms, (hw->num_dimms + 16) * sizeof(struct dimm_info),
-			        GFP_KERNEL);
+		new = krealloc_array(hw->dimms, hw->num_dimms + 16,
+				     sizeof(struct dimm_info), GFP_KERNEL);
 		if (!new) {
 			WARN_ON_ONCE(1);
 			return;
-- 
2.29.1

