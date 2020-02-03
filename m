Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 079B3150F11
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 19:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729513AbgBCSCo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 13:02:44 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40432 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbgBCSCo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 13:02:44 -0500
Received: by mail-pl1-f195.google.com with SMTP id y1so6152097plp.7
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2020 10:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0z4xw4BeflaOTebZuwoiVPM7Ym0RVfiYJ39j1NuVvqM=;
        b=KoUFZ7B+ZrJt1l8ZOQJoXPkMIL95ryAMqyfdGFP8KeWeeRp1lMU13TMLACrG0ChiL5
         plhUgDce0INjw957wBXRRQJ6OfeY5B8dQnK+0bZ2wABNsI9oU8WoscZYJ4OI8AogQB1X
         dQMQbWN7cAHjrt+ZZnQ8CsI9hXZ89Fd2GkiVmtq/GXRMBEw3ivkQyrWPHa2eu1JSbWPc
         v+g8XSCRbzHACgfW7M2fdOIDnX8jS8yB3Kh9pWAz1lgZXqBowMJyuWmYEW1OvWEOscCs
         DnBxP0ITR5Oxk0U74JhdG+KATDqnpLnVuLAiEBaRFPsXBWdwpAnIYd3kkf3VtrVEty2C
         I06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0z4xw4BeflaOTebZuwoiVPM7Ym0RVfiYJ39j1NuVvqM=;
        b=bN511dMrkUbaocyp6GSES3VQszUCLDmibpoCTcAbqj/7FdLnguLxT7TBe6jZ2ZOMD1
         E7uhZR4F5LsB2RxBVDCqcfMwkSMlUs8CjCaUo5PfjLUgjruPVxVcw5iB9zP5xCCsiawD
         eggqJyMg3G3i3FoVq7B3Maifd9gw2ofxSWcO2MWKHuaEdgKDf2QfPkVvh8G9fRe+ArCT
         wz0yRawEizACbXjdl3OTznFBc65YKmsqkCyehb7JcnoRyf7v8dynyCSJ5mABWO41ULrd
         8S0290ZUHkfsREcIlKygbQHnta/Gg2Yl8l3wlxtS0dT9Shy9wtm/hPFyS3r48Cnh3o3o
         NfCQ==
X-Gm-Message-State: APjAAAX5FOWWoz46Y1D7cwOmb1DEwtTxSZXwGVnFB6sClzO4oyQ3g/VB
        7BNWXiU2v50I1ESikYeaA8gzPQ==
X-Google-Smtp-Source: APXvYqy4E3aojhy38aJZFfYOHvNBw5Qdycb8SsmfK816pdRuDYZmSaC0IYSB5EQqbt8rPJC5X8xjjw==
X-Received: by 2002:a17:902:9b93:: with SMTP id y19mr24520456plp.89.1580752963506;
        Mon, 03 Feb 2020 10:02:43 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 10sm21441424pfu.132.2020.02.03.10.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 10:02:42 -0800 (PST)
Date:   Mon, 3 Feb 2020 10:02:40 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH V4 0/4] Enable video on sc7180
Message-ID: <20200203180240.GD3948@builder>
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue 14 Jan 04:53 PST 2020, Dikshita Agarwal wrote:

> Hello,
> 
> Changes since v3:
> 
>   - addressed DT and DT schema review comments.
> 
>   - renamed DT schema file.
> 
> v3 can be found at [1].
> These changes depend on patch series [2] - [6].
> 
> Thanks,
> Dikshita
> 

Picked up the dts patches for 5.7, with Stan's acks

Regards,
Bjorn

> [1] https://lkml.org/lkml/2020/1/2/267
> [2] https://patchwork.kernel.org/project/linux-media/list/?series=219021
> [3] https://patchwork.kernel.org/project/linux-media/list/?series=214797
> [4] https://lkml.org/lkml/2019/12/27/73
> [5] https://lore.kernel.org/patchwork/project/lkml/list/?series=418681
> [6] https://lore.kernel.org/patchwork/project/lkml/list/?series=424054
> 
> Dikshita Agarwal (4):
>   arm64: dts: sc7180: Add Venus video codec DT node
>   dt-bindings: media: venus: Add sc7180 DT schema
>   venus: core: add sc7180 DT compatible and resource struct
>   arm64: dts: sc7180: Add Venus firmware subnode
> 
>  .../bindings/media/qcom,sc7180-venus.yaml          | 144 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   6 +
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               |  36 ++++++
>  drivers/media/platform/qcom/venus/core.c           |  45 +++++++
>  4 files changed, 231 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> 
> -- 
> 1.9.1
> 
