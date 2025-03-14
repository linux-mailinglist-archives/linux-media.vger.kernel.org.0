Return-Path: <linux-media+bounces-28200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49431A60E1E
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 11:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F2BA3B2277
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 10:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136151F37BA;
	Fri, 14 Mar 2025 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redpill-linpro.com header.i=@redpill-linpro.com header.b="zVRx/2N7"
X-Original-To: linux-media@vger.kernel.org
Received: from frontend01-osl2.zimbra.h.bitbit.net (frontend01-osl2.zimbra.h.bitbit.net [87.238.49.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CA61F37DA
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 10:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.238.49.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741946487; cv=none; b=GkVHZc2uHKLCoMFrIqfdxwfJyKoMFsiWgMvUmuuZHg+AvIh+0B1yzD2u7UO9QXnPF7yqgncNI98y92teH8t63U2DxlTmtIUT/zVTvZGlSNC9jStxcy1R1zY1nWadlpVPF7K9g0W7J6zPDW02Jy1u9HUQ19cliPARYNeD0j+2OBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741946487; c=relaxed/simple;
	bh=4fs5KNskG6hJ0gKTBp6datOHofJWVCA4TfB/MrSJ6Dk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VgdK3bmzSwWataUzJ9hDJtOpxYKfSEFnasKq2TW4uRyrp3/xHhS0Sz9e4rAQo054KX0RFjZbhl1OpLwhaLlHFjMmB+CIPuo0ywpE02MddRcgA1yjpgz3G21YM19ORQMi8I22jt67FJdrJ5iO6LJN++3rAup8sERXGDAQanEeylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redpill-linpro.com; spf=pass smtp.mailfrom=redpill-linpro.com; dkim=pass (1024-bit key) header.d=redpill-linpro.com header.i=@redpill-linpro.com header.b=zVRx/2N7; arc=none smtp.client-ip=87.238.49.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redpill-linpro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redpill-linpro.com
Received: from localhost (localhost [IPv6:::1])
	by frontend01-osl2.zimbra.h.bitbit.net (Postfix) with ESMTP id C1382603C3;
	Fri, 14 Mar 2025 11:01:22 +0100 (CET)
Received: from frontend01-osl2.zimbra.h.bitbit.net ([IPv6:::1])
 by localhost (frontend01-osl2.zimbra.h.bitbit.net [IPv6:::1]) (amavis, port 10032)
 with ESMTP id GAgbKVdfo-Zk; Fri, 14 Mar 2025 11:01:22 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
	by frontend01-osl2.zimbra.h.bitbit.net (Postfix) with ESMTP id A14E0607DC;
	Fri, 14 Mar 2025 11:01:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 frontend01-osl2.zimbra.h.bitbit.net A14E0607DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redpill-linpro.com;
	s=612BF5B6-589A-11E6-A0CB-300C70828C2A; t=1741946482;
	bh=7QTNxBFoieZqUCOLGx0ZImRVPdMO0ru0UTZk1l7Hlz4=;
	h=Message-ID:From:To:Date:MIME-Version;
	b=zVRx/2N7g+1T6WrGiSs8BQWIAqOnHo37qS+rmA4m0RV0a+3TuxN1lj2XJFS7RSRPl
	 ngNU+AyKajMbhXqbxag1ajr7t7g9Q+1xjJ+SSHue/bplhjgt1yTW6LV54RB4yUC7zm
	 0T2bKFQ8gOf6xotN5aA/kXATj49ZxaAgXr5OUHys=
X-Virus-Scanned: amavis at frontend01-osl2.zimbra.h.bitbit.net
Received: from frontend01-osl2.zimbra.h.bitbit.net ([IPv6:::1])
 by localhost (frontend01-osl2.zimbra.h.bitbit.net [IPv6:::1]) (amavis, port 10026)
 with ESMTP id X5dO5R6i9ag0; Fri, 14 Mar 2025 11:01:22 +0100 (CET)
Received: from [IPv6:2a02:c0:2:7::5e] (vpn.i.bitbit.net [IPv6:2a02:c0:2:6:18:59ff:fe38:da0d])
	by frontend01-osl2.zimbra.h.bitbit.net (Postfix) with ESMTPSA id 6A1C5603C3;
	Fri, 14 Mar 2025 11:01:22 +0100 (CET)
Message-ID: <66e2d951ecb236007ffecf6f2218084173f8eb24.camel@redpill-linpro.com>
Subject: Re: [PATCH v8 00/14] media: i2c: Add Omnivision OV02C10 sensor
 driver
From: Ingvar Hagelund <ingvar@redpill-linpro.com>
To: Hans de Goede <hdegoede@redhat.com>, Sakari Ailus
	 <sakari.ailus@linux.intel.com>, Heimir Thor Sverrisson
	 <heimir.sverrisson@gmail.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Joachim Reichel	
 <joachim.reichel@posteo.de>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
  Hao Yao <hao.yao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
Date: Fri, 14 Mar 2025 11:01:22 +0100
In-Reply-To: <b9bfb5f8-9e69-4e61-ae7c-20bb4f2c8d2b@redhat.com>
References: <20250313184314.91410-1-hdegoede@redhat.com>
	 <455e819b9fe70ee5958d220b8eca6f9c23baa889.camel@redpill-linpro.com>
	 <b9bfb5f8-9e69-4e61-ae7c-20bb4f2c8d2b@redhat.com>
Organization: Redpill Linpro CloudOps AS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

fr., 14.03.2025 kl. 10.43 +0100, skrev Hans de Goede:
>=20
> One more testing request, can you run qcam and
> then see what it reports for FPS after letting it run for
> a couple of seconds ?
>=20
> And then report the FPS back here ?

Sure

It stabilizes at 30 fps (wandering a bit between 30.00 and 30.02 fps).

Also, here is the output of cam -l and modinfo.

I observe that cam says=C2=A0

Configuration file 'ov02c10.yaml' not found for IPA module 'simple',
falling back to 'uncalibrated.yaml'

Should this file exist, or will the driver downloaded from the settings
from the device, making the configuration file superflous?

Best regards,
Ingvar



$ cam -l=20
[2:16:02.661071222] [25536]  INFO Camera camera_manager.cpp:325
libcamera v0.3.2
[2:16:02.677709274] [25539]  WARN CameraSensor camera_sensor.cpp:257
'ov02c10 17-0036': Recommended V4L2 control 0x009a0922 not supported
[2:16:02.677733285] [25539] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov02c10
17-0036': Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for
device
[2:16:02.677742291] [25539]  WARN CameraSensor camera_sensor.cpp:304
'ov02c10 17-0036': The PixelArraySize property has been defaulted to
1928x1092
[2:16:02.677747409] [25539] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov02c10
17-0036': Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for
device
[2:16:02.677751299] [25539]  WARN CameraSensor camera_sensor.cpp:315
'ov02c10 17-0036': The PixelArrayActiveAreas property has been
defaulted to (0, 0)/1928x1092
[2:16:02.677757335] [25539] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov02c10
17-0036': Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for
device
[2:16:02.677760909] [25539]  WARN CameraSensor camera_sensor.cpp:323
'ov02c10 17-0036': Failed to retrieve the sensor crop rectangle
[2:16:02.677764402] [25539]  WARN CameraSensor camera_sensor.cpp:329
'ov02c10 17-0036': The sensor kernel driver needs to be fixed
[2:16:02.677767468] [25539]  WARN CameraSensor camera_sensor.cpp:331
'ov02c10 17-0036': See Documentation/sensor_driver_requirements.rst in
the libcamera sources for more information
[2:16:02.678099594] [25539]  WARN CameraSensorProperties
camera_sensor_properties.cpp:293 No static properties available for
'ov02c10'
[2:16:02.678112388] [25539]  WARN CameraSensorProperties
camera_sensor_properties.cpp:295 Please consider updating the camera
sensor properties database
[2:16:02.678116314] [25539]  WARN CameraSensor camera_sensor.cpp:477
'ov02c10 17-0036': Failed to retrieve the camera location
[2:16:02.678120108] [25539]  WARN CameraSensor camera_sensor.cpp:499
'ov02c10 17-0036': Rotation control not available, default to 0 degrees
[2:16:02.679507146] [25539]  WARN IPAProxy ipa_proxy.cpp:160
Configuration file 'ov02c10.yaml' not found for IPA module 'simple',
falling back to 'uncalibrated.yaml'
[2:16:02.679530599] [25539]  WARN IPASoft soft_simple.cpp:114 Failed to
create camera sensor helper for ov02c10

$ modinfo ov02c10
filename:       /lib/modules/6.13.6-
200.fc41.x86_64/kernel/drivers/media/i2c/ov02c10.ko.xz
license:        GPL
description:    OmniVision OV02C10 sensor driver
author:         Hao Yao <hao.yao@intel.com>
alias:          acpi*:OVTI02C1:*
depends:        videodev,v4l2-cci,v4l2-fwnode,mc,v4l2-async
name:           ov02c10
retpoline:      Y
vermagic:       6.13.6-200.fc41.x86_64 SMP preempt mod_unload=20




