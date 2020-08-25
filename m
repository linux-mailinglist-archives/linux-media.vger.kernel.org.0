Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6613251CA1
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 17:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgHYPur convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 25 Aug 2020 11:50:47 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37452 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgHYPuq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 11:50:46 -0400
Received: by mail-lj1-f195.google.com with SMTP id w14so14391751ljj.4;
        Tue, 25 Aug 2020 08:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uxFnQngY1sbC1vkgUVU9ZThc1q84F2BALBF2JF4Hio4=;
        b=ssM2w+s0v92K52IKPVBHowKRPuW3t1OoO1Xdd6V75ln2hOYz2Mum5KRBkefPa87c5E
         h42QPyZeRFqNC0NddtnXZcFIKlzyXMW/naS3qx4x6s/CMblHEE1ALW6e3TT5ALwgrXRe
         Rf/4Prffuu/x8SPy9TfH3pTQW2jXzUAyCmxJvjPP4GBnvcO7kXUGq35K+zfyQY2I+Gjx
         TOszehTsEvqmSamOuuLlpWcA9XGtapLchIMxFYwPC+lhhXEYWlbfBsqWG4Fo762PEvMT
         Z85Fas15Uu5rXBIESItBLlI2oVUupywMAN3CR0wLPDk/2N5uXLU/E/j9YIaHidWo0sKP
         JWqA==
X-Gm-Message-State: AOAM5300WoFDoIjfCzh5l+G+Wnr7paDsS20HnSQnExeQlkmacJGXSVq6
        Iu6BHLcoMpHFww715dnAFkY/kRXx19ZFGg==
X-Google-Smtp-Source: ABdhPJyjWDMcpwz3b8SYuKAHGQLBZsh5DHqtmVD/iOydSwV89V6jKUAJZ9HA2rPQeDpAOxQeQ9TVhA==
X-Received: by 2002:a2e:a28d:: with SMTP id k13mr5040448lja.11.1598370643927;
        Tue, 25 Aug 2020 08:50:43 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id e25sm2907268ljj.130.2020.08.25.08.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 08:50:43 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id v4so14410865ljd.0;
        Tue, 25 Aug 2020 08:50:43 -0700 (PDT)
X-Received: by 2002:a2e:9b8e:: with SMTP id z14mr5274009lji.47.1598370643108;
 Tue, 25 Aug 2020 08:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com> <20200821145935.20346-2-kevin.lhopital@bootlin.com>
In-Reply-To: <20200821145935.20346-2-kevin.lhopital@bootlin.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Tue, 25 Aug 2020 23:50:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v65enzLHdK09-8Nm7=YU9-bRP=0Q+BXjXah6MZR2-y=zrA@mail.gmail.com>
Message-ID: <CAGb2v65enzLHdK09-8Nm7=YU9-bRP=0Q+BXjXah6MZR2-y=zrA@mail.gmail.com>
Subject: Re: [PATCH 1/7] media: sun6i-csi: Fix the bpp for 10-bit bayer formats
To:     =?UTF-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Yong Deng <yong.deng@magewell.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 21, 2020 at 11:00 PM Kévin L'hôpital
<kevin.lhopital@bootlin.com> wrote:
>
> 10-bit bayer formats are aligned to 16 bits in memory, so this is what
> needs to be used as bpp for calculating the size of the buffers to
> allocate.
>
> Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>

Please add:

Fixes: 5cc7522d8965 ("media: sun6i: Add support for Allwinner CSI V3s")



> ---
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> index c626821aaedb..8b83d15de0d0 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> @@ -100,7 +100,7 @@ static inline int sun6i_csi_get_bpp(unsigned int pixformat)
>         case V4L2_PIX_FMT_SGBRG10:
>         case V4L2_PIX_FMT_SGRBG10:
>         case V4L2_PIX_FMT_SRGGB10:
> -               return 10;
> +               return 16;
>         case V4L2_PIX_FMT_SBGGR12:
>         case V4L2_PIX_FMT_SGBRG12:
>         case V4L2_PIX_FMT_SGRBG12:
> --
> 2.17.1
>
