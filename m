Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1633C5FF6
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 17:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235602AbhGLQCI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 12:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235280AbhGLQCI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 12:02:08 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886B0C0613DD;
        Mon, 12 Jul 2021 08:59:18 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id a18so25017804ljk.6;
        Mon, 12 Jul 2021 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PX6KW4lc9x9K8noyu3cbkpq9sdGp+o7RACRY5BiJWvg=;
        b=USRxGpd0bN6j42j6oUGoVfM1c914AgaLvvaZEUZ4ZuJybrgMMxwfRm9/l/TqozauF2
         HauZyhVLLWpomYlq/s+7Kn8LG3fDNQo8shd42HiucU3lIQOlZxsP5hhtLGq69PNkmyH3
         Q5iKIjOvxRbAHyAUTN1IVzYKQLnqCTOD5y4JWztxKNAk9d+DcUbFHwdM082IZMXZxdVv
         Ch8Qt72/tkeB06ST3a4R0LwkAP+3HwmejbyXihCg7crkjVFsGklaA/lK5xjuT9Vzlguz
         Ku3EnOpWOE5cWRbdhjkdjTSlnFKRPS+ETND3Ilb65B3nmosd1/5WC9xOtZnMQzpg537Y
         Jy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PX6KW4lc9x9K8noyu3cbkpq9sdGp+o7RACRY5BiJWvg=;
        b=dk3khLQ2sgF8+zmRkno7vRh1JKBTrWDArHkFmyW7YehQKavrZA3tcraKtMfZJPQbIv
         vnmr2JsP/AmLaT/b7hn0Cd3MUoan6tQz0BbBwHBFSasNBCfxpt9gpE1UHhh1b0AwTdsH
         wVC7j690pHo6HD8kDMYxSEfnmY5bTaiXvELBQMYZZBdDlz+KvxwycSlEA6UfqcXOK5pe
         a+ePxGX+U1XraFjETRsay/k1+Q0EInhyI4VM9VeLFPcIWrAns78r+uA1kifYg994qJoc
         mbnbhMbWKWFZWeyuxDCazpJll+6d7IluayFvZFKtDvZ7FmU6Gh/LKZ8ITrvP/wbJ473Z
         gNQQ==
X-Gm-Message-State: AOAM532bgKFyFNjFf+96kA4M3VTz9m4PJtz83heMlcvj8Ku1b9bDdeEM
        xclSsxINm6KSaMMeMjBKtEScs6IFpXH6hvGTQGY=
X-Google-Smtp-Source: ABdhPJxqHuMuxIaJSYKfTfMrHTxSgiMEiI5llEbLRWD432mKylVoZJDXu3ZTOjqR+rFuVpGyYj3slnSLSVGKIY/ZuwA=
X-Received: by 2002:a2e:9b90:: with SMTP id z16mr10727408lji.444.1626105556883;
 Mon, 12 Jul 2021 08:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210604212217.70518-1-festevam@gmail.com> <20210604212217.70518-2-festevam@gmail.com>
 <CAJ+vNU35+U=pupo3bzKFnWuZgUKPe_C-0yGrcWnZH1R+PvbbWg@mail.gmail.com>
In-Reply-To: <CAJ+vNU35+U=pupo3bzKFnWuZgUKPe_C-0yGrcWnZH1R+PvbbWg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 12 Jul 2021 12:59:05 -0300
Message-ID: <CAOMZO5CsBjW5RM0FESTeUSs6EONC+GV4VXVpLUxwnnRj1wYNog@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Matthew Michilot <matthew.michilot@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jul 1, 2021 at 3:29 PM Tim Harvey <tharvey@gateworks.com> wrote:

> Fabio,
>
> Thanks for the submission. This does resolve NTSC capture on a
> GW5410-G with an adv7280.
>
> Reviewed-by: Tim Harvey <tharvey@gateworks.com>
> Tested-by: Tim Harvey <tharvey@gateworks.com>

Do you think this series could be applied?

Thanks,

Fabio Estevam
