Return-Path: <linux-media+bounces-511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E967D7EF453
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 15:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A099A281319
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 14:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14B136AE3;
	Fri, 17 Nov 2023 14:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="I6/MqjFi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3C3D52
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 06:20:46 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-dae7cc31151so1879243276.3
        for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 06:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1700230846; x=1700835646; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QqfRrOmqkNnMsc+4XeEiKj5UgmTdWogQhQ0SioHxUrk=;
        b=I6/MqjFimjRQLYoq1CjxgLCmuXfvoBw6KpC0Cd1Uo7eWhxhh8Dn031rBQ3KlmHj6gT
         ISMmQazkU0ZtvFXp2VAqXVlO5MyENYTo7fP05ABynpszWT6KP9HmpFXPhqrF/29Pj4/y
         zjXQqDQtYwrGc1ydZYhrzLiwDw5MT37YKLqEtEOq7mB7rRKE8WJ3RMePKqPluP0gCrBi
         u09moqsPcRwYC634a+AQwN1QqBaAsigCoomVwLM7z3k10mPq179ekQcDRjdlZ9t6ANsh
         J1gDS84Prmsb26yILtJD8Tg2xQQnvw+5lY6w3F97ow97DUffhgl5ODuMjoPcEJegZVZV
         WAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700230846; x=1700835646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqfRrOmqkNnMsc+4XeEiKj5UgmTdWogQhQ0SioHxUrk=;
        b=Dtlk6CJ0TRFpWhKcSk0qT068ebutskP34WUDVtQcZ/ib+Lcoy6Pd+bE0OkVsQDhY8X
         hCD+/iXQh+sNX56wXxDJM43eK0PCMyE1e5BatoMfMt50zqapSgbyw2kC1TWPGSQfkd15
         2t+O7mAcmz6zsK7TMKzeX2NhoIdR1/7eXXvnvqUQ8siIMheEFFUon9iTWUd04mid4PI/
         mRaGxT2aw6vXKkkTeW5r4TohON93WWZWmZ+HnprsFhILcLCh8bqoKYGB8pLYfIl1CgHw
         09/rfr9w6O4ACM0Plm2pQ+qHtXJpG+VLsonV4QRhkJwBgyFCTYU7h9NUWs6sjjQNVH53
         0raA==
X-Gm-Message-State: AOJu0Yzy2rFvpyq6aKwSqwqV+CwSjzrMZVuYBDPM7AQUB2jyktHTXrxk
	mb3e284TuKyBMzlURCgqmjfXy5O2nalc5EpliOPuyg==
X-Google-Smtp-Source: AGHT+IHMnrHXK4dmqlaEzqJtFeu5L7T2FUQK7w8EIWeDpCtXSts/6xCjGig3pZzHXNzOQVvQNXrMcVKIUuJ/FWN6Plg=
X-Received: by 2002:a05:6902:1243:b0:da0:c744:3211 with SMTP id
 t3-20020a056902124300b00da0c7443211mr21609926ybu.2.1700230845947; Fri, 17 Nov
 2023 06:20:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117111433.1561669-1-sakari.ailus@linux.intel.com> <20231117111433.1561669-8-sakari.ailus@linux.intel.com>
In-Reply-To: <20231117111433.1561669-8-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 17 Nov 2023 14:20:29 +0000
Message-ID: <CAPY8ntA+J=TvW-89p6nwFjGUvJGy8VmqZSHO9PmuBqhn4VgfTQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] media: imx219: Put usage_count correctly in s_ctrl callback
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, linux-media@vger.kernel.org, rafael@kernel.org, 
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Nov 2023 at 11:15, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_get_if_in_use() returns an error if Runtime PM is disabled for
> the device, in which case it won't increment the use count.
> pm_runtime_put() does that unconditionally however. Only call
> pm_runtime_put() in case pm_runtime_get_if_in_use() has returned a value >
> 0.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 8436880dcf7a..9865d0b41244 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -371,7 +371,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>         const struct v4l2_mbus_framefmt *format;
>         struct v4l2_subdev_state *state;
> -       int ret = 0;
> +       int ret = 0, pm_status;
>
>         state = v4l2_subdev_get_locked_active_state(&imx219->sd);
>         format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
> @@ -393,7 +393,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>          * Applying V4L2 control value only happens
>          * when power is up for streaming
>          */
> -       if (pm_runtime_get_if_in_use(&client->dev) == 0)
> +       pm_status = pm_runtime_get_if_in_use(&client->dev);
> +       if (!pm_status)
>                 return 0;
>
>         switch (ctrl->id) {
> @@ -446,7 +447,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         }
>
> -       pm_runtime_put(&client->dev);
> +       if (pm_status > 0)
> +               pm_runtime_put(&client->dev);
>
>         return ret;
>  }
> --
> 2.39.2
>
>

