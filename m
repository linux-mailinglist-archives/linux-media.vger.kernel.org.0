Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AC72AB5EA
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 12:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729615AbgKILHM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 06:07:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729586AbgKILHK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 06:07:10 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02B8C061A4A
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 03:07:07 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id s8so1124681wrw.10
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 03:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m2ikj+dhQ1Zeha09QctzFr3Pm7l2AwdyE1EcOPpxBQc=;
        b=lrGFiV0JEwMQZrmMw1exEx6p70DOim7QTqsGe9oOJfscxaaDbqtNd51mDY2gLrVO6e
         AJaVU6gEvJ5Rqj0pmzF+RQrIAx3UUypf5ocQh5+MxoPZ8v5DbPYgi+LUXOO0xXncPOxJ
         vazruXakD7raTY00eG7zaplUuhpuFOzAXeDC0+Go3Z91tS4RB4jYmtz+tumRzgHuHKVW
         Q3APL+KmLaN9niAGudHytA7iWz6ha072HjPWCU0qqHVWmvaciARBx8JEUQUEjIamSyMq
         CKw7PL+YgCXUcrNMDTeAPsCWzL8tuPTeq/pLQmlfpQnNOHY3qjMybpVo+6SdERNaMi03
         sDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m2ikj+dhQ1Zeha09QctzFr3Pm7l2AwdyE1EcOPpxBQc=;
        b=ii0R7fnsYrXj2/FEwZmQAzXLnXJz6H5M0/pF7iizN0YKrBg84wJf7lAJLXqH/MBO6z
         LXCXw5qmG6+dvqqB4HSteRooQ7E8kgHJL+6DQj0KBjVIt20yZZD3x5tASsSNXmE7wdNB
         cv0MRl2fqYbXZD1n8XfmmTnzkKDoewWvfxgX1ceQ4NOVPaSEta3cg1XipEVeUaRhIQVb
         ys2+PmFzbBGTdO2Dzful6tHiiye1dJ9oFsa0SajJbWtbdkPdlwoilqleOXR/XEgIoL8O
         C6nxS+xJT9Vec9z9MibmQndw4gY/7Fl3vV8RX3mIusR71MwO1J9ppvl0fzT2M/QY117f
         HtHw==
X-Gm-Message-State: AOAM532G+nNhynugPw6Fsddkx/CpKAP4CKsRGKDOsSvD1X+osOpdevY5
        Fn9SjmJ/zymavzZYmnwa7I8lsg==
X-Google-Smtp-Source: ABdhPJyDQDC3mJ8XBzXRPLr9tujc8yB1EaUC1zlVXx3gghE7oqzt7WatCScZ7dhRaCoAETe4X60pOw==
X-Received: by 2002:a5d:54c5:: with SMTP id x5mr3869675wrv.297.1604920026445;
        Mon, 09 Nov 2020 03:07:06 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 03:07:05 -0800 (PST)
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
Subject: [PATCH v3 4/9] vhost: vringh: use krealloc_array()
Date:   Mon,  9 Nov 2020 12:06:49 +0100
Message-Id: <20201109110654.12547-5-brgl@bgdev.pl>
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
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vringh.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index 8bd8b403f087..08a0e1c842df 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -198,7 +198,8 @@ static int resize_iovec(struct vringh_kiov *iov, gfp_t gfp)
 
 	flag = (iov->max_num & VRINGH_IOV_ALLOCATED);
 	if (flag)
-		new = krealloc(iov->iov, new_num * sizeof(struct iovec), gfp);
+		new = krealloc_array(iov->iov, new_num,
+				     sizeof(struct iovec), gfp);
 	else {
 		new = kmalloc_array(new_num, sizeof(struct iovec), gfp);
 		if (new) {
-- 
2.29.1

