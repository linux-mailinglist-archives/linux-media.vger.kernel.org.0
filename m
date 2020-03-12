Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2A8182635
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 01:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731423AbgCLAWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 20:22:13 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33714 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731559AbgCLAWM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 20:22:12 -0400
Received: by mail-pf1-f196.google.com with SMTP id n7so2304829pfn.0
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 17:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=In1POKsNa9Bsg2oHJAOLzxXLsWU+F1YhChK01NXduJQ=;
        b=HqtKuNI+yqd0o0GU3rMM16scP1GlMmSnqluRIeYY2XXeqhJTF62RTj7x0VW4PRT3qB
         7PE5sb3v5NdsEDVisMFTpFeaAIxmE8lnU101RhyDsIET+5L2bK6n6t9h6tpyKSurVJRB
         YP+Yr7oMANTLRtnqitmTTx7nmEnni9l4EX6McADkRUeTfuO/CzIGyLap4tnrz++0cZzP
         dv5PE6gPnT7AjCr8+P0ryqAMj7RJGXhaR6pEzIInGKfHZm5Jzt+Mk4NhEwKtfG5Dvs/P
         ZG5ML8W+WHvXAlORMI7wStXhDNu7sEzPRO9pvFxa2oGPXY0OrN8rrLs5gTn8Qwz/qKNJ
         Xcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=In1POKsNa9Bsg2oHJAOLzxXLsWU+F1YhChK01NXduJQ=;
        b=Mw2CXJeoZZAnYGAaAKEX1AtdcKYzkEk76NxdzKrWPDsctd+LxGNnb0fE6ujJ5YN9c+
         oIpD1Woe0UDlgA/qkVEXgIenYkJ8nOyAjTjhmPXkNNqI8m5pZhHMxHwt/L5V9qpsBtTo
         P5bRgupMPWSYyLTjlbI4rZcImOh5x6EgilQwy0nDl404CinrB49zfGuzZ1vh95PI53Q/
         D5zmpo2c1IkBligOKQ1rIJZrKQHfAge2b1Fo0veGfpPTFnuhI/0cU/gMMo0313HV+f3C
         z4bRncZaJ52s9kFPYtUAGyo5rYuqMOEhQhMXLKNZnvb9htuUBapB+JjrHCNxFhtEKnar
         yD0w==
X-Gm-Message-State: ANhLgQ27b7bBtaM/dTXxxsprqrMpnhqq9iDzJbLukcF9qlQ8I2XpUFx7
        zKswhVZLVeCmkhxVKQoEqXs=
X-Google-Smtp-Source: ADFU+vtpUgDGAzXxgeugEBLZg7SWAklNlVsvp0elKwolVN1yHomtFCGbgOkNbOwsdUmqPDpZ+EWIZg==
X-Received: by 2002:a63:7148:: with SMTP id b8mr5069083pgn.143.1583972531585;
        Wed, 11 Mar 2020 17:22:11 -0700 (PDT)
Received: from ?IPv6:2605:e000:d445:6a00:a54b:c8f0:3b71:1a5b? ([2605:e000:d445:6a00:a54b:c8f0:3b71:1a5b])
        by smtp.gmail.com with ESMTPSA id h12sm172520pjj.22.2020.03.11.17.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 17:22:11 -0700 (PDT)
Subject: Re: [PATCH v2 08/10] media: imx: imx6-media-csi: Support clamping Y10
 and Y12 to Y8
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
 <20200310160633.950-9-laurent.pinchart@ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <d67422bf-8a10-0598-73d0-6592421dd4b5@gmail.com>
Date:   Wed, 11 Mar 2020 17:22:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310160633.950-9-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/10/20 9:06 AM, Laurent Pinchart wrote:
> 10-bit and 12-bit greyscale input data to the CSI can be written as
> 8-bit data to memory. Support this.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Steve Longerbeam <slongerbeam@gmail.com>

> ---
>   drivers/staging/media/imx/imx-media-utils.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index bc20fcc88267..fae981698c49 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -161,7 +161,11 @@ static const struct imx_media_pixfmt rgb_formats[] = {
>   		.bayer  = true,
>   	}, {
>   		.fourcc = V4L2_PIX_FMT_GREY,
> -		.codes = {MEDIA_BUS_FMT_Y8_1X8},
> +		.codes = {
> +			MEDIA_BUS_FMT_Y8_1X8,
> +			MEDIA_BUS_FMT_Y10_1X10,
> +			MEDIA_BUS_FMT_Y12_1X12,
> +		},
>   		.cs     = IPUV3_COLORSPACE_RGB,
>   		.bpp    = 8,
>   		.bayer  = true,

