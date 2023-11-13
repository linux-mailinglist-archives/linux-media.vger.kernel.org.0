Return-Path: <linux-media+bounces-208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A177E9A2A
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57A1D1C204FA
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 10:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760AC1CF82;
	Mon, 13 Nov 2023 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B2E1CA9F
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 10:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A338EC433CB;
	Mon, 13 Nov 2023 10:22:18 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 8/8] test-media: add vim2m-audio test
Date: Mon, 13 Nov 2023 11:18:49 +0100
Message-ID: <56cdfc8a975b2daef707011c42de00ffa893ae0b.1699870530.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <7889c22b922214ebcc0e62feeeb167b40d5042ec.1699870530.git.hverkuil-cisco@xs4all.nl>
References: <7889c22b922214ebcc0e62feeeb167b40d5042ec.1699870530.git.hverkuil-cisco@xs4all.nl>
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


