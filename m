Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23851B576E
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 10:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgDWIne (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 04:43:34 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:50519 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725884AbgDWInd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 04:43:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RXSBjL0ge7xncRXSEjPnVX; Thu, 23 Apr 2020 10:43:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587631410; bh=c1EMBOYGUYJP4u6BZgEaypwEFb+DLTElghFFghXcZtY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RwVZJit5OBHo1EEMM4l/O8QAbKdkVcpwVf6xeUiDLG+2kFhOlIExmfWKtVwHMjaS0
         waVRSal7os2rNs0fef/Dc1knJIRsSaLRAfhG4FaYVeVT9+T8iYUszlgxxyVHcd8f/U
         5hXkaFZcJw1hTjgW52Rc07LJsjpwpTwKtOJ2qJL5NEyQIqAtsP7h5tKmfl5ys4QpGm
         DITvYs/Bg/82N41K8I3sjWBl9B+Aym/d7AdFVT6W9A6Ij5fY00Xd+0BJzNoAWIdBSg
         54XG40XqhhEPRNAQy9kGwoItxL2suPeZT3Z7hOliDFeF8xu3tGCOKWd/IcwNIWhPfz
         P68TFS2JCZfCw==
Subject: Re: [PATCH 10/12] utils: fix fallthrough warnings
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200422003735.3891-1-rosenp@gmail.com>
 <20200422003735.3891-10-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <469e8b7f-c319-8e3b-9026-0b227dddab97@xs4all.nl>
Date:   Thu, 23 Apr 2020 10:43:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200422003735.3891-10-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA44CjvyZhA2q1GXjgCJ420s2PzAIHsepqMFs9tk3b3SNbziSNGfIM2J8JXMb6Zwuhl/he5uSGViHsG9Qtt54iYu5NzQ/Gl2v/OriMtD7fhtOAIo4O3/
 i/3qR8jk4Af1B8voVZhGFx8m91aFugMM0mT21oPEWPI0F7g3ZRSQeNZ+Ejr5NgqSbPobFdfbkvLimkR7UGm2K/Kk/lFmTdDTDQc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2020 02:37, Rosen Penev wrote:
> Comments are not enough for clang. Changed to use the C++ attribute.
> 
> Found with -Wimplicit-fallthrough
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/cec-compliance/cec-compliance.cpp      |  7 +++++++
>  utils/cec-ctl/cec-ctl.cpp                    |  8 +++++++-
>  utils/cec-follower/cec-follower.cpp          |  7 +++++++
>  utils/cec-follower/cec-processing.cpp        |  9 ++++++++-
>  utils/cec-follower/cec-tuner.cpp             | 12 +++++++++---
>  utils/libcecutil/cec-log.cpp                 |  8 +++++++-
>  utils/v4l2-compliance/v4l2-test-colors.cpp   | 16 +++++++++++-----
>  utils/v4l2-compliance/v4l2-test-controls.cpp | 16 +++++++++++-----
>  utils/v4l2-compliance/v4l2-test-formats.cpp  | 10 ++++++++--
>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp        | 10 ++++++++--
>  utils/v4l2-ctl/v4l2-ctl-vbi.cpp              | 10 ++++++++--
>  11 files changed, 91 insertions(+), 22 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
> index 1c62b5c9..e9fce337 100644
> --- a/utils/cec-compliance/cec-compliance.cpp
> +++ b/utils/cec-compliance/cec-compliance.cpp
> @@ -24,6 +24,12 @@
>  #include "version.h"
>  #endif
>  
> +#ifdef __clang__
> +#define FALLTHROUGH [[clang::fallthrough]]
> +#else
> +#define FALLTHROUGH [[gnu::fallthrough]]
> +#endif

Yuck, no uppercase please.

I am OK with lowercase 'fallthrough', since that's what the linux kernel settled on
as well.

This #ifdef/#else/#endif is replicated in several sources, so let's put this in a
header instead.

Regards,

	Hans

> +
>  /* Short option list
>  
>     Please keep in alphabetical order.
> @@ -486,6 +492,7 @@ void sad_decode(struct short_audio_desc *sad, __u32 descriptor)
>  		case SAD_EXT_TYPE_MPEG_H_3D_AUDIO:
>  		case SAD_EXT_TYPE_AC_4:
>  			sad->format_dependent = b3 & 0x07;
> +			FALLTHROUGH;
>  		case SAD_EXT_TYPE_LPCM_3D_AUDIO:
>  			sad->bit_depth_mask = b3 & 0x07;
>  			break;
> diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
> index f0e31aca..a3698a67 100644
> --- a/utils/cec-ctl/cec-ctl.cpp
> +++ b/utils/cec-ctl/cec-ctl.cpp
> @@ -37,6 +37,12 @@
>  
>  #include "cec-ctl.h"
>  
> +#ifdef __clang__
> +#define FALLTHROUGH [[clang::fallthrough]]
> +#else
> +#define FALLTHROUGH [[gnu::fallthrough]]
> +#endif
> +
>  static struct timespec start_monotonic;
>  static struct timeval start_timeofday;
>  static bool ignore_la[16];
> @@ -1967,7 +1973,7 @@ int main(int argc, char **argv)
>  			break;
>  		case OptPhysAddrFromEDIDPoll:
>  			edid_path = optarg;
> -			/* fall-through */
> +			FALLTHROUGH;
>  		case OptPhysAddrFromEDID:
>  			phys_addr = parse_phys_addr_from_edid(optarg);
>  			break;
> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
> index 1eeae2d4..2d61d5f9 100644
> --- a/utils/cec-follower/cec-follower.cpp
> +++ b/utils/cec-follower/cec-follower.cpp
> @@ -23,6 +23,12 @@
>  #include "version.h"
>  #endif
>  
> +#ifdef __clang__
> +#define FALLTHROUGH [[clang::fallthrough]]
> +#else
> +#define FALLTHROUGH [[gnu::fallthrough]]
> +#endif
> +
>  /* Short option list
>  
>     Please keep in alphabetical order.
> @@ -142,6 +148,7 @@ void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor)
>  		case SAD_EXT_TYPE_MPEG_H_3D_AUDIO:
>  		case SAD_EXT_TYPE_AC_4:
>  			b3 |= sad->format_dependent & 0x07;
> +			FALLTHROUGH;
>  		case SAD_EXT_TYPE_LPCM_3D_AUDIO:
>  			b3 |= sad->bit_depth_mask & 0x07;
>  			break;
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 8e3a33a2..68bfdca3 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -19,6 +19,12 @@
>  
>  #include "cec-follower.h"
>  
> +#ifdef __clang__
> +#define FALLTHROUGH [[clang::fallthrough]]
> +#else
> +#define FALLTHROUGH [[gnu::fallthrough]]
> +#endif
> +
>  #define VOLUME_MAX 0x64
>  #define VOLUME_MIN 0
>  
> @@ -352,7 +358,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  		if (cec_has_tv(1 << la) && la_info[la].phys_addr == 0)
>  			warn("TV (0) at 0.0.0.0 sent Routing Information.");
>  	}
> -
> +	FALLTHROUGH;
>  
>  		/* System Information */
>  
> @@ -708,6 +714,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  		cec_msg_system_audio_mode_status(&msg, node->state.sac_active ? CEC_OP_SYS_AUD_STATUS_ON :
>  						 CEC_OP_SYS_AUD_STATUS_OFF);
>  		transmit(node, &msg);
> +		FALLTHROUGH;
>  	case CEC_MSG_GIVE_AUDIO_STATUS:
>  		if (!cec_has_audiosystem(1 << me))
>  			break;
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index aa19f55d..af7c6437 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -8,6 +8,12 @@
>  
>  #include "cec-follower.h"
>  
> +#ifdef __clang__
> +#define FALLTHROUGH [[clang::fallthrough]]
> +#else
> +#define FALLTHROUGH [[gnu::fallthrough]]
> +#endif
> +
>  #define NUM_ANALOG_FREQS 3
>  #define NUM_DIGITAL_CHANS 3
>  #define TOT_ANALOG_FREQS (sizeof(analog_freqs_khz) / sizeof(analog_freqs_khz[0][0][0]))
> @@ -303,21 +309,21 @@ static int digital_get_service_idx(struct cec_op_digital_service_id *digital)
>  	switch (digital->dig_bcast_system) {
>  	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T:
>  		is_terrestrial = true;
> -		/* fall through */
> +		FALLTHROUGH;
>  	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS:
>  		info = &digital_arib_data[is_terrestrial][0];
>  		offset = is_terrestrial * NUM_DIGITAL_CHANS;
>  		break;
>  	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T:
>  		is_terrestrial = true;
> -		/* fall through */
> +		FALLTHROUGH;
>  	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT:
>  		info = &digital_atsc_data[is_terrestrial][0];
>  		offset = (2 + is_terrestrial) * NUM_DIGITAL_CHANS;
>  		break;
>  	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T:
>  		is_terrestrial = true;
> -		/* fall through */
> +		FALLTHROUGH;
>  	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2:
>  		info = &digital_dvb_data[is_terrestrial][0];
>  		offset = (4 + is_terrestrial) * NUM_DIGITAL_CHANS;
> diff --git a/utils/libcecutil/cec-log.cpp b/utils/libcecutil/cec-log.cpp
> index 28a1ecac..9844ac43 100644
> --- a/utils/libcecutil/cec-log.cpp
> +++ b/utils/libcecutil/cec-log.cpp
> @@ -15,6 +15,12 @@
>  #include "cec-info.h"
>  #include "cec-log.h"
>  
> +#ifdef __clang__
> +#define FALLTHROUGH [[clang::fallthrough]]
> +#else
> +#define FALLTHROUGH [[gnu::fallthrough]]
> +#endif
> +
>  static const struct cec_arg arg_u8 = {
>  	CEC_ARG_TYPE_U8,
>  };
> @@ -44,7 +50,7 @@ static void log_arg(const struct cec_arg *arg, const char *arg_name, __u32 val)
>  				return;
>  			}
>  		}
> -		/* fall through */
> +		FALLTHROUGH;
>  	case CEC_ARG_TYPE_U8:
>  		if (!strcmp(arg_name, "video-latency") ||
>  		    !strcmp(arg_name, "audio-out-delay")) {
> diff --git a/utils/v4l2-compliance/v4l2-test-colors.cpp b/utils/v4l2-compliance/v4l2-test-colors.cpp
> index 887b198b..d37300e9 100644
> --- a/utils/v4l2-compliance/v4l2-test-colors.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-colors.cpp
> @@ -30,6 +30,12 @@
>  #include <math.h>
>  #include "v4l2-compliance.h"
>  
> +#ifdef __clang__
> +#define FALLTHROUGH [[clang::fallthrough]]
> +#else
> +#define FALLTHROUGH [[gnu::fallthrough]]
> +#endif
> +
>  static void setupPlanes(const cv4l_fmt &fmt, __u8 *planes[3])
>  {
>  	if (fmt.g_num_planes() > 1)
> @@ -328,7 +334,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * const planes[3],
>  	case V4L2_PIX_FMT_RGBA444:
>  	case V4L2_PIX_FMT_BGRA444:
>  		c.a = (v16 >> 12) / 15.0;
> -		/* fall through */
> +		FALLTHROUGH;
>  	case V4L2_PIX_FMT_RGB444:
>  	case V4L2_PIX_FMT_XRGB444:
>  	case V4L2_PIX_FMT_XBGR444:
> @@ -345,7 +351,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * const planes[3],
>  	case V4L2_PIX_FMT_ABGR555:
>  	case V4L2_PIX_FMT_BGRA555:
>  		c.a = v16 >> 15;
> -		/* fall through */
> +		FALLTHROUGH;
>  	case V4L2_PIX_FMT_YUV555:
>  	case V4L2_PIX_FMT_RGB555:
>  	case V4L2_PIX_FMT_XRGB555:
> @@ -376,7 +382,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * const planes[3],
>  	case V4L2_PIX_FMT_RGBA32:
>  	case V4L2_PIX_FMT_BGRA32:
>  		c.a = ((v32 >> 24) & 0xff) / 255.0;
> -		/* fall through */
> +		FALLTHROUGH;
>  	default:
>  		c.r = ((v32 >> 16) & 0xff) / 255.0;
>  		c.g = ((v32 >> 8) & 0xff) / 255.0;
> @@ -444,7 +450,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * const planes[3],
>  		Y = (Y - 16.0 / 255.0) * 255.0 / 219.0;
>  		cb *= 255.0 / 224.0;
>  		cr *= 255.0 / 224.0;
> -		/* fall through */
> +		FALLTHROUGH;
>  	case V4L2_YCBCR_ENC_601:
>  	default:
>  		ycbcr2rgb(bt601, Y, cb, cr, c);
> @@ -453,7 +459,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * const planes[3],
>  		Y = (Y - 16.0 / 255.0) * 255.0 / 219.0;
>  		cb *= 255.0 / 224.0;
>  		cr *= 255.0 / 224.0;
> -		/* fall through */
> +		FALLTHROUGH;
>  	case V4L2_YCBCR_ENC_709:
>  		ycbcr2rgb(rec709, Y, cb, cr, c);
>  		break;
> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> index 251a6049..2de888cf 100644
> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> @@ -34,6 +34,12 @@
>  
>  #define V4L2_CTRL_CLASS_VIVID 0x00f00000
>  
> +#ifdef __clang__
> +#define FALLTHROUGH [[clang::fallthrough]]
> +#else
> +#define FALLTHROUGH [[gnu::fallthrough]]
> +#endif
> +
>  static int checkQCtrl(struct node *node, struct test_query_ext_ctrl &qctrl)
>  {
>  	struct v4l2_querymenu qmenu;
> @@ -61,20 +67,20 @@ static int checkQCtrl(struct node *node, struct test_query_ext_ctrl &qctrl)
>  	case V4L2_CTRL_TYPE_BOOLEAN:
>  		if (qctrl.maximum > 1)
>  			return fail("invalid boolean max value\n");
> -		/* fall through */
> +		FALLTHROUGH;
>  	case V4L2_CTRL_TYPE_MENU:
>  	case V4L2_CTRL_TYPE_INTEGER_MENU:
>  		if (qctrl.step != 1)
>  			return fail("invalid step value %lld\n", qctrl.step);
>  		if (qctrl.minimum < 0)
>  			return fail("min < 0\n");
> -		/* fall through */
> +		FALLTHROUGH;
>  	case V4L2_CTRL_TYPE_INTEGER:
>  	case V4L2_CTRL_TYPE_INTEGER64:
>  		if (qctrl.default_value < qctrl.minimum ||
>  		    qctrl.default_value > qctrl.maximum)
>  			return fail("def < min || def > max\n");
> -		/* fall through */
> +		FALLTHROUGH;
>  	case V4L2_CTRL_TYPE_STRING:
>  		if (qctrl.minimum > qctrl.maximum)
>  			return fail("min > max\n");
> @@ -116,7 +122,7 @@ static int checkQCtrl(struct node *node, struct test_query_ext_ctrl &qctrl)
>  	case V4L2_CTRL_TYPE_BUTTON:
>  		if ((fl & rw_mask) != V4L2_CTRL_FLAG_WRITE_ONLY)
>  			return fail("button control not write only\n");
> -		/* fall through */
> +		FALLTHROUGH;
>  	case V4L2_CTRL_TYPE_BOOLEAN:
>  	case V4L2_CTRL_TYPE_MENU:
>  	case V4L2_CTRL_TYPE_INTEGER_MENU:
> @@ -124,7 +130,7 @@ static int checkQCtrl(struct node *node, struct test_query_ext_ctrl &qctrl)
>  	case V4L2_CTRL_TYPE_BITMASK:
>  		if (fl & V4L2_CTRL_FLAG_SLIDER)
>  			return fail("slider makes only sense for integer controls\n");
> -		/* fall through */
> +		FALLTHROUGH;
>  	case V4L2_CTRL_TYPE_INTEGER64:
>  	case V4L2_CTRL_TYPE_INTEGER:
>  		if ((fl & rw_mask) == rw_mask)
> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
> index 3fc87316..9e98cf99 100644
> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
> @@ -32,6 +32,12 @@
>  #include <assert.h>
>  #include "v4l2-compliance.h"
>  
> +#ifdef __clang__
> +#define FALLTHROUGH [[clang::fallthrough]]
> +#else
> +#define FALLTHROUGH [[gnu::fallthrough]]
> +#endif
> +
>  static const __u32 buftype2cap[] = {
>  	0,
>  	V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_M2M,
> @@ -97,7 +103,7 @@ static int testEnumFrameIntervals(struct node *node, __u32 pixfmt,
>  		case V4L2_FRMIVAL_TYPE_CONTINUOUS:
>  			if (sw->step.numerator != 1 || sw->step.denominator != 1)
>  				return fail("invalid step for continuous frameinterval\n");
> -			/* fallthrough */
> +			FALLTHROUGH;
>  		case V4L2_FRMIVAL_TYPE_STEPWISE:
>  			if (frmival.index)
>  				return fail("index must be 0 for stepwise/continuous frameintervals\n");
> @@ -183,7 +189,7 @@ static int testEnumFrameSizes(struct node *node, __u32 pixfmt)
>  		case V4L2_FRMSIZE_TYPE_CONTINUOUS:
>  			if (frmsize.stepwise.step_width != 1 || frmsize.stepwise.step_height != 1)
>  				return fail("invalid step_width/height for continuous framesize\n");
> -			/* fallthrough */
> +			FALLTHROUGH;
>  		case V4L2_FRMSIZE_TYPE_STEPWISE:
>  			if (frmsize.index)
>  				return fail("index must be 0 for stepwise/continuous framesizes\n");
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index 6981a3cc..bb464e99 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -24,6 +24,12 @@
>  #include <media-info.h>
>  #include <fwht-ctrls.h>
>  
> +#ifdef __clang__
> +#define FALLTHROUGH [[clang::fallthrough]]
> +#else
> +#define FALLTHROUGH [[gnu::fallthrough]]
> +#endif
> +
>  extern "C" {
>  #include "v4l2-tpg.h"
>  }
> @@ -763,7 +769,7 @@ void streaming_cmd(int ch, char *optarg)
>  		break;
>  	case OptStreamUser:
>  		memory = V4L2_MEMORY_USERPTR;
> -		/* fall through */
> +		FALLTHROUGH;
>  	case OptStreamMmap:
>  		if (optarg) {
>  			reqbufs_count_cap = strtoul(optarg, 0L, 0);
> @@ -776,7 +782,7 @@ void streaming_cmd(int ch, char *optarg)
>  		break;
>  	case OptStreamOutUser:
>  		out_memory = V4L2_MEMORY_USERPTR;
> -		/* fall through */
> +		FALLTHROUGH;
>  	case OptStreamOutMmap:
>  		if (optarg) {
>  			reqbufs_count_out = strtoul(optarg, 0L, 0);
> diff --git a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
> index c5960f78..82d01b58 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
> @@ -16,6 +16,12 @@
>  
>  #include "v4l2-ctl.h"
>  
> +#ifdef __clang__
> +#define FALLTHROUGH [[clang::fallthrough]]
> +#else
> +#define FALLTHROUGH [[gnu::fallthrough]]
> +#endif
> +
>  static struct v4l2_format sliced_fmt;	  /* set_format/get_format for sliced VBI */
>  static struct v4l2_format sliced_fmt_out; /* set_format/get_format for sliced VBI output */
>  static struct v4l2_format raw_fmt;	  /* set_format/get_format for VBI */
> @@ -87,7 +93,7 @@ void vbi_cmd(int ch, char *optarg)
>  	case OptSetSlicedVbiOutFormat:
>  	case OptTrySlicedVbiOutFormat:
>  		sliced = &sliced_fmt_out;
> -		/* fall through */
> +		FALLTHROUGH;
>  	case OptSetSlicedVbiFormat:
>  	case OptTrySlicedVbiFormat:
>  		sliced->fmt.sliced.service_set = 0;
> @@ -130,7 +136,7 @@ void vbi_cmd(int ch, char *optarg)
>  	case OptSetVbiOutFormat:
>  	case OptTryVbiOutFormat:
>  		raw = &raw_fmt_out;
> -		/* fall through */
> +		FALLTHROUGH;
>  	case OptSetVbiFormat:
>  	case OptTryVbiFormat:
>  		subs = optarg;
> 

