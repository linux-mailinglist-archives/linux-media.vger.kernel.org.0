Return-Path: <linux-media+bounces-39104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2828BB1E545
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 11:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AD0E18A5202
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 09:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4435E26560A;
	Fri,  8 Aug 2025 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="MuDphdtW"
X-Original-To: linux-media@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FE21E520B;
	Fri,  8 Aug 2025 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643855; cv=none; b=B/MRqeHbdRSTbkbG0dy/PkWWIV3q7T6Vkfuj360y/+F00VFTYVAEl4VX1RWOoiQDB6+MR2gvYd0EQAQzTi29FEpGmJlG8YaJrHZSXGbeN0kwTwFnYSMtvobtBkQS4BYGiXZ13OsaDum9Oq9bGHqS4nmaSDAYwMCcnlvSl47ceIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643855; c=relaxed/simple;
	bh=OlIksl5SFGP6QTM0UatUFx1fxMiq8ZYtAVWPwMxQmT0=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=YEj3TwveqAplvmy5Ae71PCWZYILVaLFPyYi9fxNaIl6+VteUYL0/aDVm7QL+Ozm9E2Cvko3VC8g+9bgNnHJC/rM2GYeUA4ltNpuJDLH5NFju92TjbQaEHyytWNx8jGKxQVnNPiHEfSKGs7I2aeuzYqHACFIUHkhZQGAM6uCUOB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=MuDphdtW; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <fstuyk@runbox.com>)
	id 1ukJ17-0030LP-O5; Fri, 08 Aug 2025 11:04:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Cc:To:From
	:References:Subject:MIME-Version:Date:Message-ID;
	bh=D33rBheWd7g9Uq24dAtWeQev1vkAFZs2tX0fpTdfjqU=; b=MuDphdtWN2FGCqmYSl/xdBgo9d
	kio8s5os+1Qq11n2+zPdfNfrGpRwbIIjWVJRmPKCMyAB36VezyyfI9qG1AOiK/+OEPmkGr3DpBtRM
	Pqu6MaeAbninmQNf1nBj3KuZZ64247HaoEpS1hrTrcSA1lLeAcn4M5LG/WPpBo+HsVLlSj/wRptR6
	b6Xc2JEv0StD58AxoV8MZ6rbr44ZAyQgbo6N5LndUr2I8kA8oyRISZdrjfwSin4Ktzd4kFzELlZnw
	uRJLpnlsyCDKwWXJ74xZ3PwTSnpiYh7+WujL9VE6rOe6xw+8tMKM0TBDWDb6LLCDYoCpwUAkupuxM
	6fCXhSmw==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <fstuyk@runbox.com>)
	id 1ukJ17-0006p7-5z; Fri, 08 Aug 2025 11:04:01 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated ID (906372)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1ukJ0q-006U3w-4d; Fri, 08 Aug 2025 11:03:44 +0200
Message-ID: <b6df9ae7-ea9f-4e5a-8065-5b130f534f37@runbox.com>
Date: Fri, 8 Aug 2025 11:03:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: [BUG] OV02C10: image upside down in kernel 6.16
Content-Language: en-US, fr
References: <7d38cf46-670e-462e-b7c2-78f9aaa9eb43@runbox.com>
From: Frederic Stuyk <fstuyk@runbox.com>
To: hansg@kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <7d38cf46-670e-462e-b7c2-78f9aaa9eb43@runbox.com>
X-Forwarded-Message-Id: <7d38cf46-670e-462e-b7c2-78f9aaa9eb43@runbox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I'm using the OV02C10 camera sensor on a system running Linux kernel 
6.16 (CachyOS, Arch-based).
I assume CachyOS customizations do not affect camera handling.

The sensor is detected and streams video correctly, but the image 
appears upside down by default.
Tested with GNOME Camera, qcam, and Firefox using an online webcam test 
page.

Querying the sensor orientation metadata shows:

     $ v4l2-ctl -d /dev/v4l-subdev6 -C camera_sensor_rotation
     camera_sensor_rotation: 0

This control is read-only and cannot be changed.

This suggests that either the driver incorrectly reports the orientation 
as 0, or that the platform is missing a quirk to reflect the actual 
physical mounting of the sensor.

I’d be happy to provide more details (e.g., logs, info...) if needed.

Here is some information about my system:

     Vendor:      LENOVO
     Product:     ThinkBook 13x G4 IMH (model: 21KR)
     BIOS:        MTCN51WW
     Kernel:      6.16.0-5-cachyos
     Arch:        x86_64

I’m reporting this to you as the driver maintainer. Please let me know 
if I should follow a different process — this is my first time reporting 
a kernel issue.

Note: Hans, we briefly exchanged emails on March 24th regarding early 
testing of this driver (as Kernel patch), and the same orientation issue 
was already visible at that time.

Best regards,
Frédéric

