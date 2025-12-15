Return-Path: <linux-media+bounces-48823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D14AFCBFD08
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 21:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F226D3016FBC
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 20:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5778C335089;
	Mon, 15 Dec 2025 20:37:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA66B32E125;
	Mon, 15 Dec 2025 20:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831048; cv=none; b=DVhqISaieVxQtU8afH6A9qO1ozjpRXZgC88QoO4VHWJhJSNeqQAPqBTVc1D38VDnuRzcbJow7eTsj50alj0RDKFbsb9df3GF8PVy5XsYbaen40cRycqGEzLiX/sBSRDe+c3kYPx+jXdiTz1Q3vXOMN8WNXo6mq+QxkeNy4yloI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831048; c=relaxed/simple;
	bh=3WGxC4deThiUTswi7b/9gEfz6MOp1u4KpDRE3hN8Gro=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lkqpga3iYlV/pBluj2f4T8rXlUSAA3H1sJ+qPESqrvvGtHX7WedZ9f+XFVCMRIAEUW9edjZM95gBpl9wgZV5BxTOzXYjmVokW5Y3HiBd1wTz1kgKUH6sK9EFxQLWGeurpgiGhPenf2rGm8nCpY5maekml6baPgt/D7Md6z/j/yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 6EF1D587CD;
	Mon, 15 Dec 2025 20:29:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 88B9320027;
	Mon, 15 Dec 2025 20:28:59 +0000 (UTC)
Date: Mon, 15 Dec 2025 15:30:31 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, mhiramat@kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org, gaoxiang17
 <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH v5] dma-buf: add some tracepoints to debug.
Message-ID: <20251215153031.1a5e6d9f@gandalf.local.home>
In-Reply-To: <20251201112148.843572-1-gxxa03070307@gmail.com>
References: <20251201112148.843572-1-gxxa03070307@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Stat-Signature: toii5izcyyq1aks869a8pijmyda7aegn
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 88B9320027
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+qMeEoee5LPAQ6YVQJX12qT1DsmumRLoY=
X-HE-Tag: 1765830539-300393
X-HE-Meta: U2FsdGVkX18aFf4OwvXYzVDWTA/eSboFoNzkl1eo9bEGSeiVOyuMh4NpyTVeyESiGAibqkNif2VoWI1CMmcKZ0RHh8MXurG9qjh5/YgxB9NJV9iATMpearTPpkhj1TxUgALmhp0LLxUkLjVVsN7A7kVw3jtNLbiy8bCRJdVyOIi/Xwrz48AHXp6dvA2hJgfrX6QURmHouwxi1r6h9STfqAr0E1q56kMRqast6rhijxUdGqH3EniVOBXqf35WhRhRG9e+I7K30JMQElVYGLHBLOl0YhoFEf11W8qM4uq4/N3C3OZI4WjuJO60oHpDgb4a/YYQ0kN8HTWpThl02+HA9Bd5rOlZCrDH

On Mon,  1 Dec 2025 19:21:48 +0800
Xiang Gao <gxxa03070307@gmail.com> wrote:

> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -35,6 +35,17 @@
> =20
>  #include "dma-buf-sysfs-stats.h"
> =20
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/dma_buf.h>
> +

=46rom a tracing point of view I'm OK with this patch, but this macro really
needs a comment.

-- Steve


> +#define DMA_BUF_TRACE(FUNC, ...)                  \
> +    do {                                          \
> +        if (FUNC##_enabled()) {                   \
> +            guard(spinlock)(&dmabuf->name_lock); \
> +            FUNC(__VA_ARGS__);                    \
> +        }                                         \
> +    } while (0)
> +
>  static inline int is_dma_buf_file(struct file *);
> =20
>  static DEFINE_MUTEX(dmabuf_list_mutex);

