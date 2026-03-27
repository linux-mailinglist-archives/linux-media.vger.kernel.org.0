Return-Path: <linux-media+bounces-57254-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPAhKe2Uxml7MQUAu9opvQ
	(envelope-from <linux-media+bounces-57254-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:32:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 472183461CA
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AA4030E152B
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCBA3F23B7;
	Fri, 27 Mar 2026 14:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFD6LXEw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E452D9492
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621549; cv=pass; b=iGfIIzG7gOJqR7R6nim5tjkdWZtGWYciVJQFZAQZ+hrRwgZ/AQiBax3zmpH5e+2BDzP6Rkdj/huVU6A6bdNmIaERRup0COQ8C/G/Vmdax83R44MqyBeKt43T9o14blfMtmH6VISyKvUFNo4nObX6IXEPpx78MHvZgQt8ajD9qw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621549; c=relaxed/simple;
	bh=Y9XqaeQh8OozS3JKs8ke6BoMKRYt2QxRWf/1HB35n+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3s9En7KlzwEqT66+p5zKjbm7XJK1t3pJ+H2i0jaTVRjOWeBgFUQPpXmPhWUwrCePjd5LCi6bJZOl4kNKEbECiWblJPOhLMYvWbBu2Q+pa9XuLf1mJkbKe7gKDBIDNMC01GjFHJVGqELfNLxIEHV4FI+24nqXNEzZ0qRP96WClM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFD6LXEw; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d1872504cbso1995927a34.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 07:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774621546; cv=none;
        d=google.com; s=arc-20240605;
        b=IVhoE7EZUdigepKAPKxBTIvZObMCjMn++rfECP4fVqQM2S6HFnjYUudWQEEU8f2jvH
         uhbwi8VKpkInCihqXMf4leeN1QFXz84+rjyfFAY4ZxaHiTVn9BmhvMvsnGbW5p6iWJEi
         uSlipDmFFdPhdd8b9b9ojxAXSewh5s6eZulDBKq5TyQ9QGefv1MMz6git8oNS7/CG8RT
         fMDlI6FkQ2zwXvRETKSxXma/LmJpnMy0IHFY2gNBcdv8vG43k3kH/aoC6qO9pqj63Qrd
         FLxb0St4i5qp10+0UsYsMC+sqjhESjXGhiV/ad8EuhPWcx+n5V0d/CHF/IyFlwo6Hh5L
         xYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4CkbRyLOqwqwWGIOpFw2bUHzgPgIG2tUM7yOxEtSZu8=;
        fh=TvrFz+d8VBxhlqCqbtCgZz7wu4a7FGA+uinoXDzvVbw=;
        b=TaDexVn01YmAfDFPbJwu9dPmRDak1XAe3OSPiFE9BdGk4f2vKIhPzebKE8btXMgpLU
         T5T/e1yflfyx5qCdrq8TvzoV+dk7un0NPXjnYjbTAynT9diRq2077xOqChYPd8TIu4ap
         H5SoBhDQwEO/OzDzmdcrZwHezbYMcs3Le4IlJyQc64nYrNvlOCELABGyBAlzbYr8AdIY
         S85/R7eNwPYMryjqi0Pb2t1C5lwt/VLiEuIFcAebRPIMTMzwj4sQeBZMKqhbl5QCzMlo
         XZlhIVLSe0qhRshfdmCjo2XUZb00ICoFsi1beaHCjX70gcyLl6H4wbqCvUM0RPLHe/tO
         rtFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774621546; x=1775226346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CkbRyLOqwqwWGIOpFw2bUHzgPgIG2tUM7yOxEtSZu8=;
        b=JFD6LXEwFeaqS74S8TP1GUQxztH5YVnEEAuTIsjFlLNMMQwuA5O15nqZyBe4QxpxD4
         r7WvUtsCaSRoVEmGI3HF45D3130Jkcyz7do3O57wiDQY6KrOL2Thvr06ODf4deCdifpq
         gN4K4pjgclY84O2SHOVfSv0zpzNgzgkXxNqc8YyQED21sNSAwKcajP4speg6g583ZRbf
         yewzE4K6ryVsa+YCbQOnsb/y0qug6j6lZLbpQbbDLi989pJBzYRikHcbJSK+AZV4+eo5
         SbsqBCglQJyTRp7r0OsZ1K6m0GYJDIwA/Ik3wfzg8naQQYHw9A/iOPgdRydt1VI3Q1Az
         iqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774621546; x=1775226346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4CkbRyLOqwqwWGIOpFw2bUHzgPgIG2tUM7yOxEtSZu8=;
        b=JUx5zr/gIZ+CsKP77pE0InKYQmhkB9Nlvag5ms5oBP0sUm6B1dUXkRhVPX62zQgCE2
         xW3MAOVtXVIOyKuC6nLNvI+sJsgWFCE6sfaAJF583G4794QJKEV+yqbWKK2j9mRo8EJd
         MwlykC9hP920leTNQUug+5QGNHOv/SmRAgI7/krCYG9SzHpxop3vlwaCdWKB9psA9bQF
         mCg27u+s7BE3Hg50PMCgb9PhgdUYIMx0RLSUWMvwaD6d86M+GkpXUOssnaueOEI0pq3a
         aezm1gwJ75AyWGCNt/cGdlmOANGpShxSoMfNKketZm1T8graz/rGFMr9NLtdIDAC0DXH
         lqnA==
X-Forwarded-Encrypted: i=1; AJvYcCVD6+I4tNlvhJid5i/0++G+YjCnMJ1VBgOfZUedWcAWKWKBrqfhiTMuH3gLG2c7oDKact7MYhKZjKcbmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTBP/YELQp0+OGp7lInkip0i4N5LOXO5wdzCrstR+KI9GLr9Vs
	wCXRM7Wd+AMK9hu3ks2xN5/xjeX1MXkAfK0VuSB0hfd9NRFXUvUFVbztd10KrGNnCn5IstURHjn
	zLit7EKxl0R4vCWkjqgG3wvzHJubMjdo=
X-Gm-Gg: ATEYQzxU1I4yHKVEJj/1kmnyJckozEZfgM4sf3g4sK/nv3Rkx659zw/M9t4XCBAso5L
	8eEvxMSz+QjJBXFq0Y8yjg2VE2+ZAFfinEHY5EbTkjNJ14gFBkduwLBCa5/RuTxccgNrtXizvmB
	+QJgnYgxpESTgE5wg7xQqeBdPT2ipsqKm0ts+3OSlGLM/6TfphkGEndtOM6wJWJLfTD5tS0BeVq
	2MDElKvJPJ+Pg/7nCMLrc70TOlWM2tBQSmOO2fjp6VmHvC7NFs/iMUp2xZHgsTqZqAkvpbBn5fn
	njcmRrcPk81H/eLybw==
X-Received: by 2002:a9d:7dc5:0:b0:7d7:45b7:ed8a with SMTP id
 46e09a7af769-7d9ee135024mr2298331a34.5.1774621546467; Fri, 27 Mar 2026
 07:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317053653.28888-1-mikhail.v.gavrilov@gmail.com>
In-Reply-To: <20260317053653.28888-1-mikhail.v.gavrilov@gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 27 Mar 2026 19:25:33 +0500
X-Gm-Features: AQROBzAfh4NA1agUQwts4_skWqTwNVSjJPXSowustcL8qGk_2W0rk3crVq32Jhw
Message-ID: <CABXGCsOCjQQ65uO3c8DFGx+ErLtn9jSVnktb3MgVdHRfU2pbVw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf/udmabuf: skip redundant cpu sync to fix cacheline
 EEXIST warning
To: kraxel@redhat.com, vivek.kasireddy@intel.com
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57254-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 472183461CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 10:37=E2=80=AFAM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> When CONFIG_DMA_API_DEBUG_SG is enabled, importing a udmabuf into a DRM
> driver (e.g. amdgpu for video playback in GNOME Videos / Showtime)
> triggers a spurious warning:
>
>   DMA-API: amdgpu 0000:03:00.0: cacheline tracking EEXIST, \
>       overlapping mappings aren't supported
>   WARNING: kernel/dma/debug.c:619 at add_dma_entry+0x473/0x5f0
>
> The call chain is:
>
>   amdgpu_cs_ioctl
>    -> amdgpu_ttm_backend_bind
>     -> dma_buf_map_attachment
>      -> [udmabuf] map_udmabuf -> get_sg_table
>       -> dma_map_sgtable(dev, sg, direction, 0)  // attrs=3D0
>        -> debug_dma_map_sg -> add_dma_entry -> EEXIST
>
> This happens because udmabuf builds a per-page scatter-gather list via
> sg_set_folio().  When begin_cpu_udmabuf() has already created an sg
> table mapped for the misc device, and an importer such as amdgpu maps
> the same pages for its own device via map_udmabuf(), the DMA debug
> infrastructure sees two active mappings whose physical addresses share
> cacheline boundaries and warns about the overlap.
>
> The DMA_ATTR_SKIP_CPU_SYNC flag suppresses this check in
> add_dma_entry() because it signals that no CPU cache maintenance is
> performed at map/unmap time, making the cacheline overlap harmless.
>
> All other major dma-buf exporters already pass this flag:
>   - drm_gem_map_dma_buf() passes DMA_ATTR_SKIP_CPU_SYNC
>   - amdgpu_dma_buf_map() passes DMA_ATTR_SKIP_CPU_SYNC
>
> The CPU sync at map/unmap time is also redundant for udmabuf:
> begin_cpu_udmabuf() and end_cpu_udmabuf() already perform explicit
> cache synchronization via dma_sync_sgtable_for_cpu/device() when CPU
> access is requested through the dma-buf interface.
>
> Pass DMA_ATTR_SKIP_CPU_SYNC to dma_map_sgtable() and
> dma_unmap_sgtable() in udmabuf to suppress the spurious warning and
> skip the redundant sync.
>
> Fixes: 284562e1f348 ("udmabuf: implement begin_cpu_access/end_cpu_access =
hooks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> ---
>  drivers/dma-buf/udmabuf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 94b8ecb892bb..9c6f8785a28a 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -162,7 +162,7 @@ static struct sg_table *get_sg_table(struct device *d=
ev, struct dma_buf *buf,
>                 sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
>                              ubuf->offsets[i]);
>
> -       ret =3D dma_map_sgtable(dev, sg, direction, 0);
> +       ret =3D dma_map_sgtable(dev, sg, direction, DMA_ATTR_SKIP_CPU_SYN=
C);
>         if (ret < 0)
>                 goto err_map;
>         return sg;
> @@ -177,7 +177,7 @@ static struct sg_table *get_sg_table(struct device *d=
ev, struct dma_buf *buf,
>  static void put_sg_table(struct device *dev, struct sg_table *sg,
>                          enum dma_data_direction direction)
>  {
> -       dma_unmap_sgtable(dev, sg, direction, 0);
> +       dma_unmap_sgtable(dev, sg, direction, DMA_ATTR_SKIP_CPU_SYNC);
>         sg_free_table(sg);
>         kfree(sg);
>  }
> --
> 2.53.0
>

Gentle ping on this patch.

To summarize the review so far:
  Vivek: "Looks OK to me"
  Christian: Acked-by

Note: while my separate dma-debug patch [1] would also suppress
this specific warning on x86, the udmabuf fix here is still
valuable as it removes the redundant CPU sync at map/unmap time
and aligns udmabuf with other dma-buf exporters that already
pass DMA_ATTR_SKIP_CPU_SYNC.

[1] https://lore.kernel.org/all/20260327124156.24820-1-mikhail.v.gavrilov@g=
mail.com/

Gerd, could you take a look when you have a chance?

--=20
Best Regards,
Mike Gavrilov.

