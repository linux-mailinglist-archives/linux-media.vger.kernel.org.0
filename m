Return-Path: <linux-media+bounces-56893-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPU5I4W9wmlflQQAu9opvQ
	(envelope-from <linux-media+bounces-56893-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:36:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B169C31918B
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 52A533074F70
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 16:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D7E3EC2E6;
	Tue, 24 Mar 2026 16:20:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tpz.ru (unknown [109.236.72.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2994282F04;
	Tue, 24 Mar 2026 16:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.236.72.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369227; cv=none; b=AbcMj4rNLpxOfglMHksEBPiKY8G7sjKgsOJTNz+GdHVn1JrvIBqpJKIxkD9fkuGVZSl/QtoEM1oWlPVBJciXO5idv8CK2dTJi7bAV5tp3s3cDal5cxpRAVj8H+HShZ9Q7PihoWOKz1Fh6oqoQA0+gylH8dSCJ8ArBBYAHJSy9Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369227; c=relaxed/simple;
	bh=uvuEnpo9EGl+hoaLG86C+hdGDJiVEJNPV8+6VEDdHfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fkkD8FOPuCnZirVmqitWR1PhvELi0oLu9739KDklbs9fZhx+KRkZ7kGtEAH3mL80X7LTH/cfrHeNV+BiQkZlLjR5xT1iVQ6L5WT6g+u3yRmIuB8YTCMpJsVGMvubxCojFfrG10+BaOpvUHc971lPvXjYPEgFOoz50PKpwUEQ0qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tpz.ru; spf=pass smtp.mailfrom=tpz.ru; arc=none smtp.client-ip=109.236.72.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tpz.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tpz.ru
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mx1.tpz.ru (Postfix) with ESMTPSA id 4fgFRR0LLFzXhML;
	Tue, 24 Mar 2026 19:12:03 +0300 (MSK)
From: Ilya Krutskih <devsec@tpz.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ilya Krutskih <devsec@tpz.ru>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-patches@linuxtesting.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH v5] media: dvb: mb86a16: fix array overflow in mb86a16_set_fe()
Date: Tue, 24 Mar 2026 16:11:45 +0000
Message-ID: <20260324161146.532632-1-devsec@tpz.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56893-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[tpz.ru];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[devsec@tpz.ru,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B169C31918B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The size of prev_swp_freq[] is a fixed constant unrelated to
the number of possible detection attempts. Index 'prev_freq_num'
of array 'prev_swp_freq' is incremented by each step in cycle.
If index exceeds the total length of array, an out-of-bounds
access might happen, in case of repeated unsuccessful signal
acquisition. Add check to prevent this.

Cc: stable@vger.kernel.org
Fixes: 41e840b13e11 ("V4L/DVB (13699): [Mantis, MB86A16] Initial checkin: Mantis, MB86A16")
Signed-off-by: Ilya Krutskih <devsec@tpz.ru>
---
v2: Add check for array's length on each cycle step,
edit patch description, edit tag 'fixes'.
https://lore.kernel.org/all/20251211172251.852254-1-devsec@tpz.ru/
v3: Edit condition to > ARRAY_SIZE() - 1, add a reason because of
overflow can happen in description of patch
v4: Edit condition to >= ARRAY_SIZE()
v5: delete unnecessary check after incrementing

 drivers/media/dvb-frontends/mb86a16.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/dvb-frontends/mb86a16.c b/drivers/media/dvb-frontends/mb86a16.c
index 9033e39d75f4..5fabb6b884b5 100644
--- a/drivers/media/dvb-frontends/mb86a16.c
+++ b/drivers/media/dvb-frontends/mb86a16.c
@@ -1157,6 +1157,10 @@ static int mb86a16_set_fe(struct mb86a16_state *state)
 		v = 0;
 
 		while (loop == 1) {
+			if (prev_freq_num >= ARRAY_SIZE(prev_swp_freq)) {
+				dprintk(verbose, MB86A16_ERROR, 1, "Signal detection retry attempts failed");
+				return -1;
+			}
 			swp_info_get(state, fOSC_start, state->srate,
 				     v, R, swp_ofs, &fOSC,
 				     &afcex_freq, &AFCEX_L, &AFCEX_H);
-- 
2.43.0


