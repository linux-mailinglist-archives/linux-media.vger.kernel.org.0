Return-Path: <linux-media+bounces-1011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FA67F89DF
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 11:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 872FDB212F1
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 10:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB17CA5D;
	Sat, 25 Nov 2023 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b="DHHfCL7i"
X-Original-To: linux-media@vger.kernel.org
X-Greylist: delayed 315 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 25 Nov 2023 02:06:22 PST
Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB05B10DC;
	Sat, 25 Nov 2023 02:06:22 -0800 (PST)
Received: from mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net [IPv6:2a02:6b8:c14:6e01:0:640:627f:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTP id DB35C60FAE;
	Sat, 25 Nov 2023 13:00:58 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id q0Owa29FViE0-sB5ZypyC;
	Sat, 25 Nov 2023 13:00:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1700906457; bh=3CNf1YUwxPcXKoagyMGFPDxulGH1Yq2+32NGw4WJ5MU=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=DHHfCL7iGm5GVPbUq82yaVHggXkMmPsxE/T3itgPUjMM9Qc8MuvqC5nawCxZdSsw1
	 yRwAAYQAaPfRihZvyhcAXNT57r2XEHlYFvgsbbFmkV4/IxHE5jZUKmIppWvxnMABNz
	 94DFUYxjCcq10vL19DtPAJ6AV3anLqh4JDOEICLA=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.com
Message-ID: <52b232e4-7ffa-1d01-efa6-a0af84729483@yandex.com>
Date: Sat, 25 Nov 2023 11:00:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC v3 22/37] drm/rockchip: inno_hdmi: Remove useless
 output format
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
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
 <20231031-kms-hdmi-connector-state-v3-22-328b0fae43a7@kernel.org>
Content-Language: en-US
From: Johan Jonker <jbx6244@yandex.com>
In-Reply-To: <20231031-kms-hdmi-connector-state-v3-22-328b0fae43a7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maxime,

In stead of further cripplingRockchip HDMI drivers one could also make it functional based  on EDID info.

To start with the output could you turn RGB888 input and switch between

RGB444, YCBCR444 and YCBCR422 output.

Johan

On 10/31/23 17:48, Maxime Ripard wrote:
> Similarly to the input format, the driver has a lot of code to deal with
> various output format, but the driver hardcodes it to RGB always.
>
> Let's get rid of the dead code.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/rockchip/inno_hdmi.c | 57 ++++--------------------------------
>  1 file changed, 6 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
> index e0696ab16da3..0c6c550e0ce7 100644
> --- a/drivers/gpu/drm/rockchip/inno_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
> @@ -28,7 +28,6 @@
>  #include "inno_hdmi.h"
>  
>  struct hdmi_data_info {
> -	unsigned int enc_out_format;
>  	unsigned int colorimetry;
>  };
>  
> @@ -296,26 +295,14 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
>  	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
>  						      &hdmi->connector,
>  						      mode);
> -
> -	if (hdmi->hdmi_data.enc_out_format == HDMI_COLORSPACE_YUV444)
> -		frame.avi.colorspace = HDMI_COLORSPACE_YUV444;
> -	else if (hdmi->hdmi_data.enc_out_format == HDMI_COLORSPACE_YUV422)
> -		frame.avi.colorspace = HDMI_COLORSPACE_YUV422;
> -	else
> -		frame.avi.colorspace = HDMI_COLORSPACE_RGB;
> +	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
>  
>  	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_AVI, 0, 0, 0);
>  }
>  
>  static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
>  {
> -	struct hdmi_data_info *data = &hdmi->hdmi_data;
> -	int c0_c2_change = 0;
> -	int csc_enable = 0;
> -	int csc_mode = 0;
> -	int auto_csc = 0;
>  	int value;
> -	int i;
>  
>  	/* Input video mode is SDR RGB24bit, data enable signal from external */
>  	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL1, v_DE_EXTERNAL |
> @@ -327,43 +314,13 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
>  		v_VIDEO_INPUT_CSP(0);
>  	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL2, value);
>  
> -	if (HDMI_COLORSPACE_RGB == data->enc_out_format) {
> -		value = v_SOF_DISABLE | v_COLOR_DEPTH_NOT_INDICATED(1);
> -		hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
> -
> -		hdmi_modb(hdmi, HDMI_VIDEO_CONTRL,
> -			  m_VIDEO_AUTO_CSC | m_VIDEO_C0_C2_SWAP,
> -			  v_VIDEO_AUTO_CSC(AUTO_CSC_DISABLE) |
> -			  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
> -		return 0;
> -	}
> -
> -	if (data->colorimetry == HDMI_COLORIMETRY_ITU_601) {
> -		if (data->enc_out_format == HDMI_COLORSPACE_YUV444) {
> -			csc_mode = CSC_RGB_0_255_TO_ITU601_16_235_8BIT;
> -			auto_csc = AUTO_CSC_DISABLE;
> -			c0_c2_change = C0_C2_CHANGE_DISABLE;
> -			csc_enable = v_CSC_ENABLE;
> -		}
> -	} else {
> -		if (data->enc_out_format == HDMI_COLORSPACE_YUV444) {
> -			csc_mode = CSC_RGB_0_255_TO_ITU709_16_235_8BIT;
> -			auto_csc = AUTO_CSC_DISABLE;
> -			c0_c2_change = C0_C2_CHANGE_DISABLE;
> -			csc_enable = v_CSC_ENABLE;
> -		}
> -	}
> -
> -	for (i = 0; i < 24; i++)
> -		hdmi_writeb(hdmi, HDMI_VIDEO_CSC_COEF + i,
> -			    coeff_csc[csc_mode][i]);
> -
> -	value = v_SOF_DISABLE | csc_enable | v_COLOR_DEPTH_NOT_INDICATED(1);
> +	value = v_SOF_DISABLE | v_COLOR_DEPTH_NOT_INDICATED(1);
>  	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
> -	hdmi_modb(hdmi, HDMI_VIDEO_CONTRL, m_VIDEO_AUTO_CSC |
> -		  m_VIDEO_C0_C2_SWAP, v_VIDEO_AUTO_CSC(auto_csc) |
> -		  v_VIDEO_C0_C2_SWAP(c0_c2_change));
>  
> +	hdmi_modb(hdmi, HDMI_VIDEO_CONTRL,
> +		  m_VIDEO_AUTO_CSC | m_VIDEO_C0_C2_SWAP,
> +		  v_VIDEO_AUTO_CSC(AUTO_CSC_DISABLE) |
> +		  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
>  	return 0;
>  }
>  
> @@ -425,8 +382,6 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
>  	struct drm_display_info *display = &hdmi->connector.display_info;
>  	u8 vic = drm_match_cea_mode(mode);
>  
> -	hdmi->hdmi_data.enc_out_format = HDMI_COLORSPACE_RGB;
> -
>  	if ((vic == 6) || (vic == 7) ||
>  	    (vic == 21) || (vic == 22) ||
>  	    (vic == 2) || (vic == 3) ||
>

