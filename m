Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3092949D4
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 10:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502386AbgJUI6F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 04:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502379AbgJUI5Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 04:57:24 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D028C0613E6
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 01:57:22 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e17so2017154wru.12
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 01:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uPFBW3zdBbgXKQwmFhj6n2htyRlDiIM2JKOjMDR2Svk=;
        b=Q5xIQ5ZZYYOT58QTfrI5br9Ppx/bLZ105j8P0fIicibYOu5IC1Sg/+iyIB7NDvjNKa
         v8dXdU35mjbOyyP8u0IJ7eEZ+vL/X1lNG63n9af15UXY4ydu5XizX8BQwljv+vmiyhWM
         HFmJ5amWKsGB1BdrFdTO0WHgPqyFGMOuvguGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uPFBW3zdBbgXKQwmFhj6n2htyRlDiIM2JKOjMDR2Svk=;
        b=l6+Qy8TpTfcptvvn2Ds5KNB29eypUf3dGWjUvDPd3nLD5kqsgeKlGVESmB+pC7ukP8
         fQcqtgZhy0b99ayRMybyfv8e5PYPbcWb5dLILZ3QxvljAYGCme2TS56/XjUkLuyzLhEH
         WK5wy6nXqFLsiWkNeR+Sp2Xm4Z7foq2gdnG+1OAkH/7G43S4ufm5y/yX6r5Cnq16N30I
         ZiWcCG6NbyB4ic24BY1z+ONDcqUO4/YYJ1JMsWpSpNm39SnRSwsfv4QXctlGHj2Yqqp3
         dLYfZg+hBWOac+xDClpHmgQCyi8ZAWerqWNHNUdY53UYpME5gVupSCdbpavNr9gav8DJ
         5FmQ==
X-Gm-Message-State: AOAM531DKfIoZo0AmLn8hSLIuEx5kLa453MpowEpnkl4OTi+OGKcn3LD
        E33QjXJYloP3T6YZFJ5TtAd21A==
X-Google-Smtp-Source: ABdhPJy8GRdMv9VFxpslmlWygSQvuKUEKPEZC0G0JfmHSUQJEjAtWYN/WzAaxZWK8SwF8l2Bb92lIg==
X-Received: by 2002:a5d:6a85:: with SMTP id s5mr3550223wru.90.1603270641395;
        Wed, 21 Oct 2020 01:57:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 01:57:20 -0700 (PDT)
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
        Jan Kara <jack@suse.cz>,
        Daniel Vetter <daniel.vetter@ffwll.com>
Subject: [PATCH v3 13/16] /dev/mem: Only set filp->f_mapping
Date:   Wed, 21 Oct 2020 10:56:52 +0200
Message-Id: <20201021085655.1192025-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
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
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.com>
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

