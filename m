Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2300D18B533
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 14:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729025AbgCSNQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 09:16:31 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:46401 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729533AbgCSNQa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 09:16:30 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Ev28jtbDjfHuvEv2BjeI4U; Thu, 19 Mar 2020 14:16:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584623788; bh=3Z6lvwJZt3iqB3BozvoN2Djc3OqCbzF0EREyKz5Y/+4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QToR8ZQnyelrhkOvaQN20an/EKWNveFkRLj0a1hJ/z1eeUdCHkTIWqRFTQVbJcqYW
         +W5pPP/2Vq3q4hpUe6mbOmjHV9x8NICCzaX6QLdr9UPnVrv3wPBx7UckP2OICiY51j
         XErvlhvOSb8lhJWLR4zLjfhpZTr6YE+6oiP/lBZjT52+8ySSAxGNdOGfq9kYXbyoJS
         ZITTLr6Bf1RqElI1Q/7529TjHPgVfwmjeZdInQVqdcgv1LKG0+23jbb3sDfbA8hi+M
         NMV+crDBdoWkKFZ60AxdGaxLkqhDOGHD98XsFzZPw7MTb3GTHhqTA+Q7Lqlb4I1m6G
         GbUY8bs21a7DQ==
Subject: Re: [PATCH v2 15/18] media: allegro: verify source and destination
 buffer in VCU response
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
References: <20200316152638.19457-1-m.tretter@pengutronix.de>
 <20200316152638.19457-16-m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e1394123-319f-9a96-dba6-732c53513b77@xs4all.nl>
Date:   Thu, 19 Mar 2020 14:16:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316152638.19457-16-m.tretter@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKmLS6HuddYSP3XWFqmqwHiR3e/diwGTLmb1kkThJwSUmbykNtrn2ZqJZpzcrpG+BzR1AYKqdnhdxEHZ+X3FVIyIxPKH6IodSAQlHRcMXoj5YD0Mmw1p
 H0uLclTr2clAfJGy1dndsxrSajeTTr2WCe55Dq+VMN8NMTIW7BAyJ8vZ/2ATN5JXDd9K+f65u06C67sKFzpoRxzy/HYetesj0S4FeAkXMkVv89n/m8cP4sDi
 /MB5OjAz/kRSyUtjYShEAA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

I'm going to accept this patch, but I do have a suggestion for a future patch:

On 3/16/20 4:26 PM, Michael Tretter wrote:
> The PUT_STREAM_BUFFER and ENCODE_FRAME request have fields that allow to
> pass arbitrary 64 bit values through the firmware to the ENCODE_FRAME
> response. Use these values to verify that the buffers when finishing the
> frame are actually the same buffers that have been sent for encoding a
> frame.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changelog:
> 
> v1 -> v2:
> - Fix warnings about lines over 80 characters
> - Fix warnings about cast from ptr to u64
> ---
>  .../staging/media/allegro-dvt/allegro-core.c  | 32 +++++++++++++++----
>  1 file changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
> index 820fb21ab0f1..45e0d2c2fc44 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> @@ -567,6 +567,11 @@ static inline u32 to_codec_addr(struct allegro_dev *dev, dma_addr_t phys)
>  	return lower_32_bits(phys);
>  }
>  
> +static inline u64 ptr_to_u64(const void *ptr)
> +{
> +	return (uintptr_t)ptr;
> +}
> +
>  /* Helper functions for channel and user operations */
>  
>  static unsigned long allegro_next_user_id(struct allegro_dev *dev)
> @@ -1215,7 +1220,8 @@ static int allegro_mcu_send_destroy_channel(struct allegro_dev *dev,
>  static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
>  					      struct allegro_channel *channel,
>  					      dma_addr_t paddr,
> -					      unsigned long size)
> +					      unsigned long size,
> +					      u64 stream_id)

stream_id,

>  {
>  	struct mcu_msg_put_stream_buffer msg;
>  
> @@ -1229,7 +1235,8 @@ static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
>  	msg.mcu_addr = to_mcu_addr(dev, paddr);
>  	msg.size = size;
>  	msg.offset = ENCODER_STREAM_OFFSET;
> -	msg.stream_id = 0; /* copied to mcu_msg_encode_frame_response */
> +	/* copied to mcu_msg_encode_frame_response */
> +	msg.stream_id = stream_id;
>  
>  	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
>  	allegro_mcu_interrupt(dev);
> @@ -1239,7 +1246,8 @@ static int allegro_mcu_send_put_stream_buffer(struct allegro_dev *dev,
>  
>  static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
>  					 struct allegro_channel *channel,
> -					 dma_addr_t src_y, dma_addr_t src_uv)
> +					 dma_addr_t src_y, dma_addr_t src_uv,
> +					 u64 src_handle)

src_handle,

>  {
>  	struct mcu_msg_encode_frame msg;
>  
> @@ -1252,7 +1260,8 @@ static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
>  	msg.encoding_options = AL_OPT_FORCE_LOAD;
>  	msg.pps_qp = 26; /* qp are relative to 26 */
>  	msg.user_param = 0; /* copied to mcu_msg_encode_frame_response */
> -	msg.src_handle = 0; /* copied to mcu_msg_encode_frame_response */
> +	/* src_handle is copied to mcu_msg_encode_frame_response */
> +	msg.src_handle = src_handle;
>  	msg.src_y = to_codec_addr(dev, src_y);
>  	msg.src_uv = to_codec_addr(dev, src_uv);
>  	msg.stride = channel->stride;
> @@ -1602,8 +1611,17 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
>  	ssize_t free;
>  
>  	src_buf = v4l2_m2m_src_buf_remove(channel->fh.m2m_ctx);
> +	if (ptr_to_u64(src_buf) != msg->src_handle)
> +		v4l2_warn(&dev->v4l2_dev,
> +			  "channel %d: invalid source buffer (0x%llx)\n",
> +			  channel->mcu_channel_id, msg->src_handle);
>  
>  	dst_buf = v4l2_m2m_dst_buf_remove(channel->fh.m2m_ctx);
> +	if (ptr_to_u64(dst_buf) != msg->stream_id)

dst_buf, and elsewhere in this code 'dst_handle' and 'handle' are all really
just buffer pointers, but the variable names are all over the place.

It's very confusing, and a patch that cleans this up by giving better names
and probably adding some comments would help a lot.

Regards,

	Hans

> +		v4l2_warn(&dev->v4l2_dev,
> +			  "channel %d: invalid stream buffer (0x%llx)\n",
> +			  channel->mcu_channel_id, msg->stream_id);
> +
>  	dst_buf->sequence = channel->csequence++;
>  
>  	if (msg->error_code & AL_ERROR) {
> @@ -3025,14 +3043,16 @@ static void allegro_device_run(void *priv)
>  	dst_buf = v4l2_m2m_next_dst_buf(channel->fh.m2m_ctx);
>  	dst_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
>  	dst_size = vb2_plane_size(&dst_buf->vb2_buf, 0);
> -	allegro_mcu_send_put_stream_buffer(dev, channel, dst_addr, dst_size);
> +	allegro_mcu_send_put_stream_buffer(dev, channel, dst_addr, dst_size,
> +					   ptr_to_u64(dst_buf));
>  
>  	src_buf = v4l2_m2m_next_src_buf(channel->fh.m2m_ctx);
>  	src_buf->sequence = channel->osequence++;
>  
>  	src_y = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
>  	src_uv = src_y + (channel->stride * channel->height);
> -	allegro_mcu_send_encode_frame(dev, channel, src_y, src_uv);
> +	allegro_mcu_send_encode_frame(dev, channel, src_y, src_uv,
> +				      ptr_to_u64(src_buf));
>  }
>  
>  static const struct v4l2_m2m_ops allegro_m2m_ops = {
> 

