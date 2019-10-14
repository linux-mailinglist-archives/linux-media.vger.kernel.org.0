Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBAA1D6451
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 15:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732117AbfJNNqK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 09:46:10 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60201 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727789AbfJNNqK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 09:46:10 -0400
Received: from [IPv6:2001:983:e9a7:1:c8e8:9e43:7e19:64a2]
 ([IPv6:2001:983:e9a7:1:c8e8:9e43:7e19:64a2])
        by smtp-cloud7.xs4all.net with ESMTPA
        id K0fkid3K0o1ZhK0fliqTSQ; Mon, 14 Oct 2019 15:46:07 +0200
Subject: Re: [PATCH v2] v4l2-ctl: support for metadata output
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <cb0e7771-eba5-979d-e873-d889859a3f83@xs4all.nl>
 <20191003105459.6378-1-bnvandana@gmail.com>
 <63917b38-f671-2845-0ba7-18dbcdd11606@xs4all.nl>
Message-ID: <6d9d58ad-597c-f58d-c6d9-bef06e639b4c@xs4all.nl>
Date:   Mon, 14 Oct 2019 15:46:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <63917b38-f671-2845-0ba7-18dbcdd11606@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKoyvl/hvm1Sg2+yECGtD4XFg2LZM75wtFRoWOeDu+p+kicfAgeDrk/7XW8OVwx8pMnrIOv0wISsewMMl2p4qg3QAxdiUWXMYi3ZjTh+O500vJiAeagK
 JY/Z/3vqVRRrDOVvTc+5pHq0EKAYs2wIBBpEkUH1uEfMyVo4YnzH6NiHLsKmJCCiahSiX84OwnMhCBiTfjyX1OEDb5aebyaXW9lQJRMpQDtK/3Lp1VWF4mnf
 DrYx5+icY532CeDqJZr8ONrMlrApvgzl5opqBOrH7FKq7XnpwzcRbJ9fDxUN2UUH9JEs+mL5wShutU9Eeok21QQwJjlzKMgnPImUOwpKuvsbWDPi55W/5old
 Gy2yRsC/9Wl25w958FdA8IvF0Xmzhg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/14/19 1:44 PM, Hans Verkuil wrote:
> On 10/3/19 12:54 PM, Vandana BN wrote:
>> Adds support to test metadata output format V4L2_META_FMT_VIVID.
>>
>> Signed-off-by: Vandana BN <bnvandana@gmail.com>
>> ---
>>  contrib/freebsd/include/linux/videodev2.h |  1 +
>>  include/linux/videodev2.h                 |  1 +
>>  utils/v4l2-ctl/v4l2-ctl-meta.cpp          | 35 +++++++++++++++++++++++
>>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp     |  9 +++++-
>>  utils/v4l2-ctl/v4l2-ctl.h                 |  1 +
>>  5 files changed, 46 insertions(+), 1 deletion(-)
>>
>> diff --git a/contrib/freebsd/include/linux/videodev2.h b/contrib/freebsd/include/linux/videodev2.h
>> index 0c12d27f..6c0169be 100644
>> --- a/contrib/freebsd/include/linux/videodev2.h
>> +++ b/contrib/freebsd/include/linux/videodev2.h
>> @@ -783,6 +783,7 @@ struct v4l2_pix_format {
>>  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
>>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
>> +#define V4L2_META_FMT_VIVID       v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
>>  
>>  /* priv field value to indicates that subsequent fields are valid. */
>>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
>> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
>> index e2847759..107f96d2 100644
>> --- a/include/linux/videodev2.h
>> +++ b/include/linux/videodev2.h
>> @@ -749,6 +749,7 @@ struct v4l2_pix_format {
>>  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
>>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
>> +#define V4L2_META_FMT_VIVID       v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
>>  
>>  /* priv field value to indicates that subsequent fields are valid. */
>>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
>> diff --git a/utils/v4l2-ctl/v4l2-ctl-meta.cpp b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
>> index eae7438f..33e42fcf 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl-meta.cpp
>> +++ b/utils/v4l2-ctl/v4l2-ctl-meta.cpp
>> @@ -139,10 +139,18 @@ struct vivid_uvc_meta_buf {
>>  #define UVC_STREAM_SCR	(1 << 3)
>>  #define UVC_STREAM_PTS	(1 << 2)
>>  
>> +struct vivid_meta_out_buf {
>> +        __u16	brightness;
>> +        __u16	contrast;
>> +        __u16	saturation;
>> +        __s16	hue;
>> +};
>> +
>>  void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
>>  {
>>  	struct vivid_uvc_meta_buf *vbuf;
>>  	int buf_off = 0;
>> +	struct vivid_meta_out_buf *vbuf_out;
>>  
>>  	switch (fmt.g_pixelformat()) {
>>  	case V4L2_META_FMT_UVC:
>> @@ -164,5 +172,32 @@ void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
>>  				le16toh(*(__u16*)(vbuf->buf + buf_off + 4)));
>>  		fprintf(f, "\n");
>>  		break;
>> +	case V4L2_META_FMT_VIVID:
>> +		fprintf(f, "VIVID:");
>> +		vbuf_out = (vivid_meta_out_buf *)q.g_dataptr(buf.g_index(), 0);
>> +
>> +		fprintf(f, " brightness: %u contrast: %u saturation: %u  hue: %d\n",
>> +			vbuf_out->brightness, vbuf_out->contrast,
>> +			vbuf_out->saturation, vbuf_out->hue);
>> +		break;
>> +	}
>> +}
>> +
>> +void meta_fillbuffer(cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q)
>> +{
>> +	struct vivid_meta_out_buf *vbuf;
>> +
>> +	switch (fmt.g_pixelformat()) {
>> +		case V4L2_META_FMT_VIVID:
>> +			vbuf = (vivid_meta_out_buf *)q.g_dataptr(buf.g_index(), 0);
>> +			vbuf->brightness = buf.g_sequence() <= 255 ?
>> +				buf.g_sequence() : buf.g_sequence() % 255;
> 
> This is very cumbersome. Why not just do:
> 
> 			vbuf->brightness = buf.g_sequence() % 256;
> 
> (the range is 0-255, so that's modulo 256).
> 
> Same elsewhere.
> 
> Regards,
> 
> 	Hans
> 
>> +			vbuf->contrast =  buf.g_sequence() + 10 <= 255 ?
>> +				buf.g_sequence(): (buf.g_sequence() + 10) % 255;
>> +			vbuf->saturation = buf.g_sequence() + 20 <= 255 ?
>> +				buf.g_sequence(): (buf.g_sequence() + 20) % 255;
>> +			vbuf->hue = (__s16) buf.g_sequence() - 128 <= 128 ?
>> +				buf.g_sequence() - 128 : buf.g_sequence() % 256 - 128;

Another problem with this code is that the image goes completely to black at some point.
It is better to prevent that from happening by for example keeping the minimum brightness
and contrast at 64.

Regards,

	Hans

>> +			break;
>>  	}
>>  }
>> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>> index 47b7d3f8..184bfd64 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>> @@ -1146,6 +1146,7 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
>>  	bool can_fill = false;
>>  	bool is_video = q.g_type() == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
>>  			q.g_type() == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> +	bool is_meta = q.g_type() == V4L2_BUF_TYPE_META_OUTPUT;
>>  
>>  	if (q.obtain_bufs(&fd))
>>  		return QUEUE_ERROR;
>> @@ -1241,6 +1242,9 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
>>  					tpg_fillbuffer(&tpg, stream_out_std, j, (u8 *)q.g_dataptr(i, j));
>>  			}
>>  		}
>> +		if (is_meta)
>> +			meta_fillbuffer(buf, fmt, q);
>> +
>>  		if (fin && !fill_buffer_from_file(fd, q, buf, fmt, fin))
>>  			return QUEUE_STOPPED;
>>  
>> @@ -1480,6 +1484,7 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
>>  			 bool stopped, bool ignore_count_skip)
>>  {
>>  	cv4l_buffer buf(q);
>> +	bool is_meta = q.g_type() == V4L2_BUF_TYPE_META_OUTPUT;
>>  	int ret = 0;
>>  
>>  	if (cap) {
>> @@ -1542,6 +1547,8 @@ static int do_handle_out(cv4l_fd &fd, cv4l_queue &q, FILE *fin, cv4l_buffer *cap
>>  			tpg_fillbuffer(&tpg, stream_out_std, j,
>>  				       (u8 *)q.g_dataptr(buf.g_index(), j));
>>  	}
>> +	if (is_meta)
>> +		meta_fillbuffer(buf, fmt, q);
>>  
>>  	if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS) {
>>  		if (ioctl(buf.g_request_fd(), MEDIA_REQUEST_IOC_REINIT, NULL)) {
>> @@ -2039,7 +2046,7 @@ static void streaming_set_out(cv4l_fd &fd, cv4l_fd &exp_fd)
>>  
>>  	if (!(capabilities & (V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VIDEO_OUTPUT_MPLANE |
>>  			      V4L2_CAP_VBI_OUTPUT | V4L2_CAP_SLICED_VBI_OUTPUT |
>> -			      V4L2_CAP_SDR_OUTPUT |
>> +			      V4L2_CAP_SDR_OUTPUT | V4L2_CAP_META_OUTPUT |
>>  			      V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE))) {
>>  		fprintf(stderr, "unsupported stream type\n");
>>  		return;
>> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
>> index 2c861d82..b0f65e9b 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl.h
>> +++ b/utils/v4l2-ctl/v4l2-ctl.h
>> @@ -409,6 +409,7 @@ void meta_set(cv4l_fd &fd);
>>  void meta_get(cv4l_fd &fd);
>>  void meta_list(cv4l_fd &fd);
>>  void print_meta_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q);
>> +void meta_fillbuffer(cv4l_buffer &buf, cv4l_fmt &fmt, cv4l_queue &q);
>>  
>>  // v4l2-ctl-subdev.cpp
>>  void subdev_usage(void);
>>
> 

