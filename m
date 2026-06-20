Return-Path: <linux-media+bounces-65304-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tNc6GgFNNmr+9AYAu9opvQ
	(envelope-from <linux-media+bounces-65304-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 10:19:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF06C6A88F7
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 10:19:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nojLOuZy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65304-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65304-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 920CB301AA95
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 08:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C3D345751;
	Sat, 20 Jun 2026 08:19:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F6A341650
	for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 08:19:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781943547; cv=none; b=KGWk1ckVuHZAL5m/N+ER6JXvfCVe8B5lCMD62DxTAQr0hofLM8bWqzAz5ZojzZD75GaEonDC9YhtJtZzL9mJzsAdE9CwxfMQhjhyr8RfV16ag/VD43ftruJwDpJUm3gHAYA0GtK1Cia1Hndd3al6s9MlkEb1Q4tPLWx7QVLeDeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781943547; c=relaxed/simple;
	bh=ebjICIaKnIiWqN5sCqRzBeqtjhGLBHhcjtqnFhx4W3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nsdO9LreFzXmLWkgNvuSV9AiVNrrMVh3ou89hl5ESg4ONC/qdqt3vwmMkcnkgFcoPgt+bSQC3qSPw/bF0ZFxA1u7hJleti9ETs0JrwNQZRbMCXvbI6Jp8rh+LISkAS4v4+ZXw2e4NtNYWJHkValECY0Mez1TeYx9CGy4/H4SVcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nojLOuZy; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37c8e7c8185so1637648a91.3
        for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 01:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781943546; x=1782548346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FYONhAjYo50YxLgZHUBiBRUd34pR6NaLMu1zrzWmCZk=;
        b=nojLOuZy5ZUe5cyR65QKPUE3xqXJKn4STcxpm4wNmL/6BeP8V7zHz4yOnPBxE4YVEZ
         nxvvpvXXE8YSUbMD6cugx7L0oXC26t4NhxCQQLSPESLWXq9tsiIVbjjCboUYZmrANTES
         OgcCj4ZbqpID2cGOIrxdpIhf1QSsLWvqeR1DoKv72j5KTrgkupTKozwm+nbBSMTmTJ+o
         nG7UeGuqdI0stdic5ezaM5a02cigXONBlcKZIeKE7Y9sid/mAm0ydErqR7eIKbfIT6d8
         satzbDB18pVDOw1YHItNsF9UTw77djmGnruqvHytudGHwXRk/oHbD3F3KlgqgL4sscDN
         RGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781943546; x=1782548346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYONhAjYo50YxLgZHUBiBRUd34pR6NaLMu1zrzWmCZk=;
        b=ZQETX6/I6AZxCF9p2gGLZO+Sm2SkmCuCLqn5ll/UXs5wqPhDvD4ecStNhmM8m+Ea5v
         xUkfpmzHDzKULSJxHhCOH+Ybi0D84R/jGTcqH0tH62+KrQEFuvhGB+Y0u5AtUedL+YwM
         q3Pa2ublTPQJ4+jFGO30+s7MT0htrVIAI7AKTwo9+91U5fD3LPYN+GCw7LMVrR3sikab
         qTZZK4V1JuYOU8cCPIxoVwKapCDgBFHSkDXnpxbAn9Xf+y4QM8xI+IUPFQhOAlWlKHMA
         pAqmkr+11rdm0Uq4evIeocK6WeOQD7H0f36WWvdotmyzfrALJ9PMzx426B59kUeeBPaL
         8B3g==
X-Gm-Message-State: AOJu0YyWxaFr2tYLWrOVJdmKruo0xvCnru3iJe2BP3uoJGInbDWhhal3
	L95CtrL0UghYiaWarMSOoQEP/39EqI6a6s7nenzjWpvcqjlZVxj5fC5scviDnFIr
X-Gm-Gg: AfdE7cnK3ilNPn5USAodq3WQq99MBFLX68QaxfSKu+baL+3SRHMNh/fU+NS29+Uysau
	3jj0A2O0WkNwRjx5v5uk8SRC3l1MpjlsGmpNluuIJOvqPh4xrIdVJ5x2LU3wAmfAypL6lLsk7ya
	kIILN7nU5fdiIzsD/vxkD3QuDU7pB/1MIdi2ZH/UG/eUoDg70FAotxGQMc/ZfPu8fL7BIWIqdqX
	7rAw67kpt0eXEYLAukw093ZFljXQFuXwC4K9ZpiieFlYX69XLh/0z7PxxfMEzPQL8QBOg0VkqPC
	l+2KhKzTj+0+S1I/M+ydkRrz1DDjXSC4ZkV0gomU9f53EYOekAPFxaa4es8byfaUPz/Zl1qq49d
	3V1CJqMThRJ1PfIA0UNXZsZl3WKq+tlCp0nC0g8eS3UTE2NR81J2SojieU6kbUCZwyxfNgxMCcs
	qX61xfvYIS7bDHOWmMqxaEreZCijAv7qPogTtd
X-Received: by 2002:a17:90b:4d11:b0:37c:6973:5a65 with SMTP id 98e67ed59e1d1-37d15e89d6cmr7349122a91.17.1781943545714;
        Sat, 20 Jun 2026 01:19:05 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:5c2d:70e2:75f2:925])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4eede23esm1601366a91.2.2026.06.20.01.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 01:19:05 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: linux-media@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: Documentation: fix v4l2-subdev incorrect ops field and category references
Date: Sat, 20 Jun 2026 15:18:42 +0700
Message-ID: <20260620081843.7641-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,gmail.com,kernel.org,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-65304-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:skhan@linuxfoundation.org,m:linux-kernel-mentees@lists.linux.dev,m:tharitt97@gmail.com,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tharitt97@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tharitt97@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF06C6A88F7

The v4l2-subdev documentation incorrectly refers to the "core" ops
while it should have been the "video" ops where the actual
operation (g_std) belongs to. The docs also declares a duplicate
"video" struct member instead of "pad" in the subdev ops struct example.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 Documentation/driver-api/media/v4l2-subdev.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 13aec460e..d30bb656b 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -77,7 +77,7 @@ It looks like this:
 		const struct v4l2_subdev_tuner_ops *tuner;
 		const struct v4l2_subdev_audio_ops *audio;
 		const struct v4l2_subdev_video_ops *video;
-		const struct v4l2_subdev_pad_ops *video;
+		const struct v4l2_subdev_pad_ops *pad;
 	};
 
 The core ops are common to all subdevs, the other categories are implemented
@@ -300,31 +300,31 @@ directly:
 
 .. code-block:: c
 
-	err = sd->ops->core->g_std(sd, &norm);
+	err = sd->ops->video->g_std(sd, &norm);
 
 but it is better and easier to use this macro:
 
 .. code-block:: c
 
-	err = v4l2_subdev_call(sd, core, g_std, &norm);
+	err = v4l2_subdev_call(sd, video, g_std, &norm);
 
 The macro will do the right ``NULL`` pointer checks and returns ``-ENODEV``
 if :c:type:`sd <v4l2_subdev>` is ``NULL``, ``-ENOIOCTLCMD`` if either
-:c:type:`sd <v4l2_subdev>`->core or :c:type:`sd <v4l2_subdev>`->core->g_std is ``NULL``, or the actual result of the
-:c:type:`sd <v4l2_subdev>`->ops->core->g_std ops.
+:c:type:`sd <v4l2_subdev>`->video or :c:type:`sd <v4l2_subdev>`->video->g_std is ``NULL``, or the actual result of the
+:c:type:`sd <v4l2_subdev>`->ops->video->g_std ops.
 
 It is also possible to call all or a subset of the sub-devices:
 
 .. code-block:: c
 
-	v4l2_device_call_all(v4l2_dev, 0, core, g_std, &norm);
+	v4l2_device_call_all(v4l2_dev, 0, video, g_std, &norm);
 
 Any subdev that does not support this ops is skipped and error results are
 ignored. If you want to check for errors use this:
 
 .. code-block:: c
 
-	err = v4l2_device_call_until_err(v4l2_dev, 0, core, g_std, &norm);
+	err = v4l2_device_call_until_err(v4l2_dev, 0, video, g_std, &norm);
 
 Any error except ``-ENOIOCTLCMD`` will exit the loop with that error. If no
 errors (except ``-ENOIOCTLCMD``) occurred, then 0 is returned.
-- 
2.53.0


