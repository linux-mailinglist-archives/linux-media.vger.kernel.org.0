Return-Path: <linux-media+bounces-47727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C83C87B6A
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 02:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B44013521E7
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 01:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056AA2F99AD;
	Wed, 26 Nov 2025 01:38:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A6F137C52;
	Wed, 26 Nov 2025 01:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764121134; cv=none; b=SYswGbWSIwZMqV7qdBZxwk0GaRA+Sa5Ykl2AOkyS2Bnr7NCFZmCFbOhjXTeJjPnu7/+FXa33J8oi4BuEukfTZpLp0qHSz0a/RE0uKBlfqHKxIcWuDHW4ovTvJ3M740Lt8wCoq7XXeKz8dQL/C4AMOQi9U8rlWfjo9fE26emm+vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764121134; c=relaxed/simple;
	bh=PfU3VkKRTSqLPxBwBV43PTKcy2NNHx6lsdFzXnq8Adc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gcnvQvgdWHZW2h42yG/BFa5uoSSRutHvRCKEqjyCxuT9pZVRiBe74SeXx2eO4lnUMSLCIZEGYsjI0lYVMUPq9HRSch3rSyU9OAkwK1PzxoPKjFVPkZ0VyC29h2W8eKlMsqDcvkmpOo8NOCoP3b24Idk0TZJBCYbqXfDR4dSwtnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id D871F13ADCA;
	Wed, 26 Nov 2025 01:38:43 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id D182320025;
	Wed, 26 Nov 2025 01:38:40 +0000 (UTC)
Date: Tue, 25 Nov 2025 20:39:24 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, mhiramat@kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 mathieu.desnoyers@efficios.com, dhowells@redhat.com, kuba@kernel.org,
 brauner@kernel.org, akpm@linux-foundation.org,
 linux-trace-kernel@vger.kernel.org, gaoxiang17 <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH v2] dma-buf: add some tracepoints to debug.
Message-ID: <20251125203924.3bd59b2c@gandalf.local.home>
In-Reply-To: <20251125162949.220488-1-gxxa03070307@gmail.com>
References: <20251125162949.220488-1-gxxa03070307@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D182320025
X-Stat-Signature: wayw5miybq35f7m8uxpd3ngttpjrb3gw
X-Rspamd-Server: rspamout08
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19vpd68vxmtNTdWxmMcQSSct/9/ajf8E4I=
X-HE-Tag: 1764121120-98615
X-HE-Meta: U2FsdGVkX18h4EAVllEURvlPrEQAWiGdg5Rzdx39bGekUaY1J1t/YJRFzEaYdhawLg/KlSqRN5mRr4NBH6Ky27JMAVmrJ9ItCPoks+A9WoK1Ep6ONWgg9MV8UVdQHiWryeSUUDsov6fk87uAoXEbr5sqfieXmx7hyUMoDBYZB1RLbqtuqvGwvcIuyG72l1GmYAQPIxgHY4mJZmOv/OvKlGxA49CXEM5WzRAsZIAJn7uvspoPJz6MyGgsf21JsuBjn1NjBHKMDNQTNUufAgIaZGsjYd87M03DaNE9J9bwOcuWB25V/nxYrhAPmRqQR6GH18jbQaFXuk4vLqCvSNI7u57mjRJKpbqP

On Wed, 26 Nov 2025 00:29:49 +0800
Xiang Gao <gxxa03070307@gmail.com> wrote:

> +++ b/include/trace/events/dma_buf.h
> @@ -0,0 +1,281 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM dma_buf
> +
> +#if !defined(_TRACE_DMA_BUF_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_DMA_BUF_H
> +
> +#include <linux/dma-buf.h>
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(dma_buf_export,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(long, f_refcnt)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		spin_lock(&dmabuf->name_lock);
> +		__assign_str(name);
> +		spin_unlock(&dmabuf->name_lock);

The above isn't doing what you think it's doing. The name is assigned
before this by the above __string(name, dmabuf->name).

You really shouldn't be taking any locks in a tracepoint. A tracepoint is a
callback, that isn't called most of the time. You could be hiding very
hard to find deadlocks by taking a lock in a tracepoint callback.

You need to take the lock around the tracepoint call itself where it is
called in the code. Not in the TRACE_EVENT.

You may need to have something like:

@@ -220,6 +223,8 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;

+	if (trace_dma_buf_mmap_internal_enabled()) {
+		guard(spinlock)(&dmabuf->namelock);
+		trace_dma_buf_mmap_internal(dmabuf);
+	}
+
 	return dmabuf->ops->mmap(dmabuf, vma);
 }


The "trace_dma_buf_mmap_internal_enabled()" is a static branch, where it is
either a nop or a jump to the tracing code. It's not a normal conditional
branch. It acts the same as tracepoints themselves do.

> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->f_refcnt = file_count(dmabuf->file);
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->f_refcnt)
> +);

Below seems to be a lot of very similar TRACE_EVENT()s. A TRACE_EVENT() is
literally defined as:

#define TRACE_EVENT(name, proto, args, tstruct, assign, print) \
	DECLARE_EVENT_CLASS(name,			       \
			     PARAMS(proto),		       \
			     PARAMS(args),		       \
			     PARAMS(tstruct),		       \
			     PARAMS(assign),		       \
			     PARAMS(print));		       \
	DEFINE_EVENT(name, name, PARAMS(proto), PARAMS(args));

That is, it is both a DECLARE_EVENT_CLASS() and a DEFINE_EVENT(). You can
make one DECLARE_EVENT_CLASS() and use many DEFINE_EVENT()s with it.

Each DECLARE_EVENT_CLASS() takes up around 4 to 5 kilobytes of memory. Each
DEFINE_EVENT() takes around 300 bytes to 1K of memory. The more
DEFINE_EVENT()s you use with a single DECLARE_EVENT_CLASS(), the more
memory you save. Please try to do that.

-- Steve



> +
> +TRACE_EVENT(dma_buf_fd,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(int, fd)
> +		__field(long, f_refcnt)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		spin_lock(&dmabuf->name_lock);
> +		__assign_str(name);
> +		spin_unlock(&dmabuf->name_lock);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->fd = fd;
> +		__entry->f_refcnt = file_count(dmabuf->file);
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu fd=%d f_refcnt=%ld",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->fd,
> +		  __entry->f_refcnt)
> +);
> +
> +TRACE_EVENT(dma_buf_mmap_internal,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(long, f_refcnt)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		spin_lock(&dmabuf->name_lock);
> +		__assign_str(name);
> +		spin_unlock(&dmabuf->name_lock);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->f_refcnt = file_count(dmabuf->file);
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->f_refcnt)
> +);
> +
> +TRACE_EVENT(dma_buf_mmap,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(long, f_refcnt)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		spin_lock(&dmabuf->name_lock);
> +		__assign_str(name);
> +		spin_unlock(&dmabuf->name_lock);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->f_refcnt = file_count(dmabuf->file);
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->f_refcnt)
> +);
> +
> +TRACE_EVENT(dma_buf_attach,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct device *dev),
> +
> +	TP_ARGS(dmabuf, dev),
> +
> +	TP_STRUCT__entry(
> +		__string(dname, dev_name(dev))
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(long, f_refcnt)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(dname);
> +		__assign_str(exp_name);
> +		spin_lock(&dmabuf->name_lock);
> +		__assign_str(name);
> +		spin_unlock(&dmabuf->name_lock);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->f_refcnt = file_count(dmabuf->file);
> +	),
> +
> +	TP_printk("dev_name=%s exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
> +		  __get_str(dname),
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->f_refcnt)
> +);
> +
> +TRACE_EVENT(dma_buf_detach,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(long, f_refcnt)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		spin_lock(&dmabuf->name_lock);
> +		__assign_str(name);
> +		spin_unlock(&dmabuf->name_lock);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->f_refcnt = file_count(dmabuf->file);
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->f_refcnt)
> +);
> +
> +TRACE_EVENT(dma_buf_get,
> +
> +	TP_PROTO(int fd, struct file *file),
> +
> +	TP_ARGS(fd, file),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, ((struct dma_buf *)file->private_data)->exp_name)
> +		__string(name, ((struct dma_buf *)file->private_data)->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(int, fd)
> +		__field(long, f_refcnt)
> +	),
> +
> +	TP_fast_assign(
> +		struct dma_buf *dmabuf = (struct dma_buf *)file->private_data;
> +
> +		__assign_str(exp_name);
> +		spin_lock(&dmabuf->name_lock);
> +		__assign_str(name);
> +		spin_unlock(&dmabuf->name_lock);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->fd = fd;
> +		__entry->f_refcnt = file_count(file);
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu fd=%d f_refcnt=%ld",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->fd,
> +		  __entry->f_refcnt)
> +);
> +
> +TRACE_EVENT(dma_buf_put,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(long, f_refcnt)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		spin_lock(&dmabuf->name_lock);
> +		__assign_str(name);
> +		spin_unlock(&dmabuf->name_lock);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->f_refcnt = file_count(dmabuf->file);
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_refcnt=%ld",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->f_refcnt)
> +);
> +
> +#endif /* _TRACE_DMA_BUF_H */
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>


