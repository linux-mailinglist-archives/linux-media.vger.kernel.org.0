Return-Path: <linux-media+bounces-3467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 774DA829B15
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 14:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 061A51F25776
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 13:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEA2487AB;
	Wed, 10 Jan 2024 13:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BWwbl2DQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C2B4878D
	for <linux-media@vger.kernel.org>; Wed, 10 Jan 2024 13:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a27cd5850d6so440439966b.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jan 2024 05:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704892730; x=1705497530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkokB/0M852JVAhhBzrY1VucNEPXQojjfZL3scXin40=;
        b=BWwbl2DQRFKgL2Mt3g1fJ0OWvIvTTAJYtogoXBTcidnUFI+nX+rbWf15JydfBh9SRo
         n43azOTjRWzlOgxeUZKOIE9kxnEFdDFhR8rknstWnfXJpjJ0dSLdfHK4yKTVjQTBt8DL
         Gt29ooQds0nvZiYEpRNcGvDIFpWgpUKGvZMWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704892730; x=1705497530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkokB/0M852JVAhhBzrY1VucNEPXQojjfZL3scXin40=;
        b=CbslLbpTj8/7FJVhOyM3U/E5jLHeV0d7Z5hQhv/v/beYi3GR5PMjuF8+afKOKo7LlK
         gDX807PL/83EUPVLo1dp5KCoWOjQcptjwuaTplwHzuMdxDwkZlLu83LycKCIfFEJX2hj
         sofEo5+ADI+5OJBnwVsHoA0+XLMFSEGf7zJjKEMHRjzdfpOewqds94s951zW7hVtjReg
         IhxLlWx085gFZ7/qR2EvMf0XAzUi8/JY61QhoT6WPFU7xLV7UD5i6+uZdsKb2I75qhsY
         /4M0p+CJebCkXqGDquDquoTDn33SFld92S1kxBz2LiMSqhh5dLSLLufqLCcdn1nFnujN
         3skQ==
X-Gm-Message-State: AOJu0YzfPMrcsQLbp9u43vfVnoLI7qeMUYuoBFYKwYZjbngGBnYZbkvx
	t3rSuadg++fxzBXZLGvcYosZ7VVuhX7btWj95FAm+6t320J5
X-Google-Smtp-Source: AGHT+IGe3BC0dAlwB53X5CWaiAT4Z3I0In/T1xbXk+BRkTPxYisasZpC4xTz8ZLWivzQNgU19bSNSA==
X-Received: by 2002:a17:907:36ca:b0:a26:ce7b:e7db with SMTP id bj10-20020a17090736ca00b00a26ce7be7dbmr752641ejc.70.1704892730017;
        Wed, 10 Jan 2024 05:18:50 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id l4-20020a170906a40400b00a2bfd60c6a8sm290403ejz.80.2024.01.10.05.18.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 05:18:49 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40e43e48a16so38330845e9.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jan 2024 05:18:49 -0800 (PST)
X-Received: by 2002:a05:600c:2281:b0:40d:5fd4:ce3a with SMTP id
 1-20020a05600c228100b0040d5fd4ce3amr485316wmf.85.1704892729430; Wed, 10 Jan
 2024 05:18:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240105125437.30926-1-andrzej.p@collabora.com>
In-Reply-To: <20240105125437.30926-1-andrzej.p@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 10 Jan 2024 22:18:32 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CMRUXtcJrC1T1mBMw8Es7x2PNq=FvSTiOd2GEdTP0x7A@mail.gmail.com>
Message-ID: <CAAFQd5CMRUXtcJrC1T1mBMw8Es7x2PNq=FvSTiOd2GEdTP0x7A@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: Fix doc comment
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 5, 2024 at 9:54=E2=80=AFPM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> The documented struct member is called "planes" rather than "vb2_plane".
> While at it, make the comments order follow struct members order.
>
> Fixes: 2b1413245550 ("media: vb2-core: Improve kernel-doc markups")
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  include/media/videobuf2-core.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-cor=
e.h
> index 4b6a9d2ea372..e41204df19f0 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -271,11 +271,11 @@ struct vb2_buffer {
>          *                      skips cache sync/invalidation.
>          * skip_cache_sync_on_finish: when set buffer's ->finish() functi=
on
>          *                      skips cache sync/invalidation.
> +        * planes:              per-plane information; do not change
>          * queued_entry:        entry on the queued buffers list, which h=
olds
>          *                      all buffers queued from userspace
>          * done_entry:          entry on the list that stores all buffers=
 ready
>          *                      to be dequeued to userspace
> -        * vb2_plane:           per-plane information; do not change
>          */
>         enum vb2_buffer_state   state;
>         unsigned int            synced:1;
> --
> 2.25.1
>

Acked-by: Tomasz Figa <tfiga@chromium.org>

Thanks for the doc improvement.

Best regards,
Tomasz

