Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3907B01FF
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 12:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbjI0KjH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 06:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbjI0KjE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 06:39:04 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866101A7
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 03:38:40 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-49ab0641e77so72166e0c.0
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 03:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1695811119; x=1696415919; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n42qFYgILpiL4k0BieIPTLwY7Ex/Y/sFoBgTv8OaLbY=;
        b=giqkCdOoLQvRxjptcHAOV3GRY3g3nq+GXmKTjeeS5G2ZItsdyOhwp7OEeCGFKqmMA3
         F7DWwFpik629YX5fNfto9QVPj40i2Rvq/7zMIRiGDxJO7uN2++krt/bHuuwgusq02V2E
         oJaaBVTEJcE3XghJVRqzXUQMBx4CuNkCbFe5/O4N3txVOvlVNqe+XJJzMqfnuQBGlaxh
         z7ptyvB8s/oZbfjEOe41YbRsZ9veLpZMh4gIqASwdPWpWlgLzaJIsiLRYQdBgGyi3WTB
         B3/xq4qUdJbpG4lUfwleK5YaGQezTFzSQOfTqk81lBUkDIMZnTVygEaMDB5PmOjG+mgE
         ZlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695811119; x=1696415919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n42qFYgILpiL4k0BieIPTLwY7Ex/Y/sFoBgTv8OaLbY=;
        b=i2GJfK3NqCD2Al9yRaBGVruf1JdEbh1SOvyCFBrLaXwmt9P4xjz0TFSrzoa5ZbxkH4
         wYEkuMs462GAqh962K1ZlsZv4Fun3hES7fYmv9QNyyBMkorpgokTRiDO50v88E5eYss/
         bPo4Pn4OqWpaTwvrD8NMg8WE3TFdUtsyRwBAvbM1IGLBbVHiwqebW7WPQLGvsDrbDG2n
         w7DOneSwhl5uZb6T/o16d0ANuEm+cEWucJ4avUSgv3BzPeFF9xZ1MVdshm4TD1ubergc
         vzN3l3X1Xof8vr7ETP1/DEsum1op9ZW90uCbFTfxi4lV5pDUia6fNjGAB4XGPZzxylEd
         eylQ==
X-Gm-Message-State: AOJu0YxG/hEguvXc4oN1yPDoDBi3efNaHk5LnchMu0BE0kx4l6IzF+ST
        9tLUbiS84oTbo+C25z3pE64hwgzkrCfkMPfdSzy/8g==
X-Google-Smtp-Source: AGHT+IEx7Mh2JPACC0aHT0fl+ZzRaTOAi1EacgB5ocQ5i6Lu34UmupSkWKBZbuctR8aVRbMUz8fJo172dsmonavPnmM=
X-Received: by 2002:a1f:e604:0:b0:48f:8e3a:5b83 with SMTP id
 d4-20020a1fe604000000b0048f8e3a5b83mr1458281vkh.14.1695811119631; Wed, 27 Sep
 2023 03:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <918ce2ca-55ff-aff8-ea6c-0c17f566d59d@online.de>
In-Reply-To: <918ce2ca-55ff-aff8-ea6c-0c17f566d59d@online.de>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 27 Sep 2023 11:38:21 +0100
Message-ID: <CAPY8ntCDtrNJ7HCgQy7ZHxRpaK7brQicOQX_j99U0hX0PDS-6A@mail.gmail.com>
Subject: Re: [PATCH] read ov9281 sensor-id in 2-steps in case the firmware locks
To:     Max Schulze <max.schulze@online.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Max

On Wed, 27 Sept 2023 at 09:56, Max Schulze <max.schulze@online.de> wrote:
>
> The ov9281 produced by vision-components does not support
> auto-incremented reads, so read the id in 2 separate steps
> to circumvent the error:
>   kernel: ov9282 10-0060: chip id mismatch: 9281!=92ff
>   kernel: ov9282 10-0060: failed to find sensor: -6
>
>
> Signed-off-by: Max Schulze <max.schulze@online.de>
> Tested-by: Max Schulze <max.schulze@online.de>
> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> This was tested on rpi cm4 with two ov9281 at the same time,
> one from vc, one from inno-maker.
>
> The rpi kernel supported ov9281 out-of-tree until kernel 6.1.
> It carried this change originally made by Dave to support the vc
> sensor. Switching to mainline now broke support for it.
>
> I could not find a single-commit for the original change to which I
> could link, only squashed ones, i.e.
>
> https://github.com/raspberrypi/linux/commit/eb00efc993d8cd835221255b44e9019a31708abe

The single commit was on the rpi-5.10.y branch
https://github.com/raspberrypi/linux/commit/e19e5fa998c7dfaa9942a494499e37788365ccec

>
>  media: i2c: ov9281: Read chip ID via 2 reads
>
>  Vision Components have made an OV9281 module which blocks reading
>  back the majority of registers to comply with NDAs, and in doing
>  so doesn't allow auto-increment register reading as used when
>  reading the chip ID.

I know that Laurent has previously made comments on potentially nicer
ways to handle these annoying Vision Components sensors before, but in
the absence of anything solid then I have no issues with this patch.
It's not going to cause an issue with standard modules, and makes them
work with the VC ones.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 068c7449f50e..3b687f6d4581 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1078,13 +1078,16 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
>  static int ov9282_detect(struct ov9282 *ov9282)
>  {
>         int ret;
> -       u32 val;
> +       u32 val = 0, id_msb = 0;
>
> -       ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 2, &val);
> -       if (ret)
> -               return ret;
> +       // some firmware limits auto-increment register writes, so do it separately
> +       ret = ov9282_read_reg(ov9282, OV9282_REG_ID + 1, 1, &val);
> +       if (!ret)
> +               ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 1, &id_msb);
> +
> +       val |= (id_msb << 8);
>
> -       if (val != OV9282_ID) {
> +       if (ret || val != OV9282_ID) {
>                 dev_err(ov9282->dev, "chip id mismatch: %x!=%x",
>                         OV9282_ID, val);

Minor nit: you'll print this error message if one of the transfers
failed, whereas previously it would have just returned the error code.

  Dave

>                 return -ENXIO;
> --
> 2.30.2
>
