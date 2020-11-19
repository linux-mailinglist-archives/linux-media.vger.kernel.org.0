Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 594042B9520
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 15:52:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgKSOmG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 09:42:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728243AbgKSOmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 09:42:01 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A92C0613D4
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 06:41:59 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id w24so6983166wmi.0
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 06:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BncYwQUXFPiR0GxLr1F9YwbgAzjEsk1wQx+9va+10MM=;
        b=K0vQCqnXZ6T6woRBBjXZmIIJdRG14xxBAsTVTnG2u2ZM8n2LON/HqCY/q+zSCKvx7N
         Nu3XAUPnIepU8dW4i9I0EOFOnT1NF/ZA7AZT9yjABQRD+aeNAyGECqg38VwZfV5MHM14
         YYb5qtueEKaw+W0IY5/Kz7KzbN49c/cZD3gac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BncYwQUXFPiR0GxLr1F9YwbgAzjEsk1wQx+9va+10MM=;
        b=rqS9AjO4oqDiIoY/sw1xfJpLS7nxiItc/O91XungO6cJbX8WwSNLqUTWG0yMZto0a9
         HE/isd2Ew52u2mU2nANsnQGk9oCYwLk4yGNrPjh3qmL8AIwW0iWlcqQujt+7X6HEUqip
         IUNobF7jXmGlMnxeI5Z+WUJ5Ujw42ed33lIoQIn8A2UUaZ0HibhlcPnAIHPHPLMPOgCM
         oHdBvlkuENwmsjrSyxHrFIllVCSrxLoLRw0JW+eRxUP/sggtdq43QtUS8nwOG/yjJU0S
         CNo/PQjacnJqExg1IYvnxyQU2Etz3/dWLUokzNLNoRcLUEskaJVeI5rX24R9Mgv784E7
         HaLw==
X-Gm-Message-State: AOAM530pyNsrKpziCuZDhf6NhdHXXd3DuTCzW4H4BuYiFM309grEV6Sh
        nQJHr8Nwp8d81mgO1nEISfVmLA==
X-Google-Smtp-Source: ABdhPJyhXRwCszI545+qzFcrtkdIZyH4wA6LDl1U1AbXMoFGkAcaSUy085Lttme8fsx2zNmhvHco1g==
X-Received: by 2002:a1c:7d10:: with SMTP id y16mr5125171wmc.142.1605796918578;
        Thu, 19 Nov 2020 06:41:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x63sm51292wmb.48.2020.11.19.06.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 06:41:57 -0800 (PST)
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
Subject: [PATCH v6 04/17] misc/habana: Use FOLL_LONGTERM for userptr
Date:   Thu, 19 Nov 2020 15:41:33 +0100
Message-Id: <20201119144146.1045202-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
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
2.29.2

