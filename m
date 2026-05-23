Return-Path: <linux-media+bounces-62668-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VLOaN8BNEWqnjgYAu9opvQ
	(envelope-from <linux-media+bounces-62668-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 08:48:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 088245BD732
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 08:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B7F5300BD53
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 06:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B0632E692;
	Sat, 23 May 2026 06:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUQ1ShLF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA12A25B0B1
	for <linux-media@vger.kernel.org>; Sat, 23 May 2026 06:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779518901; cv=none; b=H03b2wL1QNFvkUU6+a444zlJ3Qm4MwTk8L+RpNcbdUlvCZz1+FWWf1X065efLxz0GQIqTiydCDeAeQkekYdUP6JfO3oQ+cJ55uJrBCdjIhyaGBaLf6NTd7/BMC4em327Ja0FulR2YUnpuyHWCy9J1/8ngc6QZBbxzV48L0XeWTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779518901; c=relaxed/simple;
	bh=OhJBIZtPSl37iTCor/8pHea1pmiMgmwQ3W0MWlsm5UI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KkADz3KpCBCsykM1IBhi3+HCK+rRLydK3DJoW47v5ALibCyS8K8GCtpbNvJxlVUj7jCEl5wr7DDrT+9OZQbE3FzNw770B8nQY7Lt/NLfZGKtaoYcH7A3elq9iVZjEzU4PriHr92ctF8qpeSI7oJmrVM4G/hIVeDoXDvvsOCYC00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUQ1ShLF; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-678a16429c6so13200565a12.1
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 23:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779518898; x=1780123698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvbKAQfeepNA8bbLBATd/Y6PlNgiV7+B2hbMPq8f+ok=;
        b=QUQ1ShLFbRsDHw/iED4/qX5BTpySdMzjsXNV31xtfjUo6zXlGLLBtVUYs190B3/4Tk
         OzoHLiXlYzmE6os926HGB0SkFPh1y66N604yIAxouff8qO5oDg9dM2r2y+E0l5rNGfQ5
         +IameCPWAe7DqcoeLu7Pb5Ayg9DAIrgNgoAUGAL5Flf/kOcDuGMf5l/HyKaACnB1eWYp
         B1vqnFruOW5Wq9jXV12y9dEMRwJrCxSYHlRMkfW5vOZKa3V6xHW052ADz1YTVMvyOLny
         1T8+GNMiIZC8IlLdv8BjIh967DPw95NhyNzO/jrLPW4tY0v8ch0CqVk3GjEzXierfPvL
         UNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779518898; x=1780123698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvbKAQfeepNA8bbLBATd/Y6PlNgiV7+B2hbMPq8f+ok=;
        b=C3fMgkouC/wWIAburPznMRXO4xnwUlpd8vn6DR2ButY48EsQV2DHdxwCiw5Iw1cYTC
         5dGBBE7Z4twdeTtLmw6ElklrrEUvQjNWcpBnBg7sYfNmQeNzSdnrCXLPxB2XihrbYUGI
         7AUrV1CilaPaIFmvSGnAnga03cAuHm/6B+rGOtN1mM3gwblq5lxkGtVBLdhMPtvWFBBY
         aSGUOXBbr9Q9UDA3yBVr6ll+pTFgDvmkQKdgHODBZUd/ifHbqfU4KLmYskgDBKByMyRf
         TanVSC8mlLAdupCtXhEInQP1NULr2S60I0D58zJqXGHsQyi8cFbZGfV1bLhnP0GrbXtb
         N85g==
X-Gm-Message-State: AOJu0YxlcOhlYuynGRldcYrmXSjRVuOHl3PEJ1WG+rV8Db3eUJd8Jiqk
	fHcBW2a8thtzVcS7uXSttpbleHuzlfgf7rs69o39ZiRP0qMbR/X2RClQ
X-Gm-Gg: Acq92OEoj3DnkNklmW9kpIKbqjr8Xv3b9c1jmR1tTBSj1AatYQpocbOB7RHkwM7ysAa
	afdt3MS4EUk8EzBXyJUN0ZnRQvchUaxnddsLsEeFNAI/E13FxqLlMgMev4/CLQ8q73ZqK/Hn+44
	d4QH2KZeaP1mjes2THytlFyPon1D6xV45Z6rxE41ZqHBGE7U9PeQK3qjCDDOufj0ZTJlbss8RR6
	tM0ShdT7p++sN4FMnQ3xRgGiBzAVhg/9mtwUlm99FO51DX/cGYj4uB7giOWrcUGyeYZNXV0BKUe
	LrNZuGst2Nxb1XDezXr+MjpAZjuvryF7lxeGeqi3tUHO3ZgDc4HISSbqzqgRZ30V3Enk0/stKHS
	Y9tCQULcr6jYKV8O2wlnsWCXEtNxW+8vmhSQbEt7MZ6f/cOVqNhKchhU5Lbqj7Zdlo2cjP833Bh
	Zd8F+Rax0HfpqgQKbZaPVwyhs=
X-Received: by 2002:a05:6402:4049:10b0:688:e2f1:bb2f with SMTP id 4fb4d7f45d1cf-688e2f1d224mr1253439a12.5.1779518897892;
        Fri, 22 May 2026 23:48:17 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1532272a12.30.2026.05.22.23.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 23:48:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] staging: media: tegra-video: vi: improve VI graph building logic
Date: Sat, 23 May 2026 09:47:49 +0300
Message-ID: <20260523064750.35553-1-clamor95@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62668-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,bootlin.com,linuxfoundation.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.967];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 088245BD732
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The existing tegra_vi_graph_build function relies heavily on a one-to-one
match between Device Tree nodes and media pad links. While this works for
simpler configurations, it causes issues when Device Tree nodes do not
match media pad link logic (e.g., mt9m114). Switch to the
media_entity_get_fwnode_pad helper to verify and retrieve the correct pad
linked to an endpoint, rather than assuming the endpoint ID matches the
pad ID.

---
Changes in v2:
- fixed use of NULL fw pointers in debug prints
---

Svyatoslav Ryhel (1):
  staging: media: tegra-video: vi: Improve media graph building logic

 drivers/staging/media/tegra-video/vi.c | 78 ++++++++++++--------------
 1 file changed, 35 insertions(+), 43 deletions(-)

-- 
2.51.0


