Return-Path: <linux-media+bounces-67004-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s+qaNddiTmrjLgIAu9opvQ
	(envelope-from <linux-media+bounces-67004-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:46:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CB07278CB
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:46:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iIuE+q26;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67004-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67004-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BDB730CB68C
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F6F47DD54;
	Wed,  8 Jul 2026 14:33:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3A047CC92
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:33:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521237; cv=none; b=LCLgMpRgfDe0kd8MDzGsrqxyarG8fgAwvhdOsxE94f11itcO1jO3jCnd1y0XmMotc0zv4or8fTBnGCJOpAmiBX+Qw9w1LF2p+pir1rnX9rcIcN8gC0RDqXNUd/S+XRETb8Nx042Q8WcZZ4MCpxv9l5G+SYd/Fg+qOODAglDWhcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521237; c=relaxed/simple;
	bh=0182PjDLqJYH49u/fjuLXwsDJ9qx0if1Stnt9C5AUFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ePzq4Ty8e66xviHttSvhIIp57jQ3QzdhyHwnt9vOvyOK8gMdMsJTQqFQLC3aLLLgBK8U5WWAAr6A9Xo/bTuj+zMzL2mEvPxTRUFmZALBKVNLqeJJI/Vq3TIgfehJtHM1YV2ag1Wr69GLlEwXfldNTKcKAr6zdejff24V42skDQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIuE+q26; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so10339415ad.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783521235; x=1784126035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X9lPE0ZoKdFyqGtNh/DJcalm3aGhMh0M5cKf5v8Qn7w=;
        b=iIuE+q26W11O2vhQUVBeIWwdHP97OW5TlAfkKWRu5ZAHLGLhmC3iy89QRoRs7Sxl1j
         6lQN5Jib+eKPF1VZ2PzacB/juMlnD5K3AbHVYFqZ/vtVJFtootD4xC8zE4DHPSkJ2GYJ
         q87UjMMjaJRnHQWjUrZlczcYegwsOg46WvI8RYO9oBIEfwJXnn/fSSeM2YmjayKCl9CN
         GX8wLyQnFjJq6VYGk5Pl7StcqqqyhZXFDOHrLz69OHEQlq1O5Q0txp8Kl8DrSpQsKhUP
         dfpKv0P3g0XTk5viD0r0Et9Az1orHi6SdYEur4QIUYbeTPmueswo0TBI1ZHEjpWX+jKA
         m0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521235; x=1784126035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9lPE0ZoKdFyqGtNh/DJcalm3aGhMh0M5cKf5v8Qn7w=;
        b=pPV5SOShAeng9UyfyLVWMg3dBZDoXhKPBsE6UYNjTC11UI9vm0JmkAOSTJJNGxZEIL
         5XdSTrL1/Zy4ZpmA8AvC3pRpRSGrYNWSU5BRlKiJJf91QjrZf5dbA6nw+938YkpCv42B
         TStaBKa2uFMFhfrlQzlITTqipDPDOwmLJoUHzXLj94Mi0fQplHaKNVofXuk/AnJcsM+d
         SpTPQNNIcBC+f2FDw4NiWzrFTSbkvfF5XdWPaQ/z9Ok1Wmj4+FvisCMaMmdvI6GhFJGk
         +pqoID+1iAn3VeN71Qlo4dFg++0XgatNTQfsov0RAoZ4vDA36xk6cpzrkm9unwWnQRbs
         4JRw==
X-Forwarded-Encrypted: i=1; AHgh+RrFGVKWRHReSDHW6GzV348GSOa2FqbAiqc94Q7jjmEpwD8uqR6aNS0XBME/umRmrGBJ/hIpgcovD/IF2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi7sHubYKiSjH8ftTtA1G/dP0LC+KI2B35DNAnIHWBV3BUfdIj
	rBjZ7NN7lZQTBWEBDa6aZaIDLlRqRSqLERXja9WU6vrUbQEq6Jsor/V0
X-Gm-Gg: AfdE7ckF8xgVwnUZvQgzt9QiSIAhgkXwsAXkP/xHzpSUhGujYNvOf4RqE43zS8WQXNS
	40TSHLNUIMooYt0PfebCFME7qr7FxUDEAod+hmku77cFam13Ke9LQhgp7ERoACl2LeH7AYXDD71
	Fb1kpvcX+5XNPXwG/57RiKtfjbnavedgVNDbFp+xkQRw/igAJivLNw+73etUWTOrB4N1W56K2o7
	A4eDcnCGEy4LWBlEISiaoHFOCFCVns+WyFPbcEukh1M7evgDInzs8zU8IirzejDGcmEtSggRjNF
	BOMZj2HoIXytIPZQxk0ABZhsg6bamDezMUaWf5kNNOjmAM1U7aAYP+cfIs0c/dP9rYJu3rFmABQ
	XWuaWCJfaJhUo8cbfQyyt5gSA5hTIvPX7Zz3/5PSmL0wwMOp/qq3SLIA9s2troLOWPynp7Ph5Hm
	P0kTPai97H93ZSXdKMhJFJ9rBO4BKuQFVO
X-Received: by 2002:a17:902:f547:b0:2cc:7c36:2c23 with SMTP id d9443c01a7336-2ccea484f93mr31372975ad.43.1783521234909;
        Wed, 08 Jul 2026 07:33:54 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:1b95:b995:f60c:5c67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb877sm29139605ad.14.2026.07.08.07.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:33:54 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: clabbe@baylibre.com,
	mchehab@kernel.org
Cc: hverkuil@kernel.org,
	mjpeg-users@lists.sourceforge.net,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] media: zoran: Avoid freeing a registered video_device twice
Date: Wed,  8 Jul 2026 22:33:49 +0800
Message-ID: <20260708143349.3166015-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.sourceforge.net,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67004-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clabbe@baylibre.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:mjpeg-users@lists.sourceforge.net,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ruoyuw560@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30CB07278CB

zoran_init_video_device() installs zoran_vdev_release() as the
video_device release callback through zoran_template. After
video_register_device() succeeds, video_unregister_device() drops the
registered video_device reference and the V4L2 core eventually invokes
that release callback, which kfree()s the video_device.

zoran_exit_video_devices() called video_unregister_device() and then
kfree(zr->video_dev), so device teardown could free the same
video_device twice.

Remove the direct kfree() and clear the cached pointer after
unregistering. The pre-registration failure path keeps its manual free
because the video_device was not registered there.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 82e3a496eb56 ("media: staging: media: zoran: move videodev alloc")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/media/pci/zoran/zoran_card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/zoran/zoran_card.c b/drivers/media/pci/zoran/zoran_card.c
index f707bdc1fb0f1..b8285df644738 100644
--- a/drivers/media/pci/zoran/zoran_card.c
+++ b/drivers/media/pci/zoran/zoran_card.c
@@ -885,7 +885,7 @@ static int zoran_init_video_device(struct zoran *zr, struct video_device *video_
 static void zoran_exit_video_devices(struct zoran *zr)
 {
 	video_unregister_device(zr->video_dev);
-	kfree(zr->video_dev);
+	zr->video_dev = NULL;
 }
 
 static int zoran_init_video_devices(struct zoran *zr)
-- 
2.51.0


