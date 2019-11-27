Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4732610A89E
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2019 03:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfK0CIS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 21:08:18 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:44834 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfK0CIS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 21:08:18 -0500
Received: by mail-io1-f66.google.com with SMTP id j20so22933772ioo.11;
        Tue, 26 Nov 2019 18:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vc2RxzN2G+Q75lUn7LwY1ASPWwSzMQXp8gM6PX3LxHU=;
        b=MUq1DwyFLOs5oP/HPRxbiUmvBRCGi00NAYxgMtw9cNV4kc/gsWKSDdfCFjeGPmus6H
         2i1p2w11dkD6ew0foxbMCNrxeAv0o5rVDj6S+o1JOYNdwtA8qTDWNj+bA0qoaV4aB8Il
         qDvCvbikGz4UbXAxAPIqLD+EsF8r5m5UrizYYxdco2vNHaNZhEyRDRB9RLgAgXUAr7wo
         zeMPRSPydacfEu2/2lXr/x70/yCcQtlsT+9KgDVDU0aukPTQ4BWIcn3AVK8AI6xSL18p
         TK/4rnhsa+SbgCBsLdmU6dsNSqXtH7CSoBe3WcBuKJ+fHrk8Efw6PH/dkzNXPSJVwVYc
         1U5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vc2RxzN2G+Q75lUn7LwY1ASPWwSzMQXp8gM6PX3LxHU=;
        b=LLlMmDaf9qjkDA0WIJEIkTPpPSEgCruBNisx2akJuINGfAKHXWMVi/0zWDZKddLZQn
         3paEFJ3rc4barLobaNPyaYQxsikixr0FYQfhwLDnEvso0kZ+gpqmTrKbcjR1pAesWbkd
         BMAPfSVs/+qGBbBpJWEqNxrs1H+a5A3r7F8aYhRxl11S+B83QVsikqdloo94oXyy7gcO
         jO4UfP1b28QDBYT2QLNxsNahQwYDP1f7bp6qB3OvxPu56uYe0YDQQDdQ9JNVytfHl0ZG
         PLS552dzhhNTGa1r1p+qQRLzTbKR68r3oHwdnEKS+f2UVWBpBmyWMsipb2gJBSO+SeZr
         uJmw==
X-Gm-Message-State: APjAAAVLIk50YllBynl5cepTsPngGnofKrxdaoxCmuKb+/E/pmzyW+jJ
        ORQcJ9+XbYVT9qnlGs2pM+RUNyum155h9HF4pnCthbtj
X-Google-Smtp-Source: APXvYqwyoWWy58G5bSBNPoIYQD18Fo7FWvbwcQwpfoceQP7ZSktqeABnXZXWg/Ea9zWlc2S8EfouR8Bxy2CXpETfR/k=
X-Received: by 2002:a05:6638:2b1:: with SMTP id d17mr1970514jaq.3.1574820496639;
 Tue, 26 Nov 2019 18:08:16 -0800 (PST)
MIME-Version: 1.0
References: <20191029124211.15052-1-aford173@gmail.com>
In-Reply-To: <20191029124211.15052-1-aford173@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 26 Nov 2019 20:08:05 -0600
Message-ID: <CAHCN7xKAJ3koJc1H2zyGFG3J6qu+uw0jozT=pQ_0i8HStX5TbQ@mail.gmail.com>
Subject: Re: [PATCH] media: ov5640: Fix check for PLL1 exceeding max allowed rate
To:     linux-media <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Adam Ford <adam.ford@logicpd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 29, 2019 at 7:42 AM Adam Ford <aford173@gmail.com> wrote:
>
> The variable _rate is by ov5640_compute_sys_clk() which returns
> zero if the PLL exceeds 1GHz.  Unfortunately, the check to see
> if the max PLL1 output is checking 'rate' and not '_rate' and
> 'rate' does not ever appear to be 0.
>
> This patch changes the check against the returned value of
> '_rate' to determine if the PLL1 output exceeds 1GHz.
>
> Fixes: aa2882481cad ("media: ov5640: Adjust the clock based on the expected rate")
>

I haven't seen any responses to this patch.  Has anyone had a chance
to review this?  It's been nearly a month.
I think it would be appropriate to backport to stable if deemed acceptable.

adam

> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 5e495c833d32..bb968e764f31 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -874,7 +874,7 @@ static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,
>                          * We have reached the maximum allowed PLL1 output,
>                          * increase sysdiv.
>                          */
> -                       if (!rate)
> +                       if (!_rate)
>                                 break;
>
>                         /*
> --
> 2.17.1
>
