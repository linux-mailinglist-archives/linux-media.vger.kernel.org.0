Return-Path: <linux-media+bounces-50925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A294DD387A0
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 21:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D080300F27A
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 20:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2FE2EA743;
	Fri, 16 Jan 2026 20:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgHRtyC3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0842EA16A
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 20:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768595752; cv=none; b=U45kelyfIhT2qV9ISL3/pP1tW1n92Z2HZKxY0aJ0m+JgQe8DU09jGTAfn/k85sg8F6VI+wS+yC8prRdCD8JB2E2wHeRkSC3B8chOXpkDn69/RYYgx49kVI5tnZdK+9l8OzbZUnVb4nxkxxJ1Z/GdgrO4pVXrWxi5D5JVkJEgnZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768595752; c=relaxed/simple;
	bh=GOb1ehtPaqGS0c50ZEktp31pAhrWNF+JTEv9GmLJhOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lc93bEvkbQscagVlGKp5BJa6gSp2oEhpokTl/qulmaJJDaiv+B9MA2HUGbmYp5ch9Vd0m+YQocCKLTr68AklZJ9s03vy58I7iLmx1Cf8r1ADKq4CkNycpR80ASRaTAkrwKwQ6v7IrnhnYZ8DOqx6hcF+V8wkJTysPdnyLWLH8Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgHRtyC3; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a2bff5f774so7594835ad.2
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768595750; x=1769200550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kKJheJetYY/V5sqP+JATbPs8hpsLfHZZamN7fwy8MN0=;
        b=SgHRtyC3XxCF7QPUEgGEN+FiI6sydV9m9cFkh+smqcmONZ+0fxVgkZBV8nKR2uuWq4
         4cZt8CzXRJM2G6f9if1mn5T74X4jYAMhdF9nYbnq2HVLVWbN5saDQWOOVwLlleuhGTTS
         ad3p84bz6JoLBoU3DddWPt+SPF3ZGNoP94aL4+CjfnVGGZS1tGM3bfov/8/2bVPdW+4p
         5MH8tplWd4+vJgX9RQ4RAjDm85Sq7QVSmFIAPVuvLDyO8yAsRtE3QZ48C19T1egoASmT
         5AZ5Nbpvs/Zt2xVRo3JYbRTFWo8qz7cWGojM1drwMsMVM/SFGIvOUX6CtOZybZKdRcqd
         1wUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768595750; x=1769200550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKJheJetYY/V5sqP+JATbPs8hpsLfHZZamN7fwy8MN0=;
        b=j6olSpWYgiaSwkZ5K+iYT4ApLgU9sDPEdC5sSsme0FyuIxLNwIO3Gsm6LJQZxfY7d6
         X7I/tgoIhYRc58kTSCfoKzK2SAcZcXtzUiTOIHElUbFUm1kfG5WgrC58S3jcNAkNZoxp
         LIlrzziT3oHd4kzc6xk00ZAlsfNtictzaNmb23EZXVS4sYmVhppgumvuzgvTvPgPoR0T
         fPYD2sH3oXmTqBWiDRkqH5ZhaERYp7pp9jl5s9ffDtJPTDd2hY43wCByZAK7D558M9Fm
         NW4ZXJnrKAxu2aebiXb3dIQcZx3f8zlnzbZoNm0OUdDm2HWcg5FL81h48NtEvwuwprR1
         Dzbg==
X-Forwarded-Encrypted: i=1; AJvYcCW52zFEvtzeqaquMOBcqzttdNecEhmWvZrjOpDKyrXPTrsiDS5gIv8WxMupEh3goWyPqysOld+1mhRHXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOCSDIicm/5L1GB2OxoK1eKvhMm5S/baeZeE9n/lDJ2P663QNX
	ek8c5+HrZC2l/V082D/SFDXeSMstMkrtAP9QML/Gfd73X1VGSRpZj7ub
X-Gm-Gg: AY/fxX6ga15hxtQOt9dgB2XhYLstQMzGykKqjEFx46Sw3nBGO/WdjCJS6JpkFfnnd6h
	EJC9knuQo8FMxLPe89kMYvNOKn1YayJPim2eTRtg+64eB2fneZlNuhduQy8tzBqLEbN+BYg/fEc
	r33ZJ0J/0COZ9mYaKtLyy9YK1ZKNqD5e9cPIv8ED7yAfzYLiWYBbSfvUvC7xteAo4BmXbZi/aeC
	LRBtP+JLAgKWBDK1/UTnq0Q3sKF0lGWu681poeT3tVVNiwlLZ1qpbIO0MWsFQus0rSxqz2c9/7u
	2KwwuvLUCOfOg9cY9NZpIHHkns8/FLHUG4Nwumy+fisvowiL2YQrwOlYQ795Ch5EqoRe+Qmy+wp
	kEHcomzjZ93/Js9q8P3GpC0Zjq6L2jxEfEtkLkLOzjD1eR9K04Hg983QT1nzoRhTOEWWtjBZxsW
	QRs8LHxkk8iQ0OeSXMK0sKjmjbYP75Csym/x642owZDcZej6SlM+w=
X-Received: by 2002:a17:903:1b4c:b0:298:535e:ef34 with SMTP id d9443c01a7336-2a7175c675emr27151045ad.5.1768595750296;
        Fri, 16 Jan 2026 12:35:50 -0800 (PST)
Received: from FAIZEL-KB ([2001:569:5999:dc00:912d:8e92:d374:a91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941d636sm21495375ad.96.2026.01.16.12.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 12:35:49 -0800 (PST)
Date: Fri, 16 Jan 2026 12:35:47 -0800
From: Faizel K B <faizel.kb@gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 2/3] media: vimc: sensor: Add frame rate configuration
 support
Message-ID: <cr7vrmkqxuriwici63khv4rv4fyeyp4aacejqe5mqfwuwbd2bs@xrjarfm6g4fv>
References: <20260115191050.1370387-1-faizel.kb@gmail.com>
 <20260115191050.1370387-3-faizel.kb@gmail.com>
 <176855718062.1693075.8294828651917203116@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <176855718062.1693075.8294828651917203116@ping.linuxembedded.co.uk>

On Fri, Jan 16, 2026 at 09:53:00AM +0000, Kieran Bingham wrote:
>Hi Faizel,
>
>Pullling in the libcamera-devel mailing list for relevant awareness too.
>
>Quoting faizel.kb@gmail.com (2026-01-15 19:10:49)
>> From: Faizel K B <faizel.kb@gmail.com>
>>
>> Implement set_frame_interval and get_frame_interval callbacks in
>> v4l2_subdev_pad_ops to enable frame rate configuration from 1-240 FPS.
>> The default frame rate is 60 FPS.
>>
>> The configured frame interval is pre-calculated into jiffies and
>> stored in the sensor's hw structure for efficient access by the
>> streamer thread.
>
>This is a really interesting and helpful bit of work - but I'm weary it
>might have taken one small mis-direction.
>
>VIMC aims to replicate the usage of camera sensors, and I don't think
>we're supposed to use frame interval interface for that.
>
>Instead following the camera sensor model, this should be implemented to
>mirror what the hardware in camera sensors actually does/needs which is
>to make the frame rate a function of the exposure time and blankings
>(both hblank and vblank).
>
>We have a bit of a write up about the calculation at the bottom of this
>page:
>
> - https://libcamera.org/camera-sensor-model.html
>
>Or perhaps the sensor requirements of libcamera might be what a virtual
>sensor should aim for:
>
> - https://libcamera.org/sensor_driver_requirements.html
>

Thanks for the review and links. It makes sense to implement the pixelrate, 
v/h blanking from a sensor point of view.The exposure value also
matters. Sensors even prioritize the exposure to the frame timings or the
other way. This parameters can be added inside using v4l2_ctrl_new_std(),
for pixel rate,blanking and exposure and calculate the sleep time for the
frame rate delay in the streamer thread. By this, a user need to do few
calculations to adjust the frame rate.


>There's probably more helpful documentation in the linux kernel too in
>the upcoming sensor model rework from Sakari.
>
>Aha - in fact I found this:
> - https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/camera-sensor.html#raw-camera-sensors
>
>"2.2. Frame interval configuration
>
>There are two different methods for obtaining possibilities for
>different frame intervals as well as configuring the frame interval.
>Which one to implement depends on the type of the device."
>
>So perhaps the question we need to clarify is "what type of device is
>vimc-sensor".
>
>I'm likely biased to presume it's a virtual raw camera sensor ... But is
>it ?

Would like to hear more about this.

>
>--
>Kieran
>
>
>> Signed-off-by: Faizel K B <faizel.kb@gmail.com>
>> ---
>>  drivers/media/test-drivers/vimc/vimc-common.h |  2 +
>>  drivers/media/test-drivers/vimc/vimc-sensor.c | 45 +++++++++++++++++++
>>  2 files changed, 47 insertions(+)
>>
>> diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
>> index 7f5f008e407b..a71ef761fa77 100644
>> --- a/drivers/media/test-drivers/vimc/vimc-common.h
>> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
>> @@ -173,6 +173,7 @@ struct vimc_sensor_device {
>>         struct tpg_data tpg;
>>         struct v4l2_ctrl_handler hdl;
>>         struct media_pad pad;
>> +       struct v4l2_fract frame_interval;
>>
>>         u8 *frame;
>>
>> @@ -184,6 +185,7 @@ struct vimc_sensor_device {
>>                 struct v4l2_area size;
>>                 enum vimc_sensor_osd_mode osd_value;
>>                 u64 start_stream_ts;
>> +               unsigned long fps_jiffies;
>>         } hw;
>>  };
>>
>> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
>> index 2b07dc1f1278..d54425ff28a1 100644
>> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
>> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
>> @@ -140,12 +140,53 @@ static int vimc_sensor_set_fmt(struct v4l2_subdev *sd,
>>
>>         return 0;
>>  }
>> +static int vimc_sensor_get_frame_interval(struct v4l2_subdev *sd,
>> +                                         struct v4l2_subdev_state *state,
>> +                                         struct v4l2_subdev_frame_interval *fi)
>> +{
>> +       struct vimc_sensor_device *vsensor = v4l2_get_subdevdata(sd);
>> +
>> +       fi->interval = vsensor->frame_interval;
>> +
>> +       return 0;
>> +}
>> +
>> +static int vimc_sensor_set_frame_interval(struct v4l2_subdev *sd,
>> +                                         struct v4l2_subdev_state *state,
>> +                                         struct v4l2_subdev_frame_interval *fi)
>> +{
>> +       struct vimc_sensor_device *vsensor = v4l2_get_subdevdata(sd);
>> +       u32 fps;
>> +
>> +       /* Sanitize to default if invalid */
>> +       if (unlikely(!fi->interval.numerator || !fi->interval.denominator)) {
>> +               fi->interval.numerator = 1;
>> +               fi->interval.denominator = 60;
>> +       } else {
>> +               /* Clamp FPS to 1-240 range */
>> +               fps = fi->interval.denominator / fi->interval.numerator;
>> +               fps = clamp(fps, 1U, 240U);
>> +
>> +               fi->interval.numerator = 1;
>> +               fi->interval.denominator = fps;
>> +       }
>> +
>> +       vsensor->frame_interval = fi->interval;
>> +
>> +       /* Update hardware timing configuration */
>> +       vsensor->hw.fps_jiffies = (HZ * vsensor->frame_interval.numerator) /
>> +                                 vsensor->frame_interval.denominator;
>> +
>> +       return 0;
>> +}
>>
>>  static const struct v4l2_subdev_pad_ops vimc_sensor_pad_ops = {
>>         .enum_mbus_code         = vimc_sensor_enum_mbus_code,
>>         .enum_frame_size        = vimc_sensor_enum_frame_size,
>>         .get_fmt                = v4l2_subdev_get_fmt,
>>         .set_fmt                = vimc_sensor_set_fmt,
>> +       .get_frame_interval     = vimc_sensor_get_frame_interval,
>> +       .set_frame_interval     = vimc_sensor_set_frame_interval,
>>  };
>>
>>  static void *vimc_sensor_process_frame(struct vimc_ent_device *ved,
>> @@ -400,6 +441,10 @@ static struct vimc_ent_device *vimc_sensor_add(struct vimc_device *vimc,
>>
>>         vsensor->ved.process_frame = vimc_sensor_process_frame;
>>         vsensor->ved.dev = vimc->mdev.dev;
>> +       /* Initialize to 60 FPS */
>> +       vsensor->frame_interval.numerator = 1;
>> +       vsensor->frame_interval.denominator = 60;
>> +       vsensor->hw.fps_jiffies = HZ / 60;
>>
>>         return &vsensor->ved;
>>
>> --
>> 2.43.0
>>

