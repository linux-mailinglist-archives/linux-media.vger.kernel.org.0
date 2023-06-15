Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8120A731F1E
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 19:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236420AbjFORcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 13:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237434AbjFORcn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 13:32:43 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817A42728
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 10:32:37 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b4420a8c44so18161401fa.2
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 10:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686850355; x=1689442355;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ajxvm29XAG1FlZ1HdMNzBfyxvgje9C2nWM7Zytw/Cjc=;
        b=PRpg7IyydQafo7k2VlAtcE3IC+Rjf7jauK2cBJBYmOkBMYjQZEzWqHrOT0R/JHW/5N
         hscOpcvcVBDvMkix8lLQlaPVcZjo1ftTKCWK/qhbK0UNwMZepwfC+t8M7D4hoKcQlopv
         xXgcJkR351/I7yeBdVCp2twL3K80nO+G3y7j3xlyi8Br7L4xDkGqqrO4bB9NporMMDXV
         5VTZeJeKqQ7VgQVCHpH2bjAdA0rRKN/1ko4GE06xnOZwWsuXG+9yzy4JtZLLFRFTpbrp
         2HV6XpvrMPiEhqrMwvmxhCxxoL9JtoXH1rlpnJbxMYqNDVmlr0Zmk/Uh2xl1T3YfleK5
         zvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686850355; x=1689442355;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ajxvm29XAG1FlZ1HdMNzBfyxvgje9C2nWM7Zytw/Cjc=;
        b=DjZnjB7cUMhfvbtZ6hWEf39tKmRl87LNZ8F3rhBh9PEkk8H7zQrt1cgKj3bGaAAHi2
         kGByGrMyVICnFbbIA1qO1pSogoFx+t4XcvAufyFIyUmQlCWKzkansADDoxEdPOrwMcEx
         mkNAUddU+rdblvvZoaFKFjPvgEPWBnZguHyX5OFb+hnOxZIsEpBX/u8gcK6pYwjJFhTW
         FkH3djYzhfEUIXo5SQj0wjoGQbQEMaU15lFOgIEe4qz0LmzxFlY9IrZW57h6VF1p9qlT
         FZvHFZePYOyn8uDZy6n/4CqsslwdkpzdXVuphad2H7UR6PtG/VxwYpzqe6D3vhO9KCkF
         jOmQ==
X-Gm-Message-State: AC+VfDzPZn3wwL8NhmpymC0XlSK4jbO840MXQO8ysne7tmGEchdTS0j8
        2m7W1hpxVNPVK2IeuewKQU8=
X-Google-Smtp-Source: ACHHUZ6axynw/ub6QhtarVvm8F6hqXWCd27yaBhFIZGEgOjbdTb588Dulkkf2TgZ5htTvymjEqi1OA==
X-Received: by 2002:a2e:7a14:0:b0:2a8:eae2:d55c with SMTP id v20-20020a2e7a14000000b002a8eae2d55cmr122071ljc.15.1686850355168;
        Thu, 15 Jun 2023 10:32:35 -0700 (PDT)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c020200b003f739a8bcc8sm21026455wmi.19.2023.06.15.10.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 10:32:34 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/28] media: ov2680: Bugfixes + ACPI +
 selection(crop-tgt) API support
In-Reply-To: <20230615141349.172363-1-hdegoede@redhat.com>
References: <20230615141349.172363-1-hdegoede@redhat.com>
Date:   Thu, 15 Jun 2023 18:32:33 +0100
Message-ID: <m38rck7hse.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,
Hans de Goede <hdegoede@redhat.com> writes:

> Hi All,
>
> Here is v2 of my ov2680 sensor driver patch series.
>
> Changes in v2
> - Drop "media: Add MIPI CCI register access helper functions"
>   (being reviewed in its own thread / patch-submission)
> - Drop "media: ov2680: Add g_skip_frames op support"
> - Add "media: ov2680: Fix regulators being left enabled on
>   ov2680_power_on() errors"
> - Add "media: ov2680: Add link-freq and pixel-rate controls"
>   with this the driver now works on IPU3 with ipu3-capture.sh
>   (libcamera support requires adding a couple more controls)
> - Limit line length to 80 chars everywhere
> - Address various small remarks from Andy
>
> During all the work done on the atomisp driver I have mostly been testing
> on devices with an ov2680 sensor. As such I have also done a lot of work
> on the atomisp-ov2680.c atomisp specific sensor driver.
>
> With the latest atomisp code from:
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/tag/?h=media-atomisp-6.5-1
>
> The atomisp code can now work with standard v4l2 sensor drivers using
> the selections (crop-tgt) api and v4l2-async sensor driver registration.
>
> This patch series modifies the main drivers/media/i2c/ov2680.c driver
> to add bugfixes, ACPI enumeration, selection API support and further
> improvments. After this the driver can be used with the atomisp driver
> and atomisp-ov2680.c can be dropped.
>
> This also gets the driver much closer to having everything needed for
> use with IPU3 / libcamera. I have a Lenovo Miix 510 now with an IPU3 +
> ov2680 sensor and with this series raw-capture using the ipu3-capture.sh
> script works. I plan to work on libcamera support for this in the near
> future.
>
> This series consist of 3 parts:
>
> 1. Patches 1-8 are bugfixes these are put first for backporting
>
> 2. Patch 9 converts the ov2680 driver to the new CCI helpers,
> the same has been done in the other series with the atomisp-ov2680
> driver and this makes it much easier to sync things up.
>
> Note this depends on the new CCI register helpers, these are being
> reviewed here:
>
> https://lore.kernel.org/linux-media/20230614192343.57280-1-hdegoede@redhat.com/
>
> 3. Patches 9 - 28 implement the ACPI enumeration,
> selection API support and further improvments.

Wonder why you did not cc me, since the Maintainers entry is up to date
with my email on this driver.

Thanks a lot for all this work, I had at the time a very limited iot device
without IPU and could only do processing offline, and got out of working
on this device very quick.

So, looks like you have a much robust setup and test scenarios. Again
thanks for the fixes and updates using new api and extend functionality
on this one. I went over it and all looks pretty good, so for the all
series:

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

And please, if you agree of course, if you send a new version of this
series or as a follow up patch, I think would make sense to add you as
maintainer also.

Cheers,
   Rui

>
> Regards,
>
> Hans
>
>
> Hans de Goede (28):
>   media: ov2680: Remove auto-gain and auto-exposure controls
>   media: ov2680: Fix ov2680_bayer_order()
>   media: ov2680: Fix vflip / hflip set functions
>   media: ov2680: Use select VIDEO_V4L2_SUBDEV_API
>   media: ov2680: Don't take the lock for try_fmt calls
>   media: ov2680: Add ov2680_fill_format() helper function
>   media: ov2680: Fix ov2680_set_fmt() which == V4L2_SUBDEV_FORMAT_TRY
>     not working
>   media: ov2680: Fix regulators being left enabled on ov2680_power_on()
>     errors
>   media: ov2680: Convert to new CCI register access helpers
>   media: ov2680: Store dev instead of i2c_client in ov2680_dev
>   media: ov2680: Check for "powerdown" GPIO con-id before checking for
>     "reset" GPIO con-id
>   media: ov2680: Add runtime-pm support
>   media: ov2680: Drop is_enabled flag
>   media: ov2680: Add support for more clk setups
>   media: ov2680: Add support for 19.2 MHz clock
>   media: ov2680: Add endpoint matching support
>   media: ov2680: Add support for ACPI enumeration
>   media: ov2680: Fix ov2680_enum_frame_interval()
>   media: ov2680: Annotate the per mode register setting lists
>   media: ov2680: Add ov2680_mode struct
>   media: ov2680: Make setting the mode algorithm based
>   media: ov2680: Add an __ov2680_get_pad_format() helper function
>   media: ov2680: Implement selection support
>   media: ov2680: Fix exposure and gain ctrls range and default value
>   media: ov2680: Add a bunch of register tweaks
>   media: ov2680: Drop unnecessary pad checks
>   media: ov2680: Read and log sensor revision during probe
>   media: ov2680: Add link-freq and pixel-rate controls
>
>  drivers/media/i2c/Kconfig  |    2 +
>  drivers/media/i2c/ov2680.c | 1316 +++++++++++++++++++-----------------
>  2 files changed, 689 insertions(+), 629 deletions(-)
>
> -- 
> 2.40.1
