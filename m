Return-Path: <linux-media+bounces-49426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFCFCD9FE9
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 17:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C80723026510
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 16:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B348A2E1C57;
	Tue, 23 Dec 2025 16:42:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A032D47E8;
	Tue, 23 Dec 2025 16:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766508161; cv=none; b=LKKDxaqTKOlH+I5MDmd5n6oozu/tN9tDc4g9k4eNBME0hY1UUyyNElWfxmWD8T5e5KjcrbnA+jVettPHvh519xnOxVPXWPV86E6MRQxwTvib6FOU02jCF/081+G9nrxC7Ns2p2daAJeKbO5iYG4N66GBcOuzrTUDHYXW1ixJ5oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766508161; c=relaxed/simple;
	bh=6vka/YE3aJcwn2utS9yYSG1sxC7gToxVmZnewTkY5h4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cIjDWtO15vpnX/1nK4dfZ2h/s+WNIWV4MCdBT3w3UBuU0PVxZJyra9NoR/7PxdNvmXhehlRB4s18nndAJVu8u0U65V5kIbMFi01xbmjOsPOneq8IHeQfPfRWBUZAqWJ/uA1INFxR6uCb6tJ+7heRujcbnp/5UeK3r5tpDVCnxWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 53D3A8ADC1;
	Tue, 23 Dec 2025 16:42:37 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id 44A942D;
	Tue, 23 Dec 2025 16:42:34 +0000 (UTC)
Date: Tue, 23 Dec 2025 11:44:24 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, mhiramat@kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org, gaoxiang17
 <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH v9] dma-buf: add some tracepoints to debug.
Message-ID: <20251223114424.1c539f7a@gandalf.local.home>
In-Reply-To: <20251223032749.1371913-1-gxxa03070307@gmail.com>
References: <20251223032749.1371913-1-gxxa03070307@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: grxkiozmi3msuufb6c4ww3d6b1ijzhoh
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 44A942D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+yIprTkm+nIvFVTiCDFSCukILDs9di80M=
X-HE-Tag: 1766508154-450411
X-HE-Meta: U2FsdGVkX1/RMwvb/I3i66TmfvJP/QYAChkQEo2YHhW8EcjemzG38cb5Wi0oW9rzAnkMwaEDpLPpnWxB+lFGcG97mdgnpnzmrWP679NlNX8FNGrdVhWTd65GLMBMoMUr+SjHIm1x2OKOW3x3Yv5CQqb+xZt2qB7wjbS1JbKgAmebXsOyZB7tdTKDStorhsE6A6YcLG7G2iDftxGHuAgcuZBnDFIVSxVQONazrjqzWjA/HgVOvmkCxGokE7ftA5fACYCUn8q6WO482an5qtVkv15JdqiiOObr0sXCp29/2DixiBpihMzyh/7Q8Y5Eio/BGGEmiOHfDVWrXM5VvhaHMuxVHi0VGfeK

On Tue, 23 Dec 2025 11:27:49 +0800
Xiang Gao <gxxa03070307@gmail.com> wrote:

>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/dma_buf.h>
> +
> +/*
> + * dmabuf->name must be accessed with holding dmabuf->name_lock.
> + * we need to take the lock around the tracepoint call itself where
> + * it is called in the code.
> + *
> + * Note: FUNC##_enabled() is a static branch that will only
> + *       be set when the trace event is enabled.
> + */
> +#define DMA_BUF_TRACE(FUNC, ...)					\
> +	do {											\
> +		if (FUNC##_enabled()) {						\
> +			guard(spinlock)(&dmabuf->name_lock);	\
> +			FUNC(__VA_ARGS__);						\
> +		} else if (IS_ENABLED(CONFIG_LOCKDEP)) {	\
> +			/* Expose this lock when lockdep is enabled */	\
> +			guard(spinlock)(&dmabuf->name_lock);	\
> +		}											\
> +	} while (0)
> +

I hate to make another comment here, but I was just thinking that this can
be made to look a little nicer. Basically, we want to make sure that when
LOCKDEP is active, we always take the lock. But we also need to take the
lock when tracing is enabled. The tracepoint itself is a static branch,
which means it is a nop when not active, so there's no real problem with
calling it. Thus, this could look better as:

#define DMA_BUF_TRACE(FUNC, ...)					\
	do {								\
		/* Always expose lock if lockdep is enabled */		\
		if (IS_ENABLED(CONFIG_LOCKDEP) || FUNC##_enabled()) {	\
			guard(spinlock)(&dmabuf->name_lock);		\
			FUNC(__VA_ARGS__);				\
		}							\
	} while (0)


-- Steve

