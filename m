Return-Path: <linux-media+bounces-66287-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TBWAHfa/RWqXEgsAu9opvQ
	(envelope-from <linux-media+bounces-66287-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 03:33:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AEA6F2C0D
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 03:33:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Gh4RtV2H;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66287-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66287-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15D8E304B993
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 01:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF6C1E8826;
	Thu,  2 Jul 2026 01:33:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACB12147E5
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 01:33:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782955996; cv=none; b=vAkv5tExGVZiiSU7+gpB4yv7NHMNWEFTPGCEaxCjj4gEyCrCpV9EjUkHAnQT8PNk14nfvS3tWnKPmshHAe4MFtd04sQfnLx+bqDu9vYc8rIrS4pr8VxtATi5Ca0ChBVottshdLfovW+ypSHBqpZkpcrVJezFmLACIThWEtDXzdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782955996; c=relaxed/simple;
	bh=CWSDyiWjt/ugnMSYwwO5OPf9zuN/+Wou/ffegX64CzM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R3Mm67eflilagSF2qTsbdTeXsv2d7TdlSXw9mJ5MhAVMAgiBSAwcful5AOEdghMUvyigG5E0yDxF4YYLi3UvtHOwYtNKOfFZJf76tUO/v3itQCYPh4GlMjoYA2ZBSai2rJM/9/rnkYTswX3gc4a3iXy/dBS6Caa/GFlRrB/K1hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gh4RtV2H; arc=none smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37e11438c66so662789a91.3
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 18:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782955993; x=1783560793; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ul6MTos/9fbbByspAuoFqlFzSIa8RflOxwEJD5MGu+M=;
        b=Gh4RtV2Hadf0BB+UVUdMH5aLcf+ua5lvkBMdtVEXwHPiFRiYyFdZl72fo3cTMVW+1b
         MztANYx1kk9kYQ25sB+GLYyq02FkxUoVhZfqh0uHK1UXDnFGgNEQ4PJubxb1Jw/e0KDe
         fMfD2udtl6R2XdWXtCfrcyqfZA1zC26eHi3KuJlEZp16MZm+hpXYXz+nFn+m+IuHxeSF
         t6O+f7peZHJfLaTqeXJ8QWTcChO/F9P+j7verIlsjNtg5BE0DF192dXOGeglEoC8CVN7
         mBv28dSgGhXXzOOu06Yvc5urPDQyW6RDl+YaKItingWc8cjWDxd7Q9wXiOCXQXM6o39U
         H1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782955993; x=1783560793;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ul6MTos/9fbbByspAuoFqlFzSIa8RflOxwEJD5MGu+M=;
        b=aCs+Z4DwhdXuEXX7GnjHzoUzrJwb5dzq9hHJk2MtyK4b4lXEvA10FOx0ru3NfSKIBa
         3ryaC/SToSjTKWN8taT2uTe+VVo0+XNRNvxmr0vzbj5HIbW36CL04yfzad2BDrj5G5Qe
         yoZqBEwl0YIwJ2KEkOb/B7o43JMPk28ZJnRcZgYyjaBY92h7KJK3kQ5cihG47Z7ennfk
         HpZPw9uxDgd/2aAL0oSf5GihGMkMdzwnhlTqXrLgIOjnA935rl8BM+attGGxzIWvQAjC
         N2ctxPIMGTAbPE1ssDHBWpHcjFqVyUzaGxwWJrra7ti2YSR4+0Gxtb28OWE3ZlIRnCHY
         1nyw==
X-Forwarded-Encrypted: i=1; AHgh+RqJcwNgTUoZD8HQaV/i4qBo4Lk7/FqiLmJzMBBE3b/DvyvJ1e+MKE9ZDWrw270twPAE6Ey/95b/YEY/FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZoeWiYsgrlyx5DJK83d5Wl7VK+t0Sm4wIO8c754YLB0RDUiO4
	nqAxFt/s2ECUHbj7dxpBz3dp0Q+swo6i4jC0+hQpLJaKBREKxNneSCVfemTxizK9RDk=
X-Gm-Gg: AfdE7cmSy4CWqwEa3DXN0QbekYcq2yc4FnW12+N0VhRk0tJzq0e+WZtPjM44e1dhYK4
	39O2t6NTqyMuMVKDIMHHfNWm2FVIWVPfsuDn//pVw0Vqqox+0S6mKMj4HOcxoDquK+qHQKpB/wK
	z8qEd5WgTeXNOJIYeeiar9FplQDJaJjHkeo/QwD6Y8grkmQCMMXyU5kyBWmEeb1wpmY6oRkM6Zy
	2n6KtHqgyOp4GcbzilQJwTS57ARjFsTz1awoQufeZi6uIIcdRstMacIdtnN3sIW3WJ97C4WA/e/
	HvR/lA3CqSFg75hPQXsa6u3H0MSMdonzXwYr/N6VnSxYFOFiUr3BO7/o4rt1ymJNd0dl0tnLj4m
	69iEKYFJIn56wR5DH0ehxikiIU34zS+4ObnkI2XiXPBFrg/oY+eLQJm6/gk0H3U536enDbLtKSi
	Zp4pg/6u/Y9d1HT7iueA==
X-Received: by 2002:a17:90b:4e84:b0:37f:eda5:5169 with SMTP id 98e67ed59e1d1-380aa127da8mr3897035a91.13.1782955992994;
        Wed, 01 Jul 2026 18:33:12 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8901:272a:3379:8697:e33b:cbe6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f116065c5sm540377eec.11.2026.07.01.18.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 18:33:12 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Subject: [PATCH v2 0/2] media: Add Himax HM1092 mono NIR sensor driver
Date: Thu, 02 Jul 2026 07:02:36 +0530
Message-Id: <20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NQQ6CMBBFr0JmbU1niIiuvIdhUegUxgiYFhsN4
 e4W2Ll8yfvvzxDYCwe4ZjN4jhJkHBLQIYOmM0PLSmxiIE2FLrBUXY/6Qsp6ieyVKRwZY60jjZA
 2L89OPlvvXu0c3vWDm2mNrEYnYRr9dzuMuHp7+6zxrx1RaWWxtiUy5Xl9urW9keexGXuolmX5A
 Sgu2qW8AAAA
X-Change-ID: 20260618-hm1092-driver-a6f2aaddf201
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=CWSDyiWjt/ugnMSYwwO5OPf9zuN/+Wou/ffegX64CzM=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqRb/SbkC1CmTytrb/LjMBQW0MFUYC1S3yfd3K5
 Zl57cqWKvWJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCakW/0gAKCRAVlYpeERwF
 3trWEACZS4ShE7KbMfuvn22NL4vJmU9pf1RExD/TSpDVynuDv9nGRExJZlr5nUGoQg4BYDwo9KJ
 cGwMUiP03Hih4VV4PGZsuJUM/UmlWliM5e7eJmz846vijueqWjFYVF7Qtx1r6SPOGNBLz1P0Fd/
 ffzGC0ZDAr+TjkkyoxOFx0p8YQaRQPc1ypBTk9ZzSIh8TSt/Zn8hDD37eZIUmHtebN6GwjPFTGP
 0tJEra6AKELrTUZjgZVkLU1Z+PEgbx7lsi5+mQLj1bQUVP42GDZ22nrC3FzV4FMZMBnH2P4Wv6J
 Elr7JhkH1mRwsuCa5ML48hUNd3CLB9we3+UbvxyLxoTn+2Zkqmr33Y0JVM+x2q0dLLKQ6Zccz0F
 i81XDjtXEAOxsfDb344aLDzkbUMOpPnRtXYu4Jn3G5kshbA2l6CV6zue8zk2wE21aRTAYcBaUmh
 7a3PBZFk+cLCBPxYrdGVSytGAZSK05ZIsR48k2W9DhrHpUv4N4W9IOrPU1200Cpa25huwnkM0M9
 NItQcFdwAb+j4MYebWuiZfiPZPY34HzAsw+WKkDZXo6CsMrNv+qjkci2O0BQ2dTqwXC+6KP0A/e
 8zHDk2IuWo2uFBfoiBwz77Riq861zm7LdREAKmg6d3v/YpB0i40qsgVDfsFUZ6qwb7U+1Mxr6bW
 1Myv2awKNIHW32Q==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66287-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rshouriesh@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1AEA6F2C0D

This adds a V4L2 subdev driver and DT binding for the Himax HM1092, a
1 megapixel monochrome near-infrared image sensor. On laptops it sits
behind the IR camera used for face unlock. It speaks a single MIPI CSI-2
data lane and outputs 10-bit RAW at 560x360.

The driver exposes that one native mode, a test pattern control and the
standard fwnode properties (orientation, rotation). It has been tested on
real hardware (an ASUS Zenbook A14): the sensor probes, streams, and the
on-chip test pattern comes through the full CSI-2 pipeline.

The sensor driver and its binding are SoC-neutral, so they are sent on
their own through the media tree. The board-level device tree and PHY
work that wires this camera up on the ASUS Zenbook A14 will be sent as
its own series.

Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
Changes in v2:
- hm1092: use pm_ptr() instead of pm_sleep_ptr() for the dev_pm_ops
  pointer. The ops come from DEFINE_RUNTIME_DEV_PM_OPS(), so gating them
  on CONFIG_PM_SLEEP dropped runtime PM on a CONFIG_PM=y, PM_SLEEP=n
  build.
- hm1092: free the control handler on the error paths in
  hm1092_init_controls(); the fwnode-parse and ctrl_hdlr->error returns
  leaked the handler.
- Link to v1: https://patch.msgid.link/20260701-hm1092-driver-v1-0-d1bd81e233b5@gmail.com

To: Ramshouriesh R <rshouriesh@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Ramshouriesh R (2):
      media: dt-bindings: Add Himax HM1092 NIR sensor
      media: i2c: hm1092: add Himax HM1092 mono NIR sensor driver

 .../bindings/media/i2c/himax,hm1092.yaml           | 107 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  11 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/hm1092.c                         | 790 +++++++++++++++++++++
 5 files changed, 916 insertions(+)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260618-hm1092-driver-a6f2aaddf201

Best regards,
--  
Ramshouriesh R <rshouriesh@gmail.com>


