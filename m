Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0563783E47
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 12:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232280AbjHVKsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 06:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbjHVKsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 06:48:54 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC72B199
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 03:48:52 -0700 (PDT)
Received: from [192.168.15.130] (94-240-0-14.lukman.pl [94.240.0.14])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 90BD46607215;
        Tue, 22 Aug 2023 11:48:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1692701331;
        bh=msIVYLm2RqjSXEfIxKHjRYkzOE1IP4TUtBCMJXmHdCQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=AquOokytwMBVDpUZ2EQeiQVO25c2e43MgHDZLyOlkGa1i+OEqGd7PZRHBclis8S9R
         JnN29IVGbKCPJEU4CjxwMhn78wlziU0ogJ/36upmD9nDZtGKThVRb+3j5RQwe3x1hM
         Y29rswCHAhzFIhmFc4OJe53tcsoibTqTD55Mbw6ot7XGCt/E+aT8fV0RyyvKmT+52/
         uoyz4VBVtlWgFJmJi1SkoMfqB++Gc/jQoDcuL4BZnMTFd7kbglUmcOt9N6TlKuowRc
         UeiiLOZh6qQuiKjFcVXx7qeS/r63fQAs5bStuBbRO9AgjhNwxbGnkXUsSF4jIBD1xl
         Gyaz78mEgAsqA==
Message-ID: <128505ce-d7f7-c4a0-5c8a-6a30a2353680@collabora.com>
Date:   Tue, 22 Aug 2023 12:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] media: imx-jpeg: Remove unused declarations
Content-Language: en-US
To:     Yue Haibing <yuehaibing@huawei.com>, mirela.rabulea@nxp.com,
        linux-imx@nxp.com, mchehab@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        hverkuil-cisco@xs4all.nl, ming.qian@nxp.com
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230817134354.24936-1-yuehaibing@huawei.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20230817134354.24936-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

W dniu 17.08.2023 o 15:43, Yue Haibing pisze:
> These are never implemented, remove them.
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> index a2b4fb9e29e7..d579c804b047 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> @@ -115,28 +115,17 @@ void print_cast_status(struct device *dev, void __iomem *reg,
>   void print_wrapper_info(struct device *dev, void __iomem *reg);
>   void mxc_jpeg_sw_reset(void __iomem *reg);
>   int mxc_jpeg_enable(void __iomem *reg);
> -void wait_frmdone(struct device *dev, void __iomem *reg);
>   void mxc_jpeg_enc_mode_conf(struct device *dev, void __iomem *reg, u8 extseq);
>   void mxc_jpeg_enc_mode_go(struct device *dev, void __iomem *reg, u8 extseq);
>   void mxc_jpeg_enc_set_quality(struct device *dev, void __iomem *reg, u8 quality);
>   void mxc_jpeg_dec_mode_go(struct device *dev, void __iomem *reg);
> -int mxc_jpeg_get_slot(void __iomem *reg);
> -u32 mxc_jpeg_get_offset(void __iomem *reg, int slot);
>   void mxc_jpeg_enable_slot(void __iomem *reg, int slot);
>   void mxc_jpeg_set_l_endian(void __iomem *reg, int le);
>   void mxc_jpeg_enable_irq(void __iomem *reg, int slot);
>   void mxc_jpeg_disable_irq(void __iomem *reg, int slot);
> -int mxc_jpeg_set_input(void __iomem *reg, u32 in_buf, u32 bufsize);
> -int mxc_jpeg_set_output(void __iomem *reg, u16 out_pitch, u32 out_buf,
> -			u16 w, u16 h);
> -void mxc_jpeg_set_config_mode(void __iomem *reg, int config_mode);
> -int mxc_jpeg_set_params(struct mxc_jpeg_desc *desc,  u32 bufsize, u16
> -			out_pitch, u32 format);
>   void mxc_jpeg_set_bufsize(struct mxc_jpeg_desc *desc,  u32 bufsize);
>   void mxc_jpeg_set_res(struct mxc_jpeg_desc *desc, u16 w, u16 h);
>   void mxc_jpeg_set_line_pitch(struct mxc_jpeg_desc *desc, u32 line_pitch);
>   void mxc_jpeg_set_desc(u32 desc, void __iomem *reg, int slot);
>   void mxc_jpeg_clr_desc(void __iomem *reg, int slot);
> -void mxc_jpeg_set_regs_from_desc(struct mxc_jpeg_desc *desc,
> -				 void __iomem *reg);
>   #endif

