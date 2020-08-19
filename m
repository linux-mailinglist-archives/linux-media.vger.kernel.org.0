Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283F6249864
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 10:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgHSIok (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 04:44:40 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:54885 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725903AbgHSIoh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 04:44:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8JhukalljuuXO8Jhvkfr0y; Wed, 19 Aug 2020 10:44:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597826672; bh=3lyVh/11kaV64NBnvjYslAa3pikLSfzsR1scQM6p1qM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=i+HVa6XoFKQcVulSsouXj1R0fK/g7Yj5MTp0CQuemvAlM3VExtY6FF3v/e8tNUasc
         vKy4T3EG49tm9Tc6o2xlYc8ZNItwnzXmCEBhOi6Zicd7BGgt40igPusaD6bTkb3VO8
         hh52bZdgEhshehwLZ2H0LCXbCiEFQd8Movgbxre/mQfMJdEuqnpMulM7paNWDD9e0q
         YHZBG87wBgNYSh3Qg2TwLFRRYrjnpDcZp72Hq/Hjn9FdNkKKehTSuq9cAii8sQeXzp
         cIjKFU42PW17CsfTAW5dhcG4BfSLPldwNwYfblo8K7hybs8m8+OgH/I8H8UW2z/oOq
         yv78i0tzK2XkA==
Subject: Re: [PATCH v4l-utils] utils: v4l2-ctl: support V4L2_CAP_IO_MC in
 v4l2-ctl '--list-formats-*' commands
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200721120446.13251-1-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2a3399e1-0274-7d77-db79-8961162c9581@xs4all.nl>
Date:   Wed, 19 Aug 2020 10:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721120446.13251-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEXeMQBv9FBnpPo1yIaIhRD7cUJQOSt7sfDW6UaYH7uSOH4AESnEBlLZs1+8keG5jOY+bjT80edaYRmTwnPrS1KLorEmaANdvYIA0Y87EVPJHQh42vBJ
 m35MUxxDIoTxjmGQMwxkj5ylitojQz7y3Na5heM+pCPCCGYfagYe79SQHwnbW1cqJt8sqCONxXW2ssmIaieE8GXf9pZrGwT8DL2i04WDo+nQVMq8yFVarFhW
 vbZbKc+y2UbZKjc7IrxOJlxyAsW345IRjtyfypZsbpLLIHK/v7EQyi9Cb+27tYlaRfoPVBlqYY/OcrD5BOoCt0tInbtKIihyfFg5QX/iEy8Ff9R2KKCam6is
 MHUwDmnJDE3awikHK7qoEinTZwV8M/nEi9JQfCpkCK6bHrT8hqruLsw0I2+l8pMrOol6pG0yKZ5NLYJ9Ef9AE4tY94I7wDiw0X0WAbvd+6D1KKnxWI6X9TOH
 0aGUMjGN0xlInFY4FBra1u87Eo6A++78fwYMJ5xwaxdaJp7O0NtKSLs8Od2D3b4cxWt85jIsd7pmic1PFC1NQH2j73uYpBA9j1/gx6Ab7Jg+VR7//ffhHDM/
 7Oq6oSVM3sJVQ8BxfDDYQ2MR
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for adding support for this. I do have a few comments, however:

On 21/07/2020 14:04, Dafna Hirschfeld wrote:
> Add optional <mbus_code> arg to all 'v4l2-ctl --list-formats-*'
> commands. If <mbus_code> is given and the device has capability
> V4L2_CAP_IO_MC then list only the formats that matches the
> mbus code.
> If <mbus_code> is given and the device doesn't have this
> capability then print an error message.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> The patch is only tested on the capture devices of vimc driver,
> and for the error message on vivid driver.
> 
>  utils/common/cv4l-helpers.h         |  3 +-
>  utils/v4l2-ctl/v4l2-ctl-meta.cpp    | 10 +++++--
>  utils/v4l2-ctl/v4l2-ctl-overlay.cpp |  7 +++--
>  utils/v4l2-ctl/v4l2-ctl-sdr.cpp     | 11 +++++--
>  utils/v4l2-ctl/v4l2-ctl-vidcap.cpp  | 13 ++++++--
>  utils/v4l2-ctl/v4l2-ctl-vidout.cpp  | 12 +++++---
>  utils/v4l2-ctl/v4l2-ctl.cpp         | 46 ++++++++++++++++++++++-------
>  utils/v4l2-ctl/v4l2-ctl.h           |  1 +
>  8 files changed, 77 insertions(+), 26 deletions(-)
> 
> diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
> index 9de0cdf0..56c8397f 100644
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
> index 2f745e4f..0c8560f4 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> @@ -22,7 +22,10 @@ static struct v4l2_format vfmt;	/* set_format/get_format */
>  void meta_usage()
>  {
>  	printf("\nMetadata Formats options:\n"
> -	       "  --list-formats-meta display supported metadata capture formats [VIDIOC_ENUM_FMT]\n"
> +	       "  --list-formats-meta <mbus_code> display supported metadata capture formats.\n"

Optional arguments should be between square brackets:

	       "  --list-formats-meta [<mbus_code>] display supported metadata capture formats.\n"

> +	       "		      <mbus_code> is an optional media bus code, if the driver has\n"
> +	       "		      capability V4L2_CAP_IO_MC then only formats that support this\n"
> +	       "		      media code are listed [VIDIOC_ENUM_FMT]\n"

media code -> media bus code

(change it elsewhere as well)

>  	       "  --get-fmt-meta      query the metadata capture format [VIDIOC_G_FMT]\n"
>  	       "  --set-fmt-meta <f>  set the metadata capture format [VIDIOC_S_FMT]\n"
>  	       "                     parameter is either the format index as reported by\n"
> @@ -30,7 +33,10 @@ void meta_usage()
>  	       "  --try-fmt-meta <f>  try the metadata capture format [VIDIOC_TRY_FMT]\n"
>  	       "                     parameter is either the format index as reported by\n"
>  	       "                     --list-formats-meta, or the fourcc value as a string\n"
> -	       "  --list-formats-meta-out display supported metadata output formats [VIDIOC_ENUM_FMT]\n"
> +	       "  --list-formats-meta-out <mbus_code> display supported metadata output formats.\n"

Ditto, and elsewhere as well.

> +	       "		      <mbus_code> is an optional media bus code, if the driver has\n"
> +	       "		      capability V4L2_CAP_IO_MC then only formats that support this\n"
> +	       "		      media code are listed [VIDIOC_ENUM_FMT]\n"
>  	       "  --get-fmt-meta-out      query the metadata output format [VIDIOC_G_FMT]\n"
>  	       "  --set-fmt-meta-out <f>  set the metadata output format [VIDIOC_S_FMT]\n"
>  	       "                          parameter is either the format index as reported by\n"
> diff --git a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
> index 16344a15..992824eb 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-overlay.cpp
> @@ -31,8 +31,11 @@ static std::vector<struct v4l2_rect> bitmap_rects;
>  void overlay_usage()
>  {
>  	printf("\nVideo Overlay options:\n"
> -	       "  --list-formats-overlay\n"
> -	       "                     display supported overlay formats [VIDIOC_ENUM_FMT]\n"
> +	       "  --list-formats-overlay <mbus_code>\n"

Overlays do not use mbus_code, so no need to add support for this.

> +	       "                     display supported overlay formats\n"
> +	       "		     <mbus_code> is an optional media bus code, if the driver has\n"
> +	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
> +	       "		     media code are listed [VIDIOC_ENUM_FMT]\n"
>  	       "  --find-fb          find the fb device corresponding with the overlay\n"
>  	       "  --overlay <on>     turn overlay on (1) or off (0) (VIDIOC_OVERLAY)\n"
>  	       "  --get-fmt-overlay  query the video or video output overlay format [VIDIOC_G_FMT]\n"
> diff --git a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
> index 7a36341a..bfb10694 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-sdr.cpp
> @@ -22,7 +22,10 @@ static struct v4l2_format vfmt;	/* set_format/get_format */
>  void sdr_usage()
>  {
>  	printf("\nSDR Formats options:\n"
> -	       "  --list-formats-sdr display supported SDR capture formats [VIDIOC_ENUM_FMT]\n"
> +	       "  --list-formats-sdr <mbus_code> display supported SDR capture formats.\n"

Same for SDR capture/output.

> +	       "		     <mbus_code> is an optional media bus code, if the driver has\n"
> +	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
> +	       "		     media code are listed [VIDIOC_ENUM_FMT]\n"
>  	       "  --get-fmt-sdr      query the SDR capture format [VIDIOC_G_FMT]\n"
>  	       "  --set-fmt-sdr <f>  set the SDR capture format [VIDIOC_S_FMT]\n"
>  	       "                     parameter is either the format index as reported by\n"
> @@ -30,8 +33,10 @@ void sdr_usage()
>  	       "  --try-fmt-sdr <f>  try the SDR capture format [VIDIOC_TRY_FMT]\n"
>  	       "                     parameter is either the format index as reported by\n"
>  	       "                     --list-formats-sdr-cap, or the fourcc value as a string\n"
> -	       "  --list-formats-sdr-out\n"
> -	       "                     display supported SDR output formats [VIDIOC_ENUM_FMT]\n"
> +	       "  --list-formats-sdr-out <mbus_code> display supported SDR output formats.\n"
> +	       "		     <mbus_code> is an optional media bus code, if the driver has\n"
> +	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
> +	       "		     media code are listed [VIDIOC_ENUM_FMT]\n"
>  	       "  --get-fmt-sdr-out  query the SDR output format [VIDIOC_G_FMT]\n"
>  	       "  --set-fmt-sdr-out <f>\n"
>  	       "                     set the SDR output format [VIDIOC_S_FMT]\n"
> diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> index 80312b51..cc4af58b 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> @@ -27,9 +27,16 @@ static __u32 sizeimage[VIDEO_MAX_PLANES];
>  void vidcap_usage()
>  {
>  	printf("\nVideo Capture Formats options:\n"
> -	       "  --list-formats     display supported video formats [VIDIOC_ENUM_FMT]\n"
> -	       "  --list-formats-ext display supported video formats including frame sizes\n"
> -	       "                     and intervals\n"
> +	       "  --list-formats <mbus_code>\n"
> +	       "		     display supported video formats. <mbus_code> is an optional\n"
> +	       "		     media bus code, if the driver has capability V4L2_CAP_IO_MC\n"
> +	       "		     then only formats that support this media code are listed\n"
> +	       "		     [VIDIOC_ENUM_FMT]\n"
> +	       "  --list-formats-ext <mbus_code>\n"
> +	       "		     display supported video formats including frame sizes and intervals\n"
> +	       "		     <mbus_code> is an optional media bus code, if the driver has\n"
> +	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
> +	       "		     media code are listed [VIDIOC_ENUM_FMT]\n"
>  	       "  --list-framesizes <f>\n"
>  	       "                     list supported framesizes for pixelformat <f>\n"
>  	       "                     [VIDIOC_ENUM_FRAMESIZES]\n"
> diff --git a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
> index 5f433a17..54d77db2 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-vidout.cpp
> @@ -25,10 +25,14 @@ static __u32 sizeimage[VIDEO_MAX_PLANES];
>  void vidout_usage()
>  {
>  	printf("\nVideo Output Formats options:\n"
> -	       "  --list-formats-out display supported video output formats [VIDIOC_ENUM_FMT]\n"
> -	       "  --list-formats-out-ext\n"
> -	       "                     display supported video output formats including frame sizes\n"
> -	       "                     and intervals\n"
> +	       "  --list-formats-out <mbus_code> display supported video output formats.\n"
> +	       "		     <mbus_code> is an optional media bus code, if the driver has\n"
> +	       "		     capability V4L2_CAP_IO_MC then only formats that support this\n"
> +	       "		     media code are listed [VIDIOC_ENUM_FMT]\n"
> +	       "  --list-formats-out-ext <mbus_code> display supported video output formats including\n"
> +	       "		     frame sizes and intervals. <mbus_code> is an optional media bus code,\n"
> +	       "		     if the driver has capability V4L2_CAP_IO_MC then only formats that\n"
> +	       "		     support this media code are listed [VIDIOC_ENUM_FMT]\n"
>  	       "  --list-fields-out  list supported fields for the current output format\n"
>  	       "  -X, --get-fmt-video-out\n"
>  	       "     		     query the video output format [VIDIOC_G_FMT]\n"
> diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> index 321d2d1c..6c371402 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> @@ -59,6 +59,8 @@ char options[OptLast];
>  static int app_result;
>  int verbose;
>  
> +

Spurious newline added.

> +unsigned mbus_code_list_formats;
>  unsigned capabilities;
>  unsigned out_capabilities;
>  unsigned priv_magic;
> @@ -114,18 +116,18 @@ static struct option long_options[] = {
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
> -	{"list-formats-overlay", no_argument, 0, OptListOverlayFormats},
> -	{"list-formats-sdr", no_argument, 0, OptListSdrFormats},
> -	{"list-formats-sdr-out", no_argument, 0, OptListSdrOutFormats},
> -	{"list-formats-out", no_argument, 0, OptListOutFormats},
> -	{"list-formats-out-ext", no_argument, 0, OptListOutFormatsExt},
> -	{"list-formats-meta", no_argument, 0, OptListMetaFormats},
> -	{"list-formats-meta-out", no_argument, 0, OptListMetaOutFormats},
> +	{"list-formats-overlay", optional_argument, 0, OptListOverlayFormats},
> +	{"list-formats-sdr", optional_argument, 0, OptListSdrFormats},
> +	{"list-formats-sdr-out", optional_argument, 0, OptListSdrOutFormats},
> +	{"list-formats-out", optional_argument, 0, OptListOutFormats},
> +	{"list-formats-out-ext", optional_argument, 0, OptListOutFormatsExt},
> +	{"list-formats-meta", optional_argument, 0, OptListMetaFormats},
> +	{"list-formats-meta-out", optional_argument, 0, OptListMetaOutFormats},
>  	{"list-subdev-mbus-codes", optional_argument, 0, OptListSubDevMBusCodes},
>  	{"list-subdev-framesizes", required_argument, 0, OptListSubDevFrameSizes},
>  	{"list-subdev-frameintervals", required_argument, 0, OptListSubDevFrameIntervals},
> @@ -617,8 +619,13 @@ void print_video_formats(cv4l_fd &fd, __u32 type)
>  	cv4l_disable_trace dt(fd);
>  	struct v4l2_fmtdesc fmt = {};
>  
> +	if (mbus_code_list_formats && !(capabilities & V4L2_CAP_IO_MC)) {
> +		fprintf(stderr, "<mbus_code> is invalid since the device doesn't have capability V4L2_CAP_IO_MC\n");> +		std::exit(EXIT_FAILURE);

I'd just set mbus_code_list_formats to 0 and continue rather than exiting.

> +	}
> +
>  	printf("\tType: %s\n\n", buftype2s(type).c_str());
> -	if (fd.enum_fmt(fmt, true, 0, type))
> +	if (fd.enum_fmt(fmt, true, 0, type, mbus_code_list_formats))
>  		return;
>  	do {
>  		printf("\t[%d]: '%s' (%s", fmt.index, fcc2s(fmt.pixelformat).c_str(),
> @@ -636,8 +643,13 @@ void print_video_formats_ext(cv4l_fd &fd, __u32 type)
>  	struct v4l2_frmsizeenum frmsize;
>  	struct v4l2_frmivalenum frmival;
>  
> +	if (mbus_code_list_formats && !(capabilities & V4L2_CAP_IO_MC)) {
> +		fprintf(stderr, "<mbus_code> is invalid since the device doesn't have capability V4L2_CAP_IO_MC\n");
> +		std::exit(EXIT_FAILURE);

Ditto.

> +	}
> +
>  	printf("\tType: %s\n\n", buftype2s(type).c_str());
> -	if (fd.enum_fmt(fmt, true, 0, type))
> +	if (fd.enum_fmt(fmt, true, 0, type, mbus_code_list_formats))
>  		return;
>  	do {
>  		printf("\t[%d]: '%s' (%s", fmt.index, fcc2s(fmt.pixelformat).c_str(),
> @@ -1256,6 +1268,18 @@ int main(int argc, char **argv)
>  		case OptVersion:
>  			print_version();
>  			return 0;
> +		case OptListFormats:
> +		case OptListFormatsExt:
> +		case OptListOverlayFormats:
> +		case OptListSdrFormats:
> +		case OptListSdrOutFormats:
> +		case OptListOutFormats:
> +		case OptListOutFormatsExt:
> +		case OptListMetaFormats:
> +		case OptListMetaOutFormats:
> +			if (optarg)
> +				mbus_code_list_formats = strtoul(optarg, 0L, 0);

This isn't right. Each format type should have its own mbus_code.

Just move these 'case's to the corresponding source (e.g. OptListFormats
and OptListFormatsExt go to v4l2-ctl-vidcap.cpp, vidcap_cmd(). There you can
extract the mbus code and store it in a variable.

Add an mbus_code variable to print_video_formats(_ext) so you can pass that
along.

Regards,

	Hans

> +			break;
>  		case ':':
>  			fprintf(stderr, "Option '%s' requires a value\n",
>  					argv[optind]);
> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index 27a3ca35..577037cf 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -268,6 +268,7 @@ enum Option {
>  };
>  
>  extern char options[OptLast];
> +extern unsigned mbus_code_list_formats;
>  extern unsigned capabilities;
>  extern unsigned out_capabilities;
>  extern unsigned priv_magic;
> 

