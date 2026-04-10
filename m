Return-Path: <linux-media+bounces-58557-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAH0KTgE2WnolAgAu9opvQ
	(envelope-from <linux-media+bounces-58557-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 16:07:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8993D876F
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 16:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 669C9302C5D8
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 14:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765863CF052;
	Fri, 10 Apr 2026 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yi0Vhu8F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A89C3CEBB1
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 14:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830033; cv=pass; b=MSZsxPRgr/XnCKyn6nIZtTisykEM602BZWijg/Zk5kVThRoQU8/zASuKjThDbVUjd7jMmPJ0NB9t02MC9c39hHbCQKyJs9af/o0Z+kGkg0x/pzn8qYRaATs81az/rNSc29RUJg1A9v+KKV83VW5H+ANH0M7gTGDIeK7YEwy0D1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830033; c=relaxed/simple;
	bh=dRT7zI4qHGGTquKymQxL752qgzu5UAKGXRlHaGNYAGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAsPoGKKrNGnJldfknFpgiZWY+wAP81QwnjCznw/lxPIaAEXGZUJJPRYBhtsuelBSpwfYgM+Oijlm7yRY97Ac7pl8V1NZbgp8AlcEXu62dXFwQqULBakEGD0ERCSGKmEFtsqeChhg0A6Lq2hLi5CKS5j5DU4RH0UUS/RL+NTWbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yi0Vhu8F; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9c280322e0so253368166b.0
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 07:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775830030; cv=none;
        d=google.com; s=arc-20240605;
        b=i4ZWZxx2Z8DI6w0FbK9N064SsB9omgwiJebPkMF+T0jd+ukmdfelh95yGBvzqYFh3D
         2ThoHdvcBx9tNocKXnbq0JUbeCnp+w7h9TuGGF0eTo1e1Vec2iyew2VE2T1cZq41hTtw
         qB3WQmWZtdVxQCZbi+Va6/lPcpHrBLRXXKSJ0cxvEQeON+Pg7Q0zhYDd7VfSiBXvHTNV
         PD5Mw4JS5V7xcT9QzfHZ27+0BF9P2U+nq5ss2hg5bBdZCca1XoewFbEjmIJQyw4j6SLn
         y5SO5324xuhF45CP7N4x7DiusupwOhzh3nbVxlfystCBxLstRc6T3NaChHk5XoHOjbqE
         /BOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J7QztuYj2+YPxHFsqeBj8RkIsj0A+J82n8lSDLxBNak=;
        fh=skpmLLC0CmYQNs3TMU/qjNxWHdTVXZS5HndvgJdXfDQ=;
        b=Ap1DsdptOESfS6bOTUYDLSDg+HFCC4Jf5no3GgjSDVozkmFsskhUIvlDaWAxkBtaDA
         tYBL3tVwJfb58kH+voM5jdzjcQoxkj8JuhLhEUhxxSB95yQnp/MgALL7muqqzVg01WYW
         dr9B2EvKiu+kQe7NR5Tr3FvjSphd2/Q6f+EummTHn/1v4vnlJgmCZ2AneYBF/KePTeQi
         BZbpdGo4KT1JZy/5WSYYM6jQmg1B7gM14XRT/qcJcAKIae5oYUxQy+4C7WMlofg8kD3z
         TzxwIPTUHnqNbyrKaOqJ/ct4VpVxQTy5RAfsEetxZ+JtT/9fZHOJDuhq48QX3e240eUw
         djWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775830030; x=1776434830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7QztuYj2+YPxHFsqeBj8RkIsj0A+J82n8lSDLxBNak=;
        b=Yi0Vhu8Fo1XfWAt8d4J8lN0pGTqDuwWyJ+K+/veDohzPsZWBHQembXYeBf1KCxjw3m
         k72e3Oq0XQ8YkOvfmAZBXYXfZPbIojqNvGV/712vfuDWbyyrAnW9NaJJfiD4I6EmX569
         t4j2og3yWUyqJMvFtr2io/hacUrH+d3m6DNxYRjAvrnpKSyv/hNC64WTlsIyylla+V3l
         RtnAq1IV/xYvwCSSx2Hcg/0YPpeln8nU4v+FqsbPRF7LqyxenmudY5kkp8KIfYw2eAKt
         Xl3XHcO248AtDfKUWxj2MWOHM2Bb0cmuOjNdaQ8PGgRxETqMMfTT+jSNVKQ+z6QC5whg
         yuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775830030; x=1776434830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J7QztuYj2+YPxHFsqeBj8RkIsj0A+J82n8lSDLxBNak=;
        b=ZeXgVmT4iQtbWEsj4D0qeioDlqdhXI31pef2au9s3tB0V7uvWmF8Gm91b+WnVN+L4I
         whew6/jwe5SC7H13r+6MlpdPssQbhdJUMtxjXm+yBpxAMchOyy0XVuDlcD6n/N+QzjWy
         ptBlmbLEHnCvi84fNIMec1QYojCMpEXVKPcsKXvpxKId52GRMQu7lqqAAFjzIfmkh9mx
         jNdo1CkgCFgrfMDcm5GYhZ3DzOoSmyPIgTKH/2YGjDVBEp4LUEG8cA3nK8feenCDQjPu
         5taJfbe9zd0dzmbju6Z/6BixhQMas02YgLLP7DazGsrWdZOTNu0QNir1wiYqB4HEbWk/
         8Cyg==
X-Forwarded-Encrypted: i=1; AJvYcCXUiJzC/wxHM3p4zuc0J73e8Wrg+8pDVyQRCoW/Ui578hpP6le5bf8LGQ8dXmFHUi8GRVCSEnxpMfQb2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp7Lv4PFweE/6lIZx0YMv5zYJOd/0bFMYkcBSdX2iI2uEn5bZ8
	Uv1kh/5UQS78t0gpgYpVBwdmHcgByqMImtkYApJCNMuOTROfrDGNugjnaVks8pWbh6w3aU5HsaI
	gOVtl7GdHaQs3E+XCszi7sS5xw/uVqWBFQvHOZ1C7kg==
X-Gm-Gg: AeBDiesDoAr6pcHzDQDCAcavKg66W/vQbzxKEYagRJqqqma6xnnV7kYwEUYP5lrQi+6
	GqoxSrSnkBpoF7OBB23aZsGavAzwUg4KvXe49kIOjwZoQHBod2AMrxs0bFeBPW/ThhrXSJuyfWr
	fuDW5x2BSe9s8Clct2zd+0ynrixFs20+AFPlLfDDHuOK+YVwxTgVnDUm4nEbeHiDh7/++WkWOmj
	smd3ba7uHrV2zUwbNMgoV3qjbZl5ddRFypl9SpMTPvlqdyORacmPuExYaytrw1v+6beFBXdw4uO
	JI8pjStmSqYJMZFHxqM4sX0se05YdO4mn5d+o6E=
X-Received: by 2002:a17:907:26ce:b0:b9b:7f2d:923d with SMTP id
 a640c23a62f3a-b9d72661536mr207795366b.27.1775830030380; Fri, 10 Apr 2026
 07:07:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410123703.937822-1-sumit.semwal@linaro.org> <c427afeb-15eb-4a46-aa6c-fe24631d24ae@amd.com>
In-Reply-To: <c427afeb-15eb-4a46-aa6c-fe24631d24ae@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 10 Apr 2026 19:36:59 +0530
X-Gm-Features: AQROBzDTpEfzR4ryK5YAY1RA4qEovpocT3VJx89MYLkdYmV0Mtz-BnQUmSjc1y0
Message-ID: <CAO_48GHyBz-CEap=icQDKqVsBgCy+DNazd6ANzf0NucE5yc1cg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix htmldocs error for dma_buf_attach_revocable
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: leon@kernel.org, broonie@kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-58557-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Queue-Id: 5A8993D876F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Christian,

On Fri, 10 Apr 2026 at 18:14, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 4/10/26 14:37, Sumit Semwal wrote:
> > linux-next testing showed this htmldoc error due to a missing extra
> > line in the comments; add it.
> >
> > Fixes: be6d4c9e9d714 ("dma-buf: Add dma_buf_attach_revocable()")
> > Reported-by: Mark Brown <broonie@kernel.org>
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Thank you; pushed to drm-misc-next-fixes!

Best,
Sumit
>
> > ---
> >  drivers/dma-buf/dma-buf.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index a202a308c079..532c3f14bf9d 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1353,6 +1353,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_attach_revocable, "D=
MA_BUF");
> >   * Upon return importers may continue to access the DMA-buf memory. Th=
e caller
> >   * must do two additional waits to ensure that the memory is no longer=
 being
> >   * accessed:
> > + *
> >   *  1) Until dma_resv_wait_timeout() retires fences the importer is al=
lowed to
> >   *     fully access the memory.
> >   *  2) Until the importer calls unmap it is allowed to speculatively
>

