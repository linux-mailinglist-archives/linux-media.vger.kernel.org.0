Return-Path: <linux-media+bounces-66574-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zB0PKSPFSGqrtgAAu9opvQ
	(envelope-from <linux-media+bounces-66574-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 10:32:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 413B17071B4
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 10:32:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KUf7BNMH;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66574-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66574-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5554F30125EE
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 08:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E872F290A;
	Sat,  4 Jul 2026 08:31:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6051739F19F
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 08:31:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153904; cv=none; b=HiwMl0IbynyIUM6932LlL3EbpW5xZUdSYUkn7+NQYjKTs2wz/WaeYxOwyf4C1Z+BOjRRMYsYWTvznGQYe+Ebtb85PFjqWVEzlfWsYFrw/KRV7SvZAIdrs1vuA7Ik/kawTIedHccVdG9Cb7U0DcMbbnREMLsO5AjMSCgltep88zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153904; c=relaxed/simple;
	bh=y6mNeTzCyc08DlRJ6m8uHGdrjccntn+S5pSqgS1q7kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9a6kKy9WCxwzNTrldVffOsvjsFNCAv7vP0BEKPBBMVE+nZoyrxVpX63aAihkW/Cci2nSEHPfDMbabXT+1a8JOdyaRVVSaKgbakWHRrY0dDgn71ET071l6ookPIiTTGixCeE7o5v7eNs1aiKGlAt9SGiJ+tWvmsp5VQzGYaPREo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUf7BNMH; arc=none smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383cb94f742so295030a91.3
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783153892; x=1783758692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SKjOfWBF6wFcd/KZhxMJdBWrz9gubI4LNJ7uJpHMQs=;
        b=KUf7BNMHz0ksjbzDNtXOeoCoo5wGaRDIdW/Tw1FrosXBIn9S/fPs8qwal4qxBQtnJI
         QpLns/KVgMACHn5e5XYyFZx1U1TfzckJq7eqvUzd/JWa2dgvPKDTYqYtk1YTSRmLwJvm
         UKiQfXUOKQNgqh7JyX8QoznocBCBBozAMnPObVwg5kE/1WOuS1w6sDMWgRp3TBxEIp+y
         Z2OdfxhL/zMpMp3dNFUIDcAKeWdYLxdNlsNu/wt1UMbw2nyATW3daj9xT1WgcqTFcmAd
         tEngJeiSkzzMTOt/WJRFeOdjQ6rKySiKBPPUeDyt96AfIdgYss4LQi/J4C6HnNOoUb5Q
         uI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783153892; x=1783758692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6SKjOfWBF6wFcd/KZhxMJdBWrz9gubI4LNJ7uJpHMQs=;
        b=Hxh/qPrTCj6j8eo/v/53cEmOxqLZ5Vt36kffXVXTSFJBsE00pI+na/ZXaDOFO0dibx
         hUYj58yG07vv4RQlGJZOXfcVkduROw3ZKInh5q5QvzOg/Cu/f7GP9b2sy3NgxspwtipR
         yBz1TjBT5ripTzh4XidzoV4OSQKoGM/cFJCVHZvuvrOOmLHp2DpM3SN7ytVjg6aE05oC
         rCU/u+4aFe42a20vUy/BNE7168wffLCLr11Du90hNUwHIJOC1by3sXZjROuhOEGKCtUP
         6pLKsEpqv7wQSVFGBmQwwpTREc4qXY1ZiysbS6h3yilB3IGM1qczEKNIFBVMvuPAaUkk
         GeAw==
X-Forwarded-Encrypted: i=1; AHgh+RqtaNabwRpyLIfgSLBm7NCRDmNWKrK5s6gQSF8fPnhCSsTgYd3q74MTjTpoWVRlxtzmWkF7Zb7Gm0iatg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT+lWK+mw2KqSR2DuSFFJTAFoAH9ZWBoCUovc4gxNWFLyeLzFu
	h0uUjoDH5RH1mTz6NyJRT4pq68BrMSJx3EbTK5VKCyHbKUuK8raZjkyD
X-Gm-Gg: AfdE7cnxZ292m24QqPDGCSL8q8aHpXhwK1aHfm6loJ0kHi0w99CYx6yepr4+iW8h1l1
	Dt0nhNfDNUJR7WL2LREr7LLbwh24bX//77lJIkDU0G9SKTQ1WK1tMINOjvIaMnsfBsNRQQOhbZr
	hXK/dJ07JHeecD0LlrmKWuqCM+395Oxm4Z1vQVdc0ubmaIDqANaVUzGF1LrVmnz6YRkaM9VAJlz
	ylOFElofJdDnJbDp/99ce0SNUmm5gQXxF3q/h+Puyj5tf3PmWISR2ej3h6IVtoOwwWoVJidd//i
	9+oVF//c9PGzflq0z53gLyw5VknwkTtXJlzH+ZW9pk2AyTOvL1Ky4eiGG0FAaIsf43t49tlMHus
	9Bfqk5ej7hCEfaJUNXWifwb2+K0fzWDl2StXBcL+qvf9JaD/lXpisFC+UmqSQ3ykwSwqdkRe8y7
	8d70hrE4q+TSZuxxaWnOapyWZCUd5iYSv7wpIZi104W8JvS7Qild71
X-Received: by 2002:a17:90b:4d88:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-3829d70cc3bmr2590824a91.16.1783153892139;
        Sat, 04 Jul 2026 01:31:32 -0700 (PDT)
Received: from primary ([223.181.23.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f376bf710sm10074745eec.6.2026.07.04.01.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:31:31 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	kernel-mentees@lists.linuxfoundation.org,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH 2/2] staging: media: ipu7: fix pm_runtime refcount leak in ipu7_resume()
Date: Sat,  4 Jul 2026 14:00:31 +0530
Message-ID: <20260704083031.8524-3-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260704083031.8524-1-vidhu.linux@gmail.com>
References: <20260704083031.8524-1-vidhu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org,lists.linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-66574-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:bingbu.cao@intel.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:kernel-mentees@lists.linuxfoundation.org,m:vidhu.linux@gmail.com,m:vidhulinux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vidhulinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vidhulinux@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 413B17071B4

ipu7_resume() calls pm_runtime_get_sync() before resuming the device.
If the runtime PM resume fails, the usage count remains incremented, but
the error path returns without dropping the reference.

Use pm_runtime_resume_and_get() instead, which balances the usage count
on failure and avoids the leak. Keep returning 0 on error, as resume
callbacks should not propagate failures to the PM core, matching the
behaviour of the ipu6 driver.

Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
 drivers/staging/media/ipu7/ipu7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 056af3a07507..48a35bda4237 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2702,7 +2702,7 @@ static int ipu7_resume(struct device *dev)
 	if (ret)
 		dev_err(dev, "IPC reset protocol failed!\n");
 
-	ret = pm_runtime_get_sync(&isp->psys->auxdev.dev);
+	ret = pm_runtime_resume_and_get(&isp->psys->auxdev.dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to get runtime PM\n");
 		return 0;
-- 
2.53.0


