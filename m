Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9943BB4A7B
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 11:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbfIQJ35 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 05:29:57 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:50949 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727036AbfIQJ35 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 05:29:57 -0400
Received: from [IPv6:2001:983:e9a7:1:4561:5751:6822:aafd] ([IPv6:2001:983:e9a7:1:4561:5751:6822:aafd])
        by smtp-cloud9.xs4all.net with ESMTPA
        id A9o2iwI25V17OA9o3iKGrw; Tue, 17 Sep 2019 11:29:55 +0200
Subject: Re: [PATCH v3] v4l2-ctl: Print UVC meta info
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <9d52d428-dbf6-0968-ab3e-761da02d45ed@xs4all.nl>
 <20190916180044.25023-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <97514f22-b21a-ae56-2972-e845c16c90a0@xs4all.nl>
Date:   Tue, 17 Sep 2019 11:29:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190916180044.25023-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFUgB7m5uj3l4cOnfgA1loAe40YL5uWtuZfcngW/upffo5QnEKthi/TQV1ZVg8KNGcfVAlf2eRD5DNM0O3Tnm7QuKiiAYgf1apNov8w7g/o66GLmQzCi
 o0zQWVf0GwTOTOhIE9SSjxTzQGjrOg4RP9S3J9Ue7769VCGFwq1WSoNcUmDn/iDrbqzu9lPK8LqAdwXdPUJlAWU+Tb/qd28XebABrlWVBQvwiTcqKVj57vxc
 0o4q+z0P3MViKBMKpU3F+jDLWgpSpG8hxQhQ3Hg/F0G5LZOn72logKQ9t466khDqi5UvU+WCMZ+J9NMWo5Qu+zJdR4NyVqvbefpgAelelN0j56DzFKfQMRQ7
 FAhZANVL9TZ9WGdSvu15YTpYA8lRLA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/16/19 8:00 PM, Vandana BN wrote:
> Print UVC Metadata information in verbose mode.
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
> Changes since v2
> - Converted if to switch statement.
> - Corrected format specifier in print.
> ---
>  utils/v4l2-ctl/v4l2-ctl-meta.cpp      | 25 +++++++++++++++++++++++++
>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 14 ++++++++------
>  utils/v4l2-ctl/v4l2-ctl.h             |  1 +
>  3 files changed, 34 insertions(+), 6 deletions(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> index 75fbd6f4..5d7b28d6 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> @@ -127,3 +127,28 @@ void meta_list(cv4l_fd &fd)
>  		print_video_formats(fd, V4L2_BUF_TYPE_META_OUTPUT);
>  	}
>  }
> +
> +struct vivid_uvc_meta_buf {
> +	__u64 ns;
> +	__u16 sof;
> +	__u8 length;
> +	__u8 flags;
> +	__u8 buf[];
> +};
> +
> +void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
> +{
> +	struct vivid_uvc_meta_buf *vbuf;
> +
> +	switch(fmt.g_pixelformat()) {

Add space before (

> +		case V4L2_META_FMT_UVC:

We use the kernel coding style, so the case statement should be aligned with the switch.

> +			fprintf(f, "UVC: ");
> +			for (unsigned i = 0; i < buf.g_num_planes(); i++) {
> +				vbuf = (vivid_uvc_meta_buf *)q.g_dataptr(buf.g_index(), i);
> +				fprintf(f, "%.6fs, sof %u, len %u, flags 0x%x\n",
> +						(double)vbuf[i].ns / 1000000000.0, vbuf[i].sof,
> +						vbuf[i].length, vbuf[i].flags);

Properly align the arguments:

				fprintf(f, "%.6fs, sof %u, len %u, flags 0x%x\n",
					(double)vbuf[i].ns / 1000000000.0, vbuf[i].sof,
					vbuf[i].length, vbuf[i].flags);

(looks like there was a tab too many for some reason)

These issues may seem like nitpicking, but from a code maintenance
perspective it is very important. It's like reading a book with a weird
layout, it's just harder to read.

Regards,

	Hans

> +			}
> +			break;
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

