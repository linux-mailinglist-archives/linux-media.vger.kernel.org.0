Return-Path: <linux-media+bounces-57468-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOD3NB0syGlWhgUAu9opvQ
	(envelope-from <linux-media+bounces-57468-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 20:29:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 550AE34FD07
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 20:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D28753031833
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 19:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB26346797;
	Sat, 28 Mar 2026 19:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmcIHFWo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595332D2382
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 19:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774726060; cv=none; b=gvoAmSumDf4vJGzU0a7ELUgWfw8BvdKvhv60XJDSObDwb91RPNdKgeaqeIOOEpNV0t22EhTNm45MZ1GD2cjKcU7qdcjwglYGZd5UdNo19qvSQDPUqXnypvhZLhTazwTxf0qqZ7UiGUmko5m3U/h4YVt1c0NXpYaf1YxoXF2WuZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774726060; c=relaxed/simple;
	bh=GVRxR9DR6BNTeMbwcgOSckR9scW3aYPHHGFpcnGc7ME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MOLWu0k0eh9+L7+n6HTaZD1wmGK3V5welDTr9oR6KGoG6GPmLrG5sgSbcNTYEm8Pid0PA8CLQAhdZ21z/f4NXeR/13qwPGrJOxno8M4nyZPWxnPrgzBNg6xrEOVfjSmyK8NZyMw4QArqAkh5POq3kRIzzH2EVZzSm3bnnLmUBSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmcIHFWo; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66b957dd76dso619024a12.3
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 12:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774726058; x=1775330858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSeN3V88uibyEs5RYs3jHhul9aAk7hwutPM7RxvGY8I=;
        b=QmcIHFWo+qUcpPweiPqlpnY3SLwIcMpJYk4y5aBlli7Nc/bCKNw80f13tAuFvWgtmJ
         WXhUfhPIJ6QRwPKX0O/NHaK7oZQuA6DY3rUSpS3M/xJqt+mAa4rc2VjEX32mwTH9fAgv
         F6+TN0MMqSdQYYSeA7TrjI8TEyQYnzTixXdWi7diJ75BPIfrtnQB1nWTkD08lGD+KUVh
         xUR/lrzf63SUxx5MHgm1LMf/OlRY8dah6aOZpUUIChL6I8Z/g6aLxIuUpowa4xE57JEE
         giQP7BcYBAh4kZ+jcbPNsSVGYeJLitbVNgIgft5AxAQtoP89o/r8bDgF5V6bXVfaNYGH
         PhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774726058; x=1775330858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSeN3V88uibyEs5RYs3jHhul9aAk7hwutPM7RxvGY8I=;
        b=c/4fBzwyfuPOibzxmQkIncXHpcks2qqd2Wd5/n+oGAt5BVTffK88EJYBuJFB7PGYff
         OF/Edxy2+cJKKgM70I3NSh9f7sndHE2CM2lmjcVghf77n4p4Pd/dJKWPwOqhXc3MtEuT
         VTLjFnHZyhmN8xQi0KkhBDWK8havBE77KQm46F8jhojwHQPJ/4hVgeSYt5p1+RrQ6Guk
         reL2F7P+n8HuS6TQCI4uDuC7EIMCPH5iHxNPgB+v5pCMa+wCSlOAzBIQwDA+TprzkS+V
         hFGqgtW4tIr+4zxackMKf8uHUu4JZ70IOfpMveZ2R43Y3EXnqNCVSfFmzBuOFDSgTPF+
         5YtA==
X-Forwarded-Encrypted: i=1; AJvYcCUETIjxG765G55+av0/77HqwanuSXDFwtexyV+ECcAf+UhZFppJCTwpLlxqSgRCkq+I7CFhv3+yRuQaaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrCGFJE+IbM18QQz+cRUAACIbBtVFDwuMXTlCOj6HVzAjx3B5n
	ib86JH6prpGgHA56ZMQy+sV1rKJuguZT8atLbe2mfEMSuvtq/LoXagFy
X-Gm-Gg: ATEYQzw02nUy6YZOPfvp9k9BOEo9IxL91+SJ44Qmn22SmU/4SBLwPxYgEexBbcaEwLZ
	WnqFgZZ10ycvaIyRIH7Bwj6S0WPBpL1TFufYpci5QPr3w9YUBZUdhbPW73QY4AKDL/78fKPd/Cn
	4JECwlDvltuiP0HCByu9sjwTmgRD7JHJUy/Q+xY9rwbvUKeHRLYCmGoHFbU5zR7ztmBtPKde7j9
	7y/jIreG2I950zeeFrzbSO/mCwM4evTYztbZYLpqyVwIl1a+kpucGC+X8FljXGwdrl4gdwnBMh1
	CnM28WAps0n4Vy3W2nM2cNtEXu25QaOYyAX4yvx7aQ+eaj6HwEVzU/LwwRvcz2LNggbxSzbX2OP
	MUv7JQoNa2/PWt9/OcnG8soILYS9OedsxBvfqRIhpOyh9mNAqd1eXJMOgVdcO3yJNh98bXKMsWj
	o4NG5oMQhviT0xw7+g2HmFquztej7mVi66OgfdLVe6mj6rWDXWgAtmteuz
X-Received: by 2002:a05:6402:40d6:b0:663:71dc:127e with SMTP id 4fb4d7f45d1cf-66b28757b27mr4092857a12.13.1774726057583;
        Sat, 28 Mar 2026 12:27:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:18b7:e580:68f0:a6ff:fe88:bed7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76081af8sm857420a12.27.2026.03.28.12.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 12:27:36 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Cox <alan@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 0/2] media: atomisp: harden and clean up isp configuration
Date: Sat, 28 Mar 2026 20:21:36 +0100
Message-ID: <20260328192721.255493-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57468-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 550AE34FD07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series addresses stability issues and technical debt within the
ISP configuration path of the AtomISP driver.

Jose A. Perez de Azpillaga (2):
  media: atomisp: fix potential NULL pointer dereference in
    configure_isp_from_args()
  media: atomisp: remove redundant call to ia_css_output0_configure()

 drivers/staging/media/atomisp/pci/sh_css_sp.c | 48 +++++++++++--------
 1 file changed, 28 insertions(+), 20 deletions(-)

--
2.53.0


