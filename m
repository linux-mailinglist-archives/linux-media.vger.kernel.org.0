Return-Path: <linux-media+bounces-3817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD63F830907
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 16:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 107F11C219BB
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 15:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B652F219F8;
	Wed, 17 Jan 2024 15:02:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621DA20DC9
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503769; cv=none; b=qtnURCJRyQx5O73kmc61Z9UMHsyl+Lfx2REWl911lFBSwT3dFtawwakCi11HjcweOzwnR9+Oua0XCfWDXLZcRsY4MXnn/+k1EvYnPsQmj+Kd6K/u5LJxCl3ZcUQP5PIC7ZPGfcQpG1P2GKDF48wu4QEjHev1/7eDMhEx2/JFfW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503769; c=relaxed/simple;
	bh=nqPlvdt+mOJGlFPheRhyF+ziMl2H+4kpaUZ2LB9iSOU=;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding; b=OQUvG01H3cSkfPkxQTYFsGLDsImZTOyCxrTLlUfCzRaiCqHcVyIVEyxuOFkwgrzlHxFjbd2FHLDUapCEkCUvmgTCePzzPi1b4WwqahHtXDUbhFwFsvclfTo6ROe4mjCuGvikKnYTvo+BFu9f1wP8S886XQ0hQQB427r1BfhRoeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C65C43390;
	Wed, 17 Jan 2024 15:02:48 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 08/10] test-media: add vim2m-audio test
Date: Wed, 17 Jan 2024 16:02:16 +0100
Message-ID: <e68d88ad5d6e18314cf6ac6808e5f5d936eaf8b6.1705503477.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <79cf7f3c0fdde2ff151ba05d912ba05b35386d4a.1705503477.git.hverkuil-cisco@xs4all.nl>
References: <79cf7f3c0fdde2ff151ba05d912ba05b35386d4a.1705503477.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Run v4l2-compliance for the vim2m-audio driver.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 contrib/test/test-media | 88 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 2 deletions(-)

diff --git a/contrib/test/test-media b/contrib/test/test-media
index afe20760..1186f02f 100755
--- a/contrib/test/test-media
+++ b/contrib/test/test-media
@@ -7,6 +7,7 @@
 vidtv=0
 vivid=0
 vim2m=0
+vim2m_audio=0
 vimc=0
 vicodec=0
 cec=0
@@ -53,13 +54,14 @@ if [ -z "$1" ]; then
 	echo Test Targets:
 	echo "vivid: test the vivid driver"
 	echo "vim2m: test the vim2m driver"
+	echo "vim2m-audio: test the vim2m-audio driver"
 	echo "vimc: test the vimc driver"
 	echo "vicodec: test the vicodec driver"
 	echo "vidtv: test the vidtv driver"
 	echo "cec: adds the vivid CEC compliance tests, except for the CEC standby/wakeup tests."
 	echo "cec-pwr: adds the vivid CEC compliance tests, including the CEC standby/wakeup tests."
-	echo "all: equals 'vivid vim2m vimc vicodec vidtv cec cec-pwr'"
-	echo "mc: equals 'vivid vim2m vimc vicodec vidtv'"
+	echo "all: equals 'vivid vim2m vim2m-audio vimc vicodec vidtv cec cec-pwr'"
+	echo "mc: equals 'vivid vim2m vim2m-audio vimc vicodec vidtv'"
 	exit 0
 fi
 
@@ -116,6 +118,7 @@ while [ ! -z "$1" ]; do
 		vidtv=1
 		vivid=1
 		vim2m=1
+		vim2m_audio=1
 		vimc=1
 		vicodec=1
 		cec=1
@@ -124,6 +127,7 @@ while [ ! -z "$1" ]; do
 	mc)
 		vivid=1
 		vim2m=1
+		vim2m_audio=1
 		vimc=1
 		vicodec=1
 		vidtv=1
@@ -137,6 +141,9 @@ while [ ! -z "$1" ]; do
 	vim2m)
 		vim2m=1
 		;;
+	vim2m-audio)
+		vim2m_audio=1
+		;;
 	vimc)
 		vimc=1
 		;;
@@ -421,6 +428,83 @@ if [ $vim2m -eq 1 -a $setup -eq 0 ]; then
 	echo
 fi
 
+
+if [ $vim2m_audio -eq 1 ]; then
+	rmmod vim2m-audio 2&>/dev/null
+	modprobe vim2m-audio
+	sleep $modprobe_time
+	dmesg -n notice
+
+	if ! $v4l2_ctl -z platform:vim2m-audio ; then
+		echo "FAIL: the vim2m-audio module failed to load" | tee -a $tmp
+		echo "Grand Total for vim2m-audio: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
+		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
+		rmmod vivid
+		exit 0
+	fi
+fi
+
+if [ $vim2m_audio -eq 1 -a $setup -eq 0 ]; then
+	echo
+	echo vim2m-audio compliance tests | tee /dev/kmsg
+	echo
+	date
+	stdbuf -oL $v4l2_compliance -m platform:vim2m-audio -z platform:vivid-002 -e vivid-002-vid-cap -s10 -P -a 2>&1 | tee -a $tmp
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo unbind vim2m-audio | tee /dev/kmsg
+	echo
+	echo -n vim2m-audio.0 >/sys/bus/platform/drivers/vim2m-audio/unbind
+	sleep $unbind_time
+	echo
+	echo rebind vim2m-audio | tee /dev/kmsg
+	echo
+	echo -n vim2m-audio.0 >/sys/bus/platform/drivers/vim2m-audio/bind
+	sleep 1
+	echo
+	echo second unbind vim2m-audio | tee /dev/kmsg
+	echo
+	for i in `$v4l2_ctl -z platform:vim2m-audio --list-devices`; do
+		let "t = 1 + $RANDOM / 4096"
+		echo $i: sleep ${t}s
+		sleep $t <$i &
+	done
+	sleep 1
+	echo
+	echo -n vim2m-audio.0 >/sys/bus/platform/drivers/vim2m-audio/unbind
+	sleep $reunbind_time
+	echo
+	echo rmmod vim2m-audio | tee /dev/kmsg
+	echo
+	rmmod vim2m-audio
+	sleep $rmmod_time
+	if [ $kmemleak -eq 1 ]; then
+		echo
+		echo kmemleak results for vim2m-audio:
+		echo
+		echo scan >/sys/kernel/debug/kmemleak
+		cat /sys/kernel/debug/kmemleak
+		echo
+		echo end of kmemleak results
+		echo clear >/sys/kernel/debug/kmemleak
+	fi
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+fi
+
 if [ $vimc -eq 1 ]; then
 	rmmod vimc 2&>/dev/null
 	modprobe vimc
-- 
2.42.0


