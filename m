Return-Path: <linux-media+bounces-59998-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFlGI6JC8mkapQEAu9opvQ
	(envelope-from <linux-media+bounces-59998-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 19:40:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D79364983E9
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 19:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 255B9303852D
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 17:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6D1413237;
	Wed, 29 Apr 2026 17:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndrl33ge"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB788410D17
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 17:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777484341; cv=none; b=j990NrxpNJ4370aTiSOoRPkVht1/iSncFfGwfUZ1SOmbHZq8tkC+ypUymya7vxyc2cSLENAUmJfNZxi9RXGeCCSljUwtKoTmO2e4j94IJjt4+UjOhuDpZEneTzge5i/0AYZuVoVC2nHLj3OYvM0po7GrPOlkd1Hfonp2VVm573U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777484341; c=relaxed/simple;
	bh=+RHczMbau3YZaYC4C3eBiw9Hxw43m0gaCVWwXVrxD7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QaEkmjO5CttTDF74IhLiRGysdsjAWZH92A0cLTQw79diQJU2cTQkw5xQBzGot6gs+K6goUFByEE4EQ2cb0xxZEr48p9Q6hhzm2x0F9iB32CkUywR1NJbZ+u9oi/YmPk5gJgeNwAG5GnwsIfDp7uu7oxcOt1HqLPpuDjhPO9RS34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndrl33ge; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8ef5776530bso4626285a.0
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 10:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777484338; x=1778089138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VCbHRKenl4D0eRTjm9YWlCwewdI+4NreRZ/eNUmkeGw=;
        b=ndrl33geToym87sORDz5tAfrfNux7iXSUxJthSlrTVMJIpOhhKTd97YH9yQZZBJz8s
         GlmVjKGzd1iN5M03RaiHLLOF6RbQ3VzlOAvMjva8QTdzjzJgb4sHOFmFxNFk2IPBj/Ad
         sW65e37Ngs6xqHXygAtl3la39s7/TXcOTgoP0QYeRZVPEwtvDxi1sSohCAqPjw0jlq9d
         XBM2ryD1JJkzRqaUr1vFZK6rFPRSm6qUP0ka/L3mnVp6p9GsGSBryiYHgPAyLJEi4AFA
         BTN/VvtJFbOgDxJf2CCClg1KZ7Q7OKOWBlSx64SJlxTe5YAM1nPHEmV70IcIEWq+gClx
         geXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777484338; x=1778089138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCbHRKenl4D0eRTjm9YWlCwewdI+4NreRZ/eNUmkeGw=;
        b=YQRZkIYKZBwvkdE6kPCVeIs6teZ459Zan4Zv/GhbEFFcvtXuS0biUrg6oW5UHpsQlg
         oML2nOM3HXkL7dYgmpYxGZr9eJbLBp3/KztoA9pF9/o4J7AwIZygCn83gf9E5/GE0bM+
         emOgdLf84V8cjZ/i1lMQ5+XhkTreNG461wta/MtuTK+3YwlpIL7r4wE231yphcUeBOfn
         Xp0tSVyn8v5DvRa5sLDW/vhZz9rGUz1CyWnWMUo8lS9kVO6PD/quQdLYeXTteaSR2SmG
         xpRhRQokoxlUyG0LKAw8fUEv8d9AJuW5OcGHOkYgdMb7IGkFHViNOA6YsDXIpumrpkJj
         KnSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nI4uvhL6lPLGgKDsENZsOApmUR9ovKXiEeritjm/bgYtFKZP7bapMf52ZKlwckVz61ss2FS6Fr1bzTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzueM6cKt4JGc+uwc3As4bt635fdso9en5PDep4xQBm4viG0kzi
	rorVTCA8dLnmsNgbKwUZ1N6EUlQVNYLakoRlp3WyF9WGc9RAJQEnoC1R5YcMIoslI9o=
X-Gm-Gg: AeBDieuDP0MDJcZWris1sa8zEm8WLMTl5E3HNQ9ECJX3E7Fl42Riy9oVivOO0iQGN6n
	wxf+umIxHJMx8nFOysZPnoEl9S7aoWC+9jj6NrAn21rg0SfHtE0rTUV7Hrd9BQ3dtwJu0zbAKqm
	r5UsKbN8vs0fXby8netS77mzcEZLbz93zAm8O1yhjZdLOQ/OQBagIqaU9tk45J5Y+rEYzJgg3c4
	Z/N+3srMJHIFGiJd3t8qKRO2088k+oWkaS8t8R7pC0z+K9L8ofvyTOw+vfWO28CvXlWbmXwLVly
	EYxitGXWV065UhTfMy46Gh5ozw847LZ3a51onKlPLXzXAY67waBX12F36Fq7qhOngdqg58QKBjl
	Y6SBwPynj5SRYVriShMvOQjkGiv2tW086vtO6x5ZTojqwLrPtFO4GdHWyTHS3l8bK2QLIiAI8tz
	J6xCidLnWJN8r4eKq20jMWggLYE5xvwRqBttk+DfMpWmChM16B7ifuRSHBqGupaub/H+EOjZMW+
	4/M6so=
X-Received: by 2002:a05:620a:370e:b0:8eb:6f04:f97f with SMTP id af79cd13be357-8f7d97fe8e8mr1320209885a.44.1777484337683;
        Wed, 29 Apr 2026 10:38:57 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:cdc9:3f29:858c:a856])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f93d0f6eccsm231658185a.20.2026.04.29.10.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:38:57 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: av7110: fix typo in av7110.c
Date: Wed, 29 Apr 2026 13:37:51 -0400
Message-Id: <20260429173751.5611-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D79364983E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-59998-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahamaryamjavaid@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Fix spelling mistake: connectd -> connected

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 014d0c6f0a8b..8b5cd6c842f8 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -2272,7 +2272,7 @@ static int frontend_init(struct av7110 *av7110)
  * original Roberto Deza's hardware:
  *
  * rps1 code for budgetpatch will copy internal HS event to GPIO3 pin.
- * GPIO3 is in budget-patch hardware connectd to port B VSYNC
+ * GPIO3 is in budget-patch hardware connected to port B VSYNC
  * HS is an internal event of 7146, accessible with RPS
  * and temporarily raised high every n lines
  * (n in defined in the RPS_THRESH1 counter threshold)
-- 
2.34.1


