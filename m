Return-Path: <linux-media+bounces-14713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C4692A867
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 19:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD15A1C2103E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 17:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A876148FFC;
	Mon,  8 Jul 2024 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kxMjx8y8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9A084A4E
	for <linux-media@vger.kernel.org>; Mon,  8 Jul 2024 17:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720461011; cv=none; b=tXtCM4Vglziumc0t7dt9Clm2aOI86HP/nWUCVP6Y9LgZm3PPTC7wBjLjpFZuRQ4Q3t9mo+Pjym6I9B5T9ndxY5gFIWMblbwNxBhXy3nGkf0Ge3hgi8VJvu3t5wsbfAUXtDKLi3VA4neErsnSh2fNHi6oyckj9zigBMF3O16g5ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720461011; c=relaxed/simple;
	bh=Cgeu270hOmX3S5GZTXTxjnZltMxA5nAub89Ban01DjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IlGhLtmdBznzFgPnyiVOfuC6GFfdgTcDFEZ1JCmrvI7lFFMmYamLcwo2lgKwJCW80TMv17S4lDwDqbu3fxZY02uFjl+p+OSD1vjNqDDlrGmedIdMYc4u37vGj4Bq++I8ij4AqNRX/+G5BBhAE020HwO5l6/CQ/NoQmSb8VdLG3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kxMjx8y8; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-df4d5d0b8d0so4109639276.2
        for <linux-media@vger.kernel.org>; Mon, 08 Jul 2024 10:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720461009; x=1721065809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nESyMzGZXBtAqIeO/AYycg3VVtY82ta3I2iF0FVP4cE=;
        b=kxMjx8y8+f//+s7hEupd9DKh37DXdEahAVb2tjOhRg3I+KR8cBC+wrlTsZAnearr09
         poj2fR+HiezIpXAOvx/+j4SXmv+jxd0LUv5DwTlvGskBUXBE8x75i0fSPlD85ZY0TpUf
         ljmRpZu75n+UXw9PVSFuH4+fI/ctN49/YzKmtyLM7aLkkeiPp92sAzp5BEO3nZ2O7Zov
         Anr+kyAuj3iiTQB4BwPToWM9CnelVdJ+vWj3uZclatMRnAU5+NEzocQ5+gY6rptYn5U4
         5SfYoxdr3MyxJSy59iWeIaFI31lEwYk7Hdi9y6LrbijHXCaf9kewubcp5GHXvOL186U2
         exzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720461009; x=1721065809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nESyMzGZXBtAqIeO/AYycg3VVtY82ta3I2iF0FVP4cE=;
        b=YqpnA6Q5Ln3bDmOoEOfT5Mu5jmUJlYozZ2d/eURxS2WWgkDJ9FyL/+Bgd83LKUP/D5
         iT8s4PCQVB04mpJ9TDuVcoaAD1Xg5NhqI+cyfjC0/mK0NAsmAkYBTlQRuvhiQfTrDtIi
         x2BLgnwnov3h6cS/y8/V/XzdxDhrgL0KaPBKxVhnSJ5sew7fQ/H71dVaEJB8ppL3tEty
         633vov6bR3fvcTguOd2XxDbAnFCXg4FPy1jNuNTDFgoGA6cDleVXcmu+XZGuFZMA/6bZ
         vFwyeFDJVHRwZwhotXScUj+P+yJ0TLyGIdooJvOGTaje7do4zCpRJENq0ekKApUPJTxI
         tT+Q==
X-Gm-Message-State: AOJu0Yy63CGsrMliNO3WNzp6TwlK6yelC6gdVVj37YFcgnujZJBiLiNQ
	PtSNK3lD1RKoS1ASKlf0Wub6k6lSzGm1cZW6yyyPvLgKm5qhpBDspCNdx1sVHE6UQUMt8Q3hWPS
	blBGr9f+QyEpaK6MKceq/Il5u+XCVBycAeXleacxCAs/v5nTnOQ==
X-Google-Smtp-Source: AGHT+IHcxq/i9rzCxsEN5hnVo4LPbu8O3jBlhcP+IANI38Pst6MQnmRwrHXpKPTOw9a59dfbicjTNMHGzlIpXAxgcP4=
X-Received: by 2002:a05:6902:1361:b0:e03:4e08:c93c with SMTP id
 3f1490d57ef6-e041b03995dmr571404276.13.1720461009288; Mon, 08 Jul 2024
 10:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240708134654.1725-1-yuzenghui@huawei.com>
In-Reply-To: <20240708134654.1725-1-yuzenghui@huawei.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 8 Jul 2024 10:49:57 -0700
Message-ID: <CABdmKX1CXWuw0-gRukZeSoF=SZFi3eRPELe=EU_-q3OVKQHZzw@mail.gmail.com>
Subject: Re: [PATCH] kselftests: dmabuf-heaps: Ensure the driver name is null-terminated
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	shuah@kernel.org, wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 6:47=E2=80=AFAM Zenghui Yu <yuzenghui@huawei.com> wr=
ote:
>
> Even if a vgem device is configured in, we will skip the import_vgem_fd()
> test almost every time.
>
>   TAP version 13
>   1..11
>   # Testing heap: system
>   # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   # Testing allocation and importing:
>   ok 1 # SKIP Could not open vgem -1
>
> The problem is that we use the DRM_IOCTL_VERSION ioctl to query the drive=
r
> version information but leave the name field a non-null-terminated string=
.
> Terminate it properly to actually test against the vgem device.

Hm yeah. Looks like drm_copy_field resets version.name to the actual
size of the name in the case of truncation, so maybe worth checking
that too in case there is a name like "vgemfoo" that gets converted to
"vgem\0" by this?

>
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/t=
esting/selftests/dmabuf-heaps/dmabuf-heap.c
> index 5f541522364f..2fcc74998fa9 100644
> --- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> +++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> @@ -32,6 +32,8 @@ static int check_vgem(int fd)
>         if (ret)
>                 return 0;
>
> +       name[4] =3D '\0';
> +
>         return !strcmp(name, "vgem");
>  }
>
> --
> 2.33.0
>

