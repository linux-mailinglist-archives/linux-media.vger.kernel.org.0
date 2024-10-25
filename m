Return-Path: <linux-media+bounces-20325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 565D09B0A59
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 18:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D984B21BDB
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 16:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE601FB89E;
	Fri, 25 Oct 2024 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B3+Xn7k7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6CE1E3DE0
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 16:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729875223; cv=none; b=ewCibCUp47sTYM02V05YOekQEp/Dod26vUwQy7iYT+68a43AkvAYeG/PU4m/96rjna86/bKQUR0boyme3urz48Z2RVeWTEJEETWHeeG/l2OlinAiX8vJ7FBgLA4ZTjXxr1v+ooVzqF9ZSq0BQKdWseFgr6IBi6wJ9vdqUfGb3VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729875223; c=relaxed/simple;
	bh=0NyKl+Lov4GWp+v+zsyQZ23DAOpFOuiik6huzoRIiWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAWGetv/tTta1Ko0Qkn2VLFRNDSo8GlyQPNZhNbTFrsTBq0TLypdQHwfqzAkCLw2Ce0yTa1kvHeffslWFj5Qm+kLc8jAK8TDBGPVCY4CfpQHq07sHmFwN2vq9Awctudu36Ku/7AfWPFpFM0Kx2+1BHjkjkfRteHfMYs5zIwVoO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B3+Xn7k7; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e2d1858cdfso1590809a91.1
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 09:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729875221; x=1730480021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jVU2rqPKVNAXH73v0LI1ewSZuWikN5xYs+BCbJZWAog=;
        b=B3+Xn7k74JYVEGlSsYDhbJs6qTihRa6WHCyKNAlG+JeOazGJ8V4n/WlWfk2qmXxeja
         i21vgDiMlpSpWfgEXhpSu+SGGlkxMPhLTBh6yqrxJhneqMUVN23QlYWFXdzegw9And0R
         WykEIDsCoxV5yPJkW4XTl7+2NujxmHgqU5hQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875221; x=1730480021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVU2rqPKVNAXH73v0LI1ewSZuWikN5xYs+BCbJZWAog=;
        b=O1DzFC6dBqX0bl5Wdk7frQgkDsg4i+gNQgBXb2RaTBOfzwsCJ1rROBGpSxeU0V3W07
         DApM87GXAxJ16NO7Q3Lq1UTNfY/jJEf7/dQDk8Te+vb7WnGrDlAPP3H8314LjMACf1e2
         GcEmsm8YBVFo6PRYiGxk91q5smEv2PbGgbZaXfR+Q+vnvRjfd9bu/x4jcQSgY7xStcUU
         drDv9VbS5yiL6HHjGs9fdZdtKcuB0CC0AdwepjtkvUYu+iQ4rL0j6aTnPF7QXfYt6vuh
         urAwlWcdyCGndjEgPXP7HkU0PO8ydjGtJTIvmTZs95jkPIl6mAztxGkXrjxCMvVAyp8q
         KWKw==
X-Forwarded-Encrypted: i=1; AJvYcCXX4FXhpDIzMLmNgnFWjOvZM+YYxHf8zH+apGK6vEYlOsmlngsnHZGVJ6utxuXKQdWr/mTV8LVf3RzkQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBibPIvrY+fanV3uBQen6098sT/5sKRF6J5RWhBXu/FDSQr7U
	6W8Q65giopzoScePqbbMdfHSMx8wg7OxGabuAIgo04engNyLhbppPFaNAcFt6Q==
X-Google-Smtp-Source: AGHT+IFNYcxj0TezFxfNM/gvDh9LvadjMqw2/t2U37Rmi3xrfRvnLCXDnhvwAe50jDdILtKW/BJQ7Q==
X-Received: by 2002:a17:90a:d481:b0:2e0:d957:1b9d with SMTP id 98e67ed59e1d1-2e8f1071c8dmr393a91.13.1729875221320;
        Fri, 25 Oct 2024 09:53:41 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:bd37:bccf:f3e:a9ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e48bba8sm3772825a91.3.2024.10.25.09.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:53:40 -0700 (PDT)
Date: Sat, 26 Oct 2024 01:53:36 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 2/3] media: venus: sync with threaded IRQ during inst
 destruction
Message-ID: <20241025165336.GR1279924@google.com>
References: <20241025131200.747889-1-senozhatsky@chromium.org>
 <20241025131200.747889-3-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025131200.747889-3-senozhatsky@chromium.org>

On (24/10/25 22:11), Sergey Senozhatsky wrote:
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

The kfree() part:

Freed by task 20291:
 kasan_set_track+0x4c/0x80
 kasan_save_free_info+0x3c/0x60
 ____kasan_slab_free+0x124/0x1a0
 __kasan_slab_free+0x18/0x28
 __kmem_cache_free+0x134/0x300
 kfree+0xc8/0x1a8
 v4l2_m2m_ctx_release+0x44/0x60
 venc_close+0x78/0x130 [venus_enc]
 v4l2_release+0x20c/0x2f8
 __fput+0x328/0x7f0
 ____fput+0x2c/0x48
 task_work_run+0x1e0/0x280
 get_signal+0xfb8/0x1190
 do_notify_resume+0x34c/0x16a8
 el0_svc+0x9c/0xe8
 el0t_64_sync_handler+0x48/0x120
 el0t_64_sync+0x1a8/0x1b0

