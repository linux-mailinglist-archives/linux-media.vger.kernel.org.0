Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93EAB715E9C
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 14:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbjE3MNV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 08:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbjE3MNU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 08:13:20 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB00C5
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 05:13:18 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5147f4bbfdaso5604342a12.0
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 05:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685448797; x=1688040797;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rtovy5Rc0W9Z3OIWjwmzInpkfIl4gQoQpsNAeJyEk3w=;
        b=DhR1U8gqOPatUPnmX7Y+5wl0+TJ1aYucG1zOxkuV5DLY8CxLCgmslS4SkVquLn9OgT
         gO4yz08QhQDf3RiyrpaC50K6uyJ6N2Y8r+Y68vmt5euxF+AcrIG+1mK1Ox7yd+/19eZl
         MMWwsmAuvWckBey9162uSdkcNjLbdih5xhji/RaXnzOd6FE989euHgsCI0ZnVZfBsm56
         MGeUdVnfxEu9sOgsY6DlcNJ/z8ziXLREJpeNogTUybVLpS11f9dUA8S3gsZQAs9Q5rU2
         gwOiapF6Kgkg0PaGX5WqK1DShT8cj0s7hyhLXuCodcuIOzfHbYU4gLwhLW77KmJ4BgLa
         43dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685448797; x=1688040797;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rtovy5Rc0W9Z3OIWjwmzInpkfIl4gQoQpsNAeJyEk3w=;
        b=FCU1xZiagNIxvdmLlmg57r2GYNZ0LZOZ79HmH4f77rB7IFIeG2dULnUzUZ6iu2QZf5
         3omTRRnw3CvhsL2+bvZV/SPJ7T4lj+xff9x3cWAmFdu0nU0Kf6iXfal3dx/mTir03Tkg
         emhpZRg8mhGub79XqZ2g+wqminZtWMUYwYd8K3EJ+PWnZCHHIKcHECZeI8p1omj14KD+
         au1pFoh5z2T6tNIIhK795UYq01Ab2Hm6LnxC3MYjuGio8cV5SIkuFeR5j0uUQDwN5w+o
         13xr3HRVBM5kbvXQWsOqodfEUQEbgrtk1YngdyRPBXTr7Z9Bv5OOoAEU/qytPBrkS20A
         LPkw==
X-Gm-Message-State: AC+VfDzEIQL1FYDrHo6f8x5ZzdTCTJ6GcZcdrN68eGySKcKvHa6WxC0+
        UwqZOKl5OLEgQT1K6UDX8ms=
X-Google-Smtp-Source: ACHHUZ57sxlzssMln2y/GL9Pk4kAFW6H9T5xkUUA2MB4RQRxBRXSntpQT87FmajoF9u8PeArvcxXpQ==
X-Received: by 2002:a17:907:1c17:b0:96a:ca96:3e49 with SMTP id nc23-20020a1709071c1700b0096aca963e49mr2482584ejc.13.1685448796927;
        Tue, 30 May 2023 05:13:16 -0700 (PDT)
Received: from [10.0.0.215] (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709061e8a00b0094ebc041e20sm7160171ejj.46.2023.05.30.05.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 05:13:16 -0700 (PDT)
Message-ID: <0d408891-5ca4-9cc9-b11d-7dec974cc059@gmail.com>
Date:   Tue, 30 May 2023 14:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND PATCH v3 32/32] media: Documentation: v4l: Document
 sub-device notifiers
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-33-sakari.ailus@linux.intel.com>
From:   Aishwarya Kothari <aishwaryakothari75@gmail.com>
In-Reply-To: <20230525091615.2324824-33-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25.05.23 11:16, Sakari Ailus wrote:
> Document that sub-device notifiers are now registered using
> v4l2_async_subdev_nf_init(). No documentation is changed as it seems that
> sub-device notifiers were not documented apart from kernel-doc comments.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   Documentation/driver-api/media/v4l2-subdev.rst | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index 83d3d29608136..d62b341642c96 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -193,9 +193,7 @@ picked up by bridge drivers.
>   Bridge drivers in turn have to register a notifier object. This is
>   performed using the :c:func:`v4l2_async_nf_register` call. To
>   unregister the notifier the driver has to call
> -:c:func:`v4l2_async_nf_unregister`. The former of the two functions
> -takes two arguments: a pointer to struct :c:type:`v4l2_device` and a
> -pointer to struct :c:type:`v4l2_async_notifier`.
> +:c:func:`v4l2_async_nf_unregister`.
>   
>   Before registering the notifier, bridge drivers must do two things: first, the
>   notifier must be initialized using the :c:func:`v4l2_async_nf_init`.
> @@ -204,6 +202,12 @@ that the bridge device needs for its operation. Several functions are available
>   to add subdevice descriptors to a notifier, depending on the type of device and
>   the needs of the driver.
>   
> +For a sub-device driver to register a notifier, the process is otherwise similar
> +to that of a bridge driver, apart from that the notifier is initialised using
> +:c:func:`v4l2_async_subdev_nf_init` instead. A sub-device notifier may complete
> +only after the V4L2 device becomes available, i.e. there's a path via async
> +sub-devices and notifiers to that root notifier.
> +
>   :c:func:`v4l2_async_nf_add_fwnode`, :c:func:`v4l2_async_nf_add_fwnode_remote`
>   :c:and func:`v4l2_async_nf_add_i2c` are for registering their async sub-devices
>   :c:with the notifier.

Works on Apalis i.MX6Q with TC358743.

Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com>

regards,
Aishwarya
