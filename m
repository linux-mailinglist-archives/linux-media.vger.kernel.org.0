Return-Path: <linux-media+bounces-31694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 972C6AA8EEF
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 11:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 600D9188EE9E
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 09:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D4F1F55E0;
	Mon,  5 May 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PekxgNfD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29991F3D20
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 09:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746436032; cv=none; b=UNMt8+JXyPRLToome1Z9cjNW8RhwYJoNXPSTbdwDharXBiSHi7sC+Zw03tYuJcW1s8ipN+JzASdUdpDGuxNvcWo5KRf809V8Cw3pxt+spHJN8sqTHLlqKf/p3skLsnwXq7vC1oJVpPvv8wnwnJ0ziBKu37ehJonxJ1QbKt4qNyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746436032; c=relaxed/simple;
	bh=DKSAlySHx3h3D9zpUBcxrMd3u1LhzK+bGMkaFdM8fys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7FPhCWu/jiiijyAqvDi3BGSJtFYDqxFHh38J5E98Ao/sVMqVV2N8DV/AjD3gPpCQwXSQW37mqCSPCFyLzVEYp+LOy7B9dG7LMpf31FO5hmjtdl86tnvl54FjQeRqSysj849rMcdxQHl2s8TFQiusZyDYDb5Be83WminsiUTXuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PekxgNfD; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-549963b5551so4648475e87.2
        for <linux-media@vger.kernel.org>; Mon, 05 May 2025 02:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746436028; x=1747040828; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/GsrYYGdHiHagWAJNMJ4+WIR65DiPU+EFWzyGSzQD9k=;
        b=PekxgNfD2/kkteSdEowoWyXWset8iaNeKN+P5h3QVy2007X1DGVmK/lMivPc0llMTL
         DWCTcv/1ksAMHHTu9EFzPMbgrOOlP4w+GBX+FkczxGj1euaXObWolAigz5TfL7rfLOEW
         7xrPJqKvE3BswJvodHcv7L1kyPMzruRFw57no=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746436028; x=1747040828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GsrYYGdHiHagWAJNMJ4+WIR65DiPU+EFWzyGSzQD9k=;
        b=tM5YypzsN1cEnoc2m0iCqm+MR4cA8f76wp/Teu2w2iDJV+H4YdCl1B7uoxH+Cux8Kj
         SWSN6TNNJ86++aPlCewR7JGUDTA3QdQlHiaF/e2CvkT9v0rnCwvRDPeKXy8CQz6u12TQ
         q6JU8kEw6HE/0X+mK5RoQk0VJQ1GAVx/oQMxZO3TQTot7uW1Ghc73XbQBMXwBpusGJLx
         GvFCudWgQNeO1ODOew5qdtgya+0ekKnO5rzYW7NKLZspC86ySzrLer39EpmH/szj/rE5
         iWdgI5W2EapQkpMPWlFYznG+iTRprKL/bruXo1K+oJputnm2YRjCbASLFNHXBClaYOlj
         Ab/A==
X-Gm-Message-State: AOJu0YxlDuSEDvaA+dtaTcYxFJM9I73PutfrgJ0HilAH/hvQA+1ItveF
	8pjZsY0X8k9Ens4N1XbVv5E24X4lIqCvDhgsLPtohzcaHKvs+F2YVoND9gOdE6FSJAGPp0/wQH8
	=
X-Gm-Gg: ASbGncuiCKTV1RyUqPbgxUkMn9DuB2Vd+euXNZ9ShFTbIJh6XbDSgIWBnbGeYX0Ardc
	lS3vR4W5kFtETEkt4GbAhDjr/wRS4IFgRaILU9IxkDPT157npmMhHRLWFhf2SlAuIwSMnLbm+ur
	N4p0gfOIoqZabw84qVTY7pCJNsq72vmvxva0BM91lPJX9WinQ1peFolCic+wrAoQHP0PusYgNBo
	BMaaUt4UydCzflikKB3aNdI9v+9ugL2P7uNkKFgzgIq6XL9lRg3lQh/k+/8WSEfHCi3GFIKNGEj
	1o1CZDIZyeSekGcRWCrDjVE6PNu9/Q9hKA6SESRWcWQMlVXqF1P9K/X+aTcwjFe/6JfuCeZBS/O
	ynvU=
X-Google-Smtp-Source: AGHT+IG5cUImTrHvLo9DPS5jLOh1LbXfiuY7JoTbL5J1ayE/zvaw+qQlcLkvPsBhpLTdHRzD8GHN/g==
X-Received: by 2002:a05:6512:3d2a:b0:54e:8160:d302 with SMTP id 2adb3069b0e04-54eb2477653mr1968625e87.37.1746436028442;
        Mon, 05 May 2025 02:07:08 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f67f3sm1640413e87.215.2025.05.05.02.07.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 02:07:07 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54acc0cd458so4856555e87.0
        for <linux-media@vger.kernel.org>; Mon, 05 May 2025 02:07:07 -0700 (PDT)
X-Received: by 2002:a05:6512:3c87:b0:545:2300:9256 with SMTP id
 2adb3069b0e04-54eb2428303mr1840599e87.12.1746436027276; Mon, 05 May 2025
 02:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
In-Reply-To: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 5 May 2025 11:06:54 +0200
X-Gmail-Original-Message-ID: <CANiDSCtNTMb7kDqrRbpMjDiL+vJh97Tm=2s44J46QS8uH+m0bA@mail.gmail.com>
X-Gm-Features: ATxdqUGQfyylk6QXkXx8f0-VFS2_hwlKvplMAloc_0UYeLmco1yG4YZuTcaOv88
Message-ID: <CANiDSCtNTMb7kDqrRbpMjDiL+vJh97Tm=2s44J46QS8uH+m0bA@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
 + other meta fixes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mauro, Hi Laurent, Hi Hans

Do you have any comments about this version?

Thanks!

On Fri, 4 Apr 2025 at 08:37, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> This series introduces a new metadata format for UVC cameras and adds a
> couple of improvements to the UVC metadata handling.
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v5:
> - Fix codestyle and kerneldoc warnings reported by media-ci
> - Link to v4: https://lore.kernel.org/r/20250403-uvc-meta-v4-0-877aa6475975@chromium.org
>
> Changes in v4:
> - Rename format to V4L2_META_FMT_UVC_MSXU_1_5 (Thanks Mauro)
> - Flag the new format with a quirk.
> - Autodetect MSXU devices.
> - Link to v3: https://lore.kernel.org/linux-media/20250313-uvc-metadata-v3-0-c467af869c60@chromium.org/
>
> Changes in v3:
> - Fix doc syntax errors.
> - Link to v2: https://lore.kernel.org/r/20250306-uvc-metadata-v2-0-7e939857cad5@chromium.org
>
> Changes in v2:
> - Add metadata invalid fix
> - Move doc note to a separate patch
> - Introuce V4L2_META_FMT_UVC_CUSTOM (thanks HdG!).
> - Link to v1: https://lore.kernel.org/r/20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org
>
> ---
> Ricardo Ribalda (4):
>       media: uvcvideo: Do not mark valid metadata as invalid
>       media: Documentation: Add note about UVCH length field
>       media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
>       media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
>
>  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
>  .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 +++++
>  .../userspace-api/media/v4l/metafmt-uvc.rst        |  4 +-
>  MAINTAINERS                                        |  1 +
>  drivers/media/usb/uvc/uvc_metadata.c               | 97 ++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_video.c                  | 12 +--
>  drivers/media/usb/uvc/uvcvideo.h                   |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
>  include/linux/usb/uvc.h                            |  3 +
>  include/uapi/linux/videodev2.h                     |  1 +
>  10 files changed, 131 insertions(+), 13 deletions(-)
> ---
> base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
> change-id: 20250403-uvc-meta-e556773d12ae
>
> Best regards,
> --
> Ricardo Ribalda <ribalda@chromium.org>
>


-- 
Ricardo Ribalda

