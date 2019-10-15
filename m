Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDA5AD7150
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 10:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbfJOImX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 04:42:23 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36774 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728808AbfJOImX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 04:42:23 -0400
Received: by mail-wr1-f65.google.com with SMTP id y19so22768314wrd.3;
        Tue, 15 Oct 2019 01:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=Alk2iYvP1zhS1Vsxyz1ENDltR7DNnK/DdAFNKV0PUVw=;
        b=HPC6BuNV8j9u4GZjxKCxoY5RREbeSrCviqnJSe7bX9+Mz4/Ou/Y9YJfCz9D6x5YDJN
         FPfze7R3WjjunFuZ7BTxjlj9zeZRJzIv5QwElj6bGpHm80r1uAkybYsje5HSVM+2NFwg
         okWGBK3N+IHtYpPvyQqh8PWgleHiWLfaTVIU08wX80EZFskkvb87rkGeRvnDWfk89KCu
         IgJWRobMxvlThOjJFQ8cTYimw/cyOOpegxEHHwfkSkuivf2kzEL9dFf5lp0/093hBmrI
         I+I7fkoLrJo0gxg6wqlRIw4tvg+AF768tPLChUkL43L+S3EzP1I5VV2vB2RtSVkqAj5v
         MBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=Alk2iYvP1zhS1Vsxyz1ENDltR7DNnK/DdAFNKV0PUVw=;
        b=ps/EiD5Oidh1J1DYTls4Dg/ok70CqpyMgwosf4Ev8vje3zAAcWFGSFUQKcDMMCuOZ2
         E4gOzmaMS57165hpzIyMDLXg0JHYK/XlnAKxew8Y1/Z+LB02iJkowftxzRjs+3jrYQkj
         my57eYoD3x/cU/UvP33m1i60NCxyJnfano/A9PvQ9kJIgFRZDOzy+a6RdSkhC6po6WEW
         YP0Y46s4MU2HOTim2r0flgrYTSvQdr+T9D77v9EoWY5Gsg01OPfFb5CdMP4WYnP9SMPU
         ANPXSa14Sc3P/46O98BqxI+iXvVsFLRbiuQ+vKLlmq75k5xGwsQQC86TGgIKfJnswkJj
         ipaA==
X-Gm-Message-State: APjAAAUf9stWBnSgpXNiEHurro8O/Zvfhrtu0flPLWO6R+Eg1PbitrvP
        MkEXm6TkLqXDIxODwoOseu6jojrj
X-Google-Smtp-Source: APXvYqx2bycIPnDtHKFh/xJsJXsS+Tg6XyXhmAOeu2Ar9KLDQ3WxO6d6EJTK67tMcZ2zx3XYKeedhw==
X-Received: by 2002:adf:e40c:: with SMTP id g12mr30931259wrm.216.1571128939235;
        Tue, 15 Oct 2019 01:42:19 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id u10sm19454220wmm.0.2019.10.15.01.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 01:42:17 -0700 (PDT)
References: <20191014020847.9203-1-hslester96@gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx7-mipi-csis: Add a check for devm_regulator_get
In-reply-to: <20191014020847.9203-1-hslester96@gmail.com>
Date:   Tue, 15 Oct 2019 09:42:16 +0100
Message-ID: <m3sgnuv1qv.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chuhong,
Thanks for the patch.

On Mon 14 Oct 2019 at 03:08, Chuhong Yuan wrote:
> devm_regulator_get may return an error but mipi_csis_phy_init misses
> a check for it.
> This may lead to problems when regulator_set_voltage uses the unchecked
> pointer.
> This patch adds a check for devm_regulator_get to avoid potential risk.
>
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 73d8354e618c..9a07b54c4ab1 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -350,6 +350,8 @@ static void mipi_csis_sw_reset(struct csi_state *state)
>  static int mipi_csis_phy_init(struct csi_state *state)
>  {
>  	state->mipi_phy_regulator = devm_regulator_get(state->dev, "phy");
> +	if (IS_ERR(state->mipi_phy_regulator))
> +		return PTR_ERR(state->mipi_phy_regulator);

This regulator is marked as mandatory in the device tree entry,
however it looks good to me to have this check, even because it
can return -EPROBE_DEFER and we need to retry.

But for that we may need to extend this patch to make the caller
of this (mipi_csis_probe), to also really care about the returned
code.

Cheers,
   Rui

>
>  	return regulator_set_voltage(state->mipi_phy_regulator, 1000000,
>  				     1000000);

