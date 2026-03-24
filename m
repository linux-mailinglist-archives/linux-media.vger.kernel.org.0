Return-Path: <linux-media+bounces-56908-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDAGGQbcwmm0mwQAu9opvQ
	(envelope-from <linux-media+bounces-56908-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:46:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA87731B06F
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2972A3059836
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 18:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE48C3CBE95;
	Tue, 24 Mar 2026 18:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8Wl0HEy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4FF3E559F
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377815; cv=none; b=KCU9U47BnDlaY59qD7doMW03oGJy00x0YxRlSama2uL1ppofXGBsUY7tjxzpXi/O4SEyRLIh7oL6d+mMZGpX1xMqfczqobdraEEIyUNMIgzArPQJYAMwPzZYykxRNjABuQejt6vsNEbMMj1elSc2YBthYAqDL9Ruz4s7N0YGCTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377815; c=relaxed/simple;
	bh=bwgcmHzwUQo/W/aZ3f7e3d+qB7PiBUeGlVv/4eVzg38=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=UofConNhDnlYdQpIPSxxkFDE7u1SGi3E16yaRxzYbpzwIRRICurGL3CFKPQLkePKgFNRpM3E5rSiQUdNyKQc6Fl+uG6aGrf6Ypjg3bAWte6bpsEXUHeFnEgVuVdTN8cn+kb89XW3kyk2zcknbrDGTvssY1bJNeuAq86MstPQw6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8Wl0HEy; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so2258023b3a.1
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 11:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774377813; x=1774982613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgQen54kl3I8J/aB1eTNwfnjYEnMIbfvbEgQrOUcwsc=;
        b=k8Wl0HEydbo3EzG4PqZX6lZZ6AsVgpDE5rsxcoRHk0GooWdfxom5SPuNSEzQhY5y9r
         GO8T3tSEhiZk2WO/xOHEVl3R5qjVqvpxde6V45l3FMWS8wR3XSyjEKCopmpxoI1F4YRG
         LNha+roUQywAOoOWNptoDt4R0VpndBeFrZjvhug4tm30COM201zfzbzE1r4sElwAQGYC
         yj399kpzf5HE1v28NF7xn7m5fXQuAshOHt8Cu/HerzfOxZk/TIuCz+wW73T1OAbvLqdT
         YCwsXqwKRFgqB9RXmcsxy+bpyLJ8UQEAXSHqq+vCL7xXCA6EcTpq/S87v4BnGYTgT6ti
         iv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774377813; x=1774982613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgQen54kl3I8J/aB1eTNwfnjYEnMIbfvbEgQrOUcwsc=;
        b=aMV918MSwXFmYQEcOs8Z0BlD8DeO25NqYIfNev5NEtQKpuabH71zcT3328aECXN28K
         zrGuiwPCvj809aTo77fyDeHftf5tKj6iggQjNGZRj9/7FHFw/72/8mnGu4kgosNGF4iD
         xruRtLK/1VhJTTEzHMKsP6YcRirzg6tPpEA7EZr4mKZlk5Bs7EY5K/9iR0ksmdBJCiTA
         97ZQHiBQVMSo4nlx/zkCgYvsPf8DuhF6ZeiXKaycoHWTu+h7BREyIdRgY+2fxNKGyEo+
         aHI91OeBZD6FXSeQ6Nt3PBhgF/h07zRmaTYzhts4zWxu8Cj31pvFrM+NNYseFxrnfzI6
         o31w==
X-Forwarded-Encrypted: i=1; AJvYcCV1uS5DoSEJbYKd1gUwBeWwueEM6H3FoSZbgnggg74LP3XAImm2bNAP9RAlbqe+YO/gtxUUVot7iJxpRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1jwCQyxbHxpOSFeeu8eF5IVWiwx96cy5RSJF9aKOj1frs4jd7
	6J63DbE1grN7FgiYLWTFp4dL1jRa6BUPo8dWDsPlffBtzqdT5bEq0+/r
X-Gm-Gg: ATEYQzwn+hB0HeRKBgsQ81Umrx5FZNHfb/vFASI4Q2dM1JJu3FYmrN0y4OkeAGMAfOw
	h8l1IU/l57+wbOZoBWuqJxEUCQ5tC1RaO8Kw/E0ShdqsJ7Il+wy3DzHz84WcbQUnJQcik1uV25J
	/jrKp0T6iQbSdtbMLlG7ZO+Yj1bPPxxPWc1ogBN4SMsfl9c81SAx4ZSh346D+fWTAS9CPnH64Og
	bICzrjIc04KRi/rA0TyUiSfFFXifiYlAgqf9LAz0CDd9p/ZRAicfNjdOhjkIJuKQi+AinAYRxO4
	oK4Vw7RrfgnQgUepoTGFR3gnrLXbEn1VTTCDrhr+uAwSV8x9glC1MhouEr6nLSY5K8/rZIQkCJw
	+2/VyNHH9G/I62Ge0rg05b4FODzsKMi7tXuPNZGZO/gmpzXctlytwGTVtgHNMjrPVxu8cI6Lcvg
	L6UomVRBr2VW70Xwj7VqKGdISEPgjWtt7ys+IDJw==
X-Received: by 2002:a05:6a00:f8e:b0:829:7057:b99e with SMTP id d2e1a72fcca58-82c6e14675amr576998b3a.54.1774377812635;
        Tue, 24 Mar 2026 11:43:32 -0700 (PDT)
Received: from LIB-LAP-0152.lan ([2409:40f2:2084:974f:ec2b:72ad:38be:6404])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409c11asm12535160b3a.30.2026.03.24.11.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:43:32 -0700 (PDT)
From: Chethan C <mail.chethanc@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chethan C <mail.chethanc@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Osama Albahrani <osalbahr@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6] staging: media: av7110: fix coding style
Date: Wed, 25 Mar 2026 00:12:44 +0530
Message-Id: <20260324184259.694280-1-mail.chethanc@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56908-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,gmail.com,suse.com,ideasonboard.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailchethanc@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,d.id:url,checkpatch.pl:url]
X-Rspamd-Queue-Id: AA87731B06F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix indentation and alignment issues reported by checkpatch.pl.

Rename enums av7110_rec_play_state, av7110_type_rec_play_format,
and av7110_encoder_command to follow kernel naming style.

Rename wssData and wssMode to wss_data and wss_mode to avoid
camelCase identifiers.

Signed-off-by: Chethan C <mail.chethanc@gmail.com>
---
v6:
  - Rename wssMode
  - Group av7110_fw_cmd parameters logically

v5:
  - Limit lines to 80 columns
  - Add trailing commas to enums av7110_rec_play_state,
    av7110_type_rec_play_format, av7110_encoder_command
  - Remove unnecessary cast

v4:
  - Fix coding style issues reported by checkpatch.pl

v3:
  - Fix coding style and alignment issues reported by checkpatch.pl
  - Rename av7110_pid_command, av7110_type_rec_play_format,
    av7110_encoder_command to follow kernel naming style

v2:
  - Fix indentation issues reported by checkpatch.pl
  - Rename av7110_rec_play_state to follow kernel naming style
---
 drivers/staging/media/av7110/av7110.c     | 31 +++++---
 drivers/staging/media/av7110/av7110.h     |  4 +-
 drivers/staging/media/av7110/av7110_av.c  | 91 +++++++++++++++--------
 drivers/staging/media/av7110/av7110_ca.c  |  3 +-
 drivers/staging/media/av7110/av7110_hw.h  | 71 +++++++++---------
 drivers/staging/media/av7110/av7110_ir.c  |  4 +-
 drivers/staging/media/av7110/av7110_v4l.c | 22 +++---
 7 files changed, 135 insertions(+), 91 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..dd62038dec56 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -121,19 +121,22 @@ static void init_av7110_av(struct av7110 *av7110)
 	if (ret < 0)
 		pr_err("cannot set internal volume to maximum:%d\n", ret);
 
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetMonitorType,
-			    1, (u16)av7110->display_ar);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+			    AV7110_SET_MONITOR_TYPE, 1, av7110->display_ar);
 	if (ret < 0)
 		pr_err("unable to set aspect ratio\n");
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetPanScanType,
-			    1, av7110->display_panscan);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+			    AV7110_SET_PANSCAN_TYPE, 1,
+			    av7110->display_panscan);
 	if (ret < 0)
 		pr_err("unable to set pan scan\n");
 
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 2, wss_cfg_4_3);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+			    AV7110_SET_WSS_CONFIG, 2, 2, wss_cfg_4_3);
 	if (ret < 0)
 		pr_err("unable to configure 4:3 wss\n");
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 3, wss_cfg_16_9);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+			    AV7110_SET_WSS_CONFIG, 2, 3, wss_cfg_16_9);
 	if (ret < 0)
 		pr_err("unable to configure 16:9 wss\n");
 
@@ -717,7 +720,8 @@ static inline int SetPIDs(struct av7110 *av7110, u16 vpid, u16 apid, u16 ttpid,
 	if (av7110->audiostate.bypass_mode)
 		aflags |= 0x8000;
 
-	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, MultiPID, 6,
+	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER,
+			     AV7110_MULTI_PID, 6,
 			     pcrpid, vpid, apid, ttpid, subpid, aflags);
 }
 
@@ -785,7 +789,7 @@ static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 		av7110_p2t_init(&av7110->p2t_filter[dvbdmxfilter->index], dvbdmxfeed);
 	}
 
-	buf[0] = (COMTYPE_PID_FILTER << 8) + AddPIDFilter;
+	buf[0] = (COMTYPE_PID_FILTER << 8) + AV7110_ADD_PID_FILTER;
 	buf[1] = 16;
 	buf[2] = dvbdmxfeed->pid;
 	buf[3] = mode;
@@ -828,7 +832,7 @@ static int StopHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 
 	av7110->handle2filter[handle] = NULL;
 
-	buf[0] = (COMTYPE_PID_FILTER << 8) + DelPIDFilter;
+	buf[0] = (COMTYPE_PID_FILTER << 8) + AV7110_DEL_PID_FILTER;
 	buf[1] = 1;
 	buf[2] = handle;
 	ret = av7110_fw_request(av7110, buf, 3, answ, 2);
@@ -873,7 +877,8 @@ static int dvb_feed_start_pid(struct dvb_demux_feed *dvbdmxfeed)
 
 	if (dvbdmxfeed->pes_type < 2 && npids[0])
 		if (av7110->fe_synced) {
-			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER,
+					    AV7110_SCAN, 0);
 			if (ret)
 				return ret;
 		}
@@ -1911,11 +1916,13 @@ static int av7110_fe_lock_fix(struct av7110 *av7110, enum fe_status status)
 			av7110->pids[DMX_PES_TELETEXT], 0,
 			av7110->pids[DMX_PES_PCR]);
 		if (!ret)
-			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER,
+					    AV7110_SCAN, 0);
 	} else {
 		ret = SetPIDs(av7110, 0, 0, 0, 0, 0);
 		if (!ret) {
-			ret = av7110_fw_cmd(av7110, COMTYPE_PID_FILTER, FlushTSQueue, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PID_FILTER,
+					    AV7110_FLUSH_TS_QUEUE, 0);
 			if (!ret)
 				ret = av7110_wait_msgstate(av7110, GPMQBusy);
 		}
diff --git a/drivers/staging/media/av7110/av7110.h b/drivers/staging/media/av7110/av7110.h
index b584754f4be0..797dda437cbe 100644
--- a/drivers/staging/media/av7110/av7110.h
+++ b/drivers/staging/media/av7110/av7110.h
@@ -243,8 +243,8 @@ struct av7110 {
 	struct dvb_video_events  video_events;
 	video_size_t		 video_size;
 
-	u16			wssMode;
-	u16			wssData;
+	u16			wss_mode;
+	u16			wss_data;
 
 	struct infrared		ir;
 
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 2993ac43c49c..148457d5ad9a 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -111,7 +111,7 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 
 	if (av7110->playing || (av7110->rec_mode & av))
 		return -EBUSY;
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 	dvbdmx->recording = 1;
 	av7110->rec_mode |= av;
 
@@ -121,7 +121,9 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[0]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[0]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_RECORD, 2,
+				    AV7110_AUDIO_PES, 0);
 		break;
 
 	case RP_VIDEO:
@@ -129,7 +131,9 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[1]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_RECORD, 2,
+				    AV7110_VIDEO_PES, 0);
 		break;
 
 	case RP_AV:
@@ -141,7 +145,9 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[1]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_RECORD, 2,
+				    AV7110_AV_PES, 0);
 		break;
 	}
 	return ret;
@@ -158,7 +164,7 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
 	if (av7110->playing & av)
 		return -EBUSY;
 
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 
 	if (av7110->playing == RP_NONE) {
 		av7110_ipack_reset(&av7110->ipack[0]);
@@ -168,15 +174,21 @@ int av7110_av_start_play(struct av7110 *av7110, int av)
 	av7110->playing |= av;
 	switch (av7110->playing) {
 	case RP_AUDIO:
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AudioPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_PLAY, 2,
+				    AV7110_AUDIO_PES, 0);
 		break;
 	case RP_VIDEO:
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_PLAY, 2,
+				    AV7110_VIDEO_PES, 0);
 		av7110->sinfo = 0;
 		break;
 	case RP_AV:
 		av7110->sinfo = 0;
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_PLAY, 2,
+				    AV7110_AV_PES, 0);
 		break;
 	}
 	return ret;
@@ -190,15 +202,19 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 
 	if (!(av7110->playing & av) && !(av7110->rec_mode & av))
 		return 0;
-	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+	av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, AV7110_REC_PLAY_STOP, 0);
 	if (av7110->playing) {
 		av7110->playing &= ~av;
 		switch (av7110->playing) {
 		case RP_AUDIO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AudioPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_PLAY, 2,
+					    AV7110_AUDIO_PES, 0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_PLAY, 2,
+					    AV7110_VIDEO_PES, 0);
 			break;
 		case RP_NONE:
 			ret = av7110_set_vidmode(av7110, av7110->vidmode);
@@ -208,10 +224,14 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 		av7110->rec_mode &= ~av;
 		switch (av7110->rec_mode) {
 		case RP_AUDIO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_RECORD, 2,
+					    AV7110_AUDIO_PES, 0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_RECORD, 2,
+					    AV7110_VIDEO_PES, 0);
 			break;
 		case RP_NONE:
 			break;
@@ -325,7 +345,8 @@ int av7110_set_vidmode(struct av7110 *av7110, enum av7110_video_mode mode)
 
 	dprintk(2, "av7110:%p\n", av7110);
 
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, LoadVidCode, 1, mode);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+			    AV7110_LOAD_VID_CODE, 1, mode);
 
 	if (!ret && !av7110->playing) {
 		ret = ChangePIDs(av7110, av7110->pids[DMX_PES_VIDEO],
@@ -333,7 +354,8 @@ int av7110_set_vidmode(struct av7110 *av7110, enum av7110_video_mode mode)
 			   av7110->pids[DMX_PES_TELETEXT],
 			   0, av7110->pids[DMX_PES_PCR]);
 		if (!ret)
-			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER,
+					    AV7110_SCAN, 0);
 	}
 	return ret;
 }
@@ -551,7 +573,7 @@ static ssize_t dvb_aplay(struct av7110 *av7110, const char __user *buf,
 			if (nonblock)
 				return count - todo;
 			if (wait_event_interruptible(av7110->aout.queue,
-						     (dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))
+			(dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))
 				return count - todo;
 		}
 		n = todo;
@@ -1168,7 +1190,8 @@ static int dvb_video_ioctl(struct file *file,
 		}
 		if (av7110->videostate.stream_source == VIDEO_SOURCE_MEMORY) {
 			if (av7110->playing == RP_AV) {
-				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Stop, 0);
+				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+						    AV7110_REC_PLAY_STOP, 0);
 				if (ret)
 					break;
 				av7110->playing &= ~RP_VIDEO;
@@ -1184,7 +1207,8 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_FREEZE:
 		av7110->videostate.play_state = VIDEO_FREEZED;
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Pause, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_PAUSE, 0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FREEZE, 1);
 		if (!ret)
@@ -1193,7 +1217,8 @@ static int dvb_video_ioctl(struct file *file,
 
 	case VIDEO_CONTINUE:
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Continue, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_CONTINUE, 0);
 		if (!ret)
 			ret = vidcom(av7110, AV_VIDEO_CMD_PLAY, 0);
 		if (!ret) {
@@ -1248,8 +1273,9 @@ static int dvb_video_ioctl(struct file *file,
 		if (ret < 0)
 			break;
 		av7110->videostate.display_format = format;
-		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetPanScanType,
-				    1, av7110->display_panscan);
+		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+				    AV7110_SET_PANSCAN_TYPE, 1,
+				    av7110->display_panscan);
 		break;
 	}
 
@@ -1259,8 +1285,8 @@ static int dvb_video_ioctl(struct file *file,
 			break;
 		}
 		av7110->display_ar = arg;
-		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetMonitorType,
-				    1, (u16)arg);
+		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+				    AV7110_SET_MONITOR_TYPE, 1, arg);
 		break;
 
 #ifdef CONFIG_COMPAT
@@ -1291,7 +1317,8 @@ static int dvb_video_ioctl(struct file *file,
 		//note: arg is ignored by firmware
 		if (av7110->playing & RP_VIDEO)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Scan_I, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_SCAN_I, 2,
+					    AV7110_AV_PES, 0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FFWD, arg);
 		if (!ret) {
@@ -1303,7 +1330,9 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_SLOWMOTION:
 		if (av7110->playing & RP_VIDEO) {
 			if (av7110->trickmode != TRICK_SLOW)
-				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Slow, 2, 0, 0);
+				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
+						    AV7110_REC_PLAY_SLOW, 2,
+						    0, 0);
 			if (!ret)
 				ret = vidcom(av7110, AV_VIDEO_CMD_SLOW, arg);
 		} else {
@@ -1329,15 +1358,18 @@ static int dvb_video_ioctl(struct file *file,
 		av7110_ipack_reset(&av7110->ipack[1]);
 		if (av7110->playing == RP_AV) {
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Play, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_PLAY, 2,
+					    AV7110_AV_PES, 0);
 			if (ret)
 				break;
 			if (av7110->trickmode == TRICK_FAST)
 				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-						    __Scan_I, 2, AV_PES, 0);
+						    AV7110_REC_PLAY_SCAN_I, 2,
+						    AV7110_AV_PES, 0);
 			if (av7110->trickmode == TRICK_SLOW) {
 				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-						    __Slow, 2, 0, 0);
+						    AV7110_REC_PLAY_SLOW, 2,
+						    0, 0);
 				if (!ret)
 					ret = vidcom(av7110, AV_VIDEO_CMD_SLOW, arg);
 			}
@@ -1483,7 +1515,8 @@ static int dvb_audio_ioctl(struct file *file,
 		av7110_ipack_reset(&av7110->ipack[0]);
 		if (av7110->playing == RP_AV)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Play, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_PLAY, 2,
+					    AV7110_AV_PES, 0);
 		break;
 
 	case AUDIO_SET_ID:
diff --git a/drivers/staging/media/av7110/av7110_ca.c b/drivers/staging/media/av7110/av7110_ca.c
index 63d9c97a5190..24876c8fdc8c 100644
--- a/drivers/staging/media/av7110/av7110_ca.c
+++ b/drivers/staging/media/av7110/av7110_ca.c
@@ -307,7 +307,8 @@ static int dvb_ca_ioctl(struct file *file, unsigned int cmd, void *parg)
 			mutex_unlock(&av7110->ioctl_mutex);
 			return -EINVAL;
 		}
-		av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, SetDescr, 5,
+		av7110_fw_cmd(av7110, COMTYPE_PIDFILTER,
+			      AV7110_SET_DESCR, 5,
 			      (descr->index << 8) | descr->parity,
 			      (descr->cw[0] << 8) | descr->cw[1],
 			      (descr->cw[2] << 8) | descr->cw[3],
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/media/av7110/av7110_hw.h
index d4579f411c56..3afe474da871 100644
--- a/drivers/staging/media/av7110/av7110_hw.h
+++ b/drivers/staging/media/av7110/av7110_hw.h
@@ -21,12 +21,12 @@ enum av7110_bootstate {
 };
 
 enum av7110_type_rec_play_format {
-	RP_None,
-	AudioPES,
-	AudioMp2,
-	AudioPCM,
-	VideoPES,
-	AV_PES
+	AV7110_RP_NONE,
+	AV7110_AUDIO_PES,
+	AV7110_AUDIO_MP2,
+	AV7110_AUDIO_PCM,
+	AV7110_VIDEO_PES,
+	AV7110_AV_PES,
 };
 
 enum av7110_osd_palette_type {
@@ -112,19 +112,19 @@ enum av7110_osd_command {
 };
 
 enum av7110_pid_command {
-	MultiPID,
-	VideoPID,
-	AudioPID,
-	InitFilt,
-	FiltError,
-	NewVersion,
-	CacheError,
-	AddPIDFilter,
-	DelPIDFilter,
-	Scan,
-	SetDescr,
-	SetIR,
-	FlushTSQueue
+	AV7110_MULTI_PID,
+	AV7110_VIDEO_PID,
+	AV7110_AUDIO_PID,
+	AV7110_INIT_FILT,
+	AV7110_FILT_ERROR,
+	AV7110_NEW_VERSION,
+	AV7110_CACHE_ERROR,
+	AV7110_ADD_PID_FILTER,
+	AV7110_DEL_PID_FILTER,
+	AV7110_SCAN,
+	AV7110_SET_DESCR,
+	AV7110_SET_IR,
+	AV7110_FLUSH_TS_QUEUE,
 };
 
 enum av7110_mpeg_command {
@@ -158,24 +158,24 @@ enum av7110_request_command {
 };
 
 enum av7110_encoder_command {
-	SetVidMode,
-	SetTestMode,
-	LoadVidCode,
-	SetMonitorType,
-	SetPanScanType,
-	SetFreezeMode,
-	SetWSSConfig
+	AV7110_SET_VID_MODE,
+	AV7110_SET_TEST_MODE,
+	AV7110_LOAD_VID_CODE,
+	AV7110_SET_MONITOR_TYPE,
+	AV7110_SET_PANSCAN_TYPE,
+	AV7110_SET_FREEZE_MODE,
+	AV7110_SET_WSS_CONFIG,
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
+	AV7110_REC_PLAY_CONTINUE,
 };
 
 enum av7110_fw_cmd_misc {
@@ -452,7 +452,8 @@ static inline int SendDAC(struct av7110 *av7110, u8 addr, u8 data)
 
 static inline int av7710_set_video_mode(struct av7110 *av7110, int mode)
 {
-	return av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetVidMode, 1, mode);
+	return av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+			     AV7110_SET_VID_MODE, 1, mode);
 }
 
 static inline int vidcom(struct av7110 *av7110, u32 com, u32 arg)
diff --git a/drivers/staging/media/av7110/av7110_ir.c b/drivers/staging/media/av7110/av7110_ir.c
index 68b3979ba5f2..a033844d21b2 100644
--- a/drivers/staging/media/av7110/av7110_ir.c
+++ b/drivers/staging/media/av7110/av7110_ir.c
@@ -71,8 +71,8 @@ int av7110_set_ir_config(struct av7110 *av7110)
 {
 	dprintk(4, "ir config = %08x\n", av7110->ir.ir_config);
 
-	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, SetIR, 1,
-			     av7110->ir.ir_config);
+	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER,
+			     AV7110_SET_IR, 1, av7110->ir.ir_config);
 }
 
 static int change_protocol(struct rc_dev *rcdev, u64 *rc_type)
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/media/av7110/av7110_v4l.c
index 200a7a29ea31..aed7581fa8a5 100644
--- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -556,7 +556,7 @@ static int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *fh,
 	if (FW_VERSION(av7110->arm_app) < 0x2623)
 		return -EINVAL;
 	memset(&f->fmt.sliced, 0, sizeof(f->fmt.sliced));
-	if (av7110->wssMode) {
+	if (av7110->wss_mode) {
 		f->fmt.sliced.service_set = V4L2_SLICED_WSS_625;
 		f->fmt.sliced.service_lines[0][23] = V4L2_SLICED_WSS_625;
 	}
@@ -596,14 +596,14 @@ static int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *fh,
 		return -EINVAL;
 	if (f->fmt.sliced.service_set & V4L2_SLICED_WSS_625) {
 		/* WSS controlled by userspace */
-		av7110->wssMode = 1;
-		av7110->wssData = 0;
+		av7110->wss_mode = 1;
+		av7110->wss_data = 0;
 	} else {
 		/* WSS controlled by firmware */
-		av7110->wssMode = 0;
-		av7110->wssData = 0;
+		av7110->wss_mode = 0;
+		av7110->wss_data = 0;
 		return av7110_fw_cmd(av7110, COMTYPE_ENCODER,
-				     SetWSSConfig, 1, 0);
+				     AV7110_SET_WSS_CONFIG, 1, 0);
 	}
 	return 0;
 }
@@ -616,17 +616,19 @@ static ssize_t av7110_vbi_write(struct file *file, const char __user *data, size
 	int rc;
 
 	dprintk(2, "\n");
-	if (FW_VERSION(av7110->arm_app) < 0x2623 || !av7110->wssMode || count != sizeof(d))
+	if (FW_VERSION(av7110->arm_app) < 0x2623 ||
+	    !av7110->wss_mode || count != sizeof(d))
 		return -EINVAL;
 	if (copy_from_user(&d, data, count))
 		return -EFAULT;
 	if ((d.id != 0 && d.id != V4L2_SLICED_WSS_625) || d.field != 0 || d.line != 23)
 		return -EINVAL;
 	if (d.id)
-		av7110->wssData = ((d.data[1] << 8) & 0x3f00) | d.data[0];
+		av7110->wss_data = ((d.data[1] << 8) & 0x3f00) | d.data[0];
 	else
-		av7110->wssData = 0x8000;
-	rc = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 1, av7110->wssData);
+		av7110->wss_data = 0x8000;
+	rc = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+			   AV7110_SET_WSS_CONFIG, 2, 1, av7110->wss_data);
 	return (rc < 0) ? rc : count;
 }
 
-- 
2.25.1


