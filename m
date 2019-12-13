Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C424C11E129
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 10:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfLMJtJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 04:49:09 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:50171 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725793AbfLMJtI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 04:49:08 -0500
Received: from [IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478]
 ([IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fhZHikfHdapzpfhZJidXpZ; Fri, 13 Dec 2019 10:49:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576230546; bh=HUc3zKeJW9H6Hm1khB5tQ7L7YcRWJSdTYofpoPX9qAU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qrtwEar6LLIeIHZPS8llpzRQ4IFlFWKm7fDx4dVA083IYnMltc0DxwLDb/ifmJdDP
         i1Q7S/g1T8Q8MU908X/f2pSvGmeTFwr1bqeL7ye92+GsZpZdpqFwPf1mMeDqz9dODv
         0pY9U5w4pErerP+P+CUhYxMVeSfZRIL3h3uqtgig/BWToH+QF66sWFVHGPI0a7EFxQ
         9dRgYXItZdcpS8taNUPhgRkhruKnd605CMBxUEnZ1IHOf6RzHIE5fc+hrvpogq2KiE
         FI3dW/eGXj5JZYsUH8UXvtAH8QB7Wd6d7E11RjGdyxyPDylC9gm39Ze+MuPWYuLu1y
         pOb/pw45GRL/w==
Subject: Re: [PATCH 2/5] firmware: imx: scu-pd: Add power domains for imx-jpeg
To:     Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
 <1573053633-21437-3-git-send-email-mirela.rabulea@nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <64ac7dca-9834-6a33-aa3e-9b7e2156dedc@xs4all.nl>
Date:   Fri, 13 Dec 2019 10:49:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573053633-21437-3-git-send-email-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEMmp7oYIkbgEM7D6JgjinsovQizeZ+jRSdBDf1vn0wC2EIYBFDFO/ELj/7QhrS6c06/ToBIh61C33SRbks5i1KBmmYommhaMesvVAMMjpUREU0IOlpK
 4M/pYYUTI4ljknncmFtHR6S4/v85G/BmurDo7T52UK1i8sSV08Wa9USny4W8nKedNVUIwYJQOHH1JuhbtTD6HxUNtYdVWIMSNoSfvTu/dHT55KCNgCS6zDW2
 dNWACg8zftn2Nh+oSub47k1eokMC+N0fdxqnWO2WEaXcl26ryl/qFGUOykoXBhzPcsjSDwj4VqAybi/gKJ0+4xVor7jRNVLkodO/z+oZVPZXOvSKbUaQL5ab
 SM0IoushwIL6rVNCuzecZzZhq3YlR6qfsydSw+87qoamWkjHmgeiA4O2XRYSte9iM5wm5utflNaXtpEIuyXh2nGO/j2hu7uLaiK2Eyn5TMTSLVyLe4Mi6uZJ
 Bri+HPAAFr2KeLp9ThP3W8KoiTpVhNboHWsQ1fMDOxOtM/VjBr4xjAeop0dqLEMjQxJpXq2A9CXwd9b2i1lD5/1LADFGrOyw1rPiQe1XxkdRNl/c1SB73+6D
 YS7Ica2uJSGYK21tZKPOszhw8/SUj/irp40JgoC9NC2syv/R5ZHrAi4Vp1ayTVQrFrCjyiEETm4htr1kvFx8LLxVd+e1/SKshXjk9P/ajGe7PBZELiQY5zC7
 DOTBJRw1SkBCPbgNYZsvoN+gjNkDW83njqFgfLYuC/ibN3hRuSjhGm/aoyZqrQlGzg3WBg3tZq2z6FKM60uJMF9Fo/s29zitJgBmTdXbIPhsVzCNj59IJFl/
 LFya9Mfe4y5e4Ak1zY87rGyStzpcc0sEGtrtJABgDP/ZKeU5TbStYbjRKFB56Z17r3OOM3wI59ZiwC4+TxaGeAmVOTHFXzJ2AMqvLKup2cO2PpAcRSmDBxfH
 xfp4hYHvGVhw1cmhExq0KssjLs4WjVGhVBYIPbt5qQ8JHx7t
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/6/19 4:20 PM, Mirela Rabulea wrote:
> The power domains are for imx8qxp/imx8qm JPEG encoder & decoder.
> Each has 4 slots and a wrapper.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Shawn, Daniel, can I have an Ack from you? It probably makes sense that
this patch gets merged via the media subsystem.

Regards,

	Hans

> ---
>  drivers/firmware/imx/scu-pd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/firmware/imx/scu-pd.c b/drivers/firmware/imx/scu-pd.c
> index b556612..e7bf48a 100644
> --- a/drivers/firmware/imx/scu-pd.c
> +++ b/drivers/firmware/imx/scu-pd.c
> @@ -158,6 +158,12 @@ static const struct imx_sc_pd_range imx8qxp_scu_pd_ranges[] = {
>  	/* DC SS */
>  	{ "dc0", IMX_SC_R_DC_0, 1, false, 0 },
>  	{ "dc0-pll", IMX_SC_R_DC_0_PLL_0, 2, true, 0 },
> +
> +	/* IMAGE SS */
> +	{ "img-jpegdec-mp", IMX_SC_R_MJPEG_DEC_MP, 1, false, 0 },
> +	{ "img-jpegdec-s0", IMX_SC_R_MJPEG_DEC_S0, 4, true, 0 },
> +	{ "img-jpegenc-mp", IMX_SC_R_MJPEG_ENC_MP, 1, false, 0 },
> +	{ "img-jpegenc-s0", IMX_SC_R_MJPEG_ENC_S0, 4, true, 0 },
>  };
>  
>  static const struct imx_sc_pd_soc imx8qxp_scu_pd = {
> 

