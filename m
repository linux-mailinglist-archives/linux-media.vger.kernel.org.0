Return-Path: <linux-media+bounces-52339-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPlLAG2jh2lSbAQAu9opvQ
	(envelope-from <linux-media+bounces-52339-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 21:41:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 916D0107170
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 21:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D64F9301ECC7
	for <lists+linux-media@lfdr.de>; Sat,  7 Feb 2026 20:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FD533E354;
	Sat,  7 Feb 2026 20:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnfSJyhS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDA3299A8F
	for <linux-media@vger.kernel.org>; Sat,  7 Feb 2026 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770496865; cv=none; b=dVLGYDLMtvk/jXQ2bsZF0xYReGMofazrZn8CgfE4qX+HrJAvcSWyvcVQhJx/ttZzeBkVYNedWXSqKPyLAFZO/kye6H5eDOuuVWrcl8XyBol3yq4C7vm4WfM4KvFdMhUCl5uzqvHJjMIJ2NOQ5psR0R8xfIbIopPtmKJVWrtMdl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770496865; c=relaxed/simple;
	bh=fmf+IvZXfTS9lX/mYWGHMR4VL6rH5CI1CROTGaxeIvc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UUk6XxCBwIGFSnSYBphdfj87ncQB0jmKvq75OAWD/AlIk6m6d6LSMCaxQuzLOA9tFgWgYMlZkWx/Ftdif9rphQTccqd5j2mrkluh2Az36bG2fsA1coxt8DFczMQT2MwHdKtLjT23Cl1D6Mk6hTsXc5/4sD/Es0EVNZPWvvn7ZKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnfSJyhS; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-8217d890bc3so128393b3a.1
        for <linux-media@vger.kernel.org>; Sat, 07 Feb 2026 12:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770496864; x=1771101664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RBpgTWXrKC/ep28TsDpXq3W1RYINh19dRkfUQIrLGfw=;
        b=hnfSJyhSExP5RNCoOx1PgqDrV1gjcqN6D1uReU5RyAQDEPPB6htaIrjcfEc7VjTkZR
         Jab2n32WDxyfabUmOARcO/chRN8L575PXnggBL1C0Y6I1ydNaGZVTKsiP2LCloInQVeu
         iZ5amYUgmvN2LnBiJCFxbK9CmZTnw2ysXBmUsLsa+629fyF0pWYQ75g9H3Vw+iqIjvvo
         y9L0Q6A1mK4S6QhK9TDMX1epgBr6R3i3q8zNUyvdAkrFgffDwA1Eqw7D9iAsV6RwfFZ/
         9eCVIQVaGyQQuK7gwMap7G/tn+W6UODe2tP0VD+KdeNM+IbPVzUIlgfHYd/FWEpjS7i9
         NraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770496864; x=1771101664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBpgTWXrKC/ep28TsDpXq3W1RYINh19dRkfUQIrLGfw=;
        b=Q4S1xjG3ByC3svkK1xGRXvPMkXou6YsGYvsSyxSLZADNrgZTmIa0pTyWTg0CYdk3PT
         StQxHMVhAQd0eQfm+Wjb5wZV/NRx3WUuvGKUW++UYM5aaKfhUJxu1S7Ps0raoX/kt/8m
         vouVV6eP2lsybDEcTxbA17cIXNA/nhXMTiPDod2IFQwB8ANLACVHW06GAC/De9LcFoQp
         vmie2PXi8chq40B0xyOWhbupd3pWBqHsN6hUK3pGWNx4tqw61gqsGErGoOqlxv2RY+oT
         tDecH0XcGwI5FNpHIq/yVcmk7T/LSiXRxuVvRH+e6TBHHDPqU8RFqLrTSi2i+q1Dgwx+
         Q0ag==
X-Gm-Message-State: AOJu0YyOGKE0EyqOnC2GS4REmNIGxwo8GTiiXeh6VVrUf+xI5s+H7o3e
	p622jt/WKufMg3Y1WbQKHxpLd3nRJsSyBOPLGziA9/dR0ZEy1Cj4a2+v
X-Gm-Gg: AZuq6aIWunOI7Y4URvgzupO+bJAsQT7Km2ivDun/hazov+Y0nRwoicFTObapxuxV6de
	DuwvexlApgZayG2VyZqMcfs2qbesUjYMTZszR/YTKgSlWtwOeiX5cG/GoVqWOe86V87znlYUIax
	K/O/Y9mYdUy4UBRawSMJ4PemjGNFO2H2rqAFIJgX/4d7skq+4zabbe/XgyY1bWqv2OC41IVqKA7
	rybl6Fp9dHF9Pj+s0AtTYLRw3mGou+aBtSmqhRfXWWqRbnCc+AeqQq9g0jTsnQVorP3yep0kMin
	42GW2Zbiw/Xj7dvRI0dRZDFc/8VItb0qpcwnf6JJfS7wX3uux58VSW0ULskJ8/oUm9Twt55k/5k
	GerD8sJ5aZIBAiF6+iZVCxeoE0DyrdMzIT2eQhD1dmJeZaUe7BlB+c0aCppRcrHXG8Onk6sSFfB
	jaPkyH5xVtNAJLLqAkkDaF/Q==
X-Received: by 2002:a05:6a00:2445:b0:81f:72ef:27f0 with SMTP id d2e1a72fcca58-824417290f8mr4730506b3a.6.1770496864281;
        Sat, 07 Feb 2026 12:41:04 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:c1fd:c804:a7:4f59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8244166f269sm6507008b3a.7.2026.02.07.12.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 12:41:03 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: dwlsalmeida@gmail.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Soham Kute <officialsohamkute@gmail.com>,
	syzbot+814c351d094f41a1b86@syzkaller.appspotmail.com
Subject: [PATCH] [PATCH v2] media: vidtv: fix general protection fault in vidtv_psi_ts_psi_write_into
Date: Sun,  8 Feb 2026 02:09:47 +0530
Message-Id: <20260207203947.4354-1-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52339-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[officialsohamkute@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,814c351d094f41a1b86];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 916D0107170
X-Rspamd-Action: no action

Add defensive validation for psi_write_args pointers to avoid
null pointer dereference reported by syzbot.

Reported-by: syzbot+814c351d094f41a1b86@syzkaller.appspotmail.com

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 2a51c898c..bac0ea03b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -156,7 +156,13 @@ static void vidtv_psi_set_sec_len(struct vidtv_psi_table_header *h, u16 new_len)
  * add stuffing (i.e. padding bytes) after the CRC
  */
 static u32 vidtv_psi_ts_psi_write_into(struct psi_write_args *args)
-{
+{	
+	if (!args || !args->dest_buf || !args->from ||
+	    !args->continuity_counter) {
+		pr_warn_once("%s: invalid write arguments\n", __func__);
+		return 0;
+	}
+
 	struct vidtv_mpeg_ts ts_header = {
 		.sync_byte = TS_SYNC_BYTE,
 		.bitfield = cpu_to_be16((args->new_psi_section << 14) | args->pid),
-- 
2.34.1


