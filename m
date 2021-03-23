Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22AA4346D3B
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 23:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234056AbhCWWeJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 18:34:09 -0400
Received: from mail-il1-f173.google.com ([209.85.166.173]:41478 "EHLO
        mail-il1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233998AbhCWWd7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 18:33:59 -0400
Received: by mail-il1-f173.google.com with SMTP id r8so19649570ilo.8;
        Tue, 23 Mar 2021 15:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1WoClusEkOfDI9wl2HJjQIHrJPuS0gJSk2OCwRkvDpY=;
        b=sscvZlhPJXn0kYWKiEFIzpPY1+coMKd8tAvNHfRIhlrUzfPqx49+FG9IKr6hG+m35q
         r6nv06fmlms13kcXOdTDOG+vah9EYvSd82JyaYcTcK3UjF7H20mdz/4qVvQ8/O0Q0dE4
         TAhc0fdNieh8hDyLhnxXJDYxARcfEOe6hF6ySSRaOjMEEPMGdD7jFP+XGYGd5Wxug/q0
         kZ6I1fZ9LDhDZXOWRvb3RM1q73nYOhue1BykhsFtW1Ke6GVlrMJ03g+XkUPh9aVTsy7G
         gvd8ujN1aIMEszgxI9yMma9JWbC3FA9MR1SNCJyr8qYDMiclKQdOySeAmkfzJ1JXqFkF
         Fwhw==
X-Gm-Message-State: AOAM533kYTECxly6OktxbB2AQKcJP+DEUb7WIpKFfrmPgvhULL78wkYp
        vMX0d5YIB51zId5sXnsmVA==
X-Google-Smtp-Source: ABdhPJzfOBNB+j3wZfc4QmDzvSzG/k6H7Hd6eitCOGrxlYx5RIAJt5rxTKsg+9ttUF711gq1ZDa7dQ==
X-Received: by 2002:a92:d7c7:: with SMTP id g7mr309586ilq.305.1616538838716;
        Tue, 23 Mar 2021 15:33:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id o10sm120122ilq.22.2021.03.23.15.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:33:58 -0700 (PDT)
Received: (nullmailer pid 1468543 invoked by uid 1000);
        Tue, 23 Mar 2021 22:33:55 -0000
Date:   Tue, 23 Mar 2021 16:33:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     hverkuil-cisco@xs4all.nl, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-rockchip@lists.infradead.org,
        robh+dt@kernel.org, wens@csie.org, shawnguo@kernel.org,
        paul.kocialkowski@bootlin.com, festevam@gmail.com,
        lee.jones@linaro.org, kernel@collabora.com,
        linux-kernel@vger.kernel.org, mchehab@kernel.org,
        gregkh@linuxfoundation.org, jernej.skrabec@siol.net,
        p.zabel@pengutronix.de, ezequiel@collabora.com, mripard@kernel.org,
        s.hauer@pengutronix.de, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-imx@nxp.com, emil.l.velikov@gmail.com
Subject: Re: [PATCH v6 01/13] dt-bindings: mfd: Add 'nxp, imx8mq-vpu-ctrl' to
 syscon list
Message-ID: <20210323223355.GA1468513@robh.at.kernel.org>
References: <20210318082046.51546-1-benjamin.gaignard@collabora.com>
 <20210318082046.51546-2-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318082046.51546-2-benjamin.gaignard@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 18 Mar 2021 09:20:34 +0100, Benjamin Gaignard wrote:
> Add 'nxp,imx8mq-vpu-ctrl' in the list of possible syscon.
> It will used to access to the VPU control registers.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
