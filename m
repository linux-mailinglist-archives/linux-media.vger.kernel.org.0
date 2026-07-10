Return-Path: <linux-media+bounces-67286-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iywKLhvgUGrK6gIAu9opvQ
	(envelope-from <linux-media+bounces-67286-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 14:05:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A0473A82A
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 14:05:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qzIsb8WH;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67286-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67286-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7A7A303D4F9
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F24225788;
	Fri, 10 Jul 2026 12:04:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lr2-f2.google.com (mail-lr2-f2.google.com [74.125.230.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CC13F44C4
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 12:04:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685042; cv=none; b=AMDdhrVA/wURz41Q3D+xTANdFrMwoYEKqWg34xgfLUC8tfqIIM/mZjMm1Gwi+mnKg21x2GNSmtiP1gxZuGgeVMn5Od0m3p4YQsiOCErgVcYFnRWRLTS3wQPBAgyp+IIRgfaCEcrflRYLo/TINIiNiloXCVdLhpgrYpe5rdtK6C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685042; c=relaxed/simple;
	bh=WL7CAyctWqbMD1lDY38XIB9JCsSS5Zy8fxNNdcSWqvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QprpnsiCiGi29A6NcMBLjy6GKHekhapayXPHNwk8EACH4pEdZSwd+cRcfMXQJqo89/9J9ggbsZndo0QrhYbd+z0HlEm5PfvKaKiYuVgAKLRWoP8W4R+slSJqt89y+nNwmc9pkkUjIGdq9m52GixSfKiGl0UfqscZmq/bwckHjmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qzIsb8WH; arc=none smtp.client-ip=74.125.230.66
Received: by mail-lr2-f2.google.com with SMTP id 38308e7fff4ca-3967995bd4eso4033621fa.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783685040; x=1784289840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xcf4r5sTg+oDnQqT1CT5xS2hyQlkBYtTPYIVLQPZQcg=;
        b=qzIsb8WHHbnqI5nnTAam6HaKumyO3u/LHaiF2zdUqrAW3KOdG3Hda01whH+XwjL5cP
         siJTiqsIcHVyrmUB+8DpbAA3s6Mx6U5gYGddTujTEQIXtCaCzcgQukehwVYQVcb186wJ
         TWhBSGpZ8Cp0I598vEiKlclAvxTP5eFqc/STC1jfNOwr1CFzGbZ0Dbc8dpuBbsxqcOTH
         pkWY7PwblpWKPLVorjODkdTYrZU985crMnH/GCFh4DRvXKIWCLv4ZVfqWczfk/kpAQZ1
         QOkomxGBQhwDo0FkdoUp+9voDyjGC4V3/LbXQbZCgI/5gH57/3gQqqZRX+5IIgtQNh86
         ASfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783685040; x=1784289840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xcf4r5sTg+oDnQqT1CT5xS2hyQlkBYtTPYIVLQPZQcg=;
        b=PcJVQK5Zh1XlPtCYOPo1lozhzevqkeuiZieMo3E3O1HEx6zWYBkyLbH6USoKXc6aUL
         RrrurqmOPmIAfpU5+cgCadyiZGjgVXHR3jbJ3sdcOhOt2JnxF0fscbXsOWhUgJV8MYxT
         Nc06K2UF0nsbSgNSDkyTBLLlzBcAvhwQH5iYa5tUrz7/C/N1gPBz0cmxI6d1RVJ9Fzj7
         etCX6acfpoL0k2/HQybz2JU5HJ8v8ssJzkEl4uioknH3SlErJaIxglkDq5r5Sh0k3k5V
         x9axbdU78YrmQS2axFdkTyKJh/n7KULRBmk0WUWyIRFnZqygO/afvOqP4ae0cmuVAvXU
         0xcQ==
X-Gm-Message-State: AOJu0YwJE1aOpMwDdefEPWnySMuwG05grNME/kraztUu6Fj0pjwJe1LW
	4ntgm+r82TPk87eFleto3QpEK24EI/vjOo0ZJa/uh6mxLKNWiq3RGbu+I2xCZs9gfba7aw==
X-Gm-Gg: AfdE7cn/2oJiXHko4hwcUcA46Wk7HduftaxEmNjVHVOZqNaV9uRe6LDaNtbSC/8CDw+
	T7hOOeRICd4mKPotqI4zuX864f2ub9PamukDfLfNoHEO12RFfGkAspcRkTJJ+BNlZ7HUIyU1XQy
	lxsi0njb+yJCmjTdu3ruuYkwybfmmZQjf4dSpFkh1FvBz9oiykSzkbZmJkRcyvi+rEvZCBIFbMc
	qy1g7/6FAUm5ahBLpnX8u8s2EVuLxtUuap2UM7cqpsGFAmwiSibwy1Ulkx4kxhsXq9GTmI5xtLQ
	xMjGqlijhYL9s+o3KLhhbyyBDntWA2/jgZ6N1kwxiD+9JIdKwIV1EiPE32/F+nnmcmM8SHpXcNO
	Z8H6a3sFjCkbRuPNGk+CKTFIvmijrzAZWXq8Jm+8cmvn359E6wsDe2A9VnM/5W177onZkdHCbnH
	I4FRoWxrfHYus=
X-Received: by 2002:a05:6512:1418:b0:5ae:b77a:91bd with SMTP id 2adb3069b0e04-5b01141c182mr2415498e87.3.1783685039420;
        Fri, 10 Jul 2026 05:03:59 -0700 (PDT)
Received: from fedora ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01cab0191sm557397e87.72.2026.07.10.05.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:03:58 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH v2 0/2] staging: media: atomisp: clean up comment formatting and grammar
Date: Fri, 10 Jul 2026 15:02:52 +0300
Message-ID: <20260710120254.23565-1-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67286-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bohdandmarcus@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42A0473A82A

This patch series addresses block comment style and grammar issues in
several atomisp files.

Changes in v2:
- Addressed maintainer feedback from v1.
- Split changes into a logical series (headers vs .c file).
- Fixed Doxygen-style comments and line length limits.
- Ensured sentences start with a capital letter and end with a period.

Bohdan D. Marcus (2):
  staging: media: atomisp: clean up block comment formatting in headers
  staging: media: atomisp: fix grammar and punctuation in inline
    comments

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 14 ++---
 .../media/atomisp/pci/atomisp_internal.h      |  5 +-
 .../staging/media/atomisp/pci/ia_css_mipi.h   | 19 +++---
 .../staging/media/atomisp/pci/ia_css_timer.h  | 63 ++++++++++---------
 4 files changed, 52 insertions(+), 49 deletions(-)

-- 
2.55.0


