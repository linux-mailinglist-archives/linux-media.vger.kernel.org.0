Return-Path: <linux-media+bounces-33557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C66AAC7200
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 22:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C5E83AE851
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 20:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB31F220F59;
	Wed, 28 May 2025 20:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ihn0ufMv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A488220F33
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 20:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462949; cv=none; b=WTrhTk4WFZHaiRtrPx29cnG1mmvR+TIw2Wc2D2ZiIqyMC4OYZgEXyEriT/B+48cb43YsbXuVVtG0QUZnKwb98vUp/N5xxMlPR4fcqmGpZafftgcFkG6YsfSuh5wMZZaOI37bMYgYQd1moCeKvQW18F/mY6XkICSIG3dEi1SKl10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462949; c=relaxed/simple;
	bh=FjbRIIYqU3FgUzznUIp5Xd2GHlCp5vAKaNuPcHmEDfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=l5krSIT4ZpLu6sB739MI/pqt/3871T/47RrLQEKvqvrdSfmAxx2lKe8AYz4LDG4u1Ojqf7TlV9WXfN3kaElFHgR9zT6jOmxf2YwPXYeomnJW5ucDaMoui8gKihYrAweTNP0BzJoJOl84sfmOSlKKKlirItgHLvH3Chs190x+rGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ihn0ufMv; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so138577e87.1
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 13:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748462945; x=1749067745; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wi/Lf3Ck9VIm96vM+qUMUqSfJUJUuf7qt2klRWchtT0=;
        b=ihn0ufMvAgeUFU3VKvSXa5jQJQ2sjVQKbY3ok17v/23Ur7Ol8n57ygAatMmyZHoE1P
         k/LM0bAaxEn43FCMkaRo8uCk9QMASTacWDmEiGLD19u9DKJikOoykEoQ4rjMXjtR8f8s
         OGpe4yuOShHvq/x92mqsCTdimC4OLoSQZA044=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462945; x=1749067745;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wi/Lf3Ck9VIm96vM+qUMUqSfJUJUuf7qt2klRWchtT0=;
        b=oFyNp6nKGtQGpYxhSrYM8GKWe47nQVeiZ5q48X1ogh6JsQD594BPSrzQQqQ2zJ62SN
         WBa/9L7k25LAb0HyK0noVzcSFXx55IjlPXwN99C0J/NzmkdDghMxNeHWC/lb/wVleGkT
         to6XAlYjC3q9UokulKNvB59aI3dxgqnqL7Pt4JNN4/NlbGk3lv+4Vdb8expNtDMlbT9Y
         MKM5/Bbo4iWb7zhujV4VdRUTlP/A68xFRsvOIzarIk5MI6pjkM+BItOWDR2Op8KV9EGv
         tOXLEZDhPukX6W+2F3lQuhV/V6Wgue5aDLZHPIrr7nE4joXBh3WFN6zNja5h8afQObVN
         LpEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVURadUosh/gVFAtuC8WmukPBzzx1lmoDxi/IZ4joTgSJ4HEJU0d/nX8vf1ferFO45W4zhW9+DlvSj9tA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU5ZIfE8Tn8hnsMKsJGberDnvXeKUa66m81CHt0PdIwnEEQ2TP
	JdB0TvjEwP1w9i/7vX/I1SSL1f7MIThcICIo6MdvBLeaS6nweygrpZEs9YfAwa45Xr0Ldn3pF9I
	Yz17mRSpv
X-Gm-Gg: ASbGnct9nhQBZPIYPNPJRBpD765CLcYvn1YaKrN2Gkz/xctKcTITBAu7/K/azEDPasR
	HpWIGeyIE48iUbk6aOT3tzHUfKbeKkvAJiGCuaOrdIm/rd1O3kX/s2YA7xtCFdZw9P1nTZcIUcA
	fRXsVHGxnjZlAfJwcrkoEKW26TaMY3hNnBlWmoeQyoeC/s/naRUkuAxxRysoODkycQwz74bgPAC
	cJehTF13MjbW6dmMtElgpQ35xiBVr+A920fLs86Bc3Vf6K9e6a8kzzL6LExP3uUKw1KLxVjjy4m
	QrqWOIPzBv9usxEpKYmlDarVcxu66rgUzAAFRp4nukHZAZ71VVUE9SHuP6gtHc6PZQrOPYjJEqc
	PAVyt0o7CcUDibWtHmN1x0Ei+Kw==
X-Google-Smtp-Source: AGHT+IEyNTFYVr7dG3VIJLzXpXDopn4CTgdeqZSIxmxvfGbySLf2VM05j/A/Fhm0T5Mz/YjujNPnOA==
X-Received: by 2002:a05:6512:b92:b0:550:e648:1822 with SMTP id 2adb3069b0e04-5532f8861camr1333170e87.43.1748462945136;
        Wed, 28 May 2025 13:09:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a635sm412545e87.86.2025.05.28.13.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:09:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 20:08:58 +0000
Subject: [PATCH] contrib/test/test-media: Wait for udev to settle after
 modprobe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-settle-v1-1-74d0da106869@chromium.org>
X-B4-Tracking: v=1; b=H4sIAFltN2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyML3eLUkpKcVF0Tc1Mjw+TUZMvEZBMloOKCotS0zAqwQdGxtbUAAgR
 Ht1gAAAA=
X-Change-ID: 20250528-settle-47521cec9ac4
To: Hans Verkuil <hans@jjverkuil.nl>, 
 linux-media <linux-media@vger.kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Once after the modules have loaded, udev can require some time to create
the symlinks required by v4l utils.

Take this oportunity to refactor all the modprobe duplicated code into a
function.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Fixes these kind of errors:

Cannot open device /dev/char/81:20, exiting.
FAIL: the vivid module failed to load
Grand Total for vivid: Succeeded: 0, Failed: 1, Warnings: 0
Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0
---
 contrib/test/test-media | 47 ++++++++++++++++-------------------------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/contrib/test/test-media b/contrib/test/test-media
index 15df3753bad7c29e4f5f04c838546f0910896fcb..ec8fa64a8510a2258b1a975b83a90d6b1e289189 100755
--- a/contrib/test/test-media
+++ b/contrib/test/test-media
@@ -25,6 +25,14 @@ v4l2_ctl=v4l2-ctl
 v4l2_compliance=v4l2-compliance
 compliance_args=
 
+run_modprobe () {
+	dmesg -n info
+	modprobe $@
+	sleep $modprobe_time
+	udevadm settle
+	dmesg -n notice
+}
+
 if [ -f /proc/config.gz ]; then
 	if cat /proc/config.gz | gunzip |grep -q CONFIG_DEBUG_KOBJECT_RELEASE=y ; then
 		kobj_rel=1
@@ -222,9 +230,7 @@ fi
 
 dmesg -n info
 rmmod vivid 2&>/dev/null
-modprobe vivid n_devs=3 multiplanar=1,2,2 cache_hints=1,0,0 #allocators=0,1,1
-sleep $modprobe_time
-dmesg -n notice
+run_modprobe vivid n_devs=3 multiplanar=1,2,2 cache_hints=1,0,0 #allocators=0,1,1
 
 tmp=`mktemp`
 
@@ -385,10 +391,7 @@ if [ $vivid -eq 1 -a $setup -eq 0 ]; then
 		echo
 	fi
 
-	dmesg -n info
-	modprobe vivid n_devs=3 multiplanar=1,2,2 cache_hints=1,0,0 #allocators=0,1,1
-	sleep $modprobe_time
-	dmesg -n notice
+	run_modprobe vivid n_devs=3 multiplanar=1,2,2 cache_hints=1,0,0 #allocators=0,1,1
 
 	$v4l2_ctl -z platform:vivid-002 -d vivid-002-vid-cap -i3 -v width=3840,height=2160,pixelformat=NV24
 	$v4l2_ctl -z platform:vivid-002 -d vivid-002-vid-out -o1 -x width=3840,height=2160,pixelformat=NM16
@@ -408,10 +411,7 @@ fi
 
 if [ $vim2m -eq 1 ]; then
 	rmmod vim2m 2&>/dev/null
-	dmesg -n info
-	modprobe vim2m
-	sleep $modprobe_time
-	dmesg -n notice
+	run_modprobe vim2m
 
 	if ! $v4l2_ctl -z platform:vim2m ; then
 		echo "FAIL: the vim2m module failed to load" | tee -a $tmp
@@ -522,10 +522,7 @@ fi
 
 if [ $vimc -eq 1 ]; then
 	rmmod vimc 2&>/dev/null
-	dmesg -n info
-	modprobe vimc
-	sleep $modprobe_time
-	dmesg -n notice
+	run_modprobe vimc
 
 	if ! $v4l2_ctl -z platform:vimc -d "Sensor A" ; then
 		echo "FAIL: the vimc module failed to load" | tee -a $tmp
@@ -627,10 +624,7 @@ if [ $vicodec -eq 1 ]; then
 	fi
 
 	rmmod vicodec 2&>/dev/null
-	dmesg -n info
-	modprobe vicodec
-	sleep $modprobe_time
-	dmesg -n notice
+	run_modprobe vicodec
 
 	if ! $v4l2_ctl -z platform:vicodec ; then
 		echo "FAIL: the vicodec module failed to load" | tee -a $tmp
@@ -810,10 +804,7 @@ fi
 if [ $visl -eq 1 ]; then
 	echo
 	echo loading visl module | tee /dev/kmsg
-	dmesg -n info
-	modprobe visl
-	sleep $modprobe_time
-	dmesg -n notice
+	run_modprobe visl
 
 	if ! $v4l2_ctl -z platform:visl ; then
 		echo "FAIL: the visl module failed to load" | tee -a $tmp
@@ -869,10 +860,7 @@ if [ $visl -eq 1 -a $setup -eq 0 ]; then
 		echo
 	fi
 
-	dmesg -n info
-	modprobe visl
-	sleep $modprobe_time
-	dmesg -n notice
+	run_modprobe visl
 
 	$v4l2_ctl -z platform:visl --all
 
@@ -892,10 +880,7 @@ fi
 
 if [ $vidtv -eq 1 ]; then
 	rmmod dvb_vidtv_bridge dvb_vidtv_tuner dvb_vidtv_demod 2&>/dev/null
-	dmesg -n info
-	modprobe vidtv
-	sleep $modprobe_time
-	dmesg -n notice
+	run_modprobe vidtv
 
 	if ! media-ctl -d platform:vidtv ; then
 		echo "FAIL: the vidtv module failed to load" | tee -a $tmp

---
base-commit: c4cb1d1bb6960679e1272493102c6dcf4cec76e7
change-id: 20250528-settle-47521cec9ac4

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


