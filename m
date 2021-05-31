Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B87395937
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 12:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhEaKuV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 06:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhEaKuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 06:50:20 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0880C061574;
        Mon, 31 May 2021 03:48:39 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id e2so14465783ljk.4;
        Mon, 31 May 2021 03:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lmFfe4/9OHeqy8i0LO2LfJg71Sl9QgC7tBKn0xjdl6s=;
        b=esvekV/ekFFVolx/NAxmBTCCS8RzRTW6m02M/eySbTEuEfUPIp4NZZQ5+oQ8m2coC+
         LMhSgM3XKyMUx46Mbf+v0EfRS89GQMyGb9/iCho9e4WBRflKg7yQ2A+tFJNK2+W4kOQ5
         FFmGga2/lMUKbt+DoYpCye1dWuD6IZRgN8mXZPRATZAVyeas+OoalGSP7JDKZNdOZHm1
         iOMgO/TA1FeXap7/zC04jdvrSrNE7b1poKKBtFSic5muQn+5vxBbQRC9aNQz8xLmTiiE
         tlJzYgRNnq8HpcgPABl3x66Is3is9Fxx7T/ijF26vzc3culzw/Ck0WCZc5lSJ5lUUt+A
         /MGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lmFfe4/9OHeqy8i0LO2LfJg71Sl9QgC7tBKn0xjdl6s=;
        b=UmBt/WtN7NbJ0wuyx2S2OznY2eL7Wp3vOU9F/4bxSSANDV6Nw/ajT+9Lf95vBI7Iuv
         GM0A6xT4TdPN+UM3jhDO2wUmChyWtAxk+K9Ev6WOMPthe3ccrd6+SaJtS+YrrqsDPsmr
         K/NHTaezqmtrNWFnallh7f2M2q8iyNRbtnj1yFoIsuaBzpWxGmEqYCfdDGGuGWkdbuAm
         NPHZx0XjJNUCYGRkYGD9Hfj2lfPywMF6zFkTV9IjDrfADP/w6WfQBx+hF77G+faaLZ7h
         EGJquEbrY1usidxLQ9fp0T71qm3wGJ2aV1Vde6oQp238LE0l0dFqwWGaRzXKSDD0WCqV
         3xWg==
X-Gm-Message-State: AOAM530LSB6hswfw2LzxNTYZqp7CKMwLdPrX3ChhxcZo1pk12YU91Nom
        0zFDrYdA+9/5v0JBFSkTLSTeGQdMH1qMq4DBOTU=
X-Google-Smtp-Source: ABdhPJzLLkD5MNOKZEm9VX06SK3/IgRQ+JyLH0lcamRMlwIJp4ODkDBlG3Bh8Iu9wPulB7c9KZ16Uuvo/g6z2xBK660=
X-Received: by 2002:a2e:6e13:: with SMTP id j19mr16281103ljc.116.1622458116706;
 Mon, 31 May 2021 03:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210530204410.676831-1-festevam@gmail.com> <20210530204410.676831-2-festevam@gmail.com>
 <0e5d7662-245d-d87b-c0bf-3cd0171af527@kontron.de>
In-Reply-To: <0e5d7662-245d-d87b-c0bf-3cd0171af527@kontron.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 31 May 2021 07:48:25 -0300
Message-ID: <CAOMZO5COoQuoJY-_nEXavSwKWnjmEXw5jOO3+n3ksiuKF0g4AQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: i2c: adv7180: Allow the control of the reset pin
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frieder,

On Mon, May 31, 2021 at 4:02 AM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:

> The datasheet specifies a delay of 5 ms between deasserting the PWRDWN and the RESET GPIO. Also this function is named adv7180_set_power_pin() which doesn't fit anymore if we also handle the RESET GPIO here.
>
> As I was recently working with the ADV7280-M, I came up with a similar patch: https://git.kontron-electronics.de/linux/linux/-/commit/3619ed166140a0499ada7b14e5f1846a0ed7d18d.
>
> What do you think?

Thanks for the review. I will send a v2 using your patch instead of mine.

Thanks,

Fabio Estevam
