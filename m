Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2971F997A
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 16:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbgFOOBd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 10:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbgFOOBc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 10:01:32 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AA8C061A0E
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 07:01:32 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id g12so6842920pll.10
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=8ES2NVshIOgfEMCf72wvYUExToe999LpTEELFEYgbIc=;
        b=tMGDs1fBAbWOpekLNkbLGeRxaer/gDzJk4z0CLytkTCxnH5P9sYGrEzQe8zC3xJb7I
         f12rYbaNdXcEz0Lxpu06vzpOtKQFoI7YtEOiG0pyEoIzbcGa9e4mNicHkkMH0IojaqrZ
         Doohf/eYCV/vrunU+4iTVvd8YAI35NsWd8mSPzoQw0x08IfabLoijEVUYnd8wbeth3+r
         zFrS5Hl8YylmZDVE4KhdtobyJAhlPB32+hknqzvYxrQg5OirgwjX4rdt6huIFO1T8+Mi
         0Utq3wiKizi4n/MJwPtY1csN+yvR9G+9ealXuHkxo2w1TZK0bF11/NQlUMpFcW8aMY+M
         XQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=8ES2NVshIOgfEMCf72wvYUExToe999LpTEELFEYgbIc=;
        b=VrjjmlVCtf3G2OMG0EwLi0q/aqjasRJ3pGRtynphb1rVhfBeSBGpOn02/ZPYdCV0+b
         5EbK+cQGMy4UQU3IV3GSa5Xk6lC3WfnUh7cpqq0jd37VEDd/plBSZrcQazMzRNfZNsyz
         gdVl560X2bURPR+adD8Oe3gFSEHtV2hZZVJesvULnRR4isGopSlb5A9QXMk4PNKlLql+
         b6Ibm6/06xlWa7IgvW0PI2NyUR7ETY2mqmmT9PbkIGji+MTCKI3iouQo0xNSmEKgQSxC
         kLar0g0tf9SEnTvhdQSuqYbXYjW1GDiBqfVQMQgZ10itK6xf0KkgEiRnFb7l0WS/wLch
         voaQ==
X-Gm-Message-State: AOAM532lmLISxH3Dm5syH+mUHYcI2fQ28PWaBsbhe+fvk32X8TEYozY2
        vYTPNCOsQCnw0bgd47tPf2DH
X-Google-Smtp-Source: ABdhPJxvPO0BNiqVGlonkLfh0wYJeKkGOFIFSFn0SFRbCZK2iFCaXihPRZlZWxzbRuCq1qQpSAMZUg==
X-Received: by 2002:a17:90a:a616:: with SMTP id c22mr11644235pjq.14.1592229691691;
        Mon, 15 Jun 2020 07:01:31 -0700 (PDT)
Received: from ?IPv6:2409:4072:6e9c:5ed9:4574:ef47:f924:dba6? ([2409:4072:6e9c:5ed9:4574:ef47:f924:dba6])
        by smtp.gmail.com with ESMTPSA id c9sm14246360pfp.100.2020.06.15.07.01.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jun 2020 07:01:30 -0700 (PDT)
Date:   Mon, 15 Jun 2020 19:31:21 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <20200612135355.30286-11-andrey.konovalov@linaro.org>
References: <20200612135355.30286-1-andrey.konovalov@linaro.org> <20200612135355.30286-11-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 10/10] media: i2c: imx290: set bus_type before calling v4l2_fwnode_endpoint_alloc_parse()
To:     Andrey Konovalov <andrey.konovalov@linaro.org>, mchehab@kernel.org,
        sakari.ailus@iki.fi
CC:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <69487D0C-D5CE-4B41-9593-A1AF7D205681@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12 June 2020 7:23:55 PM IST, Andrey Konovalov <andrey=2Ekonovalov@linar=
o=2Eorg> wrote:
>The bus_type field of v4l2_fwnode_endpoint structure passed as the
>argument
>to v4l2_fwnode_endpoint_alloc_parse() function must be initiaized=2E
>Set it to V4L2_MBUS_CSI2_DPHY, and check for -ENXIO which is returned
>when the requested media bus type doesn't match the fwnode=2E
>
>Also remove v4l2_fwnode_endpoint field from struct imx290 as it is only
>needed in the probe function: use the local variable for this purpose=2E
>
>Signed-off-by: Andrey Konovalov <andrey=2Ekonovalov@linaro=2Eorg>

Reviewed-by: Manivannan Sadhasivam <manivannan=2Esadhasivam@linaro=2Eorg>

Wondering if we need to tag fixes for this patch!

Thanks,=20
Mani

>---
> drivers/media/i2c/imx290=2Ec | 38 +++++++++++++++++++-------------------
> 1 file changed, 19 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/media/i2c/imx290=2Ec b/drivers/media/i2c/imx290=2Ec
>index 02001c1b0dfc=2E=2E9c97830164e9 100644
>--- a/drivers/media/i2c/imx290=2Ec
>+++ b/drivers/media/i2c/imx290=2Ec
>@@ -70,7 +70,6 @@ struct imx290 {
> 	u8 bpp;
>=20
> 	struct v4l2_subdev sd;
>-	struct v4l2_fwnode_endpoint ep;
> 	struct media_pad pad;
> 	struct v4l2_mbus_framefmt current_format;
> 	const struct imx290_mode *current_mode;
>@@ -914,17 +913,18 @@ static const struct media_entity_operations
>imx290_subdev_entity_ops =3D {
>* of MIPI data lanes are mentioned in the device tree, or the value of
>the
>  * first missing frequency otherwise=2E
>  */
>-static s64 imx290_check_link_freqs(const struct imx290 *imx290)
>+static s64 imx290_check_link_freqs(const struct imx290 *imx290,
>+				   const struct v4l2_fwnode_endpoint *ep)
> {
> 	int i, j;
> 	const s64 *freqs =3D imx290_link_freqs_ptr(imx290);
> 	int freqs_count =3D imx290_link_freqs_num(imx290);
>=20
> 	for (i =3D 0; i < freqs_count; i++) {
>-		for (j =3D 0; j < imx290->ep=2Enr_of_link_frequencies; j++)
>-			if (freqs[i] =3D=3D imx290->ep=2Elink_frequencies[j])
>+		for (j =3D 0; j < ep->nr_of_link_frequencies; j++)
>+			if (freqs[i] =3D=3D ep->link_frequencies[j])
> 				break;
>-		if (j =3D=3D imx290->ep=2Enr_of_link_frequencies)
>+		if (j =3D=3D ep->nr_of_link_frequencies)
> 			return freqs[i];
> 	}
> 	return 0;
>@@ -934,6 +934,10 @@ static int imx290_probe(struct i2c_client *client)
> {
> 	struct device *dev =3D &client->dev;
> 	struct fwnode_handle *endpoint;
>+	/* Only CSI2 is supported for now: */
>+	struct v4l2_fwnode_endpoint ep =3D {
>+		=2Ebus_type =3D V4L2_MBUS_CSI2_DPHY
>+	};
> 	struct imx290 *imx290;
> 	u32 xclk_freq;
> 	s64 fq;
>@@ -956,15 +960,18 @@ static int imx290_probe(struct i2c_client
>*client)
> 		return -EINVAL;
> 	}
>=20
>-	ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, &imx290->ep);
>+	ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
> 	fwnode_handle_put(endpoint);
>-	if (ret) {
>+	if (ret =3D=3D -ENXIO) {
>+		dev_err(dev, "Unsupported bus type, should be CSI2\n");
>+		goto free_err;
>+	} else if (ret) {
> 		dev_err(dev, "Parsing endpoint node failed\n");
> 		goto free_err;
> 	}
>=20
> 	/* Get number of data lanes */
>-	imx290->nlanes =3D imx290->ep=2Ebus=2Emipi_csi2=2Enum_data_lanes;
>+	imx290->nlanes =3D ep=2Ebus=2Emipi_csi2=2Enum_data_lanes;
> 	if (imx290->nlanes !=3D 2 && imx290->nlanes !=3D 4) {
> 		dev_err(dev, "Invalid data lanes: %d\n", imx290->nlanes);
> 		ret =3D -EINVAL;
>@@ -973,27 +980,20 @@ static int imx290_probe(struct i2c_client
>*client)
>=20
> 	dev_dbg(dev, "Using %u data lanes\n", imx290->nlanes);
>=20
>-	if (!imx290->ep=2Enr_of_link_frequencies) {
>+	if (!ep=2Enr_of_link_frequencies) {
> 		dev_err(dev, "link-frequency property not found in DT\n");
> 		ret =3D -EINVAL;
> 		goto free_err;
> 	}
>=20
> 	/* Check that link frequences for all the modes are in device tree */
>-	fq =3D imx290_check_link_freqs(imx290);
>+	fq =3D imx290_check_link_freqs(imx290, &ep);
> 	if (fq) {
> 		dev_err(dev, "Link frequency of %lld is not supported\n", fq);
> 		ret =3D -EINVAL;
> 		goto free_err;
> 	}
>=20
>-	/* Only CSI2 is supported for now */
>-	if (imx290->ep=2Ebus_type !=3D V4L2_MBUS_CSI2_DPHY) {
>-		dev_err(dev, "Unsupported bus type, should be CSI2\n");
>-		ret =3D -EINVAL;
>-		goto free_err;
>-	}
>-
> 	/* get system clock (xclk) */
> 	imx290->xclk =3D devm_clk_get(dev, "xclk");
> 	if (IS_ERR(imx290->xclk)) {
>@@ -1108,7 +1108,7 @@ static int imx290_probe(struct i2c_client
>*client)
> 	pm_runtime_enable(dev);
> 	pm_runtime_idle(dev);
>=20
>-	v4l2_fwnode_endpoint_free(&imx290->ep);
>+	v4l2_fwnode_endpoint_free(&ep);
>=20
> 	return 0;
>=20
>@@ -1118,7 +1118,7 @@ static int imx290_probe(struct i2c_client
>*client)
> 	v4l2_ctrl_handler_free(&imx290->ctrls);
> 	mutex_destroy(&imx290->lock);
> free_err:
>-	v4l2_fwnode_endpoint_free(&imx290->ep);
>+	v4l2_fwnode_endpoint_free(&ep);
>=20
> 	return ret;
> }

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
