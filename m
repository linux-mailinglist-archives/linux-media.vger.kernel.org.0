Return-Path: <linux-media+bounces-58475-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHAUEMyW2GkgfggAu9opvQ
	(envelope-from <linux-media+bounces-58475-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:21:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC83D2B16
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F327E301980E
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 06:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4384835AC36;
	Fri, 10 Apr 2026 06:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRsLdZWq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D73E3164B4
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 06:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775801998; cv=none; b=c4SfglOqrtfTz7YIMEkfZWo/JuwaphL1RpbQUJvdFG8hUtI9Kj4EReEW/bvZ6x8OMLwNvandPJ2sKuE4z68PjsMUcL6qBdd828aoC7H6jD227o+N6yU9rkfgb3Vd34/cMqYx7l3qq4oe4IYcCm3AG1CvNvKRSCWyhO6fGXjCLr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775801998; c=relaxed/simple;
	bh=tZV+3EaPdwOVaVUFAuhBUWQabW/p/QaVSzzkduxUmq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C9lRnTF0AYpmkcK1Bvi68+JrWAoKX9WgBq3Wp4v04QJrSkSUqDMlmtHt5skiz1H0pI/BOD4aL40quLp3NooiQeXb6AGIaEgQ3X+1dRgeiXCU3V7gxEpNo8Y3M5+Is7Lymc1kv6jlmvGJ4kjZmiCcyTgZfJ+R9akxgjs9MYTxKFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRsLdZWq; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so2279740e87.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 23:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775801995; x=1776406795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XSgfy41aI9DarA8XGPQnGZWVfFjZIrpcCwSHb1sSkMs=;
        b=HRsLdZWqb6HtLw8NJWBhS3h2Ba7mOedTf1KuxFwol0Wc6z9k1JTUwAVJKTSFNn6ydo
         i5vlMX9D89LtERiZmLZaH1UFLrKElHmHSwBfT0jmTiYFB8I5GtTOwtCanMUxi5qA12W/
         B67lJweK/anNP2HrjrVxoSziatuNqg1vo2gNrHoLAnxgSkc4+thUNygrt4wL0ujyvIHY
         tAuSdRIzWs6QI8co/CIWJq2EOYTm8hqazb7dWt1qwlmjUR12jhFO6tch0IHucmKw+2eY
         3f66z3w8ynEOBgjax9B9UV9x2Qqa7enjOohKDOtLWUoGfBEfMWwcQD8ZvMTXd9hACVAe
         7pDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775801995; x=1776406795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSgfy41aI9DarA8XGPQnGZWVfFjZIrpcCwSHb1sSkMs=;
        b=Zmi+pYiiFAG2em0oXSOJIiYoTh/aOKrbXT9CG+jKVv4a6PZ50OHHeu5k1hkoxZqTpt
         rVHLvUYoT7os+dEeHeWv9Spx3BNLtYEwoFeHQ5aprBrqtJYupTN5GNjdlBBjpeLBVLX9
         QY3DDllr/4HiXIF5gAeD3nA7DtCEspHOwyb5XUtpreUCWYQkQthho6tGkCjUECvk6DPK
         l3n0LfY8zHYmcGZDHb6SB/96ouF8rDBFmrSknv/7st+mv3ONIaobDIij3XH2Quf42A/i
         j0F11v1TlU8GfiLDE4yCc3gjzNnOxptWMAwXeQgrMuimu3iUdIqsFQM+Hd5vf3PjjVUv
         kY1Q==
X-Gm-Message-State: AOJu0YyX9xz6FRHJd9VS5LLfZPTWjrFuR2Sn/URn161Fn3f9yOyB9Pbv
	J29GjsusLB9ZrWn25GGrtPeob/nYatNiiYaJSJkw75DcQzO9fLSllhKigAiwfIvDu6jSYw==
X-Gm-Gg: AeBDiessBU8j5qHkPmNNmmhOpK2X18gOobFfyKUypiiCGWQMXnVGERRHw6MMCqwjBju
	AkInHkFEHJ2zwlZo1+7m+fOR96xlsE+mSsdSf/Dfwovwp0AqrmxMVL6U+FDz3DlIxsULTADT7zG
	0i8TpNCgAxA1F1A2Yaor40lZpt3zPP6tMNQYVyUK5d5C9bgRq8Iy+zyM56CQ/gkYyhnKLaDZYoC
	1w1xCuvTOE28r0xQGIT2G8UIwZB4i6VKeRct5NrG2WwUhdzGf8aalt2mEKCFdtvvDv1x+JnO1NL
	y6NNBGrdgjY1rBlewwcO+ILXBTQqba/Y8QTah4JhQsfIMvCB7fcH1U9K0YvtWLjbWLuGndWuE39
	loz91OGP3RllU2WxjBC7O13RPiPs0cshne4PJjfIbpNIROGGcAHfKzg6L076BpOWc7IITo/RQB6
	xJx4DqK96cyMCZwwAolA9EmmUJ76dr7avLzIVA8YA=
X-Received: by 2002:a05:6512:401f:b0:5a2:b58e:e3dc with SMTP id 2adb3069b0e04-5a3efb2baf7mr722446e87.24.1775801994779;
        Thu, 09 Apr 2026 23:19:54 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8673dsm490506e87.15.2026.04.09.23.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:19:53 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH v2 0/5] media: i2c: imx415: driver improvements and fixes
Date: Fri, 10 Apr 2026 09:19:39 +0300
Message-ID: <20260410061944.241480-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58475-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,wolfvision.net,raspberrypi.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B7CC83D2B16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi folks,

This series is a rebased and improved version of the patches I sent almost
a year ago [1].
All patches have been rebased onto the latest kernel tree, commit messages
have been rewritten, and two additional fixes have been added.

Changes since v1:
- Drop patch "media: i2c: imx415: Add get_mbus_config() pad operation support".
- Reword commit messages.
- Add Fixes tag where appropriate.
- Collect Reviewed-by and Tested-by tags from the original discussion.
- Add two new patches:
  - Fix control handler initial count.
  - Cluster horizontal and vertical flip controls.

Alexander Shiyan (5):
  media: i2c: imx415: Add missing ADBIT1 register for 10/12-bit output
  media: i2c: imx415: Add missing CSI-2 timing configurations for all
    lane rates
  media: i2c: imx415: Add missing 4-lane CSI-2 timing configurations
  media: i2c: imx415: Fix control handler initial count
  media: i2c: imx415: Cluster horizontal and vertical flip controls

 drivers/media/i2c/imx415.c | 153 ++++++++++++++++++++++++++++++++-----
 1 file changed, 133 insertions(+), 20 deletions(-)

[1] https://patchwork.kernel.org/project/linux-media/cover/20250219094637.607615-1-eagle.alexander923@gmail.com/

-- 
2.52.0


