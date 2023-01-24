Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBD85679D42
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 16:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234295AbjAXPTf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 10:19:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234532AbjAXPTd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 10:19:33 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639AB46727
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 07:19:32 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id b1so13971916ybn.11
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 07:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p20GSW2jv7QjfJrc2xBarU3MwHwoCp9CBxAali0boKc=;
        b=qtyEL7vudKYXg/4eAex1luL2Fb/MDVkBLZ+2mvF7VrS+ONPu8SDKGFKPTXRDPi8mBh
         CFD7LX5A82koeIn98Jzhrm4uaDvbYvwuZuBoJ5+0RtOA8/bGjUETBL7V3AKiCiA5j2Ip
         /rTVh/punXlsS3yMm0yvqqR586iHPhZ3HQe2hY5A5CjE7p/5ZhoHoC90emopMZg/5Isv
         T1fE0nXOdr1IQwb9VTuMT9eKJqnWoklIZpc0wzvEf44aYJp6skGeGFM0r61NQJNJmN8n
         5PkE/U/8ErFmxn72mN6zgz4XYXE0rwokAjeZ1OmFB0zTHyAdFtx9GO4gGP1K/LVSZHlu
         PWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p20GSW2jv7QjfJrc2xBarU3MwHwoCp9CBxAali0boKc=;
        b=cCNoHgbTsazIK5BH68zsYuyqyNAJXo80XFzWArMTooycpQcmaE0IgHNC2I/QWqgpKX
         rdawqw+88ScJDLjZN291W8ZsUYspNI4dmQ/vsOrzDa3OgZg1NXu/a/3B1cr+OmjcYvVr
         ybjXd7Y/5bMrZJzJsqPsv+Hq7+KklSYeJTBPd3MmhfzYlpII54xH1/EpM2nYjnsC2lWX
         KbM3XG+wdyb9ZffaFBuhPbJGl/5vcdZtQE8GRgcj7Bekiax/EgTCJxqb4mh+kQUcYtZL
         pVybCspU9NpaaIuU1AD3bPA4jr+VFVOTy2jzwbf68WGzSWrz88qoQSS4XwtONHmrlpWp
         yEug==
X-Gm-Message-State: AFqh2kqCJj8j642jNECv4HJa+Ue9UK2hGoDceneY6MwRC18IMUT5Nfjz
        t23deaR8UWmXI6xR8eqZBV2c8C/P1OAr4kDXI7JNYG/A7zaj72qQ3Wc=
X-Google-Smtp-Source: AMrXdXtLiwD/3p/HJ0gPwuQWsAB+HkVnl3RsDOmFxc7rSZyKc6F+kDS+V+RVLm0y5RI8GOFPxyDIdxJVEt6FEk0wR+4=
X-Received: by 2002:a25:1984:0:b0:7fe:e7f5:e228 with SMTP id
 126-20020a251984000000b007fee7f5e228mr1432922ybz.582.1674573571459; Tue, 24
 Jan 2023 07:19:31 -0800 (PST)
MIME-Version: 1.0
References: <20230124150546.12876-1-naush@raspberrypi.com>
In-Reply-To: <20230124150546.12876-1-naush@raspberrypi.com>
From:   Naushir Patuck <naush@raspberrypi.com>
Date:   Tue, 24 Jan 2023 15:19:15 +0000
Message-ID: <CAEmqJPpbhoQh6aGGsoaRmhHXYT35T14GX3q-adyL1akKLDWSPw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] media: i2c: IMX296 camera sensor support
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Apologies, the subject should read IMX708 and not IMX296!

Thanks,
Naush


On Tue, 24 Jan 2023 at 15:08, Naushir Patuck <naush@raspberrypi.com> wrote:
>
> Hi,
>
> This series adds support for the Sony IMX708 camera sensor driver, with DT
> bindings in patch 1/2 and the device driver in patch 2/2.
>
> The Sony IMX708 is a 12MP MIPI CSI-2 sensor with a resolution of 4608x2592. It
> is a "quad-Bayer" sensor, with on-chip re-mosaicing to output standard Bayer
> data in 10-bits.
>
> The sensor is capable of capturing HDR images from the quad-Bayer arrangement
> and tone-mapping the image to 10-bits Bayer format. This functionality is
> switched on/off by the wide dynamic range control:
>
> v4l2-ctl --set-ctrl wide_dynamic_range=[0|1] -d /dev/v4l-subdev0
>
> Thanks,
> Naush
>
> Dave Stevenson (1):
>   dtbindings: media: i2c: Add IMX708 CMOS sensor binding
>
> Nick Hollinghurst (1):
>   media/i2c: Add a driver for the Sony IMX708 image sensor
>
>  .../devicetree/bindings/media/i2c/imx708.yaml |  119 +
>  MAINTAINERS                                   |    7 +
>  drivers/media/i2c/Kconfig                     |   11 +
>  drivers/media/i2c/Makefile                    |    1 +
>  drivers/media/i2c/imx708.c                    | 1923 +++++++++++++++++
>  5 files changed, 2061 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx708.yaml
>  create mode 100644 drivers/media/i2c/imx708.c
>
> --
> 2.25.1
>
