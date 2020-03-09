Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDBC17DDB7
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgCIKeO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:34:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45179 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726450AbgCIKeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:34:11 -0400
Received: by mail-wr1-f67.google.com with SMTP id m9so1345480wro.12
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2020 03:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W/R7GajStXw3cEf+ZiVmAPRazGOJ5PkWTh2VNSoFzbc=;
        b=IE3SujUTg8eJqzlAzhnTzwJ/yN7hWiTc4cSluUfEfe+bkCfsmKRWuZsl+8q8Hq26HY
         21+OTFDwyymmGYQSsbAxZ9WdBmCcD6IdB+FT+qT5TyaFo96sx4tjju5dPf2u+Jvw8O+Q
         UmaRfiKPpIGuAG3rNlJl6GAXNKnLClQ/OEUJDau5HJO81Ae27HDK1ezDymPLWx0vWsIk
         +qqDnwZhq42LTHsHV0zpXJ+YJabZlW43NpWcZXVZR/oCor4Sbf3KFLYU4alQ5f+Rn416
         vbyBUpL9+aKtPxHRoHG7cZ8D7lYEFPuED1KccElATmbScLTwnePJRNi/7jNhEubEVOTK
         K/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W/R7GajStXw3cEf+ZiVmAPRazGOJ5PkWTh2VNSoFzbc=;
        b=HeMAY1q6ui0SW8vxcqsLqmxiZtxVKqobGCHCS+l/RzRZUJc4HMci2V6RsNdqmGyT13
         OuO/8xk0AnZwh6jgR+2MdU9Y7d8ZFlv2F5Ow+PBZdv9/0hSMrLp5bq26pMsoBHkKKepc
         Q/f3fwf7R6VnBZJcnE9w0IzF2751fl85LF7AUUPXC8wOtN85pneWL/YXCFJkRdV7cpyu
         P1enaCpHSSU6c0uSe7HSeIw+6oJPfyRGJPL67w73DgBp/QopGD5Us0SXoM9ofr8rhHK2
         vbmmSdLVhQkEUYJ7JFUPxdyicBIUk47bS3lwms7aRdKGoxQ0NQxNvRRKoTxDDPUUvRlD
         AJfw==
X-Gm-Message-State: ANhLgQ2CGYjoVo/bd7mKoOGs7007qvsUuKcx+p35Cp4ELDePP/4sQqTx
        uWyusTgdvUPlo0z60q2A9cm6lc7+gSGv4B+8CkMjXg==
X-Google-Smtp-Source: ADFU+vuj9ygBtHgz5b2iQttBwvw8TYM+qkm37RKkxf81QN11Ai0ewpU8BeWkv1+PSkXwOwWZYy0QTCnCORhBZlY7Ke8=
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr19622742wrw.47.1583750048720;
 Mon, 09 Mar 2020 03:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200307005636.8118-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200307005636.8118-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 9 Mar 2020 10:33:51 +0000
Message-ID: <CAPY8ntCGitAn8r8yabceoj_yfCBrr+7Htwb1UttWUdfKTQXKwg@mail.gmail.com>
Subject: Re: [PATCH v3] media: i2c: imx219: Add support for cropped 640x480 resolution
To:     Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar

Thanks for the update.

On Sat, 7 Mar 2020 at 00:56, Lad Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> This patch adds mode table entry for capturing cropped 640x480 resolution
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
> Hi All,
>
> This patch is part of series [1] ("[PATCH v2 0/3] media: i2c: imx219:
> Feature enhancements), rest of patches have been acked by Dave except
> this one. I have fixed Daves's comments in this version of the patch.
>
> [1] https://lore.kernel.org/patchwork/project/lkml/list/?series=432780&
>     submitter=&state=*&q=&archive=&delegate=
>
> v2->3
>  * Corrected the mode value in comment
>
> v1->v2:
>  * Fixed fps setting for 640x480 and switched to auto mode.
>
>  drivers/media/i2c/imx219.c | 70 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 69 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f96f3ce9fd85..0e3567af5300 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -54,6 +54,7 @@
>  #define IMX219_VTS_15FPS               0x0dc6
>  #define IMX219_VTS_30FPS_1080P         0x06e3
>  #define IMX219_VTS_30FPS_BINNED                0x06e3
> +#define IMX219_VTS_30FPS_640x480       0x06e3
>  #define IMX219_VTS_MAX                 0xffff
>
>  #define IMX219_VBLANK_MIN              4
> @@ -143,7 +144,7 @@ struct imx219_mode {
>  /*
>   * Register sets lifted off the i2C interface from the Raspberry Pi firmware
>   * driver.
> - * 3280x2464 = mode 2, 1920x1080 = mode 1, and 1640x1232 = mode 4.
> + * 3280x2464 = mode 2, 1920x1080 = mode 1, 1640x1232 = mode 4, 640x480 = mode 7.
>   */
>  static const struct imx219_reg mode_3280x2464_regs[] = {
>         {0x0100, 0x00},
> @@ -318,6 +319,63 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
>         {0x0163, 0x78},
>  };
>
> +static const struct imx219_reg mode_640_480_regs[] = {
> +       {0x0100, 0x00},
> +       {0x30eb, 0x05},
> +       {0x30eb, 0x0c},
> +       {0x300a, 0xff},
> +       {0x300b, 0xff},
> +       {0x30eb, 0x05},
> +       {0x30eb, 0x09},
> +       {0x0114, 0x01},
> +       {0x0128, 0x00},
> +       {0x012a, 0x18},
> +       {0x012b, 0x00},
> +       {0x0162, 0x0d},
> +       {0x0163, 0x78},
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
> +       {0x0174, 0x03},
> +       {0x0175, 0x03},
> +       {0x0301, 0x05},
> +       {0x0303, 0x01},
> +       {0x0304, 0x03},
> +       {0x0305, 0x03},
> +       {0x0306, 0x00},
> +       {0x0307, 0x39},
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
> @@ -424,6 +482,16 @@ static const struct imx219_mode supported_modes[] = {
>                         .regs = mode_1640_1232_regs,
>                 },
>         },
> +       {
> +               /* 640x480 30fps mode */
> +               .width = 640,
> +               .height = 480,
> +               .vts_def = IMX219_VTS_30FPS_640x480,
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
