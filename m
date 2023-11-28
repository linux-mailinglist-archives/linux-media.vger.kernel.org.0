Return-Path: <linux-media+bounces-1278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E9E7FBCA3
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 15:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 766721C20AA2
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 14:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CA45B5BA;
	Tue, 28 Nov 2023 14:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lKKIARly"
X-Original-To: linux-media@vger.kernel.org
X-Greylist: delayed 583 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 28 Nov 2023 06:21:32 PST
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b4])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A99D64
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 06:21:31 -0800 (PST)
Message-ID: <6d0f8057-70f9-46f9-828a-df03c753b42b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1701180706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hxr6Qi8uAR1GAsmRwi31SrOVsQk0+PK+MAopQh8m5vk=;
	b=lKKIARlyv1H6YGZl6IGyLBEni04sQJfG863/4ZgCGXNR9S/hHpHmfvXyouaj//rnKHuvYk
	43za6NCU8WEn9fiHOOidCkKIH83XwBPPuHZ4e1Grw5BHUwFC6vH+V7cw0wmx5/w3WiJdFA
	LOF/zVvAJBOiCI+vxywRaIkiRGMDZMs=
Date: Tue, 28 Nov 2023 22:11:24 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [v4,43/45] drm/sun4i: hdmi: Switch to container_of_const
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20231128-kms-hdmi-connector-state-v4-43-c7602158306e@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-43-c7602158306e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2023/11/28 18:24, Maxime Ripard wrote:
> container_of_const() allows to preserve the pointer constness and is
> thus more flexible than inline functions.
>
> Let's switch all our instances of container_of() to container_of_const().
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>


LGTM,

Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>


> ---
>   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> index bae69d696765..c276d984da6b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -30,19 +30,11 @@
>   #include "sun4i_drv.h"
>   #include "sun4i_hdmi.h"
>   
> -static inline struct sun4i_hdmi *
> -drm_encoder_to_sun4i_hdmi(struct drm_encoder *encoder)
> -{
> -	return container_of(encoder, struct sun4i_hdmi,
> -			    encoder);
> -}
> +#define drm_encoder_to_sun4i_hdmi(e)		\
> +	container_of_const(e, struct sun4i_hdmi, encoder)
>   
> -static inline struct sun4i_hdmi *
> -drm_connector_to_sun4i_hdmi(struct drm_connector *connector)
> -{
> -	return container_of(connector, struct sun4i_hdmi,
> -			    connector);
> -}
> +#define drm_connector_to_sun4i_hdmi(c)		\
> +	container_of_const(c, struct sun4i_hdmi, connector)
>   
>   static int sun4i_hdmi_setup_avi_infoframes(struct sun4i_hdmi *hdmi,
>   					   struct drm_display_mode *mode)

