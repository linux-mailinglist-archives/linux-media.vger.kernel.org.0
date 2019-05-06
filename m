Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEF011517A
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 18:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbfEFQcf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 12:32:35 -0400
Received: from mail-ot1-f73.google.com ([209.85.210.73]:37044 "EHLO
        mail-ot1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727203AbfEFQbo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 12:31:44 -0400
Received: by mail-ot1-f73.google.com with SMTP id i21so7764782otf.4
        for <linux-media@vger.kernel.org>; Mon, 06 May 2019 09:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=eYbhxmTmdaiTVlq2aRmj2n9QkL6CX4/S4opJ9oDHFhE=;
        b=ZSFHbQPvMQhkrf29+rXmES4x80rxWQfO3CRg3EirSkEvMHaN6TChbsHuGqG8tqYPqI
         EOCA65HA1vwG2VBAq4EN+A4OM16jXXWhM8t5gUCVAGxaFpj7A96cWjckSSXVB9ifgUBP
         JPRXtbLz3WvjXz6TEKimgkTZH4CSKnvPcLkcG+UwjiKkw5OJqJ0dywa/iWl3MUEMoYLx
         yX/R0TAlH28V7Dy/lDpZ2CQKiEy+5rLrSQMyM1Z1SBWcw4VX+lOfzjflOLQGIDoNcKIy
         Lw+nu7cdx5CVE6SIyoKDCFcQFHBzYbom0atBI7FulTuqD2oMzEvZRTJLiB0pdkfBeBX2
         irnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=eYbhxmTmdaiTVlq2aRmj2n9QkL6CX4/S4opJ9oDHFhE=;
        b=Qo9KrmhYN7mG4NnwsrfDLam+mx2vez/NzGC+4tlB7RNhCv0IJFqdVdmM757QCO0Uhm
         fEzbfLGtrqscThV49HjXBny/J3RGr+dNQkPoOvHVdn6iiaOhXT/7IYEagVKiJFtE/9rk
         oRGUIll/YMeqVLnJtkxRZVouoGTjfbH5pU4AXz9cHLYlYzVUDEI8s9d15OERgHdZdlsE
         /+0vNQaugDuAOARIHdJtqBoOPf7dUv0k9B3eYK5FkrIUPtcatWvyVKli0k6lpEfkUiq6
         VXLtRYiy4Q1J08QdhaWZml+FrYhnQBtzTp4aKzRNjAeTtJu+PmCE3J42nLM4Col3bfAS
         3rmg==
X-Gm-Message-State: APjAAAWYSLN09ofJI7FSq8zgjkldurY1grNANlA9DVdxHSoYy1yLfYnq
        Sn3Vh6HN5FyJ5EhWCHwAsK5osb+fExwqA53y
X-Google-Smtp-Source: APXvYqzdzQlfaHkw0Qwo4QQtxGeWhxSSS13Ps1SOtj6ReWwWjESZwRkhi/LnnldOgTKgizVRLfncWXFiUgbgbiQx
X-Received: by 2002:a9d:7d04:: with SMTP id v4mr16958653otn.185.1557160304159;
 Mon, 06 May 2019 09:31:44 -0700 (PDT)
Date:   Mon,  6 May 2019 18:30:58 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <03fe9d923db75cf72678f3ce103838e67390751a.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 12/17] drm/radeon, arm64: untag user pointers in radeon_gem_userptr_ioctl
From:   Andrey Konovalov <andreyknvl@google.com>
To:     linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Leon Romanovsky <leon@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

In radeon_gem_userptr_ioctl() an MMU notifier is set up with a (tagged)
userspace pointer. The untagged address should be used so that MMU
notifiers for the untagged address get correctly matched up with the right
BO. This funcation also calls radeon_ttm_tt_pin_userptr(), which uses
provided user pointers for vma lookups, which can only by done with
untagged pointers.

This patch untags user pointers in radeon_gem_userptr_ioctl().

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/gpu/drm/radeon/radeon_gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 44617dec8183..90eb78fb5eb2 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -291,6 +291,8 @@ int radeon_gem_userptr_ioctl(struct drm_device *dev, void *data,
 	uint32_t handle;
 	int r;
 
+	args->addr = untagged_addr(args->addr);
+
 	if (offset_in_page(args->addr | args->size))
 		return -EINVAL;
 
-- 
2.21.0.1020.gf2820cf01a-goog

