Return-Path: <linux-media+bounces-56603-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMG/CqG/vmmFZwMAu9opvQ
	(envelope-from <linux-media+bounces-56603-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 16:56:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9252B2E63E0
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 16:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A4D0300C82E
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 15:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20F9396D10;
	Sat, 21 Mar 2026 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfgyEoDM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08296398908
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774108569; cv=none; b=XFCiwvwyeswVKt2YBFWMYKxGL2QrU+lY32crKzFaNd3jFS0kScxS+PiJy6QAJDjPkScbX2uhi75VCdn074TbXRtNYFs8votVyb/Qd280RUooENHkSNtUGX7e8rLH9osN7JpS2d/SEV9VrVI7O1aAcpZZiXA1dZ5hPnWpK7L08as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774108569; c=relaxed/simple;
	bh=N2yxkP12bdCcbNaW9KZPcsFMTIj0QBS3YVI0rw2OlLU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=G40Kf/gNI8qEyDJx2bVz7OMT96t2hhqPgQktLJrpk2oDYAXLWYsGAuK9hxqTq8ULdv2Iek+BBe77sfYanmPKGR1AoaDF1xfGLg66NMW1TwNWemjCgEUFv255+99/ePQ4jLbznS0Tsddxcna9RqQwU62006tWjBB2/d8M5rZaZKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfgyEoDM; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c648bc907ebso2003185a12.3
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 08:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774108563; x=1774713363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tYQ1qy8shZCenoZyJ9BIDMe4+IV4jbB77UtA2dfIpeo=;
        b=NfgyEoDMmOwOEzWZeeQcZjaR9UF7z6V11qOs9jz1oBbGPXH2nQt5JDle0jaAnSpi5i
         C9nTXPDC1BrF6r86ktOqQ3AQMzx5BK0BvRrQxhyJriMdAGOD9MxZMZJBFl7L/bt2FxTa
         mxyok0rNIJl5yJorW8t+IveZ9l8wgcPcV4+ykTM48mOGwpd1i2iUIQ76WpuIhkeD/3e/
         4HeUMw5sFVD6xdM+WaRbpbPkU8KLxKlF1zYNuPEexKKBy8WE2oCfShFPUmeNCbv3UvlG
         xNlhAX6jkpuGGfUOC+AZj6gf1TUH/+x2v+5HrOscF2O4ruK6GF7jM6UtEia0T4zDQ67z
         K8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774108563; x=1774713363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYQ1qy8shZCenoZyJ9BIDMe4+IV4jbB77UtA2dfIpeo=;
        b=fPkQ4ilXuZUHGfJ/FV6iA5nBNWtWRlOndgtqPOsesOaTfBfhi/DtYr+6Hgv+Ngf/OL
         cfcv/1O8agjelidFKSF1q5FxSMbFJrwhTe10nFYDNk3aRyUOADnfF6WjlJUk9znri4BS
         xkNECoZyj7gD0lnjgnyih2aGsoTGFbOSHAeKGJL8Ga9bHcFYCq8VIe1LSHOwPDzkp15l
         xwMq+u7UmwN1MQ4Sp2qjuxtrreYapiPHMWia5Tq/EDpWhH0WbctJ8F1V60E/aNDJr20g
         VFmeMWho/I6c6DVuI3dq7uvQx/5Q2IdJmKajrBPqldysroxM20+0YO9WrtM7RLBKcbQL
         1f8A==
X-Forwarded-Encrypted: i=1; AJvYcCVLId9qdc+Hpv7cBc/P6hSYHYiaR2o53dUd4y51vE40XJZj3H0EzG1VOL3U2i09VTtO4y90XIQjOntylw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx41BWZKWq56PHxDQbq8hnDIl0/FfNKpTwI/lmZWOVzoTGSzHVH
	dLongvgGKB7d7XGjdpnTcxD9ZHVjWKptprBNHjjYZRmchWrf8YraTkK1
X-Gm-Gg: ATEYQzzOrAZTng9vtP73Q4rkNVoP8BA3JWKSkBmhNxKQ5gdS5jHDKYGUDgRMjQOqoTh
	PjNSqzxqsfe+z6GacTBk56Napogfl2JVhIof1ygi1XAYktn4fO3Gew2zEan3tIhNV9OOQxdtrPl
	fl6zA0WUFV37+Mbdy2kY5u24T8U1xy/haZxgaZQJe1/S7jVafZu8rVD4f/MoTnwS9inpCutrBFB
	oZteU+/pRChpCP4rWawALG/8lu6EGDtJLBZ1GX/RLxZgXjCtbgOnGNf4G0PGsJXaT094yaPSJvu
	rw7cUN23n/j17S/DMvBYqNH5DxKdF+lHhuApYuc83DJe4g3YFWIpuamQ1RQ28UduwUXdCdHoMJn
	9n4lKMwLGDM3O34GHJDlHtgxz+892symJK/Z6NQXZSXJmxKDbMNiLQnH38El91jRDhOhgO5pCHb
	L2Ms2FII2UkegLCOl6+FGmrlcfzeMQKJ66MVws
X-Received: by 2002:a05:6a00:2eaa:b0:829:793f:da6c with SMTP id d2e1a72fcca58-82a8c3003f9mr5602450b3a.39.1774108563014;
        Sat, 21 Mar 2026 08:56:03 -0700 (PDT)
Received: from LIB-LAP-0152.lan ([2409:40f2:152:64db:42fe:9b57:813e:75c2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409b455sm4907409b3a.28.2026.03.21.08.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:56:02 -0700 (PDT)
From: Chethan C <mail.chethanc@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chethan C <mail.chethanc@gmail.com>,
	Osama Albahrani <osalbahr@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] staging: media: av7110: fix coding style
Date: Sat, 21 Mar 2026 21:25:29 +0530
Message-Id: <20260321155544.548537-1-mail.chethanc@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56603-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,suse.com,linux.intel.com,gmail.com,ideasonboard.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,d.id:url]
X-Rspamd-Queue-Id: 9252B2E63E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fixed Indentation, Alignment issues reported by checkpatch.pl.

Renamed enum av7110_rec_play_state, av7110_type_rec_play_format,
av7110_encoder_command and wss_data from camel case to upper case
underscore style to comply kernel style guidelines.

Signed-off-by: Chethan C <mail.chethanc@gmail.com>
---
v4:
        - fixed the coding style issue reported by checkpatch.pl

v3:
        - fixed the coding style and alignment issues reported
                by checkpatch.pl
        - Renamed av7110_pid_command,av7110_type_rec_play_format,
                av7110_encoder_command to follow kernel naming
                style
v2:
        - fixed indentation issues reported by checkpatch.pl
        - Rename av7110_rec_play_state to follow kernel naming style
---
 drivers/staging/media/av7110/av7110.c     |  20 ++--
 drivers/staging/media/av7110/av7110.h     |   2 +-
 drivers/staging/media/av7110/av7110_av.c  | 117 +++++++++++++++++-----
 drivers/staging/media/av7110/av7110_ca.c  |   2 +-
 drivers/staging/media/av7110/av7110_hw.h  |  70 ++++++-------
 drivers/staging/media/av7110/av7110_ir.c  |   2 +-
 drivers/staging/media/av7110/av7110_v4l.c |  12 +--
 7 files changed, 144 insertions(+), 81 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..86a654cc2b63 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -121,19 +121,19 @@ static void init_av7110_av(struct av7110 *av7110)
 	if (ret < 0)
 		pr_err("cannot set internal volume to maximum:%d\n", ret);
 
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetMonitorType,
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_MONITOR_TYPE,
 			    1, (u16)av7110->display_ar);
 	if (ret < 0)
 		pr_err("unable to set aspect ratio\n");
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetPanScanType,
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_PANSCAN_TYPE,
 			    1, av7110->display_panscan);
 	if (ret < 0)
 		pr_err("unable to set pan scan\n");
 
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 2, wss_cfg_4_3);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_WSS_CONFIG, 2, 2, wss_cfg_4_3);
 	if (ret < 0)
 		pr_err("unable to configure 4:3 wss\n");
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 3, wss_cfg_16_9);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_WSS_CONFIG, 2, 3, wss_cfg_16_9);
 	if (ret < 0)
 		pr_err("unable to configure 16:9 wss\n");
 
@@ -717,7 +717,7 @@ static inline int SetPIDs(struct av7110 *av7110, u16 vpid, u16 apid, u16 ttpid,
 	if (av7110->audiostate.bypass_mode)
 		aflags |= 0x8000;
 
-	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, MultiPID, 6,
+	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, AV7110_MULTI_PID, 6,
 			     pcrpid, vpid, apid, ttpid, subpid, aflags);
 }
 
@@ -785,7 +785,7 @@ static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 		av7110_p2t_init(&av7110->p2t_filter[dvbdmxfilter->index], dvbdmxfeed);
 	}
 
-	buf[0] = (COMTYPE_PID_FILTER << 8) + AddPIDFilter;
+	buf[0] = (COMTYPE_PID_FILTER << 8) + AV7110_ADD_PID_FILTER;
 	buf[1] = 16;
 	buf[2] = dvbdmxfeed->pid;
 	buf[3] = mode;
@@ -828,7 +828,7 @@ static int StopHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 
 	av7110->handle2filter[handle] = NULL;
 
-	buf[0] = (COMTYPE_PID_FILTER << 8) + DelPIDFilter;
+	buf[0] = (COMTYPE_PID_FILTER << 8) + AV7110_DEL_PID_FILTER;
 	buf[1] = 1;
 	buf[2] = handle;
 	ret = av7110_fw_request(av7110, buf, 3, answ, 2);
@@ -873,7 +873,7 @@ static int dvb_feed_start_pid(struct dvb_demux_feed *dvbdmxfeed)
 
 	if (dvbdmxfeed->pes_type < 2 && npids[0])
 		if (av7110->fe_synced) {
-			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, AV7110_SCAN, 0);
 			if (ret)
 				return ret;
 		}
@@ -1911,11 +1911,11 @@ static int av7110_fe_lock_fix(struct av7110 *av7110, enum fe_status status)
 			av7110->pids[DMX_PES_TELETEXT], 0,
 			av7110->pids[DMX_PES_PCR]);
 		if (!ret)
-			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, AV7110_SCAN, 0);
 	} else {
 		ret = SetPIDs(av7110, 0, 0, 0, 0, 0);
 		if (!ret) {
-			ret = av7110_fw_cmd(av7110, COMTYPE_PID_FILTER, FlushTSQueue, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PID_FILTER, AV7110_FLUSH_TS_QUEUE, 0);
 			if (!ret)
 				ret = av7110_wait_msgstate(av7110, GPMQBusy);
 		}
diff --git a/drivers/staging/media/av7110/av7110.h b/drivers/staging/media/av7110/av7110.h
index b584754f4be0..20776809e2f3 100644
--- a/drivers/staging/media/av7110/av7110.h
+++ b/drivers/staging/media/av7110/av7110.h
@@ -244,7 +244,7 @@ struct av7110 {
 	video_size_t		 video_size;
 
 	u16			wssMode;
-	u16			wssData;
+	u16			wss_data;
 
 	struct infrared		ir;
 
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 2993ac43c49c..c666fb221179 100644
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
+				    AV7110_AUDIO_PES, 0);
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
+				    AV7110_VIDEO_PES,
+				    0);
 		break;
 
 	case RP_AV:
@@ -141,7 +150,12 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 				       dvbdmx->pesfilter[1]->pid,
 				       dvb_filter_pes2ts_cb,
 				       (void *)dvbdmx->pesfilter[1]);
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110,
+				    COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_RECORD,
+				    2,
+				    AV7110_AV_PES,
+				    0);
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
+				    COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_PLAY,
+				    2,
+				    AV7110_AUDIO_PES,
+				    0);
 		break;
 	case RP_VIDEO:
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+		ret = av7110_fw_cmd(av7110,
+				    COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_PLAY,
+				    2,
+				    AV7110_VIDEO_PES,
+				    0);
 		av7110->sinfo = 0;
 		break;
 	case RP_AV:
 		av7110->sinfo = 0;
-		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, AV_PES, 0);
+		ret = av7110_fw_cmd(av7110,
+				    COMTYPE_REC_PLAY,
+				    AV7110_REC_PLAY_PLAY,
+				    2,
+				    AV7110_AV_PES,
+				    0);
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
+					    COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_PLAY,
+					    2,
+					    AV7110_AUDIO_PES,
+					    0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Play, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110,
+					    COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_PLAY,
+					    2,
+					    AV7110_VIDEO_PES,
+					    0);
 			break;
 		case RP_NONE:
 			ret = av7110_set_vidmode(av7110, av7110->vidmode);
@@ -208,10 +247,20 @@ int av7110_av_stop(struct av7110 *av7110, int av)
 		av7110->rec_mode &= ~av;
 		switch (av7110->rec_mode) {
 		case RP_AUDIO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
+			ret = av7110_fw_cmd(av7110,
+					    COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_RECORD,
+					    2,
+					    AV7110_AUDIO_PES,
+					    0);
 			break;
 		case RP_VIDEO:
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, VideoPES, 0);
+			ret = av7110_fw_cmd(av7110,
+					    COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_RECORD,
+					    2,
+					    AV7110_VIDEO_PES,
+					    0);
 			break;
 		case RP_NONE:
 			break;
@@ -325,7 +374,7 @@ int av7110_set_vidmode(struct av7110 *av7110, enum av7110_video_mode mode)
 
 	dprintk(2, "av7110:%p\n", av7110);
 
-	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, LoadVidCode, 1, mode);
+	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_LOAD_VID_CODE, 1, mode);
 
 	if (!ret && !av7110->playing) {
 		ret = ChangePIDs(av7110, av7110->pids[DMX_PES_VIDEO],
@@ -333,7 +382,7 @@ int av7110_set_vidmode(struct av7110 *av7110, enum av7110_video_mode mode)
 			   av7110->pids[DMX_PES_TELETEXT],
 			   0, av7110->pids[DMX_PES_PCR]);
 		if (!ret)
-			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, Scan, 0);
+			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, AV7110_SCAN, 0);
 	}
 	return ret;
 }
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
+						    COMTYPE_REC_PLAY,
+						    AV7110_REC_PLAY_STOP,
+						    0);
 				if (ret)
 					break;
 				av7110->playing &= ~RP_VIDEO;
@@ -1184,7 +1236,10 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_FREEZE:
 		av7110->videostate.play_state = VIDEO_FREEZED;
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Pause, 0);
+			ret = av7110_fw_cmd(av7110,
+					    COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_PAUSE,
+					    0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FREEZE, 1);
 		if (!ret)
@@ -1193,7 +1248,10 @@ static int dvb_video_ioctl(struct file *file,
 
 	case VIDEO_CONTINUE:
 		if (av7110->playing & RP_VIDEO)
-			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Continue, 0);
+			ret = av7110_fw_cmd(av7110,
+					    COMTYPE_REC_PLAY,
+					    AV7110_REC_PLAY_CONTINUE,
+					    0);
 		if (!ret)
 			ret = vidcom(av7110, AV_VIDEO_CMD_PLAY, 0);
 		if (!ret) {
@@ -1248,7 +1306,7 @@ static int dvb_video_ioctl(struct file *file,
 		if (ret < 0)
 			break;
 		av7110->videostate.display_format = format;
-		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetPanScanType,
+		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_PANSCAN_TYPE,
 				    1, av7110->display_panscan);
 		break;
 	}
@@ -1259,7 +1317,7 @@ static int dvb_video_ioctl(struct file *file,
 			break;
 		}
 		av7110->display_ar = arg;
-		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetMonitorType,
+		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_MONITOR_TYPE,
 				    1, (u16)arg);
 		break;
 
@@ -1291,7 +1349,7 @@ static int dvb_video_ioctl(struct file *file,
 		//note: arg is ignored by firmware
 		if (av7110->playing & RP_VIDEO)
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Scan_I, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_SCAN_I, 2, AV7110_AV_PES, 0);
 		else
 			ret = vidcom(av7110, AV_VIDEO_CMD_FFWD, arg);
 		if (!ret) {
@@ -1303,7 +1361,12 @@ static int dvb_video_ioctl(struct file *file,
 	case VIDEO_SLOWMOTION:
 		if (av7110->playing & RP_VIDEO) {
 			if (av7110->trickmode != TRICK_SLOW)
-				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Slow, 2, 0, 0);
+				ret = av7110_fw_cmd(av7110,
+						    COMTYPE_REC_PLAY,
+						    AV7110_REC_PLAY_SLOW,
+						    2,
+						    0,
+						    0);
 			if (!ret)
 				ret = vidcom(av7110, AV_VIDEO_CMD_SLOW, arg);
 		} else {
@@ -1329,15 +1392,15 @@ static int dvb_video_ioctl(struct file *file,
 		av7110_ipack_reset(&av7110->ipack[1]);
 		if (av7110->playing == RP_AV) {
 			ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-					    __Play, 2, AV_PES, 0);
+					    AV7110_REC_PLAY_PLAY, 2, AV7110_AV_PES, 0);
 			if (ret)
 				break;
 			if (av7110->trickmode == TRICK_FAST)
 				ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY,
-						    __Scan_I, 2, AV_PES, 0);
+						    AV7110_REC_PLAY_SCAN_I, 2, AV7110_AV_PES, 0);
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
+					    AV7110_REC_PLAY_PLAY, 2, AV7110_AV_PES, 0);
 		break;
 
 	case AUDIO_SET_ID:
diff --git a/drivers/staging/media/av7110/av7110_ca.c b/drivers/staging/media/av7110/av7110_ca.c
index 63d9c97a5190..9413a6a7f387 100644
--- a/drivers/staging/media/av7110/av7110_ca.c
+++ b/drivers/staging/media/av7110/av7110_ca.c
@@ -307,7 +307,7 @@ static int dvb_ca_ioctl(struct file *file, unsigned int cmd, void *parg)
 			mutex_unlock(&av7110->ioctl_mutex);
 			return -EINVAL;
 		}
-		av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, SetDescr, 5,
+		av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, AV7110_SET_DESCR, 5,
 			      (descr->index << 8) | descr->parity,
 			      (descr->cw[0] << 8) | descr->cw[1],
 			      (descr->cw[2] << 8) | descr->cw[3],
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/media/av7110/av7110_hw.h
index d4579f411c56..f9557c4245ba 100644
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
+	AV7110_AV_PES
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
+	AV7110_FLUSH_TS_QUEUE
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
+	AV7110_SET_WSS_CONFIG
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
@@ -452,7 +452,7 @@ static inline int SendDAC(struct av7110 *av7110, u8 addr, u8 data)
 
 static inline int av7710_set_video_mode(struct av7110 *av7110, int mode)
 {
-	return av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetVidMode, 1, mode);
+	return av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_VID_MODE, 1, mode);
 }
 
 static inline int vidcom(struct av7110 *av7110, u32 com, u32 arg)
diff --git a/drivers/staging/media/av7110/av7110_ir.c b/drivers/staging/media/av7110/av7110_ir.c
index 68b3979ba5f2..16b8ac5ab5a1 100644
--- a/drivers/staging/media/av7110/av7110_ir.c
+++ b/drivers/staging/media/av7110/av7110_ir.c
@@ -71,7 +71,7 @@ int av7110_set_ir_config(struct av7110 *av7110)
 {
 	dprintk(4, "ir config = %08x\n", av7110->ir.ir_config);
 
-	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, SetIR, 1,
+	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, AV7110_SET_IR, 1,
 			     av7110->ir.ir_config);
 }
 
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/media/av7110/av7110_v4l.c
index 200a7a29ea31..94283c5254f6 100644
--- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -597,13 +597,13 @@ static int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *fh,
 	if (f->fmt.sliced.service_set & V4L2_SLICED_WSS_625) {
 		/* WSS controlled by userspace */
 		av7110->wssMode = 1;
-		av7110->wssData = 0;
+		av7110->wss_data = 0;
 	} else {
 		/* WSS controlled by firmware */
 		av7110->wssMode = 0;
-		av7110->wssData = 0;
+		av7110->wss_data = 0;
 		return av7110_fw_cmd(av7110, COMTYPE_ENCODER,
-				     SetWSSConfig, 1, 0);
+				     AV7110_SET_WSS_CONFIG, 1, 0);
 	}
 	return 0;
 }
@@ -623,10 +623,10 @@ static ssize_t av7110_vbi_write(struct file *file, const char __user *data, size
 	if ((d.id != 0 && d.id != V4L2_SLICED_WSS_625) || d.field != 0 || d.line != 23)
 		return -EINVAL;
 	if (d.id)
-		av7110->wssData = ((d.data[1] << 8) & 0x3f00) | d.data[0];
+		av7110->wss_data = ((d.data[1] << 8) & 0x3f00) | d.data[0];
 	else
-		av7110->wssData = 0x8000;
-	rc = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 1, av7110->wssData);
+		av7110->wss_data = 0x8000;
+	rc = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_WSS_CONFIG, 2, 1, av7110->wss_data);
 	return (rc < 0) ? rc : count;
 }
 
-- 
2.25.1


