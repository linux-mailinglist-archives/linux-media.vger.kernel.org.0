Return-Path: <linux-media+bounces-22112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CAD9D9CD9
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 18:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A212168C21
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784DF1DBB35;
	Tue, 26 Nov 2024 17:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FJ+Ey4Wy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653902C6A3
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 17:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732643273; cv=none; b=Dzuq1vUHMcUjkpIezzxbyj7WwMDC+yZsn94r5Nc3kMWdppufnBHUcx2TP1rUV/rSMN3hzpkfisW+37pk8F595NUX7ZCldyYCiXd0b/Dz6Ln90JYwOz30XeBi2PcXEszbUkhwEObQfsFiNWCoizkr4/oMt1FYqg/5Rxc684nl4Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732643273; c=relaxed/simple;
	bh=c9FWsB/V5e2yo49k03QPvFAwYgf4cnXWnGY2WByOrGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKVJhv1UsxOHJy+NoQXxfM3yEWjdkyH5rbxZl4R9v96L/cmPsERCGF0l9Mme3glaTBNR3N72EAMMXTlH/rQgnUrEW2/VoCxgnWzQjkUyUzawocWoc/OptcrrgG4sv3zr7mMv5+KwDaZuusw1eD08/HdHODKsk7EniU4eZg6lJoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FJ+Ey4Wy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20cf3e36a76so55647585ad.0
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 09:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732643271; x=1733248071; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IDbvay/L4DqS5s+ZD3GtfsWqS07gNPXpZnhapIvw3WY=;
        b=FJ+Ey4WyqEr5Ax5jka05Zoy3D5evzf2/03wXWeKyEMUsJQIu1i43mNTz/+jrIr1krT
         CzFH+cQzyr5AOHp22S+5V/nFJGcgQfGX+r7qrsaqMKbgwN9E0bMFRuCxFMhZu3qOgVEk
         FBjv+pB8Q/RrV9/Kuo7VFsFkVgXWDK7OuHXW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732643271; x=1733248071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDbvay/L4DqS5s+ZD3GtfsWqS07gNPXpZnhapIvw3WY=;
        b=GmJiGfCxLDnWCUeI/C1rGrxi75S1vq4zkt/OEEm6xn4VDeRLTNw6tfXq2iTijH+xBk
         Q5sckOl1J8axrIR9iJhokrFRXSWlOfz6y6UVq7icGHIVfrMwjMkvsWTbn/f9niP1N/l+
         8+K9V8tcEuoaDOtMEH/YmqB4KUac5QnMic+sI+Edl9vYtLb2QGSq9laYWqIGJGUZS+kD
         k1nLOfFFLrdKWHArhDwz38zY9WmeM6eBLT4/BAZ+UyjUEL3zSiCozvhYDtHYt6GZwsL/
         O2vKpheef0Q41VSoK2tuw+xz/HVNtz6FRVpI7gxFUQBkdwVHuoLEmYBBBiP3EeEceD5j
         LGAw==
X-Gm-Message-State: AOJu0Yy7CbF7nC2FpGKbXyjuFGCZPbnktmFc4Poy/g4pELMGjnE/x1v4
	z+V4LE+gC94oJQ5YN/sLeSSNJHEFp8ypcKv654HBdW3s7hSNlVoxV3zua5ZGhTCEwcm2yRitvDM
	=
X-Gm-Gg: ASbGncv1RDvKiHqoyA9GSyVjVQwdoCFhJygTzzVCbgwKYjBJJGjREdWUn8YuRoUj7VI
	7TkGHJ3qgbWOYSui1dWC4MM+2Era4y36O5mRLIhMhCqMpvPODsBwA/xC6+TXHy54iN0Mr/2pRk6
	Ml1KoKFCG/fu9nnZBA1qizYD/4yD40hAAGLdJwLR5AjZVYmeWYmjdtilaQS83uiVN3DpPxCSQ7q
	RXmQt6KFwbKI5r9p7+BQLnKnKGVI9oTm19p9wB5XNLON5TkSnW+OvgjMa3u79tcnUXDWDtsXixT
	HZayP770JSxZkxRZ
X-Google-Smtp-Source: AGHT+IG57wXaPspmBRLt/HcRdJWM74Z7hpDmjU31eFJ+HZqROfLyi7rrn1dizP1lUOtvZYtr6EdPlg==
X-Received: by 2002:a17:902:db04:b0:212:5d53:d012 with SMTP id d9443c01a7336-21501856c46mr660365ad.30.1732643271362;
        Tue, 26 Nov 2024 09:47:51 -0800 (PST)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1fa27sm87249045ad.225.2024.11.26.09.47.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 09:47:50 -0800 (PST)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ea8de14848so4498004a12.2
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 09:47:50 -0800 (PST)
X-Received: by 2002:a05:6a20:2583:b0:1e0:dd4d:1de4 with SMTP id
 adf61e73a8af0-1e0e0b3688emr416514637.23.1732643269919; Tue, 26 Nov 2024
 09:47:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org> <20240429-fix-cocci-v3-24-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-24-3c4865f5a4b0@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 Nov 2024 18:47:38 +0100
X-Gmail-Original-Message-ID: <CANiDSCufyxGARwe1haE6r46B0LZE6tgUV=iG6OyJuY0mr38bvg@mail.gmail.com>
Message-ID: <CANiDSCufyxGARwe1haE6r46B0LZE6tgUV=iG6OyJuY0mr38bvg@mail.gmail.com>
Subject: Re: [PATCH v3 24/26] media: venus: venc: Make the range of
 us_per_frame explicit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Stanimir :

Ping!
(also for https://patchwork.linuxtv.org/project/linux-media/patch/20240429-fix-cocci-v3-23-3c4865f5a4b0@chromium.org/
)

Thanks!

On Mon, 29 Apr 2024 at 17:05, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit
> number. Make that explicit.
>
> Found with cocci:
> drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 3ec2fb8d9fab..f87e33a34610 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -393,7 +393,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>         struct venus_inst *inst = to_inst(file);
>         struct v4l2_outputparm *out = &a->parm.output;
>         struct v4l2_fract *timeperframe = &out->timeperframe;
> -       u64 us_per_frame, fps;
> +       u64 us_per_frame;
>
>         if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>             a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> @@ -414,11 +414,8 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>         if (!us_per_frame)
>                 return -EINVAL;
>
> -       fps = (u64)USEC_PER_SEC;
> -       do_div(fps, us_per_frame);
> -
> +       inst->fps = USEC_PER_SEC / (u32)us_per_frame;
>         inst->timeperframe = *timeperframe;
> -       inst->fps = fps;
>
>         return 0;
>  }
>
> --
> 2.44.0.769.g3c40516874-goog
>


-- 
Ricardo Ribalda

