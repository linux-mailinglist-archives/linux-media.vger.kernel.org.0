Return-Path: <linux-media+bounces-55939-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ/0C7MhuGmdZQEAu9opvQ
	(envelope-from <linux-media+bounces-55939-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 16:28:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBA029C59A
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 16:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77C35301AF45
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D299839F17D;
	Mon, 16 Mar 2026 15:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5bFTKX4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA7231E854
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 15:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674629; cv=none; b=qbHpMV/1HjZxv1xvoJ6wFvfnuZu3jJwyevObd+j3LCsZ1VpcPnIEDcYCZHqBJQothJfhheEX9lUpSNkQ9qWmDdDSTc1E4x4HzigOpg3x01yg7VF/h3dNnz3K0JW0O8tG8uLRg+LgtM2kRadDyVT0u62BPkOO15aEOpc60GrC8O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674629; c=relaxed/simple;
	bh=ZXea1BR+YN8HLwcz05IFzp7+H341TSXGtkUCMjAqUI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uwU7uIC4ma47BcOizrAe0NtQ4WWjaZKQuWNE3DuyZW3qgLOAaO9ad7JeEaKUEmPqI+7gUHl/nWYp1TCHd7aTjTZxnV3x7z2ytyLuw4uSQbNZbIFz4jM72qxOcti3BwL2HlOVRA7BVCyl+JaRXdtnJedzR/w1U2PCInn0Gvgxr3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5bFTKX4; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-829a9d08644so2749769b3a.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 08:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773674628; x=1774279428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5n5U8SF9tBDKp/G4y5GVvHf9wmA6XAYgGU0V4fhIFsw=;
        b=Q5bFTKX4dNrdp9E5E89xlFJlE0ZRmiNLybGCTeqYSJL8UolR2xja8JAksVDutGOtZj
         exxWm3bltfj3QMBlMTxAY0vwRA4X0PzMiz3gfxzTl/nk5i3Yn4yvlUUh18Gc+Mz4ovL+
         afFDSuzmKlOb/MuKE43RgAGEoT4yrtHkuogquz7+LsVwCHtjE7a1v7Mh2uqJSS1ctPvX
         sjwstAeiQlhemd3l5KvMbrgt0nWjazk6QvOpSoE19KmSqHRhXHh527gHANJKskRFoaEX
         /I5NgCM4Hz1+4SaApMhMVdhvg1V+Smkyex0fr1iuhHntCHW2KxUDncrzCxF+T9I8QkuI
         yNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674628; x=1774279428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5n5U8SF9tBDKp/G4y5GVvHf9wmA6XAYgGU0V4fhIFsw=;
        b=ls7XxUzQ0i3VVwbAFqnAxlOCtGOk+Qfg9JzwE6dXaWiFZhS0Yxyj4NRb5iv2WJvh+O
         TSE335ebNige6p1wJHZvkkU3T3vwX9QZOpplRVeD/kaqpDDAkBZ/8Ztxrn3yE853/9sL
         3u9pS6YOsq6iyUJaTD6OeL72tnqaWB5/LzwAX8Vd49twqZGrYNJcUTgJuUX3JsLtD5rz
         Iwo/V4wcgBXyvTeGYgJ+wcv8CzlhD0GJSc2eVUlMM+Cr63YetkGE8SI1g80T7sDcoXBg
         FJiEtQlrXYRSYR1jYk4FkRo0PjN8v3lnUd05r9g8u82glyalTsPOCOplzAQIhhr2cFPL
         WaSw==
X-Forwarded-Encrypted: i=1; AJvYcCVezVuimjIoIWs2cWFiW4TSX/1ZLmp01JP3iq9pYWfp/4F+RPwvr2O+tpfbH+KMBhZAA0f4EprBfZ+hCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKEjZqJIn9pO8wh24TW1vxFrCW+aMB1W/fZY9SbHI4+JYE/Ru1
	a5yxE3+o7P+dgll/52BYTTZTGfz8YcYcmUb5t9Gv/cBRXZbL4BVCGiUb
X-Gm-Gg: ATEYQzzK0YhMJ3xg/NYLPmVTsymGtdqKMW2lu8SVWwQ3AHIm+5HhlpNrqchbWyDEDzm
	lQNsjL55+YZRiJ0mgZSNGguX8w+TwJb2c/XIaOLdwZJug6FHxtsuc6V8f2aGk7xsxk6MSN0ex5b
	rHaliSwoiThlUPkzP81Nepg8d52JdrYHSInKiSuthRCRw7KUSBbxEvOo9j8JGOI+BMrl1Lh/uj3
	Ri1aeRfxbT38ihAlSfHFEKlmRt3kvT6mBIU58mWRjSXIUgL4IVslG9y9ioyDB7SMuPAVgCRogfn
	gvyQ2vX/olm3ab/nnFaStP866NSYQieb0RExPzFWFQUWBzorFfSpqEab0UmWuH/hUXTGJnFC8Zq
	1o+0WhwVLEl4ERbTqwkS8oqRckyRhfaYvUDkX3+tt7ODDsC05RP8JOqPwKmzrJPrw+70hDQlbBH
	7Ui6QRQrPoU1wHugSpWs8dLrKOOpGZBr735mgePQ==
X-Received: by 2002:a05:6a00:1709:b0:823:1406:8797 with SMTP id d2e1a72fcca58-82a1988f219mr12466479b3a.31.1773674627532;
        Mon, 16 Mar 2026 08:23:47 -0700 (PDT)
Received: from ekadanta.iiit.ac.in ([106.51.225.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072419efsm14694146b3a.11.2026.03.16.08.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:23:47 -0700 (PDT)
From: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: av7110: coding style fixes: too many tabs
Date: Mon, 16 Mar 2026 20:53:39 +0530
Message-ID: <20260316152340.238100-1-ss22.kern.dev@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55939-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ss22kerndev@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 8EBA029C59A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch fixes below warning reported by checkpatch.pl
WARNING: Too many leading tabs - consider code refactoring

Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..f4709b2c4f41 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -958,8 +958,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
 						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
 						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
 						ret = av7110_av_start_play(av7110, RP_AV);
-						if (!ret)
-							demux->playing = 1;
+						demux->playing = (ret) ? true : false
 					}
 				break;
 			default:
-- 
2.43.0


