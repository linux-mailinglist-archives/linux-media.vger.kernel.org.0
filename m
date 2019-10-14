Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83156D677D
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 18:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388143AbfJNQhW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 12:37:22 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33808 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732550AbfJNQhV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 12:37:21 -0400
Received: by mail-wr1-f66.google.com with SMTP id j11so20522423wrp.1
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2019 09:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7K1NLw/KpCaqCQnhAkIxdjGavMvoTaV+fDn5zsO7S/A=;
        b=LdIHkvyJIfnr+4cPIcCjcCNFp6Z2WtVsYCTduKwshdRuvjDdLnR10b8HQpCgC8BflH
         ZnPER5NFqrJaWlnlf/Qnas6e75eJ8vrrJ7Mj7lxpJYulA5H84xDps4V4YThxkGijEuwC
         jkvkptja9r4IbetaTsQPxgJBXpQFEKUz35Qp2dSnBlajus0QqWbJWC6b0jioV60yZrjo
         YvFt2hWLKv4MTHyKs9OvW2nK4ZAfGtXFGvImI5SAH6IH8JyPjuudDoJwcU11Yp21meBn
         YxkgA0IKlRtuzDMo+rIP64pt/fFfg4tDld6oRiynOIankFYvQsBcCsbCaFUQcBNWsf7/
         +r2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7K1NLw/KpCaqCQnhAkIxdjGavMvoTaV+fDn5zsO7S/A=;
        b=uQgrDVLTAvSar6dOn1s3pjdT5PJM3l8/qtC6o/WaZswZ6AX0g9piw6QuSn8C0TPBOh
         xCPUez1DI/vPK6u4Wnai9rzi9Mnhpel6taIDgIHxAi0FP3rGz73t8wzyGpUNEJYknr3V
         DrhQovDU23v48Wr3TBr0GV0wvdH74XP7VPdgACpsyGYzwg3oovPPt9cSn1fc1BOX38Rp
         UhgsFmotMb+713xsKy+sA+/ucAapEoMLWGsRs1iTixzYgEzCSq2yhYG+nGr19NkozP53
         WJgh9I2ivy7K/s9X3gDiT/xmOsXlcIWyIKfJ4etKUBiZ9QPU24qRDaXAu8U7sdONxNf7
         t/xg==
X-Gm-Message-State: APjAAAWfLMNDkyyAoW9oyJ0uc1ZktZKyorsuYSpQOVYXL78qkb/m8o/3
        a0JCXPDkfUmpQ3IlW2HRt4DbH/pz
X-Google-Smtp-Source: APXvYqwJ8evw7rKtdJaCRAt1K0Gk16FdZ55kHNGALHQ2ZVRLrZXttfRin6on5e1e70mG3QEZoUUuKg==
X-Received: by 2002:a5d:4b09:: with SMTP id v9mr25511276wrq.127.1571071039750;
        Mon, 14 Oct 2019 09:37:19 -0700 (PDT)
Received: from [172.30.89.1] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id f8sm21216299wmb.37.2019.10.14.09.37.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:37:19 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] media: imx.rst: Provide a real example for the
 output format
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, p.zabel@pengutronix.de, tharvey@gateworks.com,
        linux-media@vger.kernel.org
References: <20191014135424.7000-1-festevam@gmail.com>
 <20191014135424.7000-2-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <c2583c20-47d4-134c-9ca6-2bf3a2a1fe5e@gmail.com>
Date:   Mon, 14 Oct 2019 09:37:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014135424.7000-2-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/14/19 6:54 AM, Fabio Estevam wrote:
> In the i.MX6Q sabreauto pipeline example, it is better to provide
> a real example for the output format, so do it just like in the
> previous lines for consistency.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acke-by: Steve Longerbeam <slongerbeam@gmail.com>

> ---
> Changes since v1:
> - Make this change as part of a single patch
>
>   Documentation/media/v4l-drivers/imx.rst | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
> index 3d72e411b93d..36e8d1226ac6 100644
> --- a/Documentation/media/v4l-drivers/imx.rst
> +++ b/Documentation/media/v4l-drivers/imx.rst
> @@ -547,8 +547,6 @@ This example configures a pipeline to capture from the ADV7180
>   video decoder, assuming PAL 720x576 input signals, with Motion
>   Compensated de-interlacing. The adv7180 must output sequential or
>   alternating fields (field type 'seq-tb' for PAL, or 'alternate').
> -$outputfmt can be any format supported by the ipu1_ic_prpvf entity
> -at its output pad:
>   
>   .. code-block:: none
>   
> @@ -565,7 +563,7 @@ at its output pad:
>      media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x576]"
>      media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x576 field:none]"
>      media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x576 field:none]"
> -   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:$outputfmt field:none]"
> +   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x576 field:none]"
>   
>   Streaming can then begin on the capture device node at
>   "ipu1_ic_prpvf capture". The v4l2-ctl tool can be used to select any

