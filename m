Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D282489459
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 09:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242302AbiAJIye (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 03:54:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242562AbiAJIwb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 03:52:31 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC86C06175A
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 00:52:30 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id x4so117937wru.7
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 00:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=7tTaowZcd+yKGTZnRIkHM336ymL+1YhFZQMhsGSxmI8=;
        b=dP1tpSRUWLKR2NoA585ybqCiHdKgUw2CG3Vc0HeYVCs+AJaJZ7lqHdQPimW5eZCL35
         +QgP8xWQL8EnQpH/jpkGNVZM9JTCA93d6YI7CKfQcQZBZwZK3buYHCUXO+LZp1tDIDm+
         U1vqpGpCc8yVjprEr6hRmQsL2E6+EL9xyrA1OQyDjM31JZ1jN6Mz0z62/OXOGxrsFpLK
         WbR8/Cx+C06zyoFXziOjFsHz5k+NucQqSYM6mckjWhnKcbg7N1dgjwhHzJVWSTAs/VXv
         XLeSnk7fg7xOf5Cg7lhh655ACDccMsElHkzfL5Ju4xVjCkj/F2WpS+8g4nx7MWVQk6Il
         GIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=7tTaowZcd+yKGTZnRIkHM336ymL+1YhFZQMhsGSxmI8=;
        b=CpkByzZgQIpnuQZEafYh0DOnmzo/kciO+pRqiOlXQEHDMkLBHVOV+729uwiSXloS52
         JTPB2HDvdSfOECqh2adI7zMHskmNhVz6tXgT7Yz+EY3V4o+7lss/TRxlzXOuzFwgBKQk
         GVlJNNJXXwhRNjJ9nWmltJzpZeVo0eqfrxrEIuITRBa/FLPiB6MuGgVD3/4NHoBgaNbP
         4AwUMxQ5ISA4Onm4aMLCwOXch+A3W94gmvmFlzqQyqHm2k/yBWMqEMq0YbFo6xEWoFnt
         sm9uBoZbx5kIwX2LnmjbDN6ybNHrtAow8R1+HAvJxj3fM7Gn2j+1XILEL3F40kpYJ916
         StNw==
X-Gm-Message-State: AOAM532hY/IenKGfTLKHGf+cxpDWgYXzoQQRDaVooI2gKawe3p8/79zP
        Sc6/Bl0PmIKmhE/ITivaFyY2AQ==
X-Google-Smtp-Source: ABdhPJx9mEAIQZKDTiYifFiDt6xHrLDy6EY0ffgzzA+JHQiTY0PXsY1Z9peBiKtmdtGxDHaXPsTF2A==
X-Received: by 2002:a05:6000:1c09:: with SMTP id ba9mr11533320wrb.700.1641804749228;
        Mon, 10 Jan 2022 00:52:29 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id p13sm7150084wrs.54.2022.01.10.00.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 00:52:28 -0800 (PST)
References: <20220107115401.31698-1-laurent.pinchart@ideasonboard.com>
User-agent: mu4e 1.6.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v2 0/3] staging: media: imx7-mipi-csis: Small improvements
Date:   Mon, 10 Jan 2022 09:50:54 +0100
In-reply-to: <20220107115401.31698-1-laurent.pinchart@ideasonboard.com>
Message-ID: <1jczl0otv8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Fri 07 Jan 2022 at 13:53, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hello,
>
> This small patch series contains small debugging improvements for the
> imx7-mipi-csis driver, as well as a fix to make entity names unique for
> platforms that have multiple CSI receiver instances (namely the
> i.MX8MP).
>
> There's not much more to tell here, please see individual patches for
> details.
>
> Laurent Pinchart (3):
>   staging: media: imx: imx7-mipi-csis: Dump MIPI_CSIS_FRAME_COUNTER_CH0
>     register
>   staging: media: imx: imx7_mipi_csis: Add timings override through
>     debugfs
>   staging: media: imx: imx7-mipi-csis: Make subdev name unique
>
>  drivers/staging/media/imx/imx7-mipi-csis.c | 44 +++++++++++++++++-----
>  1 file changed, 34 insertions(+), 10 deletions(-)
>

For the series
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

On imx8mp:
Tested-by: Jerome Brunet <jbrunet@baylibre.com>


>
> base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c

