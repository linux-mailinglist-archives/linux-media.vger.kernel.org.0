Return-Path: <linux-media+bounces-28645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D7A6E3D4
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 20:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E1B87A3222
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 19:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B771A23A6;
	Mon, 24 Mar 2025 19:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rbox.me header.i=@rbox.me header.b="VsRxPHQY"
X-Original-To: linux-media@vger.kernel.org
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7535B8634A
	for <linux-media@vger.kernel.org>; Mon, 24 Mar 2025 19:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742845902; cv=none; b=uiVTokSsS1OKcHMBnSZY6y1SNBDmFTiRzJoIKB2l303jN8fYPvS42Q17oO24JyfqQXtAxQUMMcLhVM6v40sUYbqm9416MSqPeyUHiVVlyytLgQLnsoOWvWiyST5xaTPkWxJyGZkDL5tEL7Bbv2vHYbGQZBzh2uc/bRCwNlYOk7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742845902; c=relaxed/simple;
	bh=upWv1HyTIIESUDMI/TRnp8AaXaKgEzG/L7IR+MCvW/I=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=YTRID1zdeabk4eunvenc3dFvq/65IS/41sSNi2rp/rTBaKByaMIqqV3rATnN0c7U6jlVc6NspMCyzC3b4pEN0eGDvOG5zsm0QbenwW3FPX0pJKgUh/R0lxg9DZTNewAufKpeYAzPuInGU/Rxiil9sfCuJdcc7vQMQwXMEdIgBRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.me; spf=pass smtp.mailfrom=rbox.me; dkim=pass (2048-bit key) header.d=rbox.me header.i=@rbox.me header.b=VsRxPHQY; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.me
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <bonjour81@rbox.me>)
	id 1twnpV-001qi7-FZ
	for linux-media@vger.kernel.org; Mon, 24 Mar 2025 20:51:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.me;
	s=selector1; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID; bh=mazFk5BJzqF+ggh5mAaWjobpJUNYVigeiix31ykkZ9U=
	; b=VsRxPHQYCrVJCBpNM5BA8iSsU6t8aBo9ibM4UZ0eUJC/Hcy20dQgle1vbIUxb8SF9VeRpEWfg
	KaKVYQTu3h7qZQQslz06+DRolSuahO7I0vAlfrXre3SvFC90mSkkLFvWpI7UYtzdiI7PZjliRrjZ2
	ufrS/hyJqSfLjzH/7E+RZotRn/fSLHa+ONOPNG6X0DQApwUogSPC9ceyQSmBznOIxylr91B9wEoMK
	2CapM4nzvKbjAR2hOPLNIGNRpy2ZflFKBfevXuK2rjoDh2UaINv1gq3gBa0oIEus1YlpUEpYUZ5Fz
	tniwbGXhjt49B/wxhTvSgiG+z6h19WQtX+8dNA==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <bonjour81@rbox.me>)
	id 1twnpV-0007Uy-65
	for linux-media@vger.kernel.org; Mon, 24 Mar 2025 20:51:25 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (906595)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1twnpT-003XvG-2d
	for linux-media@vger.kernel.org; Mon, 24 Mar 2025 20:51:23 +0100
Message-ID: <98cb7f10-87b1-43fd-a37e-60be70b5308b@rbox.me>
Date: Mon, 24 Mar 2025 20:51:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Content-Language: en-US
To: linux-media@vger.kernel.org
From: Frederic S <bonjour81@rbox.me>
Subject: [PATCH] media: i2c: Add Omnivision OV02C10 sensor driver
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I'm testing sending email here first time, I hope it will arrive to the 
right place.


I tested patch V10 on kernel 6.13.7-2-cachyos-gcc on Lenovo Thinkbook 
13x gen4.

Camera image show up but it is upside down (test with Cheese, Gnome 
Camera & Firefox).

Tested the following commands to check camera rotation (thank you Hans)

❯ ls -l /sys/class/video4linux/v4l-subdev*

/sys/class/video4linux/v4l-subdev6:
lrwxrwxrwx    - root 24 mars  19:19  device -> ../../../i2c-OVTI02C1:00
drwxr-xr-x    - root 24 mars  19:19  power
lrwxrwxrwx    - root 24 mars  19:19  subsystem -> 
../../../../../../../../class/video4linux
.r--r--r-- 4,1k root 24 mars  19:19  dev
.rw-r--r-- 4,1k root 24 mars  19:19  dev_debug
.r--r--r-- 4,1k root 24 mars  19:19  index
.r--r--r-- 4,1k root 24 mars  19:19  name
.rw-r--r-- 4,1k root 24 mars  19:19  uevent

=> I cut the details of subdev0 to 5  which are related to devices 
intel_ipu6.isys.40 instead of i2c-OVTI02C1:00.

❯ v4l2-ctl -d /dev/v4l-subdev6 -C camera_sensor_rotation
camera_sensor_rotation: 0


Best regards,
Frederic.


