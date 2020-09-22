Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBAE1274BD2
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 00:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgIVWEB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 18:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgIVWEB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 18:04:01 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3654DC0613D0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 15:04:01 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id n22so17741551edt.4
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 15:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=gWapH+G9nYjlIO4hGELdVklKpsq8sACoI1gVBeSVnu4=;
        b=EITEgpF4ntktPf1T80SDT1pfY0hIUCg5rNxP+/V7+Qs4C/vIRyUSqCJNAD7rGrVo8R
         wa/Hz2OdcjU+Ex+h9jHzh+hDHc7moghyv+quzQunrZ0k0rkYXmUe/L9rLoHCFNXYZxj0
         gSym1XxRWJ/TNhYdC653fnU+aaH1N4ovNW0ZuRfA+6FxOX3XZ0w7mIkTLpBR6TEMW1RB
         OyrbTQxwWUyNZgak3n2GVEf3GyJBbmrc76wfmuf0qQv4XQXSuDQd/CWIqD8m1GbVX+fH
         WA53YoMMhVOMulz6xm3PF4+wmQwq2eY7FxxfojsEBGPE/+62r0cnlZpwqXDq/3Lw7eeH
         fGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=gWapH+G9nYjlIO4hGELdVklKpsq8sACoI1gVBeSVnu4=;
        b=DXzZ/YMaMu2SPs2LM9Zx1TjlMxp3bW23WV21vmmao7QdRsfmcAoTKBQkzV1Fv+/nHE
         PjsIl0IB1In2sRa05fZSAXwHwuLbg+FJhwrS4GvtXCDo+xzpuv//3PB6yagtdvO7SFBq
         j6LCzZ2L6ZlcVYeQ5VeJHFiPptgbiKg019WrmiPmkS14EEDzwxlQjVfqUTwuzo1k9dx/
         OhI4yBTaw7qS1PjDX80YXm//VNOL3lOVCCMRuYCwsH8zC98o+ER7kvQgJ4w3yTxS/aEF
         ky1ZtX3L/weq3zvHRjJ9Ae2T/gOBsJPoJrPkeEFOyX7lPC6QsTKhLGnUxzuKuFDSDIIn
         qIuQ==
X-Gm-Message-State: AOAM531tv9Rhs72H3s0EIYT1ajgbDtEdhu6kAAfpbhtkFz2WR6gcmGup
        SJPmPgoF5pZpaF9JD4XUdmZGReK3FjYvQ2JhxZCPog==
X-Google-Smtp-Source: ABdhPJxOjj738nogRJo0/8+S11mLmjZ9RROKTTWqJgufMAjwv/PuRW560hU7CbGoKgbjldqG04qMMZK6zliXeHN5wrk=
X-Received: by 2002:a50:fe98:: with SMTP id d24mr6208341edt.223.1600812239432;
 Tue, 22 Sep 2020 15:03:59 -0700 (PDT)
MIME-Version: 1.0
From:   Jann Horn <jannh@google.com>
Date:   Wed, 23 Sep 2020 00:03:32 +0200
Message-ID: <CAG48ez3tZAb9JVhw4T5e-i=h2_DUZxfNRTDsagSRCVazNXx5qA@mail.gmail.com>
Subject: mmap locking in atomisp staging driver looks bogus
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I noticed this code in alloc_user_pages() in
drivers/staging/media/atomisp/pci/hmm/hmm_bo.c:

/*
 * Convert user space virtual address into pages list
 */
static int alloc_user_pages(struct hmm_buffer_object *bo,
                            const void __user *userptr, bool cached)
{
        int page_nr;
        int i;
        struct vm_area_struct *vma;
        struct page **pages;

        pages = [...]
[...]
        mmap_read_lock(current->mm);
        vma = find_vma(current->mm, (unsigned long)userptr);
        mmap_read_unlock(current->mm);
        if (!vma) {
[...]
                return -EFAULT;
        }
[...]
        /*
         * Handle frame buffer allocated in other kerenl space driver
         * and map to user space
         */
[...]
        if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
                page_nr = pin_user_pages((unsigned long)userptr, bo->pgnr,
                                         FOLL_LONGTERM | FOLL_WRITE,
                                         pages, NULL);
                bo->mem_type = HMM_BO_MEM_TYPE_PFN;
        } else {
                /*Handle frame buffer allocated in user space*/
[...]
                page_nr = get_user_pages_fast((unsigned long)userptr,
                                              (int)(bo->pgnr), 1, pages);
[...]
        }
[...]
}


This code looks extremely dodgy to me. After
mmap_read_unlock(current->mm), the vma can be freed, and the following
access to vma->vm_flags can be a use-after-free. Also,
pin_user_pages() must be called with the mmap lock held, and you're
calling it without holding that lock.
