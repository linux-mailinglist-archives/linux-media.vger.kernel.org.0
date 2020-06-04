Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342E71EDC60
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 06:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbgFDEgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 00:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728212AbgFDEgQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 00:36:16 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DAEC05BD43;
        Wed,  3 Jun 2020 21:36:16 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q24so550418pjd.1;
        Wed, 03 Jun 2020 21:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2xpDF2Ski/AzNAcxs9cvvYgBD25WB8OjPMGHN4Zdggw=;
        b=mfRnxFaCtnoj9sQ/h9BCPZV3JCpDSDCiCQBcWh8FQ7SmKFzIK4Nmb7Xwy30zT1hcRI
         BdBz7HAlQ6hg7F3ouUKuXozyU8QzIcKx+jf3N4Lhk9qsPekg1iwWivOsL/BDiF/SvqSR
         iz5fLMWbn8PNhvhdMN7YvJAa6nYtULixLfK3xrcY+tdCfVs/LifljsHp+oRdbCjl6czF
         iSwg6GFZDSDk/nAM7XLfrMpeBhKElkWQCg7rvzMPJGoidiXgeFIKhO9q4yJARujxfON7
         zAU7scxyWmDHe4lXIGyjRNyKSIOj2TKoPww7XlselBEdmEhH+8YHZEtLJ3rtcOaFUIfB
         meRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2xpDF2Ski/AzNAcxs9cvvYgBD25WB8OjPMGHN4Zdggw=;
        b=RDZCwaEyiIV8nA12d6sLMloGqy3bIVDwTYF2ems7P7wiWbQ9SWZf1WW2vs11sSTKKb
         TJq84CkLoP8Tua4M9QuTNd7ndMcqlYq1H6Bj95JLA87CVLR11KaBtEToXn9xYJpfqTrA
         8bmMFk0tsQC7sk/73ljLIshbh1T4fhQWP+wMWuIbAPYuK1rM6Nk/meMjiGojziTxv/Q9
         aQjjkW9W0Wm/+PfA7W//huo1N4OQ2RESpuiTfJcsS6S3NDBYgU6UHHRp0STALImTxo5i
         Fv2Qp5s+QhocPuO3LtYiLT4w8GI/YLesEBdKeZZVDtDEe1lLzFHiJsIiBzf3sAKHJh68
         a1mA==
X-Gm-Message-State: AOAM5337QcyfzAlVmkofVXUeyrgv3WPqumu0X4IdqkymG2i3XrtqKQc0
        OXLNpbs/9b6EsFCFaCtZHbo=
X-Google-Smtp-Source: ABdhPJwZd8LgTD+yRGTfGRpaoL0jPidjt/9faszZg2rhgwxRJxeSJcNg0LH9GPIeBfyhsbYYtGoNLw==
X-Received: by 2002:a17:90a:9307:: with SMTP id p7mr3631526pjo.182.1591245376068;
        Wed, 03 Jun 2020 21:36:16 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id a17sm540943pfi.203.2020.06.03.21.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 21:36:15 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date:   Thu, 4 Jun 2020 13:36:13 +0900
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v6 03/14] videobuf2: handle V4L2 buffer cache flags
Message-ID: <20200604043613.GA98819@jagdpanzerIV.localdomain>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
 <20200514160153.3646-4-sergey.senozhatsky@gmail.com>
 <b34ae09b-7c20-7255-6adc-3370680555cd@xs4all.nl>
 <CAAFQd5Cu5ex=YcuVfmEC1uNA4DZBSAF04LYtrw3-q22ZMc7_DA@mail.gmail.com>
 <cfb54bb3-a7dd-fafd-6b33-5500d6728a8f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfb54bb3-a7dd-fafd-6b33-5500d6728a8f@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/06/02 14:24), Hans Verkuil wrote:
[..]
> For vim2m (but looks the same for vivid/vimc/vicodec):
> 
> Streaming ioctls:
>         test read/write: OK (Not Supported)
>         test blocking wait: OK
>         Video Capture: Captured 8 buffers
>         test MMAP (no poll): OK
>         Video Capture: Captured 8 buffers
>         test MMAP (select): OK
>         Video Capture: Captured 8 buffers
>         test MMAP (epoll): OK
>         Video Capture: Captured 8 buffers
>         test USERPTR (no poll): OK
>         Video Capture: Captured 8 buffers
>         test USERPTR (select): OK
>                 fail: v4l2-test-buffers.cpp(1874): flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
>                 fail: v4l2-test-buffers.cpp(1937): setupDmaBuf(expbuf_node, node, q, exp_q)
>         test DMABUF (no poll): FAIL
>                 fail: v4l2-test-buffers.cpp(1874): flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
>                 fail: v4l2-test-buffers.cpp(1937): setupDmaBuf(expbuf_node, node, q, exp_q)
>         test DMABUF (select): FAIL

This helps. I'm probably "holding v4l2-compliance wrong", but I have
never seen that assertion triggering. The fix should be easy enough

---

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 79b74e96..1ee12f96 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -1871,8 +1871,8 @@ static int setupDmaBuf(struct node *expbuf_node, struct node *node,
 				fail_on_test(!buf.g_bytesused(p));
 		}
 		flags = buf.g_flags();
-		fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
-		fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
+		fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
+		fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
 		fail_on_test(flags & V4L2_BUF_FLAG_DONE);
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(buf.check(q, Queued, i));
