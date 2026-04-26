Return-Path: <linux-media+bounces-59628-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ly3FbkI7mnYqAAAu9opvQ
	(envelope-from <linux-media+bounces-59628-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 14:44:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE505469D41
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 14:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E4EF301BA4F
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 12:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0182DF3EA;
	Sun, 26 Apr 2026 12:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3q/Migs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DCE35E95A
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777207445; cv=none; b=LnMdifK0PnhTOoV8Xyq1Kjv796+Rqbbf7QsNqtJuNarQAr41Qf9oy6wgNcHujQu5x58Ayed4ufkTwYA/REtrSnQV9qwy+cVRYvv7+RhmHh6G2pq7F3KVfwHj2WBJzs0Jr3FGxjCSbSaTPOFjd0vOn19onLmhAErKWMO8/DTKuPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777207445; c=relaxed/simple;
	bh=a9n+NSndIZJCZ/0CPS01d0mwJ3AdHNC3myQMPC0ObkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dttD/cb8/wLyN8BOuL7GckHAIA0nM5XDUGEiasSdJOQRQ/urzdu7qYMrJbAR1NFeYaxDCZa2IfLMYblr0dm+ju8zKKTOvvsZ/wYx7ebAykfrLkVQQmsgJKIAcTB1xbtJ0+IR5e1dTbW942BHL4DBBerI3IJGQF0LGhMUZqbmTGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3q/Migs; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c70c112cb61so6108144a12.0
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 05:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777207444; x=1777812244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4HsOGoXcMVel5UZKKUbLYS7YRDhsp4Nm+pDK49IhB6w=;
        b=k3q/MigsIMJrQfv45M57dlPoDBSCwkqhFPoECXKsxTwpeu+3B6lYhRIa/5EzHmrZTR
         Vr+38nJTcVHSxPumdpRWEB3/+L8ifSH2m+ZOiC4mAmOGd694Cd2K9jnLdyvHgPOIT71n
         1DyZjm+JJCkmySPBkr14zQOCswaw/DDFglqgXjepJHQKC1KaoM8eoEvnAZUYqmB3UFPB
         J5Hfx2hsNyVDAlsmwLrX2fPb9lFVyxdbKI0/Jyj3mqTAGq98xH8bb7ERIwnIbyHaIIX0
         u0NjOoCItZTlOxTR+RD9+9uuylHMMX6fMTP0DoKoFcK7PHVAzcFSoAZ+gS7CDkvC2ZXc
         SpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777207444; x=1777812244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HsOGoXcMVel5UZKKUbLYS7YRDhsp4Nm+pDK49IhB6w=;
        b=K7WbouJ5yJrQw4dQP6EgnXZUZ/W3MJ8cGaNPiIUnKbEOmwogi6sBU+ZeGFN+p52WS5
         ykonIEZtGYst0X1LdQo6U5ejSBLkriLaZIbUbMooM4RQJD7d03w9/RxBp1kr25oYcwNu
         rii2VZdVq582ZjsFD0hbi8ydtgT2MFYrFym9QDE0OIGWUw3n2rKQbhlsWLxC29HVHosQ
         JBdqSMMZDq/mJ16ysjvZBJ4nnQf03tzJkkIlOBePmN9bL2ooFaiGuKc29H9NmYiNtrZa
         Wq6XnKoxoxYOHYdaqoUftPRSg+r/PaGXki+FDZefzK2dVzZYw1fM195GtTNlXuHaG5qj
         AR0g==
X-Gm-Message-State: AOJu0Yy5DBV0ErW+RKeIJsv61Cc9Q26qMblJ/l7ZGO3GB8beiC9T0LM0
	0daPpUOEnStHp5DOCXWE6bPTWCgvghQdXL5xB1lwPUnQQSzZcUOqg2o=
X-Gm-Gg: AeBDieuWjMPzocGNmGTgZekzWBpbm95entV7t12KSTmEFqIl0u6NZv8FoeJZwyuebWc
	12VRqB1xESR21ProEYcCebUCIXN0ZUgwyvG2usMOTI5EehjlfP4HYpYktLItcrVo6eCUMr2rAFr
	vmIOhBFnjAKVG5w/atvSVo3rdRzJlIVrmfBPOcGcDjJ/pQ8oEJ/gIb7SbnrMsU8v0/NJsMu52Xh
	/aClX4zz6Sa4Z+XZsUbe+IURMstQgdz33UMVVRmzb8HdVKCYTlGHe3s7YFdO9N+/wmvuFYhlOp0
	NXyrGOku69kyN89yhZO7z+aTUUmhH3E8MbZJYzdyw8kRQfCD5N3hK4T07iT3UYzTKZYYJQW5UDU
	MFOpiseYMMMD6IG1a8rlkeJF8E0ZM+1epYatRso9dDyK8fEDfVvTazMEuiW8JeuHuWMkQyWw9VP
	OTLAx7GiJK2AtCCx7/KJdahKqhrCFr83I63I0FIx+L0XL2eFylULiJZdl2V19aPR7SsVO62qDNI
	ZW8FYpXO4LlleTM7vBXgDhvipntiRbm7VSCZiwcds6wEBM=
X-Received: by 2002:a05:6a20:e211:b0:3a2:ebfc:6bee with SMTP id adf61e73a8af0-3a2ebfc7c17mr28544615637.41.1777207443705;
        Sun, 26 Apr 2026 05:44:03 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7977031729sm23122558a12.25.2026.04.26.05.43.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Apr 2026 05:44:03 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] media: stm32: dcmi: unregister notifier on probe failure
Date: Sun, 26 Apr 2026 21:43:49 +0900
Message-ID: <20260426124353.38916-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AE505469D41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59628-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bagmyeonghun-ui-MacBookPro.local:mid]

From: Myeonghun Pak <mhun512@gmail.com>

dcmi_graph_init() registers the async notifier before dcmi_probe() toggles
the reset line. If reset_control_assert() or reset_control_deassert()
fails afterwards, probe returns through err_cleanup and the driver core
will not call dcmi_remove().

Unregister the notifier before cleaning it up on that error path,
matching the successful remove path and the V4L2 async notifier lifetime
rules.

The local history only contains a Linux 7.0 snapshot, so the introducing
commit could not be identified from this worktree and no Fixes tag is
included in this draft.

Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 13762861b7..200b498127 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2063,6 +2063,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	return 0;
 
 err_cleanup:
+	v4l2_async_nf_unregister(&dcmi->notifier);
 	v4l2_async_nf_cleanup(&dcmi->notifier);
 err_media_entity_cleanup:
 	media_entity_cleanup(&dcmi->vdev->entity);
-- 
2.47.1

