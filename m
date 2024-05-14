Return-Path: <linux-media+bounces-11449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D038C5BF9
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 21:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C99E41F211E0
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 19:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A7E181BBA;
	Tue, 14 May 2024 19:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="XkzMaXtE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4FF181331
	for <linux-media@vger.kernel.org>; Tue, 14 May 2024 19:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715716531; cv=none; b=WY2QT7jt3lAfHCP/PapBddNKTxLpvSTrLoRark0iW/Sw37Ud/Vm+hVhn6ySuwV7QK745nZp1/9PXHmFJOCKmOZQ4TRFGEGImPR4stKhGddWmsV7KAkzd4b/ZUqeCaBS1gQe9fOlULu7rX0n0cYWunRowvoniOMMAJ97ddakgtkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715716531; c=relaxed/simple;
	bh=yYKNDcdLY++CywStGQUWAsZ24pmlRQ+XAC5NZSDuBn8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f3Si0S6i5BzUdDmJNZpS+OhqI+IuaTZ3EErmr9Dkr+hjS9jxyRPG/yCWT3qJL96GyOU5RgjAbp4lM5xsL9MNUoHsYjveIE5h1lXMNNkqW8kcnEyBsoRVREy9f+VXcnIg37J8ws9k7NSwHEJD4XsngNdij/KDX8a8NM8Sl86Qfwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=XkzMaXtE; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7ef2a623958so1707292241.1
        for <linux-media@vger.kernel.org>; Tue, 14 May 2024 12:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1715716528; x=1716321328; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WmJz2A8Hb9nBy60LLxuOn4XJswBl0d/BlM1RABZsrn4=;
        b=XkzMaXtEsKj4Cm/79qnpFFo/pbfjNJYcLJfL/lL2N8OK1UFAV1f6wouEUhhVtn/XJZ
         JVpjjy8byIwDcEW/Dr3s/1yTcp8yYK4Ulg9vBlJXqnAoNUsFIZIY4dn9HV6ck6xQSggF
         jCXxgvJGDrTzb0M3vtV1j473oTka5M8uM0mQnYnswSAkPSlqUQg40n6EmRQd5J0hfy56
         RVxCu8ZGVG7Z+cPaZAdhGawIXb6jKVpVUWMQZ4UcaXKL6A33Aw+wEC3qwapY1U71s1gy
         XbAkc8Ig3mmmSPGe17P2c/KmvlzYFRBp2w0lonFZJN0cnYc+CQNug9hvfGdIDM1pl4Tb
         TzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715716528; x=1716321328;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WmJz2A8Hb9nBy60LLxuOn4XJswBl0d/BlM1RABZsrn4=;
        b=qopikAx+EFAeKSeLPrG3CPiWbUPpD+tgJR4M3iM2+FbpAWcJuCgb+pb240NQbvbVsz
         5nJI9dpQNols3S/DOT0Y9IqtLJ5dGLW69y7TCCWjJsFFXisbhOEoHMF8U89tgLPFLiMg
         CPD4Vn+xBaDXU5Ck5tY5vPbC38szR5mOk/9uzyTtrOdGXbFN7DDbEvuQp/jUkXp5GWFR
         w8ha5eHZ9JPL7vXT3wEIWwaixZdrZbvZXGWo42Jfe3K5Idm4iMjCaFXglguvQp0Ga8qO
         QTPeYP0aWi2MUc1DQxLkLGPEns9xLrn3NJITOEhEkLPUfTTscp6ugQBTSk53qJlG2mO7
         696Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaYntSo8KCKTgUyukWPE8aLBU8o+HaC61qDqQFdoJ3eVZqwbw0j97XmPT/NtYQu6jwB/TN8yjT1AbvPm4GaMDbqmXXfr9YCnLyvp8=
X-Gm-Message-State: AOJu0YwvKuJ/3zNFAKpHfWJokFpnM3BYRhIKnExdpocpgfMLotpYF515
	XsNhJQwIrRTW7BDTRCl6tLOMQ+KzIAE5WsJrrjVBG6dJN8qhQ9BjQaJfulirJLc=
X-Google-Smtp-Source: AGHT+IEQOoEqj7nU9ZVaR2hZrweI4cWl2aDL5aRRemcvc7l+PSIgTm7Ds4SHkgl2ggrxzGtkvpCZqg==
X-Received: by 2002:a05:6102:358f:b0:480:6c41:220b with SMTP id ada2fe7eead31-48077dcd7c8mr13289399137.1.1715716527997;
        Tue, 14 May 2024 12:55:27 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:6448::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e1c32e8basm26151861cf.36.2024.05.14.12.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 12:55:27 -0700 (PDT)
Message-ID: <b05539c6c7802df11df7e0097b0dc3e838f7e9c7.camel@ndufresne.ca>
Subject: Re: [PATCH] media: vivid: make the timestamps/seq numbers reliable
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 14 May 2024 15:55:26 -0400
In-Reply-To: <11f1f7fc-13ba-4be0-924c-ded60a5ca18f@xs4all.nl>
References: <11f1f7fc-13ba-4be0-924c-ded60a5ca18f@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

no a full review yet.

Le mercredi 24 avril 2024 =C3=A0 18:03 +0200, Hans Verkuil a =C3=A9crit=C2=
=A0:
> The sequence counters could skip due to bad time calculations.
> In addition, the timestamps were very jittery as well.
>=20
> This caused random warnings in v4l2-compliance when streaming because
> the sequence numbers were not what was expected.
>=20
> Adjust the code to be more precise. This affected video capture,
> output, v4l-touch and sdr capture since all had the same bad
> calculations.
>=20
> There is one problem remaining: if CONFIG_HZ is set to 100, then with
> framerates > 100 you will get dropped frames. This code really
> should switch to timers to handle this more accurately.
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/test-drivers/vivid/vivid-core.h |  8 ---
>  .../test-drivers/vivid/vivid-kthread-cap.c    | 54 +++++++--------
>  .../test-drivers/vivid/vivid-kthread-out.c    | 65 ++++++++-----------
>  .../test-drivers/vivid/vivid-kthread-touch.c  | 59 ++++++++---------
>  .../media/test-drivers/vivid/vivid-sdr-cap.c  | 21 +++---
>  5 files changed, 87 insertions(+), 120 deletions(-)
>=20
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/medi=
a/test-drivers/vivid/vivid-core.h
> index cfb8e66083f6..0f854aaddbf0 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.h
> +++ b/drivers/media/test-drivers/vivid/vivid-core.h
> @@ -399,10 +399,8 @@ struct vivid_dev {
>  	/* thread for generating video capture stream */
>  	struct task_struct		*kthread_vid_cap;
>  	unsigned long			jiffies_vid_cap;
> -	u64				cap_stream_start;
>  	u64				cap_frame_period;
>  	u64				cap_frame_eof_offset;
> -	u32				cap_seq_offset;
>  	u32				cap_seq_count;
>  	bool				cap_seq_resync;
>  	u32				vid_cap_seq_start;
> @@ -418,9 +416,6 @@ struct vivid_dev {
>  	/* Touch capture */
>  	struct task_struct		*kthread_touch_cap;
>  	unsigned long			jiffies_touch_cap;
> -	u64				touch_cap_stream_start;
> -	u32				touch_cap_seq_offset;
> -	bool				touch_cap_seq_resync;
>  	u32				touch_cap_seq_start;
>  	u32				touch_cap_seq_count;
>  	u32				touch_cap_with_seq_wrap_count;
> @@ -474,9 +469,7 @@ struct vivid_dev {
>  	/* thread for generating video output stream */
>  	struct task_struct		*kthread_vid_out;
>  	unsigned long			jiffies_vid_out;
> -	u32				out_seq_offset;
>  	u32				out_seq_count;
> -	bool				out_seq_resync;
>  	u32				vid_out_seq_start;
>  	u32				vid_out_seq_count;
>  	bool				vid_out_streaming;
> @@ -510,7 +503,6 @@ struct vivid_dev {
>  	/* thread for generating SDR stream */
>  	struct task_struct		*kthread_sdr_cap;
>  	unsigned long			jiffies_sdr_cap;
> -	u32				sdr_cap_seq_offset;
>  	u32				sdr_cap_seq_start;
>  	u32				sdr_cap_seq_count;
>  	u32				sdr_cap_with_seq_wrap_count;
> diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drive=
rs/media/test-drivers/vivid/vivid-kthread-cap.c
> index 42048727d7ff..d8bb5b1fc1ed 100644
> --- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
> @@ -553,12 +553,11 @@ static void vivid_cap_update_frame_period(struct vi=
vid_dev *dev)
>  }
>=20
>  static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_de=
v *dev,
> -							 int dropped_bufs)
> +							 int dropped_bufs, u64 f_time)
>  {
>  	struct vivid_buffer *vid_cap_buf =3D NULL;
>  	struct vivid_buffer *vbi_cap_buf =3D NULL;
>  	struct vivid_buffer *meta_cap_buf =3D NULL;
> -	u64 f_time =3D 0;
>=20
>  	dprintk(dev, 1, "Video Capture Thread Tick\n");
>=20
> @@ -596,8 +595,6 @@ static noinline_for_stack void vivid_thread_vid_cap_t=
ick(struct vivid_dev *dev,
>  	if (!vid_cap_buf && !vbi_cap_buf && !meta_cap_buf)
>  		goto update_mv;
>=20
> -	f_time =3D ktime_get_ns() + dev->time_wrap_offset;
> -
>  	if (vid_cap_buf) {
>  		v4l2_ctrl_request_setup(vid_cap_buf->vb.vb2_buf.req_obj.req,
>  					&dev->ctrl_hdl_vid_cap);
> @@ -664,12 +661,14 @@ static noinline_for_stack void vivid_thread_vid_cap=
_tick(struct vivid_dev *dev,
>  static int vivid_thread_vid_cap(void *data)
>  {
>  	struct vivid_dev *dev =3D data;
> +	u64 start_time;
>  	u64 numerators_since_start;
>  	u64 buffers_since_start;
> -	u64 next_jiffies_since_start;
> +	u64 f_time;
> +	u32 seq_offset =3D 0;
> +	unsigned long next_jiffies;
>  	unsigned long jiffies_since_start;
>  	unsigned long cur_jiffies;
> -	unsigned wait_jiffies;
>  	unsigned numerator;
>  	unsigned denominator;
>  	int dropped_bufs;
> @@ -679,13 +678,12 @@ static int vivid_thread_vid_cap(void *data)
>  	set_freezable();
>=20
>  	/* Resets frame counters */
> -	dev->cap_seq_offset =3D 0;
>  	dev->cap_seq_count =3D 0;
>  	dev->cap_seq_resync =3D false;
>  	dev->jiffies_vid_cap =3D jiffies;
> -	dev->cap_stream_start =3D ktime_get_ns();
> +	start_time =3D ktime_get_ns();
>  	if (dev->time_wrap)
> -		dev->time_wrap_offset =3D dev->time_wrap - dev->cap_stream_start;
> +		dev->time_wrap_offset =3D dev->time_wrap - start_time;
>  	else
>  		dev->time_wrap_offset =3D 0;
>  	vivid_cap_update_frame_period(dev);
> @@ -703,10 +701,9 @@ static int vivid_thread_vid_cap(void *data)
>  		cur_jiffies =3D jiffies;
>  		if (dev->cap_seq_resync) {
>  			dev->jiffies_vid_cap =3D cur_jiffies;
> -			dev->cap_seq_offset =3D dev->cap_seq_count + 1;
> +			seq_offset =3D dev->cap_seq_count + 1;
>  			dev->cap_seq_count =3D 0;
> -			dev->cap_stream_start +=3D dev->cap_frame_period *
> -						 dev->cap_seq_offset;
> +			start_time +=3D dev->cap_frame_period * seq_offset;
>  			vivid_cap_update_frame_period(dev);
>  			dev->cap_seq_resync =3D false;
>  		}
> @@ -719,9 +716,10 @@ static int vivid_thread_vid_cap(void *data)
>  		/* Calculate the number of jiffies since we started streaming */
>  		jiffies_since_start =3D cur_jiffies - dev->jiffies_vid_cap;
>  		/* Get the number of buffers streamed since the start */
> -		buffers_since_start =3D (u64)jiffies_since_start * denominator +
> -				      (HZ * numerator) / 2;

> +		buffers_since_start =3D (u64)jiffies_since_start * denominator;
>  		do_div(buffers_since_start, HZ * numerator);

This code could benefit in clarity by adding empty line before/after showin=
g
this is one formula. Don't we have a version of do_div() without side effec=
ts ?
That could also help here.

> +		f_time =3D start_time + dev->time_wrap_offset +
> +			buffers_since_start * dev->cap_frame_period;

f_time is a hard to read, I'm not even sure what it stands for. Perhaps a
comment or a better name ?

>=20
>  		/*
>  		 * After more than 0xf0000000 (rounded down to a multiple of
> @@ -731,16 +729,17 @@ static int vivid_thread_vid_cap(void *data)
>  		 */
>  		if (jiffies_since_start > JIFFIES_RESYNC) {
>  			dev->jiffies_vid_cap =3D cur_jiffies;
> -			dev->cap_seq_offset =3D buffers_since_start;
> +			seq_offset =3D buffers_since_start;
>  			buffers_since_start =3D 0;
>  		}
> -		dropped_bufs =3D buffers_since_start + dev->cap_seq_offset - dev->cap_=
seq_count;
> -		dev->cap_seq_count =3D buffers_since_start + dev->cap_seq_offset;
> +		dropped_bufs =3D buffers_since_start + seq_offset - dev->cap_seq_count=
;
> +		dev->cap_seq_count =3D buffers_since_start + seq_offset;
>  		dev->vid_cap_seq_count =3D dev->cap_seq_count - dev->vid_cap_seq_start=
;
>  		dev->vbi_cap_seq_count =3D dev->cap_seq_count - dev->vbi_cap_seq_start=
;
>  		dev->meta_cap_seq_count =3D dev->cap_seq_count - dev->meta_cap_seq_sta=
rt;
>=20
> -		vivid_thread_vid_cap_tick(dev, dropped_bufs);
> +		vivid_thread_vid_cap_tick(dev, dropped_bufs, f_time);
> +		mutex_unlock(&dev->mutex);
>=20
>  		/*
>  		 * Calculate the number of 'numerators' streamed since we started,
> @@ -748,24 +747,15 @@ static int vivid_thread_vid_cap(void *data)
>  		 */
>  		numerators_since_start =3D ++buffers_since_start * numerator;
>=20
> -		/* And the number of jiffies since we started */
> -		jiffies_since_start =3D jiffies - dev->jiffies_vid_cap;
> -
> -		mutex_unlock(&dev->mutex);
> -
>  		/*
>  		 * Calculate when that next buffer is supposed to start
>  		 * in jiffies since we started streaming.
>  		 */
> -		next_jiffies_since_start =3D numerators_since_start * HZ +
> -					   denominator / 2;
> -		do_div(next_jiffies_since_start, denominator);
> -		/* If it is in the past, then just schedule asap */
> -		if (next_jiffies_since_start < jiffies_since_start)
> -			next_jiffies_since_start =3D jiffies_since_start;
> -
> -		wait_jiffies =3D next_jiffies_since_start - jiffies_since_start;
> -		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
> +		next_jiffies =3D numerators_since_start * HZ + denominator - 1;

I'm seeing HZ * denomitor in two places at least. Is that you frame duratio=
n ?
Perhaps you could store that with a variable named accordingly ? Can you ex=
plain
why -1 ?

> +		do_div(next_jiffies, denominator);
> +		next_jiffies +=3D dev->jiffies_vid_cap;
> +
> +		while (time_is_after_jiffies(next_jiffies) &&
>  		       !kthread_should_stop())
>  			schedule();
>  	}
> diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-out.c b/drive=
rs/media/test-drivers/vivid/vivid-kthread-out.c
> index fac6208b51da..536688c7f503 100644
> --- a/drivers/media/test-drivers/vivid/vivid-kthread-out.c
> +++ b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
> @@ -41,7 +41,7 @@
>  #include "vivid-kthread-out.h"
>  #include "vivid-meta-out.h"
>=20
> -static void vivid_thread_vid_out_tick(struct vivid_dev *dev)
> +static void vivid_thread_vid_out_tick(struct vivid_dev *dev, u64 f_time)
>  {
>  	struct vivid_buffer *vid_out_buf =3D NULL;
>  	struct vivid_buffer *vbi_out_buf =3D NULL;
> @@ -95,8 +95,7 @@ static void vivid_thread_vid_out_tick(struct vivid_dev =
*dev)
>  			 */
>  			vid_out_buf->vb.sequence /=3D 2;
>  		}
> -		vid_out_buf->vb.vb2_buf.timestamp =3D
> -			ktime_get_ns() + dev->time_wrap_offset;
> +		vid_out_buf->vb.vb2_buf.timestamp =3D f_time;
>  		vb2_buffer_done(&vid_out_buf->vb.vb2_buf, dev->dqbuf_error ?
>  				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
>  		dprintk(dev, 2, "vid_out buffer %d done\n",
> @@ -112,8 +111,7 @@ static void vivid_thread_vid_out_tick(struct vivid_de=
v *dev)
>  			vivid_sliced_vbi_out_process(dev, vbi_out_buf);
>=20
>  		vbi_out_buf->vb.sequence =3D dev->vbi_out_seq_count;
> -		vbi_out_buf->vb.vb2_buf.timestamp =3D
> -			ktime_get_ns() + dev->time_wrap_offset;
> +		vbi_out_buf->vb.vb2_buf.timestamp =3D f_time;
>  		vb2_buffer_done(&vbi_out_buf->vb.vb2_buf, dev->dqbuf_error ?
>  				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
>  		dprintk(dev, 2, "vbi_out buffer %d done\n",
> @@ -126,8 +124,7 @@ static void vivid_thread_vid_out_tick(struct vivid_de=
v *dev)
>  					   &dev->ctrl_hdl_meta_out);
>  		vivid_meta_out_process(dev, meta_out_buf);
>  		meta_out_buf->vb.sequence =3D dev->meta_out_seq_count;
> -		meta_out_buf->vb.vb2_buf.timestamp =3D
> -			ktime_get_ns() + dev->time_wrap_offset;
> +		meta_out_buf->vb.vb2_buf.timestamp =3D f_time;
>  		vb2_buffer_done(&meta_out_buf->vb.vb2_buf, dev->dqbuf_error ?
>  				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
>  		dprintk(dev, 2, "meta_out buffer %d done\n",
> @@ -140,12 +137,14 @@ static void vivid_thread_vid_out_tick(struct vivid_=
dev *dev)
>  static int vivid_thread_vid_out(void *data)
>  {
>  	struct vivid_dev *dev =3D data;
> +	u64 start_time;
>  	u64 numerators_since_start;
>  	u64 buffers_since_start;
> -	u64 next_jiffies_since_start;
> +	u64 f_time, f_period;
> +	u32 seq_offset =3D 0;
> +	unsigned long next_jiffies;
>  	unsigned long jiffies_since_start;
>  	unsigned long cur_jiffies;
> -	unsigned wait_jiffies;
>  	unsigned numerator;
>  	unsigned denominator;
>=20
> @@ -154,15 +153,19 @@ static int vivid_thread_vid_out(void *data)
>  	set_freezable();
>=20
>  	/* Resets frame counters */
> -	dev->out_seq_offset =3D 0;
>  	dev->out_seq_count =3D 0;
>  	dev->jiffies_vid_out =3D jiffies;
> -	dev->out_seq_resync =3D false;
> +	start_time =3D ktime_get_ns();
>  	if (dev->time_wrap)
> -		dev->time_wrap_offset =3D dev->time_wrap - ktime_get_ns();
> +		dev->time_wrap_offset =3D dev->time_wrap - start_time;
>  	else
>  		dev->time_wrap_offset =3D 0;
>=20
> +	f_period =3D (u64)dev->timeperframe_vid_out.numerator * 1000000000;
> +	if (WARN_ON(dev->timeperframe_vid_out.denominator =3D=3D 0))
> +		dev->timeperframe_vid_out.denominator =3D 1;
> +	do_div(f_period, dev->timeperframe_vid_out.denominator);
> +
>  	for (;;) {
>  		try_to_freeze();
>  		if (kthread_should_stop())
> @@ -174,12 +177,6 @@ static int vivid_thread_vid_out(void *data)
>  		}
>=20
>  		cur_jiffies =3D jiffies;
> -		if (dev->out_seq_resync) {
> -			dev->jiffies_vid_out =3D cur_jiffies;
> -			dev->out_seq_offset =3D dev->out_seq_count + 1;
> -			dev->out_seq_count =3D 0;
> -			dev->out_seq_resync =3D false;
> -		}
>  		numerator =3D dev->timeperframe_vid_out.numerator;
>  		denominator =3D dev->timeperframe_vid_out.denominator;
>=20
> @@ -189,9 +186,10 @@ static int vivid_thread_vid_out(void *data)
>  		/* Calculate the number of jiffies since we started streaming */
>  		jiffies_since_start =3D cur_jiffies - dev->jiffies_vid_out;
>  		/* Get the number of buffers streamed since the start */
> -		buffers_since_start =3D (u64)jiffies_since_start * denominator +
> -				      (HZ * numerator) / 2;
> +		buffers_since_start =3D (u64)jiffies_since_start * denominator;
>  		do_div(buffers_since_start, HZ * numerator);
> +		f_time =3D start_time + dev->time_wrap_offset +
> +			buffers_since_start * f_period;
>=20
>  		/*
>  		 * After more than 0xf0000000 (rounded down to a multiple of
> @@ -201,41 +199,32 @@ static int vivid_thread_vid_out(void *data)
>  		 */
>  		if (jiffies_since_start > JIFFIES_RESYNC) {
>  			dev->jiffies_vid_out =3D cur_jiffies;
> -			dev->out_seq_offset =3D buffers_since_start;
> +			seq_offset =3D buffers_since_start;
>  			buffers_since_start =3D 0;
>  		}
> -		dev->out_seq_count =3D buffers_since_start + dev->out_seq_offset;
> +		dev->out_seq_count =3D buffers_since_start + seq_offset;
>  		dev->vid_out_seq_count =3D dev->out_seq_count - dev->vid_out_seq_start=
;
>  		dev->vbi_out_seq_count =3D dev->out_seq_count - dev->vbi_out_seq_start=
;
>  		dev->meta_out_seq_count =3D dev->out_seq_count - dev->meta_out_seq_sta=
rt;
>=20
> -		vivid_thread_vid_out_tick(dev);
> +		vivid_thread_vid_out_tick(dev, f_time);
>  		mutex_unlock(&dev->mutex);
>=20
>  		/*
>  		 * Calculate the number of 'numerators' streamed since we started,
>  		 * not including the current buffer.
>  		 */
> -		numerators_since_start =3D buffers_since_start * numerator;
> +		numerators_since_start =3D ++buffers_since_start * numerator;
>=20
> -		/* And the number of jiffies since we started */
> -		jiffies_since_start =3D jiffies - dev->jiffies_vid_out;
> -
> -		/* Increase by the 'numerator' of one buffer */
> -		numerators_since_start +=3D numerator;
>  		/*
>  		 * Calculate when that next buffer is supposed to start
>  		 * in jiffies since we started streaming.
>  		 */
> -		next_jiffies_since_start =3D numerators_since_start * HZ +
> -					   denominator / 2;
> -		do_div(next_jiffies_since_start, denominator);
> -		/* If it is in the past, then just schedule asap */
> -		if (next_jiffies_since_start < jiffies_since_start)
> -			next_jiffies_since_start =3D jiffies_since_start;
> -
> -		wait_jiffies =3D next_jiffies_since_start - jiffies_since_start;
> -		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
> +		next_jiffies =3D numerators_since_start * HZ + denominator - 1;
> +		do_div(next_jiffies, denominator);
> +		next_jiffies +=3D dev->jiffies_vid_out;
> +
> +		while (time_is_after_jiffies(next_jiffies) &&
>  		       !kthread_should_stop())
>  			schedule();
>  	}
> diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c b/dri=
vers/media/test-drivers/vivid/vivid-kthread-touch.c
> index fa711ee36a3f..cd0c3938b6a1 100644
> --- a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
> +++ b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
> @@ -11,7 +11,7 @@
>  #include "vivid-touch-cap.h"
>=20
>  static noinline_for_stack void vivid_thread_tch_cap_tick(struct vivid_de=
v *dev,
> -							 int dropped_bufs)
> +							 int dropped_bufs, u64 f_time)
>  {
>  	struct vivid_buffer *tch_cap_buf =3D NULL;
>=20
> @@ -36,7 +36,7 @@ static noinline_for_stack void vivid_thread_tch_cap_tic=
k(struct vivid_dev *dev,
>  		dprintk(dev, 2, "touch_cap buffer %d done\n",
>  			tch_cap_buf->vb.vb2_buf.index);
>=20
> -		tch_cap_buf->vb.vb2_buf.timestamp =3D ktime_get_ns() + dev->time_wrap_=
offset;
> +		tch_cap_buf->vb.vb2_buf.timestamp =3D f_time;
>  	}
>  	dev->dqbuf_error =3D false;
>  }
> @@ -44,12 +44,14 @@ static noinline_for_stack void vivid_thread_tch_cap_t=
ick(struct vivid_dev *dev,
>  static int vivid_thread_touch_cap(void *data)
>  {
>  	struct vivid_dev *dev =3D data;
> +	u64 start_time;
>  	u64 numerators_since_start;
>  	u64 buffers_since_start;
> -	u64 next_jiffies_since_start;
> +	u64 f_time, f_period;
> +	u32 seq_offset =3D 0;
> +	unsigned long next_jiffies;
>  	unsigned long jiffies_since_start;
>  	unsigned long cur_jiffies;
> -	unsigned int wait_jiffies;
>  	unsigned int numerator;
>  	unsigned int denominator;
>  	int dropped_bufs;
> @@ -59,15 +61,19 @@ static int vivid_thread_touch_cap(void *data)
>  	set_freezable();
>=20
>  	/* Resets frame counters */
> -	dev->touch_cap_seq_offset =3D 0;
>  	dev->touch_cap_seq_count =3D 0;
> -	dev->touch_cap_seq_resync =3D false;
>  	dev->jiffies_touch_cap =3D jiffies;
> +	start_time =3D ktime_get_ns();
>  	if (dev->time_wrap)
> -		dev->time_wrap_offset =3D dev->time_wrap - ktime_get_ns();
> +		dev->time_wrap_offset =3D dev->time_wrap - start_time;
>  	else
>  		dev->time_wrap_offset =3D 0;
>=20
> +	f_period =3D (u64)dev->timeperframe_tch_cap.numerator * 1000000000;
> +	if (WARN_ON(dev->timeperframe_tch_cap.denominator =3D=3D 0))
> +		dev->timeperframe_tch_cap.denominator =3D 1;
> +	do_div(f_period, dev->timeperframe_tch_cap.denominator);
> +
>  	for (;;) {
>  		try_to_freeze();
>  		if (kthread_should_stop())
> @@ -78,21 +84,16 @@ static int vivid_thread_touch_cap(void *data)
>  			continue;
>  		}
>  		cur_jiffies =3D jiffies;
> -		if (dev->touch_cap_seq_resync) {
> -			dev->jiffies_touch_cap =3D cur_jiffies;
> -			dev->touch_cap_seq_offset =3D dev->touch_cap_seq_count + 1;
> -			dev->touch_cap_seq_count =3D 0;
> -			dev->cap_seq_resync =3D false;
> -		}
>  		denominator =3D dev->timeperframe_tch_cap.denominator;
>  		numerator =3D dev->timeperframe_tch_cap.numerator;
>=20
>  		/* Calculate the number of jiffies since we started streaming */
>  		jiffies_since_start =3D cur_jiffies - dev->jiffies_touch_cap;
>  		/* Get the number of buffers streamed since the start */
> -		buffers_since_start =3D (u64)jiffies_since_start * denominator +
> -				      (HZ * numerator) / 2;
> +		buffers_since_start =3D (u64)jiffies_since_start * denominator;
>  		do_div(buffers_since_start, HZ * numerator);
> +		f_time =3D start_time + dev->time_wrap_offset +
> +			buffers_since_start * f_period;
>=20
>  		/*
>  		 * After more than 0xf0000000 (rounded down to a multiple of
> @@ -102,15 +103,16 @@ static int vivid_thread_touch_cap(void *data)
>  		 */
>  		if (jiffies_since_start > JIFFIES_RESYNC) {
>  			dev->jiffies_touch_cap =3D cur_jiffies;
> -			dev->cap_seq_offset =3D buffers_since_start;
> +			seq_offset =3D buffers_since_start;
>  			buffers_since_start =3D 0;
>  		}
> -		dropped_bufs =3D buffers_since_start + dev->touch_cap_seq_offset - dev=
->touch_cap_seq_count;
> -		dev->touch_cap_seq_count =3D buffers_since_start + dev->touch_cap_seq_=
offset;
> +		dropped_bufs =3D buffers_since_start + seq_offset - dev->touch_cap_seq=
_count;
> +		dev->touch_cap_seq_count =3D buffers_since_start + seq_offset;
>  		dev->touch_cap_with_seq_wrap_count =3D
>  			dev->touch_cap_seq_count - dev->touch_cap_seq_start;
>=20
> -		vivid_thread_tch_cap_tick(dev, dropped_bufs);
> +		vivid_thread_tch_cap_tick(dev, dropped_bufs, f_time);
> +		mutex_unlock(&dev->mutex);
>=20
>  		/*
>  		 * Calculate the number of 'numerators' streamed
> @@ -118,24 +120,15 @@ static int vivid_thread_touch_cap(void *data)
>  		 */
>  		numerators_since_start =3D ++buffers_since_start * numerator;
>=20
> -		/* And the number of jiffies since we started */
> -		jiffies_since_start =3D jiffies - dev->jiffies_touch_cap;
> -
> -		mutex_unlock(&dev->mutex);
> -
>  		/*
>  		 * Calculate when that next buffer is supposed to start
>  		 * in jiffies since we started streaming.
>  		 */
> -		next_jiffies_since_start =3D numerators_since_start * HZ +
> -					   denominator / 2;
> -		do_div(next_jiffies_since_start, denominator);
> -		/* If it is in the past, then just schedule asap */
> -		if (next_jiffies_since_start < jiffies_since_start)
> -			next_jiffies_since_start =3D jiffies_since_start;
> -
> -		wait_jiffies =3D next_jiffies_since_start - jiffies_since_start;
> -		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
> +		next_jiffies =3D numerators_since_start * HZ + denominator - 1;
> +		do_div(next_jiffies, denominator);
> +		next_jiffies +=3D dev->jiffies_touch_cap;
> +
> +		while (time_is_after_jiffies(next_jiffies) &&
>  		       !kthread_should_stop())
>  			schedule();
>  	}
> diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/m=
edia/test-drivers/vivid/vivid-sdr-cap.c
> index a81f26b76988..e0d4deb4b1a5 100644
> --- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
> @@ -82,7 +82,7 @@ static const struct v4l2_frequency_band bands_fm[] =3D =
{
>  	},
>  };
>=20
> -static void vivid_thread_sdr_cap_tick(struct vivid_dev *dev)
> +static void vivid_thread_sdr_cap_tick(struct vivid_dev *dev, u64 f_time)
>  {
>  	struct vivid_buffer *sdr_cap_buf =3D NULL;
>=20
> @@ -108,8 +108,7 @@ static void vivid_thread_sdr_cap_tick(struct vivid_de=
v *dev)
>  		v4l2_ctrl_request_complete(sdr_cap_buf->vb.vb2_buf.req_obj.req,
>  					   &dev->ctrl_hdl_sdr_cap);
>  		vivid_sdr_cap_process(dev, sdr_cap_buf);
> -		sdr_cap_buf->vb.vb2_buf.timestamp =3D
> -			ktime_get_ns() + dev->time_wrap_offset;
> +		sdr_cap_buf->vb.vb2_buf.timestamp =3D f_time;
>  		vb2_buffer_done(&sdr_cap_buf->vb.vb2_buf, dev->dqbuf_error ?
>  				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
>  		dev->dqbuf_error =3D false;
> @@ -119,9 +118,12 @@ static void vivid_thread_sdr_cap_tick(struct vivid_d=
ev *dev)
>  static int vivid_thread_sdr_cap(void *data)
>  {
>  	struct vivid_dev *dev =3D data;
> +	u64 start_time;
> +	u64 f_time;
>  	u64 samples_since_start;
>  	u64 buffers_since_start;
>  	u64 next_jiffies_since_start;
> +	u32 seq_offset =3D 0;
>  	unsigned long jiffies_since_start;
>  	unsigned long cur_jiffies;
>  	unsigned wait_jiffies;
> @@ -131,12 +133,12 @@ static int vivid_thread_sdr_cap(void *data)
>  	set_freezable();
>=20
>  	/* Resets frame counters */
> -	dev->sdr_cap_seq_offset =3D 0;
>  	dev->sdr_cap_seq_count =3D 0;
>  	dev->jiffies_sdr_cap =3D jiffies;
>  	dev->sdr_cap_seq_resync =3D false;
> +	start_time =3D ktime_get_ns();
>  	if (dev->time_wrap)
> -		dev->time_wrap_offset =3D dev->time_wrap - ktime_get_ns();
> +		dev->time_wrap_offset =3D dev->time_wrap - start_time;
>  	else
>  		dev->time_wrap_offset =3D 0;
>=20
> @@ -153,7 +155,7 @@ static int vivid_thread_sdr_cap(void *data)
>  		cur_jiffies =3D jiffies;
>  		if (dev->sdr_cap_seq_resync) {
>  			dev->jiffies_sdr_cap =3D cur_jiffies;
> -			dev->sdr_cap_seq_offset =3D dev->sdr_cap_seq_count + 1;
> +			seq_offset =3D dev->sdr_cap_seq_count + 1;
>  			dev->sdr_cap_seq_count =3D 0;
>  			dev->sdr_cap_seq_resync =3D false;
>  		}
> @@ -173,14 +175,15 @@ static int vivid_thread_sdr_cap(void *data)
>  		 */
>  		if (jiffies_since_start > JIFFIES_RESYNC) {
>  			dev->jiffies_sdr_cap =3D cur_jiffies;
> -			dev->sdr_cap_seq_offset =3D buffers_since_start;
> +			seq_offset =3D buffers_since_start;
>  			buffers_since_start =3D 0;
>  		}
>  		dev->sdr_cap_seq_count =3D
> -			buffers_since_start + dev->sdr_cap_seq_offset;
> +			buffers_since_start + seq_offset;
>  		dev->sdr_cap_with_seq_wrap_count =3D dev->sdr_cap_seq_count - dev->sdr=
_cap_seq_start;
> +		f_time =3D start_time + dev->time_wrap_offset;
>=20
> -		vivid_thread_sdr_cap_tick(dev);
> +		vivid_thread_sdr_cap_tick(dev, f_time);
>  		mutex_unlock(&dev->mutex);
>=20
>  		/*

Overall this code suffer severe clarity before and after this change and I'=
m not
confident more similar bugs will be appear in different condition. Perhaps =
some
simplification and cleanup could happen while touching it ?

Nicolas


