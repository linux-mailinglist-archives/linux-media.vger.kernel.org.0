Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8C6F493E39
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 17:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243264AbiASQVT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 11:21:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243161AbiASQVT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 11:21:19 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6BDC061574
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 08:21:18 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id a18so14471947edj.7
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 08:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=WbJAQo5PBKuN2xuUG9Xid6nJueGIdv4n1jo0i1Lk+MI=;
        b=E6wjQLpVMmt4HmgVGZbZJ+VaSGdKfNAoBK2RyCDnCpsZeES7AAznL7pG10Octw76FW
         +jpzDKISr2Z0+xKDrpPdLy47S7E02dYT3zIB8Oh56LlTZKrS9rMlg0/1rHWzfqffi3T9
         BlrIlFwfvRNxTlPftFarDYo1Fg3duNldoZ/TuN1ApkCDYYVbs02kUyiJKWQ08cDOLFwL
         NfyfKHWTqdMMA2eTadFp8T4acTfAepFzy/Id2+bQhVmG+KBT8ylZjzZ7OXZntz8ZMn4p
         Rw33CQffFBZVq9W5gxX4/0Wbon9MAOraU+nvF2R6Fjgip/jMW5F0rdpFkBDSqX27Tbny
         oVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=WbJAQo5PBKuN2xuUG9Xid6nJueGIdv4n1jo0i1Lk+MI=;
        b=rkE5hx+91pzzwaOOgsH44gvvBthgXMXsgmzGkLQIp5dYYbZOYyKDUERufZitAka8cX
         OPIVh90MyvRTWi5zw08ZKOP5DJZy72NjzvUKFjXNFNVbDUEeRNYjj6G/avr0mv5U0y3q
         Kjq3mQKTBPVaBAreekj1HidAo+Gh5UCl7FCazOp7P9Ve/+j7A0GrIoIjN9nBKKs0Om12
         vgkw+ws69mTqP82mGyUjjFR1U/6+qPLbPC+5uycuoOQdUmXSFUaZfL4KxXzC2wKkWhQb
         OdJXrwdJ0JQimLE9XUuRnNNif9p+LzMC5+yR9HcqJcJDq9Vc6epus4PztrCDQ7KJsP9x
         QPmA==
X-Gm-Message-State: AOAM532WCyMnFrl7+AOAIb+2hkVEcW/XwjFXmPCFGaB2qTYiYJLJ6Cfx
        IZIEfEIvQc8Q8AyeY0KMLRI=
X-Google-Smtp-Source: ABdhPJxT/p7q56mJfBi4s27m3z9r4dPfE1Ut/IakWUJK/uByLU4u4+E7kcCgbtISXp3GgeGKVy5Tow==
X-Received: by 2002:a17:906:9b87:: with SMTP id dd7mr24718769ejc.126.1642609277339;
        Wed, 19 Jan 2022 08:21:17 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id my25sm44807ejc.100.2022.01.19.08.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 08:21:16 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 19 Jan 2022 16:21:15 +0000
Message-Id: <CH9SE3SLDYEU.2M560Q0RQ0L3C@arch-thunder>
Cc:     "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 0/2] staging: media: imx7-mipi-csis: Two small fixes
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Jacopo Mondi" <jacopo@jmondi.org>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        "Jerome Brunet" <jbrunet@baylibre.com>,
        "Steve Longerbeam" <slongerbeam@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>
References: <20220119112024.11339-1-jacopo@jmondi.org>
In-Reply-To: <20220119112024.11339-1-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Jacopo,
both patches LGTM.

I only have one nit with them...

On Wed Jan 19, 2022 at 11:20 AM WET, Jacopo Mondi wrote:

> Two small fixes for the imx7-mipi-csis driver.
>
> The second patch is required to correctly capture in packed YUV422 format=
s
>
> Thanks
>    j
>
> Jacopo Mondi (2):
>   staging: media: imx: imx7-mipi-csic: Resume on debug
>   staging: media: imx: imx7-mipi-csic: Set PIXEL_MODE for YUV422
                                      ^
                   here should be s (imx7-mipi-csis) on both patches

Maybe Laurent could fix the typo on the pull, other than that:

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui

>
>  drivers/staging/media/imx/imx7-mipi-csis.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> --
> 2.34.1



