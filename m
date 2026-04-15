Return-Path: <linux-media+bounces-58841-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDDmD9H/32kjbgAAu9opvQ
	(envelope-from <linux-media+bounces-58841-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 23:14:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C04081CA
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 23:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00D3530E11ED
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 21:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAC838C438;
	Wed, 15 Apr 2026 21:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnerOfzH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5CD381B0E
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 21:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776287301; cv=pass; b=bl79pzPSfofdMwf13TObOzdYpRkr1r6AmZUmrdL2/4607hmBAeKG7+YckoUJR2tILMwaE5loL5Ydt1Q6o/bzcDBbl1A5CBem1ul3I2o16IasDj+GozaKyK345NpWDrUZDT5G4VjveTat75t2fGKAvkaj2u4xadR3CyfF0rYLLOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776287301; c=relaxed/simple;
	bh=+Us3tBybRJCBSTTW1YdnB3bEFJzwgnVfjj/pboxdz1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRYBnP0p6mUyuBhOcBBFgYFdXtAPJLusgBvkLVbfIa8+5mhXXT1D9adVwwpD8cHg2pEktsyOzplxSNwiNcmJabJ1yu3/nKTpDjmOdMQrIuYzuDwrXmmk0Z2Qb//852s3VFrz/s52t0EJYGCfPmnPH4iS5tXOHgXCIHE8FR6NOEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnerOfzH; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66f8f556f39so9800824a12.0
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 14:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776287298; cv=none;
        d=google.com; s=arc-20240605;
        b=Y56HazOGUAOuymxebXdwwDrt0i0xkCV1jMOAmdbFyNPeW5ssFjz5cBDEQeElz0PqQ5
         KmE+257UkwQ/HQ1CZXmPcdIS3ZA6ghSoaG7m0i3eY1335Sz6yKocxjO3eO4teTEtz4U0
         7b6lIKvcjAN/aE9hBswe5jD+3280b294a5AhMBjZWbJGaT9KN6HQiwizl+YH86ElUF9M
         lMWNcAI2fnCHeCdJx9eqpRVH1bfLjzTyHgGqyVaxxJcolk4EG+Mscu5GToKmqfAtQV4w
         c7QIAXnHT4dtc9IUHw8ZgHLB4UF1KPiHa0cYkbw4Ic9O4i9AshjULx/dQuhZ9mD7OYs1
         Opfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a1nJcRPJxVSw2cTzOcFRmVrJ+zex5AshjrHhOcuSWaU=;
        fh=QVBo8TH1e4f8F+dJwPTh2sQwb59cY3IIuAnqy1kM2MQ=;
        b=jpuohqkuDxzo0i+wByG2eTtoeFG18vJDwokODgJdk0CML0U6Cr4MXiI73CmhLIpOcw
         nimhovQGcxcuwBltwYIiwKmJrEqNIo2ufivN0lDO6jPhvmJ7IQLHLmFanenGzoEaSaj+
         zb8giVMZ9Bu50Umni4ekzZx6naB4F2llEJ3UWF3u/nlDFjMVIV3UufRzTQVQbAGfto1X
         CDM/uhzla/eAUANxlMJds8CtSYSEDW6GOn1Zb1jRkTgm2PcAt0hNxZhEEqARc5k+Dnwv
         vF3PoIVwZzSd9cM9aOmwY1fD3/Cxu3CgVku1PzZsXEqOlDupaaXRXsgt7NSZrOQVDi1b
         0wJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776287298; x=1776892098; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a1nJcRPJxVSw2cTzOcFRmVrJ+zex5AshjrHhOcuSWaU=;
        b=WnerOfzHLraUBz61ldp6yvvvg69DWaz0+kjTKWnnooUQ0tdOAQJyRo1q+6Nt/uLT79
         YsbjEowPkErIVgd/C52ke6L77V9yZd7LmaQZWrMKG7IgerRRZsUhIQu+uJgaOtC2SZpd
         A1wDt9UnkI4vNiEibYWb5ggdnNMmG6BsFLpdhHjIxSstzmnsrxboE+r+TcZn7M9WJCvP
         FhX0IrwCFP6e33WCWoWhMyVayaFIgEjFwRhMsM5HqMarXtvJfAWMAUwuXUS5MpsYJTYI
         iLggA4COhWhh3P7EuzvynndJj2okWY3ysXr2HzNftL2NCiQebFPKyRltnnNmRGSGvgAe
         EmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776287298; x=1776892098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1nJcRPJxVSw2cTzOcFRmVrJ+zex5AshjrHhOcuSWaU=;
        b=ilbDQ4m6fOfOJkjX27FSvlNePCKoI9O71FlvnNvMB15xnYQXfAjAf5NbsdjXrnHK+j
         2uKRgUqx86RsUBhTd2PcIDs4z6lX3jf9n+H7Y6YfjedcbzqsQ+T3dmhJpfql/i/w3xPU
         7SSnOY5k17pAPgCKCMPqyavHg5qezgwDs7n2qznUQQbb3/uM6h5rPWwzoWHpMP1TLPbs
         E04KtTNDZAHnvidQbH9jwQ1UzkZrMY2bWNVhYbmXNd1Q09SWSY/c1U8zNkl3pfR0i4VG
         P+ZlD2xEm84FqK90AMWkorGl7WchSaIWFHfCIdYP+BEaOLSNHxMQiceQGdgXAOrmcuTg
         bB2A==
X-Forwarded-Encrypted: i=1; AFNElJ+M/PTDwQbBPNvuI3yZnkWeeVOWEucvhZD3nM1rOMuvWAcF2GboDoMhLWxgYO2oIoCL/HXdld4We99Kow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2sXlbp00e6DzltJdKaKovNsbMhVnTe2xwIBw2H8FesOZTUDeX
	HaNG9NwniLv1h1XfpkD4eZDuAvVFYysVXmkBx8bkWT3xGEaX6170f7kKOqulfKcuktvsh9F4S2c
	24mO/yB2gRjFsoiu2P4oHDtbAAao3DIE=
X-Gm-Gg: AeBDievweccjngPCljXe7wswqu4g3U8PfanK3a13FtaTv1OUjWrZUE2oEsCXmprNEAd
	kczC3N2Oik+CkwcI9Jz6V9EM2gtUQI0ajFGGaCcSPx5nfkewI8Gw7x8r32Pijm5DA6JwIQb+pNi
	Ij1BBYWxeiHAJVvhdDn3/vlWtfTQaC9LQV0A4kjNwVzga7r2i7xb+2+FgdsQp0Vbz/dtuEC+D9p
	+UxvOZm+NFjG0rp7CYSG9QlE/9KyIATbxRTjFHENgHCqXxdlkm8Dh5LKShhfNJZWhKFZTy9RPtB
	BJLJr9KsuHIF3e4QdWI=
X-Received: by 2002:a05:6402:e07:b0:671:dffb:f450 with SMTP id
 4fb4d7f45d1cf-671dffbf4b3mr4708035a12.11.1776287297992; Wed, 15 Apr 2026
 14:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403002319.12771-1-dbgh9129@gmail.com> <ad-7dDQTF46ijzzb@stanley.mountain>
In-Reply-To: <ad-7dDQTF46ijzzb@stanley.mountain>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Wed, 15 Apr 2026 17:08:06 -0400
X-Gm-Features: AQROBzB8H4edPDD2ryNrleiuTEUaEEZHy0ALn58VPs1GIR7_e92vCm0Nn_kjsVM
Message-ID: <CACrCO_VeStLMOZdkyg+ybPLhUV=J5ZmKtSpb39vE0vjtkC6kBw@mail.gmail.com>
Subject: Re: [PATCH v4] media: atomisp: gc2235: fix UAF and memory leak
To: Dan Carpenter <error27@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Kees Cook <kees@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Thomas Andreatta <thomas.andreatta2000@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Kim, Taegyu" <tmk5904@psu.edu>
Content-Type: text/plain; charset="UTF-8"
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
	TAGGED_FROM(0.00)[bounces-58841-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,infradead.org,gmail.com,vger.kernel.org,lists.linux.dev,psu.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dbgh9129@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C25C04081CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear Dan,

Thanks for the review. I do appreciate the LGTM.

Best regards,
Yuho Choi

On Wed, 15 Apr 2026 at 12:23, Dan Carpenter <error27@gmail.com> wrote:
>
> On Thu, Apr 02, 2026 at 08:23:19PM -0400, Yuho Choi wrote:
> > gc2235_probe() handles its error paths incorrectly.
> >
> > If media_entity_pads_init() fails, gc2235_remove() is called, which
> > tears down the subdev and frees dev, but then still falls through to
> > atomisp_register_i2c_module(). This results in use-after-free.
> >
> > If atomisp_register_i2c_module() fails, the media entity and control
> > handler are left initialized and dev is leaked.
> >
> > gc2235_remove() unconditionally calls media_entity_cleanup() and
> > v4l2_ctrl_handler_free(), but these are not initialized at every
> > error path in gc2235_probe().
> >
> > Replace gc2235_remove() calls in the probe error paths with explicit
> > unwind labels that free only the resources initialized at each point
> > of failure, in reverse order of initialization.
> >
> > Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> > Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> > ---
>
> Thanks.  LGTM!
>
> Reviewed-by: Dan Carpenter <error27@gmail.com>
>
> regards,
> dan carpenter
>

