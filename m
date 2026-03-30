Return-Path: <linux-media+bounces-57679-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAwpG3jJymmL/wUAu9opvQ
	(envelope-from <linux-media+bounces-57679-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 21:05:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD16D360230
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 21:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D617303D2CA
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 19:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6C93DEADF;
	Mon, 30 Mar 2026 19:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XI7rapO2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55483803DD
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 19:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897480; cv=pass; b=NSnt1iCuIgcIkafjNntxgXl2fFStyMMo176EtdSfPGlJSFaoZ1r8x/yQkamHMAupV8M4H1suRdsSRzA7F5z5uxik7fOFrM8jokCGTYDQ5lwOXNOHqfkeoRF9QdfYqpak+IC0jfnHQMubs52dJ80NaXVfCfYNrx1I7A47hcaYin4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897480; c=relaxed/simple;
	bh=4X2EbVAT7EHTVuEIVrm0cYJ8D44Gpf/OKg+Djobjzy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8USxDZ3bPYGLjZlJqrGv5amaMts4+DaZZulguU94p0wj4HQJi8qMrPUz/Kpxvkgts9d0CMH4ckAwjCQTCcZW+eIm4B99dUeP4SK97svkJkKJSBEZpCE58zDbIuAPlzdAnbch+cohGKzwWKu1Qzz08OsAwK5v4PKxDhqSVH5kNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XI7rapO2; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so945106f8f.3
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 12:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774897477; cv=none;
        d=google.com; s=arc-20240605;
        b=G6dIrpkcHxHDGRd3GvmNewvgGL14olYge3IneTXmmmeOrOwlbUhlEWOI20RodrpNS4
         wLxzKNmLF8hoUt7HlyM9ocEfml0ZL/MMvcyCuFpERbus65aCn3T4CLd8HdCNI4vLop2+
         sOCBArMTqWoV1d9D4BozHNaX0YmdRzo0U/sS9CX4kZO+GgBtKvPb52O5/gv0SeLxfnA6
         3YCiUlxFhTy6EIqyPHHQmtboX3v0dMXvAaTvk33oi4I/L7nxavyu4h5FgzDZveRBs8Os
         1i7GWTED7I5g5uThGhPWuQ8jUWAhTbL6e9EVXlQN/QsUh2BX89PxzZXITzCfCPAu7dqs
         OM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kIcuoAut0F4hc99EXY5lY68qKsI/zHcZxryOaERC9kw=;
        fh=AY0CSvu1SfDlWS8nE+3Mghp2tsZYffCU7iYhSiE0pYI=;
        b=OtBcp7ed7khTL4NEsoumkSNgZOFExIdCsUEXE1JXClqiAV+iZX87xZHqjaJ0OWdPju
         v6SVOR7Yk4xw4pX5/xhSJuPtkKNOXk63UwIsXGzRkpDNhvwgn04AvWYp2o3httikERa1
         zIDLh52Oda8wdz0m3sdNVL8C0c5IlWcorP1+/gE2ccmH6Ssg+/srAmwIJerYCN8n2zX3
         B0ZHBJFxw0Rkl6l2bDU23thuY2JCXG2V9Onx+D4piz/N2711ejRWZZNlUyY7xoHlKZeT
         2abUNyVA5ziSyRBNLieguLCOqQSk8MXx0Kos0Kie1TQReGjSYV7FvZLgM+1F7+nJCXGY
         zWKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774897477; x=1775502277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIcuoAut0F4hc99EXY5lY68qKsI/zHcZxryOaERC9kw=;
        b=XI7rapO2ecvSLGpJqDHxNgy980y+Q1s391jnswr2L6x/csF6XYumj0caxnQ4yr5bev
         Rli9ZVWRM90g+d4/7/rJJ6e/PZwlXczxti4/wZhsNSvOC4QSEKOeK9Niw5zisRIHSZ9W
         g+uN100xrN7WFSexe3A01n9/UlT7hSICPpsLqHuJAhWmbFaucPP9X+cy/RpAtF+wB4Rf
         PDt01Oly+cRqQjDSdZ2Gck5gePKu1r+s2q3bkul55/1i/BVhCgYe+ZutwaDCG1EA32OC
         THBF35ko9Y1KaJELsVOUxgUtgUr1Vwy7SPfwLghRi7n4usjmKC9Q/G1t5mh5+J/pbs4X
         KDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774897477; x=1775502277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kIcuoAut0F4hc99EXY5lY68qKsI/zHcZxryOaERC9kw=;
        b=i0CCUYKZcz8Y+HNV2+TARAiPa7aSKnb2Tz7PgHPWEh/5Xale29GSsuM96lMvbn3KH+
         Xs5PPJBPfRSxNriCnTXtuWD5eSYxUTGBVrE+raLd3kLzw7S7RgjcqNHKaOy55d0ozkm2
         7NxI1KpOy3ONDaSm68noKZkUz/00n/Ck6k+Wek60oc8hjwjyhtcngK/rRRF6NmKIF8v6
         pVaHAbCJ/Xw/UC0STzEbMOZVr63L9w0cK+gW0X7DpPni0EOJBEUnUnbLwG5mwztA+4BS
         DtJpAeqwYcfUgOsMzNU5NvwK5JTq7k23x9frvqUjR15hZ3IwztPgP5G0DUDPNGG0uczX
         MGdg==
X-Forwarded-Encrypted: i=1; AJvYcCX5Y1M5vn1HLqzRh8jlzH/TwNaOdOjYKAoXYLe5ap8Ki98Y4+hg5B8lnMiNRx8yvRLbSG/YXcAPiYwYeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+GVA+QS2zixSy643dCfNl+t7ooliT1xVMQKf+cD/FdZ/aPmqq
	+9vzZLdl6nmNXGPhjd+cmEGI27CsINI9EbdzSGkhs1a+k+RHNhkHNwX7+5UwrJabcT9YGt4MnyU
	hgVxT2nChvf3JTNmI7VHCrZg8A0s3/Sw=
X-Gm-Gg: ATEYQzwcxC4MIhVnRnWSrNVml8uwU+aHfa9pzqtO3mtqah5oIxCZexfJR2Rh2LFlfYI
	dKsvSvbhsTUNyyYRf2Z3ffTihOF6CTfog1UvkteDNjBSSwm/rQgvsfkXTIwhy96ok9q3uKglGJA
	cHGeu6b8VFVicVFo0aefrP/iKh089E4RzyYxQdzGyPU7RPkQ+1Lh5/WyLwcpTuccCRwURCU0nx1
	cIVW8Ah2xFSA6ksH7+0i29AM4gtHwCP3N98zRihVn+uFxBJw/juFgpqTXQOzPCbPSDuaShbPevY
	FjpUFv8sMne6EJ9pzo1/2IXTCkg5RDiLcWkSV0Y6J9/ML0M74DGIL+45WujB3aioqHomPg==
X-Received: by 2002:a05:6000:2887:b0:43c:ff58:35d2 with SMTP id
 ffacd0b85a97d-43cff583697mr8817861f8f.2.1774897477006; Mon, 30 Mar 2026
 12:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com> <20260327-b4-cru-rework-v1-5-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-5-3b7d0430f538@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Mar 2026 20:04:11 +0100
X-Gm-Features: AQROBzAooKv3Byp8mfHZWmLsi0JkywShFUsGkTMe4bamTCOX00qjMabfVWFNUeE
Message-ID: <CA+V-a8tYZ0BrSTLPzaVenVKd0JodHbmR9FxF71C9yr=v3dv7bg@mail.gmail.com>
Subject: Re: [PATCH 05/14] media: rzg2l-cru: Remove locking from start/stop routines
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
	TAGGED_FROM(0.00)[bounces-57679-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,renesas.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DD16D360230
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 5:20=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>
> The start/stop streaming routines do not need to lock the whole function
> body against possible concurrent accesses to the CRU buffers or hardware
> registers.
>
> The stop function starts by disabling interrupts, and only this portion
> needs to be protected not to race against a possible IRQ.
>
> Once interrupts are disabled, nothing in the video device driver can race
> and once the peripheral has been disabled we can release all pending
> buffers.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 18 +++++-------=
------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index b041c72837c6..43b1d35fb963 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -341,23 +341,19 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
>  void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>  {
>         unsigned int retries =3D 0;
> -       unsigned long flags;
>         u32 icnms;
>
> -       spin_lock_irqsave(&cru->qlock, flags);
> -
> -       /* Disable and clear the interrupt */
> -       cru->info->disable_interrupts(cru);
> +       scoped_guard(spinlock_irq, &cru->qlock) {
> +               /* Disable and clear the interrupt */
> +               cru->info->disable_interrupts(cru);
> +       }
>
>         /* Stop the operation of image conversion */
>         rzg2l_cru_write(cru, ICnEN, 0);
>
>         /* Wait for streaming to stop */
> -       while ((rzg2l_cru_read(cru, ICnMS) & ICnMS_IA) && retries++ < RZG=
2L_RETRIES) {
> -               spin_unlock_irqrestore(&cru->qlock, flags);
> +       while ((rzg2l_cru_read(cru, ICnMS) & ICnMS_IA) && retries++ < RZG=
2L_RETRIES)
>                 msleep(RZG2L_TIMEOUT_MS);
> -               spin_lock_irqsave(&cru->qlock, flags);
> -       }
>
>         icnms =3D rzg2l_cru_read(cru, ICnMS) & ICnMS_IA;
>         if (icnms)
> @@ -401,8 +397,6 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru=
_dev *cru)
>
>         /* Resets the image processing module */
>         rzg2l_cru_write(cru, CRUnRST, 0);
> -
> -       spin_unlock_irqrestore(&cru->qlock, flags);
>  }
>
>  static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
> @@ -470,8 +464,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru=
_dev *cru)
>         csi_vc =3D ret;
>         cru->svc_channel =3D csi_vc;
>
> -       guard(spinlock_irqsave)(&cru->qlock);
> -
>         /* Select a video input */
>         rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0));
>
>
> --
> 2.53.0
>
>

