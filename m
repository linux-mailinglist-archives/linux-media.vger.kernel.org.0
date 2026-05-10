Return-Path: <linux-media+bounces-61014-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EPbAbwyAGpAEQEAu9opvQ
	(envelope-from <linux-media+bounces-61014-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 09:24:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 662EC502F2C
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 09:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D119D300AEE9
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 07:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF858361666;
	Sun, 10 May 2026 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CI1RNIVj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0DE214A9B
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 07:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778397880; cv=none; b=ptTeUU0YtpwuVeanGaEAQGHlBxhcuVE3Bmuyo5v0z5cu1NlRo2CdmrQomMcx3nUs/GaPDgafNzngwVzWOG2VrxEifMC/WoAHdjPbrxgcEDCh5rX8dOmHYD3o7O7f6G1p9LSb6u57MZ/LwEsyFlgAHpmwEPu9N9r5PpttXKQEATY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778397880; c=relaxed/simple;
	bh=ZN+rnf9IlZfdljMMe+2pZP2fRETzi/gGpb6q56acdNg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MTnrnGuTLF/B6tlIYlSpBmpXnRhqbSfguMgLE5zUlHlTs//ywu5CkJEmQ+gTGDBR/cgVmg4rzRK80n1yYZSydeCTmaDHMKVNuoayPMs0lx5jBYdkh0sYSZSHRF/+h3AOpPtTYy9b5bncT33PLeoQKIE+6Rwayn0whD86QIIygcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CI1RNIVj; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-366375c4076so1352249a91.3
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 00:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778397878; x=1779002678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IC3PTWC1dIvQid0I/PeI5EZxV160ZDKd7RDV/vYwlM0=;
        b=CI1RNIVj9XmHsw70oJH4rtYV2hRh0SP/tPZ7OQFsA9xbbCiZrPpADXHR/OVdoipqHp
         Qne64TAtl56ULewIQldJUUq7sWAK80H+77trJuwklyxs4BgDQl76yfXqugVO1O9TPjMK
         uxAvVOd/sAlXNIseWIRyhg9aJHVjwzkXGySvLafrZAsw3LnCdzGv3joe1LIhqZRkX4z2
         tK2kHABhH1+Xj2mQSCwlBWgRUti5Y81VAAGFYUd6IBGaEMTraWXoJk2t09eueS2ubg5X
         sWNZfov9Jay4LvTh3UiWkJn9gFfUG31HFPrWV3pBCQUDcRjTUmy0K9tks4ayKGnRZJ0Q
         tToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778397878; x=1779002678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IC3PTWC1dIvQid0I/PeI5EZxV160ZDKd7RDV/vYwlM0=;
        b=iKadr14OHl5baf53e8r3GYR1j2NO7egP/eJIP3swzQ6XjxZg83EOsju4UZVd8s0T5a
         PQXMkVeJk9WgVXpTH+clero641E5nY2M6S4XfmF5T1cxDYXIgzPPk8xkg1Sf+l55aOaK
         cS0qA/NRCnJjDisF29vwnDLxTRjgfIuVTyKQGsTz2pRLxpszcNl19aLSVoHl2hbHQ+po
         a0AgQDwrwlqA319W06nOrAJw2OytdEDjC2wSQnF7yQjaBr1THaxPkoiorJWJjqIS7e41
         VJIBOXgurWHcNoP2zvOcXO6vkLD9F2XhDUlBGwGZs936JsPCp/eFHuXBXdsgNwHecsgm
         diPQ==
X-Gm-Message-State: AOJu0YyHewmQaE0LmCGISSkF1sDtwB9Zp4eBWHe58rxaP96hi+Qb8rdk
	m/gTtGezAVYaDKsNHjDw0ThBDSLTzhFPuY4Zk0trYu5qLqOHDmaShL8wf5yWUE50Wxo=
X-Gm-Gg: Acq92OHB8HkQhQ/NO9OlLzTc81zvNHZ4IyBd4Oz/dMJchpnqwukkugXSfG+CelCTTop
	fZGz2VCDKaeUwkHeBpMIZonUn6Eog4uQG/7W2l+kmNy1Shuu99KoUY2m3voSRNuEU3TdVRg5x18
	MuD85JcTApu1Og7yCjyCRIv27vmcDK7KCDp7uF/bMNJf19yRoBqfN6Vq704+otQIUEqeEuUt84z
	tw7iO4chVmhvOppqcxTEAOPN1uVVG7+cShAbrn5Ki5ia0IEY4gtdsoTfdhBJa87vLE0v8n+zo3R
	NjgueDYDJfh4VRn3xPbxR+e9g5VqL2V9lz6GD4z1x67UXONjQ1PLZKsB3zitPXCFRDOlDftbfJh
	uN+pRpnpdVQRs22FBXdhRi6Ahppd+gc8psBLMdGYdQCtlQnUxO2RHyG/QbCK2zdKY37rSYqFkq4
	v69P0SrwHjMvZq4BxSIi8uw/AUb8U2o6rRnWKkSv9h/1N+7mMVP9wfumwuJE0zgOg23FHGJ5cvB
	X+9FlyFMzevEQ==
X-Received: by 2002:a17:90b:1b12:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-367d3c75385mr4918217a91.0.1778397878011;
        Sun, 10 May 2026 00:24:38 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([203.194.96.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be2c82c7sm1743578a91.7.2026.05.10.00.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 00:24:37 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>,
	syzbot+f9f333782a8f54509322@syzkaller.appspotmail.com
Subject: [PATCH] media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
Date: Sun, 10 May 2026 07:24:18 +0000
Message-Id: <20260510072418.38636-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 662EC502F2C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,syzkaller.appspotmail.com];
	TAGGED_FROM(0.00)[bounces-61014-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mokshpanicker7@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,f9f333782a8f54509322];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,appspotmail.com:email,syzkaller.appspot.com:url]
X-Rspamd-Action: no action

When mxl111sf_ctrl_msg() is called during early probe, state->d
may not yet be initialized, causing a null pointer dereference in
dvb_usbv2_generic_write() when it accesses d->usb_mutex.

Add a null check for d before proceeding with the USB transfer.

Fixes: d90b336f3f65 ("[media] mxl111sf: Fix driver to use heap allocate buffers for USB messages")
Reported-by: syzbot+f9f333782a8f54509322@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f9f333782a8f54509322
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/mxl111sf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 870ac3c8b085..9908675c355e 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -56,6 +56,9 @@ int mxl111sf_ctrl_msg(struct mxl111sf_state *state,
 	int wo = (rbuf == NULL || rlen == 0); /* write-only */
 	int ret;
 
+	if (!d)
+		return -ENODEV;
+
 	if (1 + wlen > MXL_MAX_XFER_SIZE) {
 		pr_warn("%s: len=%d is too big!\n", __func__, wlen);
 		return -EOPNOTSUPP;
-- 
2.34.1


