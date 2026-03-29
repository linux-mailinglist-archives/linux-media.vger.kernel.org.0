Return-Path: <linux-media+bounces-57520-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJzJAfxxyWmSyAUAu9opvQ
	(envelope-from <linux-media+bounces-57520-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 20:39:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75677353A06
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 20:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1F39300E607
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 18:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DED37D12A;
	Sun, 29 Mar 2026 18:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyBb62FB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A1F2877F7
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 18:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774809590; cv=none; b=BXUrPIOExGFf23YUe3wjN63adellOQ0h9/d760dqTpQmTvTfdoci/dCC8LY/8nbRhUuBDvLJHt1U8J94ZzELa74HweIVNnzrT2Dkbana5o1Ba9olj2v0Qpi90rrMJwrz6WtWc44g8rUvntFtRFGfiGXn+pdjrAvtmHc5CIfYX4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774809590; c=relaxed/simple;
	bh=eJYaswBwn/CmFRUf2nuH1hB8LJV/oHpVC3ekHvo0UY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KcVGkzAYPnKH6sfa4rnW5MtQVkRJm5t86x8xE5t3YzvAduBbIiCkbW5KO2rzzZl19TpxcfJIHEr22crnXeR1BYRThgfuJ3cf39J2w/9GHdJCPwPJkQigL/dllud0FfVSaRweDK3brhM267EyLQuV/5ny8upD1xrQzro1SNfJRDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyBb62FB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf906b007so368459f8f.0
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 11:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774809587; x=1775414387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=L+SbWkbjOVQhr6LcFlL4QiCXes9tihjKHJTjNNhXwrI=;
        b=GyBb62FBBskHdoyP22lJq7R93kY1152ZEobWlMvqCPh01e1XQwd4iXxiJhPXV7xfSh
         yH0HU/omNVmgbT7IKr25d/eSEqFATnxoz9A0dPqAzlCqhwSTKBaytoR2GLpXQCV5lknq
         RWpJ+uptR0IbXg1/f1eyyPIEaX2AjjDyD8CpmZ9ptp2+/nft3s78+sr8BqlitIE7qsTu
         25LaVj+gqdgsyy5ktAlYY2p2KqicSXZZhdB5iZNAWv4bx4ZYeAcIQIbCA81WgzZD6JG6
         IBPyw236yvVBZsu4BxHtjMTqyIiQXApH+sFZOK2YmHVFrlycNMTxZARL4D+jl7WM2/aI
         lveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774809587; x=1775414387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+SbWkbjOVQhr6LcFlL4QiCXes9tihjKHJTjNNhXwrI=;
        b=Vg8VnVgP2QU3Hm6zBjN3nn5x7KQG92s/8SRgBkL8c+DCOSiL5eI7Kw5nnGBwLKNrsi
         77Ko+aBuThOILhf1vROGrbk8pYJzkFtTjES3LhrsTZskrC1F4Pe3SmPXVSP1AoGRE9Ju
         7UdlPtDGtzsQYV2/BTnvhq3We4JboT0k0D7G9+KZ+g50Ul7DbcZqtIS00MtjZHuULgAc
         ktHwWqrj/F7/1fmoWyMYMNRkOAtSx8ETx823hqU7wwqUGG3bpKj8qoIft3j5eAijA/De
         +jmWNuTn0YjBsjtAtIuy+DlhdzB9abZLkkz0iXiHON+Sj3Ec457cvWFizWaMjLngdLme
         zpHA==
X-Forwarded-Encrypted: i=1; AJvYcCX1ZXmKXE0MzmO8/jBhPVj9dWgQ6WlVMQg4XfUu533+5jFRY5A7i8WZLhrJRGh3Q7soggdTZpjOgiZNbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh19kQs3NihQMwSSoy+PeYpUBaIZlFtiyct+IMyIBgBLmm5qzR
	F2g84FGfdA6FZZCLMxX+YyMPtAmQKjrRVCknNvnOVgfbQEbOBQzYwstO
X-Gm-Gg: ATEYQzxWO17Fww1c/KwN3FpWjHmaXCpaTuU+y2ybfdIXdJWON9nh1n2k8s3NJyX8R6u
	lYu5Si5ue1EBodXhyWHVXI7fxiF5ihqWnfVf5W6ASF1F1uS/00QB6htV6/bFX/eSxYNlFCjzn9r
	GDc4oYVUkcT2N2tSCB1LvEKrDKq7eAb3x9y46hRFiyeSMRo9R2vHVRf/iOQ73Zlncju3X+j44Ha
	FWYYxB9C9pkzcksFX0tZs0kuboyLmWXKhfuPrnbE6JE1dQz+PIsViFyUs2mZT5x7A6oeyuV97Zm
	95SVlxPIiUKcqtKZKLx5na4EgvenEuQZ6RjUw5t3HjvZuYbAhKKG9giBzznvySu3jv79WZ15iZY
	LCqWSR3EuiKMMESDqlQpDO16n64xca5UO2PJkMWOfWoqvGKwr+/qPl0/9iDuc/uMoGAkBb0tilF
	OFKI2HU20tNJ6tNDScSfG7SsPO6JsafGFYtg/jdPnka5c01ZxnJK+df4o=
X-Received: by 2002:a05:6000:1448:b0:43b:4f0c:aefd with SMTP id ffacd0b85a97d-43b9e9a0c82mr15147421f8f.23.1774809587356;
        Sun, 29 Mar 2026 11:39:47 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f1749sm13161666f8f.14.2026.03.29.11.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:39:46 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: m.chehab@kernel.org,
	hans.verkuil@cisco.com
Cc: maintainers@bluecherrydvr.com,
	ismael@iodev.co.uk,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] media: dead code cleanup in kconfig for VIDEO_SOLO6X10
Date: Sun, 29 Mar 2026 19:39:42 +0100
Message-ID: <20260329183942.522693-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bluecherrydvr.com,iodev.co.uk,arndb.de,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-57520-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 75677353A06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The same kconfig 'select FONT_8x16' appears twice for VIDEO_SOLO6X10.
I propose removing the second instance, as it is effectively dead code.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/media/pci/solo6x10/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/solo6x10/Kconfig b/drivers/media/pci/solo6x10/Kconfig
index adb247847e00..cc4a7b088370 100644
--- a/drivers/media/pci/solo6x10/Kconfig
+++ b/drivers/media/pci/solo6x10/Kconfig
@@ -8,7 +8,6 @@ config VIDEO_SOLO6X10
 	select VIDEOBUF2_DMA_SG
 	select VIDEOBUF2_DMA_CONTIG
 	select SND_PCM
-	select FONT_8x16
 	help
 	  This driver supports the Bluecherry H.264 and MPEG-4 hardware
 	  compression capture cards and other Softlogic-based ones.
-- 
2.51.2


