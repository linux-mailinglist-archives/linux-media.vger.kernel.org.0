Return-Path: <linux-media+bounces-56570-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPw2MN+cvWmW/gIAu9opvQ
	(envelope-from <linux-media+bounces-56570-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 20:15:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6506B2DFD28
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 20:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53CD9304B29A
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A4434AAE3;
	Fri, 20 Mar 2026 19:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCqfV0+g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3802D73B9
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 19:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774034131; cv=none; b=K197FRqG1m61BTW7Y1M3YBpiffAXfmGpZv2gT32YCGmM0Owzuz+gq15qpEJNy06BCLmAwsHgZSK1KOlpTUIGsc7W7gD9BONkglYljWTKtu5Bb416XgZzb4jcMu+Uo8NsyXXpXik2iG9hp8FcRCSTaLVHwpePDMRbXiHWdeh3T84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774034131; c=relaxed/simple;
	bh=K4AbDxiPtFtHSpGdGDtx7OdA8I3+c3fZMd8RDCScu78=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=q+udOPuQ0rHqJ6tjV4I8xix7h2eJ504kl/oyEvtSZVtW6Ors5yQqbCVVzR37MFXkzEP9/KG+0jZ4jDM8UphH7XngkcRXHu01v/q2mLb1qLcBZxGrWOScOJ7EmBpNk2OVLYLNh270BN1tXGDbD54IttskpHK6GKIjGy8SH0hXTfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCqfV0+g; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ad4d639db3so4464095ad.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 12:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774034129; x=1774638929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hLR2ZkG6bg0iShqg1gNOyekotcqpmX708u+9fcbgzN8=;
        b=XCqfV0+gVKtpqLWbnYlNWnkLzJSUrGA266wZOPYzyyTzK+AxK7xkiyJNMh4fgAf1Fi
         BYGnjcfry8wVUrqtFoVjiOnYIDh/w3plwqz/pkyPqqSDGfUxl6ed7wA8a87dNjBSn2yO
         lOI88lNY1lmO2klOg5YIcQBcDDvKU57HegHUqHWKBKEqXv9zUTMNkJRjYKN8zrc8j6Ze
         SU+EDSkTNYlGJ1x4TiUij2BKq/p0AWEFH14AmbWIr5/dltOgrcdhVecL5rRNDlnuTMNw
         VIQ8V/qS6IpT9VDHTSCsY+KQBeITyPdTzygY/VsbG/XdUW6Vb5cMDIQMJI9KfD5xub0d
         wLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774034129; x=1774638929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLR2ZkG6bg0iShqg1gNOyekotcqpmX708u+9fcbgzN8=;
        b=st3Fn5fIL1Jyfqr1wjglPmnx7FF+lvDZ+No0QIG6FC+Qw8M1EPmX5K16yMd2eVHcAV
         ksNILsUpsDTLL/aNrrs9DgwWo0zaGoSMQjNr0qFB2OjZtkoWYZR6kOdoQPIzt/Hjx6nL
         QCuU1V0cAZFXvk9PNDVxAwMnxvaX6ZAcfg01+1zqg+nxwPlIiBdMFr2f8dFP7FH2685h
         SJ2c4u1cg6HgSB/RXL2rT8F0qlExc1e9ODcod3JV4EfjsYc2oeThpTitskNsUVlrwMUw
         mWUjT8+QkaXbJ0NYyWoq7vn7doNUgApVT3xmmqiM9a1/RrCtYtjyd8BAnPAicgkS4waN
         mvRA==
X-Forwarded-Encrypted: i=1; AJvYcCVf4KiObWvowfiFxPl6+xKugNaPnbRs/IAP2jhYM6rMsysPaZmxaapPnviNGoBzepUP7yFc3LXdl4r3Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdK/rXEByw7CZf8yeHoJnEvDI4qH1SY3iy2Bt7FwfIxMuIZfqP
	7yMacsmjctYRW2lmbLmt8qXPcgvdb1t7l8PZS/un7+CNDqe2jgKQNpbp
X-Gm-Gg: ATEYQzzJxLt7Ayq3HGe4LodaaEs31+3Yy5N16eL2JF/ZGjrfligxnUQfra6Fq2Djbck
	zUsuEkWj6EjY5hQOJDfhejsIFXcSq5/PT7ZmPZHZy5KYgiXSgR4eW6Ua71NjjUA2/MUiwG+KBhC
	1jbrGKrsiEjLv8dIv1ueaeQIhcrgmI9ckvH7gYnmNG0FThUewbRJfNAhD7vAcUQ8EnGPpwmY3H8
	gSfAYgwYbdFUFqr5C01kCBvCx7FklYbwcOegVDNwT22d3dD8ktL3X5c5ngVkHVhj25Rbe97NrOr
	RumJjbG/KuhKS6TwFbmZQBd5j478TDaYXBqIPNLfxF2we6HFAuUB+hQh2JtVp1qhFAAVTc3QWQr
	Yund0fEi9kv/s+WLsKoIL0Aivmw9+v4FmQdwHngXNijExTny5xqVWpDa5SFcaUm/7jlWbVy/wJb
	EDHWQ2lrCmxFP0qQlxWqH1jrE9ke9PzZyXFXredos=
X-Received: by 2002:a17:903:38cf:b0:2b0:6961:150a with SMTP id d9443c01a7336-2b0827d7e20mr37600295ad.38.1774034128858;
        Fri, 20 Mar 2026 12:15:28 -0700 (PDT)
Received: from LIB-LAP-0152.lan ([2409:40f2:2080:22bd:b0c0:3626:1867:c290])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836b97fesm28973025ad.84.2026.03.20.12.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 12:15:28 -0700 (PDT)
From: "Chethan.C" <mail.chethanc@gmail.com>
X-Google-Original-From: "Chethan.C" <mail.chethan.c@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Chethan.C" <mail.chethan.c@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: media: av7110: fix coding style
Date: Sat, 21 Mar 2026 00:45:02 +0530
Message-Id: <20260320191507.511560-1-mail.chethan.c@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56570-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailchethanc@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.803];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6506B2DFD28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fixed Indentation issues reported by checkpatch.pl.

Renamed enum av7110_rec_play_state from camel case to
upper case underscore style to comply kernel style guidelines.

Signed-off-by: Chethan.C <mail.chethan.c@gmail.com>
---
v2:
        - fixed indentation issues reported by checkpatch.pl
        - Rename av7110_rec_play_state to follow kernel naming style
---
 drivers/staging/media/av7110/av7110_av.c | 109 ++++++++++++++++++-----
 drivers/staging/media/av7110/av7110_hw.h |  16 ++--
 2 files changed, 94 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 2993ac43c49c..a7d76348318d 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -111,7 +111,7 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 
 	if (av7110->playing || (av7110->rec_mode & av))
 		return -EBUSY;
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 	dvbdmx->recording = 1;
 	av7110->rec_mode |= av;
 
@@ -121,7 +121,11 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[0]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[0]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
+		ret = av7110_fw_cmd(av7110,
+				    COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_RECORD,
+				    2,
+				    AudioPES, 0);
 		break;
 
 	case RP_VIDEO:
@@ -129,7 +133,12 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[1]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, 0);
+		ret = av7110_fw_cmd(av7110,
+				    COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_RECORD,
+				    2,
+				    VideoPES,
+				    0);
 		break;
 
 	case RP_AV:
@@ -141,7 +150,12 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[1]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110,
+				     COMTYPE_REC_PLAY,
+				     AV7110_REC_PLAY_RECORD,
+				     2,
+				     AV_PES,
+				     0);
 		break;
 	}
 	return ret;
@@ -158,7 +172,7 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
 	if (av7110->playing & av)
 		return -EBUSY;
 
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 
 	if (av7110->playing == RP_NONE) {
 		av7110_ipack_reset(&av7110->ipack[0]);
@@ -168,15 +182,30 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
 	av7110->playing |= av;
 	switch (av7110->playing) {
 	case RP_AUDIO:
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AudioPES, 0);
+		ret = av7110_fw_cmd(av7110,
+				     COMTYPE_REC_PLAY,
+				     AV7110_REC_PLAY_PLAY,
+				     2,
+				     AudioPES,
+				     0);
 		break;
 	case RP_VIDEO:
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+		ret = av7110_fw_cmd(av7110,
+				     COMTYPE_REC_PLAY,
+				     AV7110_REC_PLAY_PLAY,
+				     2,
+				     VideoPES,
+				     0);
 		av7110->sinfo = 0;
 		break;
 	case RP_AV:
 		av7110->sinfo = 0;
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110,
+				     COMTYPE_REC_PLAY,
+				     AV7110_REC_PLAY_PLAY,
+				     2,
+				     AV_PES,
+				     0);
 		break;
 	}
 	return ret;
@@ -190,15 +219,25 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 
 	if (!(av7110->playing & av) && !(av7110->rec_mode & av))
 		return 0;
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 	if (av7110->playing) {
 		av7110->playing &= ~av;
 		switch (av7110->playing) {
 		case RP_AUDIO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AudioPES, 0);
+			ret = av7110_fw_cmd(av7110,
+					     COMTYPE_REC_PLAY,
+					     AV7110_REC_PLAY_PLAY,
+					     2,
+					     AudioPES,
+					     0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110,
+					     COMTYPE_REC_PLAY,
+					     AV7110_REC_PLAY_PLAY,
+					     2,
+					     VideoPES,
+					     0);
 			break;
 		case RP_NONE:
 			ret = av7110_set_vidmode(av7110, av7110->vidmode);
@@ -208,10 +247,20 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 		av7110->rec_mode &= ~av;
 		switch (av7110->rec_mode) {
 		case RP_AUDIO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
+			ret = av7110_fw_cmd(av7110,
+					     COMTYPE_REC_PLAY,
+					     AV7110_REC_PLAY_RECORD,
+					     2,
+					     AudioPES,
+					     0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110,
+					     COMTYPE_REC_PLAY,
+					     AV7110_REC_PLAY_RECORD,
+					     2,
+					     VideoPES,
+					     0);
 			break;
 		case RP_NONE:
 			break;
@@ -551,7 +600,7 @@ static ssize_t dvb_aplay(struct av7110 *av7110, const char __user *buf,
 			if (nonblock)
 				return count - todo;
 			if (wait_event_interruptible(av7110->aout.queue,
-						     (dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))
+					(dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))
 				return count - todo;
 		}
 		n = todo;
@@ -1168,7 +1217,10 @@ static int dvb_video_ioctl(struct file *file,
 		}
 		if (av7110->videostate.stream_source == VIDEO_SOURCE_MEMORY) {
 			if (av7110->playing == RP_AV) {
-				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+				ret = av7110_fw_cmd(av7110,
+				COMTYPE_REC_PLAY,
+				AV7110_REC_PLAY_STOP,
+				0);
 				if (ret)
 					break;
 				av7110->playing &= ~RP_VIDEO;
@@ -1184,7 +1236,10 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_FREEZE:
 		av7110->videostate.play_state = VIDEO_FREEZED;
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Pause, 0);
+			ret = av7110_fw_cmd(av7110,
+					     COMTYPE_REC_PLAY,
+					     AV7110_REC_PLAY_PAUSE,
+					     0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FREEZE, 1);
 		if (!ret)
@@ -1193,7 +1248,10 @@ static int dvb_video_ioctl(struct file *file,
 
 	case VIDEO_CONTINUE:
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Continue, 0);
+			ret = av7110_fw_cmd(av7110,
+					     COMTYPE_REC_PLAY,
+					     AV7110_REC_PLAY_CONTINUE,
+					     0);
 		if (!ret)
 			ret = vidcom(av7110, AV_VIDEO_CMD_PLAY, 0);
 		if (!ret) {
@@ -1291,7 +1349,7 @@ static int dvb_video_ioctl(struct file *file,
 		//note: arg is ignored by firmware
 		if (av7110->playing & RP_VIDEO)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Scan_I, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_SCAN_I, 2, AV_PES, 0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FFWD, arg);
 		if (!ret) {
@@ -1303,7 +1361,12 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_SLOWMOTION:
 		if (av7110->playing & RP_VIDEO) {
 			if (av7110->trickmode != TRICK_SLOW)
-				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Slow, 2, 0, 0);
+				ret = av7110_fw_cmd(av7110,
+						     COMTYPE_REC_PLAY,
+						     AV7110_REC_PLAY_SLOW,
+						     2,
+						     0,
+						     0);
 			if (!ret)
 				ret = vidcom(av7110, AV_VIDEO_CMD_SLOW, arg);
 		} else {
@@ -1329,15 +1392,15 @@ static int dvb_video_ioctl(struct file *file,
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
@@ -1483,7 +1546,7 @@ static int dvb_audio_ioctl(struct file *file,
 		av7110_ipack_reset(&av7110->ipack[0]);
 		if (av7110->playing == RP_AV)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Play, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_PLAY, 2, AV_PES, 0);
 		break;
 
 	case AUDIO_SET_ID:
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/media/av7110/av7110_hw.h
index d4579f411c56..1b17f1f2ea42 100644
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
+	AV7110_REC_PLAY_STOP,
+	AV7110_REC_PLAY_PLAY,
+	AV7110_REC_PLAY_PAUSE,
+	AV7110_REC_PLAY_SLOW,
+	AV7110_REC_PLAY_FF_IP,
+	AV7110_REC_PLAY_SCAN_I,
+	AV7110_REC_PLAY_CONTINUE
 };
 
 enum av7110_fw_cmd_misc {
-- 
2.25.1


