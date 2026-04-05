Return-Path: <linux-media+bounces-58059-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4t3YJuYr0mn8TwcAu9opvQ
	(envelope-from <linux-media+bounces-58059-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 11:31:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E03E839DFB1
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 11:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77194300B075
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 09:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93D0303A0A;
	Sun,  5 Apr 2026 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEqaZi7/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053E12517A5
	for <linux-media@vger.kernel.org>; Sun,  5 Apr 2026 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775381467; cv=none; b=l2NMl5K7spWi0Llwl58G8EfKqWNObAUCU0qgaZE0r95JDn47Ft48QtJc/VRHit0udn0FcFbbldlQx6rYJx4KBCwY+lAfYqcX7oPI3bdcoJt/joIXcYluu9utZ57Cml9jUlk+ZH65Ik0IHRCJmZPl4mH83Rtg1J2TYXXaCEpsqtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775381467; c=relaxed/simple;
	bh=I1QQxUsSNrQ50lyL1JZyBC4jdCaPKFPub8EGFfbJjqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TYfupY0RzXIU31XyAlh3Jf4OBGXH+9lSODuTQ1nl3l1S4n4ZoXipGRRMC2n4xm1+BeBYvory/IXgC3cIIxkq64FZ2lXaolL7y2uh6WfUooV8u+grtF1FD36Dk8Jc8RBzpsvbZ7bTt+y8L01a4jAYKZbV+AhlvnPtBP0lv2F1cwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEqaZi7/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so24979495e9.0
        for <linux-media@vger.kernel.org>; Sun, 05 Apr 2026 02:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775381464; x=1775986264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Bk6jQ+DS/ptDGbi6xpzIUAs6Ea35R0oXfWRyiGUH/U=;
        b=cEqaZi7/CfsgzsA4jT07RK1Se/9V6aPPUaGAbG+cjKFvlnT7KnGIrNGzBGOBnMH/jw
         dYzaH8YcqnpZ7Rvk01JisMWCEfyt9XF2vo6eY61YSEQTSMOWM0DCp1uiAjp3Jsku7ELm
         r41YSvna7sQcQtpCdd66oLa1P7uQyv39PQfiMZF1RvykPojUhVfeYh5G0NT2en3JYoJi
         zMtpkqBjPBDBcluiYnBfppHp6saoNcNSWmnqlbvWIHiZHAlsIJ6PMF7SqzunqiQ/eHEf
         01zDsY5mnlbj6nJsXTE16RYysac1PQ5eBOLHrbF+p7U9+TxhEvxe999ZUU+gqlNA1v9d
         affA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775381464; x=1775986264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Bk6jQ+DS/ptDGbi6xpzIUAs6Ea35R0oXfWRyiGUH/U=;
        b=fCcSWLb/r5wYY2GgjFF+1eI/dLSiGN1/C6eZEOzy5WV9+lpnag7Q6/NvK3tnii/HQf
         99+aGTcON1k7FtgHGj3046ii034UQAiRyG09SZgGV/xucp+uXdTSR8WJ2EET9spilCFs
         rlvNgdsHcX1Na057lr2YM5gTYPsVB9dv1nLsOCV9YU21kQ6KPckIfY2JjG5oQpjzvybL
         Cmg/U0XGNw6ykgQ6rCWaiRzMd9AKAZKvrz4lrynq/h3Ys8iQwtrZsg4FmwwaJpD5hbLc
         fB+obyMCyTecqEDd/JGugP3aHldqvKiQvg4lYIGxaNJW1Krd1uHOYOlLSlOlLLwKzqiQ
         YhVw==
X-Forwarded-Encrypted: i=1; AJvYcCUIv5iEiFOWdpM40tFWysD+rDBvEzB5zcvxjG/exzNE3HzddSZOJMFCNPiaQ7DBPEdh91nZHOCMIQEn/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2zdvh0Uapz72Wtr2NnPN7WsRO+OnuRK3jQqm5lTGk97tqBQVT
	vCN1xtX2Z3GM66yHI4AbtglnYUDrtvnj4qvMyqjoagwUgynZzOryq2r4
X-Gm-Gg: AeBDievAYwupZg+lgN8VuvOOXO2bDr2YcFSNcWZjk7EjS4UuhmCx1tfPOoBKtq2e8fL
	zbTR9+whctbxJsa3bIYKciGee++8kYu1QRuvQFlP1Aw+gvp49tz+7ertv9bJMvRMRd0JN7vVmUf
	JjFyg003X/Ovhd1uuzKF8o/eAJGW87SyWrPxGiWUDvYj3A1wwOmZAClSshzQfasQ1pwNpkq+FXX
	YgUDR2crbipgd0QS1HesD0/l4Hx6a939XTTfB/JLqEGefZpePiqdcUl1fVZdHtGQlEmFk9F0EN1
	bkt6zPP3WuDSG5qftws9PZyENXKj71ZyOvwJLhWbCH6oDO2DRqv9GlQiTR2x6RGFUvI/MOcBctJ
	yosPXHPaxCRME6iofjY04GemWUKFF0+0o67P/Qh8d2WIiTY3B+G+d+ZQCQXXIduvepO9Nq0x++T
	3WA+cvP8CltR4ChvIWhyYSA8xR4bl0bP0AE0evRPsoCK/Y1w==
X-Received: by 2002:a05:600c:c167:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-488997810bcmr138229235e9.14.1775381464113;
        Sun, 05 Apr 2026 02:31:04 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1c83:b0bd:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm29156707f8f.29.2026.04.05.02.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 02:31:03 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 0/2] media: atomisp: clean up ISP configuration path
Date: Sun,  5 Apr 2026 11:30:42 +0200
Message-ID: <20260405093051.515222-1-azpijr@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58059-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E03E839DFB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

NOT TESTED, REVIEW CAREFULLY.

This series cleans up technical debt in the ISP configuration path of
the AtomISP driver.

Resolves a long-standing FIXME by gating ref and TNR frame configuration
behind the ISP feature flags that already govern their allocation,
rather than unconditionally attempting to use frames that may not have
been built into the pipeline, and removes a duplicate call that
overwrites the same cached state with identical values.

v4:
- Added more information on why it is safe to remove the duplicate
  call.
- Added link to v3.

v3:
- Picked up RB tag from Andy Shevchenko.
- Fixed typo. (either -> neither)
- Removed 'staging:' from subject lines.
- Added links to previous versions.

v2:
- Replaced NULL checks with feature flag guards to address the root
  cause rather than the symptom.
- Updated subject line and commit message accordingly in patch 1/2.
- Expanded commit message to explain why the duplicate call is safe to
  remove in patch 2/2.
- Updated subject line in patch 2/2.

Link [v3]: https://lore.kernel.org/linux-staging/20260402183402.444630-1-azpijr@gmail.com/
Link [v2]: https://lore.kernel.org/linux-staging/20260331211649.421777-1-azpijr@gmail.com/
Link [v1]: https://lore.kernel.org/linux-staging/20260328192721.255493-1-azpijr@gmail.com/

Jose A. Perez de Azpillaga (2):
  media: atomisp: gate ref and tnr frame config behind ISP enable flags
  media: atomisp: remove redundant call to ia_css_output0_configure()

 drivers/staging/media/atomisp/pci/sh_css_sp.c | 41 +++++++++----------
 1 file changed, 19 insertions(+), 22 deletions(-)

--
2.53.0


