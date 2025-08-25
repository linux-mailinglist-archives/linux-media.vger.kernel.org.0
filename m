Return-Path: <linux-media+bounces-41011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B858B33F64
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 14:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F20E4168547
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1FD244662;
	Mon, 25 Aug 2025 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWRxKs94"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642ED15C158
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 12:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756124923; cv=none; b=rJzYU41GQoJESFW2G6UaRnv5f9zSDhO+e+t5HVt+Jze+Wgt8giv05D5+rICaIPehAdWtRsIrTKkHo1+DIrjh+FuIj0ZibLEkBDpZJV13SChg9HxNtroVRfSZZ+FJ4EZV/9qKT0C7VNOrLDSVaiLYKFqzai6dDzLpjax45+KZkL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756124923; c=relaxed/simple;
	bh=4Lk7NoEo7FPFpb4K/8g11ONHGWOBy/M5/m86pO9dRsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIMMKXGUZ2HIX5TO+8xucyZRhTuiikm7onfL4Yy5aYaE3a6k1RFzyrfew/zWr8DQHiNX2p9sgJSQv76S4pjTu7CGh6/wQhLbyKfDs6VNneVxzi1ocPPo10CqD1/KDYPM4g8qCXq5AQn8Mfo5BSPA20X27yO9hQUlz14sNa/GPWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWRxKs94; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb731ca8eso680824666b.0
        for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 05:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756124920; x=1756729720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Lk7NoEo7FPFpb4K/8g11ONHGWOBy/M5/m86pO9dRsU=;
        b=FWRxKs945cSXITZpzmAVd7qkvwHZrjNf5c5AanFmzO4SRl958j6h1g3XrDdQ/ROX6C
         lm+Utwp5sqI2SQOlxv+NbLFLGQQkBGuVCn4v79yqNgYFcPIET6X1jDocBsuMUDmOpdub
         zfuEtQGzQWE2Yj+gskMeParzqRQ5oOV56uecDsqb6Eo4yLWz6lr1WOLn1TRrZRgqG1yE
         VmyANVjsMeWgoquDkIl8BoM/tOFGHq9Uix+0gd3x+qZzOXvOD6EsET7uZWMOUXg3hiWi
         ZDVcnoiFG7Cx2wOQnXyJSZwuEV+hQp+GJt23jXrF9KjFE4uNQpBMetyYGm79NyJ2FCVj
         W5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756124920; x=1756729720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Lk7NoEo7FPFpb4K/8g11ONHGWOBy/M5/m86pO9dRsU=;
        b=gUKgkFeezeCFxxx2e31uZblr9qWu87ZjE+rNf4OHV4DTau8m3YTed3fClZz3IiuKSI
         HdncSM/oy5x2Wvm/z3UvS5htMKiKdbo76Wy5R1lvs9STVGIj1w7rq060KutoCaeXEhH0
         MvgIMFuvWuPDC9ZdQ+sHwgb/vSIpQzGSDIy6LQl10cWn/Ih8hPr2axvpP+aeALGIA97s
         bMkxxbvJRXV81vScvo+b/zT6BSqUQaEhJIV7Ntlw8vVz5syOobCrro4H2gHpnoYge0gC
         xLUA+7B7EEFN+rYcos0x/D2TA+aDg1er2+XOXtGndQcFclzMfe2MdCBrRNzA3N6v+k8c
         pFAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCDRN3w0kv/Dhmf1A3+jOFSozPzT+5dQzhhcQVFpZGKs7KZSJKK787fEDGEEeEqsGAMg37Sqk2Q+DtpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwttUmLWefTpG/jtoyLJHvNfNJ+ezmNKTBmvr3XDe9bj7NnNiP8
	ct0kxr/HXRxliQncOZU9VQ76TAyXABtAcdDkXopcrrTsMNgs8kkhR2M8rQWHieAvvp+jtWaQWVu
	vBukZtzxBCQPXQ6YYk9WNHuNcTLhnGGc=
X-Gm-Gg: ASbGncu2J9sGiNrPfQRPpDmeWc2KrDqTKzlVR8kokBDsL1aCiwH9vSqPQ8H9WtNYZxY
	P8ZauhjDL1rtMHHSDtgY9dFIfC4y7Qa1ES8O9Q5uTv7AGxeV9M1oAXdMTeM8jCp2ORoECwdSZ51
	ioEkGfLoAPhLzeepZEbTBLrXvHssHdmjnfIFHbORX31Kn78THPz3ZRCc90kwMmbUY+6sq3P4KhN
	/H6OOboyQ==
X-Google-Smtp-Source: AGHT+IERnL55xCKZRXy1X8l4fOupr66TO4qOx1FUypqB9hww5LZNEmyNeZy2VYLMnVLvQkoSA2f8e77OAuUIJKypfkk=
X-Received: by 2002:a17:907:1c1a:b0:ae0:da2f:dcf3 with SMTP id
 a640c23a62f3a-afe29615646mr971179866b.59.1756124919511; Mon, 25 Aug 2025
 05:28:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825101515.953993-1-chelsyratnawat2001@gmail.com>
In-Reply-To: <20250825101515.953993-1-chelsyratnawat2001@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Aug 2025 15:28:03 +0300
X-Gm-Features: Ac12FXwDuMLoSewvb7LjGv4A-zke8mMbHcj5k5vh_asaK9ynJpHY2pt33pTiH-Y
Message-ID: <CAHp75VfRFjC+zmp8VcaGQgmjzRdV=XP-ULM629MuxcS=RhQwFw@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: Use string choices helpers
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Cc: andy@kernel.org, hansg@kernel.or, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 1:15=E2=80=AFPM Chelsy Ratnawat
<chelsyratnawat2001@gmail.com> wrote:
>
> Use string_choices.h helpers instead of hard-coded strings.

LGTM,
Reviewed-by:Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

