Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9AC930D04D
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 01:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbhBCAcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 19:32:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbhBCAcR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 19:32:17 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F73C061573
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 16:31:36 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id e62so21862716yba.5
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 16:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=SOXagrKaf/SGUJ0It1u1ORMjiyQ7gfGWlZufV5zUWJE=;
        b=Du2OOc57uVZ5uhkj2egHtA2wa0SFb9m9+y9NUmdFQiDq6WF2NakwTwFWFMXWVb3EBL
         6yZFOR+lPWlQVyiwF9d8puYRUFCxEGC1+R29nJZU8FOnSiKOy4numK8O9O1pWyf7m1VF
         8chND7Te/w1IUSVTEvSM8juDTdD/Y9h/tjYjVRIOVVMIrQ95XmURDbfFMzRgUhQ3iaW/
         ykaovl20AETBww7DpJLvE4T3DJlaYWWtMgd5XgGU2SXCdiQbXAqgAOVTrRqQT/IObwbO
         wz8tYr1IEZgh7+XbFH1Jf8hI3AA5tNm6TDQlfW/GVzGjDcRPqQagtp6MdCrThoU9FjSr
         Qs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=SOXagrKaf/SGUJ0It1u1ORMjiyQ7gfGWlZufV5zUWJE=;
        b=OdBM/ny7nlucph30H8O8MGQp7wEnp5kw7sVElzOP+tsn1Cj/XA6oKV+TN5sPLXiprL
         e+I5ecwCwYJz0DpEO9BWNfiYN0H2iKXT7l0kxd7uXC2LUtUbOldzkL6S+iHmA3aYOfzE
         TGZs7XbizM4oxQCp4F74iqyWnil3s3TuyyHDtZr2al/sgJJYcGTvdZkzo3D4ZkPWzGJ2
         Lp7QNx1E3kNr5Q2EIbDD4sGvHbRVU5ZBU3WJFyp3Pm/RXgx9ODNuPNde7TVvj7NSENxd
         o1i5bZgK6vwJ/XurH3Tk8SjwXBRm9ie2wCgA8aetaB2Sfmhb0RWxzGvPuDwxraKWxnga
         qNYg==
X-Gm-Message-State: AOAM530Vu+mqdLBXwDELn4nYRF0JGnxCEomb4+yzlJMeC3ZAVSVG9SoW
        S8JKldFFDddPMqUFMf626DdJeRj8OxU=
X-Google-Smtp-Source: ABdhPJx1oe0/DgxGORm9UrMRCk0QL4fxRFPA1BcJxhU6LPzwDc8fSpOWryrH8a7W+r9pJcxrhxvwKlDBtU0=
Sender: "surenb via sendgmr" <surenb@surenb1.mtv.corp.google.com>
X-Received: from surenb1.mtv.corp.google.com ([2620:15c:211:200:9194:cd6:1ec:3e2d])
 (user=surenb job=sendgmr) by 2002:a05:6902:1025:: with SMTP id
 x5mr707532ybt.21.1612312296088; Tue, 02 Feb 2021 16:31:36 -0800 (PST)
Date:   Tue,  2 Feb 2021 16:31:33 -0800
Message-Id: <20210203003134.2422308-1-surenb@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH 1/2] mm: replace BUG_ON in vm_insert_page with a return of an error
From:   Suren Baghdasaryan <surenb@google.com>
To:     sumit.semwal@linaro.org
Cc:     akpm@linux-foundation.org, hch@infradead.org, lmark@codeaurora.org,
        labbott@redhat.com, Brian.Starkey@arm.com, john.stultz@linaro.org,
        christian.koenig@amd.com, cgoldswo@codeaurora.org,
        orjan.eide@arm.com, robin.murphy@arm.com, jajones@nvidia.com,
        minchan@kernel.org, hridya@google.com, sspatil@google.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com,
        surenb@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
WARN_ON_ONCE and returning an error. This is to ensure users of the
vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
and get an indication of an error without panicing the kernel.
This will help identifying drivers that need to clear VM_PFNMAP before
using dmabuf system heap which is moving to use vm_insert_page.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index feff48e1465a..e503c9801cd9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1827,7 +1827,8 @@ int vm_insert_page(struct vm_area_struct *vma, unsigned long addr,
 		return -EINVAL;
 	if (!(vma->vm_flags & VM_MIXEDMAP)) {
 		BUG_ON(mmap_read_trylock(vma->vm_mm));
-		BUG_ON(vma->vm_flags & VM_PFNMAP);
+		if (WARN_ON_ONCE(vma->vm_flags & VM_PFNMAP))
+			return -EINVAL;
 		vma->vm_flags |= VM_MIXEDMAP;
 	}
 	return insert_page(vma, addr, page, vma->vm_page_prot);
-- 
2.30.0.365.g02bc693789-goog

