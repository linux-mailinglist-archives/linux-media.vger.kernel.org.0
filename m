Return-Path: <linux-media+bounces-47993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2234BC98AE9
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 19:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B5623A4A74
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 18:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF641338912;
	Mon,  1 Dec 2025 18:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="i+csOLP7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8531D338F26
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 18:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764612910; cv=none; b=YBHH2kJl4qH9VEfcuaQ1XUes7YMLLrUUQVZZ9ahuYUt8wCsq5iAjJ/L5vMf/UHPFNE+SpicQml14qbNmdSTvjp32+rY8QtdkNL8vpPrnKzCWosLdBzCRPnWvfVd/phfTLvJ+ElSbIuJiwRFoqBUIB4aof3lKJ4YkY0uLwAW++k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764612910; c=relaxed/simple;
	bh=PbH49j0ZTVvQjHQJAZoDELioZdmHLBOyGncFNujnu08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fic3mJP1PHveDtKKnJRK3z0SkgkE2k1RHhv9IDPCHmIj8hC71yt+DGlDr6RsFSSvS/iasAxXqjWhoT8CNy72TogGdCKBiRdb6N9TV0e84ZUdcG2uwTSTXdOVfi26D85LDijCoN1VQZWiqOCuZLXje9VASqJOEcbTlTEseW4lrds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=i+csOLP7; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64107188baeso4018007d50.3
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 10:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1764612904; x=1765217704; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9q/gHi/cwjgnuRyS6PTp/97BuNnYk5juGhAB9miRZds=;
        b=i+csOLP760LH71ZxCWkImd9Zkc0StKTSDbrgM1XLyfzTsHMfQEWDISGZCIW2Kqmj3v
         HFAgz47MrC3YHBOlSqm969W3CYXK1hX/l9rxRYmJWMC60cQd5oGAZKdMmxPa9GmYyjnw
         ueg2SjJPy6mE81UrGA/7zDEipGy4lHoZon7upjKtzNJbRNtv4okGOhnI3rimW/hXF/Ke
         gupB8NFBdHzcclQSMBhmKnQtXonCWxJykqQxqDp2Hj4S8dMeBJsQsAV7qpx6AaSNlt5l
         /meBC9f4gHUJzw6LEx6sNJWTr+twozuWAbvcUIXQrGhUi9qclr7S/kt/5Pmv8D1wcnQK
         hs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764612904; x=1765217704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9q/gHi/cwjgnuRyS6PTp/97BuNnYk5juGhAB9miRZds=;
        b=TITMbV/xdls7CzF9vO3KD4bxHZlbPe/0fdYHLNfKRFHeQ0BWy2yLlS9+IW1nrYm8t+
         YUsWS7tZaCdZj0VXmVq45q20tS4whMyaV5tmRagvxsSc0oNsXfIMYEicRC3Moc1Kv0qt
         de3yZMFcmtxb0k8lAuo896JbkceJIIf7RecKhMPV2geSlrHie+/jd7lCHXw3vQ++7T9g
         Nx8BRgP3NQzMGfW/f6PnigPRljBNvHGa5mbRbSJ1pv+GVewvPwGDvzdUIBqUspb7St7U
         jMeF4FtBGyFk39scMmnM5bTgNSBwvroA76EzoS8RXybiISUEEwGZFxJYdErIuNP+NTeV
         oGOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwa3UgzNF7HvOI5r/5RZrgk3AJY2Y4B+xEulDxQrpr0b5RE9afZ+40ZrUw8BdJYRSqQSa0/lYEw7jHTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcEpzWncnAJzppIQ2n6vFxbwKrTu7PC0lpF8xOK04ktWIO93Y6
	v7jN9iNCpMZmbeLTC3i/N4gA1L4p3JZsRfZj0+hgC1ZQ+PNUIAc1iyDF3KgwteMbyvsZFqdzkZa
	4e4vzPzeAeXz7WV+O555jUgtf0mE1DU4j1S8l/RE/smd5vnRCcXUy
X-Gm-Gg: ASbGncu3TjRvteQrvkZF/eC8jJo3MVl9CQpnjIDlwo+TQ8RXPTDM5x6PmUTa/9QwRZX
	cXMYcWtwAzru5sg+V6pMoiMKBM2otDCMR3mjMSD4DR9Gtd25DfVT1MUqYwFTKHhC6DSF3oR+vyJ
	6gMaKDWcSFdRfpVINxanU9hduxz9K5tCu8Dtyl5ShCrU+HbNn256VxF7XH7ojYfJvVHXmeJBji/
	cy+fSvLJ8dpnRoZP8DOYvY4aEzx+rXWMlMtcF5oHvQ0yGRUrJB82MbauCJ1rzfK5N1CEn63o2tm
	591K012xv9w3itYVxANfACocd2k=
X-Google-Smtp-Source: AGHT+IFG13I7SnNz43R9FDqrgF7lxe37t0jxwWKIsZF7udKqvdfH56qGVFwwF2BUQ7EMpPTg8J6LAFAciWMvuM3aP5g=
X-Received: by 2002:a05:690e:1301:b0:643:1a5f:aa58 with SMTP id
 956f58d0204a3-6431a5fab77mr26259675d50.62.1764612904399; Mon, 01 Dec 2025
 10:15:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com> <20251118-b4-rpi-ov5647-v2-15-5e78e7cb7f9b@ideasonboard.com>
In-Reply-To: <20251118-b4-rpi-ov5647-v2-15-5e78e7cb7f9b@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 1 Dec 2025 18:14:47 +0000
X-Gm-Features: AWmQ_blJq0JRp3Hba56gdmupmAepJMsZpG9Hggm882EKMaKajdCnJGR6vwhMSMA
Message-ID: <CAPY8ntCGnTNk4Bk5+QRV45jD7nfqZOToZ260YwfbvTQEJR7DFw@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] media: i2c: ov5647: Tidy up PIXEL_RATE control
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Naushir Patuck <naush@raspberrypi.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Stefan Wahren <wahrenst@gmx.net>, "Ivan T. Ivanov" <iivanov@suse.de>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jai

On Tue, 18 Nov 2025 at 12:04, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> The pixel rate control is marked as read-only by the framework itself,
> so no need to mark it explicitly in the driver. Also, we can set the ops
> to NULL to avoid checking for it in the s_ctrl implementation.
>
> Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov5647.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 3a2c25a6b6808bf1289a2357ac5b79bf6bf99daa..71107d74f2900b39233a52b29a229282bd087963 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1195,12 +1195,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>                 ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
>                                    ov5647_test_pattern_val[ctrl->val]);
>                 break;
> -
> -       /* Read-only, but we adjust it based on mode. */
> -       case V4L2_CID_PIXEL_RATE:
> -               /* Read-only, but we adjust it based on mode. */
> -               break;
> -
>         case V4L2_CID_HFLIP:
>                 /* There's an in-built hflip in the sensor, so account for that here. */
>                 ov5647_s_flip(sd, OV5647_REG_TIMING_TC_H, !ctrl->val);
> @@ -1267,7 +1261,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>                           V4L2_CID_ANALOGUE_GAIN, 16, 1023, 1, 32);
>
>         /* By default, PIXEL_RATE is read only, but it does change per mode */
> -       sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> +       sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, NULL,
>                                                V4L2_CID_PIXEL_RATE,
>                                                sensor->mode->pixel_rate,
>                                                sensor->mode->pixel_rate, 1,
> @@ -1306,7 +1300,6 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>         if (sensor->ctrls.error)
>                 goto handler_free;
>
> -       sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>         sensor->sd.ctrl_handler = &sensor->ctrls;
>
>         return 0;
>
> --
> 2.51.1
>

