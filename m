Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6756D2949F9
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 10:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441248AbgJUI6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 04:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502301AbgJUI5J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 04:57:09 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24063C0613DA
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 01:57:09 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id n18so2109498wrs.5
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 01:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X91vcdrvFkENyRAE7ngumttfTvuoYERNqnOUmx1loc8=;
        b=GPnXCMyD+ghMvqTjeYNcG8HYusAwuJxpfHWnTLJKQIsMVr4ZAhrveCWfs4AXdeBUPw
         Y5mupIyBAV9NDJ8u8gy061IQONEWL5h8a9oYpovitSRm7WeaCy/YPrPbgEp1B6AXN1YC
         FZ2gAxPTsOCGgSfQP+HaV8u3GtfeNX/N9iPJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X91vcdrvFkENyRAE7ngumttfTvuoYERNqnOUmx1loc8=;
        b=YhxzU0q4OhPW2r2y3qfF3QHufRN8Gv8bMJIxuMcxRh75MXjWG4hBpiYfzmh5kO16XS
         AILzHmjHBu5RZUN5P4nW7OlAHOYWRN7QaCF/oB8lkN+7/n67F0xmba06TJkcYJfFg4hk
         R15Fbc1s+oMtSObPLu0B/zGVuwMzcaiUgbVq//3HXYtl//fXbxLYacrkWUHPo8gsPHhh
         fJDs1THudl+1M4KsTgNU3WFeGzUJsdPrQMb+zMhTr/gvyQnB7GgJCqCwTaYkXcSw9ACT
         fyC2EfI4U/lKE3F9mB5tFlfO3GDs6w+hXotd39U9q0FxHcbBvGI5Lb1lOW9kuVJ3vIua
         I0Hw==
X-Gm-Message-State: AOAM532htqeA88K3k26sRAs0TIdpjWY/zIr2AeR0hj1T273SXomhN5Q2
        JI9aXEIm1oCYqb8psJCJeS3fbg==
X-Google-Smtp-Source: ABdhPJwRJSi1MhjUwKHGSaK47xh7Klwun5uHdPZbkNE0DXk17iEFA5dRgyjIq8Do+yUzr74H0TKxFQ==
X-Received: by 2002:a5d:554b:: with SMTP id g11mr3494901wrw.370.1603270627906;
        Wed, 21 Oct 2020 01:57:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 01:57:07 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>,
        Ofir Bitton <obitton@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Moti Haimovski <mhaimovski@habana.ai>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Piskorski <ppiskorski@habana.ai>,
        Daniel Vetter <daniel.vetter@ffwll.com>
Subject: [PATCH v3 04/16] misc/habana: Use FOLL_LONGTERM for userptr
Date:   Wed, 21 Oct 2020 10:56:43 +0200
Message-Id: <20201021085655.1192025-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These are persistent, not just for the duration of a dma operation.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Oded Gabbay <oded.gabbay@gmail.com>
Cc: Omer Shpigelman <oshpigelman@habana.ai>
Cc: Ofir Bitton <obitton@habana.ai>
Cc: Tomer Tayar <ttayar@habana.ai>
Cc: Moti Haimovski <mhaimovski@habana.ai>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pawel Piskorski <ppiskorski@habana.ai>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.com>
---
 drivers/misc/habanalabs/common/memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index 327b64479f97..767d3644c033 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -1288,7 +1288,8 @@ static int get_user_memory(struct hl_device *hdev, u64 addr, u64 size,
 		return -ENOMEM;
 	}
 
-	rc = pin_user_pages_fast(start, npages, FOLL_FORCE | FOLL_WRITE,
+	rc = pin_user_pages_fast(start, npages,
+				 FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
 				 userptr->pages);
 
 	if (rc != npages) {
-- 
2.28.0

