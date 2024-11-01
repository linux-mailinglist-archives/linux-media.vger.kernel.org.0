Return-Path: <linux-media+bounces-20693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C5F9B90E5
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 13:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5683B2107F
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 12:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D193219CC27;
	Fri,  1 Nov 2024 12:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrKfZmS4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7101C175D2D
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 12:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462857; cv=none; b=hFPvLEwearzehxDhPoKaKODByL1zxe5aEOUWYq94izIsaNqZ9aStbJyCdDfD5IIFp2zO2VnanY+cK0UlpLzA22JkijrrRVLOaWI1mKGchc8JCAymNAf+0FnNhlmw3l6IrVV/pZKT6fxhdtYX9mpmO7FL0mUyfDJWgnrBAstZeMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462857; c=relaxed/simple;
	bh=NQfRLG44HOSoOG9eMF57I3b+/W86nfpTzcQ8Y8X4Hto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AAtlMhL/BdXfkIoz8tYMVvG/JuLftT3dXuIhl7Zj6I5kHBBYsXIAzPur+oXAG0swZa6Kqq5Ei+UJHM7UaE/1xadagd1MpSvD/UxmpA9VL17I2oq8M8FXb3emceYtxoaX8Ft4MJJYbfNvaNEC8n8O7V2rPt/G1t03fFbXgPmAGWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrKfZmS4; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-50d494ac189so653992e0c.3
        for <linux-media@vger.kernel.org>; Fri, 01 Nov 2024 05:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730462854; x=1731067654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90JiJkcowQmER52PC/LTzYbDENkLaMMtRGJ/m6N67g8=;
        b=HrKfZmS4UOCIRbY+qianFWrXr27q6EZvUfxnkzVnvTtUzd9WUDEAnZWD8HVxgXVYMO
         To01vC/b71MITJC78U2tgt7nzuuTkuKdnq8yedH9YD7e9NqQtvjkMB1wwJUScr1+7rap
         9ztQYdJkVuALQkY0BcdO4eGvP056PCDIEB20Oj2c35MYYed6llDnv+GTrQpmHjrnjv9v
         n3sc+2F2S/JM/gLyGe0o3PErKAn6pwFP6Ta8qIVUxw9n0uQeqE2tOr4S0Q4ezi32ljl4
         xIo1H2KqovGuyDyu7q0Euu9Nkl07Sj+HXC7kUtgyuBGiRdWyA+RPlAFfo/GOiyActFgO
         dA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730462854; x=1731067654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90JiJkcowQmER52PC/LTzYbDENkLaMMtRGJ/m6N67g8=;
        b=qVLw8BRI5XjNrkRRKzilxV6/btyF5wY+crO1f1xMNud4JfzCVV7xAQQQDB2PLeU6XM
         W5GH0JIJ2WV7BKETSIjkR3/xBygi2Nc+qBkQsnRxSrJJtg+7IGM1Vgq48bqCLO5fYel5
         ZCP/kxj8vkq3CV3dtdK0jBWfuYydzC/rZMPNzenlFe+RAf7AGc/InLJZh3R3xzmDdxoE
         oEVLLTImEcOvNBmOpbKavl7ch/Li2UwE02MeqT9uw6lLAkcvdtnGWghEp/JNev42eynu
         iE0XtaudNnigoeSSCI5XzTo5z4MdHL+qsbQqnKyasFeWeZnT4trVX8eftlIgk26AsTKH
         MWGw==
X-Forwarded-Encrypted: i=1; AJvYcCUZxytxxcewC1O1lrG2lFVolEzjH59sdDyJe1Jc6LMj5C8k2B31QFLjhiWx8aQYwXrP/iVlxOEhxzh/zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcEjB4YjJzppbmichZhXPu2Q8FKb5RAqo8iDlXdg8qRz298+IX
	ce1DWXziyejuFmMao7/KqYhucPSwjoMYlhbetZMn3lVPNZAReW8exDGN3oJ5ZS4IkDcmQ+S4mDO
	IAkGoOfAGFdVzev47JM2P9XqvyYZgjlMM
X-Google-Smtp-Source: AGHT+IGKkt01JWWlDb0LZfqyskht7BC7cCsFK1LDYX1y7CVHTgZiL9KXqScC4mqakIOMPh6Q1Kn5TfyCtjf9ognCRDw=
X-Received: by 2002:a05:6122:2207:b0:50c:5683:ad56 with SMTP id
 71dfb90a1353d-5101501204bmr21416627e0c.3.1730462854108; Fri, 01 Nov 2024
 05:07:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3ccbb1fe-6888-411d-a02e-80a0c25d0e1e@stanley.mountain>
In-Reply-To: <3ccbb1fe-6888-411d-a02e-80a0c25d0e1e@stanley.mountain>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 Nov 2024 12:07:08 +0000
Message-ID: <CA+V-a8ut4aX0eLULBkPSe4df_NjZx=8+9q+m493j3WFaJk=OMw@mail.gmail.com>
Subject: Re: [bug report] media: rzg2l-cru: Retrieve virtual channel information
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thank you for the report.

On Wed, Oct 30, 2024 at 9:54=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hello Lad Prabhakar,
>
> Commit d7d72dae81d5 ("media: rzg2l-cru: Retrieve virtual channel
> information") from Oct 18, 2024 (linux-next), leads to the following
> Smatch static checker warning:
>
>         drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:322 rzg2l_=
cru_get_virtual_channel()
>         error: 'remote_pad' dereferencing possible ERR_PTR()
>
This is a false positive.

> drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
>     315 static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cr=
u)
>     316 {
>     317         struct v4l2_mbus_frame_desc fd =3D { };
>     318         struct media_pad *remote_pad;
>     319         int ret;
>     320
>     321         remote_pad =3D media_pad_remote_pad_unique(&cru->ip.pads[=
RZG2L_CRU_IP_SINK]);
>
> Does media_pad_remote_pad_unique() need error checking?
>
The code flow reaches `rzg2l_cru_get_virtual_channel()` only when the
media graph is connected, so in this case we are sure
`media_pad_remote_pad_unique()` will not return an error.

Cheers,
Prabhakar

