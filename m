Return-Path: <linux-media+bounces-23782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC129F7B3C
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D56F188C43E
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 12:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA07224B09;
	Thu, 19 Dec 2024 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTPbqtUt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58832248B5;
	Thu, 19 Dec 2024 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734611112; cv=none; b=jrFTtbjsW20+fUfYUR4cs1IBX/c/OfqFHH1PyPhTu/5w4GFsEF2yuJ8tai/rPKcs/1P/NgcsbryTrHs0/MQbl53p4l5ypci3YV4v3YdrGXdd9HMIJcLOu5AFiMAocwd2LGH0PDVodLpG+/+HnLZEazb9VSzrvF7rYxhAIwgPOrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734611112; c=relaxed/simple;
	bh=16dSTe/1HotHqL4b8oFEMmkj/PlIM8xRMhKZwzN8JPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VoMo7BcQHfEFNsaj1btH8hBokJWksu6NhOSHp/No3J8odcF9HEEwSBVUmncsHdl0RrpL+gP0Tn4TEVHCs81kVEkVQfGXC7hX9cPHvVfMVSZ9oLkjuu/DZz/Q2xMbAytkKbXllr6jOfQQgl6r+Zeo7eM93j/B4MCH0aV5KXhuBIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTPbqtUt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B6DC4CED4;
	Thu, 19 Dec 2024 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734611112;
	bh=16dSTe/1HotHqL4b8oFEMmkj/PlIM8xRMhKZwzN8JPs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LTPbqtUtuloka6JTro+SPQojwXe08Ck67Xde4T93OZ8XNJJL5nCj1mD7hXTJmrzRD
	 PzkRQatjS//MSGqooNVS4QATsnKzyrYcH2xadO2Ld14jlmDBN0NxoWUYyqE8B8liRX
	 v9P5fhYOqXz2I2gYT0TBOgLkDrn2Dqy31RTj6Dm1x5UjBmMugD8ivia/OZUwFiPr3d
	 O8Q9ss4wjNu9MXYCUHyeqYiWtiKTzJ8q7jzYCeklJXBI6YU5sVswSWBVE4xUa4LeIa
	 mURu8qdAn7HJkjLw+U0VBaqjDW84ORHNsIjKzTvIz0yQDMMOMIejfWnSEtE5MyfFtL
	 srJw+37FwV9YA==
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-518c46cc6e4so227755e0c.3;
        Thu, 19 Dec 2024 04:25:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEDY///446McpyYXU5SAeCvmZLiTV/auR4bELTN7GD6Yim91gtLLYmwlo2KAkNXpDxRcGwnowowBymepc=@vger.kernel.org, AJvYcCVflGgNzi50sMHSs1yV0kbKeQmyWQRUUiIUhUG2wLEI6wZCchcwld3p+zUdsE5pBnzUCbC/7ApjLQ7C/t8=@vger.kernel.org, AJvYcCXHFXOdiRrROZJQy/LVTvjlPW9imsFUvNOvSpt9ScGZNmafAvgyLrwpDNYYZr2uoRaWq1pvW7AS6di2cGI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm/oO37Ng4EFeBoKcdJQh9kPZJtR9xLCWAy/c8TFqhEUvlNw6w
	s6/pigsDXw8NccbK3JZJh90g4+osPxN/AClxdr1RBYWBgtxl73wSx8QRUo4ImH707RGmGHltHLo
	0jIGn2JwWxXL51ZF5azKLbwzzx5M=
X-Google-Smtp-Source: AGHT+IFx76ig2GKLMwQkh9u/X4IQWuUW4Blg/83Co4YoSiN6/bSS4A6Ujq8kGHwdGD8qMOgLBrBTYUBrpyiGxoPexS4=
X-Received: by 2002:a05:6122:2518:b0:518:773b:39f with SMTP id
 71dfb90a1353d-51a36c780ffmr5606142e0c.4.1734611111491; Thu, 19 Dec 2024
 04:25:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu> <20241217-imx214-v5-12-387f52adef4d@apitzsch.eu>
In-Reply-To: <20241217-imx214-v5-12-387f52adef4d@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 19 Dec 2024 13:24:55 +0100
X-Gmail-Original-Message-ID: <CAPybu_3JgPF-p9jB3F+V5e0w6VHoCFsbWfPRiCEJw3kxCWCn_A@mail.gmail.com>
Message-ID: <CAPybu_3JgPF-p9jB3F+V5e0w6VHoCFsbWfPRiCEJw3kxCWCn_A@mail.gmail.com>
Subject: Re: [PATCH v5 12/13] media: i2c: imx214: Fix clock handling on probe
 error or remove
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 10:40=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> The driver should disable or unprepare the clock on probe error and on
> removing the module.
>
> Remove regulator_bulk_disable(), because it is called by
> imx214_power_off().
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/imx214.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 96d05acfeb66480770bb6291027dd023fdccb649..e8d35f8b0f8b57d64f03ff6f5=
ed9eac51a671e8e 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1340,7 +1340,7 @@ static int imx214_probe(struct i2c_client *client)
>         v4l2_ctrl_handler_free(&imx214->ctrls);
>  error_power_off:
>         pm_runtime_disable(imx214->dev);
> -       regulator_bulk_disable(IMX214_NUM_SUPPLIES, imx214->supplies);
> +       imx214_power_off(dev);
>
>         return ret;
>  }
> @@ -1356,6 +1356,8 @@ static void imx214_remove(struct i2c_client *client=
)
>         v4l2_ctrl_handler_free(&imx214->ctrls);
>
>         pm_runtime_disable(&client->dev);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               imx214_power_off(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
>  }
>
>
> --
> 2.47.1
>
>
>

