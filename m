Return-Path: <linux-media+bounces-56069-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EI+VB7JPuWnj/wEAu9opvQ
	(envelope-from <linux-media+bounces-56069-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:57:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B682AA42E
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEA163061232
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2363C660D;
	Tue, 17 Mar 2026 12:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6uvGTja"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73E43C6615
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752220; cv=pass; b=IvbghUYPqbXOURbhTd4smsp0REIZQrrKcBg5FoyC7gTna5DxEnj+vDauaqUc2TOoOuIvDEjnkUmOlR4Hxinx1xr6tZMNJicrm9HH4YkgiZnY/2jDa/21YIPPHIGH3HkLd5lf94Ibgukx+MbNLscXstCw1F/UCFYn1S9usUYlNSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752220; c=relaxed/simple;
	bh=awlhrkp0SrVgMf1XqyA9CPvamNvNZyPEA1cR8FVn32Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGaujT/+VR9kxJK4icj/HDdrkdIy1509thQFfJegDYwCf8c/8Ghh7fBTzqkhrssf+Naq1V6SFObWh1iuYDUmQPW0WJSNbuOjhXDgscbf8+Yw6KIcH2NuYP6Zoh3i17RqQbanKoyOoc4OPm0J+6lAL3oHQ8AoAogLfPyWmVDYWx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6uvGTja; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ad9238d8fso6548581d50.3
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 05:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773752218; cv=none;
        d=google.com; s=arc-20240605;
        b=R/Amv0O3Mb/hjzpyUmVgR0rS0VkKDzo0uM9MSyQ5DGvF/caRIGLNuQ5ucFvv3CiVWe
         x30+RHqxsk3KTyFqF8vFflwiGHJyigLPm87aizkJ5qIs59HF/8tIjgHIjloltAW/dUmC
         5TMCGg9gUiKl57Isbmk+DLFdpVFdImo6rpzthhyGfvVODuOeTuDh9Mq0zgKwAPU1hS2b
         GWYLzLk0Ir5al/78/Jz/2qIHBkcM2G0XWKmT0Djx9qcomTmGZdEM+tHypo5ZKYNi1Kbm
         LoYIb6PV9vjUiln/X1zFHd6IZISum+aWQfVijQ1sqaM0QSXtcH4Ki/uOjot9zH4BGUuy
         4OQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zE3uvIiNKbN804XtO1rL96lSWC7TkZL3xb249NzIe0w=;
        fh=vmCUwfFRu3cV87BxVt7W2jQEvouv6vH3zvICZkDccs8=;
        b=aRxPiMEXSA28ocG5RI/x0zkLhSyU2oJvz6UN6jSj6IeDyaJHwmKt5p04evqGZ9a4cs
         oRQR6OZn8kJJrPS1qCtlhZ1qPUswKSQZhDIjar2wGtd7iubMbQcOeeLqRL6HUJqjFIMg
         K++Dp/LzaGSze2+aChQaQLMIPPt2IP9ZUTocG5wOcTDImnNOIfP92KbohG/C05ap63U6
         CBYzh+NK99/HdaKXggxKoQ4Qw4vhsntolkWIkCQ4F2dB2ohPkSW+yRc9GlXrcOuUN795
         CK2aOF/LJjDJ8ZUDxYDvawU21cALOCZ4+xbEB/2D7L8/6eBtd9gUALNtiKbRWVvtOoLE
         60+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773752218; x=1774357018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zE3uvIiNKbN804XtO1rL96lSWC7TkZL3xb249NzIe0w=;
        b=d6uvGTjaYiXwagjBXvRkkfHJtwu+PNss8toXpUiX47ZzPpB1r+3RTsVThUDfIV/NEs
         /x/OX5R2TVvwHIAuHYzbNdp9RXGEitw061pMJhxUJr4CFOREcQ8C/oSZwmWBrpsy7pKY
         I7VQiv31H6x4Kdy8gdoUpQHIvaqU3gukeyKBS0TWJ0mhac8tikqO4B3MbnDMGrgwg25+
         vnwb38Rfu2hKx2Ea37JM6/L/MShY/Ojq3kGdYVlOFnxRK+I4bCjo0LNTzn1zQPoOZ6Oc
         WPS4Y6QL4nmDUsJ4hvbQ+k1s9iAlsjIVHCjSesxu7BhMO1h4IbUd5x+7IJBJMhXBwiQ1
         mOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773752218; x=1774357018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zE3uvIiNKbN804XtO1rL96lSWC7TkZL3xb249NzIe0w=;
        b=Om56ESd8wYk3X7pWOEHYUcIkQt64gtSOXEYf7xnUol/vhE1XdTaFklNuf5gHgCUQfC
         Gfym/8OB6OW89xnugOuNPK0MfrJIsEl1Di/fWlhvIn8bnWsyefNttAAcFBMhNgqdyF7s
         82WiKLXU6c6AQaL2unhtZspJAcI6Txy9qmYT8WdVgSgWzJcu1Q7SkC8Lrcn8ryKYfP3W
         YW3G0IEmDOUYi+TL4N5dEd1NfK9y9dsGkRfRUTZ9JTfy3sayBTjoMbwADthtYQS+oZUE
         wZ3AmM2E3eT6mn83HDvZG7f6j3DwwGmSEJ3n/OTD5qKg/liCYWniRoiSvtkADFnEBGz6
         sYwg==
X-Forwarded-Encrypted: i=1; AJvYcCXBKwSsd6O0/69Tav9r1pw3xw49WUcqu5CddxYV5GUpVJr10qR/avwfZ+eYsIw8SjUJZKC7fDZ0+x4t0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEYh8Js9FarCk0tZPawRvC4dwSL4PbWGgfqUUOD8S57iHltTdK
	iH7fvEdn1kdobEG/WNNxi+Q9Su3qHnrepif4C1q12EiXFhnp1H6mlFRIHrxXJ2Dh6kHkc/o5Yal
	HdXSQPU3EgIlOf3i9yBiR4l7u6mAYWhWZ0w==
X-Gm-Gg: ATEYQzxbqInq8r0Wc7rvEvReC2cDocSPOiQ3qjfGzS/1jxCg5x+qVZdUtnCWVmu9m7u
	awn4Cz311dG5OCvQI2Cjs047eLRTbQw3r1ES6RUGNpIBvbmxbPAcfn38/VWMP40jaDi0DEsTdRp
	l1sStHu1DRtwxRsaCgjEWHI3hrL/3e6h7RyWNtcdSmKoeHDnncWgWyBw70LIbAR7Ic12TFxncN9
	u4WS2lu2jkevDXwUhRvCaeDJ/nmB98wF8mROWzsIn01nGqibBMzQPfeMO3G3CXnVm1ZSdokm1Gj
	7VLk
X-Received: by 2002:a53:accd:0:20b0:64c:aa3d:f3c3 with SMTP id
 956f58d0204a3-64e62f689d0mr13398185d50.33.1773752217812; Tue, 17 Mar 2026
 05:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_7DEC784AAFE550A8BA532E65E60491E1D705@qq.com>
In-Reply-To: <tencent_7DEC784AAFE550A8BA532E65E60491E1D705@qq.com>
From: Alexey Klimov <klimov.linux@gmail.com>
Date: Tue, 17 Mar 2026 12:56:46 +0000
X-Gm-Features: AaiRm53fyL8u_nCEp2hUzxK7r_j0DS55p87g354Lbt5IuYmbZGCyhzIvmL6LzDA
Message-ID: <CALW4P+L80+xSnr0QHEihiH784PQ8VycHpBRjC=MVtd4T07vX6w@mail.gmail.com>
Subject: Re: [PATCH] media: radio-mr800: fix memory leak on error path
To: q1ming <1643771613@qq.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56069-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[klimovlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,qq.com:email]
X-Rspamd-Queue-Id: B3B682AA42E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 13, 2026 at 9:30=E2=80=AFAM q1ming <1643771613@qq.com> wrote:
>
> Fix a memory leak in usb_amradio_probe() where the v4l2 control
> handler is not properly cleaned up if control registration fails.
>
> The error handling jumps to err_ctrl instead of err_vdev, skipping
> the cleanup of the v4l2 control handler and leaking memory.
>
> Signed-off-by: qym <1643771613@qq.com>
> ---
>  drivers/media/radio/radio-mr800.c | 2 +-

Please use my email alexey.klimov@linaro.org for this next time.

Best regards,
Alexey

