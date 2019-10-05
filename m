Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE1E8CCBF1
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2019 20:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387709AbfJESMn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Oct 2019 14:12:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40226 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387520AbfJESMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Oct 2019 14:12:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 94B0128EF67
Subject: Re: [PATCH v3] media: vimc: Implement debayer control for mean window
 size
To:     Arthur Moraes do Lago <arthurmoraeslago@gmail.com>,
        lkcamp@lists.libreplanetbr.org, mchehab@kernel.org,
        skhan@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
        andrealmeid@collabora.com, laispc19@gmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190924232127.30570-1-arthurmoraeslago@gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Openpgp: preference=signencrypt
Autocrypt: addr=helen.koike@collabora.com; keydata=
 mQINBFmOMD4BEADb2nC8Oeyvklh+ataw2u/3mrl+hIHL4WSWtii4VxCapl9+zILuxFDrxw1p
 XgF3cfx7g9taWBrmLE9VEPwJA6MxaVnQuDL3GXxTxO/gqnOFgT3jT+skAt6qMvoWnhgurMGH
 wRaA3dO4cFrDlLsZIdDywTYcy7V2bou81ItR5Ed6c5UVX7uTTzeiD/tUi8oIf0XN4takyFuV
 Rf09nOhi24bn9fFN5xWHJooFaFf/k2Y+5UTkofANUp8nn4jhBUrIr6glOtmE0VT4pZMMLT63
 hyRB+/s7b1zkOofUGW5LxUg+wqJXZcOAvjocqSq3VVHcgyxdm+Nv0g9Hdqo8bQHC2KBK86VK
 vB+R7tfv7NxVhG1sTW3CQ4gZb0ZugIWS32Mnr+V+0pxci7QpV3jrtVp5W2GA5HlXkOyC6C7H
 Ao7YhogtvFehnlUdG8NrkC3HhCTF8+nb08yGMVI4mMZ9v/KoIXKC6vT0Ykz434ed9Oc9pDow
 VUqaKi3ey96QczfE4NI029bmtCY4b5fucaB/aVqWYRH98Jh8oIQVwbt+pY7cL5PxS7dQ/Zuz
 6yheqDsUGLev1O3E4R8RZ8jPcfCermL0txvoXXIA56t4ZjuHVcWEe2ERhLHFGq5Zw7KC6u12
 kJoiZ6WDBYo4Dp+Gd7a81/WsA33Po0j3tk/8BWoiJCrjXzhtRwARAQABtCdIZWxlbiBLb2lr
 ZSA8aGVsZW4ua29pa2VAY29sbGFib3JhLmNvbT6JAlQEEwEKAD4CGwEFCwkIBwMFFQoJCAsF
 FgIDAQACHgECF4AWIQSofQA6zrItXEgHWTzAfqwo9yFiXQUCXEz3bwUJBKaPRQAKCRDAfqwo
 9yFiXdUCD/4+WZr503hQ13KB4DijOW76ju8JDPp4p++qoPxtoAsld3yROoTI+VPWmt7ojHrr
 TZc7sTLxOFzaUC8HjGTb3r9ilIhIKf/M9KRLkpIJ+iLA+VoUbcSOMYWoVNfgLmbnqoezjPcy
 OHJwVw9dzEeYpvG6nkY6E4UktANySp27AniSXNuHOvYsOsXmUOqU1ScdsrQ9s732p/OGdTyw
 1yd3gUMLZvCKFOBVHILH59HCRJgpwUPiws8G4dGMs4GTRvHT2s2mDQdQ0HEvcM9rvCRVixuC
 5ZeOymZNi6lDIUIysgiZ+yzk6i5l/Ni6r7v20N3JppZvhPK6LqtaYceyAGyc3jjnOqoHT/qR
 kPjCwzmKiPtXjLw6HbRXtGgGtP5m3y8v6bfHH+66zd2vGCY0Z9EsqcnK4DCqRkLncFLPM2gn
 9cZcCmO4ZqXUhTyn1nHM494kd5NX1Op4HO+t9ErnpufkVjoMUeBwESdQwwwHT3rjUueGmCrn
 VJK69/qhA4La72VTxHutl+3Z0Xy20HWsZS8Gsam39f95/LtPLzbBwnOOi5ZoXnm97tF8HrAZ
 2h+kcRLMWw3BXy5q4gic+oFZMZP9oq1G9XTFld4FGgJ9ys8aGmhLM+uB1pFxb3XFtWQ2z4AJ
 iEp2VLl34quwfD6Gg4csiZe2KzvQHUe0w8SJ9LplrHPPprkCDQRZjjChARAAzISLQaHzaDOv
 ZxcoCNBk/hUGo2/gsmBW4KSj73pkStZ+pm3Yv2CRtOD4jBlycXjzhwBV7/70ZMH70/Y25dJa
 CnJKl/Y76dPPn2LDWrG/4EkqUzoJkhRIYFUTpkPdaVYznqLgsho19j7HpEbAum8r3jemYBE1
 AIuVGg4bqY3UkvuHWLVRMuaHZNy55aYwnUvd46E64JH7O990mr6t/nu2a1aJ0BDdi8HZ0RMo
 Eg76Avah+YR9fZrhDFmBQSL+mcCVWEbdiOzHmGYFoToqzM52wsNEpo2aStH9KLk8zrCXGx68
 ohJyQoALX4sS03RIWh1jFjnlw2FCbEdj/HDX0+U0i9COtanm54arYXiBTnAnx0F7LW7pv7sb
 6tKMxsMLmprP/nWyV5AfFRi3jxs5tdwtDDk/ny8WH6KWeLR/zWDwpYgnXLBCdg8l97xUoPQO
 0VkKSa4JEXUZWZx9q6kICzFGsuqApqf9gIFJZwUmirsxH80Fe04Tv+IqIAW7/djYpOqGjSyk
 oaEVNacwLLgZr+/j69/1ZwlbS8K+ChCtyBV4kEPzltSRZ4eU19v6sDND1JSTK9KSDtCcCcAt
 VGFlr4aE00AD/aOkHSylc93nPinBFO4AGhcs4WypZ3GGV6vGWCpJy9svfWsUDhSwI7GS/i/v
 UQ1+bswyYEY1Q3DjJqT7fXcAEQEAAYkEcgQYAQoAJgIbAhYhBKh9ADrOsi1cSAdZPMB+rCj3
 IWJdBQJcTPfVBQkEpo7hAkDBdCAEGQEKAB0WIQSomGMEg78Cd/pMshveCRfNeJ05lgUCWY4w
 oQAKCRDeCRfNeJ05lp0gD/49i95kPKjpgjUbYeidjaWuINXMCA171KyaBAp+Jp2Qrun4sIJB
 Z6srMj6O/gC34AhZln2sXeQdxe88sNbg6HjlN+4AkhTd6DttjOfUwnamLDA7uw+YIapGgsgN
 lznjLnqOaQ9mtEwRbZMUOdyRf9osSuL14vHl4ia3bYNJ52WYre6gLMu4K+Ghd02og+ILgIio
 Q827h0spqIJYHrR3Ynnhxdlv5GPCobh+AKsQMdTIuCzR6JSCBk6GHkg33SiWScKMUzT8B/cn
 ypLfGnfV/LDZ9wS2TMzIlK/uv0Vd4C0OGDd/GCi5Gwu/Ot0aY7fzZo2CiRV+/nJBWPRRBTji
 bE4FG2rt7WSRLO/QmH2meIW4f0USDiHeNwznHkPei59vRdlMyQdsxrmgSRDuX9Y3UkERxbgd
 uscqC8Cpcy5kpF11EW91J8aGpcxASc+5Pa66/+7CrpBC2DnfcfACdMAje7yeMn9XlHrqXNlQ
 GaglEcnGN2qVqRcKgcjJX+ur8l56BVpBPFYQYkYkIdQAuhlPylxOvsMcqI6VoEWNt0iFF3dA
 //0MNb8fEqw5TlxDPOt6BDhDKowkxOGIA9LOcF4PkaR9Qkvwo2P4vA/8fhCnMqlSPom4xYdk
 Ev8P554zDoL/XMHl+s7A0MjIJzT253ejZKlWeO68pAbNy/z7QRn2lFDnjwkQwH6sKPchYl2f
 0g//Yu3vDkqk8+mi2letP3XBl2hjv2eCZjTh34VvtgY5oeL2ROSJWNd18+7O6q3hECZ727EW
 gIb3LK9g4mKF6+Rch6Gwz1Y4fmC5554fd2Y2XbVzzz6AGUC6Y+ohNg7lTAVO4wu43+IyTB8u
 ip5rX/JDGFv7Y1sl6tQJKAVIKAJE+Z3Ncqh3doQr9wWHl0UiQYKbSR9HpH1lmC1C3EEbTpwK
 fUIpZd1eQNyNJl1jHsZZIBYFsAfVNH/u6lB1TU+9bSOsV5SepdIb88d0fm3oZ4KzjhRHLFQF
 RwNUNn3ha6x4fbxYcwbvu5ZCiiX6yRTPoage/LUNkgQNX2PtPcur6CdxK6Pqm8EAI7PmYLfN
 NY3y01XhKNRvaVZoH2FugfUkhsBITglTIpI+n6YU06nDAcbeINFo67TSE0iL6Pek5a6gUQQC
 6w+hJCaMr8KYud0q3ccHyU3TlAPDe10En3GsVz7Y5Sa3ODGdbmkfjK8Af3ogGNBVmpV16Xl8
 4rETFv7POSUB2eMtbpmBopd+wKqHCwUEy3fx1zDbM9mp+pcDoL73rRZmlgmNfW/4o4qBzxRf
 FYTQLE69wAFU2IFce9PjtUAlBdC+6r3X24h3uD+EC37s/vWhxuKj2glaU9ONrVJ/SPvlqXOO
 WR1Zqw57vHMKimLdG3c24l8PkSw1usudgAA5OyO5Ag0EWY4wyQEQAMVp0U38Le7d80Mu6AT+
 1dMes87iKn30TdMuLvSg2uYqJ1T2riRBF7zU6u74HF6zps0rPQviBXOgoSuKa1hnS6OwFb9x
 yQPlk76LY96SUB5jPWJ3fO78ZGSwkVbJFuG9gpD/41n8Unn1hXgDb2gUaxD0oXv/723EmTYC
 vSo3z6Y8A2aBQNr+PyhQAPDazvVQ+P7vnZYq1oK0w+D7aIix/Bp4mo4VbgAeAeMxXWSZs8N5
 NQtXeTBgB7DqrfJP5wWwgCsROfeds6EoddcYgqhG0zVU9E54C8JcPOA0wKVs+9+gt2eyRNtx
 0UhFbah7qXuJGhWy/0CLXvVoCoS+7qpWz070TBAlPZrg9D0o2gOw01trQgoKAYBKKgJhxaX/
 4gzi+5Ccm33LYH9lAVTdzdorejuV1xWdsnNyc8OAPeoXBf9RIIWfQVmbhVXBp2DAPjV6/kIJ
 Eml7MNJfEvqjV9zKsWF9AFlsqDWZDCyUdqR96ahTSD34pRwb6a9H99/GrjeowKaaL95DIVZT
 C6STvDNL6kpys4sOe2AMmQGv2MMcJB3aYLzH8f1sEQ9S0UMX7/6CifEG6JodG6Y/W/lLo1Vv
 DxeDA+u4Lgq6qxlksp8M78FjcmxFVlf4cpCi2ucbZxurhlBkjtZZ8MVAEde3hlqjcBl2Ah6Q
 D826FTxscOGlHEfNABEBAAGJAjwEGAEKACYCGwwWIQSofQA6zrItXEgHWTzAfqwo9yFiXQUC
 XEz31QUJBKaOuQAKCRDAfqwo9yFiXUvnEACBWe8wSnIvSX+9k4LxuLq6GQTOt+RNfliZQkCW
 5lT3KL1IJyzzOm4x+/slHRBl8bF7KEZyOPinXQXyJ/vgIdgSYxDqoZ7YZn3SvuNe4aT6kGwL
 EYYEV8Ecj4ets15FR2jSUNnVv5YHWtZ7bP/oUzr2LT54fjRcstYxgwzoj8AREtHQ4EJWAWCO
 ZuEHTSm5clMFoi41CmG4DlJbzbo4YfilKYm69vwh50Y8WebcRN31jh0g8ufjOJnBldYYBLwN
 Obymhlfy/HKBDIbyCGBuwYoAkoJ6LR/cqzl/FuhwhuDocCGlXyYaJOwXgHaCvVXI3PLQPxWZ
 +vPsD+TSVHc9m/YWrOiYDnZn6aO0Uk1Zv/m9+BBkWAwsreLJ/evn3SsJV1omNBTITG+uxXcf
 JkgmmesIAw8mpI6EeLmReUJLasz8QkzhZIC7t5rGlQI94GQG3Jg2dC+kpaGWOaT5G4FVMcBj
 iR1nXfMxENVYnM5ag7mBZyD/kru5W1Uj34L6AFaDMXFPwedSCpzzqUiHb0f+nYkfOodf5xy0
 46+3THy/NUS/ZZp/rI4F7Y77+MQPVg7vARfHHX1AxYUKfRVW5j88QUB70txn8Vgi1tDrOr4J
 eD+xr0CvIGa5lKqgQacQtGkpOpJ8zY4ObSvpNubey/qYUE3DCXD0n2Xxk4muTvqlkFpOYA==
Message-ID: <63fa1d13-7a9f-0b41-5730-72dee8dfd293@collabora.com>
Date:   Sat, 5 Oct 2019 15:12:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190924232127.30570-1-arthurmoraeslago@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/24/19 8:21 PM, Arthur Moraes do Lago wrote:
> Add mean window size parameter for debayer filter as a control in
> vimc-debayer.
> 
> vimc-debayer was patched to allow changing mean windows parameter
> of the filter without needing to reload the driver. The parameter
> can now be set using a v4l2-ctl control(mean_window_size).
> 
> Co-developed-by: Laís Pessine do Carmo <laispc19@gmail.com>
> Signed-off-by: Laís Pessine do Carmo <laispc19@gmail.com>
> Signed-off-by: Arthur Moraes do Lago <arthurmoraeslago@gmail.com>

lgtm

Thanks!

Acked-by: Helen Koike <helen.koikek@collabora.com>

> ---
> Changes in V3:
>  - Renamed debayer control
>  - Fixed typo in documentation
>  - Freed control handler in vimc_deb_release
> 
> This commit is based on Shuah Khan's patch series 171283
> ("Collapse vimc single monolithic driver").
> 
> Thanks.
> ---
>  Documentation/media/v4l-drivers/vimc.rst   | 10 +--
>  drivers/media/platform/vimc/vimc-common.h  |  1 +
>  drivers/media/platform/vimc/vimc-debayer.c | 89 +++++++++++++++++++---
>  3 files changed, 79 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
> index a582af0509ee..28646c76dad5 100644
> --- a/Documentation/media/v4l-drivers/vimc.rst
> +++ b/Documentation/media/v4l-drivers/vimc.rst
> @@ -80,9 +80,7 @@ vimc-capture:
>          Module options
>  ---------------
>  
> -Vimc has a few module parameters to configure the driver.
> -
> -        param=value
> +Vimc has a module parameter to configure the driver.
>  
>  * ``sca_mult=<unsigned int>``
>  
> @@ -91,12 +89,6 @@ Vimc has a few module parameters to configure the driver.
>          original one. Currently, only supports scaling up (the default value
>          is 3).
>  
> -* ``deb_mean_win_size=<unsigned int>``
> -
> -        Window size to calculate the mean. Note: the window size needs to be an
> -        odd number, as the main pixel stays in the center of the window,
> -        otherwise the next odd number is considered (the default value is 3).
> -
>  Source code documentation
>  -------------------------
>  
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 236412ad7548..3a5102ddf794 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -19,6 +19,7 @@
>  #define VIMC_CID_VIMC_BASE		(0x00f00000 | 0xf000)
>  #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
>  #define VIMC_CID_TEST_PATTERN		(VIMC_CID_VIMC_BASE + 0)
> +#define VIMC_CID_MEAN_WIN_SIZE		(VIMC_CID_VIMC_BASE + 1)
>  
>  #define VIMC_FRAME_MAX_WIDTH 4096
>  #define VIMC_FRAME_MAX_HEIGHT 2160
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index 37f3767db469..f1fa7aa023a3 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -11,17 +11,12 @@
>  #include <linux/platform_device.h>
>  #include <linux/vmalloc.h>
>  #include <linux/v4l2-mediabus.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
>  #include <media/v4l2-subdev.h>
>  
>  #include "vimc-common.h"
>  
> -static unsigned int deb_mean_win_size = 3;
> -module_param(deb_mean_win_size, uint, 0000);
> -MODULE_PARM_DESC(deb_mean_win_size, " the window size to calculate the mean.\n"
> -	"NOTE: the window size needs to be an odd number, as the main pixel "
> -	"stays in the center of the window, otherwise the next odd number "
> -	"is considered");
> -
>  enum vimc_deb_rgb_colors {
>  	VIMC_DEB_RED = 0,
>  	VIMC_DEB_GREEN = 1,
> @@ -46,6 +41,8 @@ struct vimc_deb_device {
>  	u8 *src_frame;
>  	const struct vimc_deb_pix_map *sink_pix_map;
>  	unsigned int sink_bpp;
> +	unsigned int mean_win_size;
> +	struct v4l2_ctrl_handler hdl;
>  };
>  
>  static const struct v4l2_mbus_framefmt sink_fmt_default = {
> @@ -346,11 +343,18 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>  	return 0;
>  }
>  
> +static const struct v4l2_subdev_core_ops vimc_deb_core_ops = {
> +	.log_status = v4l2_ctrl_subdev_log_status,
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
>  static const struct v4l2_subdev_video_ops vimc_deb_video_ops = {
>  	.s_stream = vimc_deb_s_stream,
>  };
>  
>  static const struct v4l2_subdev_ops vimc_deb_ops = {
> +	.core = &vimc_deb_core_ops,
>  	.pad = &vimc_deb_pad_ops,
>  	.video = &vimc_deb_video_ops,
>  };
> @@ -384,7 +388,7 @@ static void vimc_deb_calc_rgb_sink(struct vimc_deb_device *vdeb,
>  	 * the top left corner of the mean window (considering the current
>  	 * pixel as the center)
>  	 */
> -	seek = deb_mean_win_size / 2;
> +	seek = vdeb->mean_win_size / 2;
>  
>  	/* Sum the values of the colors in the mean window */
>  
> @@ -471,14 +475,41 @@ static void *vimc_deb_process_frame(struct vimc_ent_device *ved,
>  		}
>  
>  	return vdeb->src_frame;
> +}
> +
> +static inline void vimc_deb_s_mean_win_size(struct vimc_deb_device *vdeb,
> +					    unsigned int mean_win_size)
> +{
> +	if (vdeb->mean_win_size == mean_win_size)
> +		return;
> +	vdeb->mean_win_size = mean_win_size;
> +}
>  
> +static int vimc_deb_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct vimc_deb_device *vdeb =
> +		container_of(ctrl->handler, struct vimc_deb_device, hdl);
> +
> +	switch (ctrl->id) {
> +	case VIMC_CID_MEAN_WIN_SIZE:
> +		vimc_deb_s_mean_win_size(vdeb, ctrl->val);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
>  }
>  
> +static const struct v4l2_ctrl_ops vimc_deb_ctrl_ops = {
> +	.s_ctrl = vimc_deb_s_ctrl,
> +};
> +
>  static void vimc_deb_release(struct v4l2_subdev *sd)
>  {
>  	struct vimc_deb_device *vdeb =
>  				container_of(sd, struct vimc_deb_device, sd);
>  
> +	v4l2_ctrl_handler_free(&vdeb->hdl);
>  	vimc_pads_cleanup(vdeb->ved.pads);
>  	kfree(vdeb);
>  }
> @@ -495,6 +526,24 @@ void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
>  	vimc_ent_sd_unregister(ved, &vdeb->sd);
>  }
>  
> +static const struct v4l2_ctrl_config vimc_deb_ctrl_class = {
> +	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY,
> +	.id = VIMC_CID_VIMC_CLASS,
> +	.name = "VIMC Controls",
> +	.type = V4L2_CTRL_TYPE_CTRL_CLASS,
> +};
> +
> +static const struct v4l2_ctrl_config vimc_deb_ctrl_mean_win_size = {
> +	.ops = &vimc_deb_ctrl_ops,
> +	.id = VIMC_CID_MEAN_WIN_SIZE,
> +	.name = "Debayer Mean Window Size",
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.min = 1,
> +	.max = 25,
> +	.step = 2,
> +	.def = 3,
> +};
> +
>  struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>  				     const char *vcfg_name)
>  {
> @@ -507,6 +556,16 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>  	if (!vdeb)
>  		return NULL;
>  
> +	/* Create controls: */
> +	v4l2_ctrl_handler_init(&vdeb->hdl, 2);
> +	v4l2_ctrl_new_custom(&vdeb->hdl, &vimc_deb_ctrl_class, NULL);
> +	v4l2_ctrl_new_custom(&vdeb->hdl, &vimc_deb_ctrl_mean_win_size, NULL);
> +	vdeb->sd.ctrl_handler = &vdeb->hdl;
> +	if (vdeb->hdl.error) {
> +		ret = vdeb->hdl.error;
> +		goto err_free_vdeb;
> +	}
> +
>  	/* Initialize ved and sd */
>  	ret = vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev,
>  				   vcfg_name,
> @@ -514,13 +573,12 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>  				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
>  				   MEDIA_PAD_FL_SOURCE},
>  				   &vimc_deb_int_ops, &vimc_deb_ops);
> -	if (ret) {
> -		kfree(vdeb);
> -		return NULL;
> -	}
> +	if (ret)
> +		goto err_free_hdl;
>  
>  	vdeb->ved.process_frame = vimc_deb_process_frame;
>  	vdeb->dev = &vimc->pdev.dev;
> +	vdeb->mean_win_size = vimc_deb_ctrl_mean_win_size.def;
>  
>  	/* Initialize the frame format */
>  	vdeb->sink_fmt = sink_fmt_default;
> @@ -534,4 +592,11 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>  	vdeb->set_rgb_src = vimc_deb_set_rgb_mbus_fmt_rgb888_1x24;
>  
>  	return &vdeb->ved;
> +
> +err_free_hdl:
> +	v4l2_ctrl_handler_free(&vdeb->hdl);
> +err_free_vdeb:
> +	kfree(vdeb);
> +
> +	return NULL;
>  }
> 
