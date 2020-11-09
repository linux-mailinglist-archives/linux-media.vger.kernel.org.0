Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E8F2AB8B3
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 13:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729804AbgKIMwW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 07:52:22 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:32927 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729756AbgKIMwU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Nov 2020 07:52:20 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id c6eBkxk551R0xc6eEkWiD1; Mon, 09 Nov 2020 13:51:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604926310; bh=HEsod6KzTyVrakNykX+V821e/fnsm/BbfQS+9POA78g=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=f2rxywH4xGjDZSvNfFWyVWQ/bNcFYnZ0ONtO2bzj4WFTRpw5+x/nrWrl9CN+HvJL2
         Ts6aUzLTkVXWtv92eu7gBWlSERo7zGIrzAnz7XXcaXjhwVlbHRcCawpYdO+DK870+j
         WxfkBjXImhTIaQRCba0S6GGJ88CXckyNmDRkj4VJrOStYQgDQ2m4IyTkESy0TbYei/
         Y6VMnU74J+2cxVe3+dxOdMzJ+z0OwqXpRNobF56pVMVouCPB5SfDAEjLKwNpG6B7Hy
         ypp41wfX/dmQWcaQusATxwNjej6usS6uvpXX6DrOKadJLBAGeoc0ZyedmfbaWO5U2F
         RVYR6af9RGUfQ==
Subject: Re: [PATCH v2 03/10] media: tegra-video: Fix V4L2 pixel format for
 RGB888_1X24
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
 <1603768763-25590-4-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <38372d8e-ef7f-d940-ac40-f6b5531e6c69@xs4all.nl>
Date:   Mon, 9 Nov 2020 13:51:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1603768763-25590-4-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLfHM7b5R0RPrmyR0Cikqxw/B4yrilAEXtoHM/ncv5WlO9iTgor9rAwd9xnxwvgJ/8103ZVRpFSYhx1KVSQARpCwujcchpuHDSB1Kr2kz0lupCMMw4LD
 v9GR+vTbNFl2b4tf60MaVyF0KfFr5bGL7Z0K3SkQYbGHSoaJRgsnm8t5aR7HVsPrHYJVCE+iCXAbXNRgQCNqbOdDQrlOnC8hSoREkBZO2jwoAKgw4AuWpNw2
 QMIEFAyBmZNF+5IUjSu8W0gfzpGvs677EUdfWSqiZr/HsbOHn8lbWGBeb5d3vGgJQm6W+/x5Auilikm/8A/vsUW7iAGL8/D2KuzvLkPVb3Y6IUUxM53rQJfG
 qn2ZukDqI9nCvTKGcHgefEQh09UON64zfbFlu7h2cNHwxd6RxC9kS88GqB/58K8cOf4+YS+j
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/10/2020 04:19, Sowjanya Komatineni wrote:
> V4L2 pixel format is incorrect for RGB888_1X24.
> 
> This patch fixes it.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/staging/media/tegra-video/tegra210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
> index 6b23aa7..c883925 100644
> --- a/drivers/staging/media/tegra-video/tegra210.c
> +++ b/drivers/staging/media/tegra-video/tegra210.c
> @@ -619,7 +619,7 @@ static const struct tegra_video_format tegra210_video_formats[] = {
>  	TEGRA210_VIDEO_FMT(RAW12, 12, SGBRG12_1X12, 2, T_R16_I, SGBRG12),
>  	TEGRA210_VIDEO_FMT(RAW12, 12, SBGGR12_1X12, 2, T_R16_I, SBGGR12),
>  	/* RGB888 */
> -	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X24, 4, T_A8R8G8B8, RGB24),
> +	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X24, 4, T_A8R8G8B8, XRGB32),

This is the wrong way around, it should be XBGR32. V4L2 defines the pixelformat
as the order of the color components in memory. Typically for a little endian
system that means that the four bytes are reversed when DMAed.

The same is true for the YUYV variants.

This patch fixes the order for RGB and YUYV:

--------------------------------------------------------
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index aff56fcdc400..063d0a33bf71 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -693,19 +693,19 @@ static const struct tegra_video_format tegra210_video_formats[] = {
 	TEGRA210_VIDEO_FMT(RAW12, 12, SGBRG12_1X12, 2, T_R16_I, SGBRG12),
 	TEGRA210_VIDEO_FMT(RAW12, 12, SBGGR12_1X12, 2, T_R16_I, SBGGR12),
 	/* RGB888 */
-	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X24, 4, T_A8R8G8B8, XRGB32),
+	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X24, 4, T_A8R8G8B8, XBGR32),
 	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X32_PADHI, 4, T_A8B8G8R8,
-			   XBGR32),
+			   RGBX32),
 	/* YUV422 */
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 2, T_U8_Y8__V8_Y8, UYVY),
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 2, T_V8_Y8__U8_Y8, VYUY),
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 2, T_Y8_U8__Y8_V8, YUYV),
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 2, T_Y8_V8__Y8_U8, YVYU),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 2, T_U8_Y8__V8_Y8, YVYU),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 2, T_V8_Y8__U8_Y8, YUYV),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 2, T_Y8_U8__Y8_V8, VYUY),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 2, T_Y8_V8__Y8_U8, UYVY),
 	TEGRA210_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 1, T_Y8__V8U8_N422, NV16),
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 2, T_U8_Y8__V8_Y8, UYVY),
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, T_V8_Y8__U8_Y8, VYUY),
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, T_Y8_U8__Y8_V8, YUYV),
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, T_Y8_V8__Y8_U8, YVYU),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 2, T_U8_Y8__V8_Y8, YVYU),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, T_V8_Y8__U8_Y8, YUYV),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, T_Y8_U8__Y8_V8, VYUY),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, T_Y8_V8__Y8_U8, UYVY),
 };

 /* Tegra210 VI operations */
--------------------------------------------------------

Regards,

	Hans

>  	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X32_PADHI, 4, T_A8B8G8R8,
>  			   XBGR32),
>  	/* YUV422 */
> 

