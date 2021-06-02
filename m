Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7E4398ACE
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 15:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbhFBNfm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 09:35:42 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:41037 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229641AbhFBNfj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 09:35:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id oR0ElF4GeEXL0oR0HlyIJT; Wed, 02 Jun 2021 15:33:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622640832; bh=LFWHSUpwdl30Fg8v/0HPmG1ePOpSOXHpIl4e1gW4nGc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GGHb1X65bi9G2GQIGY0MPnn/+0UDioUO0W3VDlJ8Os/jYDK+oqjFZ58wdxypsYh1E
         9oLr8IN8h4LORuetfI0t8TFDcjaBhKqU+0c5jkg8GpQT3KZQlUXPZ3wGJ/6MPjT3Z4
         M0wG9Sxl8a6vk/hzz6DL5HU5Y6PttsWCkDAZpnqBvKarZli6MQTjt5beG9O5Ndts/L
         eXuJN18Hjayn1bOiQ0XqoSCNHPY06f4LT27gOfZx5vfuCNdDGRQm7wemtrirsJdobL
         rNkK8nZpkCp7HhVirdicH6eDYjfGhDxrDsFZ6/3Fdec9iZ+zMkVhK4ZJ3wBD11hVGV
         SlJR44gsBPk2Q==
Subject: Re: [PATCH 1/3] media: ivtv: get rid of DVB deprecated ioctls
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <cover.1622639751.git.mchehab+huawei@kernel.org>
 <b3443f8a96c543bd1b4ca01b314cf066d1d7251b.1622639751.git.mchehab+huawei@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c637cece-db9e-5d09-27e8-fcd1fbeddd67@xs4all.nl>
Date:   Wed, 2 Jun 2021 15:33:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <b3443f8a96c543bd1b4ca01b314cf066d1d7251b.1622639751.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGbY1txGs6YS3tmaiGzu1Wh0GvbJfw898bckgNQznO8mTpX01IkZRsSpxmEHCl7xcO8eZ9fOT56KrPC5nq5rpG2M+7jXmakSyTtDy9q8rDoXxixtn/Ck
 fjL5ShTMs72HO6untcCbq9mSyqnLanOStazrHEUYnA91u2acRDm7oqUta8c81pbg3IMAVP98ZLtup7iSK6jzAFzA5+e9FxOuodSM8opV/hLcJWa6xs/YriIY
 fNLGwlQ0OpBr09vuGJwY71f4XT7BfjKtcNSQMHoAG1513Z6HH4fOPGV8RFNk0zZryzs5nU2YHcctJKgr8TmW3ZotP+O74IoIDKaM2R18yMr0/ZreEcjeksFO
 VmpW83gfa4lvypg1Zabibbh+uDhIokzD8sQyQMX6fJoZK8QWvNGu2fLqaKFl/7+CzBp8E4Ju
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/06/2021 15:25, Mauro Carvalho Chehab wrote:
> The ivtv driver has gained support a long time ago for audio
> and video settings via V4L2 API.
> 
> Let's drop support of the duplicated controls implemented
> abusing the DVB API.

I thought these were removed a long time ago :-)

In any case:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/pci/ivtv/Kconfig       |  12 --
>  drivers/media/pci/ivtv/ivtv-driver.h |   2 -
>  drivers/media/pci/ivtv/ivtv-ioctl.c  | 221 ---------------------------
>  3 files changed, 235 deletions(-)
> 
> diff --git a/drivers/media/pci/ivtv/Kconfig b/drivers/media/pci/ivtv/Kconfig
> index c729e54692c4..e70502902b73 100644
> --- a/drivers/media/pci/ivtv/Kconfig
> +++ b/drivers/media/pci/ivtv/Kconfig
> @@ -29,18 +29,6 @@ config VIDEO_IVTV
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called ivtv.
>  
> -config VIDEO_IVTV_DEPRECATED_IOCTLS
> -	bool "enable the DVB ioctls abuse on ivtv driver"
> -	depends on VIDEO_IVTV
> -	help
> -	  Enable the usage of the a DVB set of ioctls that were abused by
> -	  IVTV driver for a while.
> -
> -	  Those ioctls were not needed for a long time, as IVTV implements
> -	  the proper V4L2 ioctls since kernel 3.3.
> -
> -	  If unsure, say N.
> -
>  config VIDEO_IVTV_ALSA
>  	tristate "Conexant cx23415/cx23416 ALSA interface for PCM audio capture"
>  	depends on VIDEO_IVTV && SND
> diff --git a/drivers/media/pci/ivtv/ivtv-driver.h b/drivers/media/pci/ivtv/ivtv-driver.h
> index e5efe525ad7b..4cf92dee6527 100644
> --- a/drivers/media/pci/ivtv/ivtv-driver.h
> +++ b/drivers/media/pci/ivtv/ivtv-driver.h
> @@ -57,8 +57,6 @@
>  #include <linux/uaccess.h>
>  #include <asm/byteorder.h>
>  
> -#include <linux/dvb/video.h>
> -#include <linux/dvb/audio.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-ctrls.h>
> diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
> index 35dccb31174c..da19b2e95e6c 100644
> --- a/drivers/media/pci/ivtv/ivtv-ioctl.c
> +++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
> @@ -23,11 +23,6 @@
>  #include <media/i2c/saa7127.h>
>  #include <media/tveeprom.h>
>  #include <media/v4l2-event.h>
> -#ifdef CONFIG_VIDEO_IVTV_DEPRECATED_IOCTLS
> -#include <linux/compat.h>
> -#include <linux/dvb/audio.h>
> -#include <linux/dvb/video.h>
> -#endif
>  
>  u16 ivtv_service2vbi(int type)
>  {
> @@ -1606,38 +1601,11 @@ static int ivtv_try_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder
>  	return ivtv_video_command(itv, id, dec, true);
>  }
>  
> -#ifdef CONFIG_VIDEO_IVTV_DEPRECATED_IOCTLS
> -static __inline__ void warn_deprecated_ioctl(const char *name)
> -{
> -	pr_warn_once("warning: the %s ioctl is deprecated. Don't use it, as it will be removed soon\n",
> -		     name);
> -}
> -
> -#ifdef CONFIG_COMPAT
> -struct compat_video_event {
> -	__s32 type;
> -	/* unused, make sure to use atomic time for y2038 if it ever gets used */
> -	compat_long_t timestamp;
> -	union {
> -		video_size_t size;
> -		unsigned int frame_rate;        /* in frames per 1000sec */
> -		unsigned char vsync_field;      /* unknown/odd/even/progressive */
> -	} u;
> -};
> -#define VIDEO_GET_EVENT32 _IOR('o', 28, struct compat_video_event)
> -#endif
> -
> -#endif
> -
>  static int ivtv_decoder_ioctls(struct file *filp, unsigned int cmd, void *arg)
>  {
>  	struct ivtv_open_id *id = fh2id(filp->private_data);
>  	struct ivtv *itv = id->itv;
>  	struct ivtv_stream *s = &itv->streams[id->type];
> -#ifdef CONFIG_VIDEO_IVTV_DEPRECATED_IOCTLS
> -	int nonblocking = filp->f_flags & O_NONBLOCK;
> -	unsigned long iarg = (unsigned long)arg;
> -#endif
>  
>  	switch (cmd) {
>  	case IVTV_IOC_DMA_FRAME: {
> @@ -1669,169 +1637,6 @@ static int ivtv_decoder_ioctls(struct file *filp, unsigned int cmd, void *arg)
>  		if (!(itv->v4l2_cap & V4L2_CAP_VIDEO_OUTPUT))
>  			return -EINVAL;
>  		return ivtv_passthrough_mode(itv, *(int *)arg != 0);
> -#ifdef CONFIG_VIDEO_IVTV_DEPRECATED_IOCTLS
> -	case VIDEO_GET_PTS: {
> -		s64 *pts = arg;
> -		s64 frame;
> -
> -		warn_deprecated_ioctl("VIDEO_GET_PTS");
> -		if (s->type < IVTV_DEC_STREAM_TYPE_MPG) {
> -			*pts = s->dma_pts;
> -			break;
> -		}
> -		if (!(itv->v4l2_cap & V4L2_CAP_VIDEO_OUTPUT))
> -			return -EINVAL;
> -		return ivtv_g_pts_frame(itv, pts, &frame);
> -	}
> -
> -	case VIDEO_GET_FRAME_COUNT: {
> -		s64 *frame = arg;
> -		s64 pts;
> -
> -		warn_deprecated_ioctl("VIDEO_GET_FRAME_COUNT");
> -		if (s->type < IVTV_DEC_STREAM_TYPE_MPG) {
> -			*frame = 0;
> -			break;
> -		}
> -		if (!(itv->v4l2_cap & V4L2_CAP_VIDEO_OUTPUT))
> -			return -EINVAL;
> -		return ivtv_g_pts_frame(itv, &pts, frame);
> -	}
> -
> -	case VIDEO_PLAY: {
> -		struct v4l2_decoder_cmd dc;
> -
> -		warn_deprecated_ioctl("VIDEO_PLAY");
> -		memset(&dc, 0, sizeof(dc));
> -		dc.cmd = V4L2_DEC_CMD_START;
> -		return ivtv_video_command(itv, id, &dc, 0);
> -	}
> -
> -	case VIDEO_STOP: {
> -		struct v4l2_decoder_cmd dc;
> -
> -		warn_deprecated_ioctl("VIDEO_STOP");
> -		memset(&dc, 0, sizeof(dc));
> -		dc.cmd = V4L2_DEC_CMD_STOP;
> -		dc.flags = V4L2_DEC_CMD_STOP_TO_BLACK | V4L2_DEC_CMD_STOP_IMMEDIATELY;
> -		return ivtv_video_command(itv, id, &dc, 0);
> -	}
> -
> -	case VIDEO_FREEZE: {
> -		struct v4l2_decoder_cmd dc;
> -
> -		warn_deprecated_ioctl("VIDEO_FREEZE");
> -		memset(&dc, 0, sizeof(dc));
> -		dc.cmd = V4L2_DEC_CMD_PAUSE;
> -		return ivtv_video_command(itv, id, &dc, 0);
> -	}
> -
> -	case VIDEO_CONTINUE: {
> -		struct v4l2_decoder_cmd dc;
> -
> -		warn_deprecated_ioctl("VIDEO_CONTINUE");
> -		memset(&dc, 0, sizeof(dc));
> -		dc.cmd = V4L2_DEC_CMD_RESUME;
> -		return ivtv_video_command(itv, id, &dc, 0);
> -	}
> -
> -	case VIDEO_COMMAND:
> -	case VIDEO_TRY_COMMAND: {
> -		/* Note: struct v4l2_decoder_cmd has the same layout as
> -		   struct video_command */
> -		struct v4l2_decoder_cmd *dc = arg;
> -		int try = (cmd == VIDEO_TRY_COMMAND);
> -
> -		if (try)
> -			warn_deprecated_ioctl("VIDEO_TRY_COMMAND");
> -		else
> -			warn_deprecated_ioctl("VIDEO_COMMAND");
> -		return ivtv_video_command(itv, id, dc, try);
> -	}
> -
> -#ifdef CONFIG_COMPAT
> -	case VIDEO_GET_EVENT32:
> -#endif
> -	case VIDEO_GET_EVENT: {
> -#ifdef CONFIG_COMPAT
> -		struct compat_video_event *ev32 = arg;
> -#endif
> -		struct video_event *ev = arg;
> -		DEFINE_WAIT(wait);
> -
> -		warn_deprecated_ioctl("VIDEO_GET_EVENT");
> -		if (!(itv->v4l2_cap & V4L2_CAP_VIDEO_OUTPUT))
> -			return -EINVAL;
> -		memset(ev, 0, sizeof(*ev));
> -		set_bit(IVTV_F_I_EV_VSYNC_ENABLED, &itv->i_flags);
> -
> -		while (1) {
> -			if (test_and_clear_bit(IVTV_F_I_EV_DEC_STOPPED, &itv->i_flags))
> -				ev->type = VIDEO_EVENT_DECODER_STOPPED;
> -			else if (test_and_clear_bit(IVTV_F_I_EV_VSYNC, &itv->i_flags)) {
> -				unsigned char vsync_field;
> -
> -				ev->type = VIDEO_EVENT_VSYNC;
> -				vsync_field = test_bit(IVTV_F_I_EV_VSYNC_FIELD, &itv->i_flags) ?
> -					VIDEO_VSYNC_FIELD_ODD : VIDEO_VSYNC_FIELD_EVEN;
> -				if (itv->output_mode == OUT_UDMA_YUV &&
> -					(itv->yuv_info.lace_mode & IVTV_YUV_MODE_MASK) ==
> -								IVTV_YUV_MODE_PROGRESSIVE) {
> -					vsync_field = VIDEO_VSYNC_FIELD_PROGRESSIVE;
> -				}
> -#ifdef CONFIG_COMPAT
> -				if (cmd == VIDEO_GET_EVENT32)
> -					ev32->u.vsync_field = vsync_field;
> -				else
> -#endif
> -					ev->u.vsync_field = vsync_field;
> -			}
> -			if (ev->type)
> -				return 0;
> -			if (nonblocking)
> -				return -EAGAIN;
> -			/* Wait for event. Note that serialize_lock is locked,
> -			   so to allow other processes to access the driver while
> -			   we are waiting unlock first and later lock again. */
> -			mutex_unlock(&itv->serialize_lock);
> -			prepare_to_wait(&itv->event_waitq, &wait, TASK_INTERRUPTIBLE);
> -			if (!test_bit(IVTV_F_I_EV_DEC_STOPPED, &itv->i_flags) &&
> -			    !test_bit(IVTV_F_I_EV_VSYNC, &itv->i_flags))
> -				schedule();
> -			finish_wait(&itv->event_waitq, &wait);
> -			mutex_lock(&itv->serialize_lock);
> -			if (signal_pending(current)) {
> -				/* return if a signal was received */
> -				IVTV_DEBUG_INFO("User stopped wait for event\n");
> -				return -EINTR;
> -			}
> -		}
> -		break;
> -	}
> -
> -	case VIDEO_SELECT_SOURCE:
> -		warn_deprecated_ioctl("VIDEO_SELECT_SOURCE");
> -		if (!(itv->v4l2_cap & V4L2_CAP_VIDEO_OUTPUT))
> -			return -EINVAL;
> -		return ivtv_passthrough_mode(itv, iarg == VIDEO_SOURCE_DEMUX);
> -
> -	case AUDIO_SET_MUTE:
> -		warn_deprecated_ioctl("AUDIO_SET_MUTE");
> -		itv->speed_mute_audio = iarg;
> -		return 0;
> -
> -	case AUDIO_CHANNEL_SELECT:
> -		warn_deprecated_ioctl("AUDIO_CHANNEL_SELECT");
> -		if (iarg > AUDIO_STEREO_SWAPPED)
> -			return -EINVAL;
> -		return v4l2_ctrl_s_ctrl(itv->ctrl_audio_playback, iarg + 1);
> -
> -	case AUDIO_BILINGUAL_CHANNEL_SELECT:
> -		warn_deprecated_ioctl("AUDIO_BILINGUAL_CHANNEL_SELECT");
> -		if (iarg > AUDIO_STEREO_SWAPPED)
> -			return -EINVAL;
> -		return v4l2_ctrl_s_ctrl(itv->ctrl_audio_multilingual_playback, iarg + 1);
> -#endif
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1846,17 +1651,6 @@ static long ivtv_default(struct file *file, void *fh, bool valid_prio,
>  	if (!valid_prio) {
>  		switch (cmd) {
>  		case IVTV_IOC_PASSTHROUGH_MODE:
> -#ifdef CONFIG_VIDEO_IVTV_DEPRECATED_IOCTLS
> -		case VIDEO_PLAY:
> -		case VIDEO_STOP:
> -		case VIDEO_FREEZE:
> -		case VIDEO_CONTINUE:
> -		case VIDEO_COMMAND:
> -		case VIDEO_SELECT_SOURCE:
> -		case AUDIO_SET_MUTE:
> -		case AUDIO_CHANNEL_SELECT:
> -		case AUDIO_BILINGUAL_CHANNEL_SELECT:
> -#endif
>  			return -EBUSY;
>  		}
>  	}
> @@ -1874,21 +1668,6 @@ static long ivtv_default(struct file *file, void *fh, bool valid_prio,
>  
>  	case IVTV_IOC_DMA_FRAME:
>  	case IVTV_IOC_PASSTHROUGH_MODE:
> -#ifdef CONFIG_VIDEO_IVTV_DEPRECATED_IOCTLS
> -	case VIDEO_GET_PTS:
> -	case VIDEO_GET_FRAME_COUNT:
> -	case VIDEO_GET_EVENT:
> -	case VIDEO_PLAY:
> -	case VIDEO_STOP:
> -	case VIDEO_FREEZE:
> -	case VIDEO_CONTINUE:
> -	case VIDEO_COMMAND:
> -	case VIDEO_TRY_COMMAND:
> -	case VIDEO_SELECT_SOURCE:
> -	case AUDIO_SET_MUTE:
> -	case AUDIO_CHANNEL_SELECT:
> -	case AUDIO_BILINGUAL_CHANNEL_SELECT:
> -#endif
>  		return ivtv_decoder_ioctls(file, cmd, (void *)arg);
>  
>  	default:
> 

