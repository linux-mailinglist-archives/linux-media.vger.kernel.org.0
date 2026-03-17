Return-Path: <linux-media+bounces-56130-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPQyFYzAuWnJMQIAu9opvQ
	(envelope-from <linux-media+bounces-56130-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:58:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC86C2B278D
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05CE730D4512
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 20:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C0838CFE9;
	Tue, 17 Mar 2026 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="q9Pu66Gm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64311E2834
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 20:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773781074; cv=none; b=nXzWczftZ+PumqQ/92IAXDyvRvt49vUBflbltIxLzycS/V8whVkHEHFIOrKNgDfBcRfnfKUDNpIG3opqQdpsBgWJzcxH6CDENVZ07QkyGPOr6gUBYzf/SCagZlokwd+5g0wZH/anYQneMP1DTEWPRgDP8gXfJFclmT9KK6vNfzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773781074; c=relaxed/simple;
	bh=KBXGcrYoOLPymfDZ/oqMz1swOTpgT5qAmz55HgttOTo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tr4GfzugWsgw8PsoTTvMmlpKijsh6IFfv9XODaWiKnaK98xeKIIoi8HXtCXLCq/A5QA7d1kSqId17BoRXnvmq5CH2VRGUW5+kBckLPaXqx272Vk1PppLa6gSfW7KYgWBXVCT+5cV5odZs9MStwBLzPYW39xumezf+BGVSrP1od4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=q9Pu66Gm; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64ca09f2056so96624d50.2
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773781072; x=1774385872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vUikfvhRAs/fvQcmGfcJR3gaiQI51EqYzE0HTND4fdE=;
        b=q9Pu66Gm+BEwdNPIXNcttFvjXvCTjJ2Dp5nIsEaNpF84mfXfGtDrb08TgUFa+kKe+e
         7/37JiGpukMxxjRILAGYzwojio742tE38swdNIzxoc5/AK0IvQTQzwenkAKyaQNc3M2v
         6eolUki/MNyqhe0LyC2wTju5bMEwc4AbtqCrynuGvGM4G+VttbykEknzcTfGM5tf5Q96
         RWlGPsth5eI7V4KQoDPT0PYNCa/qIDOUntf9A1i1bJdaJtXusiM4CM3W7ZAnwAVD1cn+
         +VzZlxhKmKZ8ol4nTCsoKVc8BG/ZNozq5H4yNKUSds0Dh4YgIcukYCI1SrPcpMPFgWmx
         s7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773781072; x=1774385872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUikfvhRAs/fvQcmGfcJR3gaiQI51EqYzE0HTND4fdE=;
        b=q3ebdlC5JsU88XKaPHbX3BTaig+A2pLCch2Dciq/CMJ7RaBXDPHQS0v4+twpyekBdq
         nTxwVLOLDVMZXHgdtgshrAfFghOAXcSgBo6p3YJzlrJ2qmdESmoAVHqq6o2pup2BPE27
         zE8+mF+/K1hUtPRwi1CH5mdvLtRwL+5qMvEtn2iNo8hxKxBuy6HrbtZOtqnX8BXzMOTD
         Ubyn4pYn8xGK+AJVm9eRpKdUVAgU7TG9e2Q6gMfKu2bSI21pt35GG6ho8IUsK9jda97D
         P/ydgCFsE/SqIsaL8CttnInlZPNAfqd98eYV/GjcIuEixvSR/OapJwlLhtfzPp7Qpdac
         twhQ==
X-Gm-Message-State: AOJu0YzAhp8wZCnqpAj7csw1w5hcg1dg7piQbnTg331tSvj0mk5y4lV0
	A3LEV/aJOXS3OczC1ArxxqtGg9kWzpL7UyI2XskDszNkJO/RKRuxvvBy9Edl1rtTit6Uxl+qbxJ
	KbiHPXyo=
X-Gm-Gg: ATEYQzyvuvIUlHpGEyxbmGhgufC8qcKT5aCJ5FDtXD4DbrvHBzPYgR1HaXkwZ5K/WFK
	pNwe71RPs334a2YfR1HyNqzmjfi9Lnxv0uIpDzUtjDjRtuUg5aDnMVQHF/hnojw15FEXJrofDpV
	V4xdDstROjCYt08R73C68blnUFO1eOex85dWrkW3eBYj4vdj8S4H3kRUn1Zqh85jnaM6jRLWNX7
	y1tzmUmKvVNZm65q8PIy0fMBT0+JadNad0dzmiEgs017IBIwRn5KJtT5c/D7DMEWndOK7RR61kP
	Dh2kKrfVJdVSwYNRRFxPC/QvWGWxwgD2t+00kwF9j5W6pk4YKhE0NdQu7CFjGaglw25Bxbr83N4
	ISLXKB/qZvXT8FXDiQtb8WhEhDRA4ZRobZIPFTBvx9PL7Yn50GxqNEvTiZbe4ms48ty0NHtVR92
	cbWlQKmzoxVrdG6M0EyuoLN31hzEw3CX4YERvyNMYJ1QpwgreNFMSwlln3TuBgGlMI+Oj5MMF4K
	t7il31GLjAMsk7bg80=
X-Received: by 2002:a05:690c:e3e8:b0:79a:40fb:9360 with SMTP id 00721157ae682-79a718c84dbmr9530577b3.22.1773781072383;
        Tue, 17 Mar 2026 13:57:52 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a713df100sm5141577b3.11.2026.03.17.13.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:57:52 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 0/2] Hauppauge 461e with m88ds3103c demod
Date: Tue, 17 Mar 2026 15:57:46 -0500
Message-Id: <20260317205748.3365679-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56130-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nextdimension.cc:dkim,nextdimension.cc:mid]
X-Rspamd-Queue-Id: AC86C2B278D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following two patches add support for the latest
revision of Hauppauge 461e that has moved from m88ds3103b
demod to m88ds3103c demod. The demod driver was reverse
egineered from a windows driver.

The m88ds3013c demod has some clocking changes and simplified
configuration.

Bradford Love (2):
  m88ds3103: Implement 3103c chip support
  em28xx: Add Hauppauge 461e v3

 drivers/media/dvb-frontends/m88ds3103.c      | 427 ++++++++++++++++---
 drivers/media/dvb-frontends/m88ds3103_priv.h |  46 +-
 drivers/media/usb/em28xx/em28xx-cards.c      |  34 +-
 drivers/media/usb/em28xx/em28xx-dvb.c        |  25 +-
 drivers/media/usb/em28xx/em28xx.h            |   1 +
 5 files changed, 447 insertions(+), 86 deletions(-)

-- 
2.35.1


