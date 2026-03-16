Return-Path: <linux-media+bounces-55907-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK7lKLEEuGlpYAEAu9opvQ
	(envelope-from <linux-media+bounces-55907-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:25:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5195A29A4C4
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C64A13018F3F
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C06396D0D;
	Mon, 16 Mar 2026 13:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TH0eGZ6R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EF826059D
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667471; cv=none; b=drFp9h+dHb54mWtdKI73fD6HGXk0jxHy8H6a8f65leFVZbh9W/o3h5zKQZzef7NfaOt6USFR99OJYlYWbHVJFHWZvBR8mYy9YxKEf54npJNhd7PCfm4iYnZwnz0CGRUNPf5gPtDqjQkQ4yPecUk5eM/UC9063c2rEB0W76rQZyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667471; c=relaxed/simple;
	bh=uvWJauKXSefzKSPxaT9L/GktZeqRXABudH6S6maDdGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bfddhQ7WTnmyDKel520bR16DYh58QaWLC4Pa79oRYFWGGJhoItRpWLTavEGnAJNCODK9fyMoufSodkjC8FElunQG2ofUnAkvArObrDfQL0/HJgGD/zaCDZ+OnQqGHU0u9dtcehTN6A1vOZk5BZOGnkFMLmx3k1uzx/Pis2aKqco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TH0eGZ6R; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48535a0ef86so38303105e9.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773667468; x=1774272268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uj/zzF5O76r5j948IQp036xrZTnWvC0n34mi6DCs8vA=;
        b=TH0eGZ6Ra2xdif6ldAZTnUlPh5ujXdokX8KHSI+5V83qkAJT35HEJb3Rk3ulOb1bFA
         5OO41iJUfmfKGi9Y9MBUBGtNMOUt+nPrT4C8SaPZndPdWGX7FqU1IUoU+CwC9y4oklwI
         887dT4WXgC+xezLv2jTpwCp2Hi8KqR1S/TgI+93afgUBVU8CJHll0MO0hxiTe7UDVRwo
         Pdyj7kXPUzNmh5FUCZk1Ah4/OAZlsczsJkn7G6xCV6JE8J7QRMozG88U/WT4P8n+ifNr
         +OXrLzsBwQzMkYislFOgtOgGMN5Hq0s3r9u35VcM5bCUQQAbb4lojy7ZA7gON8kfn3OC
         NXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773667468; x=1774272268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uj/zzF5O76r5j948IQp036xrZTnWvC0n34mi6DCs8vA=;
        b=aPfvzI6nC+xRU/fst4P9T86hjsUvb9ESUTKAWypkaNdA9p0oglfeVViPbjvPY/Y5IS
         4ZVcP2+HYeIcjeBSSDpex34T3ptzHVpA2BdguIeZNPGJZkQTUzqGtHGTAViSBCcbRMy3
         epJIqa5qqoRB5DXwFBzDr4TIyDXZAQU2+FoQ5GZRh8cRKtSRn6JJpMb5VvrfUmkHXxWc
         BAf0u0H/1cZFd50QvzMYZQqtX8Wtpd7bVTFcjtinmdDra53hxAAZmCwD6EQhDQihE2pC
         igNMhnZ2hkmMrIvFoc3mTuO/TSXjjGnKbA5eCQNKpiq+46hy6IKOa7lD+VT0pxVyodD1
         dtbQ==
X-Gm-Message-State: AOJu0YxgmGgvjB2qlR/dnf3g0DWkD4+600lclVgzU99ueQm2YJjPLXGG
	bZEZdWhDQvs1nhviFXxtlqBI4wQ2DzvrT94owlEis1iWF9LycnMVYKQ6GB2e/WZB
X-Gm-Gg: ATEYQzwZQXo8BK4Z+3ZFDYoJ7cXSJHqDBQk8+dM4QTIm2mhOED7PzVUQe0GGcywk/49
	w1ZSQajY9GcsIr5hFQF2FhtXwTV8BbiFI55wxT5s56M1XOV3jgdmuOf9quTxunW7h23b1FWD0Bz
	GzcfK1kA3GVHu+X1DaoPAy+LB7blSKR22QqAn9Rv1b4w/45seu/u8ujeqw8CdcJZW6D94oZal16
	blUgwI8x1gh/246rj6eI9t52bH2kYHuuM0taS45Q3BYFkAHuKF7okOTHqyYY3udaaHhvUktjHFR
	OGkxCCSxWlRraGYdsD4Pa/TFX0Vm5TwqAUU/C5VPPJVcp5NagnMaLe+sVT007PRYgEN95BbyAmq
	I/FvBQUaqno0e4xlqc1Yps1wvctGCECM3yyUaBXSNcfzGH4+sZuxffMpxMnbYBp6vVygan92dvX
	Y+XhGc7kkNx8tSrjNTO6zJmU1ZU4Xw8RHCXa14krG3aQ==
X-Received: by 2002:a05:600c:1d0f:b0:485:3f38:3de3 with SMTP id 5b1f17b1804b1-485566d2fc4mr213814535e9.3.1773667467653;
        Mon, 16 Mar 2026 06:24:27 -0700 (PDT)
Received: from sarah-VirtualBox.local ([147.234.100.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ac17f2sm472938825e9.6.2026.03.16.06.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:24:27 -0700 (PDT)
From: Sarah Gershuni <sarah556726@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sarah Gershuni <sarah556726@gmail.com>
Subject: [PATCH v4l-utils 0/2] v4l2-tracer: fix expected frame length calculation
Date: Mon, 16 Mar 2026 15:22:21 +0200
Message-ID: <20260316132223.7337-1-sarah556726@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-55907-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sarah556726@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5195A29A4C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


This series fixes the calculation of expected frame lengths in v4l2-tracer. 
Previously, the calculation assumed that the stride equals the width and that chroma 
padding follows the end of the plane, which could result in incorrect lengths.

Patch 1/2: add plane_bytesperline to trace_context
- Introduces `plane_bytesperline` to store the stride of each plane, providing the 
  necessary data to compute accurate frame lengths.

Patch 2/2: calculate expected length using v4l2-fwht info
- Computes the frame length per plane correctly, fixing previous inaccuracies.

Together, these patches ensure that v4l2-tracer calculates expected frame lengths 
accurately for all supported pixel formats.

Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>


Sarah Gershuni (2):
  add plane_bytesperline to trace_context
  calculate expected length using v4l2-fwht info

 utils/v4l2-tracer/trace-helper.cpp | 55 ++++++++++++++++++++++--------
 utils/v4l2-tracer/trace.h          |  1 +
 2 files changed, 42 insertions(+), 14 deletions(-)

-- 
2.43.0


