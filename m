Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89E05BC2ED
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 09:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440624AbfIXHnf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 03:43:35 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:34705 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2437901AbfIXHnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 03:43:35 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id CfTsiwlCT9D4hCfTvitjPi; Tue, 24 Sep 2019 09:43:32 +0200
Subject: Re: [PATCH v5] v4l2-ctl: Print UVC meta info
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <ac306dbd-fc10-013c-4c12-ef63d6971631@xs4all.nl>
 <20190924070822.13757-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f1feb1c1-8b2c-6751-c879-fdd4d4c8adf5@xs4all.nl>
Date:   Tue, 24 Sep 2019 09:43:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924070822.13757-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGgQxDrnPHdBQlkYkL7JEhZXbo3mt3fiIe5klk07A2AbaGbjFdKmfLrEjlEHOk4lEYaKM7IB5uAEvgDQA+kkdEoUxdLRs7q/i9x1F0GpbqteIVqGvzDO
 NiqpKFCeVcH/tlw1oaxEdS6VujIbORnh8+AUT4f/Gy11YdIuNWxnoVcOmVREvmC8n2W8H8xMCfl/qHCjVlJvq40zfJiEPjokb5gF8hSB8N4zq3RM1ffn8jZf
 IdiBkB3qpr4V2jiMDSft68lbBr853telfJoGKcIpJVc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vandana,

On 9/24/19 9:08 AM, Vandana BN wrote:
> Print UVC Metadata information in verbose mode.
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
> Changes since v4:
> 	Print PTS and SCR info.
> ---
>  utils/v4l2-ctl/v4l2-ctl-meta.cpp      | 42 +++++++++++++++++++++++++++
>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 14 +++++----
>  utils/v4l2-ctl/v4l2-ctl.h             |  1 +
>  3 files changed, 51 insertions(+), 6 deletions(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> index 75fbd6f4..cd249406 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> @@ -127,3 +127,45 @@ void meta_list(cv4l_fd &fd)
>  		print_video_formats(fd, V4L2_BUF_TYPE_META_OUTPUT);
>  	}
>  }
> +
> +struct vivid_uvc_meta_buf {
> +	__u64 ns;
> +	__u16 sof;
> +	__u8 length;
> +	__u8 flags;
> +	__u8 buf[10];
> +};
> +
> +#define UVC_STREAM_SCR	(1 << 3)
> +#define UVC_STREAM_PTS	(1 << 2)
> +
> +void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
> +{
> +	struct vivid_uvc_meta_buf *vbuf;
> +
> +	switch (fmt.g_pixelformat()) {
> +	case V4L2_META_FMT_UVC:
> +		fprintf(f, "UVC: ");
> +		for (unsigned i = 0; i < buf.g_num_planes(); i++) {
> +			int buf_off = 0;
> +
> +			vbuf = (vivid_uvc_meta_buf *)q.g_dataptr(buf.g_index(), i);
> +
> +			if (vbuf[i].flags & UVC_STREAM_PTS)
> +				buf_off = 4;
> +
> +			fprintf(f, "%.6fs, sof %u, len %u, flags 0x%x PTS %u, STC %u frame SOF %u\n",
> +				(double)vbuf[i].ns / 1000000000.0,
> +				vbuf[i].sof,
> +				vbuf[i].length,
> +				vbuf[i].flags,
> +				(vbuf[i].flags & UVC_STREAM_PTS) ?
> +					le32toh(*(__u32*)(vbuf[i].buf)) : 0,
> +				(vbuf[i].flags & UVC_STREAM_SCR) ?
> +					le32toh(*(__u32*)(vbuf[i].buf + buf_off)) : 0,
> +				(vbuf[i].flags & UVC_STREAM_SCR) ?
> +					le16toh(*(__u16*)(vbuf[i].buf + buf_off + 4)) : 0);

This can be tidied up a bit:

Split it up into four fprintf's: first up to 'flags', then show the PTS if
available, then the STC/SOF if available. And finally a fprintf(f, "\n");

I'd also rename 'frame SOF' to 'SOF counter'. And use : instead of , (that's the
style used in most of v4l2-ctl).

It should look like this:

UVC: 1446635.472396s sof: 1510 len: 12 flags: 0x0d PTS: 229988832 STC: 253793632 SOF counter: 28427

Use %02x for the flags field and use %4d for the first sof field. This aligns
the text a bit better.

Regards,

	Hans

> +		}
> +		break;
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

