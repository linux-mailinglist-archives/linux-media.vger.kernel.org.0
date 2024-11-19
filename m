Return-Path: <linux-media+bounces-21578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 040279D2281
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 10:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0548FB21CDF
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 09:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F0E1B0F0C;
	Tue, 19 Nov 2024 09:29:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8497513FD83;
	Tue, 19 Nov 2024 09:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732008586; cv=none; b=k2hObwxdWChI+RWoqJ6+q5CF/tan5u/WA9C7Ted9Rijh4JTcc6p9gvae4IGC5QzUl1GWYnFbbytjdkhO7FbH0kgpF7K5EzsOrQraEaT0TeJVyCc1TLUB08QB3Rs/3N/MiPP0F5JbFy1Oae52vmVtBx/fvCAUW/MXZywgWkXNAlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732008586; c=relaxed/simple;
	bh=P0oUZcVwPnVlRMRFeFE598406hQ3QcynvUVfrRoSb5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hv/B9+6WjjlVl7TcGty7SZ80VU7MmRvlAwpmc6btDgIgugA7W9C70H2MRvoqs7B7Q5age/OPNBE2cc+xOlqDU1bSKhWdNngRB513kqxzAMt3WmZD792mfapLz/4XmpI7j88BG9yGYkh+7rwQW/3SigDt9hEyVz1WlqX5cE6tMLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F28C4CECF;
	Tue, 19 Nov 2024 09:29:44 +0000 (UTC)
Message-ID: <36ad24f6-6d11-4cd0-ac60-5e9fbfe4d9ca@xs4all.nl>
Date: Tue, 19 Nov 2024 10:29:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: wl128x: Remove the driver
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20241119-rm-wl128x-v1-1-6bec75067732@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwEKAD8CGwMGCwkIBwMCBhUIAgkKCwQWAgMB
 Ah4BAheAFiEEBSzee8IVBTtonxvKvS1hSGYUO0wFAmaU3GkFCRf7lXsACgkQvS1hSGYUO0wZ
 cw//cLMiaV+p2rCyzdpDjWon2XD6M646THYvqXLb9eVWicFlVG78kNtHrHyEWKPhN3OdWWjn
 kOzXseVR/nS6vZvqCaT3rwgh3ZMb0GvOQk1/7V8UbcIERy036AjQoZmKo5tEDIv48MSvqxjj
 H6wbKXbCyvnIwpGICLyb0xAwvvpTaJkwZjvGqeo5EL0Z+cQ8fCelfKNO5CFFP3FNd3dH8wU6
 CHRtdZE03iIVEWpgCTjsG2zwsX/CKfPx0EKcrQajW3Tc50Jm0uuRUEKCVphlYORAPtFAF1dj
 Ly8zpN1bEXH+0FDXe/SHhzbvgS4sL0J4KQCCZ/GcbKh/vsDC1VLsGS5C7fKOhAtOkUPWRjF+
 kOEEcTOROMMvSUVokO+gCdb9nA/e3WMgiTwWRumWy5eCEnCpM9+rfI2HzTeACrVgGEDkOTHW
 eaGHEy8nS9a25ejQzsBhi+T7MW53ZTIjklR7dFl/uuK+EJ6DLbDpVbwyYo2oeiwP+sf8/Rgv
 WfJv4wzfUo/JABwrsbfWfycVZwFWBzqq+TaKFkMPm017dkLdg4MzxvvTMP7nKfJxU1bQ2OOr
 xkPk5KDcz+aRYBvTqEXgYZ6OZtnOUFKD+uPlbWf68vuz/1iFbQYnNJkTxwWhiIMN7BULK74d
 Ek89MU7JlbYNSv0v21lRF+uDo0J6zyoTt0ZxSPzOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAEKACYCGwwWIQQFLN57whUFO2ifG8q9LWFIZhQ7TAUC
 ZpTcxwUJF/uV2gAKCRC9LWFIZhQ7TMlPD/9ppgrN4Z9gXta9IdS8a+0E7lj/dc0LnF9T6MMq
 aUC+CFffTiOoNDnfXh8sfsqTjAT50TsVpdlH6YyPlbU5FR8bC8wntrJ6ZRWDdHJiCDLqNA/l
 GVtIKP1YW8fA01thMcVUyQCdVUqnByMJiJQDzZYrX+E/YKUTh2RL5Ye0foAGE7SGzfZagI0D
 OZN92w59e1Jg3zBhYXQIjzBbhGIy7usBfvE882GdUbP29bKfTpcOKkJIgO6K+w82D/1d5TON
 SD146+UySmEnjYxHI8kBYaZJ4ubyYrDGgXT3jIBPq8i9iZP3JSeZ/0F9UIlX4KeMSG8ymgCR
 SqL1y9pl9R2ewCepCahEkTT7IieGUzJZz7fGUaxrSyexPE1+qNosfrUIu3yhRA6AIjhwPisl
 aSwDxLI6qWDEQeeWNQaYUSEIFQ5XkZxd/VN8JeMwGIAq17Hlym+JzjBkgkm1LV9LXw9D8MQL
 e8tSeEXX8BZIen6y/y+U2CedzEsMKGjy5WNmufiPOzB3q2JwFQCw8AoNic7soPN9CVCEgd2r
 XS+OUZb8VvEDVRSK5Yf79RveqHvmhAdNOVh70f5CvwR/bfX/Ei2Szxz47KhZXpn1lxmcds6b
 LYjTAZF0anym44vsvOEuQg3rqxj/7Hiz4A3HIkrpTWclV6ru1tuGp/ZJ7aY8bdvztP2KTw==
In-Reply-To: <20241119-rm-wl128x-v1-1-6bec75067732@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2024 10:27, Ricardo Ribalda wrote:
> After commit 78fe66360ed6 ("misc: ti-st: st_kim: remove the driver"),
> this driver cannot be built.

Duplicate of:

https://patchwork.linuxtv.org/project/linux-media/patch/20241028083030.26351-1-lukas.bulwahn@redhat.com/

Regards,

	Hans

> 
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/radio/Kconfig               |    4 -
>  drivers/media/radio/Makefile              |    1 -
>  drivers/media/radio/wl128x/Kconfig        |   15 -
>  drivers/media/radio/wl128x/Makefile       |    7 -
>  drivers/media/radio/wl128x/fmdrv.h        |  229 ----
>  drivers/media/radio/wl128x/fmdrv_common.c | 1676 -----------------------------
>  drivers/media/radio/wl128x/fmdrv_common.h |  389 -------
>  drivers/media/radio/wl128x/fmdrv_rx.c     |  820 --------------
>  drivers/media/radio/wl128x/fmdrv_rx.h     |   45 -
>  drivers/media/radio/wl128x/fmdrv_tx.c     |  413 -------
>  drivers/media/radio/wl128x/fmdrv_tx.h     |   24 -
>  drivers/media/radio/wl128x/fmdrv_v4l2.c   |  604 -----------
>  drivers/media/radio/wl128x/fmdrv_v4l2.h   |   20 -
>  13 files changed, 4247 deletions(-)
> 
> diff --git a/drivers/media/radio/Kconfig b/drivers/media/radio/Kconfig
> index d52eccdc7eb9..72776d08046a 100644
> --- a/drivers/media/radio/Kconfig
> +++ b/drivers/media/radio/Kconfig
> @@ -221,10 +221,6 @@ config USB_RAREMONO
>  source "drivers/media/radio/si470x/Kconfig"
>  source "drivers/media/radio/si4713/Kconfig"
>  
> -# TI's ST based wl128x FM radio
> -
> -source "drivers/media/radio/wl128x/Kconfig"
> -
>  #
>  # ISA drivers configuration
>  #
> diff --git a/drivers/media/radio/Makefile b/drivers/media/radio/Makefile
> index cfb6af7d3bc3..1ff46f3a6ed3 100644
> --- a/drivers/media/radio/Makefile
> +++ b/drivers/media/radio/Makefile
> @@ -31,7 +31,6 @@ obj-$(CONFIG_RADIO_TIMBERDALE) += radio-timb.o
>  obj-$(CONFIG_RADIO_TRUST) += radio-trust.o
>  obj-$(CONFIG_RADIO_TYPHOON) += radio-typhoon.o
>  obj-$(CONFIG_RADIO_WL1273) += radio-wl1273.o
> -obj-$(CONFIG_RADIO_WL128X) += wl128x/
>  obj-$(CONFIG_RADIO_ZOLTRIX) += radio-zoltrix.o
>  
>  obj-$(CONFIG_USB_DSBR) += dsbr100.o
> diff --git a/drivers/media/radio/wl128x/Kconfig b/drivers/media/radio/wl128x/Kconfig
> deleted file mode 100644
> index 3e7713872e3f..000000000000
> --- a/drivers/media/radio/wl128x/Kconfig
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -#
> -# TI's wl128x FM driver based on TI's ST driver.
> -#
> -config RADIO_WL128X
> -	tristate "Texas Instruments WL128x FM Radio"
> -	depends on VIDEO_DEV && RFKILL && TTY && TI_ST
> -	depends on GPIOLIB || COMPILE_TEST
> -	help
> -	  Choose Y here if you have this FM radio chip.
> -
> -	  In order to control your radio card, you will need to use programs
> -	  that are compatible with the Video For Linux 2 API.  Information on
> -	  this API and pointers to "v4l2" programs may be found at
> -	  <file:Documentation/userspace-api/media/index.rst>.
> diff --git a/drivers/media/radio/wl128x/Makefile b/drivers/media/radio/wl128x/Makefile
> deleted file mode 100644
> index 4396ca416cfa..000000000000
> --- a/drivers/media/radio/wl128x/Makefile
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -#
> -# Makefile for TI's shared transport driver based wl128x
> -# FM radio.
> -#
> -obj-$(CONFIG_RADIO_WL128X)	+= fm_drv.o
> -fm_drv-objs		:= fmdrv_common.o fmdrv_rx.o fmdrv_tx.o fmdrv_v4l2.o
> diff --git a/drivers/media/radio/wl128x/fmdrv.h b/drivers/media/radio/wl128x/fmdrv.h
> deleted file mode 100644
> index 03117a41dbd4..000000000000
> --- a/drivers/media/radio/wl128x/fmdrv.h
> +++ /dev/null
> @@ -1,229 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - *  FM Driver for Connectivity chip of Texas Instruments.
> - *
> - *  Common header for all FM driver sub-modules.
> - *
> - *  Copyright (C) 2011 Texas Instruments
> - */
> -
> -#ifndef _FM_DRV_H
> -#define _FM_DRV_H
> -
> -#include <linux/skbuff.h>
> -#include <linux/interrupt.h>
> -#include <sound/core.h>
> -#include <sound/initval.h>
> -#include <linux/timer.h>
> -#include <linux/workqueue.h>
> -#include <media/v4l2-ioctl.h>
> -#include <media/v4l2-common.h>
> -#include <media/v4l2-device.h>
> -#include <media/v4l2-ctrls.h>
> -
> -#define FM_DRV_VERSION            "0.1.1"
> -#define FM_DRV_NAME               "ti_fmdrv"
> -#define FM_DRV_CARD_SHORT_NAME    "TI FM Radio"
> -#define FM_DRV_CARD_LONG_NAME     "Texas Instruments FM Radio"
> -
> -/* Flag info */
> -#define FM_INTTASK_RUNNING            0
> -#define FM_INTTASK_SCHEDULE_PENDING   1
> -#define FM_FW_DW_INPROGRESS     2
> -#define FM_CORE_READY                 3
> -#define FM_CORE_TRANSPORT_READY       4
> -#define FM_AF_SWITCH_INPROGRESS	      5
> -#define FM_CORE_TX_XMITING	      6
> -
> -#define FM_TUNE_COMPLETE	      0x1
> -#define FM_BAND_LIMIT		      0x2
> -
> -#define FM_DRV_TX_TIMEOUT      (5*HZ)	/* 5 seconds */
> -#define FM_DRV_RX_SEEK_TIMEOUT (20*HZ)	/* 20 seconds */
> -
> -#define fmerr(format, ...) \
> -	printk(KERN_ERR "fmdrv: " format, ## __VA_ARGS__)
> -#define fmwarn(format, ...) \
> -	printk(KERN_WARNING "fmdrv: " format, ##__VA_ARGS__)
> -#ifdef DEBUG
> -#define fmdbg(format, ...) \
> -	printk(KERN_DEBUG "fmdrv: " format, ## __VA_ARGS__)
> -#else /* DEBUG */
> -#define fmdbg(format, ...) do {} while(0)
> -#endif
> -enum {
> -	FM_MODE_OFF,
> -	FM_MODE_TX,
> -	FM_MODE_RX,
> -	FM_MODE_ENTRY_MAX
> -};
> -
> -#define FM_RX_RDS_INFO_FIELD_MAX	8	/* 4 Group * 2 Bytes */
> -
> -/* RX RDS data format */
> -struct fm_rdsdata_format {
> -	union {
> -		struct {
> -			u8 buff[FM_RX_RDS_INFO_FIELD_MAX];
> -		} groupdatabuff;
> -		struct {
> -			u16 pidata;
> -			u8 blk_b[2];
> -			u8 blk_c[2];
> -			u8 blk_d[2];
> -		} groupgeneral;
> -		struct {
> -			u16 pidata;
> -			u8 blk_b[2];
> -			u8 af[2];
> -			u8 ps[2];
> -		} group0A;
> -		struct {
> -			u16 pi[2];
> -			u8 blk_b[2];
> -			u8 ps[2];
> -		} group0B;
> -	} data;
> -};
> -
> -/* FM region (Europe/US, Japan) info */
> -struct region_info {
> -	u32 chanl_space;
> -	u32 bot_freq;
> -	u32 top_freq;
> -	u8 fm_band;
> -};
> -struct fmdev;
> -typedef void (*int_handler_prototype) (struct fmdev *);
> -
> -/* FM Interrupt processing related info */
> -struct fm_irq {
> -	u8 stage;
> -	u16 flag;	/* FM interrupt flag */
> -	u16 mask;	/* FM interrupt mask */
> -	/* Interrupt process timeout handler */
> -	struct timer_list timer;
> -	u8 retry;
> -	int_handler_prototype *handlers;
> -};
> -
> -/* RDS info */
> -struct fm_rds {
> -	u8 flag;	/* RX RDS on/off status */
> -	u8 last_blk_idx;	/* Last received RDS block */
> -
> -	/* RDS buffer */
> -	wait_queue_head_t read_queue;
> -	u32 buf_size;	/* Size is always multiple of 3 */
> -	u32 wr_idx;
> -	u32 rd_idx;
> -	u8 *buff;
> -};
> -
> -#define FM_RDS_MAX_AF_LIST		25
> -
> -/*
> - * Current RX channel Alternate Frequency cache.
> - * This info is used to switch to other freq (AF)
> - * when current channel signal strength is below RSSI threshold.
> - */
> -struct tuned_station_info {
> -	u16 picode;
> -	u32 af_cache[FM_RDS_MAX_AF_LIST];
> -	u8 afcache_size;
> -	u8 af_list_max;
> -};
> -
> -/* FM RX mode info */
> -struct fm_rx {
> -	struct region_info region;	/* Current selected band */
> -	u32 freq;	/* Current RX frquency */
> -	u8 mute_mode;	/* Current mute mode */
> -	u8 deemphasis_mode; /* Current deemphasis mode */
> -	/* RF dependent soft mute mode */
> -	u8 rf_depend_mute;
> -	u16 volume;	/* Current volume level */
> -	u16 rssi_threshold;	/* Current RSSI threshold level */
> -	/* Holds the index of the current AF jump */
> -	u8 afjump_idx;
> -	/* Will hold the frequency before the jump */
> -	u32 freq_before_jump;
> -	u8 rds_mode;	/* RDS operation mode (RDS/RDBS) */
> -	u8 af_mode;	/* Alternate frequency on/off */
> -	struct tuned_station_info stat_info;
> -	struct fm_rds rds;
> -};
> -
> -#define FMTX_RDS_TXT_STR_SIZE	25
> -/*
> - * FM TX RDS data
> - *
> - * @ text_type: is the text following PS or RT
> - * @ text: radio text string which could either be PS or RT
> - * @ af_freq: alternate frequency for Tx
> - * TODO: to be declared in application
> - */
> -struct tx_rds {
> -	u8 text_type;
> -	u8 text[FMTX_RDS_TXT_STR_SIZE];
> -	u8 flag;
> -	u32 af_freq;
> -};
> -/*
> - * FM TX global data
> - *
> - * @ pwr_lvl: Power Level of the Transmission from mixer control
> - * @ xmit_state: Transmission state = Updated locally upon Start/Stop
> - * @ audio_io: i2S/Analog
> - * @ tx_frq: Transmission frequency
> - */
> -struct fmtx_data {
> -	u8 pwr_lvl;
> -	u8 xmit_state;
> -	u8 audio_io;
> -	u8 region;
> -	u16 aud_mode;
> -	u32 preemph;
> -	u32 tx_frq;
> -	struct tx_rds rds;
> -};
> -
> -/* FM driver operation structure */
> -struct fmdev {
> -	struct video_device *radio_dev;	/* V4L2 video device pointer */
> -	struct v4l2_device v4l2_dev;	/* V4L2 top level struct */
> -	struct snd_card *card;	/* Card which holds FM mixer controls */
> -	u16 asci_id;
> -	spinlock_t rds_buff_lock; /* To protect access to RDS buffer */
> -	spinlock_t resp_skb_lock; /* To protect access to received SKB */
> -
> -	long flag;		/*  FM driver state machine info */
> -	int streg_cbdata; /* status of ST registration */
> -
> -	struct sk_buff_head rx_q;	/* RX queue */
> -	struct work_struct rx_bh_work;	/* RX BH Work */
> -
> -	struct sk_buff_head tx_q;	/* TX queue */
> -	struct work_struct tx_bh_work;	/* TX BH Work */
> -	unsigned long last_tx_jiffies;	/* Timestamp of last pkt sent */
> -	atomic_t tx_cnt;	/* Number of packets can send at a time */
> -
> -	struct sk_buff *resp_skb;	/* Response from the chip */
> -	/* Main task completion handler */
> -	struct completion maintask_comp;
> -	/* Opcode of last command sent to the chip */
> -	u8 pre_op;
> -	/* Handler used for wakeup when response packet is received */
> -	struct completion *resp_comp;
> -	struct fm_irq irq_info;
> -	u8 curr_fmmode; /* Current FM chip mode (TX, RX, OFF) */
> -	struct fm_rx rx;	/* FM receiver info */
> -	struct fmtx_data tx_data;
> -
> -	/* V4L2 ctrl framework handler*/
> -	struct v4l2_ctrl_handler ctrl_handler;
> -
> -	/* For core assisted locking */
> -	struct mutex mutex;
> -};
> -#endif
> diff --git a/drivers/media/radio/wl128x/fmdrv_common.c b/drivers/media/radio/wl128x/fmdrv_common.c
> deleted file mode 100644
> index 4d032436691c..000000000000
> --- a/drivers/media/radio/wl128x/fmdrv_common.c
> +++ /dev/null
> @@ -1,1676 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - *  FM Driver for Connectivity chip of Texas Instruments.
> - *
> - *  This sub-module of FM driver is common for FM RX and TX
> - *  functionality. This module is responsible for:
> - *  1) Forming group of Channel-8 commands to perform particular
> - *     functionality (eg., frequency set require more than
> - *     one Channel-8 command to be sent to the chip).
> - *  2) Sending each Channel-8 command to the chip and reading
> - *     response back over Shared Transport.
> - *  3) Managing TX and RX Queues and BH bh Works.
> - *  4) Handling FM Interrupt packet and taking appropriate action.
> - *  5) Loading FM firmware to the chip (common, FM TX, and FM RX
> - *     firmware files based on mode selection)
> - *
> - *  Copyright (C) 2011 Texas Instruments
> - *  Author: Raja Mani <raja_mani@ti.com>
> - *  Author: Manjunatha Halli <manjunatha_halli@ti.com>
> - */
> -
> -#include <linux/delay.h>
> -#include <linux/firmware.h>
> -#include <linux/module.h>
> -#include <linux/nospec.h>
> -#include <linux/jiffies.h>
> -
> -#include "fmdrv.h"
> -#include "fmdrv_v4l2.h"
> -#include "fmdrv_common.h"
> -#include <linux/ti_wilink_st.h>
> -#include "fmdrv_rx.h"
> -#include "fmdrv_tx.h"
> -
> -/* Region info */
> -static struct region_info region_configs[] = {
> -	/* Europe/US */
> -	{
> -	 .chanl_space = FM_CHANNEL_SPACING_200KHZ * FM_FREQ_MUL,
> -	 .bot_freq = 87500,	/* 87.5 MHz */
> -	 .top_freq = 108000,	/* 108 MHz */
> -	 .fm_band = 0,
> -	 },
> -	/* Japan */
> -	{
> -	 .chanl_space = FM_CHANNEL_SPACING_200KHZ * FM_FREQ_MUL,
> -	 .bot_freq = 76000,	/* 76 MHz */
> -	 .top_freq = 90000,	/* 90 MHz */
> -	 .fm_band = 1,
> -	 },
> -};
> -
> -/* Band selection */
> -static u8 default_radio_region;	/* Europe/US */
> -module_param(default_radio_region, byte, 0);
> -MODULE_PARM_DESC(default_radio_region, "Region: 0=Europe/US, 1=Japan");
> -
> -/* RDS buffer blocks */
> -static u32 default_rds_buf = 300;
> -module_param(default_rds_buf, uint, 0444);
> -MODULE_PARM_DESC(default_rds_buf, "RDS buffer entries");
> -
> -/* Radio Nr */
> -static u32 radio_nr = -1;
> -module_param(radio_nr, int, 0444);
> -MODULE_PARM_DESC(radio_nr, "Radio Nr");
> -
> -/* FM irq handlers forward declaration */
> -static void fm_irq_send_flag_getcmd(struct fmdev *);
> -static void fm_irq_handle_flag_getcmd_resp(struct fmdev *);
> -static void fm_irq_handle_hw_malfunction(struct fmdev *);
> -static void fm_irq_handle_rds_start(struct fmdev *);
> -static void fm_irq_send_rdsdata_getcmd(struct fmdev *);
> -static void fm_irq_handle_rdsdata_getcmd_resp(struct fmdev *);
> -static void fm_irq_handle_rds_finish(struct fmdev *);
> -static void fm_irq_handle_tune_op_ended(struct fmdev *);
> -static void fm_irq_handle_power_enb(struct fmdev *);
> -static void fm_irq_handle_low_rssi_start(struct fmdev *);
> -static void fm_irq_afjump_set_pi(struct fmdev *);
> -static void fm_irq_handle_set_pi_resp(struct fmdev *);
> -static void fm_irq_afjump_set_pimask(struct fmdev *);
> -static void fm_irq_handle_set_pimask_resp(struct fmdev *);
> -static void fm_irq_afjump_setfreq(struct fmdev *);
> -static void fm_irq_handle_setfreq_resp(struct fmdev *);
> -static void fm_irq_afjump_enableint(struct fmdev *);
> -static void fm_irq_afjump_enableint_resp(struct fmdev *);
> -static void fm_irq_start_afjump(struct fmdev *);
> -static void fm_irq_handle_start_afjump_resp(struct fmdev *);
> -static void fm_irq_afjump_rd_freq(struct fmdev *);
> -static void fm_irq_afjump_rd_freq_resp(struct fmdev *);
> -static void fm_irq_handle_low_rssi_finish(struct fmdev *);
> -static void fm_irq_send_intmsk_cmd(struct fmdev *);
> -static void fm_irq_handle_intmsk_cmd_resp(struct fmdev *);
> -
> -/*
> - * When FM common module receives interrupt packet, following handlers
> - * will be executed one after another to service the interrupt(s)
> - */
> -enum fmc_irq_handler_index {
> -	FM_SEND_FLAG_GETCMD_IDX,
> -	FM_HANDLE_FLAG_GETCMD_RESP_IDX,
> -
> -	/* HW malfunction irq handler */
> -	FM_HW_MAL_FUNC_IDX,
> -
> -	/* RDS threshold reached irq handler */
> -	FM_RDS_START_IDX,
> -	FM_RDS_SEND_RDS_GETCMD_IDX,
> -	FM_RDS_HANDLE_RDS_GETCMD_RESP_IDX,
> -	FM_RDS_FINISH_IDX,
> -
> -	/* Tune operation ended irq handler */
> -	FM_HW_TUNE_OP_ENDED_IDX,
> -
> -	/* TX power enable irq handler */
> -	FM_HW_POWER_ENB_IDX,
> -
> -	/* Low RSSI irq handler */
> -	FM_LOW_RSSI_START_IDX,
> -	FM_AF_JUMP_SETPI_IDX,
> -	FM_AF_JUMP_HANDLE_SETPI_RESP_IDX,
> -	FM_AF_JUMP_SETPI_MASK_IDX,
> -	FM_AF_JUMP_HANDLE_SETPI_MASK_RESP_IDX,
> -	FM_AF_JUMP_SET_AF_FREQ_IDX,
> -	FM_AF_JUMP_HANDLE_SET_AFFREQ_RESP_IDX,
> -	FM_AF_JUMP_ENABLE_INT_IDX,
> -	FM_AF_JUMP_ENABLE_INT_RESP_IDX,
> -	FM_AF_JUMP_START_AFJUMP_IDX,
> -	FM_AF_JUMP_HANDLE_START_AFJUMP_RESP_IDX,
> -	FM_AF_JUMP_RD_FREQ_IDX,
> -	FM_AF_JUMP_RD_FREQ_RESP_IDX,
> -	FM_LOW_RSSI_FINISH_IDX,
> -
> -	/* Interrupt process post action */
> -	FM_SEND_INTMSK_CMD_IDX,
> -	FM_HANDLE_INTMSK_CMD_RESP_IDX,
> -};
> -
> -/* FM interrupt handler table */
> -static int_handler_prototype int_handler_table[] = {
> -	fm_irq_send_flag_getcmd,
> -	fm_irq_handle_flag_getcmd_resp,
> -	fm_irq_handle_hw_malfunction,
> -	fm_irq_handle_rds_start, /* RDS threshold reached irq handler */
> -	fm_irq_send_rdsdata_getcmd,
> -	fm_irq_handle_rdsdata_getcmd_resp,
> -	fm_irq_handle_rds_finish,
> -	fm_irq_handle_tune_op_ended,
> -	fm_irq_handle_power_enb, /* TX power enable irq handler */
> -	fm_irq_handle_low_rssi_start,
> -	fm_irq_afjump_set_pi,
> -	fm_irq_handle_set_pi_resp,
> -	fm_irq_afjump_set_pimask,
> -	fm_irq_handle_set_pimask_resp,
> -	fm_irq_afjump_setfreq,
> -	fm_irq_handle_setfreq_resp,
> -	fm_irq_afjump_enableint,
> -	fm_irq_afjump_enableint_resp,
> -	fm_irq_start_afjump,
> -	fm_irq_handle_start_afjump_resp,
> -	fm_irq_afjump_rd_freq,
> -	fm_irq_afjump_rd_freq_resp,
> -	fm_irq_handle_low_rssi_finish,
> -	fm_irq_send_intmsk_cmd, /* Interrupt process post action */
> -	fm_irq_handle_intmsk_cmd_resp
> -};
> -
> -static long (*g_st_write) (struct sk_buff *skb);
> -static struct completion wait_for_fmdrv_reg_comp;
> -
> -static inline void fm_irq_call(struct fmdev *fmdev)
> -{
> -	fmdev->irq_info.handlers[fmdev->irq_info.stage](fmdev);
> -}
> -
> -/* Continue next function in interrupt handler table */
> -static inline void fm_irq_call_stage(struct fmdev *fmdev, u8 stage)
> -{
> -	fmdev->irq_info.stage = stage;
> -	fm_irq_call(fmdev);
> -}
> -
> -static inline void fm_irq_timeout_stage(struct fmdev *fmdev, u8 stage)
> -{
> -	fmdev->irq_info.stage = stage;
> -	mod_timer(&fmdev->irq_info.timer, jiffies + FM_DRV_TX_TIMEOUT);
> -}
> -
> -#ifdef FM_DUMP_TXRX_PKT
> - /* To dump outgoing FM Channel-8 packets */
> -inline void dump_tx_skb_data(struct sk_buff *skb)
> -{
> -	int len, len_org;
> -	u8 index;
> -	struct fm_cmd_msg_hdr *cmd_hdr;
> -
> -	cmd_hdr = (struct fm_cmd_msg_hdr *)skb->data;
> -	printk(KERN_INFO "<<%shdr:%02x len:%02x opcode:%02x type:%s dlen:%02x",
> -	       fm_cb(skb)->completion ? " " : "*", cmd_hdr->hdr,
> -	       cmd_hdr->len, cmd_hdr->op,
> -	       cmd_hdr->rd_wr ? "RD" : "WR", cmd_hdr->dlen);
> -
> -	len_org = skb->len - FM_CMD_MSG_HDR_SIZE;
> -	if (len_org > 0) {
> -		printk(KERN_CONT "\n   data(%d): ", cmd_hdr->dlen);
> -		len = min(len_org, 14);
> -		for (index = 0; index < len; index++)
> -			printk(KERN_CONT "%x ",
> -			       skb->data[FM_CMD_MSG_HDR_SIZE + index]);
> -		printk(KERN_CONT "%s", (len_org > 14) ? ".." : "");
> -	}
> -	printk(KERN_CONT "\n");
> -}
> -
> - /* To dump incoming FM Channel-8 packets */
> -inline void dump_rx_skb_data(struct sk_buff *skb)
> -{
> -	int len, len_org;
> -	u8 index;
> -	struct fm_event_msg_hdr *evt_hdr;
> -
> -	evt_hdr = (struct fm_event_msg_hdr *)skb->data;
> -	printk(KERN_INFO ">> hdr:%02x len:%02x sts:%02x numhci:%02x opcode:%02x type:%s dlen:%02x",
> -	       evt_hdr->hdr, evt_hdr->len,
> -	       evt_hdr->status, evt_hdr->num_fm_hci_cmds, evt_hdr->op,
> -	       (evt_hdr->rd_wr) ? "RD" : "WR", evt_hdr->dlen);
> -
> -	len_org = skb->len - FM_EVT_MSG_HDR_SIZE;
> -	if (len_org > 0) {
> -		printk(KERN_CONT "\n   data(%d): ", evt_hdr->dlen);
> -		len = min(len_org, 14);
> -		for (index = 0; index < len; index++)
> -			printk(KERN_CONT "%x ",
> -			       skb->data[FM_EVT_MSG_HDR_SIZE + index]);
> -		printk(KERN_CONT "%s", (len_org > 14) ? ".." : "");
> -	}
> -	printk(KERN_CONT "\n");
> -}
> -#endif
> -
> -void fmc_update_region_info(struct fmdev *fmdev, u8 region_to_set)
> -{
> -	fmdev->rx.region = region_configs[region_to_set];
> -}
> -
> -/*
> - * FM common sub-module will queue this bh work whenever it receives
> - * FM packet from ST driver.
> - */
> -static void recv_bh_work(struct work_struct *t)
> -{
> -	struct fmdev *fmdev;
> -	struct fm_irq *irq_info;
> -	struct fm_event_msg_hdr *evt_hdr;
> -	struct sk_buff *skb;
> -	u8 num_fm_hci_cmds;
> -	unsigned long flags;
> -
> -	fmdev = from_work(fmdev, t, tx_bh_work);
> -	irq_info = &fmdev->irq_info;
> -	/* Process all packets in the RX queue */
> -	while ((skb = skb_dequeue(&fmdev->rx_q))) {
> -		if (skb->len < sizeof(struct fm_event_msg_hdr)) {
> -			fmerr("skb(%p) has only %d bytes, at least need %zu bytes to decode\n",
> -			      skb,
> -			      skb->len, sizeof(struct fm_event_msg_hdr));
> -			kfree_skb(skb);
> -			continue;
> -		}
> -
> -		evt_hdr = (void *)skb->data;
> -		num_fm_hci_cmds = evt_hdr->num_fm_hci_cmds;
> -
> -		/* FM interrupt packet? */
> -		if (evt_hdr->op == FM_INTERRUPT) {
> -			/* FM interrupt handler started already? */
> -			if (!test_bit(FM_INTTASK_RUNNING, &fmdev->flag)) {
> -				set_bit(FM_INTTASK_RUNNING, &fmdev->flag);
> -				if (irq_info->stage != 0) {
> -					fmerr("Inval stage resetting to zero\n");
> -					irq_info->stage = 0;
> -				}
> -
> -				/*
> -				 * Execute first function in interrupt handler
> -				 * table.
> -				 */
> -				irq_info->handlers[irq_info->stage](fmdev);
> -			} else {
> -				set_bit(FM_INTTASK_SCHEDULE_PENDING, &fmdev->flag);
> -			}
> -			kfree_skb(skb);
> -		}
> -		/* Anyone waiting for this with completion handler? */
> -		else if (evt_hdr->op == fmdev->pre_op && fmdev->resp_comp != NULL) {
> -
> -			spin_lock_irqsave(&fmdev->resp_skb_lock, flags);
> -			fmdev->resp_skb = skb;
> -			spin_unlock_irqrestore(&fmdev->resp_skb_lock, flags);
> -			complete(fmdev->resp_comp);
> -
> -			fmdev->resp_comp = NULL;
> -			atomic_set(&fmdev->tx_cnt, 1);
> -		}
> -		/* Is this for interrupt handler? */
> -		else if (evt_hdr->op == fmdev->pre_op && fmdev->resp_comp == NULL) {
> -			if (fmdev->resp_skb != NULL)
> -				fmerr("Response SKB ptr not NULL\n");
> -
> -			spin_lock_irqsave(&fmdev->resp_skb_lock, flags);
> -			fmdev->resp_skb = skb;
> -			spin_unlock_irqrestore(&fmdev->resp_skb_lock, flags);
> -
> -			/* Execute interrupt handler where state index points */
> -			irq_info->handlers[irq_info->stage](fmdev);
> -
> -			kfree_skb(skb);
> -			atomic_set(&fmdev->tx_cnt, 1);
> -		} else {
> -			fmerr("Nobody claimed SKB(%p),purging\n", skb);
> -		}
> -
> -		/*
> -		 * Check flow control field. If Num_FM_HCI_Commands field is
> -		 * not zero, queue FM TX bh work.
> -		 */
> -		if (num_fm_hci_cmds && atomic_read(&fmdev->tx_cnt))
> -			if (!skb_queue_empty(&fmdev->tx_q))
> -				queue_work(system_bh_wq, &fmdev->tx_bh_work);
> -	}
> -}
> -
> -/* FM send_bh_work: is scheduled when FM packet has to be sent to chip */
> -static void send_bh_work(struct work_struct *t)
> -{
> -	struct fmdev *fmdev;
> -	struct sk_buff *skb;
> -	int len;
> -
> -	fmdev = from_work(fmdev, t, tx_bh_work);
> -
> -	if (!atomic_read(&fmdev->tx_cnt))
> -		return;
> -
> -	/* Check, is there any timeout happened to last transmitted packet */
> -	if (time_is_before_jiffies(fmdev->last_tx_jiffies + FM_DRV_TX_TIMEOUT)) {
> -		fmerr("TX timeout occurred\n");
> -		atomic_set(&fmdev->tx_cnt, 1);
> -	}
> -
> -	/* Send queued FM TX packets */
> -	skb = skb_dequeue(&fmdev->tx_q);
> -	if (!skb)
> -		return;
> -
> -	atomic_dec(&fmdev->tx_cnt);
> -	fmdev->pre_op = fm_cb(skb)->fm_op;
> -
> -	if (fmdev->resp_comp != NULL)
> -		fmerr("Response completion handler is not NULL\n");
> -
> -	fmdev->resp_comp = fm_cb(skb)->completion;
> -
> -	/* Write FM packet to ST driver */
> -	len = g_st_write(skb);
> -	if (len < 0) {
> -		kfree_skb(skb);
> -		fmdev->resp_comp = NULL;
> -		fmerr("TX bh work failed to send skb(%p)\n", skb);
> -		atomic_set(&fmdev->tx_cnt, 1);
> -	} else {
> -		fmdev->last_tx_jiffies = jiffies;
> -	}
> -}
> -
> -/*
> - * Queues FM Channel-8 packet to FM TX queue and schedules FM TX bh work for
> - * transmission
> - */
> -static int fm_send_cmd(struct fmdev *fmdev, u8 fm_op, u16 type,	void *payload,
> -		int payload_len, struct completion *wait_completion)
> -{
> -	struct sk_buff *skb;
> -	struct fm_cmd_msg_hdr *hdr;
> -	int size;
> -
> -	if (fm_op >= FM_INTERRUPT) {
> -		fmerr("Invalid fm opcode - %d\n", fm_op);
> -		return -EINVAL;
> -	}
> -	if (test_bit(FM_FW_DW_INPROGRESS, &fmdev->flag) && payload == NULL) {
> -		fmerr("Payload data is NULL during fw download\n");
> -		return -EINVAL;
> -	}
> -	if (!test_bit(FM_FW_DW_INPROGRESS, &fmdev->flag))
> -		size =
> -		    FM_CMD_MSG_HDR_SIZE + ((payload == NULL) ? 0 : payload_len);
> -	else
> -		size = payload_len;
> -
> -	skb = alloc_skb(size, GFP_ATOMIC);
> -	if (!skb) {
> -		fmerr("No memory to create new SKB\n");
> -		return -ENOMEM;
> -	}
> -	/*
> -	 * Don't fill FM header info for the commands which come from
> -	 * FM firmware file.
> -	 */
> -	if (!test_bit(FM_FW_DW_INPROGRESS, &fmdev->flag) ||
> -			test_bit(FM_INTTASK_RUNNING, &fmdev->flag)) {
> -		/* Fill command header info */
> -		hdr = skb_put(skb, FM_CMD_MSG_HDR_SIZE);
> -		hdr->hdr = FM_PKT_LOGICAL_CHAN_NUMBER;	/* 0x08 */
> -
> -		/* 3 (fm_opcode,rd_wr,dlen) + payload len) */
> -		hdr->len = ((payload == NULL) ? 0 : payload_len) + 3;
> -
> -		/* FM opcode */
> -		hdr->op = fm_op;
> -
> -		/* read/write type */
> -		hdr->rd_wr = type;
> -		hdr->dlen = payload_len;
> -		fm_cb(skb)->fm_op = fm_op;
> -
> -		/*
> -		 * If firmware download has finished and the command is
> -		 * not a read command then payload is != NULL - a write
> -		 * command with u16 payload - convert to be16
> -		 */
> -		if (payload != NULL)
> -			*(__be16 *)payload = cpu_to_be16(*(u16 *)payload);
> -
> -	} else if (payload != NULL) {
> -		fm_cb(skb)->fm_op = *((u8 *)payload + 2);
> -	}
> -	if (payload != NULL)
> -		skb_put_data(skb, payload, payload_len);
> -
> -	fm_cb(skb)->completion = wait_completion;
> -	skb_queue_tail(&fmdev->tx_q, skb);
> -	queue_work(system_bh_wq, &fmdev->tx_bh_work);
> -
> -	return 0;
> -}
> -
> -/* Sends FM Channel-8 command to the chip and waits for the response */
> -int fmc_send_cmd(struct fmdev *fmdev, u8 fm_op, u16 type, void *payload,
> -		unsigned int payload_len, void *response, int *response_len)
> -{
> -	struct sk_buff *skb;
> -	struct fm_event_msg_hdr *evt_hdr;
> -	unsigned long flags;
> -	int ret;
> -
> -	init_completion(&fmdev->maintask_comp);
> -	ret = fm_send_cmd(fmdev, fm_op, type, payload, payload_len,
> -			    &fmdev->maintask_comp);
> -	if (ret)
> -		return ret;
> -
> -	if (!wait_for_completion_timeout(&fmdev->maintask_comp,
> -					 FM_DRV_TX_TIMEOUT)) {
> -		fmerr("Timeout(%d sec),didn't get regcompletion signal from RX bh work\n",
> -			   jiffies_to_msecs(FM_DRV_TX_TIMEOUT) / 1000);
> -		return -ETIMEDOUT;
> -	}
> -	spin_lock_irqsave(&fmdev->resp_skb_lock, flags);
> -	if (!fmdev->resp_skb) {
> -		spin_unlock_irqrestore(&fmdev->resp_skb_lock, flags);
> -		fmerr("Response SKB is missing\n");
> -		return -EFAULT;
> -	}
> -	skb = fmdev->resp_skb;
> -	fmdev->resp_skb = NULL;
> -	spin_unlock_irqrestore(&fmdev->resp_skb_lock, flags);
> -
> -	evt_hdr = (void *)skb->data;
> -	if (evt_hdr->status != 0) {
> -		fmerr("Received event pkt status(%d) is not zero\n",
> -			   evt_hdr->status);
> -		kfree_skb(skb);
> -		return -EIO;
> -	}
> -	/* Send response data to caller */
> -	if (response != NULL && response_len != NULL && evt_hdr->dlen &&
> -	    evt_hdr->dlen <= payload_len) {
> -		/* Skip header info and copy only response data */
> -		skb_pull(skb, sizeof(struct fm_event_msg_hdr));
> -		memcpy(response, skb->data, evt_hdr->dlen);
> -		*response_len = evt_hdr->dlen;
> -	} else if (response_len != NULL && evt_hdr->dlen == 0) {
> -		*response_len = 0;
> -	}
> -	kfree_skb(skb);
> -
> -	return 0;
> -}
> -
> -/* --- Helper functions used in FM interrupt handlers ---*/
> -static inline int check_cmdresp_status(struct fmdev *fmdev,
> -		struct sk_buff **skb)
> -{
> -	struct fm_event_msg_hdr *fm_evt_hdr;
> -	unsigned long flags;
> -
> -	del_timer(&fmdev->irq_info.timer);
> -
> -	spin_lock_irqsave(&fmdev->resp_skb_lock, flags);
> -	*skb = fmdev->resp_skb;
> -	fmdev->resp_skb = NULL;
> -	spin_unlock_irqrestore(&fmdev->resp_skb_lock, flags);
> -
> -	fm_evt_hdr = (void *)(*skb)->data;
> -	if (fm_evt_hdr->status != 0) {
> -		fmerr("irq: opcode %x response status is not zero Initiating irq recovery process\n",
> -				fm_evt_hdr->op);
> -
> -		mod_timer(&fmdev->irq_info.timer, jiffies + FM_DRV_TX_TIMEOUT);
> -		return -1;
> -	}
> -
> -	return 0;
> -}
> -
> -static inline void fm_irq_common_cmd_resp_helper(struct fmdev *fmdev, u8 stage)
> -{
> -	struct sk_buff *skb;
> -
> -	if (!check_cmdresp_status(fmdev, &skb))
> -		fm_irq_call_stage(fmdev, stage);
> -}
> -
> -/*
> - * Interrupt process timeout handler.
> - * One of the irq handler did not get proper response from the chip. So take
> - * recovery action here. FM interrupts are disabled in the beginning of
> - * interrupt process. Therefore reset stage index to re-enable default
> - * interrupts. So that next interrupt will be processed as usual.
> - */
> -static void int_timeout_handler(struct timer_list *t)
> -{
> -	struct fmdev *fmdev;
> -	struct fm_irq *fmirq;
> -
> -	fmdbg("irq: timeout,trying to re-enable fm interrupts\n");
> -	fmdev = from_timer(fmdev, t, irq_info.timer);
> -	fmirq = &fmdev->irq_info;
> -	fmirq->retry++;
> -
> -	if (fmirq->retry > FM_IRQ_TIMEOUT_RETRY_MAX) {
> -		/* Stop recovery action (interrupt reenable process) and
> -		 * reset stage index & retry count values */
> -		fmirq->stage = 0;
> -		fmirq->retry = 0;
> -		fmerr("Recovery action failed duringirq processing, max retry reached\n");
> -		return;
> -	}
> -	fm_irq_call_stage(fmdev, FM_SEND_INTMSK_CMD_IDX);
> -}
> -
> -/* --------- FM interrupt handlers ------------*/
> -static void fm_irq_send_flag_getcmd(struct fmdev *fmdev)
> -{
> -	u16 flag;
> -
> -	/* Send FLAG_GET command , to know the source of interrupt */
> -	if (!fm_send_cmd(fmdev, FLAG_GET, REG_RD, NULL, sizeof(flag), NULL))
> -		fm_irq_timeout_stage(fmdev, FM_HANDLE_FLAG_GETCMD_RESP_IDX);
> -}
> -
> -static void fm_irq_handle_flag_getcmd_resp(struct fmdev *fmdev)
> -{
> -	struct sk_buff *skb;
> -	struct fm_event_msg_hdr *fm_evt_hdr;
> -
> -	if (check_cmdresp_status(fmdev, &skb))
> -		return;
> -
> -	fm_evt_hdr = (void *)skb->data;
> -	if (fm_evt_hdr->dlen > sizeof(fmdev->irq_info.flag))
> -		return;
> -
> -	/* Skip header info and copy only response data */
> -	skb_pull(skb, sizeof(struct fm_event_msg_hdr));
> -	memcpy(&fmdev->irq_info.flag, skb->data, fm_evt_hdr->dlen);
> -
> -	fmdev->irq_info.flag = be16_to_cpu((__force __be16)fmdev->irq_info.flag);
> -	fmdbg("irq: flag register(0x%x)\n", fmdev->irq_info.flag);
> -
> -	/* Continue next function in interrupt handler table */
> -	fm_irq_call_stage(fmdev, FM_HW_MAL_FUNC_IDX);
> -}
> -
> -static void fm_irq_handle_hw_malfunction(struct fmdev *fmdev)
> -{
> -	if (fmdev->irq_info.flag & FM_MAL_EVENT & fmdev->irq_info.mask)
> -		fmerr("irq: HW MAL int received - do nothing\n");
> -
> -	/* Continue next function in interrupt handler table */
> -	fm_irq_call_stage(fmdev, FM_RDS_START_IDX);
> -}
> -
> -static void fm_irq_handle_rds_start(struct fmdev *fmdev)
> -{
> -	if (fmdev->irq_info.flag & FM_RDS_EVENT & fmdev->irq_info.mask) {
> -		fmdbg("irq: rds threshold reached\n");
> -		fmdev->irq_info.stage = FM_RDS_SEND_RDS_GETCMD_IDX;
> -	} else {
> -		/* Continue next function in interrupt handler table */
> -		fmdev->irq_info.stage = FM_HW_TUNE_OP_ENDED_IDX;
> -	}
> -
> -	fm_irq_call(fmdev);
> -}
> -
> -static void fm_irq_send_rdsdata_getcmd(struct fmdev *fmdev)
> -{
> -	/* Send the command to read RDS data from the chip */
> -	if (!fm_send_cmd(fmdev, RDS_DATA_GET, REG_RD, NULL,
> -			    (FM_RX_RDS_FIFO_THRESHOLD * 3), NULL))
> -		fm_irq_timeout_stage(fmdev, FM_RDS_HANDLE_RDS_GETCMD_RESP_IDX);
> -}
> -
> -/* Keeps track of current RX channel AF (Alternate Frequency) */
> -static void fm_rx_update_af_cache(struct fmdev *fmdev, u8 af)
> -{
> -	struct tuned_station_info *stat_info = &fmdev->rx.stat_info;
> -	u8 reg_idx = fmdev->rx.region.fm_band;
> -	u8 index;
> -	u32 freq;
> -
> -	/* First AF indicates the number of AF follows. Reset the list */
> -	if ((af >= FM_RDS_1_AF_FOLLOWS) && (af <= FM_RDS_25_AF_FOLLOWS)) {
> -		fmdev->rx.stat_info.af_list_max = (af - FM_RDS_1_AF_FOLLOWS + 1);
> -		fmdev->rx.stat_info.afcache_size = 0;
> -		fmdbg("No of expected AF : %d\n", fmdev->rx.stat_info.af_list_max);
> -		return;
> -	}
> -
> -	if (af < FM_RDS_MIN_AF)
> -		return;
> -	if (reg_idx == FM_BAND_EUROPE_US && af > FM_RDS_MAX_AF)
> -		return;
> -	if (reg_idx == FM_BAND_JAPAN && af > FM_RDS_MAX_AF_JAPAN)
> -		return;
> -
> -	freq = fmdev->rx.region.bot_freq + (af * 100);
> -	if (freq == fmdev->rx.freq) {
> -		fmdbg("Current freq(%d) is matching with received AF(%d)\n",
> -				fmdev->rx.freq, freq);
> -		return;
> -	}
> -	/* Do check in AF cache */
> -	for (index = 0; index < stat_info->afcache_size; index++) {
> -		if (stat_info->af_cache[index] == freq)
> -			break;
> -	}
> -	/* Reached the limit of the list - ignore the next AF */
> -	if (index == stat_info->af_list_max) {
> -		fmdbg("AF cache is full\n");
> -		return;
> -	}
> -	/*
> -	 * If we reached the end of the list then this AF is not
> -	 * in the list - add it.
> -	 */
> -	if (index == stat_info->afcache_size) {
> -		fmdbg("Storing AF %d to cache index %d\n", freq, index);
> -		stat_info->af_cache[index] = freq;
> -		stat_info->afcache_size++;
> -	}
> -}
> -
> -/*
> - * Converts RDS buffer data from big endian format
> - * to little endian format.
> - */
> -static void fm_rdsparse_swapbytes(struct fmdev *fmdev,
> -		struct fm_rdsdata_format *rds_format)
> -{
> -	u8 index = 0;
> -	u8 *rds_buff;
> -
> -	/*
> -	 * Since in Orca the 2 RDS Data bytes are in little endian and
> -	 * in Dolphin they are in big endian, the parsing of the RDS data
> -	 * is chip dependent
> -	 */
> -	if (fmdev->asci_id != 0x6350) {
> -		rds_buff = &rds_format->data.groupdatabuff.buff[0];
> -		while (index + 1 < FM_RX_RDS_INFO_FIELD_MAX) {
> -			swap(rds_buff[index], rds_buff[index + 1]);
> -			index += 2;
> -		}
> -	}
> -}
> -
> -static void fm_irq_handle_rdsdata_getcmd_resp(struct fmdev *fmdev)
> -{
> -	struct sk_buff *skb;
> -	struct fm_rdsdata_format rds_fmt;
> -	struct fm_rds *rds = &fmdev->rx.rds;
> -	unsigned long group_idx, flags;
> -	u8 *rds_data, meta_data, tmpbuf[FM_RDS_BLK_SIZE];
> -	u8 type, blk_idx, idx;
> -	u16 cur_picode;
> -	u32 rds_len;
> -
> -	if (check_cmdresp_status(fmdev, &skb))
> -		return;
> -
> -	/* Skip header info */
> -	skb_pull(skb, sizeof(struct fm_event_msg_hdr));
> -	rds_data = skb->data;
> -	rds_len = skb->len;
> -
> -	/* Parse the RDS data */
> -	while (rds_len >= FM_RDS_BLK_SIZE) {
> -		meta_data = rds_data[2];
> -		/* Get the type: 0=A, 1=B, 2=C, 3=C', 4=D, 5=E */
> -		type = (meta_data & 0x07);
> -
> -		/* Transform the blk type into index sequence (0, 1, 2, 3, 4) */
> -		blk_idx = (type <= FM_RDS_BLOCK_C ? type : (type - 1));
> -		fmdbg("Block index:%d(%s)\n", blk_idx,
> -			   (meta_data & FM_RDS_STATUS_ERR_MASK) ? "Bad" : "Ok");
> -
> -		if ((meta_data & FM_RDS_STATUS_ERR_MASK) != 0)
> -			break;
> -
> -		if (blk_idx > FM_RDS_BLK_IDX_D) {
> -			fmdbg("Block sequence mismatch\n");
> -			rds->last_blk_idx = -1;
> -			break;
> -		}
> -
> -		/* Skip checkword (control) byte and copy only data byte */
> -		idx = array_index_nospec(blk_idx * (FM_RDS_BLK_SIZE - 1),
> -					 FM_RX_RDS_INFO_FIELD_MAX - (FM_RDS_BLK_SIZE - 1));
> -
> -		memcpy(&rds_fmt.data.groupdatabuff.buff[idx], rds_data,
> -		       FM_RDS_BLK_SIZE - 1);
> -
> -		rds->last_blk_idx = blk_idx;
> -
> -		/* If completed a whole group then handle it */
> -		if (blk_idx == FM_RDS_BLK_IDX_D) {
> -			fmdbg("Good block received\n");
> -			fm_rdsparse_swapbytes(fmdev, &rds_fmt);
> -
> -			/*
> -			 * Extract PI code and store in local cache.
> -			 * We need this during AF switch processing.
> -			 */
> -			cur_picode = be16_to_cpu((__force __be16)rds_fmt.data.groupgeneral.pidata);
> -			if (fmdev->rx.stat_info.picode != cur_picode)
> -				fmdev->rx.stat_info.picode = cur_picode;
> -
> -			fmdbg("picode:%d\n", cur_picode);
> -
> -			group_idx = (rds_fmt.data.groupgeneral.blk_b[0] >> 3);
> -			fmdbg("(fmdrv):Group:%ld%s\n", group_idx/2,
> -					(group_idx % 2) ? "B" : "A");
> -
> -			group_idx = 1 << (rds_fmt.data.groupgeneral.blk_b[0] >> 3);
> -			if (group_idx == FM_RDS_GROUP_TYPE_MASK_0A) {
> -				fm_rx_update_af_cache(fmdev, rds_fmt.data.group0A.af[0]);
> -				fm_rx_update_af_cache(fmdev, rds_fmt.data.group0A.af[1]);
> -			}
> -		}
> -		rds_len -= FM_RDS_BLK_SIZE;
> -		rds_data += FM_RDS_BLK_SIZE;
> -	}
> -
> -	/* Copy raw rds data to internal rds buffer */
> -	rds_data = skb->data;
> -	rds_len = skb->len;
> -
> -	spin_lock_irqsave(&fmdev->rds_buff_lock, flags);
> -	while (rds_len > 0) {
> -		/*
> -		 * Fill RDS buffer as per V4L2 specification.
> -		 * Store control byte
> -		 */
> -		type = (rds_data[2] & 0x07);
> -		blk_idx = (type <= FM_RDS_BLOCK_C ? type : (type - 1));
> -		tmpbuf[2] = blk_idx;	/* Offset name */
> -		tmpbuf[2] |= blk_idx << 3;	/* Received offset */
> -
> -		/* Store data byte */
> -		tmpbuf[0] = rds_data[0];
> -		tmpbuf[1] = rds_data[1];
> -
> -		memcpy(&rds->buff[rds->wr_idx], &tmpbuf, FM_RDS_BLK_SIZE);
> -		rds->wr_idx = (rds->wr_idx + FM_RDS_BLK_SIZE) % rds->buf_size;
> -
> -		/* Check for overflow & start over */
> -		if (rds->wr_idx == rds->rd_idx) {
> -			fmdbg("RDS buffer overflow\n");
> -			rds->wr_idx = 0;
> -			rds->rd_idx = 0;
> -			break;
> -		}
> -		rds_len -= FM_RDS_BLK_SIZE;
> -		rds_data += FM_RDS_BLK_SIZE;
> -	}
> -	spin_unlock_irqrestore(&fmdev->rds_buff_lock, flags);
> -
> -	/* Wakeup read queue */
> -	if (rds->wr_idx != rds->rd_idx)
> -		wake_up_interruptible(&rds->read_queue);
> -
> -	fm_irq_call_stage(fmdev, FM_RDS_FINISH_IDX);
> -}
> -
> -static void fm_irq_handle_rds_finish(struct fmdev *fmdev)
> -{
> -	fm_irq_call_stage(fmdev, FM_HW_TUNE_OP_ENDED_IDX);
> -}
> -
> -static void fm_irq_handle_tune_op_ended(struct fmdev *fmdev)
> -{
> -	if (fmdev->irq_info.flag & (FM_FR_EVENT | FM_BL_EVENT) & fmdev->
> -	    irq_info.mask) {
> -		fmdbg("irq: tune ended/bandlimit reached\n");
> -		if (test_and_clear_bit(FM_AF_SWITCH_INPROGRESS, &fmdev->flag)) {
> -			fmdev->irq_info.stage = FM_AF_JUMP_RD_FREQ_IDX;
> -		} else {
> -			complete(&fmdev->maintask_comp);
> -			fmdev->irq_info.stage = FM_HW_POWER_ENB_IDX;
> -		}
> -	} else
> -		fmdev->irq_info.stage = FM_HW_POWER_ENB_IDX;
> -
> -	fm_irq_call(fmdev);
> -}
> -
> -static void fm_irq_handle_power_enb(struct fmdev *fmdev)
> -{
> -	if (fmdev->irq_info.flag & FM_POW_ENB_EVENT) {
> -		fmdbg("irq: Power Enabled/Disabled\n");
> -		complete(&fmdev->maintask_comp);
> -	}
> -
> -	fm_irq_call_stage(fmdev, FM_LOW_RSSI_START_IDX);
> -}
> -
> -static void fm_irq_handle_low_rssi_start(struct fmdev *fmdev)
> -{
> -	if ((fmdev->rx.af_mode == FM_RX_RDS_AF_SWITCH_MODE_ON) &&
> -	    (fmdev->irq_info.flag & FM_LEV_EVENT & fmdev->irq_info.mask) &&
> -	    (fmdev->rx.freq != FM_UNDEFINED_FREQ) &&
> -	    (fmdev->rx.stat_info.afcache_size != 0)) {
> -		fmdbg("irq: rssi level has fallen below threshold level\n");
> -
> -		/* Disable further low RSSI interrupts */
> -		fmdev->irq_info.mask &= ~FM_LEV_EVENT;
> -
> -		fmdev->rx.afjump_idx = 0;
> -		fmdev->rx.freq_before_jump = fmdev->rx.freq;
> -		fmdev->irq_info.stage = FM_AF_JUMP_SETPI_IDX;
> -	} else {
> -		/* Continue next function in interrupt handler table */
> -		fmdev->irq_info.stage = FM_SEND_INTMSK_CMD_IDX;
> -	}
> -
> -	fm_irq_call(fmdev);
> -}
> -
> -static void fm_irq_afjump_set_pi(struct fmdev *fmdev)
> -{
> -	u16 payload;
> -
> -	/* Set PI code - must be updated if the AF list is not empty */
> -	payload = fmdev->rx.stat_info.picode;
> -	if (!fm_send_cmd(fmdev, RDS_PI_SET, REG_WR, &payload, sizeof(payload), NULL))
> -		fm_irq_timeout_stage(fmdev, FM_AF_JUMP_HANDLE_SETPI_RESP_IDX);
> -}
> -
> -static void fm_irq_handle_set_pi_resp(struct fmdev *fmdev)
> -{
> -	fm_irq_common_cmd_resp_helper(fmdev, FM_AF_JUMP_SETPI_MASK_IDX);
> -}
> -
> -/*
> - * Set PI mask.
> - * 0xFFFF = Enable PI code matching
> - * 0x0000 = Disable PI code matching
> - */
> -static void fm_irq_afjump_set_pimask(struct fmdev *fmdev)
> -{
> -	u16 payload;
> -
> -	payload = 0x0000;
> -	if (!fm_send_cmd(fmdev, RDS_PI_MASK_SET, REG_WR, &payload, sizeof(payload), NULL))
> -		fm_irq_timeout_stage(fmdev, FM_AF_JUMP_HANDLE_SETPI_MASK_RESP_IDX);
> -}
> -
> -static void fm_irq_handle_set_pimask_resp(struct fmdev *fmdev)
> -{
> -	fm_irq_common_cmd_resp_helper(fmdev, FM_AF_JUMP_SET_AF_FREQ_IDX);
> -}
> -
> -static void fm_irq_afjump_setfreq(struct fmdev *fmdev)
> -{
> -	u16 frq_index;
> -	u16 payload;
> -
> -	fmdbg("Switch to %d KHz\n", fmdev->rx.stat_info.af_cache[fmdev->rx.afjump_idx]);
> -	frq_index = (fmdev->rx.stat_info.af_cache[fmdev->rx.afjump_idx] -
> -	     fmdev->rx.region.bot_freq) / FM_FREQ_MUL;
> -
> -	payload = frq_index;
> -	if (!fm_send_cmd(fmdev, AF_FREQ_SET, REG_WR, &payload, sizeof(payload), NULL))
> -		fm_irq_timeout_stage(fmdev, FM_AF_JUMP_HANDLE_SET_AFFREQ_RESP_IDX);
> -}
> -
> -static void fm_irq_handle_setfreq_resp(struct fmdev *fmdev)
> -{
> -	fm_irq_common_cmd_resp_helper(fmdev, FM_AF_JUMP_ENABLE_INT_IDX);
> -}
> -
> -static void fm_irq_afjump_enableint(struct fmdev *fmdev)
> -{
> -	u16 payload;
> -
> -	/* Enable FR (tuning operation ended) interrupt */
> -	payload = FM_FR_EVENT;
> -	if (!fm_send_cmd(fmdev, INT_MASK_SET, REG_WR, &payload, sizeof(payload), NULL))
> -		fm_irq_timeout_stage(fmdev, FM_AF_JUMP_ENABLE_INT_RESP_IDX);
> -}
> -
> -static void fm_irq_afjump_enableint_resp(struct fmdev *fmdev)
> -{
> -	fm_irq_common_cmd_resp_helper(fmdev, FM_AF_JUMP_START_AFJUMP_IDX);
> -}
> -
> -static void fm_irq_start_afjump(struct fmdev *fmdev)
> -{
> -	u16 payload;
> -
> -	payload = FM_TUNER_AF_JUMP_MODE;
> -	if (!fm_send_cmd(fmdev, TUNER_MODE_SET, REG_WR, &payload,
> -			sizeof(payload), NULL))
> -		fm_irq_timeout_stage(fmdev, FM_AF_JUMP_HANDLE_START_AFJUMP_RESP_IDX);
> -}
> -
> -static void fm_irq_handle_start_afjump_resp(struct fmdev *fmdev)
> -{
> -	struct sk_buff *skb;
> -
> -	if (check_cmdresp_status(fmdev, &skb))
> -		return;
> -
> -	fmdev->irq_info.stage = FM_SEND_FLAG_GETCMD_IDX;
> -	set_bit(FM_AF_SWITCH_INPROGRESS, &fmdev->flag);
> -	clear_bit(FM_INTTASK_RUNNING, &fmdev->flag);
> -}
> -
> -static void fm_irq_afjump_rd_freq(struct fmdev *fmdev)
> -{
> -	u16 payload;
> -
> -	if (!fm_send_cmd(fmdev, FREQ_SET, REG_RD, NULL, sizeof(payload), NULL))
> -		fm_irq_timeout_stage(fmdev, FM_AF_JUMP_RD_FREQ_RESP_IDX);
> -}
> -
> -static void fm_irq_afjump_rd_freq_resp(struct fmdev *fmdev)
> -{
> -	struct sk_buff *skb;
> -	u16 read_freq;
> -	u32 curr_freq, jumped_freq;
> -
> -	if (check_cmdresp_status(fmdev, &skb))
> -		return;
> -
> -	/* Skip header info and copy only response data */
> -	skb_pull(skb, sizeof(struct fm_event_msg_hdr));
> -	memcpy(&read_freq, skb->data, sizeof(read_freq));
> -	read_freq = be16_to_cpu((__force __be16)read_freq);
> -	curr_freq = fmdev->rx.region.bot_freq + ((u32)read_freq * FM_FREQ_MUL);
> -
> -	jumped_freq = fmdev->rx.stat_info.af_cache[fmdev->rx.afjump_idx];
> -
> -	/* If the frequency was changed the jump succeeded */
> -	if ((curr_freq != fmdev->rx.freq_before_jump) && (curr_freq == jumped_freq)) {
> -		fmdbg("Successfully switched to alternate freq %d\n", curr_freq);
> -		fmdev->rx.freq = curr_freq;
> -		fm_rx_reset_rds_cache(fmdev);
> -
> -		/* AF feature is on, enable low level RSSI interrupt */
> -		if (fmdev->rx.af_mode == FM_RX_RDS_AF_SWITCH_MODE_ON)
> -			fmdev->irq_info.mask |= FM_LEV_EVENT;
> -
> -		fmdev->irq_info.stage = FM_LOW_RSSI_FINISH_IDX;
> -	} else {		/* jump to the next freq in the AF list */
> -		fmdev->rx.afjump_idx++;
> -
> -		/* If we reached the end of the list - stop searching */
> -		if (fmdev->rx.afjump_idx >= fmdev->rx.stat_info.afcache_size) {
> -			fmdbg("AF switch processing failed\n");
> -			fmdev->irq_info.stage = FM_LOW_RSSI_FINISH_IDX;
> -		} else {	/* AF List is not over - try next one */
> -
> -			fmdbg("Trying next freq in AF cache\n");
> -			fmdev->irq_info.stage = FM_AF_JUMP_SETPI_IDX;
> -		}
> -	}
> -	fm_irq_call(fmdev);
> -}
> -
> -static void fm_irq_handle_low_rssi_finish(struct fmdev *fmdev)
> -{
> -	fm_irq_call_stage(fmdev, FM_SEND_INTMSK_CMD_IDX);
> -}
> -
> -static void fm_irq_send_intmsk_cmd(struct fmdev *fmdev)
> -{
> -	u16 payload;
> -
> -	/* Re-enable FM interrupts */
> -	payload = fmdev->irq_info.mask;
> -
> -	if (!fm_send_cmd(fmdev, INT_MASK_SET, REG_WR, &payload,
> -			sizeof(payload), NULL))
> -		fm_irq_timeout_stage(fmdev, FM_HANDLE_INTMSK_CMD_RESP_IDX);
> -}
> -
> -static void fm_irq_handle_intmsk_cmd_resp(struct fmdev *fmdev)
> -{
> -	struct sk_buff *skb;
> -
> -	if (check_cmdresp_status(fmdev, &skb))
> -		return;
> -	/*
> -	 * This is last function in interrupt table to be executed.
> -	 * So, reset stage index to 0.
> -	 */
> -	fmdev->irq_info.stage = FM_SEND_FLAG_GETCMD_IDX;
> -
> -	/* Start processing any pending interrupt */
> -	if (test_and_clear_bit(FM_INTTASK_SCHEDULE_PENDING, &fmdev->flag))
> -		fmdev->irq_info.handlers[fmdev->irq_info.stage](fmdev);
> -	else
> -		clear_bit(FM_INTTASK_RUNNING, &fmdev->flag);
> -}
> -
> -/* Returns availability of RDS data in internal buffer */
> -int fmc_is_rds_data_available(struct fmdev *fmdev, struct file *file,
> -				struct poll_table_struct *pts)
> -{
> -	poll_wait(file, &fmdev->rx.rds.read_queue, pts);
> -	if (fmdev->rx.rds.rd_idx != fmdev->rx.rds.wr_idx)
> -		return 0;
> -
> -	return -EAGAIN;
> -}
> -
> -/* Copies RDS data from internal buffer to user buffer */
> -int fmc_transfer_rds_from_internal_buff(struct fmdev *fmdev, struct file *file,
> -		u8 __user *buf, size_t count)
> -{
> -	u32 block_count;
> -	u8 tmpbuf[FM_RDS_BLK_SIZE];
> -	unsigned long flags;
> -	int ret;
> -
> -	if (fmdev->rx.rds.wr_idx == fmdev->rx.rds.rd_idx) {
> -		if (file->f_flags & O_NONBLOCK)
> -			return -EWOULDBLOCK;
> -
> -		ret = wait_event_interruptible(fmdev->rx.rds.read_queue,
> -				(fmdev->rx.rds.wr_idx != fmdev->rx.rds.rd_idx));
> -		if (ret)
> -			return -EINTR;
> -	}
> -
> -	/* Calculate block count from byte count */
> -	count /= FM_RDS_BLK_SIZE;
> -	block_count = 0;
> -	ret = 0;
> -
> -	while (block_count < count) {
> -		spin_lock_irqsave(&fmdev->rds_buff_lock, flags);
> -
> -		if (fmdev->rx.rds.wr_idx == fmdev->rx.rds.rd_idx) {
> -			spin_unlock_irqrestore(&fmdev->rds_buff_lock, flags);
> -			break;
> -		}
> -		memcpy(tmpbuf, &fmdev->rx.rds.buff[fmdev->rx.rds.rd_idx],
> -					FM_RDS_BLK_SIZE);
> -		fmdev->rx.rds.rd_idx += FM_RDS_BLK_SIZE;
> -		if (fmdev->rx.rds.rd_idx >= fmdev->rx.rds.buf_size)
> -			fmdev->rx.rds.rd_idx = 0;
> -
> -		spin_unlock_irqrestore(&fmdev->rds_buff_lock, flags);
> -
> -		if (copy_to_user(buf, tmpbuf, FM_RDS_BLK_SIZE))
> -			break;
> -
> -		block_count++;
> -		buf += FM_RDS_BLK_SIZE;
> -		ret += FM_RDS_BLK_SIZE;
> -	}
> -	return ret;
> -}
> -
> -int fmc_set_freq(struct fmdev *fmdev, u32 freq_to_set)
> -{
> -	switch (fmdev->curr_fmmode) {
> -	case FM_MODE_RX:
> -		return fm_rx_set_freq(fmdev, freq_to_set);
> -
> -	case FM_MODE_TX:
> -		return fm_tx_set_freq(fmdev, freq_to_set);
> -
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
> -int fmc_get_freq(struct fmdev *fmdev, u32 *cur_tuned_frq)
> -{
> -	if (fmdev->rx.freq == FM_UNDEFINED_FREQ) {
> -		fmerr("RX frequency is not set\n");
> -		return -EPERM;
> -	}
> -	if (cur_tuned_frq == NULL) {
> -		fmerr("Invalid memory\n");
> -		return -ENOMEM;
> -	}
> -
> -	switch (fmdev->curr_fmmode) {
> -	case FM_MODE_RX:
> -		*cur_tuned_frq = fmdev->rx.freq;
> -		return 0;
> -
> -	case FM_MODE_TX:
> -		*cur_tuned_frq = 0;	/* TODO : Change this later */
> -		return 0;
> -
> -	default:
> -		return -EINVAL;
> -	}
> -
> -}
> -
> -int fmc_set_region(struct fmdev *fmdev, u8 region_to_set)
> -{
> -	switch (fmdev->curr_fmmode) {
> -	case FM_MODE_RX:
> -		return fm_rx_set_region(fmdev, region_to_set);
> -
> -	case FM_MODE_TX:
> -		return fm_tx_set_region(fmdev, region_to_set);
> -
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
> -int fmc_set_mute_mode(struct fmdev *fmdev, u8 mute_mode_toset)
> -{
> -	switch (fmdev->curr_fmmode) {
> -	case FM_MODE_RX:
> -		return fm_rx_set_mute_mode(fmdev, mute_mode_toset);
> -
> -	case FM_MODE_TX:
> -		return fm_tx_set_mute_mode(fmdev, mute_mode_toset);
> -
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
> -int fmc_set_stereo_mono(struct fmdev *fmdev, u16 mode)
> -{
> -	switch (fmdev->curr_fmmode) {
> -	case FM_MODE_RX:
> -		return fm_rx_set_stereo_mono(fmdev, mode);
> -
> -	case FM_MODE_TX:
> -		return fm_tx_set_stereo_mono(fmdev, mode);
> -
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
> -int fmc_set_rds_mode(struct fmdev *fmdev, u8 rds_en_dis)
> -{
> -	switch (fmdev->curr_fmmode) {
> -	case FM_MODE_RX:
> -		return fm_rx_set_rds_mode(fmdev, rds_en_dis);
> -
> -	case FM_MODE_TX:
> -		return fm_tx_set_rds_mode(fmdev, rds_en_dis);
> -
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
> -/* Sends power off command to the chip */
> -static int fm_power_down(struct fmdev *fmdev)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	if (!test_bit(FM_CORE_READY, &fmdev->flag)) {
> -		fmerr("FM core is not ready\n");
> -		return -EPERM;
> -	}
> -	if (fmdev->curr_fmmode == FM_MODE_OFF) {
> -		fmdbg("FM chip is already in OFF state\n");
> -		return 0;
> -	}
> -
> -	payload = 0x0;
> -	ret = fmc_send_cmd(fmdev, FM_POWER_MODE, REG_WR, &payload,
> -		sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	return fmc_release(fmdev);
> -}
> -
> -/* Reads init command from FM firmware file and loads to the chip */
> -static int fm_download_firmware(struct fmdev *fmdev, const u8 *fw_name)
> -{
> -	const struct firmware *fw_entry;
> -	struct bts_header *fw_header;
> -	struct bts_action *action;
> -	struct bts_action_delay *delay;
> -	u8 *fw_data;
> -	int ret, fw_len;
> -
> -	set_bit(FM_FW_DW_INPROGRESS, &fmdev->flag);
> -
> -	ret = request_firmware(&fw_entry, fw_name,
> -				&fmdev->radio_dev->dev);
> -	if (ret < 0) {
> -		fmerr("Unable to read firmware(%s) content\n", fw_name);
> -		return ret;
> -	}
> -	fmdbg("Firmware(%s) length : %zu bytes\n", fw_name, fw_entry->size);
> -
> -	fw_data = (void *)fw_entry->data;
> -	fw_len = fw_entry->size;
> -
> -	fw_header = (struct bts_header *)fw_data;
> -	if (fw_header->magic != FM_FW_FILE_HEADER_MAGIC) {
> -		fmerr("%s not a legal TI firmware file\n", fw_name);
> -		ret = -EINVAL;
> -		goto rel_fw;
> -	}
> -	fmdbg("FW(%s) magic number : 0x%x\n", fw_name, fw_header->magic);
> -
> -	/* Skip file header info , we already verified it */
> -	fw_data += sizeof(struct bts_header);
> -	fw_len -= sizeof(struct bts_header);
> -
> -	while (fw_data && fw_len > 0) {
> -		action = (struct bts_action *)fw_data;
> -
> -		switch (action->type) {
> -		case ACTION_SEND_COMMAND:	/* Send */
> -			ret = fmc_send_cmd(fmdev, 0, 0, action->data,
> -					   action->size, NULL, NULL);
> -			if (ret)
> -				goto rel_fw;
> -
> -			break;
> -
> -		case ACTION_DELAY:	/* Delay */
> -			delay = (struct bts_action_delay *)action->data;
> -			mdelay(delay->msec);
> -			break;
> -		}
> -
> -		fw_data += (sizeof(struct bts_action) + (action->size));
> -		fw_len -= (sizeof(struct bts_action) + (action->size));
> -	}
> -	fmdbg("Transferred only %d of %d bytes of the firmware to chip\n",
> -	      fw_entry->size - fw_len, fw_entry->size);
> -rel_fw:
> -	release_firmware(fw_entry);
> -	clear_bit(FM_FW_DW_INPROGRESS, &fmdev->flag);
> -
> -	return ret;
> -}
> -
> -/* Loads default RX configuration to the chip */
> -static int load_default_rx_configuration(struct fmdev *fmdev)
> -{
> -	int ret;
> -
> -	ret = fm_rx_set_volume(fmdev, FM_DEFAULT_RX_VOLUME);
> -	if (ret < 0)
> -		return ret;
> -
> -	return fm_rx_set_rssi_threshold(fmdev, FM_DEFAULT_RSSI_THRESHOLD);
> -}
> -
> -/* Does FM power on sequence */
> -static int fm_power_up(struct fmdev *fmdev, u8 mode)
> -{
> -	u16 payload;
> -	__be16 asic_id = 0, asic_ver = 0;
> -	int resp_len, ret;
> -	u8 fw_name[50];
> -
> -	if (mode >= FM_MODE_ENTRY_MAX) {
> -		fmerr("Invalid firmware download option\n");
> -		return -EINVAL;
> -	}
> -
> -	/*
> -	 * Initialize FM common module. FM GPIO toggling is
> -	 * taken care in Shared Transport driver.
> -	 */
> -	ret = fmc_prepare(fmdev);
> -	if (ret < 0) {
> -		fmerr("Unable to prepare FM Common\n");
> -		return ret;
> -	}
> -
> -	payload = FM_ENABLE;
> -	if (fmc_send_cmd(fmdev, FM_POWER_MODE, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL))
> -		goto rel;
> -
> -	/* Allow the chip to settle down in Channel-8 mode */
> -	msleep(20);
> -
> -	if (fmc_send_cmd(fmdev, ASIC_ID_GET, REG_RD, NULL,
> -			sizeof(asic_id), &asic_id, &resp_len))
> -		goto rel;
> -
> -	if (fmc_send_cmd(fmdev, ASIC_VER_GET, REG_RD, NULL,
> -			sizeof(asic_ver), &asic_ver, &resp_len))
> -		goto rel;
> -
> -	fmdbg("ASIC ID: 0x%x , ASIC Version: %d\n",
> -		be16_to_cpu(asic_id), be16_to_cpu(asic_ver));
> -
> -	sprintf(fw_name, "%s_%x.%d.bts", FM_FMC_FW_FILE_START,
> -		be16_to_cpu(asic_id), be16_to_cpu(asic_ver));
> -
> -	ret = fm_download_firmware(fmdev, fw_name);
> -	if (ret < 0) {
> -		fmdbg("Failed to download firmware file %s\n", fw_name);
> -		goto rel;
> -	}
> -	sprintf(fw_name, "%s_%x.%d.bts", (mode == FM_MODE_RX) ?
> -			FM_RX_FW_FILE_START : FM_TX_FW_FILE_START,
> -			be16_to_cpu(asic_id), be16_to_cpu(asic_ver));
> -
> -	ret = fm_download_firmware(fmdev, fw_name);
> -	if (ret < 0) {
> -		fmdbg("Failed to download firmware file %s\n", fw_name);
> -		goto rel;
> -	} else
> -		return ret;
> -rel:
> -	return fmc_release(fmdev);
> -}
> -
> -/* Set FM Modes(TX, RX, OFF) */
> -int fmc_set_mode(struct fmdev *fmdev, u8 fm_mode)
> -{
> -	int ret = 0;
> -
> -	if (fm_mode >= FM_MODE_ENTRY_MAX) {
> -		fmerr("Invalid FM mode\n");
> -		return -EINVAL;
> -	}
> -	if (fmdev->curr_fmmode == fm_mode) {
> -		fmdbg("Already fm is in mode(%d)\n", fm_mode);
> -		return ret;
> -	}
> -
> -	switch (fm_mode) {
> -	case FM_MODE_OFF:	/* OFF Mode */
> -		ret = fm_power_down(fmdev);
> -		if (ret < 0) {
> -			fmerr("Failed to set OFF mode\n");
> -			return ret;
> -		}
> -		break;
> -
> -	case FM_MODE_TX:	/* TX Mode */
> -	case FM_MODE_RX:	/* RX Mode */
> -		/* Power down before switching to TX or RX mode */
> -		if (fmdev->curr_fmmode != FM_MODE_OFF) {
> -			ret = fm_power_down(fmdev);
> -			if (ret < 0) {
> -				fmerr("Failed to set OFF mode\n");
> -				return ret;
> -			}
> -			msleep(30);
> -		}
> -		ret = fm_power_up(fmdev, fm_mode);
> -		if (ret < 0) {
> -			fmerr("Failed to load firmware\n");
> -			return ret;
> -		}
> -	}
> -	fmdev->curr_fmmode = fm_mode;
> -
> -	/* Set default configuration */
> -	if (fmdev->curr_fmmode == FM_MODE_RX) {
> -		fmdbg("Loading default rx configuration..\n");
> -		ret = load_default_rx_configuration(fmdev);
> -		if (ret < 0)
> -			fmerr("Failed to load default values\n");
> -	}
> -
> -	return ret;
> -}
> -
> -/* Returns current FM mode (TX, RX, OFF) */
> -int fmc_get_mode(struct fmdev *fmdev, u8 *fmmode)
> -{
> -	if (!test_bit(FM_CORE_READY, &fmdev->flag)) {
> -		fmerr("FM core is not ready\n");
> -		return -EPERM;
> -	}
> -	if (fmmode == NULL) {
> -		fmerr("Invalid memory\n");
> -		return -ENOMEM;
> -	}
> -
> -	*fmmode = fmdev->curr_fmmode;
> -	return 0;
> -}
> -
> -/* Called by ST layer when FM packet is available */
> -static long fm_st_receive(void *arg, struct sk_buff *skb)
> -{
> -	struct fmdev *fmdev;
> -
> -	fmdev = arg;
> -
> -	if (skb == NULL) {
> -		fmerr("Invalid SKB received from ST\n");
> -		return -EFAULT;
> -	}
> -
> -	if (skb->cb[0] != FM_PKT_LOGICAL_CHAN_NUMBER) {
> -		fmerr("Received SKB (%p) is not FM Channel 8 pkt\n", skb);
> -		return -EINVAL;
> -	}
> -
> -	memcpy(skb_push(skb, 1), &skb->cb[0], 1);
> -	skb_queue_tail(&fmdev->rx_q, skb);
> -	queue_work(system_bh_wq, &fmdev->rx_bh_work);
> -
> -	return 0;
> -}
> -
> -/*
> - * Called by ST layer to indicate protocol registration completion
> - * status.
> - */
> -static void fm_st_reg_comp_cb(void *arg, int data)
> -{
> -	struct fmdev *fmdev;
> -
> -	fmdev = (struct fmdev *)arg;
> -	fmdev->streg_cbdata = data;
> -	complete(&wait_for_fmdrv_reg_comp);
> -}
> -
> -/*
> - * This function will be called from FM V4L2 open function.
> - * Register with ST driver and initialize driver data.
> - */
> -int fmc_prepare(struct fmdev *fmdev)
> -{
> -	static struct st_proto_s fm_st_proto;
> -	int ret;
> -
> -	if (test_bit(FM_CORE_READY, &fmdev->flag)) {
> -		fmdbg("FM Core is already up\n");
> -		return 0;
> -	}
> -
> -	memset(&fm_st_proto, 0, sizeof(fm_st_proto));
> -	fm_st_proto.recv = fm_st_receive;
> -	fm_st_proto.match_packet = NULL;
> -	fm_st_proto.reg_complete_cb = fm_st_reg_comp_cb;
> -	fm_st_proto.write = NULL; /* TI ST driver will fill write pointer */
> -	fm_st_proto.priv_data = fmdev;
> -	fm_st_proto.chnl_id = 0x08;
> -	fm_st_proto.max_frame_size = 0xff;
> -	fm_st_proto.hdr_len = 1;
> -	fm_st_proto.offset_len_in_hdr = 0;
> -	fm_st_proto.len_size = 1;
> -	fm_st_proto.reserve = 1;
> -
> -	ret = st_register(&fm_st_proto);
> -	if (ret == -EINPROGRESS) {
> -		init_completion(&wait_for_fmdrv_reg_comp);
> -		fmdev->streg_cbdata = -EINPROGRESS;
> -		fmdbg("%s waiting for ST reg completion signal\n", __func__);
> -
> -		if (!wait_for_completion_timeout(&wait_for_fmdrv_reg_comp,
> -						 FM_ST_REG_TIMEOUT)) {
> -			fmerr("Timeout(%d sec), didn't get reg completion signal from ST\n",
> -					jiffies_to_msecs(FM_ST_REG_TIMEOUT) / 1000);
> -			return -ETIMEDOUT;
> -		}
> -		if (fmdev->streg_cbdata != 0) {
> -			fmerr("ST reg comp CB called with error status %d\n",
> -			      fmdev->streg_cbdata);
> -			return -EAGAIN;
> -		}
> -
> -		ret = 0;
> -	} else if (ret < 0) {
> -		fmerr("st_register failed %d\n", ret);
> -		return -EAGAIN;
> -	}
> -
> -	if (fm_st_proto.write != NULL) {
> -		g_st_write = fm_st_proto.write;
> -	} else {
> -		fmerr("Failed to get ST write func pointer\n");
> -		ret = st_unregister(&fm_st_proto);
> -		if (ret < 0)
> -			fmerr("st_unregister failed %d\n", ret);
> -		return -EAGAIN;
> -	}
> -
> -	spin_lock_init(&fmdev->rds_buff_lock);
> -	spin_lock_init(&fmdev->resp_skb_lock);
> -
> -	/* Initialize TX queue and TX bh work */
> -	skb_queue_head_init(&fmdev->tx_q);
> -	INIT_WORK(&fmdev->tx_bh_work, send_bh_work);
> -
> -	/* Initialize RX Queue and RX bh work */
> -	skb_queue_head_init(&fmdev->rx_q);
> -	INIT_WORK(&fmdev->rx_bh_work, recv_bh_work);
> -
> -	fmdev->irq_info.stage = 0;
> -	atomic_set(&fmdev->tx_cnt, 1);
> -	fmdev->resp_comp = NULL;
> -
> -	timer_setup(&fmdev->irq_info.timer, int_timeout_handler, 0);
> -	/*TODO: add FM_STIC_EVENT later */
> -	fmdev->irq_info.mask = FM_MAL_EVENT;
> -
> -	/* Region info */
> -	fmdev->rx.region = region_configs[default_radio_region];
> -
> -	fmdev->rx.mute_mode = FM_MUTE_OFF;
> -	fmdev->rx.rf_depend_mute = FM_RX_RF_DEPENDENT_MUTE_OFF;
> -	fmdev->rx.rds.flag = FM_RDS_DISABLE;
> -	fmdev->rx.freq = FM_UNDEFINED_FREQ;
> -	fmdev->rx.rds_mode = FM_RDS_SYSTEM_RDS;
> -	fmdev->rx.af_mode = FM_RX_RDS_AF_SWITCH_MODE_OFF;
> -	fmdev->irq_info.retry = 0;
> -
> -	fm_rx_reset_rds_cache(fmdev);
> -	init_waitqueue_head(&fmdev->rx.rds.read_queue);
> -
> -	fm_rx_reset_station_info(fmdev);
> -	set_bit(FM_CORE_READY, &fmdev->flag);
> -
> -	return ret;
> -}
> -
> -/*
> - * This function will be called from FM V4L2 release function.
> - * Unregister from ST driver.
> - */
> -int fmc_release(struct fmdev *fmdev)
> -{
> -	static struct st_proto_s fm_st_proto;
> -	int ret;
> -
> -	if (!test_bit(FM_CORE_READY, &fmdev->flag)) {
> -		fmdbg("FM Core is already down\n");
> -		return 0;
> -	}
> -	/* Service pending read */
> -	wake_up_interruptible(&fmdev->rx.rds.read_queue);
> -
> -	cancel_work_sync(&fmdev->tx_bh_work);
> -	cancel_work_sync(&fmdev->rx_bh_work);
> -
> -	skb_queue_purge(&fmdev->tx_q);
> -	skb_queue_purge(&fmdev->rx_q);
> -
> -	fmdev->resp_comp = NULL;
> -	fmdev->rx.freq = 0;
> -
> -	memset(&fm_st_proto, 0, sizeof(fm_st_proto));
> -	fm_st_proto.chnl_id = 0x08;
> -
> -	ret = st_unregister(&fm_st_proto);
> -
> -	if (ret < 0)
> -		fmerr("Failed to de-register FM from ST %d\n", ret);
> -	else
> -		fmdbg("Successfully unregistered from ST\n");
> -
> -	clear_bit(FM_CORE_READY, &fmdev->flag);
> -	return ret;
> -}
> -
> -/*
> - * Module init function. Ask FM V4L module to register video device.
> - * Allocate memory for FM driver context and RX RDS buffer.
> - */
> -static int __init fm_drv_init(void)
> -{
> -	struct fmdev *fmdev = NULL;
> -	int ret = -ENOMEM;
> -
> -	fmdbg("FM driver version %s\n", FM_DRV_VERSION);
> -
> -	fmdev = kzalloc(sizeof(struct fmdev), GFP_KERNEL);
> -	if (NULL == fmdev) {
> -		fmerr("Can't allocate operation structure memory\n");
> -		return ret;
> -	}
> -	fmdev->rx.rds.buf_size = default_rds_buf * FM_RDS_BLK_SIZE;
> -	fmdev->rx.rds.buff = kzalloc(fmdev->rx.rds.buf_size, GFP_KERNEL);
> -	if (NULL == fmdev->rx.rds.buff) {
> -		fmerr("Can't allocate rds ring buffer\n");
> -		goto rel_dev;
> -	}
> -
> -	ret = fm_v4l2_init_video_device(fmdev, radio_nr);
> -	if (ret < 0)
> -		goto rel_rdsbuf;
> -
> -	fmdev->irq_info.handlers = int_handler_table;
> -	fmdev->curr_fmmode = FM_MODE_OFF;
> -	fmdev->tx_data.pwr_lvl = FM_PWR_LVL_DEF;
> -	fmdev->tx_data.preemph = FM_TX_PREEMPH_50US;
> -	return ret;
> -
> -rel_rdsbuf:
> -	kfree(fmdev->rx.rds.buff);
> -rel_dev:
> -	kfree(fmdev);
> -
> -	return ret;
> -}
> -
> -/* Module exit function. Ask FM V4L module to unregister video device */
> -static void __exit fm_drv_exit(void)
> -{
> -	struct fmdev *fmdev = NULL;
> -
> -	fmdev = fm_v4l2_deinit_video_device();
> -	if (fmdev != NULL) {
> -		kfree(fmdev->rx.rds.buff);
> -		kfree(fmdev);
> -	}
> -}
> -
> -module_init(fm_drv_init);
> -module_exit(fm_drv_exit);
> -
> -/* ------------- Module Info ------------- */
> -MODULE_AUTHOR("Manjunatha Halli <manjunatha_halli@ti.com>");
> -MODULE_DESCRIPTION("FM Driver for TI's Connectivity chip. " FM_DRV_VERSION);
> -MODULE_VERSION(FM_DRV_VERSION);
> -MODULE_LICENSE("GPL");
> diff --git a/drivers/media/radio/wl128x/fmdrv_common.h b/drivers/media/radio/wl128x/fmdrv_common.h
> deleted file mode 100644
> index 6a287eadae75..000000000000
> --- a/drivers/media/radio/wl128x/fmdrv_common.h
> +++ /dev/null
> @@ -1,389 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - *  FM Driver for Connectivity chip of Texas Instruments.
> - *  FM Common module header file
> - *
> - *  Copyright (C) 2011 Texas Instruments
> - */
> -
> -#ifndef _FMDRV_COMMON_H
> -#define _FMDRV_COMMON_H
> -
> -#define FM_ST_REG_TIMEOUT   msecs_to_jiffies(6000)	/* 6 sec */
> -#define FM_PKT_LOGICAL_CHAN_NUMBER  0x08   /* Logical channel 8 */
> -
> -#define REG_RD       0x1
> -#define REG_WR      0x0
> -
> -struct fm_reg_table {
> -	u8 opcode;
> -	u8 type;
> -	u8 *name;
> -};
> -
> -#define STEREO_GET               0
> -#define RSSI_LVL_GET             1
> -#define IF_COUNT_GET             2
> -#define FLAG_GET                 3
> -#define RDS_SYNC_GET             4
> -#define RDS_DATA_GET             5
> -#define FREQ_SET                 10
> -#define AF_FREQ_SET              11
> -#define MOST_MODE_SET            12
> -#define MOST_BLEND_SET           13
> -#define DEMPH_MODE_SET           14
> -#define SEARCH_LVL_SET           15
> -#define BAND_SET                 16
> -#define MUTE_STATUS_SET          17
> -#define RDS_PAUSE_LVL_SET        18
> -#define RDS_PAUSE_DUR_SET        19
> -#define RDS_MEM_SET              20
> -#define RDS_BLK_B_SET            21
> -#define RDS_MSK_B_SET            22
> -#define RDS_PI_MASK_SET          23
> -#define RDS_PI_SET               24
> -#define RDS_SYSTEM_SET           25
> -#define INT_MASK_SET             26
> -#define SEARCH_DIR_SET           27
> -#define VOLUME_SET               28
> -#define AUDIO_ENABLE_SET         29
> -#define PCM_MODE_SET             30
> -#define I2S_MODE_CONFIG_SET      31
> -#define POWER_SET                32
> -#define INTX_CONFIG_SET          33
> -#define PULL_EN_SET              34
> -#define HILO_SET                 35
> -#define SWITCH2FREF              36
> -#define FREQ_DRIFT_REPORT        37
> -
> -#define PCE_GET                  40
> -#define FIRM_VER_GET             41
> -#define ASIC_VER_GET             42
> -#define ASIC_ID_GET              43
> -#define MAN_ID_GET               44
> -#define TUNER_MODE_SET           45
> -#define STOP_SEARCH              46
> -#define RDS_CNTRL_SET            47
> -
> -#define WRITE_HARDWARE_REG       100
> -#define CODE_DOWNLOAD            101
> -#define RESET                    102
> -
> -#define FM_POWER_MODE            254
> -#define FM_INTERRUPT             255
> -
> -/* Transmitter API */
> -
> -#define CHANL_SET                55
> -#define CHANL_BW_SET		56
> -#define REF_SET                  57
> -#define POWER_ENB_SET            90
> -#define POWER_ATT_SET            58
> -#define POWER_LEV_SET            59
> -#define AUDIO_DEV_SET            60
> -#define PILOT_DEV_SET            61
> -#define RDS_DEV_SET              62
> -#define TX_BAND_SET              65
> -#define PUPD_SET                 91
> -#define AUDIO_IO_SET             63
> -#define PREMPH_SET               64
> -#define MONO_SET                 66
> -#define MUTE                     92
> -#define MPX_LMT_ENABLE           67
> -#define PI_SET                   93
> -#define ECC_SET                  69
> -#define PTY                      70
> -#define AF                       71
> -#define DISPLAY_MODE             74
> -#define RDS_REP_SET              77
> -#define RDS_CONFIG_DATA_SET      98
> -#define RDS_DATA_SET             99
> -#define RDS_DATA_ENB             94
> -#define TA_SET                   78
> -#define TP_SET                   79
> -#define DI_SET                   80
> -#define MS_SET                   81
> -#define PS_SCROLL_SPEED          82
> -#define TX_AUDIO_LEVEL_TEST      96
> -#define TX_AUDIO_LEVEL_TEST_THRESHOLD    73
> -#define TX_AUDIO_INPUT_LEVEL_RANGE_SET   54
> -#define RX_ANTENNA_SELECT        87
> -#define I2C_DEV_ADDR_SET         86
> -#define REF_ERR_CALIB_PARAM_SET          88
> -#define REF_ERR_CALIB_PERIODICITY_SET    89
> -#define SOC_INT_TRIGGER                  52
> -#define SOC_AUDIO_PATH_SET               83
> -#define SOC_PCMI_OVERRIDE                84
> -#define SOC_I2S_OVERRIDE         85
> -#define RSSI_BLOCK_SCAN_FREQ_SET 95
> -#define RSSI_BLOCK_SCAN_START    97
> -#define RSSI_BLOCK_SCAN_DATA_GET  5
> -#define READ_FMANT_TUNE_VALUE            104
> -
> -/* SKB helpers */
> -struct fm_skb_cb {
> -	__u8 fm_op;
> -	struct completion *completion;
> -};
> -
> -#define fm_cb(skb) ((struct fm_skb_cb *)(skb->cb))
> -
> -/* FM Channel-8 command message format */
> -struct fm_cmd_msg_hdr {
> -	__u8 hdr;		/* Logical Channel-8 */
> -	__u8 len;		/* Number of bytes follows */
> -	__u8 op;		/* FM Opcode */
> -	__u8 rd_wr;		/* Read/Write command */
> -	__u8 dlen;		/* Length of payload */
> -} __attribute__ ((packed));
> -
> -#define FM_CMD_MSG_HDR_SIZE    5	/* sizeof(struct fm_cmd_msg_hdr) */
> -
> -/* FM Channel-8 event messgage format */
> -struct fm_event_msg_hdr {
> -	__u8 header;		/* Logical Channel-8 */
> -	__u8 len;		/* Number of bytes follows */
> -	__u8 status;		/* Event status */
> -	__u8 num_fm_hci_cmds;	/* Number of pkts the host allowed to send */
> -	__u8 op;		/* FM Opcode */
> -	__u8 rd_wr;		/* Read/Write command */
> -	__u8 dlen;		/* Length of payload */
> -} __attribute__ ((packed));
> -
> -#define FM_EVT_MSG_HDR_SIZE     7	/* sizeof(struct fm_event_msg_hdr) */
> -
> -/* TI's magic number in firmware file */
> -#define FM_FW_FILE_HEADER_MAGIC	     0x42535442
> -
> -#define FM_ENABLE   1
> -#define FM_DISABLE  0
> -
> -/* FLAG_GET register bits */
> -#define FM_FR_EVENT		BIT(0)
> -#define FM_BL_EVENT		BIT(1)
> -#define FM_RDS_EVENT		BIT(2)
> -#define FM_BBLK_EVENT		BIT(3)
> -#define FM_LSYNC_EVENT		BIT(4)
> -#define FM_LEV_EVENT		BIT(5)
> -#define FM_IFFR_EVENT		BIT(6)
> -#define FM_PI_EVENT		BIT(7)
> -#define FM_PD_EVENT		BIT(8)
> -#define FM_STIC_EVENT		BIT(9)
> -#define FM_MAL_EVENT		BIT(10)
> -#define FM_POW_ENB_EVENT	BIT(11)
> -
> -/*
> - * Firmware files of FM. ASIC ID and ASIC version will be appened to this,
> - * later.
> - */
> -#define FM_FMC_FW_FILE_START      ("fmc_ch8")
> -#define FM_RX_FW_FILE_START       ("fm_rx_ch8")
> -#define FM_TX_FW_FILE_START       ("fm_tx_ch8")
> -
> -#define FM_UNDEFINED_FREQ		   0xFFFFFFFF
> -
> -/* Band types */
> -#define FM_BAND_EUROPE_US	0
> -#define FM_BAND_JAPAN		1
> -
> -/* Seek directions */
> -#define FM_SEARCH_DIRECTION_DOWN	0
> -#define FM_SEARCH_DIRECTION_UP		1
> -
> -/* Tunner modes */
> -#define FM_TUNER_STOP_SEARCH_MODE	0
> -#define FM_TUNER_PRESET_MODE		1
> -#define FM_TUNER_AUTONOMOUS_SEARCH_MODE	2
> -#define FM_TUNER_AF_JUMP_MODE		3
> -
> -/* Min and Max volume */
> -#define FM_RX_VOLUME_MIN	0
> -#define FM_RX_VOLUME_MAX	70
> -
> -/* Volume gain step */
> -#define FM_RX_VOLUME_GAIN_STEP	0x370
> -
> -/* Mute modes */
> -#define	FM_MUTE_ON		0
> -#define FM_MUTE_OFF		1
> -#define	FM_MUTE_ATTENUATE	2
> -
> -#define FM_RX_UNMUTE_MODE		0x00
> -#define FM_RX_RF_DEP_MODE		0x01
> -#define FM_RX_AC_MUTE_MODE		0x02
> -#define FM_RX_HARD_MUTE_LEFT_MODE	0x04
> -#define FM_RX_HARD_MUTE_RIGHT_MODE	0x08
> -#define FM_RX_SOFT_MUTE_FORCE_MODE	0x10
> -
> -/* RF dependent mute mode */
> -#define FM_RX_RF_DEPENDENT_MUTE_ON	1
> -#define FM_RX_RF_DEPENDENT_MUTE_OFF	0
> -
> -/* RSSI threshold min and max */
> -#define FM_RX_RSSI_THRESHOLD_MIN	-128
> -#define FM_RX_RSSI_THRESHOLD_MAX	127
> -
> -/* Stereo/Mono mode */
> -#define FM_STEREO_MODE		0
> -#define FM_MONO_MODE		1
> -#define FM_STEREO_SOFT_BLEND	1
> -
> -/* FM RX De-emphasis filter modes */
> -#define FM_RX_EMPHASIS_FILTER_50_USEC	0
> -#define FM_RX_EMPHASIS_FILTER_75_USEC	1
> -
> -/* FM RDS modes */
> -#define FM_RDS_DISABLE	0
> -#define FM_RDS_ENABLE	1
> -
> -#define FM_NO_PI_CODE	0
> -
> -/* FM and RX RDS block enable/disable  */
> -#define FM_RX_PWR_SET_FM_ON_RDS_OFF		0x1
> -#define FM_RX_PWR_SET_FM_AND_RDS_BLK_ON		0x3
> -#define FM_RX_PWR_SET_FM_AND_RDS_BLK_OFF	0x0
> -
> -/* RX RDS */
> -#define FM_RX_RDS_FLUSH_FIFO		0x1
> -#define FM_RX_RDS_FIFO_THRESHOLD	64	/* tuples */
> -#define FM_RDS_BLK_SIZE		3	/* 3 bytes */
> -
> -/* RDS block types */
> -#define FM_RDS_BLOCK_A		0
> -#define FM_RDS_BLOCK_B		1
> -#define FM_RDS_BLOCK_C		2
> -#define FM_RDS_BLOCK_Ctag	3
> -#define FM_RDS_BLOCK_D		4
> -#define FM_RDS_BLOCK_E		5
> -
> -#define FM_RDS_BLK_IDX_A		0
> -#define FM_RDS_BLK_IDX_B		1
> -#define FM_RDS_BLK_IDX_C		2
> -#define FM_RDS_BLK_IDX_D		3
> -#define FM_RDS_BLK_IDX_UNKNOWN	0xF0
> -
> -#define FM_RDS_STATUS_ERR_MASK	0x18
> -
> -/*
> - * Represents an RDS group type & version.
> - * There are 15 groups, each group has 2 versions: A and B.
> - */
> -#define FM_RDS_GROUP_TYPE_MASK_0A	    BIT(0)
> -#define FM_RDS_GROUP_TYPE_MASK_0B	    BIT(1)
> -#define FM_RDS_GROUP_TYPE_MASK_1A	    BIT(2)
> -#define FM_RDS_GROUP_TYPE_MASK_1B	    BIT(3)
> -#define FM_RDS_GROUP_TYPE_MASK_2A	    BIT(4)
> -#define FM_RDS_GROUP_TYPE_MASK_2B	    BIT(5)
> -#define FM_RDS_GROUP_TYPE_MASK_3A	    BIT(6)
> -#define FM_RDS_GROUP_TYPE_MASK_3B	    BIT(7)
> -#define FM_RDS_GROUP_TYPE_MASK_4A	    BIT(8)
> -#define FM_RDS_GROUP_TYPE_MASK_4B	    BIT(9)
> -#define FM_RDS_GROUP_TYPE_MASK_5A	    BIT(10)
> -#define FM_RDS_GROUP_TYPE_MASK_5B	    BIT(11)
> -#define FM_RDS_GROUP_TYPE_MASK_6A	    BIT(12)
> -#define FM_RDS_GROUP_TYPE_MASK_6B	    BIT(13)
> -#define FM_RDS_GROUP_TYPE_MASK_7A	    BIT(14)
> -#define FM_RDS_GROUP_TYPE_MASK_7B	    BIT(15)
> -#define FM_RDS_GROUP_TYPE_MASK_8A	    BIT(16)
> -#define FM_RDS_GROUP_TYPE_MASK_8B	    BIT(17)
> -#define FM_RDS_GROUP_TYPE_MASK_9A	    BIT(18)
> -#define FM_RDS_GROUP_TYPE_MASK_9B	    BIT(19)
> -#define FM_RDS_GROUP_TYPE_MASK_10A	    BIT(20)
> -#define FM_RDS_GROUP_TYPE_MASK_10B	    BIT(21)
> -#define FM_RDS_GROUP_TYPE_MASK_11A	    BIT(22)
> -#define FM_RDS_GROUP_TYPE_MASK_11B	    BIT(23)
> -#define FM_RDS_GROUP_TYPE_MASK_12A	    BIT(24)
> -#define FM_RDS_GROUP_TYPE_MASK_12B	    BIT(25)
> -#define FM_RDS_GROUP_TYPE_MASK_13A	    BIT(26)
> -#define FM_RDS_GROUP_TYPE_MASK_13B	    BIT(27)
> -#define FM_RDS_GROUP_TYPE_MASK_14A	    BIT(28)
> -#define FM_RDS_GROUP_TYPE_MASK_14B	    BIT(29)
> -#define FM_RDS_GROUP_TYPE_MASK_15A	    BIT(30)
> -#define FM_RDS_GROUP_TYPE_MASK_15B	    BIT(31)
> -
> -/* RX Alternate Frequency info */
> -#define FM_RDS_MIN_AF			  1
> -#define FM_RDS_MAX_AF			204
> -#define FM_RDS_MAX_AF_JAPAN		140
> -#define FM_RDS_1_AF_FOLLOWS		225
> -#define FM_RDS_25_AF_FOLLOWS		249
> -
> -/* RDS system type (RDS/RBDS) */
> -#define FM_RDS_SYSTEM_RDS		0
> -#define FM_RDS_SYSTEM_RBDS		1
> -
> -/* AF on/off */
> -#define FM_RX_RDS_AF_SWITCH_MODE_ON	1
> -#define FM_RX_RDS_AF_SWITCH_MODE_OFF	0
> -
> -/* Retry count when interrupt process goes wrong */
> -#define FM_IRQ_TIMEOUT_RETRY_MAX	5	/* 5 times */
> -
> -/* Audio IO set values */
> -#define FM_RX_AUDIO_ENABLE_I2S	0x01
> -#define FM_RX_AUDIO_ENABLE_ANALOG	0x02
> -#define FM_RX_AUDIO_ENABLE_I2S_AND_ANALOG	0x03
> -#define FM_RX_AUDIO_ENABLE_DISABLE	0x00
> -
> -/* HI/LO set values */
> -#define FM_RX_IFFREQ_TO_HI_SIDE		0x0
> -#define FM_RX_IFFREQ_TO_LO_SIDE		0x1
> -#define FM_RX_IFFREQ_HILO_AUTOMATIC	0x2
> -
> -/*
> - * Default RX mode configuration. Chip will be configured
> - * with this default values after loading RX firmware.
> - */
> -#define FM_DEFAULT_RX_VOLUME		10
> -#define FM_DEFAULT_RSSI_THRESHOLD	3
> -
> -/* Range for TX power level in units for dB/uV */
> -#define FM_PWR_LVL_LOW			91
> -#define FM_PWR_LVL_HIGH			122
> -
> -/* Chip specific default TX power level value */
> -#define FM_PWR_LVL_DEF			4
> -
> -/* FM TX Pre-emphasis filter values */
> -#define FM_TX_PREEMPH_OFF		1
> -#define FM_TX_PREEMPH_50US		0
> -#define FM_TX_PREEMPH_75US		2
> -
> -/* FM TX antenna impedance values */
> -#define FM_TX_ANT_IMP_50		0
> -#define FM_TX_ANT_IMP_200		1
> -#define FM_TX_ANT_IMP_500		2
> -
> -/* Functions exported by FM common sub-module */
> -int fmc_prepare(struct fmdev *);
> -int fmc_release(struct fmdev *);
> -
> -void fmc_update_region_info(struct fmdev *, u8);
> -int fmc_send_cmd(struct fmdev *, u8, u16,
> -				void *, unsigned int, void *, int *);
> -int fmc_is_rds_data_available(struct fmdev *, struct file *,
> -				struct poll_table_struct *);
> -int fmc_transfer_rds_from_internal_buff(struct fmdev *, struct file *,
> -					u8 __user *, size_t);
> -
> -int fmc_set_freq(struct fmdev *, u32);
> -int fmc_set_mode(struct fmdev *, u8);
> -int fmc_set_region(struct fmdev *, u8);
> -int fmc_set_mute_mode(struct fmdev *, u8);
> -int fmc_set_stereo_mono(struct fmdev *, u16);
> -int fmc_set_rds_mode(struct fmdev *, u8);
> -
> -int fmc_get_freq(struct fmdev *, u32 *);
> -int fmc_get_region(struct fmdev *, u8 *);
> -int fmc_get_mode(struct fmdev *, u8 *);
> -
> -/*
> - * channel spacing
> - */
> -#define FM_CHANNEL_SPACING_50KHZ 1
> -#define FM_CHANNEL_SPACING_100KHZ 2
> -#define FM_CHANNEL_SPACING_200KHZ 4
> -#define FM_FREQ_MUL 50
> -
> -#endif
> -
> diff --git a/drivers/media/radio/wl128x/fmdrv_rx.c b/drivers/media/radio/wl128x/fmdrv_rx.c
> deleted file mode 100644
> index 419cf2e03bcf..000000000000
> --- a/drivers/media/radio/wl128x/fmdrv_rx.c
> +++ /dev/null
> @@ -1,820 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - *  FM Driver for Connectivity chip of Texas Instruments.
> - *  This sub-module of FM driver implements FM RX functionality.
> - *
> - *  Copyright (C) 2011 Texas Instruments
> - *  Author: Raja Mani <raja_mani@ti.com>
> - *  Author: Manjunatha Halli <manjunatha_halli@ti.com>
> - */
> -
> -#include "fmdrv.h"
> -#include "fmdrv_common.h"
> -#include "fmdrv_rx.h"
> -
> -void fm_rx_reset_rds_cache(struct fmdev *fmdev)
> -{
> -	fmdev->rx.rds.flag = FM_RDS_DISABLE;
> -	fmdev->rx.rds.last_blk_idx = 0;
> -	fmdev->rx.rds.wr_idx = 0;
> -	fmdev->rx.rds.rd_idx = 0;
> -
> -	if (fmdev->rx.af_mode == FM_RX_RDS_AF_SWITCH_MODE_ON)
> -		fmdev->irq_info.mask |= FM_LEV_EVENT;
> -}
> -
> -void fm_rx_reset_station_info(struct fmdev *fmdev)
> -{
> -	fmdev->rx.stat_info.picode = FM_NO_PI_CODE;
> -	fmdev->rx.stat_info.afcache_size = 0;
> -	fmdev->rx.stat_info.af_list_max = 0;
> -}
> -
> -int fm_rx_set_freq(struct fmdev *fmdev, u32 freq)
> -{
> -	unsigned long timeleft;
> -	u16 payload, curr_frq, intr_flag;
> -	u32 curr_frq_in_khz;
> -	u32 resp_len;
> -	int ret;
> -
> -	if (freq < fmdev->rx.region.bot_freq || freq > fmdev->rx.region.top_freq) {
> -		fmerr("Invalid frequency %d\n", freq);
> -		return -EINVAL;
> -	}
> -
> -	/* Set audio enable */
> -	payload = FM_RX_AUDIO_ENABLE_I2S_AND_ANALOG;
> -
> -	ret = fmc_send_cmd(fmdev, AUDIO_ENABLE_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Set hilo to automatic selection */
> -	payload = FM_RX_IFFREQ_HILO_AUTOMATIC;
> -	ret = fmc_send_cmd(fmdev, HILO_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Calculate frequency index and set*/
> -	payload = (freq - fmdev->rx.region.bot_freq) / FM_FREQ_MUL;
> -
> -	ret = fmc_send_cmd(fmdev, FREQ_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Read flags - just to clear any pending interrupts if we had */
> -	ret = fmc_send_cmd(fmdev, FLAG_GET, REG_RD, NULL, 2, NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Enable FR, BL interrupts */
> -	intr_flag = fmdev->irq_info.mask;
> -	fmdev->irq_info.mask = (FM_FR_EVENT | FM_BL_EVENT);
> -	payload = fmdev->irq_info.mask;
> -	ret = fmc_send_cmd(fmdev, INT_MASK_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Start tune */
> -	payload = FM_TUNER_PRESET_MODE;
> -	ret = fmc_send_cmd(fmdev, TUNER_MODE_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		goto exit;
> -
> -	/* Wait for tune ended interrupt */
> -	init_completion(&fmdev->maintask_comp);
> -	timeleft = wait_for_completion_timeout(&fmdev->maintask_comp,
> -			FM_DRV_TX_TIMEOUT);
> -	if (!timeleft) {
> -		fmerr("Timeout(%d sec),didn't get tune ended int\n",
> -			   jiffies_to_msecs(FM_DRV_TX_TIMEOUT) / 1000);
> -		ret = -ETIMEDOUT;
> -		goto exit;
> -	}
> -
> -	/* Read freq back to confirm */
> -	ret = fmc_send_cmd(fmdev, FREQ_SET, REG_RD, NULL, 2, &curr_frq, &resp_len);
> -	if (ret < 0)
> -		goto exit;
> -
> -	curr_frq = be16_to_cpu((__force __be16)curr_frq);
> -	curr_frq_in_khz = (fmdev->rx.region.bot_freq + ((u32)curr_frq * FM_FREQ_MUL));
> -
> -	if (curr_frq_in_khz != freq) {
> -		pr_info("Frequency is set to (%d) but requested freq is (%d)\n",
> -			curr_frq_in_khz, freq);
> -	}
> -
> -	/* Update local cache  */
> -	fmdev->rx.freq = curr_frq_in_khz;
> -exit:
> -	/* Re-enable default FM interrupts */
> -	fmdev->irq_info.mask = intr_flag;
> -	payload = fmdev->irq_info.mask;
> -	ret = fmc_send_cmd(fmdev, INT_MASK_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Reset RDS cache and current station pointers */
> -	fm_rx_reset_rds_cache(fmdev);
> -	fm_rx_reset_station_info(fmdev);
> -
> -	return ret;
> -}
> -
> -static int fm_rx_set_channel_spacing(struct fmdev *fmdev, u32 spacing)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	if (spacing > 0 && spacing <= 50000)
> -		spacing = FM_CHANNEL_SPACING_50KHZ;
> -	else if (spacing > 50000 && spacing <= 100000)
> -		spacing = FM_CHANNEL_SPACING_100KHZ;
> -	else
> -		spacing = FM_CHANNEL_SPACING_200KHZ;
> -
> -	/* set channel spacing */
> -	payload = spacing;
> -	ret = fmc_send_cmd(fmdev, CHANL_BW_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	fmdev->rx.region.chanl_space = spacing * FM_FREQ_MUL;
> -
> -	return ret;
> -}
> -
> -int fm_rx_seek(struct fmdev *fmdev, u32 seek_upward,
> -		u32 wrap_around, u32 spacing)
> -{
> -	u32 resp_len;
> -	u16 curr_frq, next_frq, last_frq;
> -	u16 payload, int_reason, intr_flag;
> -	u16 offset, space_idx;
> -	unsigned long timeleft;
> -	int ret;
> -
> -	/* Set channel spacing */
> -	ret = fm_rx_set_channel_spacing(fmdev, spacing);
> -	if (ret < 0) {
> -		fmerr("Failed to set channel spacing\n");
> -		return ret;
> -	}
> -
> -	/* Read the current frequency from chip */
> -	ret = fmc_send_cmd(fmdev, FREQ_SET, REG_RD, NULL,
> -			sizeof(curr_frq), &curr_frq, &resp_len);
> -	if (ret < 0)
> -		return ret;
> -
> -	curr_frq = be16_to_cpu((__force __be16)curr_frq);
> -	last_frq = (fmdev->rx.region.top_freq - fmdev->rx.region.bot_freq) / FM_FREQ_MUL;
> -
> -	/* Check the offset in order to be aligned to the channel spacing*/
> -	space_idx = fmdev->rx.region.chanl_space / FM_FREQ_MUL;
> -	offset = curr_frq % space_idx;
> -
> -	next_frq = seek_upward ? curr_frq + space_idx /* Seek Up */ :
> -				curr_frq - space_idx /* Seek Down */ ;
> -
> -	/*
> -	 * Add or subtract offset in order to stay aligned to the channel
> -	 * spacing.
> -	 */
> -	if ((short)next_frq < 0)
> -		next_frq = last_frq - offset;
> -	else if (next_frq > last_frq)
> -		next_frq = 0 + offset;
> -
> -again:
> -	/* Set calculated next frequency to perform seek */
> -	payload = next_frq;
> -	ret = fmc_send_cmd(fmdev, FREQ_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Set search direction (0:Seek Down, 1:Seek Up) */
> -	payload = (seek_upward ? FM_SEARCH_DIRECTION_UP : FM_SEARCH_DIRECTION_DOWN);
> -	ret = fmc_send_cmd(fmdev, SEARCH_DIR_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Read flags - just to clear any pending interrupts if we had */
> -	ret = fmc_send_cmd(fmdev, FLAG_GET, REG_RD, NULL, 2, NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Enable FR, BL interrupts */
> -	intr_flag = fmdev->irq_info.mask;
> -	fmdev->irq_info.mask = (FM_FR_EVENT | FM_BL_EVENT);
> -	payload = fmdev->irq_info.mask;
> -	ret = fmc_send_cmd(fmdev, INT_MASK_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Start seek */
> -	payload = FM_TUNER_AUTONOMOUS_SEARCH_MODE;
> -	ret = fmc_send_cmd(fmdev, TUNER_MODE_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Wait for tune ended/band limit reached interrupt */
> -	init_completion(&fmdev->maintask_comp);
> -	timeleft = wait_for_completion_timeout(&fmdev->maintask_comp,
> -			FM_DRV_RX_SEEK_TIMEOUT);
> -	if (!timeleft) {
> -		fmerr("Timeout(%d sec),didn't get tune ended int\n",
> -			   jiffies_to_msecs(FM_DRV_RX_SEEK_TIMEOUT) / 1000);
> -		return -ENODATA;
> -	}
> -
> -	int_reason = fmdev->irq_info.flag & (FM_TUNE_COMPLETE | FM_BAND_LIMIT);
> -
> -	/* Re-enable default FM interrupts */
> -	fmdev->irq_info.mask = intr_flag;
> -	payload = fmdev->irq_info.mask;
> -	ret = fmc_send_cmd(fmdev, INT_MASK_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (int_reason & FM_BL_EVENT) {
> -		if (wrap_around == 0) {
> -			fmdev->rx.freq = seek_upward ?
> -				fmdev->rx.region.top_freq :
> -				fmdev->rx.region.bot_freq;
> -		} else {
> -			fmdev->rx.freq = seek_upward ?
> -				fmdev->rx.region.bot_freq :
> -				fmdev->rx.region.top_freq;
> -			/* Calculate frequency index to write */
> -			next_frq = (fmdev->rx.freq -
> -					fmdev->rx.region.bot_freq) / FM_FREQ_MUL;
> -			goto again;
> -		}
> -	} else {
> -		/* Read freq to know where operation tune operation stopped */
> -		ret = fmc_send_cmd(fmdev, FREQ_SET, REG_RD, NULL, 2,
> -				&curr_frq, &resp_len);
> -		if (ret < 0)
> -			return ret;
> -
> -		curr_frq = be16_to_cpu((__force __be16)curr_frq);
> -		fmdev->rx.freq = (fmdev->rx.region.bot_freq +
> -				((u32)curr_frq * FM_FREQ_MUL));
> -
> -	}
> -	/* Reset RDS cache and current station pointers */
> -	fm_rx_reset_rds_cache(fmdev);
> -	fm_rx_reset_station_info(fmdev);
> -
> -	return ret;
> -}
> -
> -int fm_rx_set_volume(struct fmdev *fmdev, u16 vol_to_set)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_RX)
> -		return -EPERM;
> -
> -	if (vol_to_set > FM_RX_VOLUME_MAX) {
> -		fmerr("Volume is not within(%d-%d) range\n",
> -			   FM_RX_VOLUME_MIN, FM_RX_VOLUME_MAX);
> -		return -EINVAL;
> -	}
> -	vol_to_set *= FM_RX_VOLUME_GAIN_STEP;
> -
> -	payload = vol_to_set;
> -	ret = fmc_send_cmd(fmdev, VOLUME_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	fmdev->rx.volume = vol_to_set;
> -	return ret;
> -}
> -
> -/* Get volume */
> -int fm_rx_get_volume(struct fmdev *fmdev, u16 *curr_vol)
> -{
> -	if (fmdev->curr_fmmode != FM_MODE_RX)
> -		return -EPERM;
> -
> -	if (curr_vol == NULL) {
> -		fmerr("Invalid memory\n");
> -		return -ENOMEM;
> -	}
> -
> -	*curr_vol = fmdev->rx.volume / FM_RX_VOLUME_GAIN_STEP;
> -
> -	return 0;
> -}
> -
> -/* To get current band's bottom and top frequency */
> -int fm_rx_get_band_freq_range(struct fmdev *fmdev, u32 *bot_freq, u32 *top_freq)
> -{
> -	if (bot_freq != NULL)
> -		*bot_freq = fmdev->rx.region.bot_freq;
> -
> -	if (top_freq != NULL)
> -		*top_freq = fmdev->rx.region.top_freq;
> -
> -	return 0;
> -}
> -
> -/* Returns current band index (0-Europe/US; 1-Japan) */
> -void fm_rx_get_region(struct fmdev *fmdev, u8 *region)
> -{
> -	*region = fmdev->rx.region.fm_band;
> -}
> -
> -/* Sets band (0-Europe/US; 1-Japan) */
> -int fm_rx_set_region(struct fmdev *fmdev, u8 region_to_set)
> -{
> -	u16 payload;
> -	u32 new_frq = 0;
> -	int ret;
> -
> -	if (region_to_set != FM_BAND_EUROPE_US &&
> -	    region_to_set != FM_BAND_JAPAN) {
> -		fmerr("Invalid band\n");
> -		return -EINVAL;
> -	}
> -
> -	if (fmdev->rx.region.fm_band == region_to_set) {
> -		fmerr("Requested band is already configured\n");
> -		return 0;
> -	}
> -
> -	/* Send cmd to set the band  */
> -	payload = (u16)region_to_set;
> -	ret = fmc_send_cmd(fmdev, BAND_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	fmc_update_region_info(fmdev, region_to_set);
> -
> -	/* Check whether current RX frequency is within band boundary */
> -	if (fmdev->rx.freq < fmdev->rx.region.bot_freq)
> -		new_frq = fmdev->rx.region.bot_freq;
> -	else if (fmdev->rx.freq > fmdev->rx.region.top_freq)
> -		new_frq = fmdev->rx.region.top_freq;
> -
> -	if (new_frq) {
> -		fmdbg("Current freq is not within band limit boundary,switching to %d KHz\n",
> -		      new_frq);
> -		 /* Current RX frequency is not in range. So, update it */
> -		ret = fm_rx_set_freq(fmdev, new_frq);
> -	}
> -
> -	return ret;
> -}
> -
> -/* Reads current mute mode (Mute Off/On/Attenuate)*/
> -int fm_rx_get_mute_mode(struct fmdev *fmdev, u8 *curr_mute_mode)
> -{
> -	if (fmdev->curr_fmmode != FM_MODE_RX)
> -		return -EPERM;
> -
> -	if (curr_mute_mode == NULL) {
> -		fmerr("Invalid memory\n");
> -		return -ENOMEM;
> -	}
> -
> -	*curr_mute_mode = fmdev->rx.mute_mode;
> -
> -	return 0;
> -}
> -
> -static int fm_config_rx_mute_reg(struct fmdev *fmdev)
> -{
> -	u16 payload, muteval;
> -	int ret;
> -
> -	muteval = 0;
> -	switch (fmdev->rx.mute_mode) {
> -	case FM_MUTE_ON:
> -		muteval = FM_RX_AC_MUTE_MODE;
> -		break;
> -
> -	case FM_MUTE_OFF:
> -		muteval = FM_RX_UNMUTE_MODE;
> -		break;
> -
> -	case FM_MUTE_ATTENUATE:
> -		muteval = FM_RX_SOFT_MUTE_FORCE_MODE;
> -		break;
> -	}
> -	if (fmdev->rx.rf_depend_mute == FM_RX_RF_DEPENDENT_MUTE_ON)
> -		muteval |= FM_RX_RF_DEP_MODE;
> -	else
> -		muteval &= ~FM_RX_RF_DEP_MODE;
> -
> -	payload = muteval;
> -	ret = fmc_send_cmd(fmdev, MUTE_STATUS_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> -}
> -
> -/* Configures mute mode (Mute Off/On/Attenuate) */
> -int fm_rx_set_mute_mode(struct fmdev *fmdev, u8 mute_mode_toset)
> -{
> -	u8 org_state;
> -	int ret;
> -
> -	if (fmdev->rx.mute_mode == mute_mode_toset)
> -		return 0;
> -
> -	org_state = fmdev->rx.mute_mode;
> -	fmdev->rx.mute_mode = mute_mode_toset;
> -
> -	ret = fm_config_rx_mute_reg(fmdev);
> -	if (ret < 0) {
> -		fmdev->rx.mute_mode = org_state;
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -/* Gets RF dependent soft mute mode enable/disable status */
> -int fm_rx_get_rfdepend_softmute(struct fmdev *fmdev, u8 *curr_mute_mode)
> -{
> -	if (fmdev->curr_fmmode != FM_MODE_RX)
> -		return -EPERM;
> -
> -	if (curr_mute_mode == NULL) {
> -		fmerr("Invalid memory\n");
> -		return -ENOMEM;
> -	}
> -
> -	*curr_mute_mode = fmdev->rx.rf_depend_mute;
> -
> -	return 0;
> -}
> -
> -/* Sets RF dependent soft mute mode */
> -int fm_rx_set_rfdepend_softmute(struct fmdev *fmdev, u8 rfdepend_mute)
> -{
> -	u8 org_state;
> -	int ret;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_RX)
> -		return -EPERM;
> -
> -	if (rfdepend_mute != FM_RX_RF_DEPENDENT_MUTE_ON &&
> -	    rfdepend_mute != FM_RX_RF_DEPENDENT_MUTE_OFF) {
> -		fmerr("Invalid RF dependent soft mute\n");
> -		return -EINVAL;
> -	}
> -	if (fmdev->rx.rf_depend_mute == rfdepend_mute)
> -		return 0;
> -
> -	org_state = fmdev->rx.rf_depend_mute;
> -	fmdev->rx.rf_depend_mute = rfdepend_mute;
> -
> -	ret = fm_config_rx_mute_reg(fmdev);
> -	if (ret < 0) {
> -		fmdev->rx.rf_depend_mute = org_state;
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -/* Returns the signal strength level of current channel */
> -int fm_rx_get_rssi_level(struct fmdev *fmdev, u16 *rssilvl)
> -{
> -	__be16 curr_rssi_lel;
> -	u32 resp_len;
> -	int ret;
> -
> -	if (rssilvl == NULL) {
> -		fmerr("Invalid memory\n");
> -		return -ENOMEM;
> -	}
> -	/* Read current RSSI level */
> -	ret = fmc_send_cmd(fmdev, RSSI_LVL_GET, REG_RD, NULL, 2,
> -			&curr_rssi_lel, &resp_len);
> -	if (ret < 0)
> -		return ret;
> -
> -	*rssilvl = be16_to_cpu(curr_rssi_lel);
> -
> -	return 0;
> -}
> -
> -/*
> - * Sets the signal strength level that once reached
> - * will stop the auto search process
> - */
> -int fm_rx_set_rssi_threshold(struct fmdev *fmdev, short rssi_lvl_toset)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	if (rssi_lvl_toset < FM_RX_RSSI_THRESHOLD_MIN ||
> -			rssi_lvl_toset > FM_RX_RSSI_THRESHOLD_MAX) {
> -		fmerr("Invalid RSSI threshold level\n");
> -		return -EINVAL;
> -	}
> -	payload = (u16)rssi_lvl_toset;
> -	ret = fmc_send_cmd(fmdev, SEARCH_LVL_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	fmdev->rx.rssi_threshold = rssi_lvl_toset;
> -
> -	return 0;
> -}
> -
> -/* Returns current RX RSSI threshold value */
> -int fm_rx_get_rssi_threshold(struct fmdev *fmdev, short *curr_rssi_lvl)
> -{
> -	if (fmdev->curr_fmmode != FM_MODE_RX)
> -		return -EPERM;
> -
> -	if (curr_rssi_lvl == NULL) {
> -		fmerr("Invalid memory\n");
> -		return -ENOMEM;
> -	}
> -
> -	*curr_rssi_lvl = fmdev->rx.rssi_threshold;
> -
> -	return 0;
> -}
> -
> -/* Sets RX stereo/mono modes */
> -int fm_rx_set_stereo_mono(struct fmdev *fmdev, u16 mode)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	if (mode != FM_STEREO_MODE && mode != FM_MONO_MODE) {
> -		fmerr("Invalid mode\n");
> -		return -EINVAL;
> -	}
> -
> -	/* Set stereo/mono mode */
> -	payload = (u16)mode;
> -	ret = fmc_send_cmd(fmdev, MOST_MODE_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Set stereo blending mode */
> -	payload = FM_STEREO_SOFT_BLEND;
> -	ret = fmc_send_cmd(fmdev, MOST_BLEND_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> -}
> -
> -/* Gets current RX stereo/mono mode */
> -int fm_rx_get_stereo_mono(struct fmdev *fmdev, u16 *mode)
> -{
> -	__be16 curr_mode;
> -	u32 resp_len;
> -	int ret;
> -
> -	if (mode == NULL) {
> -		fmerr("Invalid memory\n");
> -		return -ENOMEM;
> -	}
> -
> -	ret = fmc_send_cmd(fmdev, MOST_MODE_SET, REG_RD, NULL, 2,
> -			&curr_mode, &resp_len);
> -	if (ret < 0)
> -		return ret;
> -
> -	*mode = be16_to_cpu(curr_mode);
> -
> -	return 0;
> -}
> -
> -/* Choose RX de-emphasis filter mode (50us/75us) */
> -int fm_rx_set_deemphasis_mode(struct fmdev *fmdev, u16 mode)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_RX)
> -		return -EPERM;
> -
> -	if (mode != FM_RX_EMPHASIS_FILTER_50_USEC &&
> -			mode != FM_RX_EMPHASIS_FILTER_75_USEC) {
> -		fmerr("Invalid rx de-emphasis mode (%d)\n", mode);
> -		return -EINVAL;
> -	}
> -
> -	payload = mode;
> -	ret = fmc_send_cmd(fmdev, DEMPH_MODE_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	fmdev->rx.deemphasis_mode = mode;
> -
> -	return 0;
> -}
> -
> -/* Gets current RX de-emphasis filter mode */
> -int fm_rx_get_deemph_mode(struct fmdev *fmdev, u16 *curr_deemphasis_mode)
> -{
> -	if (fmdev->curr_fmmode != FM_MODE_RX)
> -		return -EPERM;
> -
> -	if (curr_deemphasis_mode == NULL) {
> -		fmerr("Invalid memory\n");
> -		return -ENOMEM;
> -	}
> -
> -	*curr_deemphasis_mode = fmdev->rx.deemphasis_mode;
> -
> -	return 0;
> -}
> -
> -/* Enable/Disable RX RDS */
> -int fm_rx_set_rds_mode(struct fmdev *fmdev, u8 rds_en_dis)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	if (rds_en_dis != FM_RDS_ENABLE && rds_en_dis != FM_RDS_DISABLE) {
> -		fmerr("Invalid rds option\n");
> -		return -EINVAL;
> -	}
> -
> -	if (rds_en_dis == FM_RDS_ENABLE
> -	    && fmdev->rx.rds.flag == FM_RDS_DISABLE) {
> -		/* Turn on RX RDS and RDS circuit */
> -		payload = FM_RX_PWR_SET_FM_AND_RDS_BLK_ON;
> -		ret = fmc_send_cmd(fmdev, POWER_SET, REG_WR, &payload,
> -				sizeof(payload), NULL, NULL);
> -		if (ret < 0)
> -			return ret;
> -
> -		/* Clear and reset RDS FIFO */
> -		payload = FM_RX_RDS_FLUSH_FIFO;
> -		ret = fmc_send_cmd(fmdev, RDS_CNTRL_SET, REG_WR, &payload,
> -		sizeof(payload), NULL, NULL);
> -		if (ret < 0)
> -			return ret;
> -
> -		/* Read flags - just to clear any pending interrupts. */
> -		ret = fmc_send_cmd(fmdev, FLAG_GET, REG_RD, NULL, 2,
> -				NULL, NULL);
> -		if (ret < 0)
> -			return ret;
> -
> -		/* Set RDS FIFO threshold value */
> -		payload = FM_RX_RDS_FIFO_THRESHOLD;
> -		ret = fmc_send_cmd(fmdev, RDS_MEM_SET, REG_WR, &payload,
> -		sizeof(payload), NULL, NULL);
> -		if (ret < 0)
> -			return ret;
> -
> -		/* Enable RDS interrupt */
> -		fmdev->irq_info.mask |= FM_RDS_EVENT;
> -		payload = fmdev->irq_info.mask;
> -		ret = fmc_send_cmd(fmdev, INT_MASK_SET, REG_WR, &payload,
> -				sizeof(payload), NULL, NULL);
> -		if (ret < 0) {
> -			fmdev->irq_info.mask &= ~FM_RDS_EVENT;
> -			return ret;
> -		}
> -
> -		/* Update our local flag */
> -		fmdev->rx.rds.flag = FM_RDS_ENABLE;
> -	} else if (rds_en_dis == FM_RDS_DISABLE
> -		   && fmdev->rx.rds.flag == FM_RDS_ENABLE) {
> -		/* Turn off RX RDS */
> -		payload = FM_RX_PWR_SET_FM_ON_RDS_OFF;
> -		ret = fmc_send_cmd(fmdev, POWER_SET, REG_WR, &payload,
> -				sizeof(payload), NULL, NULL);
> -		if (ret < 0)
> -			return ret;
> -
> -		/* Reset RDS pointers */
> -		fmdev->rx.rds.last_blk_idx = 0;
> -		fmdev->rx.rds.wr_idx = 0;
> -		fmdev->rx.rds.rd_idx = 0;
> -		fm_rx_reset_station_info(fmdev);
> -
> -		/* Update RDS local cache */
> -		fmdev->irq_info.mask &= ~(FM_RDS_EVENT);
> -		fmdev->rx.rds.flag = FM_RDS_DISABLE;
> -	}
> -
> -	return 0;
> -}
> -
> -/* Returns current RX RDS enable/disable status */
> -int fm_rx_get_rds_mode(struct fmdev *fmdev, u8 *curr_rds_en_dis)
> -{
> -	if (fmdev->curr_fmmode != FM_MODE_RX)
> -		return -EPERM;
> -
> -	if (curr_rds_en_dis == NULL) {
> -		fmerr("Invalid memory\n");
> -		return -ENOMEM;
> -	}
> -
> -	*curr_rds_en_dis = fmdev->rx.rds.flag;
> -
> -	return 0;
> -}
> -
> -/* Sets RDS operation mode (RDS/RDBS) */
> -int fm_rx_set_rds_system(struct fmdev *fmdev, u8 rds_mode)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_RX)
> -		return -EPERM;
> -
> -	if (rds_mode != FM_RDS_SYSTEM_RDS && rds_mode != FM_RDS_SYSTEM_RBDS) {
> -		fmerr("Invalid rds mode\n");
> -		return -EINVAL;
> -	}
> -	/* Set RDS operation mode */
> -	payload = (u16)rds_mode;
> -	ret = fmc_send_cmd(fmdev, RDS_SYSTEM_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	fmdev->rx.rds_mode = rds_mode;
> -
> -	return 0;
> -}
> -
> -/* Configures Alternate Frequency switch mode */
> -int fm_rx_set_af_switch(struct fmdev *fmdev, u8 af_mode)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_RX)
> -		return -EPERM;
> -
> -	if (af_mode != FM_RX_RDS_AF_SWITCH_MODE_ON &&
> -	    af_mode != FM_RX_RDS_AF_SWITCH_MODE_OFF) {
> -		fmerr("Invalid af mode\n");
> -		return -EINVAL;
> -	}
> -	/* Enable/disable low RSSI interrupt based on af_mode */
> -	if (af_mode == FM_RX_RDS_AF_SWITCH_MODE_ON)
> -		fmdev->irq_info.mask |= FM_LEV_EVENT;
> -	else
> -		fmdev->irq_info.mask &= ~FM_LEV_EVENT;
> -
> -	payload = fmdev->irq_info.mask;
> -	ret = fmc_send_cmd(fmdev, INT_MASK_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	fmdev->rx.af_mode = af_mode;
> -
> -	return 0;
> -}
> -
> -/* Returns Alternate Frequency switch status */
> -int fm_rx_get_af_switch(struct fmdev *fmdev, u8 *af_mode)
> -{
> -	if (fmdev->curr_fmmode != FM_MODE_RX)
> -		return -EPERM;
> -
> -	if (af_mode == NULL) {
> -		fmerr("Invalid memory\n");
> -		return -ENOMEM;
> -	}
> -
> -	*af_mode = fmdev->rx.af_mode;
> -
> -	return 0;
> -}
> diff --git a/drivers/media/radio/wl128x/fmdrv_rx.h b/drivers/media/radio/wl128x/fmdrv_rx.h
> deleted file mode 100644
> index 2748e99662c3..000000000000
> --- a/drivers/media/radio/wl128x/fmdrv_rx.h
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - *  FM Driver for Connectivity chip of Texas Instruments.
> - *  FM RX module header.
> - *
> - *  Copyright (C) 2011 Texas Instruments
> - */
> -
> -#ifndef _FMDRV_RX_H
> -#define _FMDRV_RX_H
> -
> -int fm_rx_set_freq(struct fmdev *, u32);
> -int fm_rx_set_mute_mode(struct fmdev *, u8);
> -int fm_rx_set_stereo_mono(struct fmdev *, u16);
> -int fm_rx_set_rds_mode(struct fmdev *, u8);
> -int fm_rx_set_rds_system(struct fmdev *, u8);
> -int fm_rx_set_volume(struct fmdev *, u16);
> -int fm_rx_set_rssi_threshold(struct fmdev *, short);
> -int fm_rx_set_region(struct fmdev *, u8);
> -int fm_rx_set_rfdepend_softmute(struct fmdev *, u8);
> -int fm_rx_set_deemphasis_mode(struct fmdev *, u16);
> -int fm_rx_set_af_switch(struct fmdev *, u8);
> -
> -void fm_rx_reset_rds_cache(struct fmdev *);
> -void fm_rx_reset_station_info(struct fmdev *);
> -
> -int fm_rx_seek(struct fmdev *, u32, u32, u32);
> -
> -int fm_rx_get_rds_mode(struct fmdev *, u8 *);
> -int fm_rx_get_mute_mode(struct fmdev *, u8 *);
> -int fm_rx_get_volume(struct fmdev *, u16 *);
> -int fm_rx_get_band_freq_range(struct fmdev *,
> -					u32 *, u32 *);
> -int fm_rx_get_stereo_mono(struct fmdev *, u16 *);
> -int fm_rx_get_rssi_level(struct fmdev *, u16 *);
> -int fm_rx_get_rssi_threshold(struct fmdev *, short *);
> -int fm_rx_get_rfdepend_softmute(struct fmdev *, u8 *);
> -int fm_rx_get_deemph_mode(struct fmdev *, u16 *);
> -int fm_rx_get_af_switch(struct fmdev *, u8 *);
> -void fm_rx_get_region(struct fmdev *, u8 *);
> -
> -int fm_rx_set_chanl_spacing(struct fmdev *, u8);
> -int fm_rx_get_chanl_spacing(struct fmdev *, u8 *);
> -#endif
> -
> diff --git a/drivers/media/radio/wl128x/fmdrv_tx.c b/drivers/media/radio/wl128x/fmdrv_tx.c
> deleted file mode 100644
> index c589de02f4f5..000000000000
> --- a/drivers/media/radio/wl128x/fmdrv_tx.c
> +++ /dev/null
> @@ -1,413 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - *  FM Driver for Connectivity chip of Texas Instruments.
> - *  This sub-module of FM driver implements FM TX functionality.
> - *
> - *  Copyright (C) 2011 Texas Instruments
> - */
> -
> -#include <linux/delay.h>
> -#include "fmdrv.h"
> -#include "fmdrv_common.h"
> -#include "fmdrv_tx.h"
> -
> -int fm_tx_set_stereo_mono(struct fmdev *fmdev, u16 mode)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	if (fmdev->tx_data.aud_mode == mode)
> -		return 0;
> -
> -	fmdbg("stereo mode: %d\n", mode);
> -
> -	/* Set Stereo/Mono mode */
> -	payload = (1 - mode);
> -	ret = fmc_send_cmd(fmdev, MONO_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	fmdev->tx_data.aud_mode = mode;
> -
> -	return ret;
> -}
> -
> -static int set_rds_text(struct fmdev *fmdev, u8 *rds_text)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	ret = fmc_send_cmd(fmdev, RDS_DATA_SET, REG_WR, rds_text,
> -			strlen(rds_text), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Scroll mode */
> -	payload = (u16)0x1;
> -	ret = fmc_send_cmd(fmdev, DISPLAY_MODE, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> -}
> -
> -static int set_rds_data_mode(struct fmdev *fmdev, u8 mode)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	/* Setting unique PI TODO: how unique? */
> -	payload = (u16)0xcafe;
> -	ret = fmc_send_cmd(fmdev, PI_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Set decoder id */
> -	payload = (u16)0xa;
> -	ret = fmc_send_cmd(fmdev, DI_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* TODO: RDS_MODE_GET? */
> -	return 0;
> -}
> -
> -static int set_rds_len(struct fmdev *fmdev, u8 type, u16 len)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	len |= type << 8;
> -	payload = len;
> -	ret = fmc_send_cmd(fmdev, RDS_CONFIG_DATA_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* TODO: LENGTH_GET? */
> -	return 0;
> -}
> -
> -int fm_tx_set_rds_mode(struct fmdev *fmdev, u8 rds_en_dis)
> -{
> -	u16 payload;
> -	int ret;
> -	u8 rds_text[] = "Zoom2\n";
> -
> -	fmdbg("rds_en_dis:%d(E:%d, D:%d)\n", rds_en_dis,
> -		   FM_RDS_ENABLE, FM_RDS_DISABLE);
> -
> -	if (rds_en_dis == FM_RDS_ENABLE) {
> -		/* Set RDS length */
> -		set_rds_len(fmdev, 0, strlen(rds_text));
> -
> -		/* Set RDS text */
> -		set_rds_text(fmdev, rds_text);
> -
> -		/* Set RDS mode */
> -		set_rds_data_mode(fmdev, 0x0);
> -	}
> -
> -	/* Send command to enable RDS */
> -	if (rds_en_dis == FM_RDS_ENABLE)
> -		payload = 0x01;
> -	else
> -		payload = 0x00;
> -
> -	ret = fmc_send_cmd(fmdev, RDS_DATA_ENB, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (rds_en_dis == FM_RDS_ENABLE) {
> -		/* Set RDS length */
> -		set_rds_len(fmdev, 0, strlen(rds_text));
> -
> -		/* Set RDS text */
> -		set_rds_text(fmdev, rds_text);
> -	}
> -	fmdev->tx_data.rds.flag = rds_en_dis;
> -
> -	return 0;
> -}
> -
> -int fm_tx_set_radio_text(struct fmdev *fmdev, u8 *rds_text, u8 rds_type)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_TX)
> -		return -EPERM;
> -
> -	fm_tx_set_rds_mode(fmdev, 0);
> -
> -	/* Set RDS length */
> -	set_rds_len(fmdev, rds_type, strlen(rds_text));
> -
> -	/* Set RDS text */
> -	set_rds_text(fmdev, rds_text);
> -
> -	/* Set RDS mode */
> -	set_rds_data_mode(fmdev, 0x0);
> -
> -	payload = 1;
> -	ret = fmc_send_cmd(fmdev, RDS_DATA_ENB, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> -}
> -
> -int fm_tx_set_af(struct fmdev *fmdev, u32 af)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_TX)
> -		return -EPERM;
> -
> -	fmdbg("AF: %d\n", af);
> -
> -	af = (af - 87500) / 100;
> -	payload = (u16)af;
> -	ret = fmc_send_cmd(fmdev, TA_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> -}
> -
> -int fm_tx_set_region(struct fmdev *fmdev, u8 region)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	if (region != FM_BAND_EUROPE_US && region != FM_BAND_JAPAN) {
> -		fmerr("Invalid band\n");
> -		return -EINVAL;
> -	}
> -
> -	/* Send command to set the band */
> -	payload = (u16)region;
> -	ret = fmc_send_cmd(fmdev, TX_BAND_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> -}
> -
> -int fm_tx_set_mute_mode(struct fmdev *fmdev, u8 mute_mode_toset)
> -{
> -	u16 payload;
> -	int ret;
> -
> -	fmdbg("tx: mute mode %d\n", mute_mode_toset);
> -
> -	payload = mute_mode_toset;
> -	ret = fmc_send_cmd(fmdev, MUTE, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> -}
> -
> -/* Set TX Audio I/O */
> -static int set_audio_io(struct fmdev *fmdev)
> -{
> -	struct fmtx_data *tx = &fmdev->tx_data;
> -	u16 payload;
> -	int ret;
> -
> -	/* Set Audio I/O Enable */
> -	payload = tx->audio_io;
> -	ret = fmc_send_cmd(fmdev, AUDIO_IO_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* TODO: is audio set? */
> -	return 0;
> -}
> -
> -/* Start TX Transmission */
> -static int enable_xmit(struct fmdev *fmdev, u8 new_xmit_state)
> -{
> -	struct fmtx_data *tx = &fmdev->tx_data;
> -	unsigned long timeleft;
> -	u16 payload;
> -	int ret;
> -
> -	/* Enable POWER_ENB interrupts */
> -	payload = FM_POW_ENB_EVENT;
> -	ret = fmc_send_cmd(fmdev, INT_MASK_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Set Power Enable */
> -	payload = new_xmit_state;
> -	ret = fmc_send_cmd(fmdev, POWER_ENB_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Wait for Power Enabled */
> -	init_completion(&fmdev->maintask_comp);
> -	timeleft = wait_for_completion_timeout(&fmdev->maintask_comp,
> -			FM_DRV_TX_TIMEOUT);
> -	if (!timeleft) {
> -		fmerr("Timeout(%d sec),didn't get tune ended interrupt\n",
> -			   jiffies_to_msecs(FM_DRV_TX_TIMEOUT) / 1000);
> -		return -ETIMEDOUT;
> -	}
> -
> -	set_bit(FM_CORE_TX_XMITING, &fmdev->flag);
> -	tx->xmit_state = new_xmit_state;
> -
> -	return 0;
> -}
> -
> -/* Set TX power level */
> -int fm_tx_set_pwr_lvl(struct fmdev *fmdev, u8 new_pwr_lvl)
> -{
> -	u16 payload;
> -	struct fmtx_data *tx = &fmdev->tx_data;
> -	int ret;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_TX)
> -		return -EPERM;
> -	fmdbg("tx: pwr_level_to_set %ld\n", (long int)new_pwr_lvl);
> -
> -	/* If the core isn't ready update global variable */
> -	if (!test_bit(FM_CORE_READY, &fmdev->flag)) {
> -		tx->pwr_lvl = new_pwr_lvl;
> -		return 0;
> -	}
> -
> -	/* Set power level: Application will specify power level value in
> -	 * units of dB/uV, whereas range and step are specific to FM chip.
> -	 * For TI's WL chips, convert application specified power level value
> -	 * to chip specific value by subtracting 122 from it. Refer to TI FM
> -	 * data sheet for details.
> -	 * */
> -
> -	payload = (FM_PWR_LVL_HIGH - new_pwr_lvl);
> -	ret = fmc_send_cmd(fmdev, POWER_LEV_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* TODO: is the power level set? */
> -	tx->pwr_lvl = new_pwr_lvl;
> -
> -	return 0;
> -}
> -
> -/*
> - * Sets FM TX pre-emphasis filter value (OFF, 50us, or 75us)
> - * Convert V4L2 specified filter values to chip specific filter values.
> - */
> -int fm_tx_set_preemph_filter(struct fmdev *fmdev, u32 preemphasis)
> -{
> -	struct fmtx_data *tx = &fmdev->tx_data;
> -	u16 payload;
> -	int ret;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_TX)
> -		return -EPERM;
> -
> -	switch (preemphasis) {
> -	case V4L2_PREEMPHASIS_DISABLED:
> -		payload = FM_TX_PREEMPH_OFF;
> -		break;
> -	case V4L2_PREEMPHASIS_50_uS:
> -		payload = FM_TX_PREEMPH_50US;
> -		break;
> -	case V4L2_PREEMPHASIS_75_uS:
> -		payload = FM_TX_PREEMPH_75US;
> -		break;
> -	}
> -
> -	ret = fmc_send_cmd(fmdev, PREMPH_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	tx->preemph = payload;
> -
> -	return ret;
> -}
> -
> -/* Get the TX tuning capacitor value.*/
> -int fm_tx_get_tune_cap_val(struct fmdev *fmdev)
> -{
> -	u16 curr_val;
> -	u32 resp_len;
> -	int ret;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_TX)
> -		return -EPERM;
> -
> -	ret = fmc_send_cmd(fmdev, READ_FMANT_TUNE_VALUE, REG_RD,
> -			NULL, sizeof(curr_val), &curr_val, &resp_len);
> -	if (ret < 0)
> -		return ret;
> -
> -	curr_val = be16_to_cpu((__force __be16)curr_val);
> -
> -	return curr_val;
> -}
> -
> -/* Set TX Frequency */
> -int fm_tx_set_freq(struct fmdev *fmdev, u32 freq_to_set)
> -{
> -	struct fmtx_data *tx = &fmdev->tx_data;
> -	u16 payload, chanl_index;
> -	int ret;
> -
> -	if (test_bit(FM_CORE_TX_XMITING, &fmdev->flag)) {
> -		enable_xmit(fmdev, 0);
> -		clear_bit(FM_CORE_TX_XMITING, &fmdev->flag);
> -	}
> -
> -	/* Enable FR, BL interrupts */
> -	payload = (FM_FR_EVENT | FM_BL_EVENT);
> -	ret = fmc_send_cmd(fmdev, INT_MASK_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	tx->tx_frq = (unsigned long)freq_to_set;
> -	fmdbg("tx: freq_to_set %ld\n", (long int)tx->tx_frq);
> -
> -	chanl_index = freq_to_set / 10;
> -
> -	/* Set current tuner channel */
> -	payload = chanl_index;
> -	ret = fmc_send_cmd(fmdev, CHANL_SET, REG_WR, &payload,
> -			sizeof(payload), NULL, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	fm_tx_set_pwr_lvl(fmdev, tx->pwr_lvl);
> -	fm_tx_set_preemph_filter(fmdev, tx->preemph);
> -
> -	tx->audio_io = 0x01;	/* I2S */
> -	set_audio_io(fmdev);
> -
> -	enable_xmit(fmdev, 0x01);	/* Enable transmission */
> -
> -	tx->aud_mode = FM_STEREO_MODE;
> -	tx->rds.flag = FM_RDS_DISABLE;
> -
> -	return 0;
> -}
> -
> diff --git a/drivers/media/radio/wl128x/fmdrv_tx.h b/drivers/media/radio/wl128x/fmdrv_tx.h
> deleted file mode 100644
> index aebdadf9e99b..000000000000
> --- a/drivers/media/radio/wl128x/fmdrv_tx.h
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - *  FM Driver for Connectivity chip of Texas Instruments.
> - *  FM TX module header.
> - *
> - *  Copyright (C) 2011 Texas Instruments
> - */
> -
> -#ifndef _FMDRV_TX_H
> -#define _FMDRV_TX_H
> -
> -int fm_tx_set_freq(struct fmdev *, u32);
> -int fm_tx_set_pwr_lvl(struct fmdev *, u8);
> -int fm_tx_set_region(struct fmdev *, u8);
> -int fm_tx_set_mute_mode(struct fmdev *, u8);
> -int fm_tx_set_stereo_mono(struct fmdev *, u16);
> -int fm_tx_set_rds_mode(struct fmdev *, u8);
> -int fm_tx_set_radio_text(struct fmdev *, u8 *, u8);
> -int fm_tx_set_af(struct fmdev *, u32);
> -int fm_tx_set_preemph_filter(struct fmdev *, u32);
> -int fm_tx_get_tune_cap_val(struct fmdev *);
> -
> -#endif
> -
> diff --git a/drivers/media/radio/wl128x/fmdrv_v4l2.c b/drivers/media/radio/wl128x/fmdrv_v4l2.c
> deleted file mode 100644
> index 1c146d14dbbd..000000000000
> --- a/drivers/media/radio/wl128x/fmdrv_v4l2.c
> +++ /dev/null
> @@ -1,604 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - *  FM Driver for Connectivity chip of Texas Instruments.
> - *  This file provides interfaces to V4L2 subsystem.
> - *
> - *  This module registers with V4L2 subsystem as Radio
> - *  data system interface (/dev/radio). During the registration,
> - *  it will expose two set of function pointers.
> - *
> - *    1) File operation related API (open, close, read, write, poll...etc).
> - *    2) Set of V4L2 IOCTL complaint API.
> - *
> - *  Copyright (C) 2011 Texas Instruments
> - *  Author: Raja Mani <raja_mani@ti.com>
> - *  Author: Manjunatha Halli <manjunatha_halli@ti.com>
> - */
> -
> -#include <linux/export.h>
> -
> -#include "fmdrv.h"
> -#include "fmdrv_v4l2.h"
> -#include "fmdrv_common.h"
> -#include "fmdrv_rx.h"
> -#include "fmdrv_tx.h"
> -
> -static struct video_device gradio_dev;
> -static u8 radio_disconnected;
> -
> -/* -- V4L2 RADIO (/dev/radioX) device file operation interfaces --- */
> -
> -/* Read RX RDS data */
> -static ssize_t fm_v4l2_fops_read(struct file *file, char __user * buf,
> -					size_t count, loff_t *ppos)
> -{
> -	u8 rds_mode;
> -	int ret;
> -	struct fmdev *fmdev;
> -
> -	fmdev = video_drvdata(file);
> -
> -	if (!radio_disconnected) {
> -		fmerr("FM device is already disconnected\n");
> -		return -EIO;
> -	}
> -
> -	if (mutex_lock_interruptible(&fmdev->mutex))
> -		return -ERESTARTSYS;
> -
> -	/* Turn on RDS mode if it is disabled */
> -	ret = fm_rx_get_rds_mode(fmdev, &rds_mode);
> -	if (ret < 0) {
> -		fmerr("Unable to read current rds mode\n");
> -		goto read_unlock;
> -	}
> -
> -	if (rds_mode == FM_RDS_DISABLE) {
> -		ret = fmc_set_rds_mode(fmdev, FM_RDS_ENABLE);
> -		if (ret < 0) {
> -			fmerr("Failed to enable rds mode\n");
> -			goto read_unlock;
> -		}
> -	}
> -
> -	/* Copy RDS data from internal buffer to user buffer */
> -	ret = fmc_transfer_rds_from_internal_buff(fmdev, file, buf, count);
> -read_unlock:
> -	mutex_unlock(&fmdev->mutex);
> -	return ret;
> -}
> -
> -/* Write TX RDS data */
> -static ssize_t fm_v4l2_fops_write(struct file *file, const char __user * buf,
> -		size_t count, loff_t *ppos)
> -{
> -	struct tx_rds rds;
> -	int ret;
> -	struct fmdev *fmdev;
> -
> -	ret = copy_from_user(&rds, buf, sizeof(rds));
> -	rds.text[sizeof(rds.text) - 1] = '\0';
> -	fmdbg("(%d)type: %d, text %s, af %d\n",
> -		   ret, rds.text_type, rds.text, rds.af_freq);
> -	if (ret)
> -		return -EFAULT;
> -
> -	fmdev = video_drvdata(file);
> -	if (mutex_lock_interruptible(&fmdev->mutex))
> -		return -ERESTARTSYS;
> -	fm_tx_set_radio_text(fmdev, rds.text, rds.text_type);
> -	fm_tx_set_af(fmdev, rds.af_freq);
> -	mutex_unlock(&fmdev->mutex);
> -
> -	return sizeof(rds);
> -}
> -
> -static __poll_t fm_v4l2_fops_poll(struct file *file, struct poll_table_struct *pts)
> -{
> -	int ret;
> -	struct fmdev *fmdev;
> -
> -	fmdev = video_drvdata(file);
> -	mutex_lock(&fmdev->mutex);
> -	ret = fmc_is_rds_data_available(fmdev, file, pts);
> -	mutex_unlock(&fmdev->mutex);
> -	if (ret < 0)
> -		return EPOLLIN | EPOLLRDNORM;
> -
> -	return 0;
> -}
> -
> -/*
> - * Handle open request for "/dev/radioX" device.
> - * Start with FM RX mode as default.
> - */
> -static int fm_v4l2_fops_open(struct file *file)
> -{
> -	int ret;
> -	struct fmdev *fmdev = NULL;
> -
> -	/* Don't allow multiple open */
> -	if (radio_disconnected) {
> -		fmerr("FM device is already opened\n");
> -		return -EBUSY;
> -	}
> -
> -	fmdev = video_drvdata(file);
> -
> -	if (mutex_lock_interruptible(&fmdev->mutex))
> -		return -ERESTARTSYS;
> -	ret = fmc_prepare(fmdev);
> -	if (ret < 0) {
> -		fmerr("Unable to prepare FM CORE\n");
> -		goto open_unlock;
> -	}
> -
> -	fmdbg("Load FM RX firmware..\n");
> -
> -	ret = fmc_set_mode(fmdev, FM_MODE_RX);
> -	if (ret < 0) {
> -		fmerr("Unable to load FM RX firmware\n");
> -		goto open_unlock;
> -	}
> -	radio_disconnected = 1;
> -
> -open_unlock:
> -	mutex_unlock(&fmdev->mutex);
> -	return ret;
> -}
> -
> -static int fm_v4l2_fops_release(struct file *file)
> -{
> -	int ret;
> -	struct fmdev *fmdev;
> -
> -	fmdev = video_drvdata(file);
> -	if (!radio_disconnected) {
> -		fmdbg("FM device is already closed\n");
> -		return 0;
> -	}
> -
> -	mutex_lock(&fmdev->mutex);
> -	ret = fmc_set_mode(fmdev, FM_MODE_OFF);
> -	if (ret < 0) {
> -		fmerr("Unable to turn off the chip\n");
> -		goto release_unlock;
> -	}
> -
> -	ret = fmc_release(fmdev);
> -	if (ret < 0) {
> -		fmerr("FM CORE release failed\n");
> -		goto release_unlock;
> -	}
> -	radio_disconnected = 0;
> -
> -release_unlock:
> -	mutex_unlock(&fmdev->mutex);
> -	return ret;
> -}
> -
> -/* V4L2 RADIO (/dev/radioX) device IOCTL interfaces */
> -static int fm_v4l2_vidioc_querycap(struct file *file, void *priv,
> -		struct v4l2_capability *capability)
> -{
> -	strscpy(capability->driver, FM_DRV_NAME, sizeof(capability->driver));
> -	strscpy(capability->card, FM_DRV_CARD_SHORT_NAME,
> -		sizeof(capability->card));
> -	sprintf(capability->bus_info, "UART");
> -	return 0;
> -}
> -
> -static int fm_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> -{
> -	struct fmdev *fmdev = container_of(ctrl->handler,
> -			struct fmdev, ctrl_handler);
> -
> -	switch (ctrl->id) {
> -	case  V4L2_CID_TUNE_ANTENNA_CAPACITOR:
> -		ctrl->val = fm_tx_get_tune_cap_val(fmdev);
> -		break;
> -	default:
> -		fmwarn("%s: Unknown IOCTL: %d\n", __func__, ctrl->id);
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
> -static int fm_v4l2_s_ctrl(struct v4l2_ctrl *ctrl)
> -{
> -	struct fmdev *fmdev = container_of(ctrl->handler,
> -			struct fmdev, ctrl_handler);
> -
> -	switch (ctrl->id) {
> -	case V4L2_CID_AUDIO_VOLUME:	/* set volume */
> -		return fm_rx_set_volume(fmdev, (u16)ctrl->val);
> -
> -	case V4L2_CID_AUDIO_MUTE:	/* set mute */
> -		return fmc_set_mute_mode(fmdev, (u8)ctrl->val);
> -
> -	case V4L2_CID_TUNE_POWER_LEVEL:
> -		/* set TX power level - ext control */
> -		return fm_tx_set_pwr_lvl(fmdev, (u8)ctrl->val);
> -
> -	case V4L2_CID_TUNE_PREEMPHASIS:
> -		return fm_tx_set_preemph_filter(fmdev, (u8) ctrl->val);
> -
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
> -static int fm_v4l2_vidioc_g_audio(struct file *file, void *priv,
> -		struct v4l2_audio *audio)
> -{
> -	memset(audio, 0, sizeof(*audio));
> -	strscpy(audio->name, "Radio", sizeof(audio->name));
> -	audio->capability = V4L2_AUDCAP_STEREO;
> -
> -	return 0;
> -}
> -
> -static int fm_v4l2_vidioc_s_audio(struct file *file, void *priv,
> -		const struct v4l2_audio *audio)
> -{
> -	if (audio->index != 0)
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -
> -/* Get tuner attributes. If current mode is NOT RX, return error */
> -static int fm_v4l2_vidioc_g_tuner(struct file *file, void *priv,
> -		struct v4l2_tuner *tuner)
> -{
> -	struct fmdev *fmdev = video_drvdata(file);
> -	u32 bottom_freq;
> -	u32 top_freq;
> -	u16 stereo_mono_mode;
> -	u16 rssilvl;
> -	int ret;
> -
> -	if (tuner->index != 0)
> -		return -EINVAL;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_RX)
> -		return -EPERM;
> -
> -	ret = fm_rx_get_band_freq_range(fmdev, &bottom_freq, &top_freq);
> -	if (ret != 0)
> -		return ret;
> -
> -	ret = fm_rx_get_stereo_mono(fmdev, &stereo_mono_mode);
> -	if (ret != 0)
> -		return ret;
> -
> -	ret = fm_rx_get_rssi_level(fmdev, &rssilvl);
> -	if (ret != 0)
> -		return ret;
> -
> -	strscpy(tuner->name, "FM", sizeof(tuner->name));
> -	tuner->type = V4L2_TUNER_RADIO;
> -	/* Store rangelow and rangehigh freq in unit of 62.5 Hz */
> -	tuner->rangelow = bottom_freq * 16;
> -	tuner->rangehigh = top_freq * 16;
> -	tuner->rxsubchans = V4L2_TUNER_SUB_MONO | V4L2_TUNER_SUB_STEREO |
> -	((fmdev->rx.rds.flag == FM_RDS_ENABLE) ? V4L2_TUNER_SUB_RDS : 0);
> -	tuner->capability = V4L2_TUNER_CAP_STEREO | V4L2_TUNER_CAP_RDS |
> -			    V4L2_TUNER_CAP_LOW |
> -			    V4L2_TUNER_CAP_HWSEEK_BOUNDED |
> -			    V4L2_TUNER_CAP_HWSEEK_WRAP;
> -	tuner->audmode = (stereo_mono_mode ?
> -			  V4L2_TUNER_MODE_MONO : V4L2_TUNER_MODE_STEREO);
> -
> -	/*
> -	 * Actual rssi value lies in between -128 to +127.
> -	 * Convert this range from 0 to 255 by adding +128
> -	 */
> -	rssilvl += 128;
> -
> -	/*
> -	 * Return signal strength value should be within 0 to 65535.
> -	 * Find out correct signal radio by multiplying (65535/255) = 257
> -	 */
> -	tuner->signal = rssilvl * 257;
> -	tuner->afc = 0;
> -
> -	return ret;
> -}
> -
> -/*
> - * Set tuner attributes. If current mode is NOT RX, set to RX.
> - * Currently, we set only audio mode (mono/stereo) and RDS state (on/off).
> - * Should we set other tuner attributes, too?
> - */
> -static int fm_v4l2_vidioc_s_tuner(struct file *file, void *priv,
> -		const struct v4l2_tuner *tuner)
> -{
> -	struct fmdev *fmdev = video_drvdata(file);
> -	u16 aud_mode;
> -	u8 rds_mode;
> -	int ret;
> -
> -	if (tuner->index != 0)
> -		return -EINVAL;
> -
> -	aud_mode = (tuner->audmode == V4L2_TUNER_MODE_STEREO) ?
> -			FM_STEREO_MODE : FM_MONO_MODE;
> -	rds_mode = (tuner->rxsubchans & V4L2_TUNER_SUB_RDS) ?
> -			FM_RDS_ENABLE : FM_RDS_DISABLE;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_RX) {
> -		ret = fmc_set_mode(fmdev, FM_MODE_RX);
> -		if (ret < 0) {
> -			fmerr("Failed to set RX mode\n");
> -			return ret;
> -		}
> -	}
> -
> -	ret = fmc_set_stereo_mono(fmdev, aud_mode);
> -	if (ret < 0) {
> -		fmerr("Failed to set RX stereo/mono mode\n");
> -		return ret;
> -	}
> -
> -	ret = fmc_set_rds_mode(fmdev, rds_mode);
> -	if (ret < 0)
> -		fmerr("Failed to set RX RDS mode\n");
> -
> -	return ret;
> -}
> -
> -/* Get tuner or modulator radio frequency */
> -static int fm_v4l2_vidioc_g_freq(struct file *file, void *priv,
> -		struct v4l2_frequency *freq)
> -{
> -	struct fmdev *fmdev = video_drvdata(file);
> -	int ret;
> -
> -	ret = fmc_get_freq(fmdev, &freq->frequency);
> -	if (ret < 0) {
> -		fmerr("Failed to get frequency\n");
> -		return ret;
> -	}
> -
> -	/* Frequency unit of 62.5 Hz*/
> -	freq->frequency = (u32) freq->frequency * 16;
> -
> -	return 0;
> -}
> -
> -/* Set tuner or modulator radio frequency */
> -static int fm_v4l2_vidioc_s_freq(struct file *file, void *priv,
> -		const struct v4l2_frequency *freq)
> -{
> -	struct fmdev *fmdev = video_drvdata(file);
> -
> -	/*
> -	 * As V4L2_TUNER_CAP_LOW is set 1 user sends the frequency
> -	 * in units of 62.5 Hz.
> -	 */
> -	return fmc_set_freq(fmdev, freq->frequency / 16);
> -}
> -
> -/* Set hardware frequency seek. If current mode is NOT RX, set it RX. */
> -static int fm_v4l2_vidioc_s_hw_freq_seek(struct file *file, void *priv,
> -		const struct v4l2_hw_freq_seek *seek)
> -{
> -	struct fmdev *fmdev = video_drvdata(file);
> -	int ret;
> -
> -	if (file->f_flags & O_NONBLOCK)
> -		return -EWOULDBLOCK;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_RX) {
> -		ret = fmc_set_mode(fmdev, FM_MODE_RX);
> -		if (ret != 0) {
> -			fmerr("Failed to set RX mode\n");
> -			return ret;
> -		}
> -	}
> -
> -	ret = fm_rx_seek(fmdev, seek->seek_upward, seek->wrap_around,
> -			seek->spacing);
> -	if (ret < 0)
> -		fmerr("RX seek failed - %d\n", ret);
> -
> -	return ret;
> -}
> -/* Get modulator attributes. If mode is not TX, return no attributes. */
> -static int fm_v4l2_vidioc_g_modulator(struct file *file, void *priv,
> -		struct v4l2_modulator *mod)
> -{
> -	struct fmdev *fmdev = video_drvdata(file);
> -
> -	if (mod->index != 0)
> -		return -EINVAL;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_TX)
> -		return -EPERM;
> -
> -	mod->txsubchans = ((fmdev->tx_data.aud_mode == FM_STEREO_MODE) ?
> -				V4L2_TUNER_SUB_STEREO : V4L2_TUNER_SUB_MONO) |
> -				((fmdev->tx_data.rds.flag == FM_RDS_ENABLE) ?
> -				V4L2_TUNER_SUB_RDS : 0);
> -
> -	mod->capability = V4L2_TUNER_CAP_STEREO | V4L2_TUNER_CAP_RDS |
> -				V4L2_TUNER_CAP_LOW;
> -
> -	return 0;
> -}
> -
> -/* Set modulator attributes. If mode is not TX, set to TX. */
> -static int fm_v4l2_vidioc_s_modulator(struct file *file, void *priv,
> -		const struct v4l2_modulator *mod)
> -{
> -	struct fmdev *fmdev = video_drvdata(file);
> -	u8 rds_mode;
> -	u16 aud_mode;
> -	int ret;
> -
> -	if (mod->index != 0)
> -		return -EINVAL;
> -
> -	if (fmdev->curr_fmmode != FM_MODE_TX) {
> -		ret = fmc_set_mode(fmdev, FM_MODE_TX);
> -		if (ret != 0) {
> -			fmerr("Failed to set TX mode\n");
> -			return ret;
> -		}
> -	}
> -
> -	aud_mode = (mod->txsubchans & V4L2_TUNER_SUB_STEREO) ?
> -			FM_STEREO_MODE : FM_MONO_MODE;
> -	rds_mode = (mod->txsubchans & V4L2_TUNER_SUB_RDS) ?
> -			FM_RDS_ENABLE : FM_RDS_DISABLE;
> -	ret = fm_tx_set_stereo_mono(fmdev, aud_mode);
> -	if (ret < 0) {
> -		fmerr("Failed to set mono/stereo mode for TX\n");
> -		return ret;
> -	}
> -	ret = fm_tx_set_rds_mode(fmdev, rds_mode);
> -	if (ret < 0)
> -		fmerr("Failed to set rds mode for TX\n");
> -
> -	return ret;
> -}
> -
> -static const struct v4l2_file_operations fm_drv_fops = {
> -	.owner = THIS_MODULE,
> -	.read = fm_v4l2_fops_read,
> -	.write = fm_v4l2_fops_write,
> -	.poll = fm_v4l2_fops_poll,
> -	.unlocked_ioctl = video_ioctl2,
> -	.open = fm_v4l2_fops_open,
> -	.release = fm_v4l2_fops_release,
> -};
> -
> -static const struct v4l2_ctrl_ops fm_ctrl_ops = {
> -	.s_ctrl = fm_v4l2_s_ctrl,
> -	.g_volatile_ctrl = fm_g_volatile_ctrl,
> -};
> -static const struct v4l2_ioctl_ops fm_drv_ioctl_ops = {
> -	.vidioc_querycap = fm_v4l2_vidioc_querycap,
> -	.vidioc_g_audio = fm_v4l2_vidioc_g_audio,
> -	.vidioc_s_audio = fm_v4l2_vidioc_s_audio,
> -	.vidioc_g_tuner = fm_v4l2_vidioc_g_tuner,
> -	.vidioc_s_tuner = fm_v4l2_vidioc_s_tuner,
> -	.vidioc_g_frequency = fm_v4l2_vidioc_g_freq,
> -	.vidioc_s_frequency = fm_v4l2_vidioc_s_freq,
> -	.vidioc_s_hw_freq_seek = fm_v4l2_vidioc_s_hw_freq_seek,
> -	.vidioc_g_modulator = fm_v4l2_vidioc_g_modulator,
> -	.vidioc_s_modulator = fm_v4l2_vidioc_s_modulator
> -};
> -
> -/* V4L2 RADIO device parent structure */
> -static const struct video_device fm_viddev_template = {
> -	.fops = &fm_drv_fops,
> -	.ioctl_ops = &fm_drv_ioctl_ops,
> -	.name = FM_DRV_NAME,
> -	.release = video_device_release_empty,
> -	/*
> -	 * To ensure both the tuner and modulator ioctls are accessible we
> -	 * set the vfl_dir to M2M to indicate this.
> -	 *
> -	 * It is not really a mem2mem device of course, but it can both receive
> -	 * and transmit using the same radio device. It's the only radio driver
> -	 * that does this and it should really be split in two radio devices,
> -	 * but that would affect applications using this driver.
> -	 */
> -	.vfl_dir = VFL_DIR_M2M,
> -	.device_caps = V4L2_CAP_HW_FREQ_SEEK | V4L2_CAP_TUNER | V4L2_CAP_RADIO |
> -		       V4L2_CAP_MODULATOR | V4L2_CAP_AUDIO |
> -		       V4L2_CAP_READWRITE | V4L2_CAP_RDS_CAPTURE,
> -};
> -
> -int fm_v4l2_init_video_device(struct fmdev *fmdev, int radio_nr)
> -{
> -	struct v4l2_ctrl *ctrl;
> -	int ret;
> -
> -	strscpy(fmdev->v4l2_dev.name, FM_DRV_NAME,
> -		sizeof(fmdev->v4l2_dev.name));
> -	ret = v4l2_device_register(NULL, &fmdev->v4l2_dev);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Init mutex for core locking */
> -	mutex_init(&fmdev->mutex);
> -
> -	/* Setup FM driver's V4L2 properties */
> -	gradio_dev = fm_viddev_template;
> -
> -	video_set_drvdata(&gradio_dev, fmdev);
> -
> -	gradio_dev.lock = &fmdev->mutex;
> -	gradio_dev.v4l2_dev = &fmdev->v4l2_dev;
> -
> -	/* Register with V4L2 subsystem as RADIO device */
> -	if (video_register_device(&gradio_dev, VFL_TYPE_RADIO, radio_nr)) {
> -		v4l2_device_unregister(&fmdev->v4l2_dev);
> -		fmerr("Could not register video device\n");
> -		return -ENOMEM;
> -	}
> -
> -	fmdev->radio_dev = &gradio_dev;
> -
> -	/* Register to v4l2 ctrl handler framework */
> -	fmdev->radio_dev->ctrl_handler = &fmdev->ctrl_handler;
> -
> -	ret = v4l2_ctrl_handler_init(&fmdev->ctrl_handler, 5);
> -	if (ret < 0) {
> -		fmerr("(fmdev): Can't init ctrl handler\n");
> -		v4l2_ctrl_handler_free(&fmdev->ctrl_handler);
> -		video_unregister_device(fmdev->radio_dev);
> -		v4l2_device_unregister(&fmdev->v4l2_dev);
> -		return -EBUSY;
> -	}
> -
> -	/*
> -	 * Following controls are handled by V4L2 control framework.
> -	 * Added in ascending ID order.
> -	 */
> -	v4l2_ctrl_new_std(&fmdev->ctrl_handler, &fm_ctrl_ops,
> -			V4L2_CID_AUDIO_VOLUME, FM_RX_VOLUME_MIN,
> -			FM_RX_VOLUME_MAX, 1, FM_RX_VOLUME_MAX);
> -
> -	v4l2_ctrl_new_std(&fmdev->ctrl_handler, &fm_ctrl_ops,
> -			V4L2_CID_AUDIO_MUTE, 0, 1, 1, 1);
> -
> -	v4l2_ctrl_new_std_menu(&fmdev->ctrl_handler, &fm_ctrl_ops,
> -			V4L2_CID_TUNE_PREEMPHASIS, V4L2_PREEMPHASIS_75_uS,
> -			0, V4L2_PREEMPHASIS_75_uS);
> -
> -	v4l2_ctrl_new_std(&fmdev->ctrl_handler, &fm_ctrl_ops,
> -			V4L2_CID_TUNE_POWER_LEVEL, FM_PWR_LVL_LOW,
> -			FM_PWR_LVL_HIGH, 1, FM_PWR_LVL_HIGH);
> -
> -	ctrl = v4l2_ctrl_new_std(&fmdev->ctrl_handler, &fm_ctrl_ops,
> -			V4L2_CID_TUNE_ANTENNA_CAPACITOR, 0,
> -			255, 1, 255);
> -
> -	if (ctrl)
> -		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
> -
> -	return 0;
> -}
> -
> -void *fm_v4l2_deinit_video_device(void)
> -{
> -	struct fmdev *fmdev;
> -
> -
> -	fmdev = video_get_drvdata(&gradio_dev);
> -
> -	/* Unregister to v4l2 ctrl handler framework*/
> -	v4l2_ctrl_handler_free(&fmdev->ctrl_handler);
> -
> -	/* Unregister RADIO device from V4L2 subsystem */
> -	video_unregister_device(&gradio_dev);
> -
> -	v4l2_device_unregister(&fmdev->v4l2_dev);
> -
> -	return fmdev;
> -}
> diff --git a/drivers/media/radio/wl128x/fmdrv_v4l2.h b/drivers/media/radio/wl128x/fmdrv_v4l2.h
> deleted file mode 100644
> index 963214e9d6f2..000000000000
> --- a/drivers/media/radio/wl128x/fmdrv_v4l2.h
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - *  FM Driver for Connectivity chip of Texas Instruments.
> - *
> - *  FM V4L2 module header.
> - *
> - *  Copyright (C) 2011 Texas Instruments
> - */
> -
> -#ifndef _FMDRV_V4L2_H
> -#define _FMDRV_V4L2_H
> -
> -#include <media/v4l2-ioctl.h>
> -#include <media/v4l2-common.h>
> -#include <media/v4l2-ctrls.h>
> -
> -int fm_v4l2_init_video_device(struct fmdev *, int);
> -void *fm_v4l2_deinit_video_device(void);
> -
> -#endif
> 
> ---
> base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
> change-id: 20241119-rm-wl128x-1120341c2591
> 
> Best regards,


