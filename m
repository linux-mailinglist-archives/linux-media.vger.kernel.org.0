Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2800C98ED
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 09:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfJCHUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 03:20:12 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:49539 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726002AbfJCHUM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 03:20:12 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id FvPCiGoduJQzFFvPFi8xy8; Thu, 03 Oct 2019 09:20:10 +0200
Subject: Re: [PATCH] v4l2-ctl: support for metadata output
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20191003070615.23129-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cb0e7771-eba5-979d-e873-d889859a3f83@xs4all.nl>
Date:   Thu, 3 Oct 2019 09:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191003070615.23129-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKdoWq46jAYhwXnvss4LD0g8jN0tTBbqGjP39cLLTXidGQcgCEu6T5E6YlTFW1kcvdvdfDn06IltXRRN3snsWYG+3hKLLaqH9C66HVNGye0woy0hs/V5
 56qo7smj8lmjC912Z9FjesUBugp3kbiPOa/UmjmoUlua7b9mCDyKP36QyVwJnlmQY1QZExsj9oakt9WEg7n4EFecImA8kqVxszQOyOLhBPmwN4gHr0Kabxh5
 z3qp8Z8+nWEOD50LDBQXaczsJgAbR63w3ESu2BAiWRI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vandana,

Since the videodev2.h header is copied from the header I can't apply
this yet until support for V4L2_META_FMT_VIVID is merged into the kernel.

I also have a few other comments, see below:

On 10/3/19 9:06 AM, Vandana BN wrote:
> Adds support to test metadata output format V4L2_META_FMT_VIVID.
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
>  contrib/freebsd/include/linux/videodev2.h |  1 +
>  include/linux/videodev2.h                 |  1 +
>  utils/v4l2-ctl/v4l2-ctl-meta.cpp          | 31 +++++++++++++++++++++++
>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp     | 12 ++++++---
>  utils/v4l2-ctl/v4l2-ctl.h                 |  1 +
>  5 files changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/contrib/freebsd/include/linux/videodev2.h b/contrib/freebsd/include/linux/videodev2.h
> index 0c12d27f..d14ca0aa 100644
> --- a/contrib/freebsd/include/linux/videodev2.h
> +++ b/contrib/freebsd/include/linux/videodev2.h
> @@ -783,6 +783,7 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> +#define V4L2_META_FMT_VIVID       v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Output Metadata */
>  
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
> index e2847759..be4727da 100644
> --- a/include/linux/videodev2.h
> +++ b/include/linux/videodev2.h
> @@ -749,6 +749,7 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> +#define V4L2_META_FMT_VIVID       v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Output Metadata */
>  
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> index eae7438f..2b5781a7 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
> @@ -139,10 +139,18 @@ struct vivid_uvc_meta_buf {
>  #define UVC_STREAM_SCR	(1 << 3)
>  #define UVC_STREAM_PTS	(1 << 2)
>  
> +struct vivid_meta_out_buf {
> +        __u8      brightness;
> +        __u8      contrast;
> +        __u8      saturation;
> +        __s16     hue;
> +};

I'd change the __u8 to __u16 in the struct above.

The problem right now is that there is a hole of one byte in the struct
between saturation and hue. That's something we try to avoid.

> +
>  void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
>  {
>  	struct vivid_uvc_meta_buf *vbuf;
>  	int buf_off = 0;
> +	struct vivid_meta_out_buf *vbuf_out;
>  
>  	switch (fmt.g_pixelformat()) {
>  	case V4L2_META_FMT_UVC:
> @@ -164,5 +172,28 @@ void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
>  				le16toh(*(__u16*)(vbuf->buf + buf_off + 4)));
>  		fprintf(f, "\n");
>  		break;
> +	case V4L2_META_FMT_VIVID:
> +		fprintf(f, "VIVID:");
> +		vbuf_out = (vivid_meta_out_buf *)q.g_dataptr(buf.g_index(), 0);
> +
> +		fprintf(f, " brightness: %u", vbuf_out->brightness);
> +		fprintf(f, " contrast: %u", vbuf_out->contrast);
> +		fprintf(f, " saturation: %u", vbuf_out->saturation);
> +		fprintf(f, " hue: %d\n", vbuf_out->hue);

I would just combine all fprintf's into a single fprintf.

> +		break;
> +	}
> +}
> +
> +void meta_fillbuffer(int idx, cv4l_fmt &fmt, cv4l_queue &q)
> +{
> +	struct vivid_meta_out_buf *vbuf;

Add newline.

> +	switch (fmt.g_pixelformat()) {
> +		case V4L2_META_FMT_VIVID:
> +			vbuf = (vivid_meta_out_buf *)q.g_dataptr(idx, 0);
> +			vbuf->brightness = 228;
> +			vbuf->contrast = 228;
> +			vbuf->saturation = 228;
> +			vbuf->hue = 100;

Ah, be a bit more creative :-)

I.e. change values based on the buffer sequence number. That way the image
changes over time.

> +			break;
>  	}
>  }
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index 47b7d3f8..fc82d483 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -1146,6 +1146,7 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
>  	bool can_fill = false;
>  	bool is_video = q.g_type() == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
>  			q.g_type() == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	bool is_meta = q.g_type() == V4L2_BUF_TYPE_META_OUTPUT;
>  
>  	if (q.obtain_bufs(&fd))
>  		return QUEUE_ERROR;
> @@ -1177,7 +1178,6 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
>  	if (V4L2_FIELD_HAS_T_OR_B(field))
>  		output_field = (stream_out_std & V4L2_STD_525_60) ?
>  			V4L2_FIELD_BOTTOM : V4L2_FIELD_TOP;
> -

Spurious line deletion.

>  	if (is_video) {
>  		tpg_init(&tpg, 640, 360);
>  		tpg_alloc(&tpg, fmt.g_width());
> @@ -1244,6 +1244,9 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
>  		if (fin && !fill_buffer_from_file(fd, q, buf, fmt, fin))
>  			return QUEUE_STOPPED;
>  
> +		if (is_meta)
> +			meta_fillbuffer(i, fmt, q);

This should be moved to before the 'if (fin...' line.

Otherwise this would overwrite the data read from a file if fin != NULL.

> +
>  		if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS) {
>  			int media_fd = mi_get_media_fd(fd.g_fd());
>  
> @@ -1266,7 +1269,6 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
>  		}
>  		if (qbuf) {
>  			fps_timestamps fps_ts;
> -

Spurious line deletion.

>  			set_time_stamp(buf);
>  			if (fd.qbuf(buf))
>  				return QUEUE_ERROR;
> @@ -1480,6 +1482,7 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
>  			 bool stopped, bool ignore_count_skip)
>  {
>  	cv4l_buffer buf(q);
> +	bool is_meta = q.g_type() == V4L2_BUF_TYPE_META_OUTPUT;
>  	int ret = 0;
>  
>  	if (cap) {
> @@ -1522,6 +1525,7 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
>  			fprintf(stderr, ", dropped buffers: %u", dropped);
>  		fprintf(stderr, "\n");
>  	}
> +
>  	if (stopped)
>  		return 0;
>  
> @@ -1542,6 +1546,8 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
>  			tpg_fillbuffer(&tpg, stream_out_std, j,
>  				       (u8 *)q.g_dataptr(buf.g_index(), j));
>  	}
> +	if (is_meta)
> +		meta_fillbuffer(buf.g_index(), fmt, q);
>  
>  	if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS) {
>  		if (ioctl(buf.g_request_fd(), MEDIA_REQUEST_IOC_REINIT, NULL)) {
> @@ -2039,7 +2045,7 @@ static void streaming_set_out(cv4l_fd &fd, cv4l_fd &exp_fd)
>  
>  	if (!(capabilities & (V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VIDEO_OUTPUT_MPLANE |
>  			      V4L2_CAP_VBI_OUTPUT | V4L2_CAP_SLICED_VBI_OUTPUT |
> -			      V4L2_CAP_SDR_OUTPUT |
> +			      V4L2_CAP_SDR_OUTPUT | V4L2_CAP_META_OUTPUT |
>  			      V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE))) {
>  		fprintf(stderr, "unsupported stream type\n");
>  		return;
> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index 2c861d82..a12a2ba7 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -409,6 +409,7 @@ void meta_set(cv4l_fd &fd);
>  void meta_get(cv4l_fd &fd);
>  void meta_list(cv4l_fd &fd);
>  void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q);
> +void meta_fillbuffer(int idx, cv4l_fmt &fmt, cv4l_queue &q);
>  
>  // v4l2-ctl-subdev.cpp
>  void subdev_usage(void);
> 

Regards,

	Hans
