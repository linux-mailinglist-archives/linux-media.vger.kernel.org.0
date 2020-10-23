Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B0F296EAA
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 14:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463691AbgJWMXP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 08:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463694AbgJWMXN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 08:23:13 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4659EC0613D2
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:23:12 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e2so1305658wme.1
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r2DrHs8sznEAEmv81CQMiKCncSgZZXtZ6EFyoHCS3Oo=;
        b=ZYi8sWlYqHhW266a7Wh4e6eQQ7DyJpqW3Nom0/Vr/JEW76wTqmHKXtiUU2akIxM9qE
         8aR9Gox2HMVTwkNkPC+2hvbT31wupa4IhJNXHm/GZLFwhyKkoZlckNfJvIscTIBwTBdu
         K9kLhfXuXSyNypnF/UEvOEGMAa8S7zhjmlrlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r2DrHs8sznEAEmv81CQMiKCncSgZZXtZ6EFyoHCS3Oo=;
        b=MvtLW7K2Ifya29cCiXGs1UNobG0u0GsoRPRNiEGP2jelXTOC0pXaZ01IQ9lPyZjjg7
         8hvhmTFmAzR3ee51qBKLHVPf3MEdyYQqU1FLtovLDyYsrhF7MrdTfLWB+b+tVlT1Rmqx
         1GrfcTtH5HN1f7YiqYws5vX0DcfTQD0HyrauQxT6648yqL8vVrGx3bHW1INuZ609+Vnv
         8bNZS1pBYHlELGX29FzJIR9xwyyE4Iu9pDMSNmcyrdsGXXZ/FK08gPnHNKoLEPVMvN4X
         NM3nvCQOGFUVm/dMp6EtFu5kQVGIr8bU+6isY3KSH5HJJanAV/W7sAgbJ8rRC8qUDTRn
         RO4g==
X-Gm-Message-State: AOAM533cOIGqH/z3ujazeiHzlS7VkJtGc+/aU1hARtAVI60kXJTAsici
        ETcLTm1GUTmMvimZALXqJlHcgw==
X-Google-Smtp-Source: ABdhPJxMGQvA/dZohSXbnMcyrWAeGFzAxThKHUObw664xzBQpaV3+wC1rwIhI7OjqV8yoZkn2jUtDA==
X-Received: by 2002:a1c:4445:: with SMTP id r66mr2002851wma.140.1603455791088;
        Fri, 23 Oct 2020 05:23:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:23:10 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 41/65] /dev/mem: Only set filp->f_mapping
Date:   Fri, 23 Oct 2020 14:21:52 +0200
Message-Id: <20201023122216.2373294-41-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When we care about pagecache maintenance, we need to make sure that
both f_mapping and i_mapping point at the right mapping.

But for iomem mappings we only care about the virtual/pte side of
things, so f_mapping is enough. Also setting inode->i_mapping was
confusing me as a driver maintainer, since in e.g. drivers/gpu we
don't do that. Per Dan this seems to be copypasta from places which do
care about pagecache consistency, but not needed. Hence remove it for
slightly less confusion.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/char/mem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index abd4ffdc8cde..5502f56f3655 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -864,7 +864,6 @@ static int open_port(struct inode *inode, struct file *filp)
 	 * revocations when drivers want to take over a /dev/mem mapped
 	 * range.
 	 */
-	inode->i_mapping = devmem_inode->i_mapping;
 	filp->f_mapping = inode->i_mapping;
 
 	return 0;
-- 
2.28.0

