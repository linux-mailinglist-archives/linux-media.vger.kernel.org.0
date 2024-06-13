Return-Path: <linux-media+bounces-13203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 692EA907818
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 18:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3C60B24885
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 16:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0E5145B03;
	Thu, 13 Jun 2024 16:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="DZClKZ3z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A04A14198E
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 16:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718295513; cv=none; b=WdysXtqDGsxXw2RGskzm35wZO4H0SdmZ9GuIQSB7bNsPuv0uVFPLMWtwEF9YVli2R5sFtqSbJOA/5CgMs3tFzc1GRuM9HKshDIbu8p2PeEuacCqPXlLucCN22VJDxSU2+oyLrJiXxZmFWRHUHa+L4eSGAfWxZjcPR2Q4/2PW0y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718295513; c=relaxed/simple;
	bh=KZCa6znuMKXC8bkLoWWIPiVEbKqZN3WV5EwnSOH8WJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e90KlCJ3wLStDZYowyc0CrMheXaTNDlOdWam7qbaxnAkos9fm2W6VjpjCHVXGTT2p3ESSve3xYJjeAHQfSpLLuSP1gA3Ynb0EaZ2BRyqyKCNuq0Zse+8y1T9cc1nG0fVTUi6EaBO7qApGNi5RElczEjLNByKCvnggVukgyrcAxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=DZClKZ3z; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfef552d425so1602317276.0
        for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 09:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1718295510; x=1718900310; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GZBbzPtIS9puZD9LsDe5Aioc6E2UGfepOTkRRP9sOes=;
        b=DZClKZ3z+ATu1lMzTx7GBSAZidBtv/LCC3jJkRPgnpDPiug7a4XCXp9RRKvC9m+0tN
         ZKSjuXW91JL65khSw+o9Xzd/JLdCRQzdfPyEGWOqy3Dte8XpcvX2h/OiZQLZCyEpvoYb
         kUV+hHBPeM8YXvH5uMzlBwL+qCjcM8ncg2LWQAujcg23mYs2He5bubyrGUbn9R7v5IJb
         yuZCkD2Gzb4q1GuRWC1zMmKGxq1mhHnrsc8Vh+vsjsizrRaQBcC4iHGj9cypIlm02mCX
         jA5RoxYLSG6ZMBoVFtH8Y8Jx2+79JCM3w3ji14bRwnyRb+6wSL82HEHsKkQ+dezXh0/l
         6SuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718295510; x=1718900310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZBbzPtIS9puZD9LsDe5Aioc6E2UGfepOTkRRP9sOes=;
        b=A8Jn9dSrLZAEU1tsx7iue33seEK82t0hP//rGheRiTc5NXCe50GN0BqyzkW5dbwgaa
         xeAFhmvLyllXjnkb7B8rStPg6M2UGyGojI2UjAXTZRFq+diiph8P/qJmNJocfgAi3qEK
         NjWS5n2QAH91kW2D83eQKY63vTjO+6gRuuX55b5pUGskApzRccTUkllwNzU/5mxFdFco
         JnV7Sn/UchHhTcIKlSWJ/g1xaDJEAN9+bkzaQU+RjZSjl/g6HNtZFwW2Q19QASyMXyIS
         3HTEESt8qO9XpMTu/qlgv35CjJenlHmHwHPk388xocpiOk/8FcBhVxorY1hsDMW20erT
         my+A==
X-Forwarded-Encrypted: i=1; AJvYcCXWwbtJoEUqLLJxd+mOFslMi0vnx3TRHrX++SmhNngVVTdBk2s0ncY+e7XyldOocPXwXOfW4B/YiPBDke9r+VVvrbJABQtWth13GoI=
X-Gm-Message-State: AOJu0YzDwohwHdlLofRYBE505Z7r7YaQeKh0B/1eOGWGzrK8bbgTIZjZ
	WSSS8Q1mAADzdsoTvuj8EfeucKWyj5DkVxg/w+vBICrOkw00YZIgpCkXU13ByhBfkPhNjqIj/3g
	jsVb6g0ipVVXChiVmgNiLvXuoMoPiSupd7zJsUA==
X-Google-Smtp-Source: AGHT+IEZkQCpgQWnHPnqmV72SlpJSSYgy+aR2OvtQyA4oEofTAHLBz7bN09buIDJU6nT5s+qaUGywS58qIOzm6CBeeA=
X-Received: by 2002:a25:18a:0:b0:dfa:c4b8:630e with SMTP id
 3f1490d57ef6-dfe66a6574dmr4785136276.33.1718295510404; Thu, 13 Jun 2024
 09:18:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612105232.400361-1-abdulrasaqolawani@gmail.com>
In-Reply-To: <20240612105232.400361-1-abdulrasaqolawani@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 13 Jun 2024 17:18:13 +0100
Message-ID: <CAPY8ntDcSRbJL9q+RuVXU_CAw3QXLAqYrdN4D+V-B2Bdz4VRKA@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: ov5647: replacing of_node_put with __free(device_node)
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Cc: sakari.ailus@linux.intel.com, jacopo@jmondi.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com, 
	julia.lawall@inria.fr
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Jun 2024 at 11:53, Abdulrasaq Lawani
<abdulrasaqolawani@gmail.com> wrote:
>
> Replace instance of of_node_put with __free(device_node)
> to protect against any memory leaks due to future changes
> in control flow.
>
> Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>

Conditional ack had already been given on v1.
I don't know this new __free well enough to give an R-b, but it looks sane.

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov5647.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 7e1ecdf2485f..0fb4d7bff9d1 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1360,24 +1360,21 @@ static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
>         struct v4l2_fwnode_endpoint bus_cfg = {
>                 .bus_type = V4L2_MBUS_CSI2_DPHY,
>         };
> -       struct device_node *ep;
> +       struct device_node *ep __free(device_node) =
> +               of_graph_get_endpoint_by_regs(np, 0, -1);
>         int ret;
>
> -       ep = of_graph_get_endpoint_by_regs(np, 0, -1);
>         if (!ep)
>                 return -EINVAL;
>
>         ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
>         if (ret)
> -               goto out;
> +               return ret;
>
>         sensor->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
>                               V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
>
> -out:
> -       of_node_put(ep);
> -
> -       return ret;
> +       return 0;
>  }
>
>  static int ov5647_probe(struct i2c_client *client)
> --
> 2.43.0
>

