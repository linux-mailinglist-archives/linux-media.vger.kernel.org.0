Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0E648D545
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 11:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233548AbiAMJxv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 04:53:51 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.170]:46887 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbiAMJxu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 04:53:50 -0500
X-KPN-MessageId: 858d6072-7456-11ec-8a6e-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 858d6072-7456-11ec-8a6e-005056ab378f;
        Thu, 13 Jan 2022 10:52:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=sAR6qh7ImVKk2OZQGiddUdWJuZf+BFcfQxLvLjzIDW8=;
        b=jJNrpugahTcL97FyXIPqETQH9IFURDngK94BDKHBAqHTz8FcanT5VQqCusIOsK/d1fqqrlJ7d+yLD
         vpKSKVQQius1lSYHMlh5K7SOm7EDRUUbeCn8Vhpx4MKQQHBN1kDk0yk/FE6Vv4EP8dkrD7ftEZsM2m
         BdNX0mVnICz2Rkgpzw1jABROnvA46g/W1qz1bPtcY29PWrtfUGM8NEJIi1Pz2AVwO4FQulUE2nqBU2
         RenIv+eA32Bq1VarjPA9vZrwC8eYp/ZGg9B75g2v0tK4u4GrbENzfVq+qUtNAiqHJJFCZX9C7QrB9c
         5YgAPEKzJ8U1d7LoMP0rNjW+5gHEJNA==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|6WjHGnmKWMmMb2P8iCOj19Hkw0pV89mppuDh/AJtU9O3Ypo+KVGDmczTPdVR+FY
 b5GFoJwOQcmuczKgodrc61g==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id b3b0efc2-7456-11ec-94d2-005056abf0db;
        Thu, 13 Jan 2022 10:53:47 +0100 (CET)
Message-ID: <6cb6eafa-496d-8d6e-5fef-86a12d802353@xs4all.nl>
Date:   Thu, 13 Jan 2022 10:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v4l-utils] media-ctl: add DV timing parser to --set-dv
 option
Content-Language: en-US
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
References: <20211117152452.530828-1-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20211117152452.530828-1-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

You are supporting too many flags/fields that are not needed (or wanted)
when setting DV timings.

Look at 'v4l2-ctl --help-stds' and what is supported by the --set-dv-bt-timings
options.

On 17/11/2021 16:24, Philipp Zabel wrote:
> Currently --set-dv only allows to query DV timings and set those.
> Add a DV timing parser to allow setting DV timings manually.
> The format is the same as the dv.current line from --get-dv.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  utils/media-ctl/libv4l2subdev.c | 315 ++++++++++++++++++++++++++++++++
>  utils/media-ctl/media-ctl.c     |  14 +-
>  utils/media-ctl/v4l2subdev.h    |  32 ++++
>  3 files changed, 359 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
> index 0d0afbe702d9..cee4d8af7cfa 100644
> --- a/utils/media-ctl/libv4l2subdev.c
> +++ b/utils/media-ctl/libv4l2subdev.c
> @@ -28,6 +28,7 @@
>  #include <fcntl.h>
>  #include <stdbool.h>
>  #include <stdio.h>
> +#include <stdint.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <unistd.h>
> @@ -850,6 +851,270 @@ int v4l2_subdev_parse_setup_formats(struct media_device *media, const char *p)
>  	return *end ? -EINVAL : 0;
>  }
>  
> +static int v4l2_subdev_parse_timing_type(struct media_device *media,
> +					 struct v4l2_dv_timings *timings,
> +					 const char *p, char **endp)
> +{
> +	char *end;
> +
> +	for (end = (char *)p; *end != ' ' && *end != '\0'; ++end);
> +
> +	if (strncmp(p, "BT.656/1120", end - p) != 0) {
> +		media_dbg(media, "Invalid timing type '%.*s'\n", end - p, p);
> +		return -EINVAL;
> +	}
> +
> +	*endp = end;
> +
> +	return V4L2_DV_BT_656_1120;

This is currently the only supported type, so just drop this.

In fact, I would suggest that you rename this option to --set-dv-bt,
similar to what v4l2-ctl does.

> +}
> +
> +static int v4l2_subdev_parse_timing_stds(struct media_device *media,
> +					 struct v4l2_dv_timings *timings,
> +					 const char *p, char **endp)
> +{
> +	int timing_standard;
> +	uint32_t standards = 0;
> +	char *std;
> +	char *end;
> +
> +	do {
> +		for (end = (char *)p;
> +		     *end != ',' && *end != ' ' && *end != ']' && *end != '\0'; ++end);
> +
> +		/* Backward compatibility: allow empty stds: ... */
> +		if (end == p)
> +			break;
> +
> +		/* ... followed by empty flags: */
> +		if (strncmp(p, "flags:", end - p) == 0) {
> +			end = (char *)p;
> +			break;
> +		}
> +
> +		std = strndup(p, end - p);
> +		if (!std)
> +			return -ENOMEM;
> +
> +		timing_standard = v4l2_subdev_string_to_timing_standard(std);
> +		free(std);
> +
> +		if (timing_standard == -1) {
> +			media_dbg(media, "Invalid DV timing standard '%.*s'\n", end - p, p);
> +			return -EINVAL;
> +		}
> +
> +		standards |= (uint32_t)timing_standard;
> +
> +		p = end + 1;
> +	} while (*end == ',');
> +
> +	timings->bt.standards = standards;

Drop this, not needed when setting a timing.

> +
> +	*endp = end;
> +
> +	return 0;
> +}
> +
> +static int v4l2_subdev_parse_timing_flags(struct media_device *media,
> +					  struct v4l2_dv_timings *timings,
> +					  const char *p, char **endp)
> +{
> +	int timing_flag;
> +	uint32_t flags = 0;
> +	char *flag;
> +	char *end;
> +
> +	do {
> +		for (end = (char *)p;
> +		     *end != ',' && *end != ' ' && *end != ']' && *end != '\0'; ++end);
> +
> +		/* For backwards compatibility, allow empty flags: */
> +		if (end == p)
> +			break;
> +
> +		flag = strndup(p, end - p);
> +		if (!flag)
> +			return -ENOMEM;
> +
> +		timing_flag = v4l2_subdev_string_to_timing_flag(flag);
> +		free(flag);
> +
> +		if (timing_flag == -1) {
> +			media_dbg(media, "Invalid DV timing flag '%.*s'\n", end - p, p);
> +			return -EINVAL;
> +		}
> +
> +		flags |= (uint32_t)timing_flag;
> +
> +		p = end + 1;
> +	} while (*end == ',');
> +
> +	timings->bt.flags = flags;
> +
> +	*endp = end;
> +
> +	return 0;
> +}
> +
> +static struct media_pad *v4l2_subdev_parse_dv_timings(
> +	struct media_device *media, struct v4l2_dv_timings *timings,
> +	const char *p, char **endp)
> +{
> +	struct media_pad *pad;
> +	char *end;
> +	int ret;
> +
> +	for (; isspace(*p); ++p);
> +
> +	pad = media_parse_pad(media, p, &end);
> +	if (pad == NULL) {
> +		*endp = end;
> +		return NULL;
> +	}
> +
> +	for (p = end; isspace(*p); ++p);
> +	if (*p++ != '[') {
> +		media_dbg(media, "Expected '['\n");
> +		*endp = (char *)p - 1;
> +		return NULL;
> +	}
> +
> +	for (;;) {
> +		for (; isspace(*p); p++);
> +
> +		if (strhazit("dv.current:", &p)) {
> +			unsigned long fps, total_width, total_height;
> +
> +			ret = v4l2_subdev_parse_timing_type(media, timings, p, &end);
> +			if (ret < 0) {
> +				*endp = end;
> +				return NULL;
> +			}
> +
> +			if (*end != ' ') {
> +				media_dbg(media, "Expected ' '\n");
> +				*endp = end;
> +				return NULL;
> +			}
> +
> +			p = end + 1;
> +
> +			timings->bt.width = strtoul(p, &end, 10);
> +			if (*end != 'x') {
> +				media_dbg(media, "Expected 'x'\n");
> +				*endp = end;
> +				return NULL;
> +			}
> +
> +			p = end + 1;
> +
> +			timings->bt.height = strtoul(p, &end, 10);
> +			if (*end != 'p') {
> +				media_dbg(media, "Expected 'p'\n");
> +				*endp = end;
> +				return NULL;
> +			}
> +
> +			p = end + 1;
> +
> +			fps = strtoul(p, &end, 10);

This isn't precise enough. I would just pass the pixelclock, just like
v4l2-ctl does.

> +			if (*end != ' ') {
> +				media_dbg(media, "Expected ' '\n");
> +				*endp = end;
> +				return NULL;
> +			}
> +
> +			if (*(end + 1) != '(') {
> +				media_dbg(media, "Expected '('\n");
> +				*endp = end;
> +				return NULL;
> +			}
> +
> +			p = end + 2;
> +
> +			total_width = strtoul(p, &end, 10);
> +			if (*end != 'x') {
> +				media_dbg(media, "Expected 'x'\n");
> +				*endp = end;
> +				return NULL;
> +			}
> +
> +			p = end + 1;
> +
> +			total_height = strtoul(p, &end, 10);
> +			if (*end != ')') {
> +				media_dbg(media, "Expected ')'\n");
> +				*endp = end;
> +				return NULL;
> +			}
> +
> +			timings->bt.pixelclock = (uint64_t)fps * total_width * total_height;
> +
> +			timings->bt.hsync = total_width - timings->bt.width;
> +			timings->bt.vsync = total_height - timings->bt.height;

Just specifying the total blanking is a bad idea as well. Esp. the v/hsync values
are used in some cases to indicate specific properties of the video stream, so
setting that to the total blanking will prevent that from working.

Just specify the precise front/back porches and sync values.

Ideally you also support interlaced, but that's up to you. It can be added in the
future.

> +
> +			p = end + 1;
> +			continue;
> +		}
> +
> +		if (strhazit("stds:", &p)) {

Drop this.

> +			ret = v4l2_subdev_parse_timing_stds(media, timings, p, &end);
> +			if (ret < 0) {
> +				*endp = end;
> +				return NULL;
> +			}
> +
> +			p = end;
> +			continue;
> +		}
> +
> +		if (strhazit("flags:", &p)) {
> +			ret = v4l2_subdev_parse_timing_flags(media, timings, p, &end);
> +			if (ret < 0) {
> +				*endp = end;
> +				return NULL;
> +			}
> +
> +			p = end;
> +			continue;
> +		}

I'm missing support to set the polarities. That's important as well.

> +
> +		break;
> +	}
> +
> +	if (*p != ']') {
> +		media_dbg(media, "Expected ']'\n");
> +		*endp = (char *)p;
> +		return NULL;
> +	}
> +
> +	*endp = (char *)p + 1;
> +	return pad;
> +}
> +
> +int v4l2_subdev_parse_setup_dv_timings(struct media_device *media,
> +				       const char *p)
> +{
> +	struct v4l2_dv_timings timings = { 0 };
> +	struct media_pad *pad;
> +	char *end;
> +	int ret;
> +
> +	pad = v4l2_subdev_parse_dv_timings(media, &timings, p, &end);
> +	if (pad == NULL) {
> +		media_print_streampos(media, p, end);
> +		media_dbg(media, "Unable to parse DV timings\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = v4l2_subdev_set_dv_timings(pad->entity, &timings);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static const struct {
>  	const char *name;
>  	enum v4l2_mbus_pixelcode code;
> @@ -952,6 +1217,56 @@ enum v4l2_field v4l2_subdev_string_to_field(const char *string)
>  	return (enum v4l2_field)-1;
>  }
>  
> +static const struct {
> +	const char *name;
> +	uint32_t standard;
> +} bt_standards[] = {
> +	{ "CEA-861", V4L2_DV_BT_STD_CEA861 },
> +	{ "DMT", V4L2_DV_BT_STD_DMT },
> +	{ "CVT", V4L2_DV_BT_STD_CVT },
> +	{ "GTF", V4L2_DV_BT_STD_GTF },
> +	{ "SDI", V4L2_DV_BT_STD_SDI },
> +};
> +
> +int v4l2_subdev_string_to_timing_standard(const char *string)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bt_standards); ++i) {
> +		if (strcasecmp(bt_standards[i].name, string) == 0)
> +			return bt_standards[i].standard;
> +	}
> +
> +	return (uint32_t)-1;
> +}
> +
> +static const struct {
> +	uint32_t flag;
> +	const char *name;
> +} bt_flags[] = {
> +	{ V4L2_DV_FL_REDUCED_BLANKING, "reduced-blanking" },
> +	{ V4L2_DV_FL_CAN_REDUCE_FPS, "can-reduce-fps" },
> +	{ V4L2_DV_FL_REDUCED_FPS, "reduced-fps" },
> +	{ V4L2_DV_FL_HALF_LINE, "half-line" },
> +	{ V4L2_DV_FL_IS_CE_VIDEO, "CE-video" },
> +	{ V4L2_DV_FL_FIRST_FIELD_EXTRA_LINE, "first-field-extra-line" },
> +	{ V4L2_DV_FL_HAS_PICTURE_ASPECT, "has-picture-aspect" },
> +	{ V4L2_DV_FL_HAS_CEA861_VIC, "has-cea861-vic" },
> +	{ V4L2_DV_FL_HAS_HDMI_VIC, "has-hdmi-vic" },

The *only* flag that userspace can set is V4L2_DV_FL_REDUCED_FPS. All others
are returned, so drop those.

> +};
> +
> +int v4l2_subdev_string_to_timing_flag(const char *string)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bt_flags); ++i) {
> +		if (strcasecmp(bt_flags[i].name, string) == 0)
> +			return bt_flags[i].flag;
> +	}
> +
> +	return (uint32_t)-1;
> +}
> +
>  static struct {
>  	const char *name;
>  	enum v4l2_colorspace colorspace;
> diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
> index 84ee7a83c7d6..d48dec5a9f11 100644
> --- a/utils/media-ctl/media-ctl.c
> +++ b/utils/media-ctl/media-ctl.c
> @@ -620,10 +620,20 @@ int main(int argc, char **argv)
>  	if (media_opts.dv_pad) {
>  		struct v4l2_dv_timings timings;
>  		struct media_pad *pad;
> +		char *endp;
>  
> -		pad = media_parse_pad(media, media_opts.dv_pad, NULL);
> +		pad = media_parse_pad(media, media_opts.dv_pad, &endp);
>  		if (pad == NULL) {
> -			printf("Pad '%s' not found\n", media_opts.dv_pad);
> +			printf("Pad '%.*s' not found\n",
> +			       (int)(endp - media_opts.dv_pad), media_opts.dv_pad);
> +			goto out;
> +		}
> +
> +		if (*endp == '[') {
> +			ret = v4l2_subdev_parse_setup_dv_timings(media,
> +								 media_opts.dv_pad);
> +			if (ret < 0)
> +				printf("Unable to setup DV timings: %s\n", strerror(-ret));
>  			goto out;
>  		}
>  
> diff --git a/utils/media-ctl/v4l2subdev.h b/utils/media-ctl/v4l2subdev.h
> index a18139118494..026bde2fcd68 100644
> --- a/utils/media-ctl/v4l2subdev.h
> +++ b/utils/media-ctl/v4l2subdev.h
> @@ -235,6 +235,18 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
>   */
>  int v4l2_subdev_parse_setup_formats(struct media_device *media, const char *p);
>  
> +/**
> + * @brief Parse a string and apply DV timing settings.
> + * @param media - media device.
> + * @param p - input string
> + *
> + * Parse string @a p and apply DV timing settings to a subdev pad specified in
> + * @a p.
> + *
> + * @return 0 on success, or a negative error code on failure.
> + */
> +int v4l2_subdev_parse_setup_dv_timings(struct media_device *media, const char *p);
> +
>  /**
>   * @brief Convert media bus pixel code to string.
>   * @param code - input string
> @@ -366,4 +378,24 @@ enum v4l2_quantization v4l2_subdev_string_to_quantization(const char *string);
>  const enum v4l2_mbus_pixelcode *v4l2_subdev_pixelcode_list(
>  	unsigned int *length);
>  
> +/**
> + * @brief Parse string to DV timing standard.
> + * @param string - nul terminated string, textual DV timing standard
> + *
> + * Parse human readable string @a string to DV timing standard.
> + *
> + * @return DV timing standard on success, -1 on failure.
> + */
> +int v4l2_subdev_string_to_timing_standard(const char *string);
> +
> +/**
> + * @brief Parse string to DV timing flag.
> + * @param string - nul terminated string, textual DV timing flag
> + *
> + * Parse human readable string @a string to DV timing flag.
> + *
> + * @return DV timing flag on success, -1 on failure.
> + */
> +int v4l2_subdev_string_to_timing_flag(const char *string);
> +
>  #endif

Regards,

	Hans
