Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17E223EFDFB
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 09:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239017AbhHRHmA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 03:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239402AbhHRHlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 03:41:55 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BAB6C0613CF;
        Wed, 18 Aug 2021 00:41:21 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id nt11so2089295pjb.2;
        Wed, 18 Aug 2021 00:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E3tKLo4xSINmwLRhCWFdK6hj3HPWsZp310jfHIOH2bI=;
        b=eYlqI7+uh+RIUCvEG+ElTKQ65oYiO/7b9n5s4gD+lLB6dI3+1tBTrfM+E9gHq8+ghC
         pG+mnIdCtT+Qw/TcAMOTN1jsKNfeHJwUKNjPciJDepeHxgQuMRRs7kyHxyN3OR70HFEk
         fH+FOFElAQ4Gsek+UHpdno02wP1O8QQA6kKroGAfCuSk73VvPdce0uYe68NM9b0/lhWN
         +ViMb30Poox2EIE3XtkHQvZtKdTkqedODzSILqubxYNdgynB3qc8Ix+Nz5Uqdi4f6qGm
         3QkmjB9cvkubT2qFaKfHNev6sn1lvzQ9lLvI0mmtvOsFiagT4KeuiRaSXnwiqAQmm3v2
         i6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E3tKLo4xSINmwLRhCWFdK6hj3HPWsZp310jfHIOH2bI=;
        b=bE++CX6RJfneruJRdoRxu26NzZ7JweDNUkOzLxemORezbM5Il7vdcPJYem2fKAvA/+
         XRpoJkDEh55n/JmbFLiWsvxygTkffjS7NCSHwIYoyBsxkykn7ZVOmV2SLh+EXr+jR9ie
         U5k+24c4LQiIKS+QknrmoUaWVgj1pwxRZKnRfF5TQtd8aAqdeiebGOHyjL/1qgji6ARU
         xz3XYEHnFH/wxPt2aXDx8wJr2lh7B97mkSH1bVEkpZETXc4eEoKJNOv8iAekX+pnN++r
         SpH6iRkI2434leuKJmJ92OqD3Lp7Jj+CM1pRzAWIhX6FMeeAgSGfKuqBKtLXipHrf0k5
         Skug==
X-Gm-Message-State: AOAM531Kz1lE3M+L9sAQvU6icBACf5NStKb/TJswg+iCpYRRtkuU9a3P
        qXz8vq7Pt9KYKeOZVwvk+Fc=
X-Google-Smtp-Source: ABdhPJyntCa9RBP+wiR85wtfYtfjM9dTewB7E46OvMfEVp35CNo8y0LFchz5LQwPRQnlto9UE/Tv5g==
X-Received: by 2002:a17:902:a406:b029:12b:c50a:4289 with SMTP id p6-20020a170902a406b029012bc50a4289mr6303191plq.56.1629272480446;
        Wed, 18 Aug 2021 00:41:20 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 00:41:20 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com, axboe@kernel.dk,
        oleg@redhat.com, tglx@linutronix.de, dvyukov@google.com,
        walter-zh.wu@mediatek.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v3 8/9] kernel: export task_work_add
Date:   Wed, 18 Aug 2021 15:38:23 +0800
Message-Id: <20210818073824.1560124-9-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The task_work_add function is needed to prevent userspace races with
DRM modesetting rights.

Some DRM ioctls can change modesetting permissions while other
concurrent users are performing modesetting. To prevent races with
userspace, such functions should flush readers of old permissions
before returning to user mode. As the function that changes
permissions might itself be a reader of the old permissions, we intend
to schedule this flush using task_work_add.

However, when DRM is compiled as a loadable kernel module without
exporting task_work_add, we get the following compilation error:

ERROR: modpost: "task_work_add" [drivers/gpu/drm/drm.ko] undefined!

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 kernel/task_work.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/task_work.c b/kernel/task_work.c
index 1698fbe6f0e1..90000404af2b 100644
--- a/kernel/task_work.c
+++ b/kernel/task_work.c
@@ -60,6 +60,7 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
 
 	return 0;
 }
+EXPORT_SYMBOL(task_work_add);
 
 /**
  * task_work_cancel_match - cancel a pending work added by task_work_add()
-- 
2.25.1

