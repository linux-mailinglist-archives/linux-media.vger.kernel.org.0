Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E347C0CB5
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 22:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbfI0Uht (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 16:37:49 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34065 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfI0Uht (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 16:37:49 -0400
Received: by mail-ot1-f68.google.com with SMTP id m19so3420895otp.1;
        Fri, 27 Sep 2019 13:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5HzZ318c3cKkiQZfJLfcgZNuIY2hbgfJtqOlfqrb8Eg=;
        b=euIPp8WcmzobZ1wRzyPahQI/sNqKCya1H0EszdAiMVqnNHWrXbWc12mwe0puRbaVB0
         0151jIM2xe6rLQE24hGrMja4GiW7m0AGsUA7VpOYkpO3Dz1IplyVEJzXVopLTansA2kj
         dUd5RTJXR/bg+JUmORd4LCDPnvfD/cQ8BIHmWzEvTR/Z81ZJv8Qj9giJzJ/A23GF0R/e
         Q8AfEUSwwwRc70xNTW0JekF0+QlB//kmyTyyrl0AA4N63uiKZXn3GJ0Uj9ULwPcYAKya
         1RWIxHwbqoNw64BSR64hZF6qHXdHfdz9uxYSKaLuZikq0gITazMFlvtJdqksDH84dhuR
         ylmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5HzZ318c3cKkiQZfJLfcgZNuIY2hbgfJtqOlfqrb8Eg=;
        b=AjcwDrGOpGzZ+oSi8NQw/62IZtVfKkPKb8HYdCltMJLzNXq5Gd8meMQNlfq60R38Dm
         /IJ8KkdCnf3Wa2ettQDOwrDDKnwYHjB8b1R1w/6XSlaZbYoVO6na3W/ZwCYmh/hWxD6y
         +RyFBpQ7Nj6HClEvqiixu2zWIA3wqOgEgp5AHRaELBsT+4FDajSSh//O26kUvhrkZUlr
         kIxS09AwjClDhm3+7EEGYCc3XCgV1pQ1Rys9CeYaTi8hzAZNjSmI9pB218nztDBQtvsk
         NAy2xiAAqPSQq4GwblX38OlnkMoyuLlql1Hx8l3myFPXXW8+D9Uah9eqUl2Ash+wS2pI
         qRRw==
X-Gm-Message-State: APjAAAWwrUDlUuwTaYBI41ewHcBJZe5bey6LuKLVslmt2QXK+CFQw+EE
        0NeQ/cXDQyTV0poh1IraJC8p71/kPidetaL6f3g=
X-Google-Smtp-Source: APXvYqw6PImrq0c1y1VcQ7iuF4Ug5WxhWXn21mZr4P19hYblK8Q/2ovDB7x6QYfZXUtwnN0IJdGrQmVPNubZPTdCDWw=
X-Received: by 2002:a9d:6a56:: with SMTP id h22mr4865024otn.176.1569616668476;
 Fri, 27 Sep 2019 13:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190927184722.31989-1-bparrot@ti.com> <20190927184722.31989-6-bparrot@ti.com>
In-Reply-To: <20190927184722.31989-6-bparrot@ti.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 27 Sep 2019 21:37:22 +0100
Message-ID: <CA+V-a8ss26F4nEFRDtXytn4ZPi==fMYdoe0JpEunURAYy9J99g@mail.gmail.com>
Subject: Re: [Patch v4 5/8] media: dt-bindings: ov2659: add
 powerdown/reset-gpios optional property
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 27, 2019 at 7:47 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> Add powerdown-gpios and reset-gpios to the list of optional properties
> for the OV2659 camera sensor.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov2659.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> diff --git a/Documentation/devicetree/bindings/media/i2c/ov2659.txt b/Documentation/devicetree/bindings/media/i2c/ov2659.txt
> index cabc7d827dfb..92989a619f29 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov2659.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/ov2659.txt
> @@ -12,6 +12,12 @@ Required Properties:
>  - clock-names: should be "xvclk".
>  - link-frequencies: target pixel clock frequency.
>
> +Optional Properties:
> +- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
> +  Active high with internal pull down resistor.
> +- reset-gpios: reference to the GPIO connected to the resetb pin, if any.
> +  Active low with internal pull up resistor.
> +
>  For further reading on port node refer to
>  Documentation/devicetree/bindings/media/video-interfaces.txt.
>
> @@ -27,6 +33,9 @@ Example:
>                         clocks = <&clk_ov2659 0>;
>                         clock-names = "xvclk";
>
> +                       powerdown-gpios = <&gpio6 14 GPIO_ACTIVE_HIGH>;
> +                       reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
> +
>                         port {
>                                 ov2659_0: endpoint {
>                                         remote-endpoint = <&vpfe_ep>;
> --
> 2.17.1
>
