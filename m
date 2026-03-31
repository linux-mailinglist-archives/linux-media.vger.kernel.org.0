Return-Path: <linux-media+bounces-57742-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMv4BbyDy2l4IgYAu9opvQ
	(envelope-from <linux-media+bounces-57742-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:20:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 637B8365FFF
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 415AC308135C
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0883D88E5;
	Tue, 31 Mar 2026 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEiN6XvG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A673D7D9C
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944743; cv=pass; b=YqrweupNtJqovA0xZWG8weXR5sds4WOEsafQX4BifvrOukEnke0SMlrOJ//VTsWxwmuuctho2Gat6WBnHA00m45VfkyfhRY0kCfaLppP+kZZeyAH++yDJxEUvBjGVCCzIMOwxNsQ5CUdRnMSftcCtGO24dbW8MJXiRHnUs0EnwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944743; c=relaxed/simple;
	bh=0Zl5CWKhPITZPSvP54H54L1AkhKwfVxlmnolCbOPxuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHPt7YnGp6P+d/7G7gUoWi0j8C8MyrUoz2P8QaKe/2Z5/sESjsex0Ee1+3L2i9xBcOBdO/CfRZrpVcxcxJgHYCNpGxcNsJSoDERJJm30LGs8iBCs+INdq/Pf5Kwo+7ULxXvp+sQroxsjNhUts82yoUN4lrBBox3BBIr10EG4A+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEiN6XvG; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso3097701f8f.3
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 01:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774944740; cv=none;
        d=google.com; s=arc-20240605;
        b=h7VtChCklvcVq9u7a5ISYXaiJJrzb6QEhvj+tl/TZ5+FjNnItiQswNKLrKdd/UPIZb
         4pbm1yO+GYFvDU3gQu7oihTuxJPtztSphVKUxwIE2JBNhrEao6R+g/emmNBLS2CWBYO1
         8mFGmK+gFrcQbN2OEgorNlkqPZ4BdFRvCtowR98B99o26mfYZIxpO06I9zlgEZRUg7Nd
         4wYD76FhBT1DtM7ZiZeoGxWyI82w7U2KbJ4fP41ZMVB9F5/bRd2P9dg889EsgaM0Af1V
         5XMUBO5R+5/ZTkNXC0Y+A+8/dI008A+FMhsobsLWC01uS6WclObYxtdWIfKzqaTeT2JX
         8+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5H6e4woLSlNv/I8A+61lkE0sUcjGGP+QYwwxTSSFSJk=;
        fh=Ly2fjsxMpiJ6h9GsZ4veDuVeTiZqFK7IKV31laBx1rM=;
        b=gw2g9v9TJW2qsfBqmJm3VyFXlAPnpxM3LBrLzrww0NHa6twmcSr00JqU0IbT06v26d
         XTUI6HlsNUx4VNhMHlhO1+5Ruac+Dor3fZoJ0tYUmhTYOR+/RuGXmTA2ms2Oc/SXbvPF
         i/jtxCjJ/VjYb3/10jeqlKQ1poFr747+vLVT6UFzkssZlisLM5aq3bTjH3rgYvpZI5dI
         HY752WZmoxy3/kygNqbw8BliG8BBbwOVbLEUhXYzH4XdwWP1GSZwzJ6MLDZ2vsa/LH5c
         LRi9eOoZKbyKE5mnj0elbi3mC/oZq0paQ/VYsvX9/lBKoidgyj10L/Z/PKtWIswrUVFj
         A32Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774944740; x=1775549540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5H6e4woLSlNv/I8A+61lkE0sUcjGGP+QYwwxTSSFSJk=;
        b=HEiN6XvGaEjtUYaYFxzjm3yrWuApPoArctyBYcrHRdXNjFVXoM9PRmuf6g5epQ4lZ8
         XoMoWgbCj1wXcS5JTH6KQLTVh+wvmXuj80MqCwWJhhH274mA0mhDHbtLx9n6SPgOLrf5
         4/XVTSd5xtnRRTTGyCUY+TUDC89lJrDvTGxUydWhhukqAG5sWvxpunoSYf6lJrpwxry6
         NMU1/BGc864WHnL2q9LLUNYpalLoekqLfemEMjBwdHKAfauRjmxeo8JqDqWCuQhGOkf1
         Clhtp6gIl9nmezWar6igGKXnjP81k2m6Yt6IWpALDhm5YHuunzuiHEKy7DR8sko0MYXK
         ALtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774944740; x=1775549540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5H6e4woLSlNv/I8A+61lkE0sUcjGGP+QYwwxTSSFSJk=;
        b=cwvgG1IbMpuqPfFEo5pTAR3barSR4R/5TQt42KW0yi7/+jL1kIBkr7ZVmGkavnxG91
         CZ6H3RJYKKSNuA9shaJL0ut3Z6f24A42EBTQUUgXpTIjMvhgDgjJ5D8643BXcWbAmL+A
         XAAb1PAcouysE7ZON3MaQN/0uIpNmd4v+DbeIE6f3ZbT+ajW51m1qRArRqSk3XFiBXbH
         hbGv4KFpAJ6IwLeYVfDyNz5X7Ggr+x3uzhJym3OL0ajLfpbX9ZYymupiMa6ruKKDrARU
         qCruPnYSazmc9fxgAA1UXee+WQmUqT6IHdGp4TbPdEtEpliLGzrTZKkhE6qwdT6d+UIS
         TCpw==
X-Forwarded-Encrypted: i=1; AJvYcCUEmCwneJd/pHOyXIZVTlrpVXBy5UMwE9WwmE/rXBBi+Ogz571BTX8X7KNKweerVeTapCDT7bLeWLE24Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL6Fbc60pfjCxah7nGp/C+BZ7MHQ2tIXx/VfgPAK34w5bSmQgD
	4tq1arwRKDomF41gayD51LicOFX9R6lV5+ETizQDtQb+PQfgLd4oBk07HEa0qhVGNwYd73ueZ5Q
	qOseEm7AAmBiZsHVpPhCnEaPI1D4Yxig=
X-Gm-Gg: ATEYQzw4w3ZEKoDpkT9kVUe/MxOHiAqFYpU+Q9/9nsDhqbKZi9ThR9YPwis8gm3oy8Q
	QUZDXOKbA5+ertMOTalwkcN9mZDurztSHe4GM3TIFBK9q8Z6KnXa44XjeFVaQyTv8YUbgdh6P34
	P4x/Ppk3LDk72EgNQ8l8SKXGQrnOiLbQ6LrkjX5wfGAFKPnaX+Lr1FQeCMu9xYJOk6Fy7XbomYk
	+NYi4BWhBzi+57rvmTb/0G4Rba6Qe+OXcnQ79Ms/pwVny4dKd/+cNwDnNQSMvgX8eitwMBy9mAr
	4QZHVZaEpRAF8xOb2lheQCMhITwI/2hRTFRLNLMYLxSrQb/eeDBJoAp+TmspCbsokeXHwg==
X-Received: by 2002:a05:6000:4009:b0:43d:30f:122c with SMTP id
 ffacd0b85a97d-43d030f12d4mr8748177f8f.5.1774944740074; Tue, 31 Mar 2026
 01:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com> <20260327-b4-cru-rework-v1-8-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-8-3b7d0430f538@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 31 Mar 2026 09:11:53 +0100
X-Gm-Features: AQROBzAQyDLcCkXvBR1txNY6IDJbXqKx-FUFZVM2Ptxs0XEgBnsBP1VHv5nNVBg
Message-ID: <CA+V-a8tvzYSxqr4Onb4g5v3iX6dxB6pe7oHmq2NRp6+STBM0eA@mail.gmail.com>
Subject: Re: [PATCH 08/14] media: rz2gl-cru: Introduce a spinlock for hw operations
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57742-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 637B8365FFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

Thank you for the patch.

On Fri, Mar 27, 2026 at 5:21=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>
> The CRU driver uses a single spinlock to protect the buffers queue and
> the hardware operations.
>
> This single spinlock is held for the whole duration of the interrupt
> handler, causing all other driver's operations to freeze.
>
> Under heavy system stress conditions with userspace not providing
> buffers fast enough, this causes loss of frames.
>
> Prepare to re-work the driver locking by introducing (but not using yet)
> a new spinlock to protect the hardware registers programming.
>
Is there a specific reason to split this into a separate patch? I
think it's better to squash the patches.

Cheers,
Prabhakar

> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 10 +++++++---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c |  1 +
>  2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drive=
rs/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 3a200db15730..b46696a0012b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -109,7 +109,6 @@ struct rzg2l_cru_info {
>   * @v4l2_dev:          V4L2 device
>   * @num_buf:           Holds the current number of buffers enabled
>   * @svc_channel:       SVC0/1/2/3 to use for RZ/G3E
> - * @buf_addr:          Memory addresses where current video data is writ=
ten.
>   * @notifier:          V4L2 asynchronous subdevs notifier
>   *
>   * @ip:                        Image processing subdev info
> @@ -118,6 +117,10 @@ struct rzg2l_cru_info {
>   * @mdev_lock:         protects the count, notifier and csi members
>   * @pad:               media pad for the video device entity
>   *
> + * @hw_lock:           protects the slot counter, hardware programming o=
f
> + *                     slot addresses and the @buf_addr[] list
> + * @buf_addr:          Memory addresses where current video data is writ=
ten
> + *
>   * @lock:              protects @queue
>   * @queue:             vb2 buffers queue
>   * @scratch:           cpu address for scratch buffer
> @@ -147,8 +150,6 @@ struct rzg2l_cru_dev {
>         u8 num_buf;
>
>         u8 svc_channel;
> -       dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
> -
>         struct v4l2_async_notifier notifier;
>
>         struct rzg2l_cru_ip ip;
> @@ -157,6 +158,9 @@ struct rzg2l_cru_dev {
>         struct mutex mdev_lock;
>         struct media_pad pad;
>
> +       spinlock_t hw_lock;
> +       dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
> +
>         struct mutex lock;
>         struct vb2_queue queue;
>         void *scratch;
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 27079c17a54c..a79b17e146bf 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -844,6 +844,7 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
>         mutex_init(&cru->lock);
>         INIT_LIST_HEAD(&cru->buf_list);
>
> +       spin_lock_init(&cru->hw_lock);
>         spin_lock_init(&cru->qlock);
>
>         cru->state =3D RZG2L_CRU_DMA_STOPPED;
>
> --
> 2.53.0
>
>

