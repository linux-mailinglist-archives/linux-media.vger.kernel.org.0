Return-Path: <linux-media+bounces-56363-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJXaG4FCvGlBwAIAu9opvQ
	(envelope-from <linux-media+bounces-56363-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:37:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC912D1234
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 657E530BC143
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 18:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4823A313E15;
	Thu, 19 Mar 2026 18:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsRFxX7W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FFD2D595B
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 18:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773945421; cv=none; b=RPG9MdpB5gGyJAGb9WEGm9fKxYd4wdv6RMXDOKFDwNvLTralN4OXY6H0jpTnlKNC9Bk2OttegSuAg1OzWzSL/csG0o/PusJw68h8sog1tlSx3hOx9dwH1p5aSxRBr0u4UdPv5WJ8jcxHJrQ50qfvwTYlAfHPFMYUMql7HnjJETM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773945421; c=relaxed/simple;
	bh=rpPEks5QNJCMSrpzg2CvB8cyF0f9J2/soVDQmCBekTI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=LpJ+NZ2E22kmHU8itXaKjRgZZlhB5UOgK9fsyYWoS2WnAEAjCibGs05KTw84wdfJ4AeYD5g8iLlSh1uUb2TTUG/jsjGRxOIhksVYPJG1NjvjUm7jx4/bTtjYj+Yf6mTbUH8f4fV481723Vfe26mg6h8YI9Q9mKpmu3yaxRuIrnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsRFxX7W; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-359f35dfef6so755752a91.2
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 11:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945419; x=1774550219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vv/MHTOj4w76L3rSBf/0rJ89xOX3RsgrHsuj+og3r/Y=;
        b=WsRFxX7WpGKh0ISzXY0kvQmDkAV/Ap/riZwBtzw0UOhTEGGkZXFV91fvJI/RJZKQj3
         X3i6W0mloOknE0B/fJx2gL9pu4yKbHBXlpk+0V648BpBEpvWd5Fl2Qjd6ksxEAYBagu1
         ejgBf81vc/XXfyrObqFXyiCYC95C5gdSVP2FkIbXSk0+5DZHasbjMKLYZSnMvLMK7kek
         2gI00zALeqSZz388b2ZfJGn7hpn2VS6jXYBD6rNgBEZrZF8nD+VIvONITk0dzlo4EKuV
         2AqEv6MyHwzhh3+nZM/a4+NTN+GFAd0/1tA/CH8Ewmvv8PZxApZBtzTlM35LLgPgBsuj
         FKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945419; x=1774550219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vv/MHTOj4w76L3rSBf/0rJ89xOX3RsgrHsuj+og3r/Y=;
        b=b7TeRkbx8OjjnAmzJKFeSFOuY9SGXAUpm6dSNG6Cnf7SryWqGvzcc9rxtxvvaYOsBP
         g78GXYRss+UYnoDp4I1hdgvIddYjO+VoZMsRB13RSCxhgs+isYcQX5JmtkrzGGFzrim+
         y6T3EtnEbkXB3cr8aSz6mKBhpxCrs+Bjqzkue4YWssSn0u6/TDmodnICMauNheJKlMD3
         yOvF+vW3MpdkwXTtnDx+CG8psh7KsB7Zmz5+s3jligryrk32FM1V5pHi72U0y1XDolWI
         utF8o8zCAkY0mhAhjQayWtU2n554VF1JGC/xAtEB8yOyGgakBvWgnT1SxO0YreZGKXH7
         TAig==
X-Forwarded-Encrypted: i=1; AJvYcCWpHc/HupSMMCeALBkG8/nr5GxlQ6gCg67rjbNh1eeDRkzHQNhIzwWHJcMqVyGQddDqG2u8hpPKDMTLMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI0uXi7+cC2qO20hMUWaE4bcq7d5u2kyeotAEIHyYrsVaTc58q
	h36rGpqQYqYq6b2YH+YRjL9X7gLxf7s3wMjhMEgp58BhPssBKkHaBmYmNQNvIpDN
X-Gm-Gg: ATEYQzxHLvBtg4q3Oe3qwF/4fnnoaQAzlzk5mXSH2SJzmO5W21m+O01we53VSnS4ixU
	ZOlSS92U66yCNfwkASHc23xcZvOnoVJrYooboGE0vyJqZmZit6XMSh4prKeQS5Ypp987+KGlXFo
	1BIVXLUAzupw2U8bGh6yZ/F3SME3JhVD1bqDCoDjxMBTUosuduU1UBRPDr36iRGfuQwkdEQQz8c
	c6WlZFTLQRfC25/1FhxeL606fCJI4g4TkrNRBntCw328Zcf/akZE0HnswlvkcyI29aQYjl+RmTF
	7Mc9cdfdJk0dyWmyGJJ4PBqcbCT7Cer+TPWd2u3DVFcqQZ8KJ88L9mQ+BPDe7DO2ABruPC37FSC
	T1KL2DlfFoNFmtNW2AMPWl+2lLm1l+p6Khx5EWs6AlAP84qRhLmHTSUhSuW5sszo9EaFAwPfQl7
	ka/zLB4uoOXVcSykoLFuiibx3N3JmEvVf3vxG386K49A==
X-Received: by 2002:a17:902:e850:b0:2b0:6885:f1d4 with SMTP id d9443c01a7336-2b0827dda86mr2797375ad.39.1773945418561;
        Thu, 19 Mar 2026 11:36:58 -0700 (PDT)
Received: from LIB-LAP-0152.lan ([2409:40f2:1185:6d0e:dd0c:ac77:d9d4:e83e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e605108sm84588455ad.60.2026.03.19.11.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:36:58 -0700 (PDT)
From: Chethan C <mail.chethanc@gmail.com>
X-Google-Original-From: Chethan C <chethan.c@LIB-LAP-0152.lan>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chethan C <chethan.c@LIB-LAP-0152.lan>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Renaming camel case enum values
Date: Fri, 20 Mar 2026 00:00:41 +0530
Message-Id: <20260319183046.489914-1-chethan.c@LIB-LAP-0152.lan>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-56363-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailchethanc@gmail.com,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.959];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,LIB-LAP-0152.lan:mid]
X-Rspamd-Queue-Id: CDC912D1234
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Renamed enum av7110_rec_play_state from camel case to upper case
underscore style.

Fixes checkpatch warning

Signed-off-by: Chethan C <chethan.c@LIB-LAP-0152.lan>
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


