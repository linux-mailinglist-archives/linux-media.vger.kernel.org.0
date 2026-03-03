Return-Path: <linux-media+bounces-54334-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCr7A/DIpmk0TwAAu9opvQ
	(envelope-from <linux-media+bounces-54334-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 12:41:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 813C51EE3C7
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 12:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40B5130E1B68
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 11:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723AF42F566;
	Tue,  3 Mar 2026 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e89h1Ted"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AC048033E
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 11:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772537281; cv=none; b=g35EeRJ+WDudBLQgbyprX03gj5YRB2M2u0Y4P6TKRvX7w6EHLCkoiwrmkl3LoqwG83ob8tXKYtH63v6gtxBfM+sbepIfBiDgOTj43kwG+G/uEdvsSbNvs61KWxXuXzIlUhFBsxIUqw54VIiPYGD/RSU4Z1vAbkGAhp73BwO9Vbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772537281; c=relaxed/simple;
	bh=Z7wo6V9kU8iNoyeWICZnYBGx6CgJO1IAkVLA1EldMnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LH0QTRtlpNTI3+l1ah4QWYjpU3jTe++qG7nfUyiduVOn7FJl05dqR2r/BiBJUA8wwzdFiwNvXufzjTqwF+RjJ7Ae2jjR5aj+VBpBEm2dbgpjC+ezb1SyCGN/vwCCiYr8gHglg3FZ+R/AkTu90Aaj64diYvnp+0tvNxWOSbItj6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e89h1Ted; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so62724665e9.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 03:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772537276; x=1773142076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bnm1A86ZE9NwpPvFAzmesLCd98LCt5htyJUYGbVOzOI=;
        b=e89h1TedqS01u/CqV2thI9o7b9xBjDmf3lPODZR4UlLAJoNWdC0q6Rokbz3vdHygL1
         eZz+Akn+Pg1O2ffzRkL0vvZKr0Y0mPObzLUZBJG1SqxsseeC5TF/Vi0jcaMsrGxg3/Ct
         fhtph88fIQyRGq/LwM4UO2lb3vwIRxQ11G8+Ky+ksC3CHuuIIOyiro29MUgWqUAFYUxo
         4xh3K9rXcjyxA/kU5yvxLuxAVuuzYhTQGk1HqfHpyj0zL+OFi3wPwn3/W0guxvoL27v/
         2MAzzvwLzKS/Ef8B8UGvYaGAxnoGmshWt2lfWecUbn8RSv3Pl4e0NXRqWi+6+ZE0kjfz
         DH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772537276; x=1773142076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bnm1A86ZE9NwpPvFAzmesLCd98LCt5htyJUYGbVOzOI=;
        b=IbOGa7wM6Ve+kgIvtsehZZ6YtbhVZWtwmc0XFKJG+tF/0PoS9YSJpdweE42bQ4XQSr
         JjWKCMmxfwt5vrTJ0H959RMWqK8+fFw0tB/mTnVZPIlCnX7LYM9LcLKONsR06EiQ0/03
         ox3k6k/Ueivuct8M1xSqaYfRq38H9oVuLFQQCcGjzJY9a5w4PTxLJd2OuAR0O27Gf5m4
         Ju2jfr+8+6H1znDKmSxqFQP6b475U71gVEHaKue+yTNDNPvKeDMsP/I9b+wmf8LH/s5I
         PNqav7l6fCmeVpilQ0vV3CoEbvdzoLcbBi1lvw8KKJVEf2jSehZnyLwas79jcQ8nDWX6
         fKOA==
X-Gm-Message-State: AOJu0YxCdlqcUmnAtLw9s2ta9WBC25spejaHwfA3xGUg8J+UQULRI0SK
	K7DBxZEcoXANZj5Fiu3/NJ2F9uAHXOOSm8pPVTYt0Rj07PxlQGLGCCyh
X-Gm-Gg: ATEYQzxa60Sg5cDUonadoHq1cXTCHxoFCDl0f6vEQg1UJV/UE/4LG0zcdty20Kyt6Oz
	vPjgK8RF4ogrMsDSv/F0JBqurC7hRG6gNY1wJ2v/q3mBSFrlA6WD5CAzjGoOBQ2lt0dXT5DmaX9
	tk/STy6Qhly7ULJ+10hRG0rIX+5OU2ToBsOX3WJgVYP6ltttm4eLl5m+S1EyAku8bt9SwIAHHI3
	5/OGpupn6n4gvJSe6eOJvRUqSCMtF7rXBBX1Ofpo/GymlmIu0bikRl8BRXyyUTu+doBhVaLgKZN
	cK39v/lN9m1BxNPiyOV6rjf5wxMGiFYJcKofi/pUSxUEkVaIUY7Bq47SbFZl0so+qs+zAFzX14s
	45WBLltocneCfaLOPd0YxbczuBG28I7U5f6c2Ux8ElFyZ7gU+Do3Tzo4GCewgORfWkj4Mk4S+qA
	==
X-Received: by 2002:a05:600c:8b12:b0:483:71f7:2794 with SMTP id 5b1f17b1804b1-483c9bbbe39mr288394345e9.15.1772537275524;
        Tue, 03 Mar 2026 03:27:55 -0800 (PST)
Received: from kimsufi.. ([2001:41d0:303:6f54::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851262ee4asm22629685e9.1.2026.03.03.03.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 03:27:54 -0800 (PST)
From: Ruslan Valiyev <linuxoid@gmail.com>
To: syzbot+1f5bcc7c919ec578777a@syzkaller.appspotmail.com,
	"Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Ruslan Valiyev <linuxoid@gmail.com>
Subject: [PATCH] media: vidtv: fix NULL pointer dereference in vidtv_channel_pmt_match_sections
Date: Tue,  3 Mar 2026 11:27:54 +0000
Message-ID: <20260303112754.340155-1-linuxoid@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <69539037.050a0220.329c0f.052f.GAE@google.com>
References: <69539037.050a0220.329c0f.052f.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 813C51EE3C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[syzkaller.appspotmail.com,gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,googlegroups.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54334-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linuxoid@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,1f5bcc7c919ec578777a];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,appspotmail.com:email]
X-Rspamd-Action: no action

syzbot reported a general protection fault in vidtv_psi_desc_assign [1].

vidtv_psi_pmt_stream_init() can return NULL on memory allocation
failure, but vidtv_channel_pmt_match_sections() does not check for
this. When tail is NULL, the subsequent call to
vidtv_psi_desc_assign(&tail->descriptor, desc) dereferences a NULL
pointer offset, causing a general protection fault.

Add a NULL check after vidtv_psi_pmt_stream_init(). On failure, clean
up the already-allocated stream chain and return.

[1]
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
RIP: 0010:vidtv_psi_desc_assign+0x24/0x90 drivers/media/test-drivers/vidtv/vidtv_psi.c:629
Call Trace:
 <TASK>
 vidtv_channel_pmt_match_sections drivers/media/test-drivers/vidtv/vidtv_channel.c:349 [inline]
 vidtv_channel_si_init+0x1445/0x1a50 drivers/media/test-drivers/vidtv/vidtv_channel.c:479
 vidtv_mux_init+0x526/0xbe0 drivers/media/test-drivers/vidtv/vidtv_mux.c:519
 vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
 vidtv_start_feed+0x33e/0x4d0 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239

Fixes: f90cf6079bf67 ("media: vidtv: add a bridge driver")
Cc: stable@vger.kernel.org
Reported-by: syzbot+1f5bcc7c919ec578777a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1f5bcc7c919ec578777a
Signed-off-by: Ruslan Valiyev <linuxoid@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_channel.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index da20657adc747..5f8c3af871711 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -341,6 +341,10 @@ vidtv_channel_pmt_match_sections(struct vidtv_channel *channels,
 					tail = vidtv_psi_pmt_stream_init(tail,
 									 s->type,
 									 e_pid);
+					if (!tail) {
+						vidtv_psi_pmt_stream_destroy(head);
+						return;
+					}
 
 					if (!head)
 						head = tail;
-- 
2.43.0


