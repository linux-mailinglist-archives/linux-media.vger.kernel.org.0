Return-Path: <linux-media+bounces-34255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEF1AD0391
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 15:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EC76174BB2
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 13:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BCC289375;
	Fri,  6 Jun 2025 13:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJrGDiwm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46EE288509;
	Fri,  6 Jun 2025 13:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749218175; cv=none; b=aKEFGMtmFXm/9qGYyLhXwsWYCyGlLl3c4qCz5f4Zv298wW2W+q9f/Ek5mLi9s79DfjkpDjwdHkhXrC59wKSXGpR2Z5u2LZ8syyyUXKSJqwroes6Bxd+AiyvSk9sC1xiQBEUkpEBQhrKyPKIdHBFRBbaVnpKoWJZvaGACZvYYe1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749218175; c=relaxed/simple;
	bh=qN+pnPVxT4gL2Vpc8rdlce79GZAw4gPEct3l5HddHvM=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=cPAmAe4ipbr2rN2UOIdHdzml649/yybLKd7x3Dtpx+RgFO0Kl9YJPvTXcrYFf43p+xgQJp0/CLliIjUBl8K16gZmxAsdmemlvQ2g54CniNO96ud+ejyip4FWCJCLp5C8P8qcY7zx2lqd34scxoojFehxp1swuf7nlZtXUbbev0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJrGDiwm; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a522224582so1316835f8f.3;
        Fri, 06 Jun 2025 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749218172; x=1749822972; darn=vger.kernel.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D02VVevmOF3cQxFCCzf3uOD2IZ0DFegRFrqZJe6cxu4=;
        b=GJrGDiwmI/jJFLi2Vx6vPmO6jV9AYnGaSS/6u7GiWShRmEd7quD1EjVbieAg7cM91J
         p25iNtOeYZpdyOEP7PuDdxtLQ5C0f4nTb++qZInWzo9gvYTtuxiK+cGlP78GFMHXdsi2
         gnmZsw6jk6UeaI6kCd9PEUPyxBFJVhg//QoD9t1mTYo7NWcpI3/NPtuvfh2MaQO11sp8
         KeAK7PyeFo7dr5J0Xf5ZNpEsT4swbL+DoAfuSr0lJJ3IWd81EgQS9MNWOYGRfIZfkVf1
         z4ob/PZnnVBI6cYo79emGsrEnjRqI5pmVQ1FwYow5pX78gK9hy4npLz4EhvyMOeL2DkV
         WBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749218172; x=1749822972;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D02VVevmOF3cQxFCCzf3uOD2IZ0DFegRFrqZJe6cxu4=;
        b=TprQoFvNgfcOAfaGyvuF1isCAryoegyUieIuvypfovCECuebTkzIeEcADhSg3SqP3T
         N4X5b7ZtI8RVXCDtCERus/Om2AOqpHPX830phHrVz4S+qIr6ye+SJs84rzvy4tRzgEr/
         0iUOq3bLDl7ZDgJPqB04AkfMofXyWiHoqTe35BfyJA/Y9SJ2p1KCLQa2WFszzkbAjSCx
         prjM3qsLyhV7TR/oiR5I6JEYzqPBSiSSw/4eNEqu2WEhtj1vid5IfbcnTCXHkqyDXrj7
         1c5jTbrUC90kRZYRqHFJkCj8tJ8gWxQmBwSQjQFjeGjHuKobu3klILcA/0vRh6n/iQpZ
         JCgA==
X-Forwarded-Encrypted: i=1; AJvYcCUkJQY1iYGIZUkP/43Mv1+48NWo2hlZGRzZqQgT2pe3Q65xh4MeEeasY+uPDIuDRD4C9kIylo155+OrhJw=@vger.kernel.org, AJvYcCV90iGaHxEplrLu74mQoIqvQBCH/foM6MXRORVUEL6JGmc+tly4S+RVuV1nKWkwDGUH1vjGenuL5bxiRoc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0vTgM4JWvqUCYgkOczAo+PDp7VhLibbsmdrcncken7/K2xOS3
	lJPi1FHPDA0kWtkGtDnBRXSw3Q8pk85oV4XRY/P1gron9rg6FCSbTlni
X-Gm-Gg: ASbGncsdetz/lsCbb5Q33l0zq4OzJn8T4TvkhVMZur6JFEHkd9jxNncpzAjN3VQkrNV
	adfG/j798kp6mO5XlPoQbsNik3iwkLWDKoVXGEAR0Ed11QnOiqF9vfAx6BBkFNjmoOftujIxwx4
	rf24v/NblmohDgV6TZcIF8p5gzK6/BmmemObovUq0nHRiw5KjUZ0Z5Q0ZVpw7E2m/jDjpi4lBrI
	auSPTcUtGyqoXjlKDSbZ89Y+wz7OQp3385Wc7oAH77kSuMile7KyNUPidWFWhG9hJMe7+kQtTNc
	0XAmFsd571dEQa8OrOuvzUrgxqHAqvbX0Rmmbz/ClFrdNwktNwJTq0Y5wny8xya1DDzMMBUCVzK
	m4QqlpF9Sbs+IKA==
X-Google-Smtp-Source: AGHT+IH/4Dz7vdItmgmTlnNXWLY79bYjxG+RnGnF5b/cbxCPhJ2PE6r5VIZGSsEVJ0iX7xCVJcwFng==
X-Received: by 2002:a05:6000:18ac:b0:3a4:ee40:6c85 with SMTP id ffacd0b85a97d-3a531cba357mr3281306f8f.54.1749218171799;
        Fri, 06 Jun 2025 06:56:11 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-452730d161csm21907155e9.37.2025.06.06.06.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:56:11 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 14:56:05 +0100
Message-Id: <DAFI37JD827I.KWPZ7XCTWPBD@linaro.com>
Cc: <kieran.bingham@ideasonboard.com>, <rmfrfs@gmail.com>,
 <martink@posteo.de>, <kernel@puri.sm>, <mchehab@kernel.org>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] media: platform: Refactor interrupt status
 registers
To: "Isaac Scott" <isaac.scott@ideasonboard.com>,
 <laurent.pinchart@ideasonboard.com>
References: <20250606121403.498153-1-isaac.scott@ideasonboard.com>
 <20250606121403.498153-2-isaac.scott@ideasonboard.com>
In-Reply-To: <20250606121403.498153-2-isaac.scott@ideasonboard.com>

Hey Isaac,
Thanks for the patch.

On Fri Jun 6, 2025 at 1:14 PM WEST, Isaac Scott wrote:

> The NXP i.MX 8 MP CSI-2 receiver features multiple interrupt and debug
> status sources which span multiple registers. The driver currently
> supports two interrupt source registers, and attributes the
> mipi_csis_event event entries to those registers through a boolean debug
> field that indicate if the event relates to the main interrupt status
> (false) or debug interrupt status (true) register. To make it easier to
> add new event fields, replace the debug bool with a 'status index'
> integer than indicates the index of the corresponding status register.
>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 64 +++++++++++-----------
>  1 file changed, 31 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index d060eadebc7a..bbc549c22aff 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -249,7 +249,7 @@
>  #define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
> =20
>  struct mipi_csis_event {
> -	bool debug;
> +	unsigned int status_index;
>  	u32 mask;
>  	const char * const name;
>  	unsigned int counter;
> @@ -257,30 +257,30 @@ struct mipi_csis_event {
> =20
>  static const struct mipi_csis_event mipi_csis_events[] =3D {
>  	/* Errors */
> -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" }=
,
> -	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported=
" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early Frame End" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early Frame Start" },
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error"},

Maybe instead of 0,1,2 (magic indexes)... we could give a meaningful index
enums names, don't know, like: main, debug, user??? or something that
you think is better.

Cheers,
    Rui

> +	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,		"Wrong Configuration Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_ECC,			"ECC Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_CRC,			"CRC Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,		"Data Type Ignored"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,		"Early Frame End"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,		"Early Frame Start"},
>  	/* Non-image data receive events */
> -	{ false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even fr=
ame" },
> -	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even fram=
e" },
> -	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd fram=
e" },
> -	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame"=
 },
> +	{ 0, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame"=
},
> +	{ 0, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame"},
> +	{ 0, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame"},
> +	{ 0, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame"},
>  	/* Frame start/end */
> -	{ false, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
> -	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge" },
> +	{ 0, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start"},
> +	{ 0, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge"},
>  };
> =20
>  #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> @@ -765,32 +765,30 @@ static irqreturn_t mipi_csis_irq_handler(int irq, v=
oid *dev_id)
>  	struct mipi_csis_device *csis =3D dev_id;
>  	unsigned long flags;
>  	unsigned int i;
> -	u32 status;
> -	u32 dbg_status;
> +	u32 status[2];
> =20
> -	status =3D mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> -	dbg_status =3D mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
> +	status[0] =3D mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> +	status[1] =3D mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
> =20
>  	spin_lock_irqsave(&csis->slock, flags);
> =20
>  	/* Update the event/error counters */
> -	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
> +	if ((status[0] & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
>  		for (i =3D 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
>  			struct mipi_csis_event *event =3D &csis->events[i];
> =20
> -			if ((!event->debug && (status & event->mask)) ||
> -			    (event->debug && (dbg_status & event->mask)))
> +			if (status[event->status_index] & event->mask)
>  				event->counter++;
>  		}
>  	}
> =20
> -	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
> +	if (status[0] & MIPI_CSIS_INT_SRC_FRAME_START)
>  		mipi_csis_queue_event_sof(csis);
> =20
>  	spin_unlock_irqrestore(&csis->slock, flags);
> =20
> -	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status);
> -	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
> +	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status[0]);
> +	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, status[1]);
> =20
>  	return IRQ_HANDLED;
>  }
> --=20
> 2.43.0




