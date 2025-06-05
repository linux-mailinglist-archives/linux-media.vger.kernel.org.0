Return-Path: <linux-media+bounces-34110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D030ACEE3C
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF80F1894175
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 11:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A0922541D;
	Thu,  5 Jun 2025 10:59:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6FE2E659
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 10:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749121169; cv=none; b=VBJAcVuw/xLFDD8ENPigEAWYGzzlAawbm0PUEICpYs5OfC8YjnM1Li3OPNs3Ll7qnzvcqx9XCKmITGsllFUg/OwATcDuyMHgrZcpz3GOv0keA8VPIq4Q8hufStIP7bjcP9XMw62jS6FlEKB8kS8AjU+YZpkxz69VjTERCyfUMEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749121169; c=relaxed/simple;
	bh=DrYFOKCLyejdi5Ds3f+Js3rOYPN5Pfm9pGAZiITRCq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CWPeSsMyuXCDw+v+OgPUzWUNnHUR3eEG142jHqWUikicHlbOsndMH9UUQn7wl1YupmPuZj9GOoBXFivEbbpsjfVh2j3jcIfJW6w3rKRfGjuZ27n74bBESsVOWW5MX/f9xVXgLApGn2rs8hKKSRMvT8Ly8ajnnXXYl9PqX64MfWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520D3C4CEEF;
	Thu,  5 Jun 2025 10:59:28 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 9/9] test-media: add initial vidtv streaming test
Date: Thu,  5 Jun 2025 12:58:32 +0200
Message-ID: <d6ea1172713c6edac8456b9d62caff09f8bcbb47.1749121112.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1749121112.git.hverkuil@xs4all.nl>
References: <cover.1749121112.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test to check that streaming I/O works for vidtv.

It would be nice if we could also compare the TS data, but this
contains timestamps, so it is always different each time you run
it. It would be nice if vidtv would have a module option to
enforce fixed timestamps.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 contrib/test/test-media | 50 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/contrib/test/test-media b/contrib/test/test-media
index 80315dba..a1d8a10c 100755
--- a/contrib/test/test-media
+++ b/contrib/test/test-media
@@ -21,6 +21,7 @@ reunbind_time=9
 rmmod_time=1
 modprobe_time=3
 kobj_rel=0
+dvb_mmap=0
 v4l2_ctl=v4l2-ctl
 v4l2_compliance=v4l2-compliance
 compliance_args=
@@ -37,6 +38,9 @@ if [ -f /proc/config.gz ]; then
 	if cat /proc/config.gz | gunzip |grep -q CONFIG_DEBUG_KOBJECT_RELEASE=y ; then
 		kobj_rel=1
 	fi
+	if cat /proc/config.gz | gunzip |grep -q CONFIG_DVB_MMAP=y ; then
+		dvb_mmap=1
+	fi
 elif [ -f .config ]; then
 	if grep -q CONFIG_DEBUG_KOBJECT_RELEASE=y .config ; then
 		kobj_rel=1
@@ -886,6 +890,14 @@ if [ $vidtv -eq 1 ]; then
 		rmmod dvb_vidtv_bridge dvb_vidtv_tuner dvb_vidtv_demod 2&>/dev/null
 		exit 0
 	fi
+
+	if [ $setup -eq 0 ]; then
+		tmpdir=`mktemp -d`
+	else
+		tmpdir=/tmp/vidtv-test
+		rm -rf $tmpdir
+		mkdir $tmpdir
+	fi
 fi
 
 if [ $vidtv -eq 1 -a $setup -eq 0 ]; then
@@ -895,6 +907,44 @@ if [ $vidtv -eq 1 -a $setup -eq 0 ]; then
 	date
 	stdbuf -oL $v4l2_compliance -m platform:vidtv 2>&1 | tee -a $tmp
 
+	echo
+	echo vidtv scan tests | tee /dev/kmsg
+	echo
+	date
+	cat >$tmpdir/vidtv-channel.conf <<EOF
+[Channel]
+FREQUENCY = 474000000
+MODULATION = QAM/AUTO
+SYMBOL_RATE = 6940000
+INNER_FEC = AUTO
+DELIVERY_SYSTEM = DVBC/ANNEX_A
+EOF
+
+	dvbv5-scan $tmpdir/vidtv-channel.conf -o $tmpdir/dvb_channel.conf
+	if [ $dvb_mmap -eq 1 ]; then
+		dvbv5-scan -R $tmpdir/vidtv-channel.conf -o $tmpdir/dvb_channel-vb2.conf
+		vidtv_ok=0
+		vidtv_fail=0
+		if cmp $tmpdir/dvb_channel.conf $tmpdir/dvb_channel-vb2.conf; then
+			echo "OK: dvbv5-scan results are identical for read and streaming" | tee -a $tmp
+			vidtv_ok=1
+		else
+			diff -u $tmpdir/dvb_channel.conf $tmpdir/dvb_channel-vb2.conf
+			echo "FAIL: dvbv5-scan results differ for read and streaming" | tee -a $tmp
+			vidtv_fail=1
+		fi
+		echo Total for vidtv dvbv5-scan cmp tests: 1, Succeeded: $vidtv_ok, Failed: $vidtv_fail, Warnings: 0 | tee -a $tmp
+	fi
+
+	echo
+	echo vidtv stream tests | tee /dev/kmsg
+	echo
+	date
+	dvbv5-zap -c $tmpdir/dvb_channel.conf "Beethoven" -o $tmpdir/music.ts -P -t 10
+	if [ $dvb_mmap -eq 1 ]; then
+		dvbv5-zap -R -c $tmpdir/dvb_channel.conf "Beethoven" -o $tmpdir/music-vb2.ts -P -t 10
+	fi
+	rm -rf $tmpdir
 	echo
 	echo
 	echo
-- 
2.47.2


