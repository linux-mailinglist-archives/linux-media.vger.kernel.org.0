Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A28C2A027F
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 11:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgJ3KKn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 06:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbgJ3KIq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 06:08:46 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33533C0613DA
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:08:44 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id i16so389551wrv.1
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/xcbsqH/weHsrxzIda3dt5bupXDON4brOfEy0okYN4I=;
        b=Am/XHbgBGpMLJawb2JqmvzSTsl5Idglr/zrV0R2WIYVvQFNUw/J4oTVvZTPbUkLKhM
         lisg+s8yzsUhGfWVPLerJpr5tTqFaD/XZZvYfTg7i69wyEACAvIYaBdn6yq9Md88eZbz
         D9f7nozAItBqr8ql/UrBHwNAhXwzMj19GyTGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/xcbsqH/weHsrxzIda3dt5bupXDON4brOfEy0okYN4I=;
        b=i3eh1NEhfBv4VtbFI2hZ9rpdlFajGlXAkXbjwANpeXIbH/SsDr2ypRzN+/eBMXVfot
         HjLBr8lYKUxTpunw4wOBJSAqX+UJkJ2Ru0UpATkq08ewtMnAcdch0dAbOXQ371QlyOgE
         IVJTC8BYYEsVhnT6AU8KP130lxKjpdQuMQ2hLcIZSyHk5zm9+a3AApo5llLzMzHZgI9u
         dQHMoS92IrIAMS21C5XZwTyVEoLHsDg41oSaPynH0BXi96qbVjSAfo+KLZpSD4P/U4kx
         nTkMyQEtXEnsYrpPvq1oBQOXxqPPiYsHaGcGY15qgKgMFN7NhrfP0kg0jFhSkaIUS9IA
         p0OQ==
X-Gm-Message-State: AOAM5334FW6KeIzDnX8HeL0XC0cCkcYUjcRZdoUrQQ3qcR5oqHCrTiji
        HsaUKcTHtsVgRpVLly99eTpTfw==
X-Google-Smtp-Source: ABdhPJw6XcDIp8KNlI20GqgC0ipGTSD1GbDnlhPI2pNQlmWj+LBBUtNHkeVn2IS0e8mSgO+Qt9vVtA==
X-Received: by 2002:a5d:420b:: with SMTP id n11mr2059715wrq.218.1604052522912;
        Fri, 30 Oct 2020 03:08:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v189sm4430947wmg.14.2020.10.30.03.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 03:08:42 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
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
        Pawel Piskorski <ppiskorski@habana.ai>
Subject: [PATCH v5 04/15] misc/habana: Use FOLL_LONGTERM for userptr
Date:   Fri, 30 Oct 2020 11:08:04 +0100
Message-Id: <20201030100815.2269-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
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
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/misc/habanalabs/common/memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index 0b220221873d..d08c41b90fec 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -1298,7 +1298,8 @@ static int get_user_memory(struct hl_device *hdev, u64 addr, u64 size,
 		return -ENOMEM;
 	}
 
-	rc = pin_user_pages_fast(start, npages, FOLL_FORCE | FOLL_WRITE,
+	rc = pin_user_pages_fast(start, npages,
+				 FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
 				 userptr->pages);
 
 	if (rc != npages) {
-- 
2.28.0

