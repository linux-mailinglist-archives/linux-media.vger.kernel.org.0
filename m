Return-Path: <linux-media+bounces-10922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C69328BD522
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 21:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5432B1F2272F
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 19:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACEB158DDE;
	Mon,  6 May 2024 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f5hZ0027"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB308158DC4
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 19:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715022291; cv=none; b=d1CFKBmPObgRqFLEYeUv5PY/Akqfz25VPD7sMEn6IOicDRsVqeTLHYIIG8DmcOxdWdhQI2ocPOJRz3d0QIA4VNUyVzVKDYy1ywTDYkoihZbpu8Ivn00HrEqsVoG4P1PcYLKY+fnfhRkNUHWLFo/VwN2CEis6YvGw/qfrKelUHak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715022291; c=relaxed/simple;
	bh=tW6ZXbuxNCkRRdetUmGMqtCDIB19FjpOX7Yn0qAHvpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtRAgr3kbRCE/wrhFZe9i3P4uTaXppI1Bm8ivvZAVskZwo9zlZkjus2pm4426UNmhd90iAW//TkcRegXRy0khDxAMkjCnNsa4ZpqzJ2U/xwm66V181rZvi8WO7Pg7R/j3jpqHF2/7h272OqPi1jnp/DoPfXvzRr0hy5vIaqcV4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f5hZ0027; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6114c9b4d83so21066367b3.3
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 12:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715022289; x=1715627089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tW6ZXbuxNCkRRdetUmGMqtCDIB19FjpOX7Yn0qAHvpM=;
        b=f5hZ0027j6tuOh01uqPVudpyTJa+xNkCO10/V6NYr6V9QYjzs74VuSv6jgymVHBkLR
         8mEPTuHO3jluVSuStsWpAQT8+4cFa2LBY37URjDhOZ81AqakT2nNoN7I83iO69f2ErSd
         aFqdzTcFW4AatEGpt3W8pFXLk1ZOkqvsMCi8p0sdMsLIzor73cv5dOb+2HmlEZj5jQyW
         VGyzy3yJsdgLkSboDBoGNmn97zZyODQlU3stSQhtIMaPZl7t8w3k/6ePN2chN2csHkT8
         hLCAOcY7fSD2J6RNELeNIeFLvsn4O52AZElGXeszMghMZS8IlNYRnyjD1dl/LrBVGXJQ
         5Llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715022289; x=1715627089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tW6ZXbuxNCkRRdetUmGMqtCDIB19FjpOX7Yn0qAHvpM=;
        b=LUQ1ma3GUnRs3jj0pnKceabrbYxD9vaILFPb563pxuJDb1PpmkhVTlbhgm3KPDWOXz
         x+Bo9lQwNX0ispZpoyRDDN9HawOkzSTi71ROXr4e500Pk+AD3a6E/pI73kFBKF4Sp5/R
         JzDViASpOAwNcbEannwIwDshLnL5CmQouVRhUaKaDCDEGqV/llUu2Uqytx01eD6SgJ/m
         Ru0Zhj4IifeDE89mL/kn7pWSCFFo14NIN2Nok1RjV1esikidSDoGwhm7EWYowPXtR5wc
         F4QN/+zwLh0hT76ZLhPfK5HjAWcxd1qpyZh1noXKKvvM2etu7btIJfl+ShZ6lMEZyNBE
         f02w==
X-Forwarded-Encrypted: i=1; AJvYcCVZr9/whxQrTDiZk0LvRsyXgFun7ughD76jMZel8O6cJ1KXsA34Mfm/p72LIogoe4rt/L+QSwqsEJ/qEgBdXiW3niJo/T9paCMppNI=
X-Gm-Message-State: AOJu0YyvMAqA0YxfXRuVxDHfWNInodf9v6VQbLeJU9gDYDdOcA/wByvx
	FkeCR1pOo7/V5i3v/Ihn0xs2471YK23PtdNLgYIEZKMI+GqBYnu4dSuEUfGHQHJG9jQtsygufDw
	Ob3O5dggLyJZvCerpe/b4GZCnhh7Y8aYCGSJp
X-Google-Smtp-Source: AGHT+IEHS4oNIdmD9nG484I0nYBm3aQGegCbP8GsgU98ex98+CK429DdDBUHk35GcJvZBDxds6QwOF+YUNMpYcLD1EA=
X-Received: by 2002:a5b:1c7:0:b0:dcb:f7a0:b031 with SMTP id
 f7-20020a5b01c7000000b00dcbf7a0b031mr9837906ybp.50.1715022288568; Mon, 06 May
 2024 12:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327022903.776-1-justinjiang@vivo.com> <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
 <cc7defae-60c1-4cc8-aee5-475d4460e574@vivo.com> <23375ba8-9558-4886-9c65-af9fe8e8e8b6@amd.com>
 <CABdmKX2Kf4ZmVzv3LGTz2GyP-9+rAtFY9hSAxdkrwK8mG0gDvQ@mail.gmail.com>
 <e55cad9b-a361-4d27-a351-f6a4f5b8b734@vivo.com> <40ac02bb-efe2-4f52-a4f2-7b56d9b93d2c@amd.com>
 <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com> <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
 <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com> <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com>
 <289b9ad6-58a3-aa39-48ae-a244fe108354@quicinc.com> <CABdmKX3Zu8LihAFjMuUHx4xzZoqgmY7OKdyVz-D26gM-LECn6A@mail.gmail.com>
 <8ca45837-cbed-28da-4a6f-0dcec8294f51@quicinc.com> <83605228-92ee-b666-d894-1c145af2e5ab@quicinc.com>
In-Reply-To: <83605228-92ee-b666-d894-1c145af2e5ab@quicinc.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 6 May 2024 12:04:36 -0700
Message-ID: <CABdmKX2MWU9-9YN46PXx-Jy-O9CHMv8hCkvArd7BbWUBs=GPnw@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: Charan Teja Kalla <quic_charante@quicinc.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	zhiguojiang <justinjiang@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 2:30=E2=80=AFAM Charan Teja Kalla
<quic_charante@quicinc.com> wrote:
>
> Hi TJ,
>
> Seems I have got answers from [1], where it is agreed upon epoll() is
> the source of issue.
>
> Thanks a lot for the discussion.
>
> [1] https://lore.kernel.org/lkml/0000000000002d631f0615918f1e@google.com/
>
> Thanks
> Charan

Oh man, quite a set of threads on this over the weekend. Thanks for the lin=
k.

