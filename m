Return-Path: <linux-media+bounces-65295-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N1i0LC1VNWoPtQYAu9opvQ
	(envelope-from <linux-media+bounces-65295-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 16:41:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 204196A6779
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 16:41:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65295-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65295-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C42530120DD
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EE23A544C;
	Fri, 19 Jun 2026 14:41:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE50028980F;
	Fri, 19 Jun 2026 14:41:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781880103; cv=none; b=lTPImJchFNZeRwwbiyPOqbDIwHeGH8Zk4Vo0UEfOdV4QKZAGKTVaas+/LaDtVt9ses5ieqCDrH7yRJZuah0qP3zbyKXHgVs2QZnahaZbK8dk8474mEq17g2S/TP2JMutK+y3VzKzF4rFY5TK5fyfARc1SC7O9iB2IV8BupSYuaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781880103; c=relaxed/simple;
	bh=K9IKWSIGlS34gxiEbPaL4E5x6wsl47KVizn0XF4Obfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bIIcAFazex+KXe0VTgfFySRnQ4wakHXkRRwO+dYbgwGS8gy3pl5WhQftvJD5VgT/dfS6AfCjY4RTxRy1HintISrD5jCljgleRwNogruNiGf+IITINur2/ZEAelUGIOL4QpBVLoprlc9HbhaACYWRLh6/K2nDd6R+swg5169kmAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3941F000E9;
	Fri, 19 Jun 2026 14:41:39 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: jgg@nvidia.com
Cc: airlied@gmail.com,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	patches@lists.linux.dev,
	rodrigo.vivi@intel.com,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	tursulin@ursulin.net,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH 1/5] dma-buf: Change st-dma-resv.c to use kunit
Date: Fri, 19 Jun 2026 16:41:37 +0200
Message-ID: <20260619144137.1582409-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
References: <1-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65295-lists,linux-media=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:airlied@gmail.com,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:linaro-mm-sig@lists.linaro.org,m:linux-media@vger.kernel.org,m:patches@lists.linux.dev,m:rodrigo.vivi@intel.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:tursulin@ursulin.net,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:kunit-dev@googlegroups.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@glider.be,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,lists.freedesktop.org,linux.intel.com,lists.linaro.org,vger.kernel.org,lists.linux.dev,intel.com,ffwll.ch,linaro.org,ursulin.net,linux.dev,davidgow.net,googlegroups.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,nvidia.com:email,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 204196A6779

	Hi Jason,

> Modernize the open coded test framework by using kunit.
> 
> The kunit tool can be used to build a kernel and run it in a VM with:
> 
> $ tools/testing/kunit/kunit.py run --build_dir build_kunit_x86_64 --arch x86_64 --kunitconfig ./drivers/dma-buf/.kunitconfig
> 
> Along with the other ways to run kunits.
> 
> To make the kunit tool work like this the DMABUF_KUNIT_TEST kconfig must
> select DMA_SHARED_BUFFER to get it turned on without building a driver
> using it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks for your patch, which is now commit 15b9bde78baddc27 ("dma-buf:
Change st-dma-resv.c to use kunit") upstream.

> --- /dev/null
> +++ b/drivers/dma-buf/.kunitconfig
> @@ -0,0 +1,2 @@
> +CONFIG_KUNIT=y
> +CONFIG_DMABUF_KUNIT_TEST=y
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 8d4f2f89f24e3c..7d13c8f4484dd3 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -54,6 +54,14 @@ config DMABUF_SELFTESTS
>  	default n
>  	depends on DMA_SHARED_BUFFER
>  
> +config DMABUF_KUNIT_TEST
> +	tristate "KUnit tests for DMA-BUF" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	select DMA_SHARED_BUFFER

This select means that enabling KUNIT_ALL_TESTS also enables extra
functionality, which may not be desirable in a production system.
Unfortunately DMA_SHARED_BUFFER is invisible, so just changing this from
"select" to "depends on" may not be the most desirable solution.

> +	default KUNIT_ALL_TESTS
> +	help
> +	   Enable kunit tests for DMA-BUF
> +
>  menuconfig DMABUF_HEAPS
>  	bool "DMA-BUF Userland Memory Heaps"
>  	select DMA_SHARED_BUFFER

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

