Return-Path: <linux-media+bounces-55225-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NinCZh5sGnLjgIAu9opvQ
	(envelope-from <linux-media+bounces-55225-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:05:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CE2257546
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A6C0307096A
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7AE3E8C67;
	Tue, 10 Mar 2026 20:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cv7aEvua"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED713D0911
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 20:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173129; cv=none; b=Wt4qGlqvGgJYI4Cay3MONHKlbGwSIdCRUZ24Nxa2oDN2epnOOLvoWZn9v+WYQmjaAJugCghxvfnt+TsH3n4RbrVqYsEgpCFbAMLkH5ec5DH5HT28LH7V2ciSqdsABm55hXGtSDGNjrsI08SX4O0fkTX45xupYZszg5glZ++/qYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173129; c=relaxed/simple;
	bh=Z7KkLhRFeePaDbwSTDbKrcgBLW7TjWvswDGzCPD4kT8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jVtwM/0Mb7sx4r7OaJPkY16pVg2SxDS6KEqC/+vC421B8SAQlDHcMFut1ty82/NeyGKVUc58cri/tiM8wfosOFvb9NfqTIIguagXHiPf0PD4lLgcMiVESdUfswOP55kDfIzcDU8JYhqNprMUMW4aPe75fOt9yU2oOgyC5aII/ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cv7aEvua; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-829ac4670c4so2907977b3a.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173128; x=1773777928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJVrvD1HBF3SziwDh/X6OiTy3x6h8raUxjDiyEKbXMI=;
        b=Cv7aEvuaTJjlxE6ToeboD/dDUlVCCmRlWL5q/si49UqpzZ96jRfnNWm2XQV4AwJL5c
         no0+uC8+/RWx81OE263dpcQte+5LSDSQVoKAGcLVZCHAdr5VaVOM9HmFDFv4et65+fbk
         DFeHEl6WRIURP3d2Umu4KmBrEtKb32xdsnTm1qyEEYyodR+wUnINWtFDwVvlihaPKPch
         PHQ7pIUlNNc9C8jXmuE1T48kR1/+uLbMOS5fy/qCTeoFg2KMQKrjkHEXcj06j6/MUe3m
         UFeFXROmlbG1RMAggqW3+Nel9ovYOm+G8T6puzTipRzoPytkaCWcXjPN/WqMzmRQksIb
         GqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173128; x=1773777928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJVrvD1HBF3SziwDh/X6OiTy3x6h8raUxjDiyEKbXMI=;
        b=sRXejCoZPGV2uuShKL/kAIKsUcXb1T1iCWBfPQBo7iKhZMMvL/5IxOTO4UvJ3xUZph
         YGU1ZhUDHX6TL02UU0QEwNSb4PE+IOxoVXnZ3uks9BOPIQv9wZGqOFQ6kkYWKw0Lwqsc
         nrQ38jHgifVUprblB4OSCahjAZS1nN+cyoAYkr7yVvzJjqErXnDIKmZf7SO1ppI9bY5v
         1hBgeYAC/i7p8yr2SACbgcv8Bz5+oRjaoPLzGtLqcD2UV63b+XD/mE/Y+66/AdoU8Bu5
         Zwcg9eZOa+weUzYF7BcI0xCRloUecgLCf0OSQtrnpOaQXPXzmqN52EUBmeDwnfCcekDN
         t5Og==
X-Forwarded-Encrypted: i=1; AJvYcCUk0LTqbm25pU0JTqplALenpK2dFweUlQiIHFvknOanM8l9cUtQzuSTpEeASwY9UqSBW6TK8q5gZ5YgAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrWiXHG89TNPSPuIaGgy2wQGZNHPpnBuUVBbzGCNsVOaydLz6y
	oMy2Mev+dg6SBDa8tTVimrj8SVCSgiuKko2JO4WcpLwtHCmcCATVzfR0
X-Gm-Gg: ATEYQzxRG9rR3iTivnBecezFHYnWOU5rSaq/gqwdn8VVKkTX7swYOyr/la86FGrPhpi
	ZJ8QSUPj8x5+fMh1VO5lFe4R8fQEdYWnr6Qy/rYM4Y2oTRQyt/7NZeRdG+ocvcKaax5be6rVr0o
	F/tanH2ZI++qL9s7HS5pC8D07HHW2CGgIWq1btn8oVPUEBoEMXWww8yOgbHm969iCTqyk0BWEgl
	Z0D6FgBduAHOAVkySpa1dkrArVXkYk2Z9Cnx65RNH47JMb6HKKKFU/CXNo/mJqbCYuLmHbF1EQQ
	6uXvyjG+pvZzI14BxV6tqb2Az4rDxGs+5Zo3GHL8l6O2A4FdAUzYodbpv5PVlDMcn5qSr26Y/eV
	83iZBXXqhSsMsIYU+wNW76o53w1vhNuyHinfP8069AM2TjzCUqWB3M921LaAA3fOPT3neG0aPw7
	KisRMWDBLWIkZgQmkm6qDLkYbbFiKaVj200lTA9ooQ798PYULg
X-Received: by 2002:a05:6a00:4fc7:b0:829:8bb4:1030 with SMTP id d2e1a72fcca58-829f7104ca1mr127969b3a.42.1773173128160;
        Tue, 10 Mar 2026 13:05:28 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:05:27 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 0/7] drivers: Simplify cleanup paths using __free
Date: Wed, 11 Mar 2026 01:35:06 +0530
Message-Id: <20260310200513.2162018-1-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B9CE2257546
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55225-lists,linux-media=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Hi all,

This patch series replaces manual cleanup and explicit kfree() calls with
the __free attribute from <linux/cleanup.h>. This modernizes the memory
management style and simplifies common error paths without altering any
functional behavior.

The __free attribute provides automatic scope-based cleanup, making
resource management clearer and reducing the chances of missing cleanup
on early returns.

No functional changes are intended in this series.

Testing:
  - Compiled with W=1
  - Build-tested on i86_64

Based on:
  <linux-v7.0-rc2>

Feel free to share your valuable input in context of the cleanup API.

Thanks,
Sanjay Chitroda

Sanjay Chitroda (7):
  staging: greybus: simplify cleanup using __free
  iio: ssp_sensors: simplify cleanup using __free
  iio: st_sensors: simplify cleanup using __free
  media: mediatek: vcodec: simplify cleanup using __free
  media: chips-media: coda: simplify cleanup using __free
  media: allegro: simplify cleanup using __free
  staging: rtl8723bs: simplify cleanup using __free

 drivers/iio/common/ssp_sensors/ssp_spi.c      |  9 +-
 .../iio/common/st_sensors/st_sensors_core.c   |  7 +-
 .../media/platform/allegro-dvt/allegro-core.c | 95 +++++--------------
 .../platform/chips-media/coda/coda-bit.c      |  4 +-
 .../platform/chips-media/coda/coda-jpeg.c     | 39 ++++----
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  3 +-
 drivers/staging/greybus/camera.c              | 27 ++----
 drivers/staging/greybus/loopback.c            | 35 +++-----
 drivers/staging/greybus/raw.c                 |  6 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 +--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++------
 11 files changed, 78 insertions(+), 197 deletions(-)

-- 
2.34.1


