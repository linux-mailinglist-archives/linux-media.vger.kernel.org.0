Return-Path: <linux-media+bounces-57684-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEERHNjhymnEAwYAu9opvQ
	(envelope-from <linux-media+bounces-57684-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 22:49:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CFE361264
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 22:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DFD53040215
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 20:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4750F3A1680;
	Mon, 30 Mar 2026 20:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQzuk+1n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D58839BFF1
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 20:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774903280; cv=none; b=UBdbOJRhfGKfMyIUaaMuIt/C57lm6xvwePBACieyLFhm6jLI/ln7m1zXYveiARL1DiTGGw9k8AIN2+IyI9hlBjHUdVCKkkUiRCbiCg83zYjEMKRghn24PjEE1J+c98NhuXGIF5znb7gY1X8n63mnaeWNC4ztQiinFKTrbOA81Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774903280; c=relaxed/simple;
	bh=h2Y7hBwDqJlVlqsoD2kdysFT1E3Rpe9taVIjJ4DrbUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqfjLbaRfkSWzcZ0lEtVGjb/cGeZnDtffmpsKTHLp7g4lsZJJNCvWJ4s7LWuvdw6r+2UwI9nWK1/+OPffXBgYqfR2q4FcRtd/+7JvaYM17YmGb7x1IlqvO9Sl7hCano3zdMYI4+M3x+RCZInSVngtGrwo8oA01Lo3R2K5KOG5iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQzuk+1n; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a871daa98fso37818705ad.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 13:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774903279; x=1775508079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F4ElIH0M0rHCyGbmK8ZHM2z6I4vEqFy/h6gjPeV4VGY=;
        b=HQzuk+1nK+FxNlumPYjzoXRizsNQXhWB37WsZFCNyyVxAOmOj27TgdOSZ0AlA4bsrE
         nYcVWeCqZEoSl313UEDhUrAL4lecy+VZSk4f3XAB030ZOMZlzeo+ApWUmQzvbYZCnoUE
         7r9+DEnV9tpVIr1hhjyPdSz7Vow87qYuZP1xQX544PYU0TcGsz5uTIb52FmfJKAy/4Mj
         M4tDusPahOhSHzPi06y/sQnM1+KEOOF8opKRMVrkqF4QS7V02tVBKHjHry0W3sEbR/Fq
         NcgAihImENZKn7CBY6SiXOP3UduMLntzZEQkjb1iEEYOin0ywM/57VAXCdrDWuJNrM8s
         U34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903279; x=1775508079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4ElIH0M0rHCyGbmK8ZHM2z6I4vEqFy/h6gjPeV4VGY=;
        b=Azd9xiuvzCxB5ZDL/BIhu1fkTmPbJqJi1sSGyX7U8/sK0+k1hUJz6XO0ZLlXEbxCN1
         RbRx7xhPcx0zwuXsZSGud08Tej8bELe5+Zeg87+Yeqb+JBPX27gvGsgAPB7niN/5Hy45
         ua0+f6IS+V+L+vFsAGYH0lfibzi/NPYTnQAFScTX3t+9l09J3chCDUG5K1aXaLNR/r5B
         uL0Fok2gfDw/As5urFb4ZUMF+c4HI3+Jl/zc7k3ZAGp3fB5/TRCyIuriUq9lu/RZWWh0
         hk/KoPhY3XiYyYP0UbAzd4Q5nH8towclxYB4CoRdbPOYvbVnitQYBlsn9seuDQfVgT+q
         PH/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAP2caN3dIXQm0J6C+rB1pLpXpntp3/bkklvxG7XbeUpK7iim6C8LH4bm7FBAGj+3KhGZPfdDB3P4WoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwljIAm64aMro4zlKTWX5sDi2Q8ciiP47ROqL4cCuTqujcBFKWo
	LQMHIQWgfdsukYxedtoVViHdR5ai43dtCZonXED7SDPr3RGEu99T6KruyJVzBq8c
X-Gm-Gg: ATEYQzzGO1WkcUv6/uzmSSOoMgD/X0+ACktj6gd4hRiOQnXKHJzmOn70Idafa7XnvRk
	TsMG4zdnO4JKPJdLDCBC32LX/tkQtnd8KqaxJTWsCVaBbu1OcZeygkwRyRMD/0O1jaiLQ4zReXB
	/P1CLuhO6MY2WZJv+EluaCeol+OnIP49/h4G3Ot9MYDKPfrZaRQZep4d+tiSTqTs27vW6WTPqYx
	gzUrxd+1uqVRliC4hWWnEoe9DFb0pH17f7FJaRfhNFKjvf1DRbRnqRXYQhYSJXn+uYl2KiHmMKe
	VYoItRxudhoZL41vnTGexKUzC0Iz9gcRQJiLYetfERFbBaq8rSySFtMqvtG9ACYRKOJn+F6nJJ3
	KCwSCjtU+G1x6LDQ0BrspaWK3uA1cA5KfF9VfdB09GgcUKATJcTOZWC+DWYmNSqR5HT9qwAKgKa
	EVbOqB5QYoSNCZkO0hF9No+JJc
X-Received: by 2002:a17:903:37cf:b0:2b0:659e:97bb with SMTP id d9443c01a7336-2b0cdd104e6mr138195835ad.46.1774903278726;
        Mon, 30 Mar 2026 13:41:18 -0700 (PDT)
Received: from ganesha.. ([106.51.225.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24b02a11esm78081095ad.65.2026.03.30.13.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:41:18 -0700 (PDT)
From: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	Sudarshan Srinivasan <ss22.kern.dev@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: media: av7110: coding style fixes: too many tabs
Date: Tue, 31 Mar 2026 02:10:24 +0530
Message-ID: <20260330204035.22074-1-ss22.kern.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57684-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ss22kerndev@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: C5CFE361264
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch fixes below warning reported by checkpatch.pl
WARNING: Too many leading tabs - consider code refactoring

Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
---
PATCH v3 consolidates and addresses review comments from earlier versions.

v3:
  - Removed the additional tabs in handle_ts_memory_fe() as indicated by Greg KH
  - Retained the original code style as suggested by Dan Carpenter
v2:
  - Refactored change by adding function handle_ts_memory_fe

v2: https://lore.kernel.org/linux-staging/20260318191149.109616-1-ss22.kern.dev@gmail.com/
v1: https://lore.kernel.org/linux-staging/20260316152340.238100-1-ss22.kern.dev@gmail.com/


 drivers/staging/media/av7110/av7110.c | 33 +++++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..35f7d6bb8c74 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -932,6 +932,28 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
 	return ret;
 }

+static int handle_ts_memory_fe(struct dvb_demux_feed *feed,
+			       struct dvb_demux *demux,
+			       struct av7110 *av7110)
+{
+	int ret = 0;
+
+	if (feed->pes_type >= 2)
+		return 0;
+
+	if ((demux->pids[0] & 0x8000) || (demux->pids[1] & 0x8000))
+		return 0;
+
+	dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
+	dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
+
+	ret = av7110_av_start_play(av7110, RP_AV);
+	if (!ret)
+		demux->playing = true;
+
+	return ret;
+}
+
 static int av7110_start_feed(struct dvb_demux_feed *feed)
 {
 	struct dvb_demux *demux = feed->demux;
@@ -951,16 +973,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
 		    (feed->pes_type <= DMX_PES_PCR)) {
 			switch (demux->dmx.frontend->source) {
 			case DMX_MEMORY_FE:
-				if (feed->ts_type & TS_DECODER)
-					if (feed->pes_type < 2 &&
-					    !(demux->pids[0] & 0x8000) &&
-					    !(demux->pids[1] & 0x8000)) {
-						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
-						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
-						ret = av7110_av_start_play(av7110, RP_AV);
-						if (!ret)
-							demux->playing = 1;
-					}
+				ret = handle_ts_memory_fe(feed, demux, av7110);
 				break;
 			default:
 				ret = dvb_feed_start_pid(feed);
--
2.43.0


