Return-Path: <linux-media+bounces-60996-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNSRN1tF/2mo4AAAu9opvQ
	(envelope-from <linux-media+bounces-60996-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 16:31:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6320D5000CF
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 16:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C279302BB89
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 14:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F99396562;
	Sat,  9 May 2026 14:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wt7hCaIC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA6438911F
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 14:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778337051; cv=none; b=uFLUt+OgIqXumTasoSl2ZDo3d7kzWruIQCivT+tqQavSMImvRitfJikZqNZy9g6MPxLEzzqNn+vEXw23vymEgP9J8LBaymgenPVTIL+gguLLFSDbKVYucJ8pXKNgniAqeBukWIACAPZqL3eAV7j/btgJZQIXIn61VSDF5m7pTLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778337051; c=relaxed/simple;
	bh=qI2j3d+z2LtI8evQMFiwcNvcN738qUwWoJIOZ0caWC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1IWNMwdZQF4tswO3/HstR+NwMiRewkhqDgmbbjtTI1YXvOGYN8jHt/lwpiDwzCyXgy7Sio/4UpHENBOaMnyklKjH1bigAPBHPf5pZG7r1qLel4VvzkoeVFXa0RQv9kUJPPLCWS+682JQXaztoGQ9HN2Vm8/RT8Lspi/RymLcog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wt7hCaIC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44a14580111so2139675f8f.0
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 07:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778337048; x=1778941848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3IqOwzKbDGRvcd7hWChPUGJbN3mTPZAe2T77yQ5Idc=;
        b=Wt7hCaIC+28u5VdoA3toAn2MQ6g3u8RPR8i6k4psJMiEk1zSsb1jbyixBsngxd0GVI
         D1WkPDTIwOtuRFoxxj75uxqrahaUjhhzdvda5wSteqVYQvoBKLiAd4BfpTV9pmZ/y65m
         jGpEyO3cVazPrCtbrUXGdz7o1xkRPmoWJrklIbq+2hxl4Lrhva873rKONo9yxwxMQHiJ
         qzHjGH7TY/TT9Vwjmk6YQPeqy2+/yY4JmwpN7wc+ED7zyRIE/w/SYckM5rutA9R4pSzE
         bBRUB7xMvunZjPI43JEwkdo2SsaIqD6PN/5CR3gMB2WPMlRjrjIutcsviFQMg0piCE2A
         wYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778337048; x=1778941848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y3IqOwzKbDGRvcd7hWChPUGJbN3mTPZAe2T77yQ5Idc=;
        b=Jtux/94L5bRS421ncOqLENPeMf5YaBz6NHBMmXwuvDK6QQofIcn6xpCH+a8OGZnAzv
         Ffi0NgaLAXaWc7mMHBC9GbcXGKnutTeV55KdoPJ7An12SPOkuUPZxhVSz193RDrWESQ+
         /SJuL4WsVvxwenyv/BorZbOEAcS2+7d4b4+Xlb9mPL2Omaf1cC+gPN8ulM9gzcwQaoTS
         EPACRHANdE63FZfKPV5BzOcZpHC+kLiDe9ClgOgdl0Wxev02Z9sb7VV+zac5uko0wYes
         b+bMq6eePqmhSLCDUXaw0Is4jNrZIb/gdrg83O6HdSjg+m3SqQrPlp7nYelPp2wa36dl
         mU6A==
X-Gm-Message-State: AOJu0YwjjB6o94FIePMwxiwaikmE/h4PIaQaywNV0fpf9tkek4K14ixX
	25o0l+P+uL8RHyHabmRFqOsiCbq+VE8RJ63HLQxMMq9H1Eh/8UBtwq2a
X-Gm-Gg: Acq92OH4nUxk/LxdS8q7C5QTJkOp8FU3Yzu0afNIVpnW67Nlgjw+pPoeYy7Z9Sg62p5
	Cgv6jFYTB/IjuWnbtrKGC8zQ3krlWRTSNs7lpLgUqx9u3u0Obwr1upPZBJlao/CIy9Vq3Outtl9
	2LOo4Pp929dYEmFfvNryzYpw1+cdakY1ps/+sf3Fch1QjVeAYmAJFZF4UYNTC9xHkQ86aZVysyG
	H5NYqYiD7Id8BZARVwCNdU1RqAAI36q/fAGFrYs81fwzyEDQsvC2wn/AEwG1xT3wnm/8aXlIqor
	Zi91WX2II0EZgpHz0n5saq2di6VXmYJZhlTCJwe4brwinAl8oYyHAXHnqkxY7ha+QaZwG1PNX/u
	cwkEHvtRHDWDSDVsj4gQgs8m0X37Al52gYYKi+MIQH3Yfnf6waY3bKcayd7UE5YX9zESjYhMb0h
	QuiKspWrSVyNJly3EUKdGrrPmNgcaiOgMtZ/Pu1qOkdekcAiRIG78GdBfu4AHbOKNBYW8=
X-Received: by 2002:a05:6000:22c6:b0:437:711c:8754 with SMTP id ffacd0b85a97d-4515b056c9bmr26148813f8f.7.1778337047841;
        Sat, 09 May 2026 07:30:47 -0700 (PDT)
Received: from arey-arch ([2a02:1210:7298:ec00:73f0:d2e7:188c:1f61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454916df968sm12027800f8f.25.2026.05.09.07.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 07:30:46 -0700 (PDT)
From: Adrien Reynard <reynard.adrien.08@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrien Reynard <reynard.adrien.08@gmail.com>
Subject: [PATCH v2 1/4] docs: fix repeated word 'that' in userspace-api documentation
Date: Sat,  9 May 2026 16:30:43 +0200
Message-ID: <20260509143043.16403-1-reynard.adrien.08@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508163756.16213-1-reynard.adrien.08@gmail.com>
References: <20260508163756.16213-1-reynard.adrien.08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6320D5000CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60996-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[reynardadrien08@gmail.com,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Remove duplicated word 'that' in two places in the V4L2
documentation files vidioc-g-ext-ctrls.rst and
vidioc-subscribe-event.rst.

Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
---
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst    | 2 +-
 .../userspace-api/media/v4l/vidioc-subscribe-event.rst          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b8698b85bd80..8d5db414f8fa 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -64,7 +64,7 @@ should re-allocate the memory to this new size and try again. For the
 string type it is possible that the same issue occurs again if the
 string has grown in the meantime. It is recommended to call
 :ref:`VIDIOC_QUERYCTRL` first and use
-``maximum``\ +1 as the new ``size`` value. It is guaranteed that that is
+``maximum``\ +1 as the new ``size`` value. It is guaranteed that is
 sufficient memory.
 
 N-dimensional arrays are set and retrieved row-by-row. You cannot set a
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst b/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
index a6fc3c5fe99d..845a90573e54 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
@@ -94,7 +94,7 @@ using the :ref:`VIDIOC_DQEVENT` ioctl.
 	a V4L2_EVENT_CTRL to be sent back to that same filehandle.
 	Normally such events are suppressed to prevent feedback loops
 	where an application changes a control to a one value and then
-	another, and then receives an event telling it that that control
+	another, and then receives an event telling it that control
 	has changed to the first value.
 
 	Since it can't tell whether that event was caused by another
-- 
2.54.0


