Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 494E9290AF4
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 19:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390349AbgJPRq6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 13:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388549AbgJPRq6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 13:46:58 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E90FC061755
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 10:46:58 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h5so3874077wrv.7
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 10:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=PYAkfMnZ2XypxrgV1TWzp44Ijnc2K2JevE/0G9W2WT4=;
        b=Iz0D7iYtxq2InEU300Mld2j6tZnBHN4mYBpVDxOM1pSNXzKXZHOUO4KEGNHlKXMpSp
         56US2a4lbpJXdfPeueOdxxgjQGXCVRFNmwrpl8rF2cZTo9DpPqyc6R589OaYQCJ6RgBj
         C4IPC81kqOXH9mdL30UTaXnVNEPC+wS6LNiusPXTs3UNw+9skLJRvo/8sNTLXjAaoO0t
         sPATDPMNq3sSWHAzOlZEDeqnWPJWhd/W1R3BUfm/oFZHCNkbmeOFPfryKrWeuwF/GWA6
         ne9juyuEGA9bEG/wbTVWSoUa/ryMiT+gX3ps6y7Lyvg+Cjzs4hkMMUnzYCkjNS9h9P2x
         +ynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=PYAkfMnZ2XypxrgV1TWzp44Ijnc2K2JevE/0G9W2WT4=;
        b=rypbxBE12RslVvQTVvpCFl756X7dWlSYcGNEoPecG7s8zRk7ClHMKqOpXqEa8EKLyb
         /7n5d0VXBaLpagcnEBV9LwyHWRECSD1hSefXGv/8cQmVkXpnmCSsiziTKhTLATJ1fW3D
         OJW0nCchzoaAOEJc1RMOIJNSA920IdWHw/QBvWm1V9+Hl3ClmLQ0AbXxETEkm9hjbyO2
         bo1YfZLVcDC8FWBunxmwwlmEGocxMNBijUnVOYu/VOXwVYTKJq3erm9/SkqczBKDc+Tl
         5w9kUWQLge7sITRpl6Kl6j8Y8aq/AR0oV6GsqlC2rWW9o6ay8bjgax1wxeg+VnKtUmvq
         dLAQ==
X-Gm-Message-State: AOAM532YD5HDTi50/HpYAojpy37HTZiRAvauXhwhLmOGHueziApSqLbN
        qq0H2rj9M3gGiYqzDkSTgM5uCAUvqZI=
X-Google-Smtp-Source: ABdhPJyDTtr8aEAp6TOjoI/KjZoliEen1OvhROy7LRzouCyGajzHVkcY3aBirKNSZVsBW9WTjWwfmw==
X-Received: by 2002:a5d:5609:: with SMTP id l9mr5059492wrv.140.1602870416592;
        Fri, 16 Oct 2020 10:46:56 -0700 (PDT)
Received: from [172.30.90.199] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id j7sm3503528wmc.7.2020.10.16.10.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2020 10:46:56 -0700 (PDT)
Subject: Re: [PATCH 2/2 v5] staging: media: imx: remove unnecessary variable
 use
To:     Deepak R Varma <mh12gx2825@gmail.com>,
        outreachy-kernel@googlegroups.com,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org
References: <9fd1e7dd9e8f944b520f2a789e66e458aeb7b555.1602869338.git.mh12gx2825@gmail.com>
 <6a22de0a51e06b7cb43d4a55850f3a0213532e42.1602869338.git.mh12gx2825@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <9cd691f6-ed02-a002-00fd-35b8dea28680@gmail.com>
Date:   Fri, 16 Oct 2020 10:46:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6a22de0a51e06b7cb43d4a55850f3a0213532e42.1602869338.git.mh12gx2825@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Acked-by: Steve Longerbeam <slongerbeam@gmail.com>

On 10/16/20 10:46 AM, Deepak R Varma wrote:
> Use of variable vc_num is unnecessary here as it is used only once.
> Instead, the value can directly be used in place of the variable.
>
> Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> ---
> Changes since v4:
>     - None.
> Changes since v3:
>     - None.
> Changes since v2:
>     - Implement feedback from Vaishali to simplify patch log message.
> Changes since v1:
>     - None.
>
>   drivers/staging/media/imx/imx-media-csi.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index 9320e3974d86..db77fef07654 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -1123,7 +1123,6 @@ static int csi_link_validate(struct v4l2_subdev *sd,
>   	priv->upstream_ep = upstream_ep;
>   	is_csi2 = !is_parallel_bus(&upstream_ep);
>   	if (is_csi2) {
> -		int vc_num = 0;
>   		/*
>   		 * NOTE! It seems the virtual channels from the mipi csi-2
>   		 * receiver are used only for routing by the video mux's,
> @@ -1131,7 +1130,7 @@ static int csi_link_validate(struct v4l2_subdev *sd,
>   		 * enters the CSI's however, they are treated internally
>   		 * in the IPU as virtual channel 0.
>   		 */
> -		ipu_csi_set_mipi_datatype(priv->csi, vc_num,
> +		ipu_csi_set_mipi_datatype(priv->csi, 0,
>   					  &priv->format_mbus[CSI_SINK_PAD]);
>   	}
>   

