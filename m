Return-Path: <linux-media+bounces-22576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C07C9E338F
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 07:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EDF1B24166
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 06:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFA8187FF4;
	Wed,  4 Dec 2024 06:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fTcOZYze"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83E416CD35
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 06:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733293926; cv=none; b=mOV2jEV0XqE1HVlxiR6tv+QOPea8VZ/91R+XAVn2KhBL5p6UgLF0iXzeZjQF+FlFrDFta+HBXMD39GGcfJvtgGR1z9SnD5PPDdt/0Qvfp0jmRA+9upIEawEUJ2UIghUXusDuZCFdfLVXHhzBDYcNJz+f3+Q1f29BCDy8AcLOf4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733293926; c=relaxed/simple;
	bh=vXd51GbwJKXNLwv2nLkHDc5hOuj5aMRgYYIQavovp0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqnmMmD9VjcoTLJ19e4GsqSBcDvK/D2c58fnqTc4HTtNzM69olp9gYCheAUHomPMeCRyl+MnfJWbpvrtZE5uK4+nsv0K1j35N5Hj4shwD+ieFZtoEoKKTJ9rHVySi/VhmaKmdSRh5YJSx5Aw44Cjni1GihJwHZKVKd92I9xh3UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fTcOZYze; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-724e14b90cfso6391101b3a.2
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 22:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733293924; x=1733898724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GBDbYslVLF6reDpDFL+cIdoA50QWCfJ+6RlDjehcuiI=;
        b=fTcOZYzegUv1z/sVgY+NNeZDnCzvh8yCPVKf4emzp3VNz9ZBIb0i6Vu0Dl8/rkIZ4I
         mlBbrJOHRunWn1muyq3SaH2m51racR5YSwumEqYOuai60Hma1Ui+bixuSzf84qPvhdsa
         h6cfIjrEebVQ2W5qWBNaRV0zbjnUMPp1viiAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733293924; x=1733898724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBDbYslVLF6reDpDFL+cIdoA50QWCfJ+6RlDjehcuiI=;
        b=opbQKE5PtuXCOglLsoNc8ySFny30oIBghtDE1hTWE1uolYDEmwpV0pOZHWcb8Ny1y6
         n3ezjarQGN9OmUEpH5mfgv/idwJ7XjtL5LTPSR00c9Kd3oIHp0OAggY9j5swiWJNrDcV
         wu3oKaXlBQVAQLe1I/seN8L4DmWFcgRTbLKzeIgfm7RGDhxBY/qPsJL4GPh6IUXRN1T0
         fEbEEG4kWRr+eqc2R/2I57iwrrQW38bD4fQ6F0G8uynQzz77fkntL0uuiY7yS08+7XpB
         qtYZV8PEX/WT1KNKwxi5JbX0dy/sYrJVX1tiRYUGbpA14Dr1xu4HokIfyjoyOfV/UdA5
         G9KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkXYISiDoqd81fiZkINcYJyFRjaitBCFJa96A076TiVq8jGOhvNqW/ImgzgDzjh4LQAOxJ+U4npxMa3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbJYx/ucoC2ba1BI3kzQelykyhFU+nFtjmf73FkHJJ3FBUNSig
	/ahQVa8Hy8fMWR37VvEUH43aprLAFnCXzQAnXOiNpr1qgQ0b2lMhLSuu02mR7w==
X-Gm-Gg: ASbGncvL90MmOgRjMST/F16xPtuOEWfYu90r8rhDtzleMGz0D1+TFEa56jDJpF7rZXz
	+A2uKAe2BOzD/CJxi1EyJRA6qpNo+WFpxQDnbWqyUN8zcGbOSWClIexlPIIqEvUZ/ZkFfcOgPsW
	XSa8UU2+AXpH2GFBpvoptM+IU3aWbuwy8ZB8E9PW6p0FUVS8pmPyxiLH0AFgfaJhdBHeRivYYxi
	v2lBG0cM2oCEJidRLpsc1XrIrAu4yNVkC8zb56n5nGHEsSFqA==
X-Google-Smtp-Source: AGHT+IFgoqrZKvhFYx8F4ky/jD8rqqc8po02xr+Nfsr12XAUBQRr/9Y1O4Z/TTuXQPv0BeKfWTRnsA==
X-Received: by 2002:a05:6a00:1952:b0:724:e160:7f19 with SMTP id d2e1a72fcca58-7257fcbc278mr6472126b3a.22.1733293923946;
        Tue, 03 Dec 2024 22:32:03 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:f520:3e:d9a1:1de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7258b2e79d3sm917423b3a.67.2024.12.03.22.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:32:03 -0800 (PST)
Date: Wed, 4 Dec 2024 15:31:58 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv6 2/3] media: venus: sync with threaded IRQ during inst
 destruction
Message-ID: <20241204063158.GG886051@google.com>
References: <20241025165656.778282-1-senozhatsky@chromium.org>
 <20241025165656.778282-3-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025165656.778282-3-senozhatsky@chromium.org>

On (24/10/26 01:56), Sergey Senozhatsky wrote:
> BUG: KASAN: slab-use-after-free in vb2_queue_error+0x80/0x90
> Call trace:
> dump_backtrace+0x1c4/0x1f8
> show_stack+0x38/0x60
> dump_stack_lvl+0x168/0x1f0
> print_report+0x170/0x4c8
> kasan_report+0x94/0xd0
> __asan_report_load2_noabort+0x20/0x30
> vb2_queue_error+0x80/0x90
> venus_helper_vb2_queue_error+0x54/0x78
> venc_event_notify+0xec/0x158
> hfi_event_notify+0x878/0xd20
> hfi_process_msg_packet+0x27c/0x4e0
> venus_isr_thread+0x258/0x6e8
> hfi_isr_thread+0x70/0x90
> venus_isr_thread+0x34/0x50
> irq_thread_fn+0x88/0x130
> irq_thread+0x160/0x2c0
> kthread+0x294/0x328
> ret_from_fork+0x10/0x20
> 
> Allocated by task 20291:
> kasan_set_track+0x4c/0x80
> kasan_save_alloc_info+0x28/0x38
> __kasan_kmalloc+0x84/0xa0
> kmalloc_trace+0x7c/0x98
> v4l2_m2m_ctx_init+0x74/0x280
> venc_open+0x444/0x6d0
> v4l2_open+0x19c/0x2a0
> chrdev_open+0x374/0x3f0
> do_dentry_open+0x710/0x10a8
> vfs_open+0x88/0xa8
> path_openat+0x1e6c/0x2700
> do_filp_open+0x1a4/0x2e0
> do_sys_openat2+0xe8/0x508
> do_sys_open+0x15c/0x1a0
> __arm64_sys_openat+0xa8/0xc8
> invoke_syscall+0xdc/0x270
> el0_svc_common+0x1ec/0x250
> do_el0_svc+0x54/0x70
> el0_svc+0x50/0xe8
> el0t_64_sync_handler+0x48/0x120
> el0t_64_sync+0x1a8/0x1b0
> 
> Freed by task 20291:
>  kasan_set_track+0x4c/0x80
>  kasan_save_free_info+0x3c/0x60
>  ____kasan_slab_free+0x124/0x1a0
>  __kasan_slab_free+0x18/0x28
>  __kmem_cache_free+0x134/0x300
>  kfree+0xc8/0x1a8
>  v4l2_m2m_ctx_release+0x44/0x60
>  venc_close+0x78/0x130 [venus_enc]
>  v4l2_release+0x20c/0x2f8
>  __fput+0x328/0x7f0
>  ____fput+0x2c/0x48
>  task_work_run+0x1e0/0x280
>  get_signal+0xfb8/0x1190
>  do_notify_resume+0x34c/0x16a8
>  el0_svc+0x9c/0xe8
>  el0t_64_sync_handler+0x48/0x120
>  el0t_64_sync+0x1a8/0x1b0

[..]

> @@ -1750,10 +1750,20 @@ static int vdec_close(struct file *file)
>  	vdec_pm_get(inst);
>  
>  	cancel_work_sync(&inst->delayed_process_work);
> +	/*
> +	 * First, remove the inst from the ->instances list, so that
> +	 * to_instance() will return NULL.
> +	 */
> +	hfi_session_destroy(inst);
> +	/*
> +	 * Second, make sure we don't have IRQ/IRQ-thread currently running
> +	 * or pending execution, which would race with the inst destruction.
> +	 */
> +	synchronize_irq(inst->core->irq);
> +
>  	v4l2_m2m_ctx_release(inst->m2m_ctx);
>  	v4l2_m2m_release(inst->m2m_dev);
>  	ida_destroy(&inst->dpb_ids);
> -	hfi_session_destroy(inst);
>  	v4l2_fh_del(&inst->fh);
>  	v4l2_fh_exit(&inst->fh);
>  	vdec_ctrl_deinit(inst);

Sorry about the news, I got a regression report this morning and the reporter
points at this patch as the culprit.  It sees that under some circumstances
at close() there are still multiple pending requests, so hfi_session_destroy()
performed as the first step (in order to close race condition with
instance destruction) makes it impossible to finish some of those pending
requests ("no valid instance", which was the whole point).

v4l2_m2m_ctx_release() expects to be called before hfi_session_destroy(),
but this leaves us with half destroyed instance on the instances list.
Not sure what to do about it.  Would it be safe (?) to call synchronize_irq()
at the very start and then keep the old destruction order (which looks a
little unsafe) like something below *.  Or is there something missing in the
driver and there is a way to make sure we don't have any pending
jobs/requests at close()?


* something below
---
        /*
         * Make sure we don't have IRQ/IRQ-thread currently running
         * or pending execution, which would race with the inst destruction.
         */
        synchronize_irq(inst->core->irq);
        /*
         * Now wait for jobs to be dequeued. Note this will free m2m ctx.
         */
        v4l2_m2m_ctx_release(inst->m2m_ctx);
        v4l2_m2m_release(inst->m2m_dev);
        hfi_session_destroy(inst);
        v4l2_fh_del(&inst->fh);
        v4l2_fh_exit(&inst->fh);
        v4l2_ctrl_handler_free(&inst->ctrl_handler);

        mutex_destroy(&inst->lock);
        mutex_destroy(&inst->ctx_q_lock);

