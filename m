Return-Path: <linux-media+bounces-56496-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNPOAnQQvWlf6QIAu9opvQ
	(envelope-from <linux-media+bounces-56496-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:16:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8B72D7DB7
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C43C3039ED9
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE94349AF6;
	Fri, 20 Mar 2026 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITvYiRt5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21FA340281
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998165; cv=none; b=uK/g3CL+n4use2wM/GJ8Tiw2orlYFf62hM2OizDLEiX8PGvVntbnjOS0XGzDJHA0GCQtuTXQctiSob3cXt6iC+ghrw4Mzs2FgVnX3cOTibe788/mp1ZvI9r7KIQbygFxg0Zo+aCjp2nUUHS9ZNNgM+NwIfwGUVWrvbBEDAwsRXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998165; c=relaxed/simple;
	bh=1fHPK0LJdWO8WW4envSJVm4HfRZHsE4NEb5sMRqaNpE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=qLIjWnWt4z7prkkv58VAHA29GXklG1Ndo1s782kDv8Xalg4IMEm6F5RiAOaK4lwXH4dk5NPLLpf9PL1OUDagT+UNx4wpwzkRwP/mHn9S/sifFRiAa4JsNsQ/UjW/qFMDOZ/CFNS5eunPo/38QsmkJzRO2SIKYtQiVACEZxNg744=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITvYiRt5; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c739561f0d3so306414a12.3
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 02:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773998161; x=1774602961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tbOZx4yz8ileREr6jCN05BM9SGas0cEq/HP1eaWDecQ=;
        b=ITvYiRt5SRuXjiHOIhbEFGoF3xndmrs5IC5sBS6sZFNM1pUNGeZEULkkwIEFfsWrzw
         HaJEoV7akG8r1py24WrpWKVzXP9HwWjXwmEd1GqKdXvEsiz1gjnWbdkKPaVfibdnRWhQ
         vRDqxX9GQOtgiCI/Bv90HwdZGkwtKPKpnapV7k/Us8YoyeWImsvhVIO8x6ZReXy8EZk0
         EycJtgEBdR1balspwd6ubRDyO5itXC0UYOZGY0sBWdWjLm0wZXarjAuDfnjS1BRO8zET
         4d7GxBxA89Vl8wxipI/CrSnzlRanGClRa0TmFTWMUrcbPzCmQxUx8XdbGVtzqvXCK4F2
         mUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773998161; x=1774602961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbOZx4yz8ileREr6jCN05BM9SGas0cEq/HP1eaWDecQ=;
        b=aWgZpllMkTmP+5speLeXarLslRiLheLYgi5CdIyFudRoHAvdgmRT3oVYMIlLKlYC4q
         AgubullFOgSuo9DLMg2siEFpPffl/Eg3kNhbZU72Qzl1ocQnPkkWfN8IaLCpxmQJ30gb
         Rac5mPpFnzQLukqQL0I/4Wm58WZ7F6kQeSiTB+iVSv41qwdoghOfzjhXpxKXT7AOsQIR
         Oi0390rpjNQS+cBMw3djIHih9KUO3CdyaTVfzwnpBW/Bj8ruSNuL3mzRRafxd+PuRE82
         lYm58ksAfmCA8nuJZrGZRkSw8W0NGengjx6M7sCVmmJAqZv8cakKgwc21w1FT4DUuqSn
         XdJg==
X-Forwarded-Encrypted: i=1; AJvYcCWY0PjZILk4anFlHWX6yfPar+IUTZhbyYz+fYyuK2yCibvZywrGyiBuTveocSZf8DmZTpHls+yFZkDCXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ldgyL4DVDk21K2ep0Dp+eGDzGp6Qx4DZ6i7Igk/kiXFlwz86
	FM8aavmWPWbWkWFrR7pui4U7Mkkl05ydyXYj8NCuhyibM/cCpG8V7taxPfCUc5cO
X-Gm-Gg: ATEYQzzmClBtcUnQX1c2VFd3KCffi45WXMh08QMFtPfCcBWosYaiPaca95Jm98Q/SJf
	FnF64NJ48gJtofWFCorr7Xz25yVh62nucPcz9Mk2hqwgiPGf+SdCywQSLbJHbHiW4SfjDcJGNi2
	S0J98F8clI1pEN0p3ovvnkfZ58wsU3XELxPlUGP3dLEpcu7Bei+D442XqAz94tt0bhHg5+tx0WL
	jDGrrzwrGG2QU7fX/3HhkynguBfdPMZWWPOc9+RJaut7kUiyoSovAddOuMiVidP9BJrwOtGJEVy
	r+ijpPAgLoZtVCva5Ws31/cu3ENlL8DGp5Zc9WpdqpmJzog94Aw55B/ygCLq2IZVWYR+6k8Idk2
	8XsQVHci2G2BviGEq4zL6N+el8/XGlG2n0dByRQRhveuuyufyanLJg59cXCFEimQJ8HvWK5daw6
	31lm3TycJC51cQ3+deFS1L+mUG0tvLJC4Dzb0R8w==
X-Received: by 2002:a05:6a20:a10c:b0:398:8db5:40fe with SMTP id adf61e73a8af0-39bce9dd376mr2195543637.7.1773998161064;
        Fri, 20 Mar 2026 02:16:01 -0700 (PDT)
Received: from LIB-LAP-0152.lan ([2409:40f2:11af:af99:bef7:9003:423f:a6ad])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a814548sm1357077a12.9.2026.03.20.02.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 02:16:00 -0700 (PDT)
From: "Chethan.C" <mail.chethanc@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chethan C <mail.chethan.c@gmail.com>,
	"Chethan.C" <mail.chethanc@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Renaming camel case enum values
Date: Fri, 20 Mar 2026 14:45:25 +0530
Message-Id: <20260320091529.496641-1-mail.chethanc@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56496-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mailchethanc@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.878];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6B8B72D7DB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Renamed enum av7110_rec_play_state from camel case to upper case
underscore style.

Fixes checkpatch warning

Signed-off-by: Chethan C <mail.chethan.c@gmail.com>
---
 drivers/staging/media/av7110/av7110_av.c | 46 ++++++++++++------------
 drivers/staging/media/av7110/av7110_hw.h | 16 ++++-----
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 2993ac43c49c..376a53e182fa 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -111,7 +111,7 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 
 	if (av7110->playing || (av7110->rec_mode & av))
 		return -EBUSY;
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 	dvbdmx->recording = 1;
 	av7110->rec_mode |= av;
 
@@ -121,7 +121,7 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[0]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[0]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_RECORD, 2, AudioPES, 0);
 		break;
 
 	case RP_VIDEO:
@@ -129,7 +129,7 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[1]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_RECORD, 2, VideoPES, 0);
 		break;
 
 	case RP_AV:
@@ -141,7 +141,7 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[1]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_RECORD, 2, AV_PES, 0);
 		break;
 	}
 	return ret;
@@ -158,7 +158,7 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
 	if (av7110->playing & av)
 		return -EBUSY;
 
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 
 	if (av7110->playing == RP_NONE) {
 		av7110_ipack_reset(&av7110->ipack[0]);
@@ -168,15 +168,15 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
 	av7110->playing |= av;
 	switch (av7110->playing) {
 	case RP_AUDIO:
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AudioPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_PLAY, 2, AudioPES, 0);
 		break;
 	case RP_VIDEO:
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_PLAY, 2, VideoPES, 0);
 		av7110->sinfo = 0;
 		break;
 	case RP_AV:
 		av7110->sinfo = 0;
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_PLAY, 2, AV_PES, 0);
 		break;
 	}
 	return ret;
@@ -190,15 +190,15 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 
 	if (!(av7110->playing & av) && !(av7110->rec_mode & av))
 		return 0;
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 	if (av7110->playing) {
 		av7110->playing &= ~av;
 		switch (av7110->playing) {
 		case RP_AUDIO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AudioPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_PLAY, 2, AudioPES, 0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_PLAY, 2, VideoPES, 0);
 			break;
 		case RP_NONE:
 			ret = av7110_set_vidmode(av7110, av7110->vidmode);
@@ -208,10 +208,10 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 		av7110->rec_mode &= ~av;
 		switch (av7110->rec_mode) {
 		case RP_AUDIO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_RECORD, 2, AudioPES, 0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_RECORD, 2, VideoPES, 0);
 			break;
 		case RP_NONE:
 			break;
@@ -551,7 +551,7 @@ static ssize_t dvb_aplay(struct av7110 *av7110, const char __user *buf,
 			if (nonblock)
 				return count - todo;
 			if (wait_event_interruptible(av7110->aout.queue,
-						     (dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))
+					(dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))
 				return count - todo;
 		}
 		n = todo;
@@ -1168,7 +1168,7 @@ static int dvb_video_ioctl(struct file *file,
 		}
 		if (av7110->videostate.stream_source == VIDEO_SOURCE_MEMORY) {
 			if (av7110->playing == RP_AV) {
-				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 				if (ret)
 					break;
 				av7110->playing &= ~RP_VIDEO;
@@ -1184,7 +1184,7 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_FREEZE:
 		av7110->videostate.play_state = VIDEO_FREEZED;
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Pause, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_PAUSE, 0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FREEZE, 1);
 		if (!ret)
@@ -1193,7 +1193,7 @@ static int dvb_video_ioctl(struct file *file,
 
 	case VIDEO_CONTINUE:
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Continue, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_CONTINUE, 0);
 		if (!ret)
 			ret = vidcom(av7110, AV_VIDEO_CMD_PLAY, 0);
 		if (!ret) {
@@ -1291,7 +1291,7 @@ static int dvb_video_ioctl(struct file *file,
 		//note: arg is ignored by firmware
 		if (av7110->playing & RP_VIDEO)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Scan_I, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_SCAN_I, 2, AV_PES, 0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FFWD, arg);
 		if (!ret) {
@@ -1303,7 +1303,7 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_SLOWMOTION:
 		if (av7110->playing & RP_VIDEO) {
 			if (av7110->trickmode != TRICK_SLOW)
-				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Slow, 2, 0, 0);
+				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_SLOW, 2, 0, 0);
 			if (!ret)
 				ret = vidcom(av7110, AV_VIDEO_CMD_SLOW, arg);
 		} else {
@@ -1329,15 +1329,15 @@ static int dvb_video_ioctl(struct file *file,
 		av7110_ipack_reset(&av7110->ipack[1]);
 		if (av7110->playing == RP_AV) {
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Play, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_PLAY, 2, AV_PES, 0);
 			if (ret)
 				break;
 			if (av7110->trickmode == TRICK_FAST)
 				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-						    __Scan_I, 2, AV_PES, 0);
+						    AV7110_REC_PLAY_SCAN_I, 2, AV_PES, 0);
 			if (av7110->trickmode == TRICK_SLOW) {
 				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-						    __Slow, 2, 0, 0);
+						    AV7110_REC_PLAY_SLOW, 2, 0, 0);
 				if (!ret)
 					ret = vidcom(av7110, AV_VIDEO_CMD_SLOW, arg);
 			}
@@ -1483,7 +1483,7 @@ static int dvb_audio_ioctl(struct file *file,
 		av7110_ipack_reset(&av7110->ipack[0]);
 		if (av7110->playing == RP_AV)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Play, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_PLAY, 2, AV_PES, 0);
 		break;
 
 	case AUDIO_SET_ID:
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/media/av7110/av7110_hw.h
index d4579f411c56..1aab39bdb23c 100644
--- a/drivers/staging/media/av7110/av7110_hw.h
+++ b/drivers/staging/media/av7110/av7110_hw.h
@@ -168,14 +168,14 @@ enum av7110_encoder_command {
 };
 
 enum av7110_rec_play_state {
-	__Record,
-	__Stop,
-	__Play,
-	__Pause,
-	__Slow,
-	__FF_IP,
-	__Scan_I,
-	__Continue
+	AV7110_REC_PLAY_RECORD,
+    	AV7110_REC_PLAY_STOP,
+    	AV7110_REC_PLAY_PLAY,
+    	AV7110_REC_PLAY_PAUSE,
+    	AV7110_REC_PLAY_SLOW,
+    	AV7110_REC_PLAY_FF_IP,
+    	AV7110_REC_PLAY_SCAN_I,
+    	AV7110_REC_PLAY_CONTINUE
 };
 
 enum av7110_fw_cmd_misc {
-- 
2.25.1


