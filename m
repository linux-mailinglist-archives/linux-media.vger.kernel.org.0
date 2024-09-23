Return-Path: <linux-media+bounces-18462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 367AD97E833
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 11:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66F1A1C20DC8
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 09:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344281946BC;
	Mon, 23 Sep 2024 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EQzkkGdz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E58728684
	for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727082502; cv=none; b=BPozbs9kjJBMRMBt30FOuxCbWgyoadp9ouRIwzXE3WiD1/7Ms3jvugyIxXdWfL2K8ROlfaB0c3qA7kpD0i2VvhEZlpTYK/7OMSjegBo6PS+bM6+pPN+9hBNjW7M0Q9BQc1hyWhUIaodd/B/seL3xtDYcIN/0jQxaMBVZgQCEkGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727082502; c=relaxed/simple;
	bh=HPlA+B04ZRzeplKMW1vzpCM4N9lRQ38Hiyk6YoLnAIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plX48rEK7DBsld2JBBPogehR90r6+gc8XJ9/or2ZY24fEA0CdTJDTFwA4ZxBAEc7kwycWLfbwgfFfm05nCyCHeXiSYa4DFVC+4M72WCHVPPaVEksf130tpy7gIiW97RcV5RoKZsAvaHijIPWLUIbzMkqezrvaBezGb7BphnadPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EQzkkGdz; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-50108b373d2so1043309e0c.2
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727082500; x=1727687300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0Ef2pUJCIL3aYIls9LM/0/HuZV6sRLvGWfXRnJJRsg=;
        b=EQzkkGdz6iDUm2WkOKO8GafqAEHc1P6MWWAqmYShArgTLf8qtjX8nu8XdafmmzRWvb
         it0pMFjWCLWEMgHsC6aqYlav91uSpFkbSDHnz+aNaDQGzYPNNPTVKR0DGr2UY+aLWeGW
         uLoAwDZN4QUlF1dY1kcZZ5vHoK28R3OPXJgkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082500; x=1727687300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0Ef2pUJCIL3aYIls9LM/0/HuZV6sRLvGWfXRnJJRsg=;
        b=XWhHQ+f90Eiu4+LgB7Q8pqKB3b18M9Cc0zK1FLSjhp3K4sXFQ4+5/MGxPi3k3ANdVE
         MtESIvv71hFGQBd69p9Ja3dZ49f3HNFsbMOFq8okcwImctAWvP6EwyXNFwRy1BMOmye/
         Og8UHs6c3TzhABfG1Pzh9TXuR1MkxvBHIwro0sPlBYz/uiqF5OhFLAkHCwQGDASmMKdf
         Shdnjm9Wc1RKAlKtNjbnL1fXeoGEc3Fs4c/6B3d6SmbzExdNnj18zEV2MYP1w6NQlXBT
         ksvuqGU94j3ntJnc9GeIlUSi2ehx2kTi6Iq7hju9H27MXbtkfR48P0ih/JmrZTEyZQhn
         lnLw==
X-Forwarded-Encrypted: i=1; AJvYcCU/HeAqkC0dsCS09B79832t0gOR2/Ybct9QvRsfeWEdV0rCq3yCysT0SwVxd/4qDYBcklKJvs6F8arFzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+3P61QVW4at4LVgMbMPQd59Y1h7i/p7EcA59qskD777sbrHKn
	rJIPMoWoYPlIAqp9o6EkYA9BnifSUq6Sg37v7E4eKrnZOJNTrONugUSR1SyJMDtAtjm5D1yf3nU
	=
X-Google-Smtp-Source: AGHT+IEqZjbbM1fWWatVi2WFNqcxZtYsMcK3SmnT4S/h6bvTwqXXTForRYftZOtPqh1qUs4K6wA4pA==
X-Received: by 2002:a05:6122:17a6:b0:4f5:199b:2a61 with SMTP id 71dfb90a1353d-503e053b6camr5692046e0c.9.1727082499635;
        Mon, 23 Sep 2024 02:08:19 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5035ba70706sm2766683e0c.25.2024.09.23.02.08.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 02:08:18 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-50108b373d2so1043303e0c.2
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 02:08:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnUVUyONvOs1KJ3RKtT8kqXgqo6La/ixD/X7atP9JSXubrVch1cRoq4ZSvfst0RHWNzVeLA6Rdmd14Xw==@vger.kernel.org
X-Received: by 2002:a05:6102:5088:b0:49b:a93d:3d0 with SMTP id
 ada2fe7eead31-49fc7511684mr6579342137.1.1727082497908; Mon, 23 Sep 2024
 02:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240831055328.22482-1-zhi.mao@mediatek.com>
In-Reply-To: <20240831055328.22482-1-zhi.mao@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 23 Sep 2024 17:07:40 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh76iKhMV4roBe4mLTrq-eHqz-3-fYWzNcWAETvj-JETA@mail.gmail.com>
Message-ID: <CAC=S1nh76iKhMV4roBe4mLTrq-eHqz-3-fYWzNcWAETvj-JETA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: improve suspend/resume switch performance for
 GT9769 VCM driver
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, shengnan.wang@mediatek.com, 
	yaya.chang@mediatek.com, teddy.chen@mediatek.com, yunkec@chromium.org, 
	10572168@qq.com, ot_xiaofeiw.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zhi,

On Sat, Aug 31, 2024 at 1:54=E2=80=AFPM Zhi Mao <zhi.mao@mediatek.com> wrot=
e:

Suggestion for the new patch title:
  media: i2c: dw9768: Use runtime PM autosuspend

to better describe "what" this patch does to the DW9768 driver, not "why".
Also there's nothing to do with GT9769 in this patch.

>
> Chromebook camera AP can switch between video and photo mode,
> the behavior corresponding to VCM is suspend and resume,
> it will cause camera preview is not smooth during switching operation.
> We use autosuspend function can fix this issue.
>
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> ---
>  drivers/media/i2c/dw9768.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> index 18ef2b35c9aa..7449d29df901 100644
> --- a/drivers/media/i2c/dw9768.c
> +++ b/drivers/media/i2c/dw9768.c
> @@ -374,7 +374,7 @@ static int dw9768_open(struct v4l2_subdev *sd, struct=
 v4l2_subdev_fh *fh)
>
>  static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *f=
h)
>  {
> -       pm_runtime_put(sd->dev);

Call pm_runtime_mark_last_busy() to update the power.last_busy field
for autosuspend to work properly.

> +       pm_runtime_put_sync_autosuspend(sd->dev);

Use pm_runtime_put_autosuspend().
Don't switch to the synchronized variant without reasons.

>
>         return 0;
>  }
> @@ -490,6 +490,7 @@ static int dw9768_probe(struct i2c_client *client)
>                 goto err_power_off;
>         }
>
> +       pm_runtime_use_autosuspend(dev);

Add pm_runtime_set_autosuspend_delay() before calling
pm_runtime_use_autosuspend() to avoid rapid power state bouncing.

Regards,
Fei



>         pm_runtime_idle(dev);
>
>         return 0;
> --
> 2.46.0
>
>

