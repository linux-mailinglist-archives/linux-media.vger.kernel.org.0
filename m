Return-Path: <linux-media+bounces-24630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A441A09A3C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 19:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57E703A7E32
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 18:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8357124B237;
	Fri, 10 Jan 2025 18:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQILPZV0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B54424B226;
	Fri, 10 Jan 2025 18:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736535089; cv=none; b=ELDgEifWvD5xhiwgJsn4KIjiVNDjVld0sXIIi1wXH0Pf+8gCJ2K9DoWwies2ahH2XtRWMY2mEaKuywfm0VKj95R0fEYDo0fcM9Aq0mrpru+CGE3FsVXmBYzL/9EIw3/gaoAnhkyk61wzTsQAE1v3BPxpdbxtiVCZ2PV5VT8+7G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736535089; c=relaxed/simple;
	bh=HQxv7WnjrE+8+bqn4CqOYY0sq7deL2ZeVIILSNz8DkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nGg6Wnh+0YWjYNmzGpJlVIw0E5geKGs1ieIEM7+NJOxBZ8UX2ZVZsEXgfXSAq/qDOIQSHN8GNVFm/ZVYraMa5/9bPvxfRYK2Zlht/97bkeFWZ4au4gvCXNuznJVesH1ye/BZEwwqCbOQawfD6ppdwrkp/im2IgbRNeLTDKAZepI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQILPZV0; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30039432861so22449811fa.2;
        Fri, 10 Jan 2025 10:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736535085; x=1737139885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQxv7WnjrE+8+bqn4CqOYY0sq7deL2ZeVIILSNz8DkU=;
        b=TQILPZV0dZ1r4yjsLwvHr1lIf6rVoffjRpAAt68hR4AkBTctzIocFkh8XdpqMolBkn
         KsYtCItzl07fcTnOHicNqwn28lYblVwiKpk4MokK7EHSPWaWGrgEto+huF8mera9XV2i
         c0eV2Q3AcIYdCC5oEumCJcbMf+k43M7mqOXuMYoS0/UptIAwKkNH6iSRbGEoq8OKe2Od
         QsnXpJihFmqDqi8jo2kefWj+IdrdPn4RUWgo7gXjMP4/xe6kNd7RMixvOO7H1bObz6x+
         8eNu1jC0NlWCpevbecPezChcaB1tXB6uhm+OT+wQwN09vgN6eMFE1m56IN1IV5p65Mhj
         XOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736535085; x=1737139885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQxv7WnjrE+8+bqn4CqOYY0sq7deL2ZeVIILSNz8DkU=;
        b=FdlbWp5zjvQrdiCekDiKX1DsKhZdEo9XeDThWVeC2sg47565nW+MSTv0uVCxJCHDch
         GNMQkdigz5WEVQb9deDiTpmcVw6jkRDpbiX7dpRkvtcAIugyn8SBjTMDX/zS1ByXJMVr
         3yykUmDbEf/Tk2kCD41xVkZ2TiGLotIUy39OtH/JAMsZCduHIiITRkeGf9W2EuU4G08N
         fXt+F80pWjOEpabdTrhVQxFGWzUCWapIDXduQ2sfPeFXyStPZOVFWrXEchWZ8YFwnD0e
         XwS+kpLpb+XJe18xyWXCBmSvU60WJaUNNoaAUzM7ALwRgsgvwSSIxOwcaZprBgxd/iAm
         Mi8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUpalNBKJTHJBcRrDPFFDyMosiR48ZRf2aeqTsxZof0qu5/JdASkLkDRCVveaSm0/KtIUEkJ9hl9dC@vger.kernel.org, AJvYcCXYRnEbsXGP/YolE+YQg4kLoOto5iuHkv0GplOVHYRhToP1Q2GVAEcDqmRqLkXS2+8EsDlJ2Z6f8HVE+58=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEWFzXTwruViJXCtO3TUCHQUQsr/S6ix1P7+YCIm3Ngar4Zmku
	irwr5QuoDgwx/M4UtbcTwNIS2cfIfik/gl/isBYCFC6RkWynustmOIjNI5Qn8vUYNn6Lv3KA5UW
	TJFwwXQKzX9xCXp9oTVNI9HjhmRE=
X-Gm-Gg: ASbGncsyhMGcqlRWtJBoKbPYeVrc4vEi+QGfy+vJWcFgMy6iSvg0oMqUBE1m87nRVee
	Uo571si2/sbUem+rbkbH3DF6px5/g1jpuPtYwrEGcsPj9qIqfK/tiYjXlnJNGkl1ZafDlww==
X-Google-Smtp-Source: AGHT+IHycRFrAFKt/YbEZu0xgaUi0rNt/iS0+nu37UnQFxTlg8JS0vtUEJf4LaYkZg+Q06LcbM8QIN9ZeiacPS8osG4=
X-Received: by 2002:a05:6512:2394:b0:53e:3a22:7a2e with SMTP id
 2adb3069b0e04-542845d1265mr3969138e87.47.1736535085069; Fri, 10 Jan 2025
 10:51:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109000503.45264-1-festevam@gmail.com> <20250110160926.GA2966032-robh@kernel.org>
In-Reply-To: <20250110160926.GA2966032-robh@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 10 Jan 2025 15:51:13 -0300
X-Gm-Features: AbW1kvYBHdhul60z-wLHL_iCM2crW5A83CaSgxRRZUBl1U1quJcpAg9Vr49E70E
Message-ID: <CAOMZO5CMnUorJtTH1Nmnip-s9F9WWWySDSLZor7mYoEors4gWw@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: adv7180: Document the 'interrupts' property
To: Rob Herring <robh@kernel.org>
Cc: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, lars@metafoo.de, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 1:09=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> How many interrupts are there?

Only one.

I sent a v2 that makes this clear.

