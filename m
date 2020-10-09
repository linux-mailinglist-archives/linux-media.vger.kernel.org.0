Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF992884B3
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 10:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732337AbgJIICA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 04:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732706AbgJIIAM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 04:00:12 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362DAC0613E4
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 00:59:59 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q5so8901464wmq.0
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 00:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uX5hiQf2/6+JGMu7ibulF4yjLrHkS7bzKXomqQaTHWE=;
        b=LUs8gW8poh/U88b/yPCV1unTccMuHSzIpHlM9z2+BrGZRpT9/SgX900ntWxsVp0THA
         6pATcrsdZsxLyB+PObFVC/LN2SqZ3pUmcbdagnolKeMah/pcR69O+r6i8uxjKGpoKgMW
         IouGPHyDlnYWeMW6lK51rglfKepWnaslSuqQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uX5hiQf2/6+JGMu7ibulF4yjLrHkS7bzKXomqQaTHWE=;
        b=SetmA9usF+6D2pQ1+fpKo/+t1Rqi58JJuVIMOun9FIChg6u69yiKHwFsDpgZ0PQW25
         ltcsK8i9zXYpDyim54jwVrmLual4SFk3i92qAyBHPYyoxezBF6FaLGaDIiPNhQCpuCAK
         LZTvCVxLOZxTtx3bql3JAR886ai01KRvDWARJgyBnCVCxNhQz8SEWtrnSuzEXuS+DEyT
         AdZiT08uzr1qOPwwlDCVfIbuws1sDxe3oySH14kY+DOzNWEhFfMmdRpDZ+6+HwT7dJfr
         H0NGHlgHqh+FN6TcLFO1wjebafo8FffhAQwGfPm+17thrSax3RgaBAELWWvlJaDVSBuZ
         RSwg==
X-Gm-Message-State: AOAM530jftFwaWjkNytPPGAvfV6WGnbo6ebH3zDtQzaOWLHX+3/1GqSD
        k+MLZNULbFvFytssIXTlRxUKzg==
X-Google-Smtp-Source: ABdhPJzgf8p51mqg8LMpEmZ8q3ui41jSdEp5wqDSyAI+GdHX93E/LMoGG5UPxz3MA259SCYbT0mGJw==
X-Received: by 2002:a7b:c14f:: with SMTP id z15mr13474049wmi.73.1602230397816;
        Fri, 09 Oct 2020 00:59:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.00.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 00:59:57 -0700 (PDT)
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
        Pawel Piskorski <ppiskorski@habana.ai>
Subject: [PATCH v2 04/17] misc/habana: Use FOLL_LONGTERM for userptr
Date:   Fri,  9 Oct 2020 09:59:21 +0200
Message-Id: <20201009075934.3509076-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
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

