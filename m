Return-Path: <linux-media+bounces-5519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F3085CF50
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 05:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ACE31F21D63
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 04:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17D4383BF;
	Wed, 21 Feb 2024 04:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J+lJrh5B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A190729A1
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 04:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708489992; cv=none; b=aNvM1xkD6/rxc+J0/L+FJ4/xapasdHuqDL/dfcKfJNAjc7blyuOho0zZu1so3f1OXFRt54W5JA/UNHw4djNTQuVJ4Wj87lfFRoYMljSh7sCrT86eeWpgL6xP+3apTaAIY153VnYoRn+oK72cKmGMoTBvaLID717GId4HN0az4Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708489992; c=relaxed/simple;
	bh=oL4jzuCKbGJSQdHdOTD8mVuXHXW9YeehgSh1yQfUYr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQQ4rO8l3aDRHqmXNAv6URi5jveOPqNX+riTAD4qUk7y1m2PvWVkevR83fcNmPJsx+Lf8pZbEu6omvYSLFxutbkIjPuiDcd5p0KThMm7V76stIYZX58cnv85Qbl8vYbZ4D8xKfqs15kssJ1vKYxujZdwZud7x7SxY91cI5ma6Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J+lJrh5B; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3e552eff09so287775966b.3
        for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 20:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708489989; x=1709094789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmY04dbj/vIU0t6pHPXsLFor7e8BbOlWKLitvKLNgfs=;
        b=J+lJrh5BApfGMGFXNqy8UADibA3r4E9St5n9eryvgEDE5ismvmwgOMyeET8WT0Yjhy
         ohk7hVIb3c4+6IKFUXLEysmML1qDkTGjOYSdKOAII5pOurKzbQcWKnpmqwkFqJFqz4v0
         RJdDvHbmpR/fK75rfOwrhsf82siUcJiORn8F8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708489989; x=1709094789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmY04dbj/vIU0t6pHPXsLFor7e8BbOlWKLitvKLNgfs=;
        b=KqsNCGN1me6TYm91tp6ALvGHQtuClDOjWgqU6ys6A0JGPmNwcvTNEllF2sVsBVM1Ew
         94IHKmYWvWJHyz9iW3/FWaOB3iIl/EOpDgZ6Z1/vxD7tsXwfQvuaFDfgkRQlAVmvkuZF
         jN7qSwhiEN7FgIjLNpT+g6ZqJWZ5FfeEczkBihTKHlWZMp6PEtvQs4vuNHl1XHpmtMst
         Su8CnLjCUXN3SansQ6TwzOVfAS1daYODcbYnUKe7CMRfUHoONs6f5iNhM9RCNGw3SJoq
         lyGkU6k3NT/qerPTO0sKdpZ+06CXu2yr8yZVpi99QZFN0N0rt0S5Iyu++thZ2Cq13spI
         DDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVldzSgDoEmxuSLePQ+S1udktNLg2tQI4MJejPcnfC2LQ2TdeYHbZvcSPEa39eSj9WXfdT0WjkNL52+X5yhl350+rf6mxlRtLBSU5w=
X-Gm-Message-State: AOJu0Yws7iK8UdtxbG/gs4M05kNPa4Z26LRRYnOvFTpCGBZwF/TRiR9T
	VCjFp8cOWhhzzgD7bab0lox+kcGi4Qzjm0eEFk8UvoC4jG4JMeuWbvmQJncIpuL9jlWxwChNWkt
	nCQ==
X-Google-Smtp-Source: AGHT+IFnVD98xROCmTEkNAJoxlHQ92IKryGZcfgO51DfE3nmyfCnunFec4thfzSGf7qw3/MGTTtOjA==
X-Received: by 2002:a17:906:559:b0:a3e:665a:45c0 with SMTP id k25-20020a170906055900b00a3e665a45c0mr5596669eja.45.1708489988977;
        Tue, 20 Feb 2024 20:33:08 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id ot18-20020a170906ccd200b00a3ecdd0ba23sm1974730ejb.52.2024.02.20.20.33.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 20:33:08 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-412730e5b95so4370795e9.3
        for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 20:33:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKHomBVJO/c4hyttuGZytL9F40Z3kbxjlqV2elcxd54JmSiDa2M6Taojz2aTRS57lM0PcwGtWWEszYNncqgh5VPLJrCZhxin9ueXY=
X-Received: by 2002:a5d:47a4:0:b0:33d:6ede:1149 with SMTP id
 4-20020a5d47a4000000b0033d6ede1149mr2829350wrb.35.1708489988167; Tue, 20 Feb
 2024 20:33:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com> <1705581128-4604-8-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1705581128-4604-8-git-send-email-shengjiu.wang@nxp.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 21 Feb 2024 13:32:50 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Ddip8n90Ma+d_kqgARoMRvpmk5Yyo+D_Csop6Ws8bHqw@mail.gmail.com>
Message-ID: <CAAFQd5Ddip8n90Ma+d_kqgARoMRvpmk5Yyo+D_Csop6Ws8bHqw@mail.gmail.com>
Subject: Re: [PATCH v12 07/15] media: v4l2: Add audio capture and output support
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@iki.fi, m.szyprowski@samsung.com, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 10:15=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> Audio signal processing has the requirement for memory to
> memory similar as Video.
>
> This patch is to add this support in v4l2 framework, defined
> new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> for audio case usage.
>
> The created audio device is named "/dev/v4l-audioX".
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../userspace-api/media/v4l/buffer.rst        |  6 ++
>  .../media/v4l/dev-audio-mem2mem.rst           | 71 +++++++++++++++++++
>  .../userspace-api/media/v4l/devices.rst       |  1 +
>  .../media/v4l/vidioc-enum-fmt.rst             |  2 +
>  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
>  .../media/videodev2.h.rst.exceptions          |  2 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  9 +++
>  drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++
>  include/media/v4l2-dev.h                      |  2 +
>  include/media/v4l2-ioctl.h                    | 34 +++++++++
>  include/uapi/linux/videodev2.h                | 17 +++++
>  13 files changed, 222 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem2m=
em.rst

For drivers/media/common/videobuf2:

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

