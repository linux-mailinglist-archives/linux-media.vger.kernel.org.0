Return-Path: <linux-media+bounces-67345-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UEdsICwjUmoPMgMAu9opvQ
	(envelope-from <linux-media+bounces-67345-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 13:04:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC868741586
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 13:04:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pkQx1TvE;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67345-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67345-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88E69301CA6C
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 11:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3726D3BBFBC;
	Sat, 11 Jul 2026 11:03:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38783353A9D
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 11:03:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783767837; cv=none; b=gwFEdbJCglGj3nnKz6NzoSzX2NRjUsxiwivGi2HYk3CMBWv0ft7srw6zeEu8xY8SoMASOikwIdTP4PxKCbR3oPHeg7/Z5NwWDoIr456jNPshnNYw22B8rq+9y9x2/1As0fHepW33TJTz1ZzV+oBQ22q4kPhg3wku0VU3+rQWMBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783767837; c=relaxed/simple;
	bh=UchqZ86qJMg6FrLzOi6+mrEHSa53xaG4ls+kWysXszo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gz7HEVOy9bVnA+RIreRHtXe+QyYl3/xpbDwrj7VQS/Tux5HhgnRULy6lkvpox32hgD246ryu8n885e4JgQrt7Dyv+f07gPdkd99O0h/KNToYdXrNI4ufMGGnrGVM/b7DOkmkKCpBoreIm6LBhgldKn1YIHtckt4ae+kdHoEW1W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkQx1TvE; arc=none smtp.client-ip=209.85.208.180
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c9452243cso16043231fa.3
        for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783767834; x=1784372634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wr/bKbooztvZMLtuYCL/NrLZFAupwlqB78kkriPts3I=;
        b=pkQx1TvE+drprVr/w4VQESQgwGa4OIrfaC6Ixw7t953X7+lidQ2qHJB23Y5SouNgVm
         /jy9GEKFvn7R0tTMhnYHMEjkJnUMR5Mwr5JWrrY/012ONVaO53lSXn1ZnZ6+2rMNiXvd
         3lQtKLQ+Fx3u5B39ThQN8MXuhCHBBg5wSKi7vRYTRWhfzmUUs1ja9RegEj+9fn/HeMAG
         F29BaSfzsFvRJ8uyuh8v0Op8FLvPnhE/I26WFOs0G5nJ/MMzL8XlgJsQyEx7h8mL78K0
         gqeSKRa/9GaBWROpf9BdWYCJRqnOn8RcbzzpoSl/Ubk/buodcwZ8nfOhiSxfBUeIYiRE
         WkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783767834; x=1784372634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wr/bKbooztvZMLtuYCL/NrLZFAupwlqB78kkriPts3I=;
        b=dglv7Xn3Kr0tttyc1qs7h45x3wJuJd5zhSe+yCSyF5cmlH7CNFTS9/9PHcIBOMKViT
         MJZf56kP8ACTITHA4IeuVq+OigIdv4AT2UFLP53JQTvLdUTIFarjb4yNx8y3x8LU38Yd
         3MMmjIOZGpSw36hPzgGw4gRKs1WwwtR7PXJRvTCcSu3b0Dzjpvkl94O7N2OX3You4fye
         t887zJFOuBrzMU4MYN2Sv8VbmPlPgTNMll02Gs3+zQDsPqGplhiLEu5KEB1jR2U0U57D
         zF5n74Pi/+pQ64ZAokh6L62t0w/CTCZcr6hg1MzwuHD5vaiF/olFTCFnWslMKK83/tyg
         u0ow==
X-Forwarded-Encrypted: i=1; AHgh+RrzRmne3KK0b/QNAOTlPJbwyXJmcernfZpk+48QUd3B7c1RwMe7GwhpcFCHc6tpJypZ+1s4UiTuU5Sd5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVGv1J2ofA+/tTLYszshHqnihTFyN3aNonT6olmg3K006VlnQM
	Xd8BCno2g70IfcO2p95YaUTYu8vbD90PoAsHJkrDvgDWc5e3EI7BWdTj
X-Gm-Gg: AfdE7cmAz2enoO1uBABVn4oYIv8XwdfTjB6Gxp/XatbuCUXT/+iM1M00oeeBqpQO7wl
	rjqR0Fid9qFzt2AwWjOFVoYRgpY0TLbJElhKkfBmYlGvdII05dsMYXg6y+WHujr2ibXTkzdvrYK
	aaIYxrLGOzjLMDEWzGJJY6zaVefKtaF13nd4Uogw7U5kSGkbjRbxUmiordvR0NbbsqO+myC0QEl
	N+DvizNZXvrtYJWf05eJZolotJSLPxmjaw5gm9iGA9mqN7bjSU/qB+d24Ncv04SpqFU+cAxmcIc
	KYpzKN2VHEcUBvrDL6jbsBu84trfN9j8qGCmYC3pRsQpocMS6KjW2ATYLM+JKQl3I8VZGKjKJkR
	SsIijw+5PWDUNzOYGLVWV02MZTS86DxgWO3aSXKqEEiBcmAsxv17f698d2v5KB/8I5HVoz4Xd
X-Received: by 2002:ac2:51d5:0:b0:5b0:f9cb:2979 with SMTP id 2adb3069b0e04-5b0f9cb2d0dmr318048e87.15.1783767834410;
        Sat, 11 Jul 2026 04:03:54 -0700 (PDT)
Received: from linux ([195.54.40.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm516488e87.55.2026.07.11.04.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:03:53 -0700 (PDT)
From: "A. Kalimov" <erqeon@gmail.com>
To: error27@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"A. Kalimov" <erqeon@gmail.com>
Subject: [PATCH v2 0/2] staging: media: atomisp: Style and clean up fixes
Date: Sat, 11 Jul 2026 15:01:50 +0400
Message-ID: <20260711110152.66188-1-erqeon@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[erqeon@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,lists.linux.dev,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-67345-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@intel.com,m:linux-staging@lists.linux.dev,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:erqeon@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[erqeon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC868741586

This patch series splits the original submission into two separate
patches and updates the function arguments indentation to match the
open parenthesis, as suggested by Dan Carpenter. Also updated the
Signed-off-by line with a real name.

A. Kalimov (2):
  staging: media: atomisp: remove unnecessary return statement
  staging: media: atomisp: fix function arguments indentation

 .../staging/media/atomisp/pci/atomisp_cmd.c    | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

-- 
2.53.0


