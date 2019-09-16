Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48EDEB39AF
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 13:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbfIPLq5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 07:46:57 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40955 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726875AbfIPLq5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 07:46:57 -0400
Received: from [IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8] ([IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 9pT4ioqFjV17O9pT5iDZeY; Mon, 16 Sep 2019 13:46:55 +0200
Subject: Re: [PATCH] v4l2-ctl: Print UVC meta info
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190903105839.4182-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c1351836-c3a3-e8ac-ff2a-871a57788de1@xs4all.nl>
Date:   Mon, 16 Sep 2019 13:46:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190903105839.4182-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfB5o29PJCTUCDjvpGVH9I6sHSzcP1oxvHeIluVwD+QECPhh+sidXGPZ8MazF78FzGqR3PGgCkj/TPflzaZ8/2jXNfuYAg6T0SskERJfj1FBo1E3CITDl
 oTOKaFLHcQpJBhnLDxpS3NAWRR1+n6mbCGiLOYFaSD/88lfYS3fVUXRIKs2Wr8gJGthc7T21opt5hDKmuMJgDanXEePBdIN7dnYMdMONWQ2O7iVfti9W5L6q
 BTM7Oz/inOPsjka0VRHDWL0AENiDVpHJRGkC+HmC1FUrkG4tgCJxsFNaV2F91yrlJ9BNuG1IkeFph9NRpLtlo7jObXibAyr6sbYwFB0DLdy3Kg7o+DUdPNzY
 kUUI3hulV2YrGW2aqjpS1iOz2q3FUA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/3/19 12:58 PM, Vandana BN wrote:
> Print UVC Metadata information in verbose mode.
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
>  utils/v4l2-ctl/v4l2-ctl-meta.cpp      | 20 ++++++++++++++++++++
>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 14 ++++++++------
>  utils/v4l2-ctl/v4l2-ctl.h             |  1 +
>  3 files changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> index 75fbd6f4..f1003604 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> @@ -127,3 +127,23 @@ void meta_list(cv4l_fd &fd)
>  		print_video_formats(fd, V4L2_BUF_TYPE_META_OUTPUT);
>  	}
>  }
> +
> +static struct vivid_uvc_meta_buf {

Drop static. See the note about __packed below.

> +	__u64 ns;
> +	__u16 sof;
> +	__u8 length;
> +	__u8 flags;
> +	__u8 buf[];
> +} __packed;

__packed is not needed. And in fact produces this warning:

v4l2-ctl-meta.cpp: At global scope:
v4l2-ctl-meta.cpp:137:3: warning: ‘__packed’ defined but not used [-Wunused-variable]
 } __packed;
   ^~~~~~~~

gcc doesn't know about it, so it thinks __packed is the name of a variable.

(__packed is a linux kernel define)

> +
> +void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
> +{
> +	struct vivid_uvc_meta_buf *vbuf;
> +	if (fmt.g_pixelformat() == V4L2_META_FMT_UVC) {
> +		fprintf(f, "META format V4L2_META_FMT_UVC:");

That's too long. Just use "UVC: ".

> +		for (unsigned i = 0; i< buf.g_num_planes(); i++) {
> +			vbuf = (vivid_uvc_meta_buf *)(q.g_dataptr(buf.g_index(), i) + buf.g_mem_offset(i));

Why buf.g_mem_offset(i)? Just use q.g_dataptr(buf.g_index(), i), that does the right thing.

> +			fprintf(f, "ns %llu sof %u, len %u, flags 0x%x\n",vbuf[i].ns, vbuf[i].sof, vbuf[i].length, vbuf[i].flags);

Print the time in seconds: "%.6fs," , (double)vbuf[i].ns / 1000000000.0

That's easier to read.

Regards,

	Hans

> +		}
> +	}
> +}
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index 11157434..46d53f23 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -540,9 +540,9 @@ static void print_buffer(FILE *f, struct v4l2_buffer &buf)
>  	fprintf(f, "\n");
>  }
>  
> -static void print_concise_buffer(FILE *f, cv4l_buffer &buf,
> -				 fps_timestamps &fps_ts, int comp_perc,
> -				 bool skip_ts = false)
> +static void print_concise_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt,
> +				 cv4l_queue &q, fps_timestamps &fps_ts,
> +				 int comp_perc, bool skip_ts = false)
>  {
>  	static double last_ts;
>  
> @@ -592,6 +592,8 @@ static void print_concise_buffer(FILE *f, cv4l_buffer &buf,
>  	if (fl)
>  		fprintf(f, " (%s)", bufferflags2s(fl).c_str());
>  	fprintf(f, "\n");
> +	if (v4l_type_is_meta(buf.g_type()))
> +		print_meta_buffer(f, buf, fmt, q);
>  }
>  
>  static void stream_buf_caps(cv4l_fd &fd, unsigned buftype)
> @@ -1390,7 +1392,7 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
>  		if (!(buf.g_flags() & V4L2_BUF_FLAG_ERROR))
>  			break;
>  		if (verbose)
> -			print_concise_buffer(stderr, buf, fps_ts, -1);
> +			print_concise_buffer(stderr, buf, fmt, q, fps_ts, -1);
>  		if (fd.qbuf(buf))
>  			return QUEUE_ERROR;
>  	}
> @@ -1412,7 +1414,7 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
>  	else if (buf.g_flags() & V4L2_BUF_FLAG_BFRAME)
>  		ch = 'B';
>  	if (verbose) {
> -		print_concise_buffer(stderr, buf, fps_ts,
> +		print_concise_buffer(stderr, buf, fmt, q, fps_ts,
>  				     host_fd_to >= 0 ? 100 - comp_perc / comp_perc_count : -1);
>  		comp_perc_count = comp_perc = 0;
>  	}
> @@ -1502,7 +1504,7 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
>  		double ts_secs = buf.g_timestamp().tv_sec + buf.g_timestamp().tv_usec / 1000000.0;
>  		fps_ts.add_ts(ts_secs, buf.g_sequence(), buf.g_field());
>  		if (verbose)
> -			print_concise_buffer(stderr, buf, fps_ts, -1);
> +			print_concise_buffer(stderr, buf, fmt, q, fps_ts, -1);
>  
>  		for (unsigned j = 0; j < buf.g_num_planes(); j++)
>  			buf.s_bytesused(buf.g_length(j), j);
> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index 5797d784..36051566 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -406,6 +406,7 @@ void meta_cmd(int ch, char *optarg);
>  void meta_set(cv4l_fd &fd);
>  void meta_get(cv4l_fd &fd);
>  void meta_list(cv4l_fd &fd);
> +void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q);
>  
>  // v4l2-ctl-subdev.cpp
>  void subdev_usage(void);
> 

