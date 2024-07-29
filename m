Return-Path: <linux-media+bounces-15486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD95D93FE53
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 21:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65DF11F22394
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 19:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8145A187324;
	Mon, 29 Jul 2024 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eflQrcXq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C67A85947
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 19:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722281671; cv=none; b=BwjAybiWBcJrf7Q6h7/Qx8k72eM4/OCVFGOdlHEy0uf8HKljuI0v/1FhrbkaytTh40QzgmutfmckzL683Dl9AmtsCBQHP5F9sdDeT/2ZEb2iFdcD+uTZAMt04dzwhm6QIGb/4qQkuIP5D75mfz1KvBtIoQPjXstehMqEdc2BwnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722281671; c=relaxed/simple;
	bh=JDPYy2TIddpY89kJ3pD4y6q48ZYHTEHFw0jXYe8yyWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SP/RzVyixQ6EJGQV2g6d8dgy5NIpyHD1Mix1h/Z2KqMIFWOmX7C062yZcvm3LUs847faGnZ6d5WyvJ3Ccnt9Zm2lEdY+3ASzn1SNi1NzL0lvCU7W6bklGgroypXQeHG984xsObEegwelcmC0Lf7tjQ5/shnyMCV2MdLbxi7IAOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eflQrcXq; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7aa212c1c9so519124366b.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 12:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722281668; x=1722886468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2xKiCSjiL7Vhap8OXhOmXec/I6ck+sG6sqGEKbz0uQ=;
        b=eflQrcXqC+ta6/Sy4NYOpTvCeXhby46RbSSnIiEjJiisw6JDa1oATcmaRjgh87AhVH
         tLqllg3B/pGiab1ZgbTffC5+2qgWSQ8mK/WCoVTXI+PqOxAZItTe7G0ZEJWqU6CZ7EkE
         Iw7OJVdPxvTiRG4u8d6+VyufhlJj0KicCinrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722281668; x=1722886468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2xKiCSjiL7Vhap8OXhOmXec/I6ck+sG6sqGEKbz0uQ=;
        b=C51uFiMuaDNdnxVtXLSCvrS8HkQitijFLo9KhU7EpdHeS7/iuIexFeEyN08UQerm4S
         +pmjTc+Vn5DyD7ez0WUVD4R1Q2zXKXVK661+O6LtjcWFoKjV8BQd3UIZNW12+MaG2N6W
         uo7+Y/FJqim90yA4p/IGu5YRM6X+Ps9cWZQGdtS3zm4q0Yci+rbeQyUgxeZNwht7EgSL
         a7FqJTkzhNazM8ifAJNjRxjmaOMXOy/lNv+b1tX3zAXW4XamQ5y4vhBnE4DR4hjfAm8o
         lWpJeroBz1doM0QeWbF7Zob2N+e/Seeoq4sflo54SfkYGg6DHi3sW+nu3huhZoZxqZms
         vymw==
X-Forwarded-Encrypted: i=1; AJvYcCUFfvDHMKaIf2EG7Uar4j6ujnguDlRv0boFyJxZBQaiLRdzen3cmxw/RCR1spHyHHzNGKHU42uxY560Kw0PB8WR8C9aZ7H6GTWHZUg=
X-Gm-Message-State: AOJu0YxEI4hLWxJRlR303O7qIz2r9YvXwpXJDBBjPTfTW2TXpEa8YaSe
	F0qyI3GwgukxMIS//L/oksMLbe4vMIo0lnufnvzVcdCM7kXXfdOy2hgZLB3jOgBC9geZIxM1S84
	=
X-Google-Smtp-Source: AGHT+IEkN13IWj3QeP9hAm6bqDitd/Aw62Ft6eE8xMRO6NDG4mWUh+nBbIQFytsNXMUjHJUKrfxy/A==
X-Received: by 2002:a17:907:3d9e:b0:a77:ab40:6d7f with SMTP id a640c23a62f3a-a7d401781femr537493266b.43.1722281668485;
        Mon, 29 Jul 2024 12:34:28 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad41616sm546285666b.137.2024.07.29.12.34.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 12:34:28 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42812945633so20571965e9.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 12:34:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuc9eDn9PMG4ztMX/J5Nx8bvC3gDfIYGlD4BdNT/geMKDMElFsE2JnLISroeOJtTEak/1m65dbNaxssIByNfBh/qSxBQ4OJJHHT5E=
X-Received: by 2002:a5d:5506:0:b0:366:e89c:342b with SMTP id
 ffacd0b85a97d-36b5d0a3c88mr5150224f8f.52.1722281667332; Mon, 29 Jul 2024
 12:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726213811.562200-1-frkoenig@chromium.org>
 <20240726213811.562200-3-frkoenig@chromium.org> <49c45c19-a95d-467f-9cd1-cbcea3aa1fbe@linaro.org>
In-Reply-To: <49c45c19-a95d-467f-9cd1-cbcea3aa1fbe@linaro.org>
From: Fritz Koenig <frkoenig@chromium.org>
Date: Mon, 29 Jul 2024 12:34:16 -0700
X-Gmail-Original-Message-ID: <CAMfZQby-1TgT8fYndEztmMB8bqBzB47v+OcbgYnM3cMTOj-Ugw@mail.gmail.com>
Message-ID: <CAMfZQby-1TgT8fYndEztmMB8bqBzB47v+OcbgYnM3cMTOj-Ugw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: venus: Enable h.264 hierarchical coding
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org, mchehab@kernel.org, 
	stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 6:55=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 26/07/2024 22:38, Fritz Koenig wrote:
> > HFI already supports, V4L2 already has the control,
> > put them together!
> > ---
>
> This looks like something you've tested or should have in ChromeOS ?
>
yes

> Please make a v2
>
done

> - Fixing the commit logs
> - With a cover letter explaining what the purpose of the series is
>    and how you've gone about testing it and/or where you need
>    community input to test/verify instead/aswell.
>
> ---
> bod
>

Thank you for the feedback.

-Fritz

