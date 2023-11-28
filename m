Return-Path: <linux-media+bounces-1269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8627FB995
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 12:45:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9A771C21234
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2714F886;
	Tue, 28 Nov 2023 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xdub+mKZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F56D72;
	Tue, 28 Nov 2023 03:45:06 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a0029289b1bso738876366b.1;
        Tue, 28 Nov 2023 03:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701171905; x=1701776705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVyoKGbm9uEoi/X6H5927NF7CsFAti82Jkn535IWRLU=;
        b=Xdub+mKZ4E5rvw0u08NmZivgSNMIYs8i46MSGr05zh0HKze7gfXg7rY02PuNkRIAyY
         zQ3NDcCLl1fC0Rh9wCCq7TR7Z3iR+Lhg8Wa2OuA0ja2PWztoIHnl/ZJVC97O3Mb38veK
         C4RWTf1bybgCj/mlBJkdmf5rQAQPKSZwUcPw238sX6nxBXLC6yUmTx944RdQw1qUxyEf
         vdLgw9Myoxn+u6OnpU+72pESHXizBJFWhWaSPN9DYoVXzDEIfTQpqpiHOCsuJ7GW9Tu0
         YtyiSoiHi3FEpvg/4Xnd6tslqFgMMxjH4dl4xJo0lIxUPh9sGYvJuVdX+4THGAgoI5/N
         CI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701171905; x=1701776705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVyoKGbm9uEoi/X6H5927NF7CsFAti82Jkn535IWRLU=;
        b=wsKpX+46MtdfMdZfrQ56SJsZPKTJIRipEhEg8x6Im3aRLPoU2O4v3P3MBVjaIkK2LB
         XbQEhrdhXXtKtl8YG2MVfHPDwzL9n/GPtwqkH4Eqz/kKo6TIkgE6SKmlEz6BE2zjw/b7
         K0SX5NOPMp4EHzVrXC6dKnxZMYU67qaNhDOR3W1ScmehsRcFnEmYF2RrpFUSHASQgAfw
         o7wEgpxdhydcYEH+CdOZAO2DruWH/2S8I8tb7wA67Dp3apEhywTHYTF1OkYmWF17sEBz
         LPZ1SbOx2+IhE5W/gs4F/WIFZkI3ynpFpZHmZ00G3e1EAss34FjsRBnDod8VpKfT9U9b
         lMMQ==
X-Gm-Message-State: AOJu0Yx/TyLPLAtcqH5gf3534oZ+Uso3RM6ozB4L9N2Tgt7ObTMTeM50
	0YaCmwzCPrvy6rHXF+IW+TQ=
X-Google-Smtp-Source: AGHT+IHdLHq7SVACyp0TGOAJ7YYU9KjyyngMti1/L69SMz2NBoKFv/CGPDJ9/NE3UAOVE/5bAaEY0Q==
X-Received: by 2002:a17:906:693:b0:9fc:9b28:7ff7 with SMTP id u19-20020a170906069300b009fc9b287ff7mr12075812ejb.60.1701171904683;
        Tue, 28 Nov 2023 03:45:04 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id j25-20020a170906051900b00a0bdfab0f02sm4004423eja.77.2023.11.28.03.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 03:45:04 -0800 (PST)
Message-ID: <c34a6eb0-d436-931b-d08d-f3449be84a4c@gmail.com>
Date: Tue, 28 Nov 2023 12:45:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 38/45] drm/rockchip: inno_hdmi: Switch to infoframe
 type
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
 <20231128-kms-hdmi-connector-state-v4-38-c7602158306e@kernel.org>
Content-Language: en-US
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-38-c7602158306e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Maximum for inno_hdmi is: 1920x1080.

Do we still need INFOFRAME_VSI?

From Rockchip RK3036 TRM V1.0 20150907-Part2 Peripheral and Interface.pdf:

- HDMI 1.4a/b/1.3/1.2/1.1, HDCP 1.2 and DVI 1.0 standard compliant transmitter
- Supports all DTV resolutions including 480p/576p/720p/1080p

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_edid.c#L7015

* HDMI spec says if a mode is found in HDMI 1.4b 4K modes
* we should send its VIC in vendor infoframes, else send the
* VIC in AVI infoframes. Lets check if this mode is present in
* HDMI 1.4b 4K modes https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_edid.c#L7212 * Note that there's is a need to send HDMI vendor infoframes only when using a
* 4k or stereoscopic 3D mode. So when giving any other mode as input this
* function will return -EINVAL, error that can be safely ignored.


On 11/28/23 11:24, Maxime Ripard wrote:
> The inno_hdmi driver relies on its own internal infoframe type matching
> the hardware.
>
> This works fine, but in order to make further reworks easier, let's
> switch to the HDMI spec definition of those types.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/rockchip/inno_hdmi.c | 71 +++++++++++++++++++++++-------------
>  1 file changed, 45 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
> index bc7fb1278cb2..ed1d10efbef4 100644
> --- a/drivers/gpu/drm/rockchip/inno_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
> @@ -156,61 +156,80 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
>  	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
>  }
>  
> +static u32 inno_hdmi_get_frame_index(struct inno_hdmi *hdmi,
> +				    enum hdmi_infoframe_type type)
> +{
> +	struct drm_device *drm = hdmi->connector.dev;
> +
> +	switch (type) {
> +	case HDMI_INFOFRAME_TYPE_VENDOR:
> +		return INFOFRAME_VSI;
> +	case HDMI_INFOFRAME_TYPE_AVI:
> +		return INFOFRAME_AVI;
> +	default:
> +		drm_err(drm, "Unknown infoframe type: %u\n", type);
> +	}
> +
> +	return 0;
> +}
> +
>  static u32 inno_hdmi_get_frame_mask(struct inno_hdmi *hdmi,
> -				    u32 frame_index)
> +				    enum hdmi_infoframe_type type)
>  {
>  	struct drm_device *drm = hdmi->connector.dev;
>  
> -	switch (frame_index) {
> -	case INFOFRAME_VSI:
> +	switch (type) {
> +	case HDMI_INFOFRAME_TYPE_VENDOR:
>  		return m_PACKET_VSI_EN;
> -	case INFOFRAME_AVI:
> +	case HDMI_INFOFRAME_TYPE_AVI:
>  		return 0;
>  	default:
> -		drm_err(drm, "Unknown infoframe type: %u\n", frame_index);
> +		drm_err(drm, "Unknown infoframe type: %u\n", type);
>  	}
>  
>  	return 0;
>  }
>  
>  static u32 inno_hdmi_get_frame_disable(struct inno_hdmi *hdmi,
> -				       u32 frame_index)
> +				       enum hdmi_infoframe_type type)
>  {
>  	struct drm_device *drm = hdmi->connector.dev;
>  
> -	switch (frame_index) {
> -	case INFOFRAME_VSI:
> +	switch (type) {
> +	case HDMI_INFOFRAME_TYPE_VENDOR:
>  		return v_PACKET_VSI_EN(0);
> -	case INFOFRAME_AVI:
> +	case HDMI_INFOFRAME_TYPE_AVI:
>  		return 0;
>  	default:
> -		drm_err(drm, "Unknown infoframe type: %u\n", frame_index);
> +		drm_err(drm, "Unknown infoframe type: %u\n", type);
>  	}
>  
>  	return 0;
>  }
>  
>  static u32 inno_hdmi_get_frame_enable(struct inno_hdmi *hdmi,
> -				      u32 frame_index)
> +				      enum hdmi_infoframe_type type)
>  {
>  	struct drm_device *drm = hdmi->connector.dev;
>  
> -	switch (frame_index) {
> -	case INFOFRAME_VSI:
> +	switch (type) {
> +	case HDMI_INFOFRAME_TYPE_VENDOR:
>  		return v_PACKET_VSI_EN(1);
> -	case INFOFRAME_AVI:
> +	case HDMI_INFOFRAME_TYPE_AVI:
>  		return 0;
>  	default:
> -		drm_err(drm, "Unknown infoframe type: %u\n", frame_index);
> +		drm_err(drm, "Unknown infoframe type: %u\n", type);
>  	}
>  
>  	return 0;
>  }
>  
> -static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi, u32 frame_index)
> +static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
> +				    enum hdmi_infoframe_type type)
>  {
> -	u32 disable = inno_hdmi_get_frame_disable(hdmi, frame_index);
> -	u32 mask = inno_hdmi_get_frame_mask(hdmi, frame_index);
> +	u32 frame_index = inno_hdmi_get_frame_index(hdmi, type);
> +	u32 disable = inno_hdmi_get_frame_disable(hdmi, type);
> +	u32 mask = inno_hdmi_get_frame_mask(hdmi, type);
>  
>  	if (mask)
>  		hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, disable);
> @@ -219,14 +238,14 @@ static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi, u32 frame_index)
>  }
>  
>  static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
> -				  union hdmi_infoframe *frame, u32 frame_index)
> +				  union hdmi_infoframe *frame, enum hdmi_infoframe_type type)
>  {
> -	u32 enable = inno_hdmi_get_frame_enable(hdmi, frame_index);
> -	u32 mask = inno_hdmi_get_frame_mask(hdmi, frame_index);
> +	u32 enable = inno_hdmi_get_frame_enable(hdmi, type);
> +	u32 mask = inno_hdmi_get_frame_mask(hdmi, type);
>  	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
>  	ssize_t rc, i;
>  
> -	inno_hdmi_disable_frame(hdmi, frame_index);
> +	inno_hdmi_disable_frame(hdmi, type);
>  
>  	rc = hdmi_infoframe_pack(frame, packed_frame,
>  				 sizeof(packed_frame));
> @@ -253,11 +272,11 @@ static int inno_hdmi_config_video_vsi(struct inno_hdmi *hdmi,
>  							 &hdmi->connector,
>  							 mode);
>  	if (rc) {
> -		inno_hdmi_disable_frame(hdmi, INFOFRAME_VSI);
> +		inno_hdmi_disable_frame(hdmi, HDMI_INFOFRAME_TYPE_VENDOR);
>  		return rc;
>  	}
>  
> -	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_VSI);
> +	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_VENDOR);
>  }
>  
>  static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
> @@ -270,13 +289,13 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
>  						      &hdmi->connector,
>  						      mode);
>  	if (rc) {
> -		inno_hdmi_disable_frame(hdmi, INFOFRAME_AVI);
> +		inno_hdmi_disable_frame(hdmi, HDMI_INFOFRAME_TYPE_AVI);
>  		return rc;
>  	}
>  
>  	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
>  
> -	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_AVI);
> +	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_AVI);
>  }
>  
>  static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
>

