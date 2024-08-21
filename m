Return-Path: <linux-media+bounces-16584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A599E95A289
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 18:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DCE5287ACA
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 16:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7602914EC61;
	Wed, 21 Aug 2024 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="NOqo4dFp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9A714E2F1
	for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 16:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724256747; cv=none; b=YDe9ABNNQ4Jc7WVa1/htRBug9ZfCz79e/vB11MLj5T01ol0ZK6buoB4RINmFsihk9UjcCZ2ZpTQZMNPCGN72sfi8EmgW19l/QYta1h9gg4nQBmdsGR9X/6lX6EOLy9XIQWLTruxrLnFmDAXHdEcQCfCPW6VxQQ8LQiK2ZnjxLso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724256747; c=relaxed/simple;
	bh=rZlnF9XpK8E+ktKvGpI021B1aWR3uXhOnZr5fB4QVP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=okGtYvDQpjq3YRsDfLsuN5vYqWp1Nal/9jP1gK77lo7bSCnEei0/EFZfwnPOy4MLQ15DVG4fQcFp30WRTAt7zgJ/SKiyKs4A1y3e/e35a4odUcfxChxGFwTHq9NWNOHDGUGI3aJkF5itca/h4OwA8m0SMdcI046Uqp08qd7k/ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=NOqo4dFp; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e1661dcbc2fso1290926276.0
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 09:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1724256744; x=1724861544; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PwcKOnzwG6QnC9n0i5TxwqfaEkJiWIM/uJRNyENilTM=;
        b=NOqo4dFpMfvjWN4q2tBioIx2wu1o3+cv3wi2b/+E3U4kZswCpEkIaNiHMOPUsoii+L
         NM35b9gi7yL9gaGmOddg6+wSPKHHs8dMqUUyiyQKgpvQGJOWkNUNVzMR57C1SVeACd02
         eUx2hpgpQxcfIdanxWrLNatCUZIX/9RunHzrAt2Xwx4S7h4br97GCxQy0QQb1J3T0Ndd
         bHl+S/IJokDj1aYA+Q0EBqJjWqqNcYbpi4F0FWLccLSIAgiIIHADNckSCdaoq3Lnh1DQ
         P6vyc4YFuNo6nhuPsIrjtw2WrtiKstqjEeC85IujzoCUmpS1UTitcbd1RoUwCT8MJWAq
         lbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724256744; x=1724861544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PwcKOnzwG6QnC9n0i5TxwqfaEkJiWIM/uJRNyENilTM=;
        b=PcbB6wEkZ4vqfvvg2rfPrGGjY9U/i6/NVYHxORCRqVEPjqefFWMllNmuVrmKbhKTiA
         S4Z/ZeRExv4z3OWnHXywu8HWm7rxHn/1CKzwK7ozcIsu7x7A6CaXKcKl80thRBB61nNs
         6oVY4476dL8bYYejGsjJW5HVOjKFschQecHsdXHEsAljJ2yAKZuE4r8RzJ2koi9z7Y0L
         l/0DrX7/5zu4w0kL0zPznnPOj+1GjjWUG8yiHpNs3QnnBX/6sGW8V6w7akwhKI+eJGs1
         sZJsBF18KIlHRQX6kYeUjtGHPlDFHdHc0sT0wq2qMLeZz+utMnA83R1EWm8cRQnR6vCv
         +7vA==
X-Gm-Message-State: AOJu0YwvS/a97TsHyfEhQsNSAo71CylUzv4dgSWuPgqPZqyseWaRMqQY
	pZY08T4u5dT6uMXW5rBofYghSlQ2vJIJp6ycAWtIrX5SLkHKv8MBc0eyoJFGaCzJ5lhfoY97XQC
	gQAeZ6gJlsySnYuM9R5+0iPTKMv7mf1Ldj9iM6Q==
X-Google-Smtp-Source: AGHT+IERa600AtL1OjLJzx8ovPfZhum5LJsFp4M6ZM7H/mFS5GrjVLzXEqqQ00xG0pFhGGg1S8NclW91lnDCVQdBiDw=
X-Received: by 2002:a05:6902:2205:b0:e16:cfa:b2c6 with SMTP id
 3f1490d57ef6-e166642f1c8mr2919958276.29.1724256744436; Wed, 21 Aug 2024
 09:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1724249420.git.hverkuil-cisco@xs4all.nl> <501bb64b027022ebcfb9636e9267dfba520c4a67.1724249421.git.hverkuil-cisco@xs4all.nl>
In-Reply-To: <501bb64b027022ebcfb9636e9267dfba520c4a67.1724249421.git.hverkuil-cisco@xs4all.nl>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 21 Aug 2024 17:12:08 +0100
Message-ID: <CAPY8ntBz9Z-OVHpHinANN5WP6Ki8Fa0Fv0VFj+6kniRr-yOqPA@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] media: i2c: tc358743: export InfoFrames to debugfs
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

This is a very useful little series - thanks.

On Wed, 21 Aug 2024 at 15:16, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Export InfoFrames to debugfs.

I had a tc358743 to hand, so thought this warranted a quick test.
I think you have an off-by-one on the length that this exposes.

log_status is giving me state
   [  428.600874] tc358743 10-000f: -----HDMI status-----
   [  428.600881] tc358743 10-000f: HDCP encrypted content: no
   [  428.600887] tc358743 10-000f: Input color space: RGB limited range
   [  428.601404] tc358743 10-000f: AV Mute: off
   [  428.601921] tc358743 10-000f: Deep color mode: 8-bits per channel
   [  428.604407] tc358743 10-000f: HDMI infoframe: Auxiliary Video
Information (AVI), version 2, length 13
   [  428.604425] tc358743 10-000f:     colorspace: RGB
   [  428.604433] tc358743 10-000f:     scan mode: Underscan
   [  428.604441] tc358743 10-000f:     colorimetry: No Data
   [  428.604449] tc358743 10-000f:     picture aspect: 16:9
   [  428.604456] tc358743 10-000f:     active aspect: Same as Picture
   [  428.604463] tc358743 10-000f:     itc: No Data
   [  428.604469] tc358743 10-000f:     extended colorimetry: xvYCC 601
   [  428.604476] tc358743 10-000f:     quantization range: Limited
   [  428.604483] tc358743 10-000f:     nups: Unknown Non-uniform Scaling
   [  428.604490] tc358743 10-000f:     video code: 4
   [  428.604497] tc358743 10-000f:     ycc quantization range: Limited
   [  428.604505] tc358743 10-000f:     hdmi content type: Graphics
   [  428.604511] tc358743 10-000f:     pixel repeat: 0
   [  428.604519] tc358743 10-000f:     bar top 0, bottom 0, left 0, right 0

pi@bookworm64:~/edid-decode $ xxd /sys/kernel/debug/v4l2/tc358743\
10-000f/infoframes/avi
00000000: 8202 0d2d 1228 0404 0000 0000 0000 0000  ...-.(..........

At the transmitting end I've got
pi@bookworm64:~/edid-decode $ sudo xxd
/sys/kernel/debug/dri/1/HDMI-A-1/infoframes/avi
00000000: 8202 0d2d 1228 0404 0000 0000 0000 0000  ...-.(..........
00000010: 00

edid-decode -I decodes the latter fine, but aborts on the former.
Oddly the "fail" message from parse_if_hdr [1] doesn't get printed, it
just stops with
pi@bookworm64:~/edid-decode $ ./build/edid-decode -I
/sys/kernel/debug/v4l2/tc358743\ 10-000f/infoframes/avi
edid-decode InfoFrame (hex):

82 02 0d 2d 12 28 04 04 00 00 00 00 00 00 00 00

----------------

HDMI InfoFrame Checksum: 0x2d

AVI InfoFrame
  Version: 2
  Length: 13


[1] https://git.linuxtv.org/edid-decode.git/tree/parse-if.cpp#n21

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/i2c/tc358743.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index 65d58ddf0287..c7652c0dbaeb 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -87,6 +87,10 @@ struct tc358743_state {
>         struct timer_list timer;
>         struct work_struct work_i2c_poll;
>
> +       /* debugfs */
> +       struct dentry *debugfs_dir;
> +       struct v4l2_debugfs_if *infoframes;
> +
>         /* edid  */
>         u8 edid_blocks_written;
>
> @@ -430,12 +434,35 @@ static void tc358743_erase_bksv(struct v4l2_subdev *sd)
>
>  /* --------------- AVI infoframe --------------- */
>
> +static ssize_t
> +tc358743_debugfs_if_read(u32 type, void *priv, struct file *filp,
> +                        char __user *ubuf, size_t count, loff_t *ppos)
> +{
> +       u8 buf[V4L2_DEBUGFS_IF_MAX_LEN] = {};
> +       struct v4l2_subdev *sd = priv;
> +       int len;
> +
> +       if (!is_hdmi(sd))
> +               return 0;
> +
> +       if (type != V4L2_DEBUGFS_IF_AVI)
> +               return 0;
> +
> +       i2c_rd(sd, PK_AVI_0HEAD, buf, PK_AVI_16BYTE - PK_AVI_0HEAD + 1);
> +       len = buf[2] + 3;

tda1997x has len = buffer[2] + 4;
adv7842 and adv7604 have len = buf[2] + 1; and then return len + 3;
adv7511 has len = buffer[2]; and return len + 4;

So I think this should be len = buf[2] + 4;

Doing so makes edid-decode happy.
pi@bookworm64:~/edid-decode $ sudo ./build/edid-decode -I
/sys/kernel/debug/v4l2/tc358743\ 10-000f/infoframes/avi
edid-decode InfoFrame (hex):

82 02 0d 2d 12 28 04 04 00 00 00 00 00 00 00 00
00

----------------

HDMI InfoFrame Checksum: 0x2d

AVI InfoFrame
  Version: 2
  Length: 13
  VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
  Y: Color Component Sample Format: RGB
  A: Active Format Information Present: Yes
  B: Bar Data Present: Bar Data not present
  S: Scan Information: Composed for an underscanned display
  C: Colorimetry: No Data
  M: Picture Aspect Ratio: 16:9
  R: Active Portion Aspect Ratio: 8
  ITC: IT Content: No Data
  EC: Extended Colorimetry: xvYCC601
  Q: RGB Quantization Range: Limited Range
  SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
  YQ: YCC Quantization Range: Limited Range
  CN: IT Content Type: Graphics
  PR: Pixel Data Repetition Count: 0
  Line Number of End of Top Bar: 0
  Line Number of Start of Bottom Bar: 0
  Pixel Number of End of Left Bar: 0
  Pixel Number of Start of Right Bar: 0

I haven't double checked the maths to ensure that we have read that
extra byte via i2c_rd though.

  Dave

> +       if (len > V4L2_DEBUGFS_IF_MAX_LEN)
> +               len = -ENOENT;
> +       if (len > 0)
> +               len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
> +       return len < 0 ? 0 : len;
> +}
> +
>  static void print_avi_infoframe(struct v4l2_subdev *sd)
>  {
>         struct i2c_client *client = v4l2_get_subdevdata(sd);
>         struct device *dev = &client->dev;
>         union hdmi_infoframe frame;
> -       u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
> +       u8 buffer[HDMI_INFOFRAME_SIZE(AVI)] = {};
>
>         if (!is_hdmi(sd)) {
>                 v4l2_info(sd, "DVI-D signal - AVI infoframe not supported\n");
> @@ -2161,6 +2188,11 @@ static int tc358743_probe(struct i2c_client *client)
>         if (err < 0)
>                 goto err_work_queues;
>
> +       state->debugfs_dir = debugfs_create_dir(sd->name, v4l2_debugfs_root());
> +       state->infoframes = v4l2_debugfs_if_alloc(state->debugfs_dir,
> +                                                 V4L2_DEBUGFS_IF_AVI, sd,
> +                                                 tc358743_debugfs_if_read);
> +
>         v4l2_info(sd, "%s found @ 0x%x (%s)\n", client->name,
>                   client->addr << 1, client->adapter->name);
>
> @@ -2188,6 +2220,8 @@ static void tc358743_remove(struct i2c_client *client)
>                 flush_work(&state->work_i2c_poll);
>         }
>         cancel_delayed_work_sync(&state->delayed_work_enable_hotplug);
> +       v4l2_debugfs_if_free(state->infoframes);
> +       debugfs_remove_recursive(state->debugfs_dir);
>         cec_unregister_adapter(state->cec_adap);
>         v4l2_async_unregister_subdev(sd);
>         v4l2_device_unregister_subdev(sd);
> --
> 2.43.0
>

