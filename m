Return-Path: <linux-media+bounces-23845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F939F891C
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 01:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 559A116CDBE
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 00:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCEB4A05;
	Fri, 20 Dec 2024 00:47:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail2.tds.syn-alias.com (mail2.tds.syn-alias.com [129.159.94.43])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FEB25948D
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 00:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.159.94.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734655635; cv=none; b=ADFB9eWXVO+kHeBwbSGyRZKGyAJ0c/WY0Xx61akzEvCsmLhRzzaUAIYuUiP0HdRWV9f4M4tJAyyQrkyZv9gRwYICbietWm4Ihz3bPv4WNd7b33FYsPYtNnlpNdsD8Oftc2ypJPw/pw1afCqdMRwmLN1lIhUenXxZ/FSYpNG30V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734655635; c=relaxed/simple;
	bh=8xir1pqkRspxrHxbivMyZ7+tA11Fl7gK0bbU0jnfOlM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=SEk8wjMBfxTY0UIJUwtSR4wCExE02IleaKCsTncSfqRvbsySNCqRQlw/nU3qv9FdZvA2eagaFApDlGUgOFX+KxrR6YBtrJV13E8fNRKMaaW/SkkdmGxOWkHJkjLJT1Na7MhOsD5zlrqwM+/7IE7c0LfbuRjZLoYeWVQQCm/B8As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chorus.net; spf=pass smtp.mailfrom=chorus.net; arc=none smtp.client-ip=129.159.94.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chorus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chorus.net
X-Authed-Username: ZHVhbmVrQGNob3J1cy5uZXQ=
Received: from [10.219.153.27] ([10.219.153.27:52981] helo=md15.tds.email-ash1.sync.lan)
	by mail.tds.net (envelope-from <duanek@chorus.net>)
	(ecelerity 4.4.1.20033 r(msys-ecelerity:tags/4.4.1.0^0)) with ESMTP
	id 64/51-06351-A8EB4676; Thu, 19 Dec 2024 19:47:06 -0500
Date: Thu, 19 Dec 2024 19:47:06 -0500 (EST)
From: "duanek@chorus.net" <duanek@chorus.net>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, 
	linux-media <linux-media@vger.kernel.org>, 
	libcamera-devel <libcamera-devel@lists.libcamera.org>
Message-ID: <1405988041.103575290.1734655626318.JavaMail.zimbra@chorus.net>
In-Reply-To: <a1dde87b-8b1d-4d6c-bd78-ec4e5bd78c97@redhat.com>
References: <1594170563.10937137.1728935697496.JavaMail.zimbra@chorus.net> <361614030.100297606.1734530611240.JavaMail.zimbra@chorus.net> <vb66ls2rs5fnr2yj2b5wktccevmrcwq4gztlh4vtezc6hej4vm@dtduyfphcezx> <1385342589.100511352.1734536762106.JavaMail.zimbra@chorus.net> <45xboahdow6gy7uanhrdsiln3zxcu4xdy7hew3usqtgurf7byj@wl7gvzgtzg5s> <1626527939.100593578.1734539132976.JavaMail.zimbra@chorus.net> <a1dde87b-8b1d-4d6c-bd78-ec4e5bd78c97@redhat.com>
Subject: Re: IPU6 Camera with ov08x40 (OVTI08F4 sensor) HP Spectre 16"
 Meteor Lake doesn't work
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 9.0.0_GA_4653 (ZimbraWebClient - GC131 (Linux)/9.0.0_GA_4653)
Thread-Topic: IPU6 Camera with ov08x40 (OVTI08F4 sensor) HP Spectre 16" Meteor Lake doesn't work
Thread-Index: oXOpHLWqV6sTciM3rnZikKL3SEP93A==
X-Vade-Verdict: clean
X-Vade-Analysis-1: gggruggvucftvghtrhhoucdtuddrgeefuddruddtuddgvdehucetufdoteggodetrfdotffvucfrrhho
X-Vade-Analysis-2: fhhilhgvmecuufgjpfetvefqtfdpvfffufdpgffpggdqvfffufdpqfgfvfenuceurghilhhouhhtmecu
X-Vade-Analysis-3: fedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevkfgjfhfugggt
X-Vade-Analysis-4: gfhiofhtsehtjegttdiitdejnecuhfhrohhmpedfughurghnvghksegthhhorhhushdrnhgvthdfuceo
X-Vade-Analysis-5: ughurghnvghksegthhhorhhushdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdufffhkeehteeutdej
X-Vade-Analysis-6: teeuuedvlefhhfefffelvdelteevleelgfetiedttdetnecuffhomhgrihhnpehkvghrnhgvlhdrohhr
X-Vade-Analysis-7: ghdprhgvughhrghtrdgtohhmnecukfhppedutddrvdduledrudehfedrvdejpddvtdejrddvtddtrddv
X-Vade-Analysis-8: vdejrdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutddrvdduledr
X-Vade-Analysis-9: udehfedrvdejpdhhvghlohepmhguudehrdhtughsrdgvmhgrihhlqdgrshhhuddrshihnhgtrdhlrghn
X-Vade-Analysis-10: pdhmrghilhhfrhhomhepughurghnvghksegthhhorhhushdrnhgvthdprhgtphhtthhopehhuggvghho
X-Vade-Analysis-11: vgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghs
X-Vade-Analysis-12: ohhnsghorghrugdrtghomhdprhgtphhtthhopegsihhnghgsuhdrtggrohesihhnthgvlhdrtghomhdp
X-Vade-Analysis-13: rhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
X-Vade-Analysis-14: oheplhhisggtrghmvghrrgdquggvvhgvlheslhhishhtshdrlhhisggtrghmvghrrgdrohhrghdpmhht
X-Vade-Analysis-15: rghhohhsthepshhmthhptddurdhtughsrdgvmhgrihhlqdgrshhhuddrshihnhgtrdhlrghnpdhnsggp
X-Vade-Analysis-16: rhgtphhtthhopeehpdhishgpnhgrpehfrghlshgvpdgruhhthhgpuhhsvghrpeguuhgrnhgvkhestghh
X-Vade-Analysis-17: ohhruhhsrdhnvght
X-Vade-Client: TDS

Dear Hans,

I appreciate your determination, and uploaded a dmesg file with "intel_skl_int3472_discrete.dyndbg" passed as a kernel parameter (I hope I did it right) to RH Bugzilla

Sincerely,
Duane

----- On Dec 19, 2024, at 9:02 AM, Hans de Goede hdegoede@redhat.com wrote:

> Hi,
> 
> On 18-Dec-24 5:25 PM, duanek@chorus.net wrote:
>> Dear Jacopo,
>> 
>> Thanks for forwarding to libcamera - I'm a newbie and am not sure who all should
>> be involved.
>> 
>> When I specify the camera, I get:
>> duane@DuanesSpectre16:~/cameratest$ LIBCAMERA_LOG_LEVELS=0 qcam
>> -c"\_SB_.PC00.LNK0"
> 
> <snip>
> 
>> [2:42:26.110235367] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is
>> contiguous
>> [2:42:26.113343648] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is
>> contiguous
>> [2:42:26.116390199] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is
>> contiguous
>> [2:42:26.119374839] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is
>> contiguous
>> [2:42:26.125329380] [29471] DEBUG Request request.cpp:369 Created request -
>> cookie: 0
>> [2:42:26.125505377] [29471] DEBUG Request request.cpp:369 Created request -
>> cookie: 0
>> [2:42:26.125523467] [29471] DEBUG Request request.cpp:369 Created request -
>> cookie: 0
>> [2:42:26.125531018] [29471] DEBUG Request request.cpp:369 Created request -
>> cookie: 0
>> [2:42:26.125546767] [29471] DEBUG Camera camera.cpp:1360 Starting capture
>> [2:42:26.135295574] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1311
>> /dev/video0[28:cap]: 3 buffers requested.
>> [2:42:26.135380273] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is
>> contiguous
>> [2:42:26.135397476] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is
>> contiguous
>> [2:42:26.135407136] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is
>> contiguous
>> [2:42:26.135749405] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750
>> /dev/video0[28:cap]: Queueing buffer 0
>> [2:42:26.294678108] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750
>> /dev/video0[28:cap]: Queueing buffer 1
>> [2:42:26.294710299] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750
>> /dev/video0[28:cap]: Queueing buffer 2
> 
> Ok so we have set the mode on the camera, queued buffers, etc. and
> everything is looking great. Except that unfortunately the camera/sensor never
> starts streaming or at least no frames are received over CSI.
> 
> Which matches with the dmesg from a later email in this thread which has:
> 
> [  197.992581] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on Intel IPU6
> CSI2 0 failed with -5
> 
> As Bingbu mentioned this means that the s_stream pad operation from the ov08x40
> sensor driver has failed with -5, which means -EIO.
> 
> I strongly suspect that this is the same issue as the one which I have been
> debugging with another reporter with a "HP Spectre x360 14-eu0xxx" laptop
> with a OVTI08F4 sensor.
> 
> What is happening here is that we fail to properly power-on the sensor and
> probe() defers identifying the sensor till stream_on time, combined with
> a bug where stream_on actually is missing the call to identifty the sensor.
> 
> So instead of getting an error about not being able to identify the sensor
> instead we get the return value from the first failed ov08x40_write_reg()
> call, which returns -EIO instead of propagating the actual error which is
> -EREMOTEIO which indicates that the sensor is not responding to its i2c
> address which typically means that we have failed to power the sensor on.
> 
> I have posted a patch series which attempts to fix this here:
> https://lore.kernel.org/linux-media/20241219134940.15472-1-hdegoede@redhat.com/
> 
> But at least for the reporter with the HP Spectre x360 this does not
> fix things, but it does make it much clearer that the i2c communications
> with the sensor are failing with -EREMOTEIO.
> 
> One interesting aspect here is that the INT3472 sensor-power-supply-device
> on the HP Spectre x360 causes the following log messages:
> 
> [   11.594911] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor
> may not work
> 
> which you are seeing too. Another interesting data point is that
> this warning seen on your laptop:
> 
> [   11.595033] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin number
> mismatch _DSM 11 resource 107
> 
> Points to \_SB.GPI0 which suggests that the sensor is directly connected
> to GPIOs on the main SoC/CPU, and I expect "ls -l /sys/bus/i2c/devices" to
> also show that it is using an I2C bus from the main Intel CPU/SoC rather
> then using some IO-expander as we typically see on Dell and Lenovo designs.
> 
> Duane, I have been getting a lot of emails about IPU6 not working and
> I'm sort of loosing track of all of the issues which I'm handling.
> 
> So now I'm working on tracking all the issues in Fedora's bugzilla,
> I have filed a new issue to track this issue:
> https://bugzilla.redhat.com/show_bug.cgi?id=2333331
> 
> One thing which I'm wondering is if there maybe is a powerdown GPIO
> which is not handled even after my patches. Can you add:
> "intel_skl_int3472_discrete.dyndbg" to your kernel commandline,
> reboot and then collect a new dmesg output ?
> 
> If you are on Fedora then you can add this to your kernel
> commandline by running:
> 
> sudo grubby --update-kernel=ALL --args="intel_skl_int3472_discrete.dyndbg"
> 
> If possible please attach the new dmesg output to:
> https://bugzilla.redhat.com/show_bug.cgi?id=2333331
> 
> If you don't have a bugzilla account yet, all that is required
> to register is an email address, no other personal info is needed.
> 
> If you don't want to use bugzilla directly, would it be ok if
> I attach your dmesg output there?
> 
> Regards,
> 
> Hans

