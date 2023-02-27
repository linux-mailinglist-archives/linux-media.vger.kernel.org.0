Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABCCA6A4E03
	for <lists+linux-media@lfdr.de>; Mon, 27 Feb 2023 23:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjB0WbJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Feb 2023 17:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjB0WbI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Feb 2023 17:31:08 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A79CA2821C
        for <linux-media@vger.kernel.org>; Mon, 27 Feb 2023 14:30:59 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id u6so5187318ilk.12
        for <linux-media@vger.kernel.org>; Mon, 27 Feb 2023 14:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=myEdvdq6sQLyCWsb88h5ihQkjwcwk0lhyKPa67PO4cg=;
        b=MKM0um1f+R/P/20BroI3zuwDhhG3hI/1MJ3qa1WVpZkFT3WE5NdXAKVN84gkDIi6Ry
         6WuC70ws2gEmsjDGHM2nlE2evQMzp78Pbzf0GNQzWae4k/PRPhW1ObdX/SAkk1GDrh2H
         HdxJXa35Q/ymsECDPOBAx1mQjJGr9msOrxyNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=myEdvdq6sQLyCWsb88h5ihQkjwcwk0lhyKPa67PO4cg=;
        b=adJAPCNw7lo+XZuI7VaJiG5Py9lvzhW5VenfZ3g53TaRctmQN+y3VBJuHe1zi581At
         wnPmTACwyOcjJp2QW5SFb4mfKzO+FNERvfHmN5NzPoCEn5RY9ZT8AA03qFGsVp+G4Xox
         y6FWD/K00+2JiQDT8kJUIDZV6vZOPubMNBU1/IetbuAAmvm54ubfPKX59XTlz/E2ydKp
         x2alK695Q9BQ4a7nQnSst5UlrPyTazDDWT6WcM4OdnX7V9Cgisajc05AV9pTauR//FnZ
         ijQv5BA/FnrZsGBQTgIgChfLwX/A8FBcT4BH0cTw5Ar3aZTeg1MB67seD1eaA7xia3iW
         2GTQ==
X-Gm-Message-State: AO0yUKXCVJSsDgiq9nfIT/+SavBNgRMJRldG6fTW7If9tQgP6xC87+ln
        IEdsdK4WgLJs0DEujDgQ2qnkaw==
X-Google-Smtp-Source: AK7set+PlLQ/N5F7Tm5aX6/xECBjAXnxX35GfMa56VpZVUGuL1+6o9ThDk2k3UTETTceLfC1hDESEQ==
X-Received: by 2002:a05:6e02:1a8d:b0:317:1ca3:f518 with SMTP id k13-20020a056e021a8d00b003171ca3f518mr960813ilv.0.1677537058942;
        Mon, 27 Feb 2023 14:30:58 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id g23-20020a02bb97000000b003a58ae912aasm2543873jan.28.2023.02.27.14.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 14:30:58 -0800 (PST)
Message-ID: <0bdb56d7-15df-269a-abd5-0cea3f8f5e4a@linuxfoundation.org>
Date:   Mon, 27 Feb 2023 15:30:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] media: Zero-initialize all structures passed to
 subdev pad operations
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230215165021.6628-1-laurent.pinchart@ideasonboard.com>
 <20230215165021.6628-2-laurent.pinchart@ideasonboard.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230215165021.6628-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/15/23 09:50, Laurent Pinchart wrote:
> Several drivers call subdev pad operations, passing structures that are
> not fully zeroed. While the drivers initialize the fields they care
> about explicitly, this results in reserved fields having uninitialized
> values. Future kernel API changes that make use of those fields thus
> risk breaking proper driver operation in ways that could be hard to
> detect.
> 
> To avoid this, make the code more robust by zero-initializing all the
> structures passed to subdev pad operation. Maintain a consistent coding
> style by preferring designated initializers (which zero-initialize all
> the fields that are not specified) over memset() where possible, and
> make variable declarations local to inner scopes where applicable. One
> notable exception to this rule is in the ipu3 driver, where a memset()
> is needed as the structure is not a local variable but a function
> parameter provided by the caller.
> 
> Not all fields of those structures can be initialized when declaring the
> variables, as the values for those fields are computed later in the
> code. Initialize the 'which' field in all cases, and other fields when
> the variable declaration is so close to the v4l2_subdev_call() call that
> it keeps all the context easily visible when reading the code, to avoid
> hindering readability.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/pci/cobalt/cobalt-v4l2.c        | 16 ++++++----
>   drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  1 +
>   .../media/platform/qcom/camss/camss-video.c   |  5 ++--
>   .../media/platform/renesas/vsp1/vsp1_video.c  |  5 ++--
>   .../samsung/exynos4-is/fimc-capture.c         | 11 ++++---
>   .../samsung/exynos4-is/fimc-isp-video.c       | 10 +++++--
>   .../platform/samsung/exynos4-is/fimc-lite.c   |  9 ++++--
>   .../samsung/s3c-camif/camif-capture.c         |  5 ++--
>   .../platform/samsung/s3c-camif/camif-core.c   |  5 ++--
>   .../media/platform/ti/am437x/am437x-vpfe.c    | 20 +++++++------
>   drivers/media/platform/ti/cal/cal-video.c     | 29 ++++++++++---------
>   drivers/media/platform/ti/omap3isp/ispccdc.c  |  5 ++--
>   drivers/media/platform/ti/omap3isp/ispvideo.c | 20 ++++++++-----
>   drivers/media/platform/xilinx/xilinx-dma.c    |  5 ++--
>   drivers/media/test-drivers/vimc/vimc-common.c |  8 ++---

For vimc

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

