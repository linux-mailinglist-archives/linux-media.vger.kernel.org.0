Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7B4175AD0
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 13:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgCBMuq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 07:50:46 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40134 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727361AbgCBMuq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 07:50:46 -0500
Received: by mail-wm1-f68.google.com with SMTP id e26so4959547wme.5
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2020 04:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CSPsohpgpqQmBo13ul1xmw/YNjoW8YKs48JNi+aPBmM=;
        b=cJ5tTw3N0pWG+ghjSZgzoypuxo8uMs1F43Wbg9X7vearQZbHCTHNUesUaH3RAbZDf2
         Y0zMSivTpAkLNH9n+J12qqCx6JC6v6EJyFelnUtnMy7rXO5n6uraC9iV78bdh9wNyohD
         iCfBnqA2TJzCiPC36j9kfCSp2+XmhLFaHUeYQhi4ifhv+FM3ckgLYESYFbZIc/eyhx8f
         782Od94W6kOEmoZhY4Iv4hT5CBWYzBYgvVvGaY7ki0ILqxNPHajTYgCy7RS5BbetMfvz
         Bb7nXc5Moj7CtsQ/yXsoBv/PQ9U/owwhWcOnodDRDfA4BASy+syWYOTlMfSA1SU3jMki
         mGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CSPsohpgpqQmBo13ul1xmw/YNjoW8YKs48JNi+aPBmM=;
        b=qG0zyPRLtP+Mbtazfec+G9dmjmq6pSrlA4QVAdm/JA3/z53k2MoSNxlgoT+bI1YmDi
         gOR9LlWfrlKA3r/isXQbajK2Z9w+/VHxQpPrTH6SXNeI20W0gLZmqH0pVtX4/Wtgte7Y
         w1Dlw06ktuXbUgl8kOcCm1kYInv+9r4ubx2AWEdE27oflYS/cceyLNQ6Q4oU8Sm31zbd
         K1KL8ZC/5eqAnlvmc5OKtNlXVPYJzWchmq7OE6PJUrG12HZzzJUT4LvPeIWF+i96hZbu
         DZD9BKMCRMeZ8xEfyfFVcDLWYcw1Cv+0Qo/yVbHqoJ9893FVyRPEqi/05/xXF9yEgyRC
         qxuA==
X-Gm-Message-State: ANhLgQ0+5fPRHseWpLybiUY7vb9N8MRM2fHKI4Vz5ajiCFex+wavMOIO
        6C2suXi9hoXKnb1EijQaowZ+RybrOmnRrOqOa+p4Tw==
X-Google-Smtp-Source: ADFU+vtYMNuw0SCL+KswwM/YxdRE18ZwcHgkc9aHKtmKVQ8zcoxmZUMlTpF2vspJXpmDvli8VqiHduV/uiOVAxWQKWI=
X-Received: by 2002:a7b:cb10:: with SMTP id u16mr1751723wmj.96.1583153443629;
 Mon, 02 Mar 2020 04:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20200228165503.18054-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200228165503.18054-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200228165503.18054-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 2 Mar 2020 12:50:28 +0000
Message-ID: <CAPY8ntD-_GBtTOS--J_yEAbM+U6zjAdebmHnpE4+Ev4LVFjq7g@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: imx219: Add support 640x480
To:     Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad.

Thanks for the patch.

On Fri, 28 Feb 2020 at 16:55, Lad Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> This patch adds support to 640x480 cropped resolution for the sensor

I was a little hesitant to add cropped modes without good reason.
Processing them through an ISP with something like lens shading
compensation requires the ISP to know the crop, so ideally it should
be reflected through the selection API (probably read-only - I'm not
sure you can modify the register set totally dynamically for
cropping).
I know we have the 1080p mode in there already which is cropped, but
that was mainly as it is the only way to get 30fps 1080p over two
CSI-2 lanes. I wonder if there is a better way of reflecting this.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/imx219.c | 70 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 1388c9bc00bb..232ebf41063a 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -54,6 +54,7 @@
>  #define IMX219_VTS_15FPS               0x0dc6
>  #define IMX219_VTS_30FPS_1080P         0x06e3
>  #define IMX219_VTS_30FPS_BINNED                0x06e3
> +#define IMX219_VTS_30FPS_640x480       0x0239
>  #define IMX219_VTS_MAX                 0xffff
>
>  #define IMX219_VBLANK_MIN              4
> @@ -329,6 +330,65 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
>         {0x0163, 0x78},
>  };
>
> +static const struct imx219_reg mode_640_480_regs[] = {

Can I ask where these register settings came from? They differ from
references I have in a few odd ways.

There's also a comment at the top of mode arrays declaring the
supported modes and where they came from. Could you update that
please?

> +       {0x0100, 0x00},
> +       {0x30eb, 0x0c},
> +       {0x30eb, 0x05},
> +       {0x300a, 0xff},
> +       {0x300b, 0xff},
> +       {0x30eb, 0x05},
> +       {0x30eb, 0x09},

Datasheet section 3-4 says these are to access manufacturer specific
registers, but the access sequence should be
0x30eb 0x05
0x30eb 0x0c
0x300a 0xff
0x300b 0xff
0x30eb 0x05
0x30eb 0x09
Is there a reason your first two writes are reversed compared to this
published order?

> +       {0x0114, 0x01},
> +       {0x0128, 0x01},

DPHY_CTRL RW MIPI Global timing setting
0:auto mode, 1:manual mode

All the other modes have this as auto mode. Why does this mode need
manual settings, and is something else configuring those manual
values?

> +       {0x012a, 0x18},
> +       {0x012b, 0x00},
> +       {0x0162, 0x0d},
> +       {0x0163, 0xe7},

All the other modes have set line length to 0x0d78 (3448 decimal)
rather than your 0xd37 (3559).
Is there any specific reason for this? If we need a different value,
then we also need to vary IMX219_PPL_DEFAULT and V4L2_CID_HBLANK
depending on mode. Or probably better would be to make it variable,
but that has a load of other implications.

> +       {0x0164, 0x03},
> +       {0x0165, 0xe8},
> +       {0x0166, 0x08},
> +       {0x0167, 0xe7},
> +       {0x0168, 0x02},
> +       {0x0169, 0xf0},
> +       {0x016a, 0x06},
> +       {0x016b, 0xaf},
> +       {0x016c, 0x02},
> +       {0x016d, 0x80},
> +       {0x016e, 0x01},
> +       {0x016f, 0xe0},
> +       {0x0170, 0x01},
> +       {0x0171, 0x01},
> +       {0x0172, 0x00},

0x0172 is IMAGE_ORIENTATION_A, which is handled via V4L2_CID_HFLIP /
V4L2_CID_VFLIP, not in the mode table.

> +       {0x0174, 0x03},
> +       {0x0175, 0x03},
> +       {0x0301, 0x05},
> +       {0x0303, 0x01},
> +       {0x0304, 0x03},
> +       {0x0305, 0x03},
> +       {0x0306, 0x00},
> +       {0x0307, 0x39},
> +       {0x0309, 0x08},

"OPPXCK_DIV. Ouptut pixel clock divider value, default 0x0A."
This looks like it is a change that should be part of the support for
8bit formats.
Have you tested this mode with 10bit readout? Are the data rates correct?

> +       {0x030b, 0x01},
> +       {0x030c, 0x00},
> +       {0x030d, 0x72},
> +       {0x0624, 0x06},
> +       {0x0625, 0x68},
> +       {0x0626, 0x04},
> +       {0x0627, 0xd0},
> +       {0x455e, 0x00},
> +       {0x471e, 0x4b},
> +       {0x4767, 0x0f},
> +       {0x4750, 0x14},
> +       {0x4540, 0x00},
> +       {0x47b4, 0x14},
> +       {0x4713, 0x30},
> +       {0x478b, 0x10},
> +       {0x478f, 0x10},
> +       {0x4793, 0x10},
> +       {0x4797, 0x0e},
> +       {0x479b, 0x0e},
> +};
> +
>  static const char * const imx219_test_pattern_menu[] = {
>         "Disabled",
>         "Color Bars",
> @@ -414,6 +474,16 @@ static const struct imx219_mode supported_modes[] = {
>                         .regs = mode_1640_1232_regs,
>                 },
>         },
> +       {
> +               /* 640x480 30fps mode */
>
> +               .width = 640,
> +               .height = 480,
> +               .vts_def = IMX219_VTS_30FPS_640x480,

I've just run this mode on a Pi and I get a default of about 84fps via
v4l2-ctl to /dev/null. Is the default frame rate expected to be 30fps?
In which case I think the value of IMX219_VTS_30FPS_640x480 is wrong
(I'd expect 0x6e3 again, same as the other modes), or the comments and
define names are wrong. One or other ought to be fixed.

My calculations say that with:
- VBLANK set to 89
- a pixel rate of 182400000 (based on IMX219_PIXEL_RATE)
- HBLANK fixed at 2808
- frame being 640x480
The overall frame size is therefore (640+2808) * (480+89) = 1961912
pixel clocks. That would at first glance appear to give a frame rate
of 92fps. Testing with an alternate tool is giving me timings for
90fps but with a few dropped frames (the dropped frames would explain
v4l2-ctl reading slightly low).

If I amend OPPXCK_DIV to be 0xA (the same as the other modes), then it
doesn't appear to change.
However hold off on investigating the specifics for now - I appear to
be unable to select the 10bit/pixel formats, so I suspect something is
up with patch 2 that added the 8bit support (I was about to review
that anyway).

  Dave

> +               .reg_list = {
> +                       .num_of_regs = ARRAY_SIZE(mode_640_480_regs),
> +                       .regs = mode_640_480_regs,
> +               },
> +       },
>  };
>
>  struct imx219 {
> --
> 2.20.1
>
