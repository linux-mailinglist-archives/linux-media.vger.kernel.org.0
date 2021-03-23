Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCB4B346D46
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 23:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhCWWgn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 18:36:43 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:34694 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233988AbhCWWfY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 18:35:24 -0400
Received: by mail-io1-f43.google.com with SMTP id x16so19466750iob.1;
        Tue, 23 Mar 2021 15:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4F+lOADfr1heBBT3R6eeIF8gc1ZCUohYhREHfhhKIaM=;
        b=WNFe5I6pk9S0EDLO/U6ioVxvXM/bXy2ir4WYsllYfJNf10L2JNTAWpDhy4q7ZOsgT1
         ca/3mP/d+Ic7IW99zhR9cfjWkpdG+9hzBUsfzO0qzD8/SPyttPu2pLdw3bjvX2nYksrX
         lLzZgNmj9g2/hI7jIr+CI5MacRPuqwWkomnPMSmq5vfdpMF5/oXbAc/uUpWuSUl5rfmE
         PhpEesCJZ9tqIdz4vmkmtYLTN/k0ZWOyjKu0T02xehurUKDGfO9c6KVVOZRgBuPYLQA+
         NNRxgJYAs8LWFLnGrSTTNCD6/k5wP4Wy0CTgep15Z8dpx8jm16rFWG8A3QYlqLmzeXFp
         9AjQ==
X-Gm-Message-State: AOAM53046qFxnJTxshyqBcNCZON3cMlB+61HoUWymbsobwbpaJvirU+D
        DUR4Vk7bJEUmHlmkM1ljow==
X-Google-Smtp-Source: ABdhPJwblVg/v3ollbI0VK93RilPemu4LaeZa6xI4qEOVejZrRMxABDv4sARTyakc2IayFK+/ohQkA==
X-Received: by 2002:a02:4c8:: with SMTP id 191mr223485jab.27.1616538923860;
        Tue, 23 Mar 2021 15:35:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id y13sm121459ilq.20.2021.03.23.15.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:35:23 -0700 (PDT)
Received: (nullmailer pid 1470854 invoked by uid 1000);
        Tue, 23 Mar 2021 22:35:21 -0000
Date:   Tue, 23 Mar 2021 16:35:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mripard@kernel.org, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, lee.jones@linaro.org,
        s.hauer@pengutronix.de, emil.l.velikov@gmail.com,
        linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, wens@csie.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, mchehab@kernel.org,
        shawnguo@kernel.org, ezequiel@collabora.com, festevam@gmail.com,
        paul.kocialkowski@bootlin.com, hverkuil-cisco@xs4all.nl,
        kernel@pengutronix.de, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, kernel@collabora.com,
        jernej.skrabec@siol.net
Subject: Re: [PATCH v6 02/13] dt-bindings: media: nxp, imx8mq-vpu: Update the
 bindings for G2 support
Message-ID: <20210323223521.GA1470799@robh.at.kernel.org>
References: <20210318082046.51546-1-benjamin.gaignard@collabora.com>
 <20210318082046.51546-3-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318082046.51546-3-benjamin.gaignard@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 18 Mar 2021 09:20:35 +0100, Benjamin Gaignard wrote:
> Introducing G2 hevc video decoder lead to modify the bindings to allow
> to get one node per VPUs.
> VPUs share one hardware control block which is provided as a phandle on
> an syscon.
> Each node got now one reg and one interrupt.
> Add a compatible for G2 hardware block: nxp,imx8mq-vpu-g2.
> 
> To be compatible with older DT the driver is still capable to use 'ctrl'
> reg-name even if it is deprecated now.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 5:
> - This version doesn't break the backward compatibilty between kernel
>   and DT.
> 
>  .../bindings/media/nxp,imx8mq-vpu.yaml        | 53 ++++++++++++-------
>  1 file changed, 34 insertions(+), 19 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
