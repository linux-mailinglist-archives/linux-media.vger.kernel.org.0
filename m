Return-Path: <linux-media+bounces-51463-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NE52KXQfdWlHBAEAu9opvQ
	(envelope-from <linux-media+bounces-51463-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 20:37:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07B7EBC9
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 20:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 583FB300EF8D
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 19:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A0926D4DF;
	Sat, 24 Jan 2026 19:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcvpgCno"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE16A21D3D2
	for <linux-media@vger.kernel.org>; Sat, 24 Jan 2026 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769283437; cv=none; b=oZOqmSQhmZxprrJXVP0sUUfNj/Nkvy5UQh3+jczd+uLfsLMolQSkncOUyVJYrOhpAAtfh8Map54UEocAo76xnv/vqibUQoKzxqbwW4W9vscGDKgrrGLyjkHMM+meNxk+iu8AML0Wid+rK9+YH8ojbCCMDtYAWugdmngHfShLifE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769283437; c=relaxed/simple;
	bh=PIHVlr0ExMRTdUHzlhxtxW48qafDUlqdVWacP7ORtjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1cy80Nn/1e5vTgroxJa00fjLnyuxhD7hM2XqG3Z6eL/T1LRgz/HdE0rBzBAZi+STPJ8ofeUzwYUbD2GMm6FYMihGr8g9GyGTlGm8jHi3ZkFrY5da/4ZOnKTiVlljx2DspMA61F0dHb0QG65kSJ6DNFHuGCxFjpRIczXDTtHAhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcvpgCno; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81e931923b5so498285b3a.1
        for <linux-media@vger.kernel.org>; Sat, 24 Jan 2026 11:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769283435; x=1769888235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HAS0cPw8fXjZAbIoG1ucL4LgU1rDDylqMMqGTyMgdOE=;
        b=hcvpgCnoGZvx/tgVvmuTVupLshYLxvzjxeDQxIJLd+dWE2OcNo6kV7NAMqQ6Lh/m9U
         6OISGKE63xkFkd6tph+DexQolYzmxcm9L3lQHENLJEo5Gp4E+SP0yLOOLnVtIeMRbu2B
         2C8qwHhurKoLaw+vvYHX33T7pMTIC8Ipfz09dfXgrBiEcfVcOMPaILnMHfiZGmVSrgvN
         P78fCfu/qSK2DTJsU+cncDyPyDcF+4hWjyQ8W6IC7Lav52g0/E16iiomUixHvdkVXsrC
         Dg7myKdEmfOqB8dzKr9pbXjnARiC9/H6919VcF0Ssgut3pFlg2Z/TucX6FtIwyNHOLxT
         DRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769283435; x=1769888235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAS0cPw8fXjZAbIoG1ucL4LgU1rDDylqMMqGTyMgdOE=;
        b=R5EAvq+MgfMC3amB/CFVn5FaDd5D+LvLKuHT6tYjNp9OIE1/FTO9scnm8gxeYp6rrd
         qswUEsWg8WlCux8dlboDc/XuTTl1PI9w4fH6zWbqogmVFYYZmMioC5ZI/lDDrVnhPkDJ
         fdyp6a9LrM+LXnUROE8MQgGxy/PTlSeUl3Bc8kaFVsAJ3HqGpGuwJVfFNcabPHQzstQO
         fZcNjKFK1c6G80nXSP4xPj4F0kYqGmNb/ZWq+CsdWlGBshZ2BjDZBfICxQaAQ+wZ54zv
         dUvjPaHlkrMWSWiNzddWZ2/dft4/rO7kKEi9IiRJE24DaAzxMJo6hoG//I/IpG77HN8x
         aovw==
X-Forwarded-Encrypted: i=1; AJvYcCXyYz/izReThvcm0JhfpxhLI2u7MW1+O71n4Wu4j4UDyxYX+D/V0Ct6LpmUkDzTfRU3SO1+4yYdeb/jAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrhN/ljnk0KNpW0r6NbAJzs8JZRC9hhFCmrvkMFyyFTgz1/tlm
	W1Xg7U10CU6iPqswS6EuwRYJgRJkL0aitWqxZOy5dKW7UPHWvIJCqapT
X-Gm-Gg: AZuq6aID03IKz2Pno5/3+zaOxY4/bdEmvoFisZ0AdJksRVjD3dZRIU6N2DY9ShwB0lt
	oqgR58fRqZY0NPeXL1PT7ke7/1kR8c+fpgyWSMluwd3/hSuHPOdd2CJvrGcpyxnVPvtpu5HUkFs
	XSm7kCJMOOErZdwKK2hwza1j6V4vUtvzW4C4bXGBmA7Mz0PdT6Wv8KRuDkP+OSV5z61ke+2G72N
	FqRXeAee/c51OMM9FNJAC39KOeMU9uvLDxqKMgJLV1DrONMk6VPZJPRf1qKWL9Lz+UmlTKVS9yd
	oCwE2UnBrkbR4JqEz6CHy1JRkoc+Tmr6nj35O+I4S4F65NPyhkOvz8DrcgF/h/GKnxlz3JBSSQ7
	mwRCyp0MOen3I/4/p2g/cd8ZSYXrW9HUw9wsKxXyjbXabI0uBceVdIkUHHUdJdk3d0Sm1jOQZ2i
	cpNCUD32/elLTQA6MksVQjw4x/XEIwNG6yPqJuCgKHog==
X-Received: by 2002:a05:6a00:c8a:b0:821:84c3:845b with SMTP id d2e1a72fcca58-8232ad4db99mr2141966b3a.7.1769283435141;
        Sat, 24 Jan 2026 11:37:15 -0800 (PST)
Received: from FAIZEL-KB ([2001:569:5999:dc00:1a03:eb4d:cd5c:c2e3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318671e1csm5392073b3a.27.2026.01.24.11.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 11:37:13 -0800 (PST)
Date: Sat, 24 Jan 2026 11:37:12 -0800
From: Faizel K B <faizel.kb@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 2/3] media: vimc: sensor: Add frame rate configuration
 support
Message-ID: <cr4tjjlq53ezux7lzrusy4wb7ji26trwkipfkjl33kwv6z4ut7@r6hvuzki66bj>
References: <20260115191050.1370387-1-faizel.kb@gmail.com>
 <20260115191050.1370387-3-faizel.kb@gmail.com>
 <176855718062.1693075.8294828651917203116@ping.linuxembedded.co.uk>
 <cr7vrmkqxuriwici63khv4rv4fyeyp4aacejqe5mqfwuwbd2bs@xrjarfm6g4fv>
 <20260117044413.GB445@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260117044413.GB445@pendragon.ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51463-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[faizelkb@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,libcamera.org:url]
X-Rspamd-Queue-Id: BF07B7EBC9
X-Rspamd-Action: no action

On Sat, Jan 17, 2026 at 06:44:13AM +0200, Laurent Pinchart wrote:
>On Fri, Jan 16, 2026 at 12:35:47PM -0800, Faizel K B wrote:
>> On Fri, Jan 16, 2026 at 09:53:00AM +0000, Kieran Bingham wrote:
>> > Hi Faizel,
>> >
>> > Pullling in the libcamera-devel mailing list for relevant awareness too.
>> >
>> > Quoting faizel.kb@gmail.com (2026-01-15 19:10:49)
>> >> From: Faizel K B <faizel.kb@gmail.com>
>> >>
>> >> Implement set_frame_interval and get_frame_interval callbacks in
>> >> v4l2_subdev_pad_ops to enable frame rate configuration from 1-240 FPS.
>> >> The default frame rate is 60 FPS.
>> >>
>> >> The configured frame interval is pre-calculated into jiffies and
>> >> stored in the sensor's hw structure for efficient access by the
>> >> streamer thread.
>> >
>> > This is a really interesting and helpful bit of work - but I'm weary it
>> > might have taken one small mis-direction.
>> >
>> > VIMC aims to replicate the usage of camera sensors, and I don't think
>> > we're supposed to use frame interval interface for that.
>> >
>> > Instead following the camera sensor model, this should be implemented to
>> > mirror what the hardware in camera sensors actually does/needs which is
>> > to make the frame rate a function of the exposure time and blankings
>> > (both hblank and vblank).
>> >
>> > We have a bit of a write up about the calculation at the bottom of this
>> > page:
>> >
>> > - https://libcamera.org/camera-sensor-model.html
>> >
>> > Or perhaps the sensor requirements of libcamera might be what a virtual
>> > sensor should aim for:
>> >
>> > - https://libcamera.org/sensor_driver_requirements.html
>>
>> Thanks for the review and links. It makes sense to implement the pixelrate,
>> v/h blanking from a sensor point of view.The exposure value also
>> matters. Sensors even prioritize the exposure to the frame timings or the
>> other way. This parameters can be added inside using v4l2_ctrl_new_std(),
>> for pixel rate,blanking and exposure and calculate the sleep time for the
>> frame rate delay in the streamer thread. By this, a user need to do few
>> calculations to adjust the frame rate.
>>
>> > There's probably more helpful documentation in the linux kernel too in
>> > the upcoming sensor model rework from Sakari.
>> >
>> > Aha - in fact I found this:
>> > - https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/camera-sensor.html#raw-camera-sensors
>> >
>> > "2.2. Frame interval configuration
>> >
>> > There are two different methods for obtaining possibilities for
>> > different frame intervals as well as configuring the frame interval.
>> > Which one to implement depends on the type of the device."
>> >
>> > So perhaps the question we need to clarify is "what type of device is
>> > vimc-sensor".
>> >
>> > I'm likely biased to presume it's a virtual raw camera sensor ... But is
>> > it ?
>>
>> Would like to hear more about this.
>
>Given that the vimc driver exposes raw bayer formats, and that the
>sensor is connected to an entity called debayer, it's safe to say it
>should be considered as a raw sensor. This is how libcamera uses vimc,
>and I think it's the most important use case for the driver.
>
>This being said, the media graph exposed by the vimc driver doesn't map
>exactly to how a raw sensor connected to an inline ISP would look like.
>It would be nice to improve this at some point.
>

Ok. Thanks. I will send a new patch with frame rate controlled from 

V4L2_CID_PIXEL_RATE
V4L2_CID_HBLANK 

instead of frame interval.Both the above as read only as to closely
match the hardware

V4L2_CID_VBLANK - As read/write, to control the actual frame rate

fps = pixel_rate / ((width+hblank) * (height+vblank)) 


