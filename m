Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2694D41B3
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 08:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240023AbiCJHWO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 02:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240030AbiCJHWM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 02:22:12 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94203131974;
        Wed,  9 Mar 2022 23:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646896871; x=1678432871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SDMH4Lrut+v6QvvwgHR3CQKGCpHrAskEKeuCGP50BE8=;
  b=bbC+tm5VV9MAYh8TRAfwAVISdZ2MxbvD8YyzN2/+9cvJvO+EeHEWGpPW
   PUaiJ6Aiod9j3h/Yl0DU+2ZqofU6N9PzuJ2awfsIEgO+MiDlST6nXVR4W
   BBq9G1ULmB30XKP1VldJrWy38AnSXnyPLAFeRVqSDZbIHBQFjCK1186Gd
   g8CU/N4heEjxcpGOUUMLr2sZKl/UmwAXTbY8WrlL0Hx92eYicLOefO9l0
   /pXPCBd76/lJwuSOMT8UFn4KaQ+ifmNFbY4+/G4iHzRZfW49IeyL3sxrn
   Y2lZqiioi0kauifQPW5swXM9drzEChB3qfnpNVa6gYWt/mibZfuZQiFk9
   g==;
X-IronPort-AV: E=Sophos;i="5.90,169,1643670000"; 
   d="scan'208";a="22572217"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 10 Mar 2022 08:21:08 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 10 Mar 2022 08:21:08 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 10 Mar 2022 08:21:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646896868; x=1678432868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SDMH4Lrut+v6QvvwgHR3CQKGCpHrAskEKeuCGP50BE8=;
  b=FpHmwVzcwUsd4W9Ic93ndFvYxPXYS145rE63qz9YnIM8DBkzNeCCwxwJ
   FQSWkDEDxAFJYpAHfAoO5CKr1U+v0F3DidcX8jjp32semXKBVj759hita
   ovLqgq0rLn1QdTqyYDI6rK1Q6EbPRB8A7A6m3sOR/3vukShnI8X49BJ3g
   2FqZn4HCBmgIjWvrnIwZ9A5FiRiLnor62mmfbwFgLIRZP3hmVVj4q3pOy
   XkGGEyLJ87rCNHMr+nAgJRHn7t+ehCDfOCqJqje+9uqIGP4IGyIf6Lhc3
   gLIsov3J++32B6mg/F8H/kXTYL31AEknmavIO4NztdOcbP1jI/xIvOFnp
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,169,1643670000"; 
   d="scan'208";a="22572216"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Mar 2022 08:21:08 +0100
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1F707280065;
        Thu, 10 Mar 2022 08:21:08 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: (EXT) [PATCH v3 8/9] media: dw100: Add i.MX8MP dw100 dewarper driver
Date:   Thu, 10 Mar 2022 08:21:05 +0100
Message-ID: <10066981.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220308201038.48386-9-xavier.roumegue@oss.nxp.com>
References: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com> <20220308201038.48386-9-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Xavier,

thanks for trying to mainline this hardware support.

Am Dienstag, 8. M=E4rz 2022, 21:10:37 CET schrieb Xavier Roumegue:
> Add a V4L2 mem-to-mem driver for the Vivante DW100 Dewarp Processor IP
> core found on i.MX8MP SoC.
>=20
> The processor core applies a programmable geometrical transformation on
> input image to correct distorsion introduced by lenses.
> The transformation function is exposed as a grid map with 16x16 pixel
> macroblocks indexed using X, Y vertex coordinates.
>=20
> The dewarping map can be set from application through dedicated a v4l2
> control. If not set or invalid, the driver computes an identity map
> prior to start the processing engine.
>=20
> The driver supports scaling, cropping and pixel format conversion.
>=20
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> ---
> [snip]
> diff --git a/drivers/media/platform/dw100/dw100.c
> b/drivers/media/platform/dw100/dw100.c new file mode 100644
> index 000000000000..7e1fcdfe5b91
> --- /dev/null
> +++ b/drivers/media/platform/dw100/dw100.c
> @@ -0,0 +1,1744 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * DW100 Hardware dewarper
> + *
> + * Copyright 2022 NXP
> + * Author: Xavier Roumegue (xavier.roumegue@oss.nxp.com)
> + *
> + */
> [snip]
> +static const struct v4l2_ctrl_config ctrl_custom_lut =3D {
> +	.id =3D V4L2_CID_DW100_MAPPING,
> +	.name =3D "Look-Up Table",
> +	.type =3D V4L2_CTRL_TYPE_U32,
> +	.min =3D 0x00000000,
> +	.max =3D 0xFFFFFFFF,
> +	.step =3D 1,
> +	.def =3D 0,
> +	.dims =3D { DW100_MAX_LUT_NELEMS },
> +	.flags =3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
> +};

I know right now there is only one control, but you are reserving 16 contro=
ls=20
in PATCH 5/9. So for me it seems sensible to make this an array already, so=
=20
that additional controls can be added here easily.

> [snip]
> +	hdl =3D &ctx->hdl;
> +	v4l2_ctrl_handler_init(hdl, 1);
> +	v4l2_ctrl_new_custom(hdl, &ctrl_custom_lut, NULL);

IMHO this won't need any further changes if an array is already being used.
I'm eager to try it once you can provide an example how to use it.

Regards
Alexander



