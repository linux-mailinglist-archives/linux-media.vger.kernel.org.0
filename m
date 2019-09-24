Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0FBBC8E9
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 15:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504930AbfIXN3l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 09:29:41 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36878 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438668AbfIXN3l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 09:29:41 -0400
Received: by mail-io1-f68.google.com with SMTP id b19so4425183iob.4
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 06:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=8vcoKzeg43CFmF2bWKfT3FNwYxvvVfBY0YgHp8zm43U=;
        b=QOo/fzdEFMBgEKxJlgzlNbdeEThjc/2ekELu4GSQShlWexUF6hBVxeqVBSJ67q0RGx
         CrIeCNVJ+nFAPC6DZxWZAICy9DiEpiwsWnbCTwAVC2fAQMZ/KfQ4/3s03UqGdlnHqnJO
         gVsTuOm1RPlmsqww8FkNNeUfJHY0iGBRTy5qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8vcoKzeg43CFmF2bWKfT3FNwYxvvVfBY0YgHp8zm43U=;
        b=rwiUzbirO/XS+hHLhs0KVLlht3iAU2BuvBxma3bwa2rY532gJ0H6ZO45hdLmvLtyF8
         xCLRU9nZULf12h3dUkg4e0FTQJYMI92HTMDsxArooVK2lCxh+oxcKypf+aC5e49a/J+G
         60n3SjhKEBkQUcJx4Vb9C6immU9qyN7ClnOsq6axwlSQfmXO969x3KY2WeFSi1UeXsAB
         aVGZNxm73uY79QPr2483d2oW7WdfizXaUVgOiAVz9Ko61iRXpFkfiP//hif4PyCt3LPj
         Aw6k/64XaUZA0APxp1bKJ6zoo/+CcjEjHIKEnZ6WiM6FJiyEu0beWdczbS0wj/BVOZVY
         geNQ==
X-Gm-Message-State: APjAAAVEdeMQ99TR86fI1aYS7lt75x1aJW89fiYLrDQjzfAVOdFCs7a6
        kAxDu93BW8Eqsz8l0AmyTYfiRA==
X-Google-Smtp-Source: APXvYqwd5roxAWkNc4o81JJDdD9cRghDeeeNP62+2wK2jfRueox7HOdZvHO5n7ofwdVzq12nanX5lg==
X-Received: by 2002:a6b:f611:: with SMTP id n17mr2482364ioh.152.1569331780008;
        Tue, 24 Sep 2019 06:29:40 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id f26sm716779ion.4.2019.09.24.06.29.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 06:29:39 -0700 (PDT)
Subject: Re: [Linux-kernel-mentees] [PATCH v8] v4l2-ctl: Print UVC meta info
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <4a30b7ef-4e1e-3cef-5f7d-c75920edae7e@xs4all.nl>
 <20190924110426.25398-1-bnvandana@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <65619439-4944-b95a-a312-efe1da50872f@linuxfoundation.org>
Date:   Tue, 24 Sep 2019 07:29:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924110426.25398-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/24/19 5:04 AM, Vandana BN wrote:
> Print UVC Metadata information in verbose mode.
> 

Cam you add more information on what this Metadata is and how it
is used.

> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
> Changes since v7:
> 	Not to call print_meta_buffer, if V4L2_BUF_FLAG_ERROR is set or
> bytesused is 0.
> Changes since v6:
> 	Not to print PTS/SCR if not present.
> 	Remove loop in print_meta_buffer()
> Changes since v5:
> 	Use proper print format.
> 	split fprintf.
> Changes since v4:
> 	Print PTS and SCR info.
> ---
>   utils/v4l2-ctl/v4l2-ctl-meta.cpp      | 39 +++++++++++++++++++++++++++
>   utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 15 ++++++-----
>   utils/v4l2-ctl/v4l2-ctl.h             |  1 +
>   3 files changed, 49 insertions(+), 6 deletions(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> index 75fbd6f4..eae7438f 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> @@ -127,3 +127,42 @@ void meta_list(cv4l_fd &fd)
>   		print_video_formats(fd, V4L2_BUF_TYPE_META_OUTPUT);
>   	}
>   }
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
> +	int buf_off = 0;
> +
> +	switch (fmt.g_pixelformat()) {
> +	case V4L2_META_FMT_UVC:
> +		fprintf(f, "UVC: ");

Can you make this "UVC: Metadata:" or something along the lines to
say what this is. It will be easeir for people to search for a key
word.

> +		vbuf = (vivid_uvc_meta_buf *)q.g_dataptr(buf.g_index(), 0);
> +
> +		fprintf(f, "%.6fs sof: %4d len: %u flags: 0x%02x",
> +			(double)vbuf->ns / 1000000000.0,
> +			vbuf->sof,
> +			vbuf->length,
> +			vbuf->flags);
> +		if (vbuf->flags & UVC_STREAM_PTS) {
> +			fprintf(f, " PTS: %u", le32toh(*(__u32*)(vbuf->buf)));
> +			buf_off = 4;
> +		}
> +		if (vbuf->flags & UVC_STREAM_SCR)
> +			fprintf(f, " STC: %u SOF counter: %u",
> +				le32toh(*(__u32*)(vbuf->buf + buf_off)),
> +				le16toh(*(__u16*)(vbuf->buf + buf_off + 4)));
> +		fprintf(f, "\n");
> +		break;
> +	}
> +}
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index 11157434..47b7d3f8 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -540,9 +540,9 @@ static void print_buffer(FILE *f, struct v4l2_buffer &buf)
>   	fprintf(f, "\n");
>   }
>   
> -static void print_concise_buffer(FILE *f, cv4l_buffer &buf,
> -				 fps_timestamps &fps_ts, int comp_perc,
> -				 bool skip_ts = false)
> +static void print_concise_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt,
> +				 cv4l_queue &q, fps_timestamps &fps_ts,
> +				 int comp_perc, bool skip_ts = false)
>   {
>   	static double last_ts;
>   
> @@ -592,6 +592,9 @@ static void print_concise_buffer(FILE *f, cv4l_buffer &buf,
>   	if (fl)
>   		fprintf(f, " (%s)", bufferflags2s(fl).c_str());
>   	fprintf(f, "\n");
> +	if (v4l_type_is_meta(buf.g_type()) && buf.g_bytesused(0) &&
> +	    !(buf.g_flags() & V4L2_BUF_FLAG_ERROR))
> +		print_meta_buffer(f, buf, fmt, q);
>   }
>   
>   static void stream_buf_caps(cv4l_fd &fd, unsigned buftype)
> @@ -1390,7 +1393,7 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
>   		if (!(buf.g_flags() & V4L2_BUF_FLAG_ERROR))
>   			break;
>   		if (verbose)
> -			print_concise_buffer(stderr, buf, fps_ts, -1);
> +			print_concise_buffer(stderr, buf, fmt, q, fps_ts, -1);
>   		if (fd.qbuf(buf))
>   			return QUEUE_ERROR;
>   	}
> @@ -1412,7 +1415,7 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
>   	else if (buf.g_flags() & V4L2_BUF_FLAG_BFRAME)
>   		ch = 'B';
>   	if (verbose) {
> -		print_concise_buffer(stderr, buf, fps_ts,
> +		print_concise_buffer(stderr, buf, fmt, q, fps_ts,
>   				     host_fd_to >= 0 ? 100 - comp_perc / comp_perc_count : -1);
>   		comp_perc_count = comp_perc = 0;
>   	}
> @@ -1502,7 +1505,7 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
>   		double ts_secs = buf.g_timestamp().tv_sec + buf.g_timestamp().tv_usec / 1000000.0;
>   		fps_ts.add_ts(ts_secs, buf.g_sequence(), buf.g_field());
>   		if (verbose)
> -			print_concise_buffer(stderr, buf, fps_ts, -1);
> +			print_concise_buffer(stderr, buf, fmt, q, fps_ts, -1);
>   
>   		for (unsigned j = 0; j < buf.g_num_planes(); j++)
>   			buf.s_bytesused(buf.g_length(j), j);
> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index 5797d784..36051566 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -406,6 +406,7 @@ void meta_cmd(int ch, char *optarg);
>   void meta_set(cv4l_fd &fd);
>   void meta_get(cv4l_fd &fd);
>   void meta_list(cv4l_fd &fd);
> +void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q);
>   
>   // v4l2-ctl-subdev.cpp
>   void subdev_usage(void);
> 

