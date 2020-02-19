Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B971164105
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 11:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgBSJ76 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 04:59:58 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46992 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgBSJ75 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 04:59:57 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so27402585wrl.13
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 01:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B3zIt1X3TLLEJ/qVzyEqjATuS1sOPE0vjwCh7HxvDk0=;
        b=YTuYyL3/d/NefU0us0Yc50Xo/+F7SLC2CSWULWOu3o0PgT0QtMC+p4uPgNmHDdfJut
         Y81gwr58cw17rnJyUxA8eOxbS696hGXcI4NAJ9Vbjj8hbfqU8bBFfKq6T4rfi66TACfd
         IqUbFMUUamH/6eAPH2vN5t7TmMAUuR2JRK4kKjW5aU876fvd+5Et6VOop6RFzM57tdyq
         fNCgAr5n/avoWSLDHUKumPe0eMLTDpMJDKOVvbnbaBR5uHe1Myu8ffU9bc1VzqBjhhJR
         tbF636OaD87NAYsV366250mvLRU1qI3SvVST5D7bsYSu4NLvoFNl4/CAW/0fHjWunsD4
         Ia0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=B3zIt1X3TLLEJ/qVzyEqjATuS1sOPE0vjwCh7HxvDk0=;
        b=CACX8Hkbr5Yv+b+IypcC4bF1gso/Q0FYcT36ZK7LOS+xwu16XIdqDMlqqiowzIm0vd
         0UGoVJIyOf7xxhMB8ORRT/B7C31xO6q2jCRQBzWq9XudMXD8WR2SF1ebl7iEeovrg13C
         Funn5NwJ2fyA561pw2cmL5kJPletnsJ9q2AQObYet4F/KSVDT/QOLdjqY7zopY5xKIs5
         cuYA0z0tGZjGFDITiJmoKnBbM3SmOa5tq892BYliUMeHgCCd3g8h8K+KtFTBfYr4fF41
         veBz+MmYNGApnmFARWABeDj5eOuD+rGG4OW2EGtlmAuMBITuvGGrQIl1LEb2RvoC6i9K
         Siuw==
X-Gm-Message-State: APjAAAUNjOW69xqgvUNaRFcF0kE1Y2P754KK6USNgqr7b5vHJZaxo1Xv
        A4sgk68YVjdscsN95mCQJ5ekgg==
X-Google-Smtp-Source: APXvYqyk/C2gk5Bk1VVqFf2/WlrXPGDkKgqIsYomJ1NOoLY2w5WaE02Ml5U1AANrPUCBBh3X6GYbAQ==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr34768477wru.52.1582106393467;
        Wed, 19 Feb 2020 01:59:53 -0800 (PST)
Received: from [10.1.3.173] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c9sm2278046wme.41.2020.02.19.01.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2020 01:59:52 -0800 (PST)
Subject: Re: [PATCH v5 1/4] media: v4l2-mem2mem: handle draining, stopped and
 next-buf-is-last states
To:     Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200206082648.25184-1-narmstrong@baylibre.com>
 <20200206082648.25184-2-narmstrong@baylibre.com>
 <487e02e9-d7e3-04b6-7f30-ee0c4f154a1f@xs4all.nl>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwU0EVid/pAEQAND7AFhr
 5faf/EhDP9FSgYd/zgmb7JOpFPje3uw7jz9wFb28Cf0Y3CcncdElYoBNbRlesKvjQRL8mozV
 9RN+IUMHdUx1akR/A4BPXNdL7StfzKWOCxZHVS+rIQ/fE3Qz/jRmT6t2ZkpplLxVBpdu95qJ
 YwSZjuwFXdC+A7MHtQXYi3UfCgKiflj4+/ITcKC6EF32KrmIRqamQwiRsDcUUKlAUjkCLcHL
 CQvNsDdm2cxdHxC32AVm3Je8VCsH7/qEPMQ+cEZk47HOR3+Ihfn1LEG5LfwsyWE8/JxsU2a1
 q44LQM2lcK/0AKAL20XDd7ERH/FCBKkNVzi+svYJpyvCZCnWT0TRb72mT+XxLWNwfHTeGALE
 +1As4jIS72IglvbtONxc2OIid3tR5rX3k2V0iud0P7Hnz/JTdfvSpVj55ZurOl2XAXUpGbq5
 XRk5CESFuLQV8oqCxgWAEgFyEapI4GwJsvfl/2Er8kLoucYO1Id4mz6N33+omPhaoXfHyLSy
 dxD+CzNJqN2GdavGtobdvv/2V0wukqj86iKF8toLG2/Fia3DxMaGUxqI7GMOuiGZjXPt/et/
 qeOySghdQ7Sdpu6fWc8CJXV2mOV6DrSzc6ZVB4SmvdoruBHWWOR6YnMz01ShFE49pPucyU1h
 Av4jC62El3pdCrDOnWNFMYbbon3vABEBAAHCwn4EGAECAAkFAlYnf6QCGwICKQkQFpq3saTP
 +K7BXSAEGQECAAYFAlYnf6QACgkQd9zb2sjISdGToxAAkOjSfGxp0ulgHboUAtmxaU3viucV
 e2Hl1BVDtKSKmbIVZmEUvx9D06IijFaEzqtKD34LXD6fjl4HIyDZvwfeaZCbJbO10j3k7FJE
 QrBtpdVqkJxme/nYlGOVzcOiKIepNkwvnHVnuVDVPcXyj2wqtsU7VZDDX41z3X4xTQwY3SO1
 9nRO+f+i4RmtJcITgregMa2PcB0LvrjJlWroI+KAKCzoTHzSTpCXMJ1U/dEqyc87bFBdc+DI
 k8mWkPxsccdbs4t+hH0NoE3Kal9xtAl56RCtO/KgBLAQ5M8oToJVatxAjO1SnRYVN1EaAwrR
 xkHdd97qw6nbg9BMcAoa2NMc0/9MeiaQfbgW6b0reIz/haHhXZ6oYSCl15Knkr4t1o3I2Bqr
 Mw623gdiTzotgtId8VfLB2Vsatj35OqIn5lVbi2ua6I0gkI6S7xJhqeyrfhDNgzTHdQVHB9/
 7jnM0ERXNy1Ket6aDWZWCvM59dTyu37g3VvYzGis8XzrX1oLBU/tTXqo1IFqqIAmvh7lI0Se
 gCrXz7UanxCwUbQBFjzGn6pooEHJYRLuVGLdBuoApl/I4dLqCZij2AGa4CFzrn9W0cwm3HCO
 lR43gFyz0dSkMwNUd195FrvfAz7Bjmmi19DnORKnQmlvGe/9xEEfr5zjey1N9+mt3//geDP6
 clwKBkq0JggA+RTEAELzkgPYKJ3NutoStUAKZGiLOFMpHY6KpItbbHjF2ZKIU1whaRYkHpB2
 uLQXOzZ0d7x60PUdhqG3VmFnzXSztA4vsnDKk7x2xw0pMSTKhMafpxaPQJf494/jGnwBHyi3
 h3QGG1RjfhQ/OMTX/HKtAUB2ct3Q8/jBfF0hS5GzT6dYtj0Ci7+8LUsB2VoayhNXMnaBfh+Q
 pAhaFfRZWTjUFIV4MpDdFDame7PB50s73gF/pfQbjw5Wxtes/0FnqydfId95s+eej+17ldGp
 lMv1ok7K0H/WJSdr7UwDAHEYU++p4RRTJP6DHWXcByVlpNQ4SSAiivmWiwOt490+Ac7ATQRN
 WQbPAQgAvIoM384ZRFocFXPCOBir5m2J+96R2tI2XxMgMfyDXGJwFilBNs+fpttJlt2995A8
 0JwPj8SFdm6FBcxygmxBBCc7i/BVQuY8aC0Z/w9Vzt3Eo561r6pSHr5JGHe8hwBQUcNPd/9l
 2ynP57YTSE9XaGJK8gIuTXWo7pzIkTXfN40Wh5jeCCspj4jNsWiYhljjIbrEj300g8RUT2U0
 FcEoiV7AjJWWQ5pi8lZJX6nmB0lc69Jw03V6mblgeZ/1oTZmOepkagwy2zLDXxihf0GowUif
 GphBDeP8elWBNK+ajl5rmpAMNRoKxpN/xR4NzBg62AjyIvigdywa1RehSTfccQARAQABwsBf
 BBgBAgAJBQJNWQbPAhsMAAoJEBaat7Gkz/iuteIH+wZuRDqK0ysAh+czshtG6JJlLW6eXJJR
 Vi7dIPpgFic2LcbkSlvB8E25Pcfz/+tW+04Urg4PxxFiTFdFCZO+prfd4Mge7/OvUcwoSub7
 ZIPo8726ZF5/xXzajahoIu9/hZ4iywWPAHRvprXaim5E/vKjcTeBMJIqZtS4u/UK3EpAX59R
 XVxVpM8zJPbk535ELUr6I5HQXnihQm8l6rt9TNuf8p2WEDxc8bPAZHLjNyw9a/CdeB97m2Tr
 zR8QplXA5kogS4kLe/7/JmlDMO8Zgm9vKLHSUeesLOrjdZ59EcjldNNBszRZQgEhwaarfz46
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <8ab4ceef-75df-e0e0-6322-5b99ddff7c04@baylibre.com>
Date:   Wed, 19 Feb 2020 10:59:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <487e02e9-d7e3-04b6-7f30-ee0c4f154a1f@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 14/02/2020 16:54, Hans Verkuil wrote:
> On 2/6/20 9:26 AM, Neil Armstrong wrote:
>> Since the draining and stop phase of the HW decoder mem2mem bahaviour is
> 
> behavior
> 
>> now clearly defined, we can move handling of the following states to the
>> common v4l2-mem2mem core code:
>> - draining
>> - stopped
>> - next-buf-is-last
>>
>> By introducing the following v4l2-mem2mem APIS:
> 
> APIs
> 
>> - v4l2_m2m_encoder_cmd/v4l2_m2m_ioctl_encoder_cmd to handle start/stop command
>> - v4l2_m2m_decoder_cmd/v4l2_m2m_ioctl_decoder_cmd to handle start/stop command
>> - v4l2_m2m_start_streaming to handle start of streaming of the de/encoder queue
>> - v4l2_m2m_stop_streaming to handle stop of streaming of the de/encoder queue
>> - v4l2_m2m_last_buffer_done to maek the current dest buffer as the last one
> 
> make
> 
>>
>> And inline helpers:
>> - v4l2_m2m_mark_stopped to mark the de/encoding process as stopped
>> - v4l2_m2m_clear_state to clear the de/encoding state
>> - v4l2_m2m_dst_buf_is_last to detect the current dequeud dst_buf is the last
> 
> dequeued
> 
>> - v4l2_m2m_has_stopped to detect the de/encoding stopped state
>> - v4l2_m2m_is_last_draining_src_buf to detect the currect source buffer should
> 
> current
> 
>>  be the last processing before stopping the de/encoding process
>>
>> The special next-buf-is-last when min_buffers != 1 case is also handled
>> in v4l2_m2m_qbuf() by reusing the other introduced APIs.
>>
>> This state management has been stolen from the vicodec implementation,
>> and is no-op for drivers not calling the v4l2_m2m_encoder_cmd or
>> v4l2_m2m_decoder_cmd and v4l2_m2m_start_streaming/v4l2_m2m_stop_streaming.
> 
> Documenting these new helpers in the commit log is not very useful, they should
> be documented in v4l2-mem2mem.h.

I added an explicit documentation for these helpers.

> 
> Since this is all fairly complex, I would like to see more comments in the
> source as well, explaining what is happening and how/when to use it.

Ok

> 
>>
>> The vicodec will be the first one to be converted as an example.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/media/v4l2-core/v4l2-mem2mem.c | 172 ++++++++++++++++++++++++-
>>  include/media/v4l2-mem2mem.h           |  95 ++++++++++++++
>>  2 files changed, 265 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
>> index 1afd9c6ad908..f221d6c7a137 100644
>> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
>> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
>> @@ -340,6 +340,11 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
>>  		m2m_ctx->new_frame = !dst->vb2_buf.copied_timestamp ||
>>  			dst->vb2_buf.timestamp != src->vb2_buf.timestamp;
>>  
>> +	if (m2m_ctx->has_stopped) {
>> +		dprintk("Device has stopped\n");
>> +		goto job_unlock;
>> +	}
>> +
>>  	if (m2m_dev->m2m_ops->job_ready
>>  		&& (!m2m_dev->m2m_ops->job_ready(m2m_ctx->priv))) {
>>  		dprintk("Driver not ready\n");
>> @@ -556,6 +561,99 @@ int v4l2_m2m_querybuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>>  }
>>  EXPORT_SYMBOL_GPL(v4l2_m2m_querybuf);
>>  
>> +void v4l2_m2m_last_buffer_done(struct v4l2_m2m_ctx *m2m_ctx,
>> +			       struct vb2_v4l2_buffer *vbuf)
>> +{
>> +	vbuf->flags |= V4L2_BUF_FLAG_LAST;
>> +	vb2_buffer_done(&vbuf->vb2_buf, VB2_BUF_STATE_DONE);
>> +
>> +	v4l2_m2m_mark_stopped(m2m_ctx);
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_m2m_last_buffer_done);
>> +
>> +static int v4l2_mark_last_buf(struct v4l2_m2m_ctx *m2m_ctx)
> 
> The name of this function is not very clear and actually confusing given
> the name of the previous function v4l2_m2m_last_buffer_done(). Hopefully
> you can come up with something a bit more descriptive.

OK

> 
>> +{
>> +	struct vb2_v4l2_buffer *next_dst_buf;
>> +
>> +	if (m2m_ctx->is_draining)
>> +		return -EBUSY;
>> +
>> +	if (m2m_ctx->has_stopped)
>> +		return 0;
>> +
>> +	m2m_ctx->last_src_buf = v4l2_m2m_last_src_buf(m2m_ctx);
>> +	m2m_ctx->is_draining = true;
>> +
>> +	if (m2m_ctx->last_src_buf)
>> +		return 0;
>> +
>> +	next_dst_buf = v4l2_m2m_dst_buf_remove(m2m_ctx);
>> +	if (!next_dst_buf) {
>> +		m2m_ctx->next_buf_last = true;
>> +		return 0;
>> +	}
>> +
>> +	v4l2_m2m_last_buffer_done(m2m_ctx, next_dst_buf);
>> +
>> +	return 0;
>> +}
>> +
>> +void v4l2_m2m_start_streaming(struct v4l2_m2m_ctx *m2m_ctx, struct vb2_queue *q)
>> +{
>> +	if (V4L2_TYPE_IS_OUTPUT(q->type))
>> +		m2m_ctx->last_src_buf = NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_m2m_start_streaming);
>> +
>> +void v4l2_m2m_stop_streaming(struct v4l2_m2m_ctx *m2m_ctx, struct vb2_queue *q)
>> +{
>> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>> +		if (m2m_ctx->is_draining) {
>> +			struct vb2_v4l2_buffer *next_dst_buf;
>> +
>> +			m2m_ctx->last_src_buf = NULL;
>> +			next_dst_buf = v4l2_m2m_dst_buf_remove(m2m_ctx);
>> +			if (!next_dst_buf)
>> +				m2m_ctx->next_buf_last = true;
>> +			else
>> +				v4l2_m2m_last_buffer_done(m2m_ctx,
>> +							  next_dst_buf);
>> +		}
>> +	} else {
>> +		v4l2_m2m_clear_state(m2m_ctx);
>> +	}
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_m2m_stop_streaming);
> 
> Same for these two functions: the names suggest that these implement start and stop
> streaming, but instead they are called from start and stop streaming to update the
> state.

Indeed, renaming

> 
>> +
>> +static void v4l2_m2m_force_last_buf_done(struct v4l2_m2m_ctx *m2m_ctx,
>> +					 struct vb2_queue *q)
>> +{
>> +	struct vb2_buffer *vb;
>> +	struct vb2_v4l2_buffer *vbuf;
>> +	unsigned int i;
>> +
>> +	if (WARN_ON(q->is_output))
>> +		return;
>> +	if (list_empty(&q->queued_list))
>> +		return;
>> +
>> +	vb = list_first_entry(&q->queued_list, struct vb2_buffer, queued_entry);
>> +	for (i = 0; i < vb->num_planes; i++)
>> +		vb2_set_plane_payload(vb, i, 0);
>> +
>> +	/*
>> +	 * Since the buffer hasn't been queued to the ready queue,
>> +	 * mark is active and owned before marking it LAST and DONE
>> +	 */
>> +	vb->state = VB2_BUF_STATE_ACTIVE;
>> +	atomic_inc(&q->owned_by_drv_count);
>> +
>> +	vbuf = to_vb2_v4l2_buffer(vb);
>> +	vbuf->field = V4L2_FIELD_NONE;
>> +
>> +	v4l2_m2m_last_buffer_done(m2m_ctx, vbuf);
>> +}
>> +
>>  int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>>  		  struct v4l2_buffer *buf)
>>  {
>> @@ -570,11 +668,25 @@ int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>>  			__func__);
>>  		return -EPERM;
>>  	}
>> +
>>  	ret = vb2_qbuf(vq, vdev->v4l2_dev->mdev, buf);
>> -	if (!ret && !(buf->flags & V4L2_BUF_FLAG_IN_REQUEST))
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * If the capture queue is streaming, but streaming hasn't started
>> +	 * on the device, but was asked to stop, mark the previously queued
>> +	 * buffer as DONE with LAST flag since it won't be queued on the
>> +	 * device.
>> +	 */
>> +	if (!V4L2_TYPE_IS_OUTPUT(vq->type) &&
>> +	    vb2_is_streaming(vq) && !vb2_start_streaming_called(vq) &&
>> +	   (v4l2_m2m_has_stopped(m2m_ctx) || v4l2_m2m_dst_buf_is_last(m2m_ctx)))
>> +		v4l2_m2m_force_last_buf_done(m2m_ctx, vq);
>> +	else if (!(buf->flags & V4L2_BUF_FLAG_IN_REQUEST))
>>  		v4l2_m2m_try_schedule(m2m_ctx);
>>  
>> -	return ret;
>> +	return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(v4l2_m2m_qbuf);
>>  
>> @@ -1225,6 +1337,62 @@ int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
>>  }
>>  EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_decoder_cmd);
>>  
>> +int v4l2_m2m_encoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>> +			 struct v4l2_encoder_cmd *ec)
>> +{
>> +	if (ec->cmd != V4L2_ENC_CMD_STOP && ec->cmd != V4L2_ENC_CMD_START)
>> +		return -EINVAL;
>> +
>> +	if (ec->cmd == V4L2_ENC_CMD_STOP)
>> +		return v4l2_mark_last_buf(m2m_ctx);
>> +
>> +	if (m2m_ctx->is_draining)
>> +		return -EBUSY;
>> +
>> +	if (m2m_ctx->has_stopped)
>> +		m2m_ctx->has_stopped = false;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_m2m_encoder_cmd);
> 
> The next patch uses this function as follows in vicodec:
> 
> +	ret = v4l2_m2m_ioctl_encoder_cmd(file, fh, ec);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ec->cmd == V4L2_ENC_CMD_STOP &&
> +	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
> +		v4l2_event_queue_fh(&ctx->fh, &vicodec_eos_event);
> +
> +	if (ec->cmd == V4L2_ENC_CMD_START &&
> +	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
>  		vb2_clear_last_buffer_dequeued(&ctx->fh.m2m_ctx->cap_q_ctx.q);
> 
> I was wondering if that would be standard behavior for codecs and should
> be added to v4l2_m2m_encoder_cmd. Ditto for decoder_cmd below.

Unfortunately, no.

The issue comes from the synchronous behaviour of the decoder, in the Amlogic case,
the H264 decoder behavior with src and dst buf is asynchronous, where we need to dequeue
and push to hardware a unknown variable number of buffers before getting capture buffers.
This is not true for VP9 and HEVC for example, but since we need to manage all the
different codecs in a single codebase, we can't assume/predict a direct
src_buf->dst_buf relationship in all cases.

This is why I left this in the vicodec code.

> 
>> +
>> +int v4l2_m2m_decoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>> +			 struct v4l2_decoder_cmd *dc)
>> +{
>> +	if (dc->cmd != V4L2_DEC_CMD_STOP && dc->cmd != V4L2_DEC_CMD_START)
>> +		return -EINVAL;
>> +
>> +	if (dc->cmd == V4L2_DEC_CMD_STOP)
>> +		return v4l2_mark_last_buf(m2m_ctx);
>> +
>> +	if (m2m_ctx->is_draining)
>> +		return -EBUSY;
>> +
>> +	if (m2m_ctx->has_stopped)
>> +		m2m_ctx->has_stopped = false;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_m2m_decoder_cmd);
>> +
>> +int v4l2_m2m_ioctl_encoder_cmd(struct file *file, void *priv,
>> +			       struct v4l2_encoder_cmd *ec)
>> +{
>> +	struct v4l2_fh *fh = file->private_data;
>> +
>> +	return v4l2_m2m_encoder_cmd(file, fh->m2m_ctx, ec);
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_encoder_cmd);
>> +
>> +int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *priv,
>> +			       struct v4l2_decoder_cmd *dc)
>> +{
>> +	struct v4l2_fh *fh = file->private_data;
>> +
>> +	return v4l2_m2m_decoder_cmd(file, fh->m2m_ctx, dc);
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_decoder_cmd);
>> +
>>  int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
>>  					     struct v4l2_decoder_cmd *dc)
>>  {
>> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
>> index 1d85e24791e4..3476889af46c 100644
>> --- a/include/media/v4l2-mem2mem.h
>> +++ b/include/media/v4l2-mem2mem.h
>> @@ -80,6 +80,10 @@ struct v4l2_m2m_queue_ctx {
>>   *		for an existing frame. This is always true unless
>>   *		V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF is set, which
>>   *		indicates slicing support.
>> + * @is_draining: indicates device is in draining phase
>> + * @last_src_buf: indicate the last source buffer for draining
>> + * @next_buf_last: next capture queud buffer will be tagged as last
>> + * @has_stopped: indicate the device has been stopped
>>   * @m2m_dev: opaque pointer to the internal data to handle M2M context
>>   * @cap_q_ctx: Capture (output to memory) queue context
>>   * @out_q_ctx: Output (input from memory) queue context
>> @@ -98,6 +102,11 @@ struct v4l2_m2m_ctx {
>>  
>>  	bool				new_frame;
>>  
>> +	bool				is_draining;
>> +	struct vb2_v4l2_buffer		*last_src_buf;
>> +	bool				next_buf_last;
>> +	bool				has_stopped;
>> +
>>  	/* internal use only */
>>  	struct v4l2_m2m_dev		*m2m_dev;
>>  
>> @@ -215,6 +224,50 @@ v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
>>  	vb2_buffer_done(&buf->vb2_buf, state);
>>  }
>>  
>> +static inline void
>> +v4l2_m2m_clear_state(struct v4l2_m2m_ctx *m2m_ctx)
>> +{
>> +	m2m_ctx->next_buf_last = false;
>> +	m2m_ctx->is_draining = false;
>> +	m2m_ctx->has_stopped = false;
>> +}
>> +
>> +static inline void
>> +v4l2_m2m_mark_stopped(struct v4l2_m2m_ctx *m2m_ctx)
>> +{
>> +	m2m_ctx->next_buf_last = false;
>> +	m2m_ctx->is_draining = false;
>> +	m2m_ctx->has_stopped = true;
>> +}
>> +
>> +static inline bool
>> +v4l2_m2m_dst_buf_is_last(struct v4l2_m2m_ctx *m2m_ctx)
>> +{
>> +	return m2m_ctx->is_draining && m2m_ctx->next_buf_last;
>> +}
>> +
>> +static inline bool
>> +v4l2_m2m_has_stopped(struct v4l2_m2m_ctx *m2m_ctx)
>> +{
>> +	return m2m_ctx->has_stopped;
>> +}
>> +
>> +static inline bool
>> +v4l2_m2m_is_last_draining_src_buf(struct v4l2_m2m_ctx *m2m_ctx,
>> +				       struct vb2_v4l2_buffer *buf)
>> +{
>> +	return m2m_ctx->is_draining && buf == m2m_ctx->last_src_buf;
>> +}
> 
> Comments are needed for all 5 functions above.

Ok

> 
>> +
>> +/**
>> + * v4l2_m2m_last_buffer_done() - marks the buffer with LAST flag and DONE
>> + *
>> + * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
>> + * @vbuf: pointer to struct &v4l2_buffer
>> + */
>> +void v4l2_m2m_last_buffer_done(struct v4l2_m2m_ctx *m2m_ctx,
>> +			       struct vb2_v4l2_buffer *vbuf);
>> +
>>  /**
>>   * v4l2_m2m_reqbufs() - multi-queue-aware REQBUFS multiplexer
>>   *
>> @@ -312,6 +365,44 @@ int v4l2_m2m_streamon(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>>  int v4l2_m2m_streamoff(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>>  		       enum v4l2_buf_type type);
>>  
>> +/**
>> + * v4l2_m2m_start_streaming() - handle start of streaming of a video queue
>> + *
>> + * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
>> + * @q: queue
>> + */
>> +void v4l2_m2m_start_streaming(struct v4l2_m2m_ctx *m2m_ctx,
>> +			      struct vb2_queue *q);
>> +
>> +/**
>> + * v4l2_m2m_stop_streaming() - handle stop of streaming of a video queue
>> + *
>> + * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
>> + * @q: queue
>> + */
>> +void v4l2_m2m_stop_streaming(struct v4l2_m2m_ctx *m2m_ctx,
>> +			     struct vb2_queue *q);
>> +
>> +/**
>> + * v4l2_m2m_encoder_cmd() - execute an encoder command
>> + *
>> + * @file: pointer to struct &file
>> + * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
>> + * @ec: pointer to the encoder command
>> + */
>> +int v4l2_m2m_encoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>> +			 struct v4l2_encoder_cmd *ec);
>> +
>> +/**
>> + * v4l2_m2m_decoder_cmd() - execute a decoder command
>> + *
>> + * @file: pointer to struct &file
>> + * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
>> + * @dc: pointer to the decoder command
>> + */
>> +int v4l2_m2m_decoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>> +			 struct v4l2_decoder_cmd *dc);
>> +
>>  /**
>>   * v4l2_m2m_poll() - poll replacement, for destination buffers only
>>   *
>> @@ -704,6 +795,10 @@ int v4l2_m2m_ioctl_streamon(struct file *file, void *fh,
>>  				enum v4l2_buf_type type);
>>  int v4l2_m2m_ioctl_streamoff(struct file *file, void *fh,
>>  				enum v4l2_buf_type type);
>> +int v4l2_m2m_ioctl_encoder_cmd(struct file *file, void *fh,
>> +			       struct v4l2_encoder_cmd *ec);
>> +int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *fh,
>> +			       struct v4l2_decoder_cmd *dc);
>>  int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
>>  				   struct v4l2_encoder_cmd *ec);
>>  int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
>>
> 
> Regards,
> 
> 	Hans
> 

Thanks for the review,
Neil
