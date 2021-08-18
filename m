Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765803F023A
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 13:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234796AbhHRLHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 07:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234630AbhHRLHP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 07:07:15 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A979FC061764
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 04:06:40 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id k29so2860837wrd.7
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 04:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=NPOr3Gsm++Jn+YbgaVuAdXWQs+lGHRq4aVwKxZvTaSw=;
        b=Gb+bX/DMqPhU/Gs13lF8AY1wqU95YsbV5W+CDvEpOSq0hnHYwwvnW6d/lNA9UADnZX
         09wq+/BL4admOxeXXY4T1RPPuMJyOhLwUN6623S+X/BbKTRUPVQ4UIq69HbzA1KcPZ+B
         Hjsq2uYLK6ZiY0UjkL8U9aT8QL0lkk0TXVXCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=NPOr3Gsm++Jn+YbgaVuAdXWQs+lGHRq4aVwKxZvTaSw=;
        b=NBNyL6ECx8Duk0BnxSIdc2khw24aMWXkidM8w8rmFqeW76elhb4cm9AlZggQyMbLMt
         TW/vX87XBgiFGB4C0USNg0PmUokEplUh2oxwb0uFJC/sN3ry9txKiPa+cI6bX/co+eG+
         HuGQunoQpFL+IxtmXQby5eE4jd6nVrte9sj45jyd2ZhZVrobWN2o+7FRbeiGNF03I4oZ
         V6mLJHBjkzXgU5dnBkw0a2ADfa5BumQcMMpoU9eiXGJlIftiLXDT202rFgkvUoYtjKIO
         asI8/cNSacn+KPH3N+dwlmPGrycXbnTzbPDULmFY8qlsJmMsNnSluvUalSpu160fUEaa
         8EpQ==
X-Gm-Message-State: AOAM531RGOuMeTeay+Y3+FAHiCSfC75aGpVQnL4Ip9YlqY+5SQNldIWS
        1x8K/P3ZQIkJMgj0x3RwjVBzXA==
X-Google-Smtp-Source: ABdhPJy3direa3AYQ9AORP/zJ+ru6FCIsPvkYBAl/d0IdWCjpdrItlf4YzM0hadmH90C6qm9MQnNjg==
X-Received: by 2002:adf:f282:: with SMTP id k2mr9819865wro.255.1629284799276;
        Wed, 18 Aug 2021 04:06:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id d8sm5575127wrx.12.2021.08.18.04.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 04:06:38 -0700 (PDT)
Date:   Wed, 18 Aug 2021 13:06:36 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com, axboe@kernel.dk,
        oleg@redhat.com, tglx@linutronix.de, dvyukov@google.com,
        walter-zh.wu@mediatek.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 8/9] kernel: export task_work_add
Message-ID: <YRzpvHBQuq0kFtzH@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
        christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
        tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        kernel test robot <lkp@intel.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-9-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818073824.1560124-9-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 18, 2021 at 03:38:23PM +0800, Desmond Cheong Zhi Xi wrote:
> The task_work_add function is needed to prevent userspace races with
> DRM modesetting rights.
> 
> Some DRM ioctls can change modesetting permissions while other
> concurrent users are performing modesetting. To prevent races with
> userspace, such functions should flush readers of old permissions
> before returning to user mode. As the function that changes
> permissions might itself be a reader of the old permissions, we intend
> to schedule this flush using task_work_add.
> 
> However, when DRM is compiled as a loadable kernel module without
> exporting task_work_add, we get the following compilation error:
> 
> ERROR: modpost: "task_work_add" [drivers/gpu/drm/drm.ko] undefined!
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Just realized another benefit of pushing the dev->master_rwsem write
locks down into ioctls that need them: We wouldn't need this function here
exported for use in drm. But also I'm not sure that works any better than
the design in your current patch set ...
-Daniel

> ---
>  kernel/task_work.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/task_work.c b/kernel/task_work.c
> index 1698fbe6f0e1..90000404af2b 100644
> --- a/kernel/task_work.c
> +++ b/kernel/task_work.c
> @@ -60,6 +60,7 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(task_work_add);
>  
>  /**
>   * task_work_cancel_match - cancel a pending work added by task_work_add()
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
