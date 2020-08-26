Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05FB2253122
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 16:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgHZOVX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 10:21:23 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51733 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728008AbgHZOVE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 10:21:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id AwIJkzJxLywL5AwIKkqMWe; Wed, 26 Aug 2020 16:20:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1598451659; bh=8RP6U40NlNtNxXhOJ6FxD6K10+CxJT2U1pfZ20p8BNc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=CDu2j8PpdBiY8uBJ0u+B1T1V5quwm36+t8wyjlbKMyzNzuau7IuDAo82ooJv2LHwP
         g9FBcJ17h7qfW4e11eeh/aMNkHmi8WBUzNxxcNx7qHCCmCZjmJEfDNqLGq3DPuNT9h
         rde5fmSN6HEqwkBBYL8aLL79DBOLM09OAZDAFOTHWyFc2ZsyHxDJUy3hGtFaKR0R+3
         kfb5i5/Cq/6fm9ZMLSeXRIRhEgMRmNHFY49QkWA5IpuS08f8SnrMqspEE9zACUTjG7
         trEwYpPUDp4knMd6eWbEOaNYdOYGYbEvxxnYsdWSKj0Muu+iCmClt8dY53lapsK7E/
         qzmJbwY4A0lWw==
Subject: Re: [PATCH v2] utils: v4l2-ctl: support V4L2_CAP_IO_MC in v4l2-ctl
 '--list-formats-*' commands
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200825140806.13978-1-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3a4aa849-4b46-9086-2ff3-e34c1b524ff9@xs4all.nl>
Date:   Wed, 26 Aug 2020 16:20:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200825140806.13978-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFeFdoC51afmFTD3MQzEja77Gf7l2Bt4Dr/fkUS95s19X7OCgh0SQSxd/bJxCvMs2zlAmqBiW7M10j6ToGxoh7J1muOcp9Yc+sFl9EzCcx+J44itzCls
 rs1E9XRoRHSRMd7GlLcjO/90FVtcj9983qrvd6QOejRSrLgoAVKLLUnVsjQFVadTum7YiY1ctWM71mh3/j5PkHla/fwzL5PAmZ3Nk3P+WCX5wIje4sxUbgnt
 f5CIcGh9IxtTpnTS6g03TWzO4yTrTeNojhM4UhERYn3gozqP3Zju2FUDMSEAUgAocTMZtDMfx2ttcCY+HMysLo7OjndgwOjStXLUluqt/imLfXs4RgVLTsvW
 Q9K/N/P3xTfyAKQnLFsuo2E1aG97AP8FiVF13t8s43cMBfU6OF2om/HDCwRx809IM02MFMorPTEUkssp8U16+xiPnW0ma4qP8brW4ridjRJ9O6EM6YqGASVg
 JKMbUwH7FtcZ41UAxqngEr3QqJG/FpLzv6riC7ZxJBnCLJw+1aB0jD5v1mYt4GgKZR3gSrQIAFHAYJxbZu1761/YF1ytYiSHii9QYdmhGQ8P42BJ3p+E2hRg
 ySaCH1xua5pcj/j9/0GBwaGbjtlFT6SkJOcVVFpwjC0+bjBamVwEBDxm7fMHmLDoe4g=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/08/2020 16:08, Dafna Hirschfeld wrote:
> Add optional <mbus_code> arg to 'v4l2-ctl --list-formats-*'
> commands for capture, metadata and output devices.
> If <mbus_code> is given and the device has capability
> V4L2_CAP_IO_MC then list only the formats that matches the
> mbus code.
> The mbus_code is ignored for devices that don't use it
> or don't have the V4L2_CAP_IO_MC capability.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> changes since v1: fixes according to comments from Hans
> 
>  utils/common/cv4l-helpers.h         |  3 ++-
>  utils/v4l2-ctl/v4l2-ctl-meta.cpp    | 20 ++++++++++++++++----
>  utils/v4l2-ctl/v4l2-ctl-overlay.cpp |  2 +-
>  utils/v4l2-ctl/v4l2-ctl-sdr.cpp     |  4 ++--
>  utils/v4l2-ctl/v4l2-ctl-vidcap.cpp  | 23 ++++++++++++++++++-----
>  utils/v4l2-ctl/v4l2-ctl-vidout.cpp  | 22 ++++++++++++++++------
>  utils/v4l2-ctl/v4l2-ctl.cpp         | 26 ++++++++++++++++----------
>  utils/v4l2-ctl/v4l2-ctl.h           |  4 ++--
>  8 files changed, 73 insertions(+), 31 deletions(-)
> 
> diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
> index 6295054a..3cee372b 100644
> --- a/utils/common/cv4l-helpers.h
> +++ b/utils/common/cv4l-helpers.h
> @@ -483,12 +483,13 @@ public:
>  		return cv4l_ioctl(VIDIOC_ENUM_DV_TIMINGS, &timings);
>  	}
>  
> -	int enum_fmt(v4l2_fmtdesc &fmt, bool init = false, int index = 0, unsigned type = 0)
> +	int enum_fmt(v4l2_fmtdesc &fmt, bool init = false, int index = 0, unsigned type = 0, __u32 mbus_code = 0)
>  	{
>  		if (init) {
>  			memset(&fmt, 0, sizeof(fmt));
>  			fmt.type = type ? type : g_type();
>  			fmt.index = index;
> +			fmt.mbus_code = mbus_code;
>  		} else {
>  			fmt.index++;
>  		}
> diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> index b4c7bb89..3382c631 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> @@ -18,11 +18,15 @@
>  #include "v4l2-ctl.h"
>  
>  static struct v4l2_format vfmt;	/* set_format/get_format */
> +static unsigned mbus_code;
>  
>  void meta_usage()
>  {
>  	printf("\nMetadata Formats options:\n"
> -	       "  --list-formats-meta display supported metadata capture formats [VIDIOC_ENUM_FMT]\n"
> +	       "  --list-formats-meta [<mbus_code>] display supported metadata capture formats.\n"
> +	       "		      <mbus_code> is an optional media bus code, if the driver has\n"
> +	       "		      capability V4L2_CAP_IO_MC then only formats that support this\n"
> +	       "		      media bus code are listed [VIDIOC_ENUM_FMT]\n"
>  	       "  --get-fmt-meta      query the metadata capture format [VIDIOC_G_FMT]\n"
>  	       "  --set-fmt-meta <f>  set the metadata capture format [VIDIOC_S_FMT]\n"
>  	       "                     parameter is either the format index as reported by\n"
> @@ -30,7 +34,10 @@ void meta_usage()
>  	       "  --try-fmt-meta <f>  try the metadata capture format [VIDIOC_TRY_FMT]\n"
>  	       "                     parameter is either the format index as reported by\n"
>  	       "                     --list-formats-meta, or the fourcc value as a string\n"
> -	       "  --list-formats-meta-out display supported metadata output formats [VIDIOC_ENUM_FMT]\n"
> +	       "  --list-formats-meta-out [<mbus_code>] display supported metadata output formats.\n"
> +	       "		      <mbus_code> is an optional media bus code, if the driver has\n"
> +	       "		      capability V4L2_CAP_IO_MC then only formats that support this\n"
> +	       "		      media bus code are listed [VIDIOC_ENUM_FMT]\n"
>  	       "  --get-fmt-meta-out      query the metadata output format [VIDIOC_G_FMT]\n"
>  	       "  --set-fmt-meta-out <f>  set the metadata output format [VIDIOC_S_FMT]\n"
>  	       "                          parameter is either the format index as reported by\n"
> @@ -58,6 +65,11 @@ void meta_cmd(int ch, char *optarg)
>  			vfmt.fmt.meta.dataformat = strtol(optarg, 0L, 0);
>  		}
>  		break;
> +	case OptListMetaFormats:
> +	case OptListMetaOutFormats:
> +		if(optarg)

Space after 'if'!

> +			mbus_code = strtoul(optarg, 0L, 0);

Make two statics: mbus_code and mbus_code_out, one for each buffer type.

> +		break;
>  	}
>  }
>  
> @@ -120,12 +132,12 @@ void meta_list(cv4l_fd &fd)
>  {
>  	if (options[OptListMetaFormats]) {
>  		printf("ioctl: VIDIOC_ENUM_FMT\n");
> -		print_video_formats(fd, V4L2_BUF_TYPE_META_CAPTURE);
> +		print_video_formats(fd, V4L2_BUF_TYPE_META_CAPTURE, mbus_code);
>  	}
>  
>  	if (options[OptListMetaOutFormats]) {
>  		printf("ioctl: VIDIOC_ENUM_FMT\n");
> -		print_video_formats(fd, V4L2_BUF_TYPE_META_OUTPUT);
> +		print_video_formats(fd, V4L2_BUF_TYPE_META_OUTPUT, mbus_code);
>  	}
>  }
>  
> diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
> index 7809a6db..75681332 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
> @@ -539,7 +539,7 @@ void overlay_list(cv4l_fd &fd)
>  {
>  	if (options[OptListOverlayFormats]) {
>  		printf("ioctl: VIDIOC_ENUM_FMT\n");
> -		print_video_formats(fd, V4L2_BUF_TYPE_VIDEO_OVERLAY);
> +		print_video_formats(fd, V4L2_BUF_TYPE_VIDEO_OVERLAY, 0);
>  	}
>  	if (options[OptFindFb])
>  		find_fb(fd.g_fd());
> diff --git a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
> index 7a36341a..5b724696 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
> @@ -139,10 +139,10 @@ void sdr_list(cv4l_fd &fd)
>  {
>  	if (options[OptListSdrFormats]) {
>  		printf("ioctl: VIDIOC_ENUM_FMT\n");
> -		print_video_formats(fd, V4L2_BUF_TYPE_SDR_CAPTURE);
> +		print_video_formats(fd, V4L2_BUF_TYPE_SDR_CAPTURE, 0);
>  	}
>  	if (options[OptListSdrOutFormats]) {
>  		printf("ioctl: VIDIOC_ENUM_FMT\n");
> -		print_video_formats(fd, V4L2_BUF_TYPE_SDR_OUTPUT);
> +		print_video_formats(fd, V4L2_BUF_TYPE_SDR_OUTPUT, 0);
>  	}
>  }
> diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> index 5abab5e7..d0a0d120 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> @@ -23,13 +23,21 @@ static unsigned set_fmts;
>  static __u32 width, height, pixfmt, field, flags;
>  static __u32 bytesperline[VIDEO_MAX_PLANES];
>  static __u32 sizeimage[VIDEO_MAX_PLANES];
> +static unsigned mbus_code;
>  
>  void vidcap_usage()
>  {
>  	printf("\nVideo Capture Formats options:\n"
> -	       "  --list-formats     display supported video formats [VIDIOC_ENUM_FMT]\n"
> -	       "  --list-formats-ext display supported video formats including frame sizes\n"
> -	       "                     and intervals\n"
> +	       "  --list-formats [<mbus_code>]\n"
> +	       "		     display supported video formats. <mbus_code> is an optional\n"
> +	       "		     media bus code, if the driver has capability V4L2_CAP_IO_MC\n"
> +	       "		     then only formats that support this media bus code are listed\n"
> +	       "		     [VIDIOC_ENUM_FMT]\n"
> +	       "  --list-formats-ext [<mbus_code>]\n"
> +	       "		     display supported video formats including frame sizes and intervals\n"
> +	       "		     <mbus_code> is an optional media bus code, if the driver has\n"
> +	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
> +	       "		     media bus code are listed [VIDIOC_ENUM_FMT]\n"
>  	       "  --list-framesizes <f>\n"
>  	       "                     list supported framesizes for pixelformat <f>\n"
>  	       "                     [VIDIOC_ENUM_FRAMESIZES]\n"
> @@ -117,6 +125,11 @@ void vidcap_cmd(int ch, char *optarg)
>  			std::exit(EXIT_FAILURE);
>  		}
>  		break;
> +	case OptListFormats:
> +	case OptListFormatsExt:
> +		if(optarg)

Add space

> +			mbus_code = strtoul(optarg, 0L, 0);

Add mbus_code_out, just as with metadata.

> +		break;
>  	case OptListFrameSizes:
>  		be_pixfmt = strlen(optarg) == 7 && !memcmp(optarg + 4, "-BE", 3);
>  		if (be_pixfmt || strlen(optarg) == 4) {
> @@ -298,12 +311,12 @@ void vidcap_list(cv4l_fd &fd)
>  {
>  	if (options[OptListFormats]) {
>  		printf("ioctl: VIDIOC_ENUM_FMT\n");
> -		print_video_formats(fd, vidcap_buftype);
> +		print_video_formats(fd, vidcap_buftype, mbus_code);
>  	}
>  
>  	if (options[OptListFormatsExt]) {
>  		printf("ioctl: VIDIOC_ENUM_FMT\n");
> -		print_video_formats_ext(fd, vidcap_buftype);
> +		print_video_formats_ext(fd, vidcap_buftype, mbus_code);
>  	}
>  
>  	if (options[OptListFields]) {
> diff --git a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
> index 5f433a17..563aae45 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
> @@ -21,14 +21,19 @@ static unsigned set_fmts_out;
>  static __u32 width, height, pixfmt, field, colorspace, xfer_func, ycbcr, quantization, flags;
>  static __u32 bytesperline[VIDEO_MAX_PLANES];
>  static __u32 sizeimage[VIDEO_MAX_PLANES];
> +static unsigned mbus_code;
>  
>  void vidout_usage()
>  {
>  	printf("\nVideo Output Formats options:\n"
> -	       "  --list-formats-out display supported video output formats [VIDIOC_ENUM_FMT]\n"
> -	       "  --list-formats-out-ext\n"
> -	       "                     display supported video output formats including frame sizes\n"
> -	       "                     and intervals\n"
> +	       "  --list-formats-out [<mbus_code>] display supported video output formats.\n"
> +	       "		     <mbus_code> is an optional media bus code, if the driver has\n"
> +	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
> +	       "		     media bus code are listed [VIDIOC_ENUM_FMT]\n"
> +	       "  --list-formats-out-ext [<mbus_code>] display supported video output formats including\n"
> +	       "		     frame sizes and intervals. <mbus_code> is an optional media bus code,\n"
> +	       "		     if the driver has capability V4L2_CAP_IO_MC then only formats that\n"
> +	       "		     support this media bus code are listed [VIDIOC_ENUM_FMT]\n"
>  	       "  --list-fields-out  list supported fields for the current output format\n"
>  	       "  -X, --get-fmt-video-out\n"
>  	       "     		     query the video output format [VIDIOC_G_FMT]\n"
> @@ -103,6 +108,11 @@ void vidout_cmd(int ch, char *optarg)
>  			std::exit(EXIT_FAILURE);
>  		}
>  		break;
> +	case OptListOutFormats:
> +	case OptListOutFormatsExt:
> +		if(optarg)
> +			mbus_code = strtoul(optarg, 0L, 0);

Ditto.

> +		break;
>  	}
>  }
>  
> @@ -233,12 +243,12 @@ void vidout_list(cv4l_fd &fd)
>  {
>  	if (options[OptListOutFormats]) {
>  		printf("ioctl: VIDIOC_ENUM_FMT\n");
> -		print_video_formats(fd, vidout_buftype);
> +		print_video_formats(fd, vidout_buftype, mbus_code);
>  	}
>  
>  	if (options[OptListOutFormatsExt]) {
>  		printf("ioctl: VIDIOC_ENUM_FMT\n");
> -		print_video_formats_ext(fd, vidout_buftype);
> +		print_video_formats_ext(fd, vidout_buftype, mbus_code);
>  	}
>  
>  	if (options[OptListOutFields]) {
> diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> index a31b29f8..c01ee883 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> @@ -114,18 +114,18 @@ static struct option long_options[] = {
>  	{"get-freq", no_argument, 0, OptGetFreq},
>  	{"set-freq", required_argument, 0, OptSetFreq},
>  	{"list-standards", no_argument, 0, OptListStandards},
> -	{"list-formats", no_argument, 0, OptListFormats},
> -	{"list-formats-ext", no_argument, 0, OptListFormatsExt},
> +	{"list-formats", optional_argument, 0, OptListFormats},
> +	{"list-formats-ext", optional_argument, 0, OptListFormatsExt},
>  	{"list-fields", no_argument, 0, OptListFields},
>  	{"list-framesizes", required_argument, 0, OptListFrameSizes},
>  	{"list-frameintervals", required_argument, 0, OptListFrameIntervals},
>  	{"list-formats-overlay", no_argument, 0, OptListOverlayFormats},
>  	{"list-formats-sdr", no_argument, 0, OptListSdrFormats},
>  	{"list-formats-sdr-out", no_argument, 0, OptListSdrOutFormats},
> -	{"list-formats-out", no_argument, 0, OptListOutFormats},
> -	{"list-formats-out-ext", no_argument, 0, OptListOutFormatsExt},
> -	{"list-formats-meta", no_argument, 0, OptListMetaFormats},
> -	{"list-formats-meta-out", no_argument, 0, OptListMetaOutFormats},
> +	{"list-formats-out", optional_argument, 0, OptListOutFormats},
> +	{"list-formats-out-ext", optional_argument, 0, OptListOutFormatsExt},
> +	{"list-formats-meta", optional_argument, 0, OptListMetaFormats},
> +	{"list-formats-meta-out", optional_argument, 0, OptListMetaOutFormats},
>  	{"list-subdev-mbus-codes", optional_argument, 0, OptListSubDevMBusCodes},
>  	{"list-subdev-framesizes", required_argument, 0, OptListSubDevFrameSizes},
>  	{"list-subdev-frameintervals", required_argument, 0, OptListSubDevFrameIntervals},
> @@ -612,13 +612,16 @@ void print_frmival(const struct v4l2_frmivalenum &frmival, const char *prefix)
>  	}
>  }
>  
> -void print_video_formats(cv4l_fd &fd, __u32 type)
> +void print_video_formats(cv4l_fd &fd, __u32 type, unsigned int mbus_code)
>  {
>  	cv4l_disable_trace dt(fd);
>  	struct v4l2_fmtdesc fmt = {};
>  
> +	if (mbus_code && !(capabilities & V4L2_CAP_IO_MC))
> +		mbus_code = 0;
> +
>  	printf("\tType: %s\n\n", buftype2s(type).c_str());
> -	if (fd.enum_fmt(fmt, true, 0, type))
> +	if (fd.enum_fmt(fmt, true, 0, type, mbus_code))
>  		return;
>  	do {
>  		printf("\t[%d]: '%s' (%s", fmt.index, fcc2s(fmt.pixelformat).c_str(),
> @@ -629,15 +632,18 @@ void print_video_formats(cv4l_fd &fd, __u32 type)
>  	} while (!fd.enum_fmt(fmt));
>  }
>  
> -void print_video_formats_ext(cv4l_fd &fd, __u32 type)
> +void print_video_formats_ext(cv4l_fd &fd, __u32 type, unsigned int mbus_code)
>  {
>  	cv4l_disable_trace dt(fd);
>  	struct v4l2_fmtdesc fmt = {};
>  	struct v4l2_frmsizeenum frmsize;
>  	struct v4l2_frmivalenum frmival;
>  
> +	if (mbus_code && !(capabilities & V4L2_CAP_IO_MC))
> +		mbus_code = 0;
> +
>  	printf("\tType: %s\n\n", buftype2s(type).c_str());
> -	if (fd.enum_fmt(fmt, true, 0, type))
> +	if (fd.enum_fmt(fmt, true, 0, type, mbus_code))
>  		return;
>  	do {
>  		printf("\t[%d]: '%s' (%s", fmt.index, fcc2s(fmt.pixelformat).c_str(),
> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index 4acb4d51..e906dc73 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -321,8 +321,8 @@ bool valid_pixel_format(int fd, __u32 pixelformat, bool output, bool mplane);
>  void print_frmsize(const struct v4l2_frmsizeenum &frmsize, const char *prefix);
>  void print_frmival(const struct v4l2_frmivalenum &frmival, const char *prefix);
>  void printfmt(int fd, const struct v4l2_format &vfmt);
> -void print_video_formats(cv4l_fd &fd, __u32 type);
> -void print_video_formats_ext(cv4l_fd &fd, __u32 type);
> +void print_video_formats(cv4l_fd &fd, __u32 type, unsigned int mbus_code);
> +void print_video_formats_ext(cv4l_fd &fd, __u32 type, unsigned int mbus_code);
>  
>  static inline bool subscribe_event(cv4l_fd &fd, __u32 type)
>  {
> 

Regards,

	Hans
