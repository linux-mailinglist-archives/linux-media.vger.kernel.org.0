Return-Path: <linux-media+bounces-33222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D46FAC18AE
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 01:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45B217AB991
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 23:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A112609D4;
	Thu, 22 May 2025 23:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TV/CEGmG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A562D193F
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 23:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747958152; cv=none; b=P1ZXUpA9ujAohGVJvMo+TVhDSpGXGtmkgluMiavI9IW+LUVT5svK1fqzPMbK0OejYJWv1OPhlk+a+nYU/s4ZBBLoX2rs/nOe/WG4u7bXlR7SgfNOxA9dYCNVWfGJK39gDUXB2mBtPKsJjrm+kPxuSRlDLYxCOwymY3O1rm44/+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747958152; c=relaxed/simple;
	bh=lRH4TkWpPZecDcG9us9RyQI1CTUHmPQNkxtfJ7nJgzo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=SqX2/NZcGNMxDUVU3Oi+Up2b3KybHdEY720DUrv79DU61ePvJSyoORd6wX6BOG97BeVhBTNfBPw7wFQg6xkHab4EhJoX56HNnPtH/3eEUHN2TE85ZN9xGAJPQYrv5CEKUClAeI/JF00AQHU02zGnOTAYfZd2Ejh4xkKQoo24Xss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TV/CEGmG; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad56e993ae9so1016331066b.3
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 16:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747958149; x=1748562949; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ORuxbjeCTFht9IkebiU0qus0391uS1y9K/sgIcwADc8=;
        b=TV/CEGmGvh2o4L1M5p7BC9rNpHD3LADvBf9ezTxX4Tt4BogM7EvbZ10yC/5b99tUgd
         yhukzwcS6UKPKk4ZePCoQ/JdCtY0eb9iMFV53NJqYxrUUYiJe6s+cv9mAeLIpZGz/0rG
         hNqReHWy2T5i1MOMbAfujjKWwcUd+uN2Mue6/63fM8Q0W76J/IgdYhiT6EyHCggx3JU2
         zphem/BDrnI4N8RBx/oby5LVcrKz35I6RUE3HH7t4jHYCellxopC4TMRMDz0fG/NSv3x
         TX/7jaW0QgP2YsCyVIx3IJRhpuSmcdFgC2OO6azzw+moJofw/w+6laCqn0XPK+ScZC3I
         t6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747958149; x=1748562949;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ORuxbjeCTFht9IkebiU0qus0391uS1y9K/sgIcwADc8=;
        b=MJopd4sH1adWcDYROZaWaNewET1w+u0m+7ucgdSYgRt8PnA/qEH+/0LmpMOROsOd/E
         3EOTcPfPiPIBX+OzU2eJoIthioQEUHP6BJ1LGUkMyMjx/5E12Nayek4zsLWg31oisbnZ
         WXqxkQt1Ixzh3iXehP5BOtgQwpe2PgUivi/xtAs11GXnu8rtAPe1ytLMcHY48QeEWS57
         b7uoBrKMcH/erYdeuuGxyYBFx02L2hGk/mVxruQy94LhsKWP0qyYCOAILHatLHrwm9qh
         FjAZDOD2M+Ew5GpXvCiH7t4hus86Z9GcMBZJCR9nNKWWm5xIzpiKkqwvNRBgBY14sDh6
         NW4w==
X-Gm-Message-State: AOJu0YwhtnhNMq5mYkd7BAIcGEqxG9wxl4/WxyFkiV9wjw1SNJzo7NEq
	ypgWnoW1QJzqwumULRxXCipSG5HO9LENnnDMIlvMFDhm42xx1IA7jtqfnGxJB6SZslbNoaYBNQg
	xvcg0CvgySy/P1Ui8GYaE14p5vYHbTlcfJWrO
X-Gm-Gg: ASbGnctYzkO20urEjTeofujsv24SOepUvw/sD4p12cb4Qq7jli4Bcp9FXdFb83S/1H0
	3b4U4UtU9hesMSwGt+jvwbEhiSAm8UcJiKYu6ycazQ05UyeSPSNQ/ujl06UdZIEuy3tDrGLTh5D
	7ErMlm4jy9j48fdnG4C/ApHt9FnH1d20gPBw==
X-Google-Smtp-Source: AGHT+IG5et70ajYz8VFpW4qk9fx9I0qALcorKi1YLcOfidJXg/rrnHUx8oD7Zw/NnBV4F5e9D67Bsjl4DV6wnWBOe9A=
X-Received: by 2002:a17:907:944a:b0:ad5:1fe4:4d0d with SMTP id
 a640c23a62f3a-ad536fb27fcmr2272382466b.61.1747958148989; Thu, 22 May 2025
 16:55:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jerry Quinn <quinnj@gmail.com>
Date: Thu, 22 May 2025 19:55:38 -0400
X-Gm-Features: AX0GCFvjLkLXGEbUSThfXTgXtiVEu7mucJBzNPJmHQMMNO7OmB5gefl8MZvGyjA
Message-ID: <CAOzCab90jOw9Euh84T301WOxh1R_TJse+AbNupYHR_1MF9vYLg@mail.gmail.com>
Subject: USB UVC webcam cannot capture
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi folks,
I have a USB Sonix Technology L01 HD webcam that fails to capture
video.  I get a protocol error when trying to capture frames with the
current mainline kernel.

I'm running the following to try to debug it:

jlquinn@cerberus:~$ v4l2-ctl --device /dev/video0 --stream-mmap
--stream-to=frame.raw --stream-count=1
VIDIOC_STREAMON returned -1 (Protocol error)

I've created a bugzilla report for this issue:
https://bugzilla.kernel.org/show_bug.cgi?id=220148

This is the kernel build I used:
https://kernel.ubuntu.com/mainline/v6.15-rc7/amd64/

jlquinn@cerberus:~/sw/src/cod/mainline/v6.15-rc7$ cat /proc/version
Linux version 6.15.0-061500rc7-generic (kernel@balboa)
(x86_64-linux-gnu-gcc-14 (Ubuntu 14.2.0-23ubuntu1) 14.2.0, GNU ld (GNU
Binutils for Ubuntu) 2.44) #202505182143 SMP PREEMPT_DYNAMIC Sun May
18 22:13:39 UTC 2025

jlquinn@cerberus:~/sw/src/cod/mainline/v6.15-rc7$ hostnamectl | grep
"Operating System"
Operating System: Ubuntu 24.04.2 LTS


My device is:
[ 2047.142578] usb 3-11.3: New USB device found, idVendor=26e0,
idProduct=6230, bcdDevice= 1.00
[ 2047.142594] usb 3-11.3: New USB device strings: Mfr=2, Product=1,
SerialNumber=3
[ 2047.142600] usb 3-11.3: Product: L01 HD Webcam
[ 2047.142604] usb 3-11.3: Manufacturer: Sonix Technology Co., Ltd.
[ 2047.142608] usb 3-11.3: SerialNumber: SN0001
[ 2047.144927] usb 3-11.3: Found UVC 1.00 device L01 HD Webcam   (26e0:6230)

dmesg, lsusb, and v4lc-compliance output and kernel config are
attached to the bug report.

Please let me know if I can provide anything else to help with looking
at this issue.

Thanks
Jerry Quinn

