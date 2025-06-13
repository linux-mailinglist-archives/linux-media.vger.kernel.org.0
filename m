Return-Path: <linux-media+bounces-34717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D438AD85B3
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 10:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9DE07B0DD0
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 08:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560182727EC;
	Fri, 13 Jun 2025 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="SnfVJoqo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9512DA756
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803554; cv=none; b=FMkScyxjzaorpGH3h5wSApLRItaM3P6jiamhTqxzAxcGMWypYYq2MLC21OkI/Ake7xjj5fe/SzwWYymuc+WnM5X4xDNyrmJeRXslefQuAx3nefcMUUC2oFAuxTbhqO9Y+znsq0nKlCmld6c8z+75wvoN9op4ivX9dl+6d+E5gNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803554; c=relaxed/simple;
	bh=BdDCqktBWLwjM+BSVfI4vTCcZ0s9CW6eDqML0DAJNys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmPPs09kr9wEjtqx7b2B/Lqw59rliFf+d8W4tteh2WBconGmaYlV7YdtiOq6IQsjUriH++nXyQK7Y2usifN9nBACGDRyP8z9sO70w98ZGK9NW5UkCktCKVsPLyIi8RWS9GTLJSzTRBw7G+AXECtW/fa/uARFLwNsobR+pBxU4IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=SnfVJoqo; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87ed6d59f9aso83516241.0
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 01:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749803550; x=1750408350; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J405qXIsAkaaQ6HHUqff/iiQgjpmkZvb1eF2OKZ5QAQ=;
        b=SnfVJoqoJMVrWHA8nsDItCv3JyPNqAqtUhQcyzZ9CRO+HHTTL0jcMc6gbRkKze5Gib
         AmS+KO26HTnT2CD/2tXB608kHjb8RuHYMPYJQ65pA3bzSKw6dQf6O9BN77+4tIPu+FtD
         Mru+d8hb8n6g2UkJBVwJPpHz/4f5UrS0FNYdWLb5gWfVnXUjiKhBz1K7iLAXYhyYpCm7
         aFWbYxQcDZqOkdJ/0XP1T9pl5tox/Gzg7JF0ka3oHc3NmPJoW0WIBHeeFBlLlBhlb+tt
         SXGfRN5OJwOKKNFb7oL7yBGKnDzydkXjOBtlrnpi8kv2uFlH5dhiM2/f0Ib4XIU+2hVS
         OXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803550; x=1750408350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J405qXIsAkaaQ6HHUqff/iiQgjpmkZvb1eF2OKZ5QAQ=;
        b=DR3L33XHG93veQA6+ZYcO66tWjBAHVLAwP4Odmy7TbxteRneiIC3DztMX8tC9Qwlq/
         6HAUNpm20ddfWyNIDiHj959RvLRZLj9Q7YjlsXKtEIjemCPuOIeAPswZCzJah96h6XTS
         7fmnwofPt8l3uULjKv1r35r0Dida0bPfv39M8Yoa5UARxq0VGmsgzfUINZyakp1xz0Z9
         TSeLoE8mtw5clcDDXYhk5tVxARwWSpvdeCrC289zE13gwU94FBMCUfoY4t4hdDhAYOmf
         fG6OvK0KdgRCUMoAEhteaQZVmldhWEhMzKO5Xhdjpv1k9eF92H6l3bTnXAzvgZ+ET2bf
         vfSg==
X-Forwarded-Encrypted: i=1; AJvYcCVKEiR9dCdBtQXZYd3aWsbZCuTvKAITMZcFoUvIqrEd0jkVPhj/qIJXWq6bS/rOVKFj62qe2PDRxr3FTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwufADagQXeO7wS/lHqmA2wZZXDD51fyUeVyY1eZfK2ZS91LhP
	g4hLeePjbtM2naaGntWRgHQsy2jV7j9TA5DUWL8zu/yEyAeVt37jW0zweZyMXBcrcFjsU02xqL6
	HzKX0S8BY77saOQubFByoYLNslyohHHUJeaafRMktlg==
X-Gm-Gg: ASbGncskVRNk6XSww9xrXOBSOoVaRZDB4133N0nQx7e2nelt7rN9jFj7A4erVAYYaIB
	Dv8ESowfaH0RMJAQNCWKLmvG1mbipbEtT+5It7iy+sYFwbyLb28xMrLTXQvYlWzqzMhm5qLwL/L
	ng7pxl5VMv7HosqZ69bXXO4zIaZhrD9RIYi4TMhJYmrYk=
X-Google-Smtp-Source: AGHT+IGjfqmGHZ++E68u9IYFbwPPPlA9C6cYjkbz7TN8o82wVreUeiUObDw9xsR+IrjHsi6gsVp6xiPba2TUT9U8KZw=
X-Received: by 2002:a05:6102:38cc:b0:4e5:a0c9:3579 with SMTP id
 ada2fe7eead31-4e7e39d8353mr404443137.4.1749803550411; Fri, 13 Jun 2025
 01:32:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
 <20250606-pispbe-mainline-split-jobs-handling-v6-v7-2-46169f0622b7@ideasonboard.com>
In-Reply-To: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-2-46169f0622b7@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Fri, 13 Jun 2025 09:31:56 +0100
X-Gm-Features: AX0GCFsyTraf_uRc2iDgE2HwWNjYCrPi2Mep05YPCt_X0Mktt-KufxERnc7iduU
Message-ID: <CAEmqJPod6cKh2z1f4qFatcAdQ7m1GoBNQrYVESHb1UehNv1c6A@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] media: pisp_be: Remove config validation from schedule()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo,

Thank you for this patch.

On Fri, 6 Jun 2025 at 11:29, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> The config parameters buffer is already validated in
> pisp_be_validate_config() at .buf_prepare() time.
>
> However some of the same validations are also performed at
> pispbe_schedule() time. In particular the function checks that:
>
> 1) config.num_tiles is valid
> 2) At least one of the BAYER or RGB input is enabled
>
> The input config validation is already performed in
> pisp_be_validate_config() and while job.hw_enables is modified by
> pispbe_xlate_addrs(), the function only resets the input masks if
>
> - there is no input buffer available, but pispbe_prepare_job() fails
>   before calling pispbe_xlate_addrs() in this case
> - bayer_enable is 0, but in this case rgb_enable is valid as guaranteed
>   by pisp_be_validate_config()
> - only outputs are reset in rgb_enable
>
> For this reasons there is no need to repeat the check at
> pispbe_schedule() time.
>
> The num_tiles validation can be moved to pisp_be_validate_config() as
> well. As num_tiles is a u32 it can'be be < 0, so change the sanity
> check accordingly.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Naushir Patuck <naush@raspberrypi.com>

> ---
>  .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 25 ++++++----------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index b1449245f394..92c452891d6c 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -588,24 +588,6 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
>         pispbe->hw_busy = true;
>         spin_unlock_irqrestore(&pispbe->hw_lock, flags);
>
> -       if (job.config->num_tiles <= 0 ||
> -           job.config->num_tiles > PISP_BACK_END_NUM_TILES ||
> -           !((job.hw_enables.bayer_enables | job.hw_enables.rgb_enables) &
> -             PISP_BE_BAYER_ENABLE_INPUT)) {
> -               /*
> -                * Bad job. We can't let it proceed as it could lock up
> -                * the hardware, or worse!
> -                *
> -                * For now, just force num_tiles to 0, which causes the
> -                * H/W to do something bizarre but survivable. It
> -                * increments (started,done) counters by more than 1,
> -                * but we seem to survive...
> -                */
> -               dev_dbg(pispbe->dev, "Bad job: invalid number of tiles: %u\n",
> -                       job.config->num_tiles);
> -               job.config->num_tiles = 0;
> -       }
> -
>         pispbe_queue_job(pispbe, &job);
>
>         return;
> @@ -703,6 +685,13 @@ static int pisp_be_validate_config(struct pispbe_dev *pispbe,
>                 return -EIO;
>         }
>
> +       if (config->num_tiles == 0 ||
> +           config->num_tiles > PISP_BACK_END_NUM_TILES) {
> +               dev_dbg(dev, "%s: Invalid number of tiles: %d\n", __func__,
> +                       config->num_tiles);
> +               return -EINVAL;
> +       }
> +
>         /* Ensure output config strides and buffer sizes match the V4L2 formats. */
>         fmt = &pispbe->node[TDN_OUTPUT_NODE].format;
>         if (bayer_enables & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) {
>
> --
> 2.49.0
>

