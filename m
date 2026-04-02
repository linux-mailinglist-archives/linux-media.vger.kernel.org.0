Return-Path: <linux-media+bounces-57927-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNR9DAoizmnElAYAu9opvQ
	(envelope-from <linux-media+bounces-57927-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 10:00:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5555A3858D2
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 10:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 307BE30AB463
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 07:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29503876C0;
	Thu,  2 Apr 2026 07:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="AhxMXZpr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE939235C01
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 07:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775116249; cv=none; b=EhBlcxwllGCm0KZKFw6BgMULq9Gu7rcxDIqDveef+dxmpUqee6cJScE3GqUATbuFUuQ0vEz2p8y3YJ4BBDz2MFEozh6CcAG9lXSsOrf8s5I+CJix4VRQNqK6HDoM4yAIXwB1n//3si3jRIzP1XxL12b0ZuKD4fH3a46RwDMVuXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775116249; c=relaxed/simple;
	bh=czfxnmzXViuK8LYBCaMOU9PhSX26RAsbF2dVUQK+RL8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NqTZVjsU3+jlWh0eMEYqQo6D0Qa0rcP11v6BWcBc3P/vnLrTrbSHNYIP4mjuesvDEKbgxUFHZs1nlVi++8MPHYjqLjqucZJha/MzDki4TV61+8iex4bBgdwJapG0nYScuP8ME0EPOIbWSci3MAFyAGbq9538MNZ0COGgVVQLmzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=AhxMXZpr; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b23fcf90b2so5230545ad.3
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 00:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1775116247; x=1775721047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=En+fua7i1xnlRCBY4EaRbPlqxfU5rNh3zfCWADN5kUk=;
        b=AhxMXZprrJLao+VB2CCZMiHq+gwjrjPax9nLjhJoF25Z4ejLw5kQVXgQTfmemb3G+1
         1bNtZCZ/Hahcg/8wl3GR06CZnanSP78XZ7XTPkR35kxSEH7Lio5JzN5g19G0oI/6pJ5v
         g1CgrP0r+2FiWOg9swnOwCYLH9aOKOz7bv/kKMHw7mktG4ZmBnUVmqfQZmhrUKkByU77
         aK9PudyXCiTGr9iGYHhQ+PUlGUyE5wCsW5aSQYA9o6HtTdxsyJ90L5RFomgP7ABlZRVM
         babLXNt1n6nmfgXB7OEFxF1GgWHn94QhXQlHGvQqWYJMbjPAJJx591TjqlEqWAq88h1/
         SmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775116247; x=1775721047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=En+fua7i1xnlRCBY4EaRbPlqxfU5rNh3zfCWADN5kUk=;
        b=X8qC3Hgt84pAEwYbDnQtaTsJmRljXf0OkhR8WrIlXelCWa88g5atuUpLQS103zh5c1
         Y80zGv9Ec+SEfFyp8NtGTCgNDg2BXoR/KBxF5JQPWYC0FgmTDK+FY/E93RICmoKIb5/b
         5R4zChlSD0m/2soe2Q7LgOqvrOwxeYNpBXttYAqnWLah2xyY/w9yQywSadNZ5vZAQubB
         NeO6GKQb8YawfFliQk+6znIaeb4V+iITZ1TOulscbH6L0Sh7zfM3rmMZ5uw6mFaMv1Qi
         Xs2y5hqLD/n1hYmR+8tiKup18WUfyep3UOgki9o8CF30KwwtZfbSD1NVapHXAEfRbmHQ
         lXRw==
X-Gm-Message-State: AOJu0YxmtILiPkfmdTi/w+NVJFWA9SeFHDtG1Nkh03R+NsXlAPiIsnEo
	3RERwcMxoSf2QOgABsiPco0fluGFjQHGfQ7RgfQfoUn+NGQs/hrpPTwDIs84eSO1Kng=
X-Gm-Gg: AeBDieuIrMvswEa22xqqiDWPTCV3YWM6DWjakGNF4rr1oyuzhvN8iE3R8XSfVk/INjJ
	Tm8fw49NK9URaTn9D5KIF0GrDM8aFQ2+sUkJnyzZj8eGjZLSx+T1LfUmJg8XDB26mEzHDU10lbj
	Yt0mbkdrEXbKVcadZpLvaZWsT9i3+1cKroHb6a0QUu5oImZqjiq5d4fNzAEZN4vdQnch+aKeB03
	8IxJuvTIfS+2Mf3UjKalnPtIruKj8U/kmgbK2qC7f+amkSt8jHpJb5AR1fOK13WSXOpEIULg6Al
	EKegxy26NqsGGUHqxkVbNFX8/hsLP8L0P3TAkOraRp2Rb/K6wy3hPum15EO6CJbT7EqEjNQthU6
	g7JewkgcM1cKJDwtQGcqUrTCu+3QsF1gKyL1oCfBxLIvKEN4aNX0Z1YVj3mCDVtNslmO1P8sIw6
	YXNjEZ51J1AoUtf2c2gPPQ5gafjoHbzWC8uw0/QyoFOkrAMY+nLEftc3slbNm/a/59Cnt/y/47S
	OjVxpvpr5HZ+Sh3Lgd7lA==
X-Received: by 2002:a17:903:2ec3:b0:2b0:66f7:f7cb with SMTP id d9443c01a7336-2b269a8ca44mr62732555ad.7.1775116247083;
        Thu, 02 Apr 2026 00:50:47 -0700 (PDT)
Received: from localhost.localdomain (211-75-10-161.hinet-ip.hinet.net. [211.75.10.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm19813955ad.33.2026.04.02.00.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 00:50:46 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	chrome-platform@lists.linux.dev,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Guenter Roeck <groeck@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kells Ping <kells.ping@quanta.corp-partner.google.com>
Subject: [PATCH] media: platform: cros-ec: Add Kulnex and Moxoe to the match table
Date: Thu,  2 Apr 2026 15:50:08 +0800
Message-Id: <20260402154921.1.I71ce228a830321a80f99a9ad830d027132859e56@changeid>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	DMARC_POLICY_REJECT(2.00)[google.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[quanta-corp-partner-google-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57927-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[kenlin5@quanta.corp-partner.google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,chromium.org,linaro.org,lists.linux.dev,baylibre.com,xs4all.nl,quanta.corp-partner.google.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[quanta-corp-partner-google-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quanta-corp-partner-google-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 5555A3858D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Google Kulnex and Moxoe device uses the same approach as Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Ken Lin <kenlin5@quanta.corp-partner.google.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 419b9a7abcceb..4b3f9bff6067a 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -334,6 +334,10 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dirks", "0000:00:02.0", port_ab_conns },
 	/* Google Moxie */
 	{ "Google", "Moxie", "0000:00:02.0", port_b_conns },
+	/* Google Kulnex */
+	{ "Google", "Kulnex", "0000:00:02.0", port_b_conns },
+	/* Google Moxoe */
+	{ "Google", "Moxoe", "0000:00:02.0", port_b_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.25.1


