Return-Path: <linux-media+bounces-61029-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHi+FMexAGrALgEAu9opvQ
	(envelope-from <linux-media+bounces-61029-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 18:26:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5DB505197
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 18:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B31B2300B041
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 16:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512333ACA7B;
	Sun, 10 May 2026 16:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oda8srGd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979B026CE32
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 16:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778430400; cv=none; b=YPocIrq+Pxk6ArjtK612Yuvrxc13mIl5qeR9stwIxFt2PF/Hc1071kaPzSamjLp6jt4BJS5b39TO+vJrOUxXVNCjEORQraXTtgoWcDTOsXFJynzw1epoAmLF5NotHBRQKqzcsiT/zV7GTMgDJvjCUDQl1PdPmc9HVL1ai6zsSEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778430400; c=relaxed/simple;
	bh=ZN+rnf9IlZfdljMMe+2pZP2fRETzi/gGpb6q56acdNg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K8bRGdqdQIdHzxdmAxWoJvdB7UGCFtFBRtNzr2MHO9Xqdoo1GFhCnEK92kjTfr/gHguPmjbwFuUyllzLK7QgUwWgAjcJgp0DZojyYlvBqO4W7DZIRn2lqoJxCdRqc0yGrhPdbzSm+zMQc/7iN8O2Mlx0YpC+Hs97KofDQumDoJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oda8srGd; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-366070f71adso3187323a91.2
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 09:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778430399; x=1779035199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IC3PTWC1dIvQid0I/PeI5EZxV160ZDKd7RDV/vYwlM0=;
        b=oda8srGd7yW78uSC4z9Hkj0UBukFom5RMoNzwnoJVgTSeW7VfmDSO5dF0mYq0DKNzS
         pKfwZb1ip+R9Lv932O02Rs+vx+IDPe0f8Ib/Vxi5tJhT7vFdwkuOK/1wxgyjf2E6Y4L6
         vFlENMZzlI/NyJ8uVcd7rB6NuPmdO96Ve8RPFvdNO32xbhbcynLvE8MHWI5BtcoeQkrM
         DMX/RrSxRtnjDDUI43hhbuuMekO1HQOss1sZA5XfDUE/hFKqYANcxN0PIiNcw9BjSCUJ
         4nneSbTjtLBz9zqcto+KqoCVQayuhIHQwBr0Vxi0CI+RMk2Tiu+mTdhigf7mUfluA26n
         7WtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778430399; x=1779035199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IC3PTWC1dIvQid0I/PeI5EZxV160ZDKd7RDV/vYwlM0=;
        b=RCKhDqUOpbaMnL2uV7W6nXgascblB6tXwqagWfdUVHxKCYkDW3hBHwjlCYgS6Zxqph
         Mx0ynd1F8QLYfNnVotzxb6W7zz0jXRabUG6OJ5yf1GfOvwpu3zcbFiqxFZqyyN9E1vYE
         3z27CX4ypyxBKgfGNDdf8FdbTToQrbrdiL1II/GzcN7jQJvAjFJORsOzyat16BrAHKpO
         L3gbZUUazb5yCk711ObtZ5W9C6HEiWpsQLZ7VDI6dxq/41CKSX/JQ2Qh2NABDJiG4eVr
         +lUPW/JTN9QoNj65vr8FBto9DGbDH3gM1J/E55aY15mSOCW5uphVr5MX7S4ijMdQhl9Q
         3glw==
X-Gm-Message-State: AOJu0Yx1wB3QLAJp61lIOp0r1TyPBnt/NWHcXU+nnY2n9258Cpf5V/Q9
	K40slm1y1rjZQ//X1mjvk/X8KUZvzM+3RVbJf9q//Ca/d4+U+yUf0kv3gQil8n5mCvw=
X-Gm-Gg: Acq92OEg5czi+CLafp/nnnnbgQ7ICKYeg6gbHNJ22TAuPAtYTa7J7WzncwK73U4laWN
	WyXUkTMZVwDVlX9p6RbHOquKTZcKOPfZBpQMMQcpaODddWEZCBeo6gUa85swCeyH1QlHUWTs5nq
	AzQCSwS35QHfqHSx0FxzS+KsOvJeMLNNAj5Am6HniR1ZGKvz3jEBTiegpywg9ZO0OLJ/WYWJN3h
	FfJ6v2ccJqMjhTUIOmQX6/HoQxELFAliypO9HYtew2Z2BkxWveQrb4cyrB7F3TMbvRtiTUQfXP7
	pPhedgE4cdfTXw3hrGj35Sn042zvUnO/kyVdVoVbGsfa3LFJrXhirp2tEzIg3dm0PFHwZONnpv7
	oiItuqPAG/bNHKUxA5LlQSyzeOim81YVcjIePUphXBGpc7883gR0/wlokzz7AS3e3FU04gEeQsC
	dojTfgy3d2xgonR4XOBLXPpMX5/GTfxEV6tUKc/CsrFPnwV9QiiY72jJlPi4O9MCW6k1ppgKd6I
	As=
X-Received: by 2002:a17:90b:4c46:b0:367:db0c:4320 with SMTP id 98e67ed59e1d1-367db0c456dmr5763854a91.23.1778430398630;
        Sun, 10 May 2026 09:26:38 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([203.194.96.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d60b978asm6011228a91.0.2026.05.10.09.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 09:26:38 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>,
	syzbot+f9f333782a8f54509322@syzkaller.appspotmail.com
Subject: [PATCH] media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
Date: Sun, 10 May 2026 16:26:32 +0000
Message-Id: <20260510162632.67218-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9F5DB505197
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,syzkaller.appspotmail.com];
	TAGGED_FROM(0.00)[bounces-61029-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email]
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


