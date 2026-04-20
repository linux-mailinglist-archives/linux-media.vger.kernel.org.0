Return-Path: <linux-media+bounces-59122-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFpdIMPY5WnWoQEAu9opvQ
	(envelope-from <linux-media+bounces-59122-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 09:41:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9D0427D4A
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 09:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F351300E270
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 07:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AEC2FCBF5;
	Mon, 20 Apr 2026 07:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L4vrZps9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7AB37E309
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 07:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670745; cv=pass; b=ixFwz0oF5AsJ9aSVlqBRpbZTTFYVG8jum0bTfcVJopr5Q3TKYiiTHk1/X95P8ebP1TJcXNWV8MC5JwkSMgoXuoi3pY+S9Q+09GTyAh2mNVTpKCvV619n2YYtIre1Q/UBFM08p/dNxipUTXMrSWeO9x8OwxPqU8It7Yi0ouATnaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670745; c=relaxed/simple;
	bh=Y6SaI5/j4+Ufg5rzhBx6PvjnNi5tIO6L4mbRl8+/keE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNg6gD/mWwQJbrGwfkCNWsBNYOaX1bAY6D2QKRKAKZ2zyR5zN46jYLK1+oKcqeTeWpxxVg8fxEcPiQZnyewnjbMo6YTVaac2bfXXdQRHFSBoXn3GY/m5Zq74KfHNxVg8rfuph1Vw6BUQg3eXTecXx/dIHgjUbl38bITX2fZ9COg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L4vrZps9; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38df1889fb9so25734571fa.1
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 00:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776670742; cv=none;
        d=google.com; s=arc-20240605;
        b=lb/ce601IJRcF7FDjdLM4lXQIjUzfAJDVQIMZl83xQP998uxn22go0aNRB0yTTr48v
         qhYP/oeZqbzOrIENraxdvLJ0IHsLmMctLeIFqIWuktxUpUKmH3PGd2vRmFcUBp8/6832
         uue9O7OVC1am+IZ0OtgxAzwhREWCnKnIslGi4C2JqRTFyMPOsQ80e52m22g98Pdpqa5b
         c26fewzgxiKSig33fp2oDmuczxGcoR2Hj0xCztl3eI0hRc0dydPe49Yr2kwSdg3HShay
         E3NxwazHmc67QC735HVq0mPB5lvC/9LKwc1zWbqjw2FGhDgK2L8vAWD7eXisIRcmzbXc
         GDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zKEgJOPy9NW9AOWN8wHVDlaVtMzqG521cwuziW4vs0A=;
        fh=JTF+RdIEqN+7xi7lAmPoj2byuI0m+NiTmH1BVINZ0S0=;
        b=NuE5Jt5Sunb1fN3Hdf4ObPRENHc0+DRIUAVOG/Kzgje8BaQKZly+IdPDUljIXfwSBM
         cQodrvUctK1WafE1U5D/YIU3lQdrIFcCdHge0wDYU7GamufrrCtja62hh5LyvPLA/myH
         M1WqnOx7TJ7QWJ3EEZqKH6BXd4eYGSx8meG2AbyeWjwoGhtpp9KXWbdR9n/aQxmasZul
         1KAr7lsPbq2BMPQhQqQ8x5snK5pnaMYUjlM3b+pKmLBSTdN96sC87jr2ci2bXvd1YIK8
         goPFlJoiHKxt7z5KQsyCFc++x5TCzjvEL9w0uLQsvpm3hMXrAMK2vmenDCVDUANl+ReA
         M9Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776670742; x=1777275542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKEgJOPy9NW9AOWN8wHVDlaVtMzqG521cwuziW4vs0A=;
        b=L4vrZps9l9ipyeIGq8JLCpA/uPakwLFCf5V3dCuserf09J1uJfv49SXaI5QoR7HHeY
         QFULWznQGqWva/m+w8cXvBzzgherdh3zmoTQGucWpVhkgWVQtZkRf57h/Zw+gN3AObUv
         DnjWm3zKAtDwBjD9n3PcItJfFIEjnFfHWCHh6ooMnJ2MRfkOxi03xzQ1Pw60nOIsra3B
         ZHZehfpXUaQnLU+R35qltrYZAxmAy4Hm8dwRZQKnMoQ0LdK08fy14LC8/tjqu1rSOLPN
         o1jf9K2q9afkY68yx/Qj36M+JmcqFboqNTNsvo0e4F2Zci/NswCVpSoibmNMk6BeJVPn
         uXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670742; x=1777275542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zKEgJOPy9NW9AOWN8wHVDlaVtMzqG521cwuziW4vs0A=;
        b=MzR7O575ma+gsVM8Z/GL/WLPf/y/jNU3OHQLLhw1cZDhbFhFjgIQAC4E4cYnvvZMcF
         Leymm5xhOAEQAOFrgPYBbQyvmCFUqwUeSWVy4tyzJN0oWW6v7z65gZnmeZfFYNN+Fh8/
         VuilFbR24Wg+7DLDOC2oRjx96S6C/pHdNfE+maWWRxbQhlilm7OBFh8vpmN5RCrYo2Wu
         t3TJ9LFG0C47Gi2XXLu9xd4/abzWkRaURPktmCMzYcbqCgCXPFh3069IvGYHbZyxGpaZ
         FmnJ14ds9jNMEDFJWfsu8LOwX1Rf70seqEdCz6zUw53VzVtme3H+vLIO9QEbebfYzgMQ
         bpGg==
X-Forwarded-Encrypted: i=1; AFNElJ8m6cZf2wRJDcmk84WM+J3Em5dubBdTsCRc1kNhwq20IDvGEWqyJyiFxYo1lmktrhrAp7mjEIgLuwfYuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0hXFwH4xMM6Ui+luLqmDUZJhDBKOD2jOYM9C9+T8i6LaIWyhc
	Ispc+qNSLbdnMlSOiAt+Of+MkG+a8v2r3A6VVSjmVj+12Sl7ScjhTZOhhLHuBZrRNH/i363CTHP
	6ykHL7ahORxe5XJkCxN66/rPiTitWKHlH9jtaGvST
X-Gm-Gg: AeBDiesJ18dFiKqJWf5qDPvr/ToenKGdWNNKTAFTDjzAiDWV0b09farrEls6TygiB3N
	HymUcZab8Chw8L24fO8Pfk8fgKWIEnXA/xA5VdGbubXTd+eUoMUA1Ktq2V1OqF/wtxIH90BzF+T
	ldQtftQM9lQisMqy8J6dHFPp1DVE9OkZdemk5/IqlbCIRZEqt3Ul0gYm7u9KPB38JvfN3a991kp
	iJFcddWUSdykMyBx5M2561FRFrufuNhpPYMxl747SnQThZGXksikhlj8tp+29TuZXOdt+QtUdMr
	Qp8yJmUtp628S0I6Mw5gHkZQPcdgO9DaXg3h5HEFPn5w+UFs7GFu4o8xo7zZplyhxl6HNw==
X-Received: by 2002:a2e:ae08:0:b0:389:fbe6:3321 with SMTP id
 38308e7fff4ca-38ec7b99984mr29889291fa.33.1776670741419; Mon, 20 Apr 2026
 00:39:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
In-Reply-To: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
From: Yunke Cao <yunkec@google.com>
Date: Mon, 20 Apr 2026 15:38:49 +0800
X-Gm-Features: AQROBzAlapTXffBH_3Vrs0aqJdVPiVmm2hr8avyAcZulKyL5RhYlAQonTJX8rRE
Message-ID: <CANqU6FckNvLSDj9S9Oc_NGmP80YCe5P46f5oQ9mahWvxqikxNw@mail.gmail.com>
Subject: Re: [PATCH 0/4] media: uvcvideo: Fixes for hw timestamping
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59122-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yunkec@google.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BC9D0427D4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

I tested the series on a SunplusIT Inc 1080p FHD Camera (2b7e:c877).
Without this series, hardware timestamping was broken (due to the
issue fixed by [PATCH 2/4] of this series).
With this series, hardware timestamping works as intended.

Tested-by: Yunke Cao <yunkec@google.com>

Best,
Yunke


On Mon, Mar 23, 2026 at 9:10=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> This series introduces fixes for the hardware timestamp calculations.
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Ricardo Ribalda (4):
>       media: uvcvideo: Fix dev_sof filtering in hw timestamp
>       media: uvcvideo: Use hw timestaming if the clock buffer is full
>       media: uvcvideo: Relax the constrains for interpolating the hw cloc=
k
>       media: uvcvideo: Do not add clock samples with small sof delta
>
>  drivers/media/usb/uvc/uvc_video.c | 51 +++++++++++++++++++++++++++------=
------
>  1 file changed, 35 insertions(+), 16 deletions(-)
> ---
> base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
> change-id: 20260309-uvc-hwtimestamp-f25dc27f5711
>
> Best regards,
> --
> Ricardo Ribalda <ribalda@chromium.org>
>

