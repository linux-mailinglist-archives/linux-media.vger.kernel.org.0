Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C892328132
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 15:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236483AbhCAOpN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 09:45:13 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:33310 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236512AbhCAOpJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 09:45:09 -0500
Received: by mail-oi1-f179.google.com with SMTP id a13so18267357oid.0;
        Mon, 01 Mar 2021 06:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=J2ZIXJIHgZRZeDGR4OI2DHoLCDtP7CHTCmJZimg406g=;
        b=rMKnk/RZy0+YkBl2kZYXgtlSzcxGNgkluQn8mq2cSLXM6/whRHxK/gI+pKLQDNvEz9
         JyMBrJYERbigwdwncQ+zqGCFMQNi76m6Jpyw8os1Nx2xOVnLX/wm378UD4juKIATQBc+
         HyNZyTDiQUB7htcU9tLgcsZG06paxK4UXYuwhbLfv9ycQtohwiqJXxhzqxxCflmVfZY+
         hhaKRbfhMdVNId2RDMXBB/J95XABVyadCJV+uqn6dWvMQcW04g92+mYR3Bl7E2J5E5r5
         6lY87m962XU1/Ic2SnHw6BxnMYv8JSPXqqWrpoXWoruPUGH86XOfsnarKOwXu8HzKwgc
         J6IA==
X-Gm-Message-State: AOAM5329F88DEZ/BkPXwH1JNVAs73+aOgt8gEfSpyeivo/LmmM/1ENbC
        BYDfE5Qz3gcXsgakFmqf8w==
X-Google-Smtp-Source: ABdhPJwdfoSh104CVJJRArrFpm/81kQs1A+e8U2RsvVCJfYlkMgYgzy/vlQGFHJIYsxPcGk+LpsC5w==
X-Received: by 2002:aca:5fd4:: with SMTP id t203mr11622994oib.121.1614609868060;
        Mon, 01 Mar 2021 06:44:28 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n20sm1167413otj.3.2021.03.01.06.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 06:44:26 -0800 (PST)
Received: (nullmailer pid 37862 invoked by uid 1000);
        Mon, 01 Mar 2021 14:44:21 -0000
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     linux-arm-kernel@lists.infradead.org, mchehab@kernel.org,
        festevam@gmail.com, linux-imx@nxp.com, robh+dt@kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org, p.zabel@pengutronix.de,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        s.hauer@pengutronix.de, linux-rockchip@lists.infradead.org,
        kernel@collabora.com, ezequiel@collabora.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
In-Reply-To: <20210226091128.14379-3-benjamin.gaignard@collabora.com>
References: <20210226091128.14379-1-benjamin.gaignard@collabora.com> <20210226091128.14379-3-benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: media: IMX8MQ VPU: document reset usage
Date:   Mon, 01 Mar 2021 08:44:21 -0600
Message-Id: <1614609861.076244.37861.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 26 Feb 2021 10:11:25 +0100, Benjamin Gaignard wrote:
> Document IMX8MQ VPU bindings to add the phandle to the reset driver.
> 
> Provide an independent reset driver allow to the both VPUs to share
> their control/reset hardware block. The reset driver replace what
> was previously done be using the 'ctrl' registers inside the driver.
> 
> This breaks the compatibility between DTB and kernel but the driver
> is still in staging directory and limited to IMX8MQ SoC.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml     | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.example.dt.yaml: video-codec@38300000: reg: [[942669824, 65536], [942735360, 65536], [942800896, 65536]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml

See https://patchwork.ozlabs.org/patch/1444845

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

