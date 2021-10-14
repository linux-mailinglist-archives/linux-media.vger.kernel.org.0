Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8AF42DE0C
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 17:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbhJNP0h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 11:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbhJNP0g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 11:26:36 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 862B2C061570;
        Thu, 14 Oct 2021 08:24:31 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id e3so20477984wrc.11;
        Thu, 14 Oct 2021 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=7DYraTKVFQ/YhB50A+bKYiuBxAYAaNnBsfurAIoV3Ow=;
        b=IkuJmQnFQyicY4+5UnmJPtpNg4zG8NH2yq5chVV7RnFzsChIVhahfRmMbyRDVEf4Ko
         0gjmH+cu42Y0p9mJUzbZhDJd0cdA+2BSw+KjylsaGvToXF05i3ghfQZLGLoJvnMUMUB9
         qVkY83ZmtzZAK89ZKH3XP7ybsrTwE4+qkBTD+dLY62KxnEqYtzBRjP4CMWoxhC/zQG0p
         Qy9D6mgbGdO2t8BG0tQcRuO7D0c4NEk9hgbTLS6epD9wWt0PZS2TaY8fWNkZwfkFR8wH
         brb5gQ+rmhuyExpvnl5kZ9ESN7ZYoQQe1ctGmtkNLTlc57hFSrjiLDskCRk/NewrXWdd
         R5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=7DYraTKVFQ/YhB50A+bKYiuBxAYAaNnBsfurAIoV3Ow=;
        b=6px0RTbhEn9IAfAyKCX2TijHdMLgGHfbfR7unlW1gmpI4FLGDS53rG/v6ATJPvYcUY
         Y/ZY/u5JnMUbdLzPNjCtdGVwO+08qFZm8kS7WZbM8Az+Fyu8nJhLqn3i35YQavBz5PWs
         SZJTUXtznMXUEzpVcIjvXkQpDefg16jOuziYLEwN68BU2UZAlwwxhUWfBjH+hJryBmw0
         lQf3oMoQKfiemgyzRpUvHHzQpe9FRzVMxLt2uMxckn/wNwEzY99pZOxiJeQPpE72WvrR
         SHYfbPQpbwsdxztM9CPbRGms+6aCgLEFdpAXQTXeRzNxG1WpoYPAyl66t0fD+moioLTr
         uIIw==
X-Gm-Message-State: AOAM532qScxE93Wc8/pQz+qId7fk4E3yzND7zYFhtbYWvYjB+kq14xrx
        gt1rkcJ9xFTQwsyD9Dm0tbg=
X-Google-Smtp-Source: ABdhPJzstvL2NIQyqFUP9VeeI54SPLy2d3d9P9GmhHp4+7RmVgJZ/aW/HpE3WfHAdgJPG9vLGFsiGg==
X-Received: by 2002:adf:c70f:: with SMTP id k15mr7475632wrg.98.1634225069932;
        Thu, 14 Oct 2021 08:24:29 -0700 (PDT)
Received: from ?IPV6:2620:113:80c0:8000:c::779? (nat0.nue.suse.com. [2001:67c:2178:4000::1111])
        by smtp.gmail.com with ESMTPSA id w5sm2590437wrq.86.2021.10.14.08.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 08:24:29 -0700 (PDT)
Message-ID: <87ca8c35-bfec-dce8-4948-d9be2bd4f74c@gmail.com>
Date:   Thu, 14 Oct 2021 17:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Content-Language: en-US
To:     Moudy Ho <moudy.ho@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, drinkcat@chromium.org, acourbot@chromium.org,
        pihsun@chromium.org, menghui.lin@mediatek.com,
        sj.huang@mediatek.com, ben.lok@mediatek.com, randy.wu@mediatek.com,
        srv_heupstream@mediatek.com, hsinyi@google.com
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
 <20210824100027.25989-3-moudy.ho@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 2/5] soc: mediatek: mmsys: Add support for MDP
In-Reply-To: <20210824100027.25989-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 24/08/2021 12:00, Moudy Ho wrote:
> Add functions to support MDP:
>    1. MDP connect/disconnect functions
>    2. ISP control function
>    3. Write register via CMDQ

Sounds like three patches instead of one.

> 
> Add MDP related settings for 8183 SoC
>    1. Register settings
>    2. MDP route table
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8183-mmsys.h    | 235 +++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c       | 164 +++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.h       |   9 +-
>   include/linux/soc/mediatek/mtk-mmsys.h |  81 +++++++++
>   4 files changed, 486 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mt8183-mmsys.h b/drivers/soc/mediatek/mt8183-mmsys.h
> index 579dfc8dc8fc..2fa79e745a45 100644
> --- a/drivers/soc/mediatek/mt8183-mmsys.h
> +++ b/drivers/soc/mediatek/mt8183-mmsys.h
> @@ -12,6 +12,32 @@
>   #define MT8183_DISP_DPI0_SEL_IN			0xf30
>   #define MT8183_DISP_RDMA0_SOUT_SEL_IN		0xf50
>   #define MT8183_DISP_RDMA1_SOUT_SEL_IN		0xf54
> +#define MT8183_MDP_ISP_MOUT_EN			0xf80
> +#define MT8183_MDP_RDMA0_MOUT_EN		0xf84
> +#define MT8183_MDP_PRZ0_MOUT_EN			0xf8c
> +#define MT8183_MDP_PRZ1_MOUT_EN			0xf90
> +#define MT8183_MDP_COLOR_MOUT_EN		0xf94
> +#define MT8183_MDP_IPU_MOUT_EN			0xf98
> +#define MT8183_MDP_PATH0_SOUT_SEL		0xfa8
> +#define MT8183_MDP_PATH1_SOUT_SEL		0xfac
> +#define MT8183_MDP_PRZ0_SEL_IN			0xfc0
> +#define MT8183_MDP_PRZ1_SEL_IN			0xfc4
> +#define MT8183_MDP_TDSHP_SEL_IN			0xfc8
> +#define MT8183_MDP_WROT0_SEL_IN			0xfd0
> +#define MT8183_MDP_WDMA_SEL_IN			0xfd4
> +#define MT8183_MDP_PATH0_SEL_IN			0xfe0
> +#define MT8183_MDP_PATH1_SEL_IN			0xfe4
> +#define MT8183_MDP_AAL_MOUT_EN			0xfe8
> +#define MT8183_MDP_AAL_SEL_IN			0xfec
> +#define MT8183_MDP_CCORR_SEL_IN			0xff0
> +#define MT8183_MDP_CCORR_SOUT_SEL		0xff4
> +
> +#define MT8183_ISP_CTRL_MMSYS_SW0_RST_B		0x140
> +#define MT8183_ISP_CTRL_MMSYS_SW1_RST_B		0x144
> +#define MT8183_ISP_CTRL_MDP_ASYNC_CFG_WD	0x934
> +#define MT8183_ISP_CTRL_MDP_ASYNC_IPU_CFG_WD	0x93C
> +#define MT8183_ISP_CTRL_ISP_RELAY_CFG_WD	0x994
> +#define MT8183_ISP_CTRL_IPU_RELAY_CFG_WD	0x9a0
>   
>   #define MT8183_OVL0_MOUT_EN_OVL0_2L		BIT(4)
>   #define MT8183_OVL0_2L_MOUT_EN_DISP_PATH0	BIT(0)
> @@ -24,6 +50,55 @@
>   #define MT8183_DPI0_SEL_IN_RDMA1		0x2
>   #define MT8183_RDMA0_SOUT_COLOR0		0x1
>   #define MT8183_RDMA1_SOUT_DSI0			0x1
> +#define MT8183_MDP_ISP_MOUT_EN_CCORR0		BIT(0)
> +#define MT8183_MDP_ISP_MOUT_EN_RSZ1		BIT(1)
> +#define MT8183_MDP_ISP_MOUT_EN_AAL0		BIT(2)
> +#define MT8183_MDP_IPU_MOUT_EN_CCORR0		BIT(0)
> +#define MT8183_MDP_IPU_MOUT_EN_RSZ1		BIT(1)
> +#define MT8183_MDP_IPU_MOUT_EN_AAL0		BIT(2)
> +#define MT8183_MDP_RDMA0_MOUT_EN_CCORR0		BIT(0)
> +#define MT8183_MDP_RDMA0_MOUT_EN_RSZ1		BIT(1)
> +#define MT8183_MDP_RDMA0_MOUT_EN_PATH0_OUT	BIT(2)
> +#define MT8183_MDP_RDMA0_MOUT_EN_AAL0		BIT(3)
> +#define MT8183_MDP_AAL_MOUT_EN_CCORR0		BIT(0)
> +#define MT8183_MDP_AAL_MOUT_EN_RSZ1		BIT(1)
> +#define MT8183_MDP_AAL_MOUT_EN_RSZ0		BIT(2)
> +#define MT8183_MDP_PRZ0_MOUT_EN_PATH0_OUT	BIT(0)
> +#define MT8183_MDP_PRZ0_MOUT_EN_TDSHP0		BIT(1)
> +#define MT8183_MDP_PRZ1_MOUT_EN_PATH0_OUT	BIT(0)
> +#define MT8183_MDP_PRZ1_MOUT_EN_TDSHP0		BIT(1)
> +#define MT8183_MDP_PRZ1_MOUT_EN_PATH1_OUT	BIT(2)
> +#define MT8183_MDP_PRZ1_MOUT_EN_COLOR0		BIT(4)
> +#define MT8183_MDP_COLOR_MOUT_EN_PATH0_OUT	BIT(0)
> +#define MT8183_MDP_COLOR_MOUT_EN_PATH1_OUT	BIT(1)
> +#define MT8183_MDP_AAL_SEL_IN_CAMIN		0
> +#define MT8183_MDP_AAL_SEL_IN_RDMA0		1
> +#define MT8183_MDP_AAL_SEL_IN_CAMIN2		2
> +#define MT8183_MDP_AAL_SEL_IN_CCORR0		3
> +#define MT8183_MDP_CCORR_SEL_IN_CAMIN		0
> +#define MT8183_MDP_CCORR_SEL_IN_RDMA0		1
> +#define MT8183_MDP_CCORR_SEL_IN_CAMIN2		3
> +#define MT8183_MDP_CCORR_SEL_IN_AAL0		4
> +#define MT8183_MDP_PRZ0_SEL_IN_AAL0		0
> +#define MT8183_MDP_PRZ0_SEL_IN_CCORR0		1
> +#define MT8183_MDP_PRZ1_SEL_IN_CAMIN		0
> +#define MT8183_MDP_PRZ1_SEL_IN_RDMA0		1
> +#define MT8183_MDP_PRZ1_SEL_IN_CAMIN2		4
> +#define MT8183_MDP_PRZ1_SEL_IN_AAL0		5
> +#define MT8183_MDP_TDSHP_SEL_IN_RSZ0		0
> +#define MT8183_MDP_TDSHP_SEL_IN_RSZ1		1
> +#define MT8183_MDP_PATH0_SEL_IN_RSZ0		0
> +#define MT8183_MDP_PATH0_SEL_IN_RSZ1		1
> +#define MT8183_MDP_PATH0_SEL_IN_COLOR0		2
> +#define MT8183_MDP_PATH0_SEL_IN_RDMA0		3
> +#define MT8183_MDP_PATH1_SEL_IN_RSZ1		0
> +#define MT8183_MDP_PATH1_SEL_IN_COLOR0		1
> +#define MT8183_MDP_WROT0_SEL_IN_PATH0_OUT	0
> +#define MT8183_MDP_WDMA_SEL_IN_PATH1_OUT	0
> +#define MT8183_MDP_CCORR_SOUT_SEL_AAL0		0
> +#define MT8183_MDP_CCORR_SOUT_SEL_RSZ0		1
> +#define MT8183_MDP_PATH0_SOUT_SEL_WROT0		0
> +#define MT8183_MDP_PATH1_SOUT_SEL_WDMA		0
>   
>   static const struct mtk_mmsys_routes mmsys_mt8183_routing_table[] = {
>   	{
> @@ -50,5 +125,165 @@ static const struct mtk_mmsys_routes mmsys_mt8183_routing_table[] = {
>   	}
>   };
>   
> +static const struct mtk_mmsys_routes mmsys_mt8183_mdp_routing_table[] = {
> +	{
> +		MDP_COMP_CAMIN, MDP_COMP_CCORR0,
> +		MT8183_MDP_ISP_MOUT_EN, MT8183_MDP_ISP_MOUT_EN_CCORR0
> +	}, {
> +		MDP_COMP_CAMIN, MDP_COMP_RSZ1,
> +		MT8183_MDP_ISP_MOUT_EN, MT8183_MDP_ISP_MOUT_EN_RSZ1
> +	}, {
> +		MDP_COMP_CAMIN, MDP_COMP_AAL0,
> +		MT8183_MDP_ISP_MOUT_EN, MT8183_MDP_ISP_MOUT_EN_AAL0
> +	}, {
> +		MDP_COMP_CAMIN2, MDP_COMP_CCORR0,
> +		MT8183_MDP_IPU_MOUT_EN, MT8183_MDP_IPU_MOUT_EN_CCORR0
> +	}, {
> +		MDP_COMP_CAMIN2, MDP_COMP_RSZ1,
> +		MT8183_MDP_IPU_MOUT_EN, MT8183_MDP_IPU_MOUT_EN_RSZ1
> +	}, {
> +		MDP_COMP_CAMIN2, MDP_COMP_AAL0,
> +		MT8183_MDP_IPU_MOUT_EN, MT8183_MDP_IPU_MOUT_EN_AAL0
> +	}, {
> +		MDP_COMP_RDMA0, MDP_COMP_CCORR0,
> +		MT8183_MDP_RDMA0_MOUT_EN, MT8183_MDP_RDMA0_MOUT_EN_CCORR0
> +	}, {
> +		MDP_COMP_RDMA0, MDP_COMP_RSZ1,
> +		MT8183_MDP_RDMA0_MOUT_EN, MT8183_MDP_RDMA0_MOUT_EN_RSZ1
> +	}, {
> +		MDP_COMP_RDMA0, MDP_COMP_PATH0_SOUT,
> +		MT8183_MDP_RDMA0_MOUT_EN, MT8183_MDP_RDMA0_MOUT_EN_PATH0_OUT
> +	}, {
> +		MDP_COMP_RDMA0, MDP_COMP_AAL0,
> +		MT8183_MDP_RDMA0_MOUT_EN, MT8183_MDP_RDMA0_MOUT_EN_AAL0
> +	}, {
> +		MDP_COMP_AAL0, MDP_COMP_CCORR0,
> +		MT8183_MDP_AAL_MOUT_EN, MT8183_MDP_AAL_MOUT_EN_CCORR0
> +	}, {
> +		MDP_COMP_AAL0, MDP_COMP_RSZ1,
> +		MT8183_MDP_AAL_MOUT_EN, MT8183_MDP_AAL_MOUT_EN_RSZ1
> +	}, {
> +		MDP_COMP_AAL0, MDP_COMP_RSZ0,
> +		MT8183_MDP_AAL_MOUT_EN, MT8183_MDP_AAL_MOUT_EN_RSZ0
> +	}, {
> +		MDP_COMP_RSZ0, MDP_COMP_PATH0_SOUT,
> +		MT8183_MDP_PRZ0_MOUT_EN, MT8183_MDP_PRZ0_MOUT_EN_PATH0_OUT
> +	}, {
> +		MDP_COMP_RSZ0, MDP_COMP_TDSHP0,
> +		MT8183_MDP_PRZ0_MOUT_EN, MT8183_MDP_PRZ0_MOUT_EN_TDSHP0
> +	}, {
> +		MDP_COMP_RSZ1, MDP_COMP_PATH0_SOUT,
> +		MT8183_MDP_PRZ1_MOUT_EN, MT8183_MDP_PRZ1_MOUT_EN_PATH0_OUT
> +	}, {
> +		MDP_COMP_RSZ1, MDP_COMP_TDSHP0,
> +		MT8183_MDP_PRZ1_MOUT_EN, MT8183_MDP_PRZ1_MOUT_EN_TDSHP0
> +	}, {
> +		MDP_COMP_RSZ1, MDP_COMP_PATH1_SOUT,
> +		MT8183_MDP_PRZ1_MOUT_EN, MT8183_MDP_PRZ1_MOUT_EN_PATH1_OUT
> +	}, {
> +		MDP_COMP_RSZ1, MDP_COMP_COLOR0,
> +		MT8183_MDP_PRZ1_MOUT_EN, MT8183_MDP_PRZ1_MOUT_EN_COLOR0
> +	}, {
> +		MDP_COMP_COLOR0, MDP_COMP_PATH0_SOUT,
> +		MT8183_MDP_COLOR_MOUT_EN, MT8183_MDP_COLOR_MOUT_EN_PATH0_OUT
> +	}, {
> +		MDP_COMP_COLOR0, MDP_COMP_PATH1_SOUT,
> +		MT8183_MDP_COLOR_MOUT_EN, MT8183_MDP_COLOR_MOUT_EN_PATH1_OUT
> +	}, {
> +		MDP_COMP_CAMIN, MDP_COMP_AAL0,
> +		MT8183_MDP_AAL_SEL_IN, MT8183_MDP_AAL_SEL_IN_CAMIN
> +	}, {
> +		MDP_COMP_RDMA0, MDP_COMP_AAL0,
> +		MT8183_MDP_AAL_SEL_IN, MT8183_MDP_AAL_SEL_IN_RDMA0
> +	}, {
> +		MDP_COMP_CAMIN2, MDP_COMP_AAL0,
> +		MT8183_MDP_AAL_SEL_IN, MT8183_MDP_AAL_SEL_IN_CAMIN2
> +	}, {
> +		MDP_COMP_CCORR0, MDP_COMP_AAL0,
> +		MT8183_MDP_AAL_SEL_IN, MT8183_MDP_AAL_SEL_IN_CCORR0
> +	}, {
> +		MDP_COMP_CAMIN, MDP_COMP_CCORR0,
> +		MT8183_MDP_CCORR_SEL_IN, MT8183_MDP_CCORR_SEL_IN_CAMIN
> +	}, {
> +		MDP_COMP_RDMA0, MDP_COMP_CCORR0,
> +		MT8183_MDP_CCORR_SEL_IN, MT8183_MDP_CCORR_SEL_IN_RDMA0
> +	}, {
> +		MDP_COMP_CAMIN2, MDP_COMP_CCORR0,
> +		MT8183_MDP_CCORR_SEL_IN, MT8183_MDP_CCORR_SEL_IN_CAMIN2
> +	}, {
> +		MDP_COMP_AAL0, MDP_COMP_CCORR0,
> +		MT8183_MDP_CCORR_SEL_IN, MT8183_MDP_CCORR_SEL_IN_AAL0
> +	}, {
> +		MDP_COMP_AAL0, MDP_COMP_RSZ0,
> +		MT8183_MDP_PRZ0_SEL_IN, MT8183_MDP_PRZ0_SEL_IN_AAL0
> +	}, {
> +		MDP_COMP_CCORR0, MDP_COMP_RSZ0,
> +		MT8183_MDP_PRZ0_SEL_IN, MT8183_MDP_PRZ0_SEL_IN_CCORR0
> +	}, {
> +		MDP_COMP_CAMIN, MDP_COMP_RSZ1,
> +		MT8183_MDP_PRZ1_SEL_IN, MT8183_MDP_PRZ1_SEL_IN_CAMIN
> +	}, {
> +		MDP_COMP_RDMA0, MDP_COMP_RSZ1,
> +		MT8183_MDP_PRZ1_SEL_IN, MT8183_MDP_PRZ1_SEL_IN_RDMA0
> +	}, {
> +		MDP_COMP_CAMIN2, MDP_COMP_RSZ1,
> +		MT8183_MDP_PRZ1_SEL_IN, MT8183_MDP_PRZ1_SEL_IN_CAMIN2
> +	}, {
> +		MDP_COMP_AAL0, MDP_COMP_RSZ1,
> +		MT8183_MDP_PRZ1_SEL_IN, MT8183_MDP_PRZ1_SEL_IN_AAL0
> +	}, {
> +		MDP_COMP_RSZ0, MDP_COMP_TDSHP0,
> +		MT8183_MDP_TDSHP_SEL_IN, MT8183_MDP_TDSHP_SEL_IN_RSZ0
> +	}, {
> +		MDP_COMP_RSZ1, MDP_COMP_TDSHP0,
> +		MT8183_MDP_TDSHP_SEL_IN, MT8183_MDP_TDSHP_SEL_IN_RSZ1
> +	}, {
> +		MDP_COMP_RSZ0, MDP_COMP_PATH0_SOUT,
> +		MT8183_MDP_PATH0_SEL_IN, MT8183_MDP_PATH0_SEL_IN_RSZ0
> +	}, {
> +		MDP_COMP_RSZ1, MDP_COMP_PATH0_SOUT,
> +		MT8183_MDP_PATH0_SEL_IN, MT8183_MDP_PATH0_SEL_IN_RSZ1
> +	}, {
> +		MDP_COMP_COLOR0, MDP_COMP_PATH0_SOUT,
> +		MT8183_MDP_PATH0_SEL_IN, MT8183_MDP_PATH0_SEL_IN_COLOR0
> +	}, {
> +		MDP_COMP_RDMA0, MDP_COMP_PATH0_SOUT,
> +		MT8183_MDP_PATH0_SEL_IN, MT8183_MDP_PATH0_SEL_IN_RDMA0
> +	}, {
> +		MDP_COMP_RSZ1, MDP_COMP_PATH1_SOUT,
> +		MT8183_MDP_PATH1_SEL_IN, MT8183_MDP_PATH1_SEL_IN_RSZ1
> +	}, {
> +		MDP_COMP_COLOR0, MDP_COMP_PATH1_SOUT,
> +		MT8183_MDP_PATH1_SEL_IN, MT8183_MDP_PATH1_SEL_IN_COLOR0
> +	}, {
> +		MDP_COMP_PATH0_SOUT, MDP_COMP_WROT0,
> +		MT8183_MDP_WROT0_SEL_IN, MT8183_MDP_WROT0_SEL_IN_PATH0_OUT
> +	}, {
> +		MDP_COMP_PATH1_SOUT, MDP_COMP_WDMA,
> +		MT8183_MDP_WDMA_SEL_IN, MT8183_MDP_WDMA_SEL_IN_PATH1_OUT
> +	}, {
> +		MDP_COMP_CCORR0, MDP_COMP_AAL0,
> +		MT8183_MDP_CCORR_SOUT_SEL, MT8183_MDP_CCORR_SOUT_SEL_AAL0
> +	}, {
> +		MDP_COMP_CCORR0, MDP_COMP_RSZ0,
> +		MT8183_MDP_CCORR_SOUT_SEL, MT8183_MDP_CCORR_SOUT_SEL_RSZ0
> +	}, {
> +		MDP_COMP_PATH0_SOUT, MDP_COMP_WROT0,
> +		MT8183_MDP_PATH0_SOUT_SEL, MT8183_MDP_PATH0_SOUT_SEL_WROT0
> +	}, {
> +		MDP_COMP_PATH1_SOUT, MDP_COMP_WDMA,
> +		MT8183_MDP_PATH1_SOUT_SEL, MT8183_MDP_PATH1_SOUT_SEL_WDMA
> +	}
> +};
> +
> +static const unsigned int mmsys_mt8183_mdp_isp_ctrl_table[ISP_CTRL_MAX] = {
> +	[ISP_CTRL_MMSYS_SW0_RST_B] = MT8183_ISP_CTRL_MMSYS_SW0_RST_B,
> +	[ISP_CTRL_MMSYS_SW1_RST_B] = MT8183_ISP_CTRL_MMSYS_SW1_RST_B,
> +	[ISP_CTRL_MDP_ASYNC_CFG_WD] = MT8183_ISP_CTRL_MDP_ASYNC_CFG_WD,
> +	[ISP_CTRL_MDP_ASYNC_IPU_CFG_WD] = MT8183_ISP_CTRL_MDP_ASYNC_IPU_CFG_WD,
> +	[ISP_CTRL_ISP_RELAY_CFG_WD] = MT8183_ISP_CTRL_ISP_RELAY_CFG_WD,
> +	[ISP_CTRL_IPU_RELAY_CFG_WD] = MT8183_ISP_CTRL_IPU_RELAY_CFG_WD,
> +};
> +
>   #endif /* __SOC_MEDIATEK_MT8183_MMSYS_H */
>   
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 080660ef11bf..c4b99a99ee1e 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -7,8 +7,10 @@
>   #include <linux/device.h>
>   #include <linux/io.h>
>   #include <linux/of_device.h>
> +#include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   #include <linux/soc/mediatek/mtk-mmsys.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
>   
>   #include "mtk-mmsys.h"
>   #include "mt8167-mmsys.h"
> @@ -50,11 +52,16 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8183-mm",
>   	.routes = mmsys_mt8183_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> +	.mdp_routes = mmsys_mt8183_mdp_routing_table,
> +	.mdp_num_routes = ARRAY_SIZE(mmsys_mt8183_mdp_routing_table),
> +	.mdp_isp_ctrl = mmsys_mt8183_mdp_isp_ctrl_table,
>   };
>   
>   struct mtk_mmsys {
>   	void __iomem *regs;
>   	const struct mtk_mmsys_driver_data *data;
> +	phys_addr_t addr;
> +	u8 subsys_id;
>   };
>   
>   void mtk_mmsys_ddp_connect(struct device *dev,
> @@ -91,12 +98,160 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>   
> +void mtk_mmsys_mdp_connect(struct device *dev, struct mmsys_cmdq_cmd *cmd,
> +			   enum mtk_mdp_comp_id cur,
> +			   enum mtk_mdp_comp_id next)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const struct mtk_mmsys_routes *routes = mmsys->data->mdp_routes;
> +	int i;
> +
> +	WARN_ON(!routes);
> +	WARN_ON(mmsys->subsys_id == 0);
> +	for (i = 0; i < mmsys->data->mdp_num_routes; i++)
> +		if (cur == routes[i].from_comp && next == routes[i].to_comp)
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id,
> +					    mmsys->addr + routes[i].addr,
> +					    routes[i].val, 0xFFFFFFFF);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_mdp_connect);

I wonder if we are going the wrong path with mmsys. It seems to me that we are 
adding random export symbols. I suppose the don't want to use syscon/regmap 
because we want to define the routing tables in the mmsys driver, as they are 
part of the mmsys HW, correct?

Regards,
Matthias


> +
> +void mtk_mmsys_mdp_disconnect(struct device *dev, struct mmsys_cmdq_cmd *cmd,
> +			      enum mtk_mdp_comp_id cur,
> +			      enum mtk_mdp_comp_id next)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const struct mtk_mmsys_routes *routes = mmsys->data->mdp_routes;
> +	int i;
> +
> +	WARN_ON(mmsys->subsys_id == 0);
> +	for (i = 0; i < mmsys->data->mdp_num_routes; i++)
> +		if (cur == routes[i].from_comp && next == routes[i].to_comp)
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id,
> +					    mmsys->addr + routes[i].addr,
> +					    0, 0xFFFFFFFF);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_mdp_disconnect);
> +
> +void mtk_mmsys_mdp_isp_ctrl(struct device *dev, struct mmsys_cmdq_cmd *cmd,
> +			    enum mtk_mdp_comp_id id)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const unsigned int *isp_ctrl = mmsys->data->mdp_isp_ctrl;
> +	u32 reg;
> +
> +	WARN_ON(mmsys->subsys_id == 0);
> +	/* Direct link */
> +	if (id == MDP_COMP_CAMIN) {
> +		/* Reset MDP_DL_ASYNC_TX */
> +		/* Bit  3: MDP_DL_ASYNC_TX / MDP_RELAY */
> +		if (isp_ctrl[ISP_CTRL_MMSYS_SW0_RST_B]) {
> +			reg = mmsys->addr + isp_ctrl[ISP_CTRL_MMSYS_SW0_RST_B];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    0x0, 0x00000008);
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    1 << 3, 0x00000008);
> +		}
> +
> +		/* Reset MDP_DL_ASYNC_RX */
> +		/* Bit  10: MDP_DL_ASYNC_RX */
> +		if (isp_ctrl[ISP_CTRL_MMSYS_SW1_RST_B]) {
> +			reg = mmsys->addr + isp_ctrl[ISP_CTRL_MMSYS_SW1_RST_B];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    0x0, 0x00000400);
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    1 << 10, 0x00000400);
> +		}
> +
> +		/* Enable sof mode */
> +		if (isp_ctrl[ISP_CTRL_ISP_RELAY_CFG_WD]) {
> +			reg = mmsys->addr + isp_ctrl[ISP_CTRL_ISP_RELAY_CFG_WD];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    0 << 31, 0x80000000);
> +		}
> +	}
> +
> +	if (id == MDP_COMP_CAMIN2) {
> +		/* Reset MDP_DL_ASYNC2_TX */
> +		/* Bit  4: MDP_DL_ASYNC2_TX / MDP_RELAY2 */
> +		if (isp_ctrl[ISP_CTRL_MMSYS_SW0_RST_B]) {
> +			reg = mmsys->addr + isp_ctrl[ISP_CTRL_MMSYS_SW0_RST_B];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    0x0, 0x00000010);
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    1 << 4, 0x00000010);
> +		}
> +
> +		/* Reset MDP_DL_ASYNC2_RX */
> +		/* Bit  11: MDP_DL_ASYNC2_RX */
> +		if (isp_ctrl[ISP_CTRL_MMSYS_SW1_RST_B]) {
> +			reg = mmsys->addr + isp_ctrl[ISP_CTRL_MMSYS_SW1_RST_B];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    0x0, 0x00000800);
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    1 << 11, 0x00000800);
> +		}
> +
> +		/* Enable sof mode */
> +		if (isp_ctrl[ISP_CTRL_IPU_RELAY_CFG_WD]) {
> +			reg = mmsys->addr + isp_ctrl[ISP_CTRL_IPU_RELAY_CFG_WD];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    0 << 31, 0x80000000);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_mdp_isp_ctrl);
> +
> +void mtk_mmsys_mdp_camin_ctrl(struct device *dev, struct mmsys_cmdq_cmd *cmd,
> +			      enum mtk_mdp_comp_id id, u32 camin_w, u32 camin_h)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const unsigned int *isp_ctrl = mmsys->data->mdp_isp_ctrl;
> +	u32 reg;
> +
> +	WARN_ON(mmsys->subsys_id == 0);
> +	/* Config for direct link */
> +	if (id == MDP_COMP_CAMIN) {
> +		if (isp_ctrl[ISP_CTRL_MDP_ASYNC_CFG_WD]) {
> +			reg = mmsys->addr + isp_ctrl[ISP_CTRL_MDP_ASYNC_CFG_WD];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    (camin_h << 16) + camin_w,
> +					    0x3FFF3FFF);
> +		}
> +
> +		if (isp_ctrl[ISP_CTRL_ISP_RELAY_CFG_WD]) {
> +			reg = mmsys->addr + isp_ctrl[ISP_CTRL_ISP_RELAY_CFG_WD];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    (camin_h << 16) + camin_w,
> +					    0x3FFF3FFF);
> +		}
> +	}
> +	if (id == MDP_COMP_CAMIN2) {
> +		if (isp_ctrl[ISP_CTRL_MDP_ASYNC_IPU_CFG_WD]) {
> +			reg = mmsys->addr +
> +			      isp_ctrl[ISP_CTRL_MDP_ASYNC_IPU_CFG_WD];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    (camin_h << 16) + camin_w,
> +					    0x3FFF3FFF);
> +		}
> +		if (isp_ctrl[ISP_CTRL_IPU_RELAY_CFG_WD]) {
> +			reg = mmsys->addr + isp_ctrl[ISP_CTRL_IPU_RELAY_CFG_WD];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    (camin_h << 16) + camin_w,
> +					    0x3FFF3FFF);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_mdp_camin_ctrl);
> +
>   static int mtk_mmsys_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct platform_device *clks;
>   	struct platform_device *drm;
>   	struct mtk_mmsys *mmsys;
> +	struct resource res;
> +	struct cmdq_client_reg cmdq_reg;
>   	int ret;
>   
>   	mmsys = devm_kzalloc(dev, sizeof(*mmsys), GFP_KERNEL);
> @@ -110,6 +265,15 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	if (of_address_to_resource(dev->of_node, 0, &res) < 0)
> +		mmsys->addr = 0L;
> +	else
> +		mmsys->addr = res.start;
> +
> +	if (cmdq_dev_get_client_reg(dev, &cmdq_reg, 0) != 0)
> +		dev_info(dev, "cmdq subsys id has not been set\n");
> +	mmsys->subsys_id = cmdq_reg.subsys;
> +
>   	mmsys->data = of_device_get_match_data(&pdev->dev);
>   	platform_set_drvdata(pdev, mmsys);
>   
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
> index a760a34e6eca..025d4bc9c8cc 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -74,9 +74,12 @@ struct mtk_mmsys_routes {
>   };
>   
>   struct mtk_mmsys_driver_data {
> -	const char *clk_driver;
> -	const struct mtk_mmsys_routes *routes;
> -	const unsigned int num_routes;
> +	const char		*clk_driver;
> +	const struct		mtk_mmsys_routes *routes;
> +	const unsigned int	num_routes;
> +	const struct		mtk_mmsys_routes *mdp_routes;
> +	const unsigned int	mdp_num_routes;
> +	const unsigned int	*mdp_isp_ctrl;

Style changes in seperate patch please.

>   };
>   
>   /*
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 2228bf6133da..4eb48d073d2a 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -7,8 +7,14 @@
>   #define __MTK_MMSYS_H
>   
>   enum mtk_ddp_comp_id;
> +enum mtk_mdp_comp_id;
>   struct device;
>   
> +struct mmsys_cmdq_cmd {
> +	struct cmdq_pkt *pkt;
> +	s32 *event;
> +};
> +
>   enum mtk_ddp_comp_id {
>   	DDP_COMPONENT_AAL0,
>   	DDP_COMPONENT_AAL1,
> @@ -42,6 +48,64 @@ enum mtk_ddp_comp_id {
>   	DDP_COMPONENT_ID_MAX,
>   };
>   
> +enum mtk_mdp_comp_id {
> +	MDP_COMP_NONE = -1,	/* Invalid engine */
> +
> +	/* ISP */
> +	MDP_COMP_WPEI = 0,
> +	MDP_COMP_WPEO,		/* 1 */
> +	MDP_COMP_WPEI2,		/* 2 */
> +	MDP_COMP_WPEO2,		/* 3 */
> +	MDP_COMP_ISP_IMGI,	/* 4 */
> +	MDP_COMP_ISP_IMGO,	/* 5 */
> +	MDP_COMP_ISP_IMG2O,	/* 6 */
> +
> +	/* IPU */
> +	MDP_COMP_IPUI,		/* 7 */
> +	MDP_COMP_IPUO,		/* 8 */
> +
> +	/* MDP */
> +	MDP_COMP_CAMIN,		/* 9 */
> +	MDP_COMP_CAMIN2,	/* 10 */
> +	MDP_COMP_RDMA0,		/* 11 */
> +	MDP_COMP_AAL0,		/* 12 */
> +	MDP_COMP_CCORR0,	/* 13 */
> +	MDP_COMP_RSZ0,		/* 14 */
> +	MDP_COMP_RSZ1,		/* 15 */
> +	MDP_COMP_TDSHP0,	/* 16 */
> +	MDP_COMP_COLOR0,	/* 17 */
> +	MDP_COMP_PATH0_SOUT,	/* 18 */
> +	MDP_COMP_PATH1_SOUT,	/* 19 */
> +	MDP_COMP_WROT0,		/* 20 */
> +	MDP_COMP_WDMA,		/* 21 */
> +
> +	/* Dummy Engine */
> +	MDP_COMP_RDMA1,		/* 22 */
> +	MDP_COMP_RSZ2,		/* 23 */
> +	MDP_COMP_TDSHP1,	/* 24 */
> +	MDP_COMP_WROT1,		/* 25 */
> +
> +	MDP_MAX_COMP_COUNT	/* ALWAYS keep at the end */
> +};
> +
> +enum mtk_mdp_pipe_id {
> +	MDP_PIPE_RDMA0,
> +	MDP_PIPE_IMGI,
> +	MDP_PIPE_WPEI,
> +	MDP_PIPE_WPEI2,
> +	MDP_PIPE_MAX
> +};
> +
> +enum mtk_isp_ctrl {
> +	ISP_CTRL_MMSYS_SW0_RST_B,
> +	ISP_CTRL_MMSYS_SW1_RST_B,
> +	ISP_CTRL_MDP_ASYNC_CFG_WD,
> +	ISP_CTRL_MDP_ASYNC_IPU_CFG_WD,
> +	ISP_CTRL_ISP_RELAY_CFG_WD,
> +	ISP_CTRL_IPU_RELAY_CFG_WD,
> +	ISP_CTRL_MAX
> +};
> +
>   void mtk_mmsys_ddp_connect(struct device *dev,
>   			   enum mtk_ddp_comp_id cur,
>   			   enum mtk_ddp_comp_id next);
> @@ -50,4 +114,21 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   			      enum mtk_ddp_comp_id cur,
>   			      enum mtk_ddp_comp_id next);
>   
> +void mtk_mmsys_mdp_connect(struct device *dev,
> +			   struct mmsys_cmdq_cmd *cmd,
> +			   enum mtk_mdp_comp_id cur,
> +			   enum mtk_mdp_comp_id next);
> +
> +void mtk_mmsys_mdp_disconnect(struct device *dev,
> +			      struct mmsys_cmdq_cmd *cmd,
> +			      enum mtk_mdp_comp_id cur,
> +			      enum mtk_mdp_comp_id next);
> +
> +void mtk_mmsys_mdp_isp_ctrl(struct device *dev, struct mmsys_cmdq_cmd *cmd,
> +			    enum mtk_mdp_comp_id id);
> +
> +void mtk_mmsys_mdp_camin_ctrl(struct device *dev, struct mmsys_cmdq_cmd *cmd,
> +			      enum mtk_mdp_comp_id id,
> +			      u32 camin_w, u32 camin_h);
> +
>   #endif /* __MTK_MMSYS_H */
> 
