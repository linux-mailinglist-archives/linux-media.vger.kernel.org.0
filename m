Return-Path: <linux-media+bounces-7917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F44588DA17
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 10:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEC4C29CB20
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 09:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D12374EF;
	Wed, 27 Mar 2024 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DAR9smax"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96C22CCA0
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711531135; cv=none; b=UWhcFqIE6A3+WsPvkz865apV5qrKc2gwiIXft9fR0IoW5v/vOY0LA3T6+DkpRFnvMK7gGjbUZ3mXmcVMrJqJeMAjh4McOEw4n7hTyXlRzEKCoXND5tXwD2aq7XxgjyEloAhPsAWuiJtzdrQotu8tzt6e+wI82aqi454BGHzKU5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711531135; c=relaxed/simple;
	bh=thIFr9Y9Jxcm5uAacCTDxkjqpSsUU3XCaVdOPFoQSgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyEHyXg3uvs2EzWS87bxiaLnHPEfvqy5kg7HLBmrFqLd2E4wRNXUafaZp7t0ythrD3/HsMRRCmXerCLYJrxQhFSulfBeCZu7f9Egl1WOfdlXmhGZpCfpry9f4IHNFhj5aZaYNKAKJykcwzYzk3RxHN4yAKJmdJ7DgzrqAzDMSY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DAR9smax; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4d8a2ff9d68so654919e0c.0
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711531132; x=1712135932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJVdvG34sYvSwO7/0JAW7k6N5gwqE3CVqrECWM0Q/jk=;
        b=DAR9smax+RicpCWNUBFWqXqsF39m7JXRQ8bb7SQbpnzQo3uEXvi3KfGrWvit0bABNo
         x6dm6Jue/dT24QYSeyElB9rLGN35mi4AB2fGt3x3kcuc0UqpYZ4Ox6TtKYkwasZxyasw
         Fcv4zMoCGJ67IWXqyvCCjESqhYHIh70C5KQT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711531132; x=1712135932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJVdvG34sYvSwO7/0JAW7k6N5gwqE3CVqrECWM0Q/jk=;
        b=dpan7hPQ5rLNm0N9xEB3Juj9KmoNiua2Vsq0jtbAEo/CBMFwPKaal/EEG9mOIbtHcv
         CAly3/afY2CkjZF6t18ibDdpiSQ15BrA5Ru/XVsxNDzrS+OSvsGk4IPZJqZS6uBkhJf8
         +dYezUd+WOB6WrkL+iI3VTnFq/tAnSfGZA0aYuil48n8ozjCbTAd3XBgai4x4djKmeTa
         1AEnVrJZrfNi0IpCvw52mWKZorwppMxUBbJZtgI5HDXZiWXybJ9C5mIf0FsU7GU1AOit
         81y7K/yrQM9AKZqApqsTNmEAmm5ivIkUn3aemNUQ1HaEaNiA4Q2KUq4SxZcxukY/G8FZ
         iCQw==
X-Forwarded-Encrypted: i=1; AJvYcCUtI3Wsbb2flfPFWHGKQAKeaF80aGdcjFO/AuB8gi1JcZtsdcKl+PsYr/1vy4qiYJBm83DX8BZRQXjXT5Pw4BO25c1iUaoRMnkN5Rk=
X-Gm-Message-State: AOJu0Yy3uEYAyFFWDCxB1LMTUdTG9uwt6ODDtyezhJ8RilAG/rixh0Ja
	gfDj278SwXdUKhkjWUA3gfO0s7BXea1bs8CC4nMxkXXnYl5D7gCwxnEFLZCZS8c6AY/eVMvJUvg
	=
X-Google-Smtp-Source: AGHT+IHiMJQsrlAw6ko/njynvG1x3NYivZZDX8F6OqVl9BZGqW8oM2SSzUKNie8EhV/SBs2z+fo0Iw==
X-Received: by 2002:a1f:de82:0:b0:4d4:17c5:8605 with SMTP id v124-20020a1fde82000000b004d417c58605mr2049590vkg.7.1711531132612;
        Wed, 27 Mar 2024 02:18:52 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id m10-20020ac5cfca000000b004cbce0b3020sm1416745vkf.52.2024.03.27.02.18.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 02:18:51 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7dec16fc4b2so1555227241.3
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 02:18:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjFVrVV2YFRuNsAPwAwDHbi0YiBZzMOowBZYa26BrjvuVaL0cAEIRZGl1NeYQRgqtQrJsftQXTC6ydQptz2N83MA2uQNL3V56KF4c=
X-Received: by 2002:a05:6102:93:b0:476:d5c5:4335 with SMTP id
 t19-20020a056102009300b00476d5c54335mr2177798vsp.14.1711531130263; Wed, 27
 Mar 2024 02:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231221092226.1395427-1-fshao@chromium.org>
In-Reply-To: <20231221092226.1395427-1-fshao@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 27 Mar 2024 17:18:12 +0800
X-Gmail-Original-Message-ID: <CAC=S1njAtbvjy1KBoVNtsw8WDKL1Zoh76mG3HvcUaOUBprEMkQ@mail.gmail.com>
Message-ID: <CAC=S1njAtbvjy1KBoVNtsw8WDKL1Zoh76mG3HvcUaOUBprEMkQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Improvement around mtk_vcodec_mem_free() logging
 and usage
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 5:23=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Hi,
>
> This series includes some improvements around mtk_vcodec_mem_free() in
> mtk_vcodec_util.c.
>
> I noticed that mtk_vcodec_mem_free() generates a spurious error if the
> target DMA buffer has been freed previously:
>   mtk_vcodec_mem_free(),69: [MTK_V4L2][ERROR] 18000000.video-codec
>   dma_free size=3D0 failed!
>
> The warning is harmless, but it brings some confusion to our developers
> and testing infra, so I sent this series to fix that with some minor
> improvement for the driver alongside.
>
> The first two patches are for aesthetic and style improvements, the
> third tries to make the error logs more informative, and the last adds
> back the missing checks when calling the free function.
>
> Regards,
> Fei
>
> v1: https://lore.kernel.org/all/20231113123049.4117280-1-fshao@chromium.o=
rg/
>
> Changes in v2:
> - rebased on top of next-20231219
> - revise commit message for clearer intention and rationale
> - update the error messages based on the suggestion
>
> Fei Shao (4):
>   media: mediatek: vcodec: Replace dev_name in error string
>   media: mediatek: vcodec: Drop unnecessary variable
>   media: mediatek: vcodec: Update mtk_vcodec_mem_free() error messages
>   media: mediatek: vcodec: Only free buffer VA that is not NULL
>
>  .../mediatek/vcodec/common/mtk_vcodec_util.c  | 23 +++++++++----------
>  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 22 ++++++++++++------
>  .../vcodec/encoder/venc/venc_h264_if.c        |  5 ++--
>  3 files changed, 29 insertions(+), 21 deletions(-)

Hi Hans,

I'd like to get some attention for this series in case it has been
overlooked. It still applies to next-20240327 without conflict.
Please let me know if you have any feedback or concerns on this.

Thank you,
Fei
>
> --
> 2.43.0.472.g3155946c3a-goog
>

