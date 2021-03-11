Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A509336D06
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 08:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbhCKH1f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 02:27:35 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40729 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231504AbhCKH1Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 02:27:25 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KFj4lOWNPC40pKFj8lKLW5; Thu, 11 Mar 2021 08:27:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615447643; bh=XfiRiX/Im3KbeMNo9cMm4VRSxjH+mKuoMBiQxT6LGlU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=S8P/vj/ozRnwrIaLNNrjRcD5tykA7wlodxJw77CEslX2bFoqvlYMx2WWbyU41j+/8
         QCHk/XQMwHYAcDNw2QV8vbBdPbozE1oQ3b3JhWNMg7smzjZbn25tuzZ7Opymx5qkvm
         9gunPecf+VXBdSlx92Gq0qvbihTOPjjzgXvvPUptQuiAEs1Fshsl/B+KvcPN4mMx4B
         ERDN2hs7Yvo/zzMi8GspomKcxZ99k1UMBr+dIC1uVXoBZvXPe3a96gCRih4aR04K56
         IyiC+bMtR56EX+5f/fIXepv0SKNj7EYgyNMDg5YgMnJX2fLHpFwEda10K6ZnSWU5sA
         XzX/C6JKZOLnw==
Subject: Re: [PATCH v9 6/8] media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
References: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
 <20210311002854.13687-7-mirela.rabulea@oss.nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <58f6d308-c5c7-f2a0-9c64-b729282c9b71@xs4all.nl>
Date:   Thu, 11 Mar 2021 08:27:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311002854.13687-7-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfI6+9cNPQm1FRsig+UGPeKnoJIWK5pswKqZ+nyHhy08pjyhkqQzCmKamf0/IYLsYnzbUaR4zZSymDGyXji55s8LryA8UWj5+dPZlbSbroh4lovGMHUz+
 +zUuZ8hTXHt5cwJh9Qcx/Fj0AMMqG8W6s+UX+EsdU/4hYJNwUQwZaoa6NFTJPcQ/pOHnAYGw2K9NgYvi3klPKS4ednumcE0fAi0jJFG6ihGb13l/gXuChBRN
 +myg0qhyY9S5TDkeoxYRg6bSVn/SKpRiaZ9r1mp+0QxZ1oPUx620MUdlZhThWvhSbtJ+4TI9/q9P0XMfhmSniUt90IuR2k6lYD2uMcWg6XSSgAoupkrha7aC
 ajoBGFEJj/JApFHZPWpeUW0NXssjkF6qVwzaAl09R6gwgKkpFQwUbXL/H2eZn11uv0CZKwvxiL3zNfefDEsAWSnJSV2R0B/40zBMToQonkxIS4m/uiHUspnR
 z+TBqOeiqeXflt1CEcJTpX3wCfxw/RGi2Ychnj++7YFcjEvqNOuJ00VyJYZ/Q8J9MsBTQZNRjDygo1wOR6iGjC3A9ISzBQSp/bEt0lqvMi6eAsT+BUbTg+SU
 Icg2sFVMwabR9TU3sIUgJad1rRiqq7QBsdg3IffWu5S9Pz/s+tVpYgeM17meFw/wxCaNF599bU0mrq+4ry7/fR1aWTw9hpHD1/Fqu+gR+KSZJTRAMT7CrGCr
 BFshoKCB3CHx/gitzC1tekPTTygGvboONoEyaVTJzvt2ShKpeYgfpyAJf0+cXEOqB6i0X3sCSAfgPFF0Gfg6Y6K/iRm+t+ddB0j2/E8MN07QfT9M2v2uivhl
 g1aA20zR5sgX4ZyRSE7QPHm5ZAhq/TLELhtpXc4Lq5jcNQ7mZp1w6qB2hWRJwlcE9N823+0ID4GgfCiITT90Tb8um8bzBxHPFFJgBDXd9gRxs/hphOY/4uP9
 pMHrOQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mirela,

On 11/03/2021 01:28, Mirela Rabulea (OSS) wrote:

<snip>

> +static const struct of_device_id mxc_jpeg_match[] = {
> +	{
> +		.compatible = "nxp,imx8qxp-jpgdec",
> +		.data       = (void *)MXC_JPEG_DECODE,

Don't do this, just say:

static const int mxc_decode_mode = MXC_JPEG_DECODE;
static const int mxc_encode_mode = MXC_JPEG_ENCODE;

and point to that:

		.data = &mxc_decode_mode;

> +	},
> +	{
> +		.compatible = "nxp,imx8qxp-jpgenc",
> +		.data       = (void *)MXC_JPEG_ENCODE,

		.data = &mxc_encode_mode;

> +	},
> +	{ },
> +};

<snip>

> +static int mxc_jpeg_probe(struct platform_device *pdev)
> +{
> +	struct mxc_jpeg_dev *jpeg;
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	int dec_irq;
> +	int ret;
> +	int mode;
> +	const struct of_device_id *of_id;
> +	unsigned int slot;
> +
> +	of_id = of_match_node(mxc_jpeg_match, dev->of_node);
> +	mode = (int)(u64)of_id->data;

and this becomes:

	mode = *(const int *)of_id->data;

This will solve the kernel test robot warning, and for that matter
the same gcc warnings I get when I compile.

Just post a v9.1 for this patch, everything else looks good.

Regards,

	Hans
