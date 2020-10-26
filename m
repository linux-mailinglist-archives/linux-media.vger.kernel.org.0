Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40A0298B21
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 12:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1772909AbgJZK7S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 06:59:18 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52112 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1772829AbgJZK6o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 06:58:44 -0400
Received: by mail-wm1-f67.google.com with SMTP id v5so11154231wmh.1
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2020 03:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r2DrHs8sznEAEmv81CQMiKCncSgZZXtZ6EFyoHCS3Oo=;
        b=IAPjgKcv++FEEE84FiAz/g3AfnWvmZMpU9H7Fwm1WL4AMstvKx9gvt+rXcwAOTRbDK
         6a1AtVrgavJFgYhQUvzJVjH76fwMqfa/xnNnbs3W1DhPD+Bm1dsHsK4sYyrLgyoyHCLf
         eFIJ8x2oK5YeCTNuA5CDBens+NuAE1+STEad8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r2DrHs8sznEAEmv81CQMiKCncSgZZXtZ6EFyoHCS3Oo=;
        b=i7Dlba20RN1IwQ0eh8MtexTCkw07cNzdt+jOU3cMGLc03+pKk5SGsTATEhF07QJD3P
         qOxnhULL16cF2XpZdDrYB1+izaBkXdvl/3zm0JaiDUc2cZzoCWIavoPOn3xStwaxAdu0
         CyDyvD8C5i2rR/Xe4ykcsWwekpP70kzog5K6GXJfes7uHch25O1ZTBnUJDPCe/EvwdO3
         MKt70gXmfxlp49VRzuSarVbP2/cm2vYuayT4kGO9PnJFLDkn2bwPwJuDELYviCHNy/c4
         nqyy5Y2Ywm3ZG6+U9v0bJ7xT8HgLWyVnZQYKFSvFXRzv1FneFkTsQPtdYjV/XhJ7gzeW
         Iq0w==
X-Gm-Message-State: AOAM530oNyqxKhFJ/SwlZGuLCtctmFx9w0MQQcdWkIWKvDLb2foz50hp
        1/Ct1NcwfGzgqEKJH1tuLV0COp4oPJ8o96v4
X-Google-Smtp-Source: ABdhPJwJv3Tt2Tk4//M2w0Xpcu1n8KPpAvO5lQ1RgvLykelcS/PnORqYG+qfi62iuVn2XcVOIRnemw==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr15197304wmi.58.1603709922604;
        Mon, 26 Oct 2020 03:58:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w83sm21165156wmg.48.2020.10.26.03.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 03:58:41 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>
Subject: [PATCH v4 12/15] /dev/mem: Only set filp->f_mapping
Date:   Mon, 26 Oct 2020 11:58:15 +0100
Message-Id: <20201026105818.2585306-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
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

