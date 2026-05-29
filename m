Return-Path: <linux-media+bounces-63002-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKfxKrArGWogrwgAu9opvQ
	(envelope-from <linux-media+bounces-63002-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:01:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2919E5FDAF8
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D388930799F2
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 06:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FCE3A1E7B;
	Fri, 29 May 2026 06:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTfcriTF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE1D2E737D
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 06:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780034442; cv=none; b=mAkOJ8xZlpzJ43cGENzgq27HN+8+4g+1MygyH/BCBH6ILLZanbl5RcYt2cSN7HJioDitovXZ8nXDeHEFvOS620P5lSIEr6P54MMwciAVtUtgqLOozMveH8GX5aMN7WxSYRCR3CZfydE8pZ/SSgRLJWf/rHi1aAofFzdSG9oYHa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780034442; c=relaxed/simple;
	bh=LlKjfmg4uzjgcSwowvq2v2W/FzEckjJHb/li9GuSVSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=apJK59XAysJsYYTu0aFWGfZBVqh0s7UUgYmZZzDOBIIW81GMww21nU/TsHwifQv3E1XInSOUdmL/+WiczfrbQhj67nlf727DlO6yEhr6VYapE7+8nHgGMclIyr4rOzWlDb1wrTxi0JIjHcL9mF7h7ZHJ98FyKLmI+I3TCdwIQMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTfcriTF; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304ddfcf72cso1355264eec.0
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 23:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780034439; x=1780639239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3n5bXyy99k9iyvx4lY1kMjVmlRsiOyGImOOHuWaZn0k=;
        b=sTfcriTFichN/Y4ZJGQSnZInshHdN5ub8zq4Ppp69vuLdpj4MVC3H/sZ6e2OoXYJ5N
         l5/948sD1KBXyjRUzMKFJp1QD5WZ+qTIDXQdQxMOER8JocnIbK9VcrYAwcQbalO4dl3B
         H21/vTNM0nXTAAEiwM8SIHEx2XUxnpsW8OcjOXybgx49fE9ZJwW2B/LyaC/qj1t6/2sd
         DQJlVc7J16NOLWM7f7KOGIXgUhN/JS4Oo/dX61heZBObyr6g8FLAbOeFZIhLKl8OWRPV
         et6pYhKO7jSUcEs/xbXzLLXgzxQ8Q9ZMDoX1/Ea4G5fw/Y6GUW8AMeSq6PKiucr/rWE7
         sXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780034439; x=1780639239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n5bXyy99k9iyvx4lY1kMjVmlRsiOyGImOOHuWaZn0k=;
        b=hex2q7sAmtZ0eaaRb6eqCzwm3dpWsIHdeKCOK4G2oPoSC2wYcD3LVi/ZaDICk/4E6+
         DSHhX87A8fMvpc6oIg7dUoaw2jgOUS7wyIitm59a91AeyVgWatzMmSkKlcRRvk2EuSde
         Bsd97dxCNMN+5uwOLuoDnK70IffOn7cgPxLxgfLjex4HmIcluPB8FTW9SYvoUgssTb26
         TRWYSP3MmzlsKViGS6FZ5l3fxp6saY+QsxJrtFojkwnazjLTn5hG96RvJ9z/sPZV2FnT
         Iu7xuvE+vxnGFmxsqWwobqiKTe1nLV1R9aj7JT+QnSrXjCrTi/y2Li8qfI4YglMIDcG7
         fMKg==
X-Forwarded-Encrypted: i=1; AFNElJ8XIvNtCwuap7oxWPTl6QciZUZws2k2mvxeyIpZxST2T8udFaE8w85pSopNLr7LA42iAx9tV8DkoEyY6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcFohvfCHd+kH5UCquyAuTX73chQI8OOou68EUZmc32N+eGQQ/
	gA4KU70qu28eYf4dp/VuFOgQ01z6YeXV/6Ddd/G1S2qIdjRGRxgHYkJx
X-Gm-Gg: Acq92OEiPBvqoUIGs5+M5tDiWpId84KehJN1PuQIffRy0CfIz+8A84O6zeDdhgD0gWW
	241zsPDrhY5ayaUrnFaaKIP/N4Hw2ily/ROv0AtQHggdNdN1fwABX5dNH4jf8wmZs8/Nf1RFH8p
	b2OUCilQj0icXtypa2XNeH7WebcDTgO0KRIbzXjlwS4MqCbEOm5EirY1R6YBCCXwypbfmvGh2iK
	FvMKCXCyMFQJ3llyXGKeRIvEv4IGEcppb0nQEZwbnSxvKkSmbwrYhLWnzCNi/Gk95DGHV7ej6JB
	LAtdsSAEYaQkpDmX01Ttovpmt5FxFIZWgKngjV6CoiQYsxyL/SL6ibN1Y8i6jFIEF1MimlNenoZ
	9gXibws8R6wxLtQmHKNelcAXHD7DpZ4UdiF8/HvD5/Jwk3a2ZBedhz3EsTM9e5Wb0f60Run1iv2
	8zrzoVPRbfJpCtpuBGv92wuq+B3SXbKQ/bfqC9qng13AZnrpJpl6aLb8sNbkuOKnh3TiJN1tS+2
	uOtm9+UbDYkTBeRk4q4orF7dOxFzVdSVuv7QKuiqQlB7HIXpp86u6rWjmwZog93HfK/1qmuMsWz
	spYxgcI8af0edgGZ25cs3pRsf75yFoUb7W73kw08SqlCGl9n0REAhLrc6cL3wdiH3N0=
X-Received: by 2002:a05:7300:7f9f:b0:2da:44ac:6d17 with SMTP id 5a478bee46e88-304eb0d738fmr636180eec.17.1780034439290;
        Thu, 28 May 2026 23:00:39 -0700 (PDT)
Received: from odroidn2.. (c-67-180-34-11.hsd1.ca.comcast.net. [67.180.34.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c120csm674689eec.4.2026.05.28.23.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:00:38 -0700 (PDT)
From: Yi Ding <yi.s.ding@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yi Ding <yi.s.ding@gmail.com>
Subject: [PATCH] media: cec: meson: ao-cec-g12a: name the CEC core regmap to avoid debugfs clash
Date: Thu, 28 May 2026 23:00:05 -0700
Message-ID: <20260529060005.94700-1-yi.s.ding@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63002-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yisding@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2919E5FDAF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver registers two regmaps on the same platform device: an MMIO
regmap for the AO CEC registers, and an indirect regmap (using
reg_read()/reg_write() callbacks) for the CEC controller core registers.
Neither regmap_config sets a .name, so both default their debugfs
directory to the device name and collide:

  debugfs: 'ff800280.cec' already exists in 'regmap'

Because of the clash the second regmap's debugfs directory fails to
register, so its registers can no longer be inspected via debugfs.

Give the indirect CEC core regmap a distinct name. The two debugfs
directories then become "<dev>.cec" and "<dev>.cec-core". This only
affects debugfs naming; register access is unchanged.

Tested on an ODROID-N2 (Amlogic S922X): the warning is gone and both
/sys/kernel/debug/regmap/ff800280.cec and ff800280.cec-core are present.

Fixes: b7778c46683c ("media: platform: meson: Add Amlogic Meson G12A AO CEC Controller driver")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yi Ding <yi.s.ding@gmail.com>
---
 drivers/media/cec/platform/meson/ao-cec-g12a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/cec/platform/meson/ao-cec-g12a.c b/drivers/media/cec/platform/meson/ao-cec-g12a.c
index 41f5b8669..2c914f000 100644
--- a/drivers/media/cec/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/cec/platform/meson/ao-cec-g12a.c
@@ -405,6 +405,7 @@ static int meson_ao_cec_g12a_write(void *context, unsigned int addr,
 }
 
 static const struct regmap_config meson_ao_cec_g12a_cec_regmap_conf = {
+	.name = "core",
 	.reg_bits = 8,
 	.val_bits = 8,
 	.reg_read = meson_ao_cec_g12a_read,
-- 
2.47.3


