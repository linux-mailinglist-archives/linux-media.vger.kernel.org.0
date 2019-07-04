Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE0A5F0F5
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 03:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbfGDB0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 21:26:44 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40133 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfGDB0o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 21:26:44 -0400
Received: by mail-lj1-f195.google.com with SMTP id a21so4434069ljh.7
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 18:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yXAVFnfiEEYWzq0T+eyNtBYxPznXS/lsG7WFq1O+HB4=;
        b=N4AwCV45XwI15Coac1umbUkl+TRhFw7Mha+OVqChHsg4gakcLlx8q9tUnIUMz1CqYc
         Rcpv+g+ah2i8GYILTn+RbqDokms8zztXe654W6jHn9obhbcn9vZxhS9jtQv9Ujr+mtlr
         /3DpRbTsIN+fnr3DFy/xywciF9pTcJIBvrfQY6FCvPeYgkbNrZwPryVTAW1yc+Znv/eT
         4xI+2ozvlA/waqLlk6w+Gi0Tvd1H8Gi/18geQyFvAqDKS3W+pGvhHjHFPgFdW5TqmWVT
         wVmvM6Q2ziFatFAjpW3N6kOaHNDEKnMuQw1OQVvjtlLqHrh12UmCWwllOjqIDTdK19UF
         hVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yXAVFnfiEEYWzq0T+eyNtBYxPznXS/lsG7WFq1O+HB4=;
        b=YVEMnA8PrRzhdv882UShnrlpTLmf7dzb77qAgH55LmizSoVUkmVyVq516vVTq1FD2r
         ixVFBO8HIqBhrfG0R5hg4aP6hp5Rd2el0LQtzPppXcMLF/BcLU8LW78W6G5neeFk8SML
         z1YcRa66NRyWaaLFp6SW19CJzV296P7qExSXP5woRMGg0t50ral57yrdnZXjcuf1cqeg
         smC07in8YM/+pW6uz1k7Awt9hL2sAYs7/wbOJ3PkolbpD/3WmGQTTZT7Tzko03B9USbs
         DLfcf3eSODmESeHvPRsrSXttErQhuxwpoTH2d4jDy47yaUKR7gNC0qrNTw+zJVOyRXg7
         ActA==
X-Gm-Message-State: APjAAAXsk+87NZvc1VuEfV295XIgW7+h9Uhbyq3uzCtKd+JXuhAKtfjW
        9KSIA+6t2ZltStXMS/Pak9xsdi6VhvoKDzNAd8jpG+b8
X-Google-Smtp-Source: APXvYqx3p3p6ZwmqN/nwRwhqCn8hXWwIMFCchowPkSRi0lGqKYW7aFqFIw9G8m8KEjk0/pzQZRIbAWns7SkvDGIARCI=
X-Received: by 2002:a2e:5d1:: with SMTP id 200mr23040611ljf.10.1562203601878;
 Wed, 03 Jul 2019 18:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190703131044.7656-1-ezequiel@collabora.com>
In-Reply-To: <20190703131044.7656-1-ezequiel@collabora.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 3 Jul 2019 22:26:31 -0300
Message-ID: <CAOMZO5DtUsfV3GXw8f18-t+6q7hCvsWVh3Dw=H2Q7sykTNy1PQ@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5645: Fix power up sequence
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@collabora.com, linux-media <linux-media@vger.kernel.org>,
        Todor Tomov <todor.tomov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Wed, Jul 3, 2019 at 10:10 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> This is mostly a port of Jacopo's fix:
>
>   commit aa4bb8b8838ffcc776a79f49a4d7476b82405349
>   Author: Jacopo Mondi <jacopo@jmondi.org>
>   Date:   Fri Jul 6 05:51:52 2018 -0400
>
>   media: ov5640: Re-work MIPI startup sequence
>
> In the OV5645 case, the changes are:
>
> - Move OV5645_IO_MIPI_CTRL00 (0x300e) out of the initial setting blob.
> - At set_power(1) time power up MIPI Tx/Rx and set data and clock lanes in
>   LP11 during 'sleep' and 'idle' with MIPI clock in non-continuous mode.
> - At set_power(0) time power down MIPI Tx/Rx (in addition to the current
>   power down of regulators and clock gating).
> - At s_stream time enable/disable the MIPI interface output.
>
> With this commit the sensor is able to enter LP-11 mode during power up,
> as expected by some CSI-2 controllers.
>
> Many thanks to Fabio Estevam for his help debugging this issue.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

With this patch the applied the OV5645 camera successfully enters in
LP-11 and the imx6 capture driver does not complain anymore.

Tested-by: Fabio Estevam <festevam@gmail.com>

Thanks!
