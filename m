Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F414734C52E
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 09:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhC2HrO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 03:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbhC2Hq5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 03:46:57 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D427C061756
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 00:46:56 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id j7so11809455wrd.1
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 00:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gKqOr9BTXct/tRsLbZ99P7dlk5cf6Eud2sZybPk3YFo=;
        b=kaPRrDWVtSv6ShmZ7l0uPXzHIzC5TB8pxZhs6iM8eklwxyqkk3hSXri0EW3sEsdSGZ
         RYCosMqpvYPmWWK3Olvp7jvfSIGhDkPsQKuk7lJkUEASFm3Wq1vve2XYqAesVqVKWacb
         IM0SwInTrz2+8mBitRL5PfkWeFKG2RijXhy57LrcyzeHwtdEoCTCgFdfENO55ziqjP+V
         vNrESlDG8snaSn2HAQB/eOCuWt2JqREsKn+UGUGZxecGRwCsrUsU7QRUiugwtTmWzPtS
         2SEGvscbjiki2IqS3XojMj1mgyecW99Fz8h5nRRNOnkmecGF6OJSGCOtapM9VIC0/Sgb
         I1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gKqOr9BTXct/tRsLbZ99P7dlk5cf6Eud2sZybPk3YFo=;
        b=l9mAl+g9k+ChbmwhFkSh5iTP9UMOaOljEanjxkG/I370FuLp6tM7VJne+1ofoxl+OR
         codK8LEj8hth5dsnVyCw3xHdEA84V/C/RUIbmxo/kshItrhxKHbJrT6U/81nOQEvmbMg
         LoSIuiebaVlFeMXRu4SMcWJFMzQ2HJkZaCifMjgnLIItzkrSVuaBbmFVhA4QDBk4PA/O
         oUja5WmYAvXaCK8KtHOdm5geMTqQym34Z32oUxSwXImH4yn9PIhJ7BYv6S4Y73K36VES
         tVeSIhR3h2JyTv28usQKSHHlrzOSxvIiz1fnk6Ki9u75O2Kpp5OEJe7tvbiZroqLQleB
         1gvw==
X-Gm-Message-State: AOAM533mfqRJ6eIKcyMMUJaHdkbV9zVVLUEygOBnZlcjl12VJquMhUUB
        8YDL0UWdmVJ5RmtDLWXb3+jNHw==
X-Google-Smtp-Source: ABdhPJzWzZhMRMPnCKckhJQXhaq4Dq6bmLUHi3xHIiorsZ6H00ywKErdNka2kYZzNUgvcZShJCKXEg==
X-Received: by 2002:a05:6000:1149:: with SMTP id d9mr26758779wrx.347.1617004015168;
        Mon, 29 Mar 2021 00:46:55 -0700 (PDT)
Received: from dell ([91.110.221.217])
        by smtp.gmail.com with ESMTPSA id r206sm18457285wma.46.2021.03.29.00.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 00:46:54 -0700 (PDT)
Date:   Mon, 29 Mar 2021 08:46:50 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        emil.l.velikov@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 01/13] dt-bindings: mfd: Add 'nxp,imx8mq-vpu-ctrl' to
 syscon list
Message-ID: <20210329074650.GC2916463@dell>
References: <20210329065743.11961-1-benjamin.gaignard@collabora.com>
 <20210329065743.11961-2-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210329065743.11961-2-benjamin.gaignard@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 29 Mar 2021, Benjamin Gaignard wrote:

> Add 'nxp,imx8mq-vpu-ctrl' in the list of possible syscon.
> It will used to access to the VPU control registers.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> version 7:
>  - Add Rob ack
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
