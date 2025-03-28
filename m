Return-Path: <linux-media+bounces-28917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8863CA74584
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 09:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D9E2188A83C
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 08:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26AD213232;
	Fri, 28 Mar 2025 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwY4mibj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09112F3B;
	Fri, 28 Mar 2025 08:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743150862; cv=none; b=lEl/UXRbRHV7wJPoD3iCWBvXsFEpNuhng2a6Fm0lPNdBTtcB7UdYubA+qs9muxwB7QbK0ajp2Fwfjg16CgXexIBZ69HJQ2Drl1mVuxLZowef+BIDJvlzY723CsGt5tXHjACHhnoyU3BMrsU6ULmEdDNCaCmUzcViC9CCgj+JxmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743150862; c=relaxed/simple;
	bh=ZOjkFZ7BFQi6G4Jqg2uwAw8Twpd0W2wDSgbVpuRDCB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRgcgowWuDwXI7UfUDkI3n5eJRjwf6bn1UC2sKkLgtIeTH7I7ag2CfSsj3oPBfewr7LwORDRsikz6q+3aBQJlXvHlnhKse4AuVGF3ZL3GK+WsJ7UT2fSV3Z+6xLkQuVUXjwkBs34nhUuIiWh2BQug69dXD9oNF4JCXFv5pXCv8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwY4mibj; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff187f027fso3909327a91.1;
        Fri, 28 Mar 2025 01:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743150858; x=1743755658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rxxKtxp1frS/ucj+/vrHXDgykeiYNdM6wlPTF4Db3c=;
        b=mwY4mibjfRRWtrk0N3JgBmJ7YwrCPUugT5CFXg+qDmcnxMucOM7yoTm307rE1HB8A8
         +mtpQ9gOncjjSlEODYJK2ownq32cY627runtV2ES32OCaPYgsR5KOsuNNHlq6mrbPFsK
         lY4OdJwlSRfytLnqdKEj/gPLxZdAFG2n0/kX7YybwQ2WsqEtoMSr6iW+mV96aDvXyw61
         WEV+aIMyCXktdzAYH2gDF0SFwnti5mokUapTjwygjt9wCzm/whnwI+aa3f2/1/lCQEoQ
         o40YF+3+RSneLSMZAe/Nfpd6wOWOQpBsdg/4SBhpttH0cG5VaBOUGmmJY/LepvIKqL/X
         Yt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743150858; x=1743755658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rxxKtxp1frS/ucj+/vrHXDgykeiYNdM6wlPTF4Db3c=;
        b=toh7SN4sVJ5TUXlEHGH5hlx6DPZIM2T+23MtIZiy47/fku1PMaNdDFdnVVt16pH5Tg
         IXSukjOca+oqGt2rdwnGDWwvN+kIFqcXfXk7pYBic88dSx50oBiFUW/pgZqR9RGgaF6I
         18ljniw2y0Q5h41mQ0ZvdY6WGzg6AGc791r3hrA0hgGRjLUsk4pzsjs4wQRH5q2qj4pz
         T8aZ6riD6VWPPxb1r9myyy/Jfh68oPaIUh1gILdmOZ4Up1wZOOJ6U+zmRD1X+Ih4qayz
         yHXA11a6mFe/v39DvFFeMRiyRp4x+8m2ackwaMfaCZhTFJY4UibezhbzfuuwDfETKGU3
         LNYw==
X-Forwarded-Encrypted: i=1; AJvYcCUSRIYovmwJqUmdmH3ry6NcWKKL7ACCX1W+3YSHeiwDSmdoho+WdKtZuLo4FU+FSH3pENJszquHt7u6zd4=@vger.kernel.org, AJvYcCVvqlTsXofUmoSGI1oqEPo3VSwVMdTckYhOUuTEsKX0/Q+KI7sdq1eHJwGWFLb6RoSmuADbAixG/qhPdwvF@vger.kernel.org, AJvYcCXZ8HWhfHQE4t5SzhPr8UP6/m7p2ybBYEZO8qI0EGe8evuoyql+UoqAiAANGjIc6RbfDILAvRco/C8Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwJsTaoGXsb7awiZkRAa0cW5lJo6gojalFqlM9Y8vRn3/zP9tTj
	gf5XMkmeM81HDgF4sAv0PH358Az/XZDya3lsiUxZn1/GjFGcM+efh3vDLbqlRGkcb8cP8LMg1OE
	373kY8iS3Ow/tQq1ES0gGg4ldjPc=
X-Gm-Gg: ASbGncs6tquxLqCTo5QQV1yIyLF6Fjp3EkWuZmbBWSfRg+JlY/l7/QkdEkrRIteCkuV
	IXyRko6Rc+35Gc3tsI2cGn7fBDVkcBO8FxcVvIcq+YKrDPYf/6P9wnOhGsHx9nmpH1XSjqIPy2U
	KA8AuPI92CG1Vu5TPJM97iUaY=
X-Google-Smtp-Source: AGHT+IF11wwSuNqF7pUfzisNp2o2JHE+e/bTTG2jQulsEtYEXB9Y+0sNfCMi43CBuG1cp6jFC1ouNOKlmRa2RqKP3SE=
X-Received: by 2002:a17:90b:2f07:b0:2fa:2268:1af4 with SMTP id
 98e67ed59e1d1-3051c889b0dmr3132648a91.7.1743150857908; Fri, 28 Mar 2025
 01:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com> <20250210-8qxp_camera-v3-7-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-7-324f5105accc@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 28 Mar 2025 10:35:44 +0200
X-Gm-Features: AQ5f1JpmDTleDRGa2oBcGXFZnflEOzTPa-iL5lCB0QpwZJnUePwDVEuepPhFb_8
Message-ID: <CAEnQRZAmCrZ=OmMLWF80mrMih+uFDKMp3dGsEosJe0vCHgEEYw@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] media: imx8mq-mipi-csi2: Add imx8mq_plat_data
 for different compatible strings
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Robert Chiras <robert.chiras@nxp.com>, "Guoniu.zhou" <guoniu.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:02=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>
> Introduce `imx8mq_plat_data` along with enable/disable callback operation=
s
> to facilitate support for new chips. No functional changes.
>
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v2 to v3
> - none
> change from v1 to v2
> - remove internal review tags
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 60 ++++++++++++++++++++-=
------
>  1 file changed, 46 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/medi=
a/platform/nxp/imx8mq-mipi-csi2.c
> index 1f2657cf6e824..b5eae56d92f49 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -62,6 +62,8 @@
>  #define CSI2RX_CFG_VID_P_FIFO_SEND_LEVEL       0x188
>  #define CSI2RX_CFG_DISABLE_PAYLOAD_1           0x130
>
> +struct csi_state;
> +
>  enum {
>         ST_POWERED      =3D 1,
>         ST_STREAMING    =3D 2,
> @@ -83,11 +85,11 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2=
_NUM_CLKS] =3D {
>
>  #define CSI2_NUM_CLKS  ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
>
> -#define        GPR_CSI2_1_RX_ENABLE            BIT(13)
> -#define        GPR_CSI2_1_VID_INTFC_ENB        BIT(12)
> -#define        GPR_CSI2_1_HSEL                 BIT(10)
> -#define        GPR_CSI2_1_CONT_CLK_MODE        BIT(8)
> -#define        GPR_CSI2_1_S_PRG_RXHS_SETTLE(x) (((x) & 0x3f) << 2)
> +struct imx8mq_plat_data {
> +       const char *name;
> +       int (*enable)(struct csi_state *state, u32 hs_settle);
> +       void (*disable)(struct csi_state *state);
> +};
>
>  /*
>   * The send level configures the number of entries that must accumulate =
in
> @@ -106,6 +108,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2=
_NUM_CLKS] =3D {
>
>  struct csi_state {
>         struct device *dev;
> +       const struct imx8mq_plat_data *pdata;
>         void __iomem *regs;
>         struct clk_bulk_data clks[CSI2_NUM_CLKS];
>         struct reset_control *rst;
> @@ -137,6 +140,35 @@ struct csi2_pix_format {
>         u8 width;
>  };
>
> +/* ---------------------------------------------------------------------=
--------

I would drop this line. It doesn't make code easier to read.
> + * i.MX8MQ GPR
> + */

Just say: /* i.MX8MQ GPR */

This pattern happens in a lot of places.

