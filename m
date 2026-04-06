Return-Path: <linux-media+bounces-58085-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP/QOERr02lViAcAu9opvQ
	(envelope-from <linux-media+bounces-58085-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 10:13:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2343A2294
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 10:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ACB43015C86
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 08:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B4B30E0DC;
	Mon,  6 Apr 2026 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcCtqbyh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F31F30C606
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775463221; cv=none; b=E0tWKYy/EoqZ8GlqUD8m6XaItgrHmHrX9ohxeVGIMT/9NZxtwDb7zevS4Mgfpt536w/PktDoHMFPYJxSO/8ScEw2SHlRMhWVqrm5zFsBJ42izX7qIFPuVXuJhKx0t0MTOMKkUrH9ueXNkSqSakU+LrPlj7oqq8YOVbqUBLmJDDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775463221; c=relaxed/simple;
	bh=NSsCLxA9XIus0FBPdWSRkAf9rfESaDpSLkuqckRIxMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qayl0u2Sv2PYV/noZCl4+5yd/8eiUhCqtW2JpTDZY1Z/R4x75vbdxmyzKsVzo3A2Hglr4U3E3S6Bes/YyseGkqlTbdSUojFlXpRSmsaf2r4aBQ+BiV5RC6QrdPItnytohtJzGLY2kZCPYUaSUCrcbSkVYAWVHQSltwaOjuwwO4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcCtqbyh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so28242875e9.0
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 01:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775463218; x=1776068018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Grrz7Uwuag8ALYv5V52HPJq45H3NjslcBVbddawkh3Y=;
        b=TcCtqbyh8woLMpMALzi3wOxRC+6CVrWrbeQtDhP3ALIaEZ8JzvSuCJ0HEOtf8ELh02
         xNr2Jzs9QeH/JaEqLsSdHxQPmSBLzGOo+Y5T+tuC0tYVGhcLjY/fI63W7u+yQn4M3E0D
         lWysGeo5I0odyMp/a7xhgMp88Hy+eWa8SYXa60zEvYTCuZoGrz9ElNnAyzU78SBfSU82
         yyNkwj7fo5qf6L+k+VNbmkF2jn+T3s6mMhGOTIsBLEYWoY3TiaiW2QJEj/c/zwxuzpeN
         rzYed7UUCMWArOpVWOX6M016OCg4C+cVSBNBMbaUcFEtXjAgSbxpfO30J86hHc/s35wn
         XrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775463218; x=1776068018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Grrz7Uwuag8ALYv5V52HPJq45H3NjslcBVbddawkh3Y=;
        b=tTxcgrZnWmzaWX3lf8UNgPHh8FYXCCnoTVvAqiEADwTeXP/fz5Fokyaca468g6murQ
         RsuzO9CcV7Wt2N9tcyHpXFNY04h6s1C8SKWmlWybDRETOxhh0GuxP8pEp4CNIwjqfP53
         HadZO+Wv6thgwP2y8XXPLGjyrHhv8/ihdgZHQa9RdTcz83a7QfPtesXqOyimM6Re07Zf
         /7NIuXIMVPWRUNbeMEumjRDnWxjbQil+egVsu5l5IeEby6Dn/41bupkKZeQRGnBsc7Ku
         qw2+z76f7hOmgFyp4YWzkaU6FD75rjZV3JuLMOomgJA4JI81iliX+NONTc+Hp+JNfu1k
         h2iQ==
X-Gm-Message-State: AOJu0YypO1MYE6HYtZdKWT2PWxZwciqXHeiXiX8JZZoxZvNcFKQm5Q9X
	hUyoWoHZ+6i9l4iyPQWh1dDCuLQtai7mOFGwA5SH3YBTjHNGyDnjBte4
X-Gm-Gg: AeBDieuZkY2bPkE4aI9rVlEcnYP4MLd2Z92PG/c1WQag9ISysovuf8vI7xWWjKXrZLu
	WM6fEPk/M1C1RifbtIlITS2N45sT6auJZ7Ur07VF9xzp1gziC4s0iUR8uvMe4EjJe8vCioodnf3
	XwhjoE6BsXzXTuBo3GBHpf1HbbeG9pgnAg/fqSTYy8Qe2QZrIHBzOIZ3xkwR0GKAMmo7RiyJpaM
	VK3vKiHi/nnXHK1lOfuYf+SnqQ4oMlgPStaVDBgRxP/9613ceAs3cFPi5vgDmKV5nsS4Eb96SXh
	8hEsQP/dxwHq8nYk1Xoqj5aUfb14fEdwUQegnIShZ4pvopkrrAg9y9DueMdZiSaJhlBqqW5ZOaW
	KZRyOW4L7MKDv+dOBlxB04jXDBPAkCH656dlWikSXPOJ/DeXhtq2hGB71My7l36KPTMEA+CSdaO
	8xA5E2+Y+GqYyT
X-Received: by 2002:a05:600c:4590:b0:488:a502:8955 with SMTP id 5b1f17b1804b1-488a5028b2emr110656135e9.4.1775463218516;
        Mon, 06 Apr 2026 01:13:38 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm39408519f8f.4.2026.04.06.01.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:13:38 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] dt-bindings: media: mt9m114: document common video device properties
Date: Mon,  6 Apr 2026 11:13:29 +0300
Message-ID: <20260406081330.30362-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58085-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D2343A2294
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document common video interface device properties, such as rotation and
orientation.

Svyatoslav Ryhel (1):
  dt-bindings: media: mt9m114: document common video device properties

 .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.51.0


