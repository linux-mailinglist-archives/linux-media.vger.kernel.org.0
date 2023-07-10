Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 408AB74D9DD
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 17:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232643AbjGJP1F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 11:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbjGJP1E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 11:27:04 -0400
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69828F2;
        Mon, 10 Jul 2023 08:27:03 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-785ccf19489so228868039f.3;
        Mon, 10 Jul 2023 08:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689002822; x=1691594822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/Yt1jjt4RB+rHyE/OSu8Kmx69TzBb4zP1aB3W+7eGk=;
        b=YuUd8E30JztQmWnr2f4BKmvEXeL+BCVCjO3LH8Zk9pm+AefN3+xRl697vgzRpbe5vh
         J4bTtXQ2FX+HRZEaKbpNlNko1UksAtAUg4GTGjHNEGNfM7D02PdZVuZhrfQTCd12e/1S
         eXaAJVlZUbKRC4O2GaSFs/Wdy9+BwPoYLKv1DTyfRT2wE+GdKGN9h2VjAx68/vr7ZTcy
         ERt2T75QTCfwSo0V/jBWgy5/yHACpkT3iWYhk3o9ls9g6r0ryo3ojtc0of+FdwXMtB37
         ex5TW9I1s7oZyTS6dVlRAqzbL3kGRx484eSxnuoGHgUQIZX21RJ2+auU1j0iCRapuQq3
         SUIA==
X-Gm-Message-State: ABy/qLYa7xeuI7r7zGQ2QYc7U2YgV2mNzi5y9bCOEXr1DxtQ0RlEUl5Y
        uLaqhtgnghRi9MzfGUbVIQ==
X-Google-Smtp-Source: APBJJlFOomkXtcVZs1pBRwqpT5LEp5z4ztED4AXuipJCEJtcF1/7v4TJXh3CeGUkkGk7F4qAFqtwyQ==
X-Received: by 2002:a5d:8888:0:b0:787:1a8f:1d08 with SMTP id d8-20020a5d8888000000b007871a8f1d08mr971634ioo.15.1689002822615;
        Mon, 10 Jul 2023 08:27:02 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id ed12-20020a056638290c00b0042b265bf3besm3305730jab.115.2023.07.10.08.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 08:27:01 -0700 (PDT)
Received: (nullmailer pid 2006445 invoked by uid 1000);
        Mon, 10 Jul 2023 15:27:00 -0000
Date:   Mon, 10 Jul 2023 09:27:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     guoniu.zhou@oss.nxp.com
Cc:     devicetree@vger.kernel.org, jacopo.mondi@ideasonboard.com,
        alexander.stein@ew.tq-group.com, linux-imx@nxp.com,
        conor+dt@kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add binding doc for i.MX93
 MIPI CSI-2
Message-ID: <168900281965.2006383.8223278229402409237.robh@kernel.org>
References: <20230710060352.584286-1-guoniu.zhou@oss.nxp.com>
 <20230710060352.584286-2-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710060352.584286-2-guoniu.zhou@oss.nxp.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Mon, 10 Jul 2023 14:03:51 +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Add new binding documentation for DesignWare Core MIPI CSI-2 receiver
> and DPHY found on NXP i.MX93.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,dwc-mipi-csi2.yaml     | 130 ++++++++++++++++++
>  1 file changed, 130 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

