Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49E9346D38
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 23:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233777AbhCWWeF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 18:34:05 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:34403 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234087AbhCWWdh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 18:33:37 -0400
Received: by mail-il1-f179.google.com with SMTP id h1so19645346ilr.1;
        Tue, 23 Mar 2021 15:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GhZf/2qAH49jtPj0KjvHuxl514fTGF2Hh0sAaac8WcE=;
        b=tcDJHT5V+an7KViYseJ5Jq+7tjxxxVG6V8dUtwQ4VXunBUN6qAA8lVP7mP7dqLkSwZ
         qAFsu5IuPyN+q46ec9PJ1m+PXpZPhq7IVRVqlWw9guwTqTka44UKUyKO5gTuUF6YL9Jj
         ruxz1w7ftK9F8W15Z6KwuF9G8G5Q0DnSu/HDyqAPh28jkrzyzN0V8W6EsV897/c7GjYz
         /antevM1zt4C/WVi0XZIsYa6gCi0mkx4QBZyB6buj/vphW4ELKb4PVZVHxHxarUY+wyt
         yOR/o49+M195enkuJgNnZaj1ZgTI+BTQQR0EisATSIZUHnzADB8X0h6Xs27cENbmyh/v
         yhGA==
X-Gm-Message-State: AOAM531yTEHfKLQVXShww7rokoU0ufpsTmgs8JKf/oNm8zS2UhqdKx/3
        3zWynzmBAPQCMtEm74pMAg==
X-Google-Smtp-Source: ABdhPJyVZfRKp/SOD+KhYi2Vs4tfmHLlCtfIT4JSPJohRlIUVQpOmdAhgbsj0jDsSZgjmkB2COXUSQ==
X-Received: by 2002:a92:d80f:: with SMTP id y15mr358713ilm.96.1616538813476;
        Tue, 23 Mar 2021 15:33:33 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id i3sm105260ilu.67.2021.03.23.15.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:33:32 -0700 (PDT)
Received: (nullmailer pid 1467787 invoked by uid 1000);
        Tue, 23 Mar 2021 22:33:29 -0000
Date:   Tue, 23 Mar 2021 16:33:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, kishon@ti.com, robert.foss@linaro.org,
        jonas@kwiboo.se, mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, shawnguo@kernel.org,
        dri-devel@lists.freedesktop.org, vkoul@kernel.org,
        jernej.skrabec@siol.net, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Laurent.pinchart@ideasonboard.com, s.hauer@pengutronix.de,
        a.hajda@samsung.com, lee.jones@linaro.org, airlied@linux.ie,
        narmstrong@baylibre.com
Subject: Re: [PATCH v6 07/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and
 Status Registers module binding
Message-ID: <20210323223329.GA1467753@robh.at.kernel.org>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <1615952569-4711-8-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615952569-4711-8-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 17 Mar 2021 11:42:42 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v5->v6:
> * Drop 'select' schema. (Rob)
> 
> v4->v5:
> * Newly introduced in v5. (Rob)
> 
>  .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 192 +++++++++++++++++++++
>  1 file changed, 192 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
