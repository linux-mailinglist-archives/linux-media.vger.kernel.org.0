Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC1B50F0C0
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 08:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244909AbiDZGON (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 02:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244945AbiDZGOL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 02:14:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F09D713CC4
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 23:11:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D36CDB81C13
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 06:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05142C385A4;
        Tue, 26 Apr 2022 06:10:59 +0000 (UTC)
Message-ID: <ad66756b-6ed8-aff3-708f-94ff27f59c34@xs4all.nl>
Date:   Tue, 26 Apr 2022 08:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] v4l2-utils: read/write full frame from/to file for m2m
 non codec driver
Content-Language: en-US
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
References: <20220321230048.372594-1-xavier.roumegue@oss.nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220321230048.372594-1-xavier.roumegue@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/03/2022 00:00, Xavier Roumegue wrote:
> In case of m2m operations with a non codec capable driver, the entire
> frame should be read/written from/to the file while writing/reading the
> output/capture buffer in case of crop/compose operations.
> 
> fixes: d1b18e65fbdf (v4l2-ctl: Add support for crop and compose selection in streaming)
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> ---
>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index 7f6482d6..ae0fa127 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -89,6 +89,8 @@ enum codec_type {
>  	DECODER
>  };
>  
> +static enum codec_type codec_type;
> +
>  #define QUEUE_ERROR -1
>  #define QUEUE_STOPPED -2
>  
> @@ -352,7 +354,7 @@ void streaming_usage()
>  	       	V4L_STREAM_PORT);
>  }
>  
> -static enum codec_type get_codec_type(cv4l_fd &fd)
> +static enum codec_type _get_codec_type(cv4l_fd &fd)

Why change the function name?

I would just change the return type to void and have this
function set codec_type.

The behavior is then similar to get_cap_compose_rect/get_out_crop_rect.

Those two functions really should have a void return type as well since
they always return 0. Bonus points for making that change in a separate
patch.

>  {
>  	cv4l_disable_trace dt(fd);
>  	struct v4l2_fmtdesc fmt_desc = {};
> @@ -394,6 +396,11 @@ static enum codec_type get_codec_type(cv4l_fd &fd)
>  	return NOT_CODEC;
>  }
>  
> +static void get_codec_type(cv4l_fd &fd)
> +{
> +    codec_type = _get_codec_type(fd);
> +}
> +
>  static int get_cap_compose_rect(cv4l_fd &fd)
>  {
>  	cv4l_disable_trace dt(fd);
> @@ -1109,7 +1116,8 @@ restart:
>  		if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS)
>  			res = read_fwht_frame(fmt, static_cast<unsigned char *>(buf), fin,
>  					      sz, expected_len, buf_len);
> -		else if (support_out_crop && v4l2_fwht_find_pixfmt(fmt.g_pixelformat()))
> +		else if (codec_type != NOT_CODEC && support_out_crop
> +				&& v4l2_fwht_find_pixfmt(fmt.g_pixelformat()))

Please move the && to the end of the previous line.

>  			res = read_write_padded_frame(fmt, static_cast<unsigned char *>(buf),
>  						      fin, sz, expected_len, buf_len, true);
>  		else
> @@ -1369,7 +1377,8 @@ static void write_buffer_to_file(cv4l_fd &fd, cv4l_queue &q, cv4l_buffer &buf,
>  		}
>  		if (host_fd_to >= 0)
>  			sz = fwrite(comp_ptr[j] + offset, 1, used, fout);
> -		else if (support_cap_compose && v4l2_fwht_find_pixfmt(fmt.g_pixelformat()))
> +		else if (codec_type != NOT_CODEC && support_cap_compose
> +				&& v4l2_fwht_find_pixfmt(fmt.g_pixelformat()))

Ditto.

>  			read_write_padded_frame(fmt, static_cast<u8 *>(q.g_dataptr(buf.g_index(), j)) + offset,
>  						fout, sz, used, used, false);
>  		else
> @@ -2262,7 +2271,6 @@ static void stateful_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
>  
>  	bool have_eos = subscribe_event(fd, V4L2_EVENT_EOS);
>  	bool is_encoder = false;
> -	enum codec_type codec_type = get_codec_type(fd);
>  	bool ignore_count_skip = codec_type == ENCODER;
>  
>  	if (have_eos) {
> @@ -2868,6 +2876,7 @@ void streaming_set(cv4l_fd &fd, cv4l_fd &out_fd, cv4l_fd &exp_fd)
>  
>  	get_cap_compose_rect(fd);
>  	get_out_crop_rect(fd);
> +	get_codec_type(fd);
>  
>  	if (do_cap && do_out && out_fd.g_fd() < 0)
>  		streaming_set_m2m(fd, exp_fd);

Regards,

	Hans
