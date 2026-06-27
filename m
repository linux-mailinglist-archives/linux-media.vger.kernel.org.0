Return-Path: <linux-media+bounces-65791-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N4o+On+fP2qGVAkAu9opvQ
	(envelope-from <linux-media+bounces-65791-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 12:01:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE2B6D1B29
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 12:01:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=aS9ZxWCY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65791-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65791-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D14933024424
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 10:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A63439E16B;
	Sat, 27 Jun 2026 10:01:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B601F03DE
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 10:01:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554485; cv=none; b=BIQiRPosV+O+hDUZp27mctR47ic0a+cHLOQYeVZOK/81mo96Ub9YjZ82XnHX19igVoetNuoWeRY1oK4TEzCm36cfg4oleUBAT0Av6dOISWJpztHK7WYX3VFJVhuABj93YZx4AFUaSMC87nC9O+BMNlckoopYNKVu9rDaByC8RNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554485; c=relaxed/simple;
	bh=Q4X26gF3FIeE0mfr+42yvWJhIHihRbHHkVhGLJSduTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oit5+t63VQ8Alwv6Vj8j0NNRI4UBSOjzx0CPQa7fAX0xobsaBN9gvEoaI7MMR3RbFezUQ8qHyZ27A0PGsRR+gfBn8VotZro4kP8qpjlesBjcI7ja94LkKUZ3wAy5iP5hBCyg36ICJgu2wyUiwYIdgyUCBgb1JXzZbxdXm39T81o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=aS9ZxWCY; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4936e85e0deso1608725e9.2
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 03:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782554482; x=1783159282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aPKfMtYxIYBX1BeW4TAoukGmm+MSMDeiJBTDybJOUas=;
        b=aS9ZxWCYOvjM4v5+bZrr9T47ATyEXfMbM8Ds9Bl7CJKo0bttXcVSR5hSmkqGb8UONM
         kW+z/OQ1yqtwcQmScy6i2zPH3YJAGKXerVTAvUb44JX5Nx8ovs1N6DJbfA1PczuHfF2Y
         MX6zKkva5AiEUgktp6009YoerVJIIDDnrlHV5nniZtPOqEmbse4/bxt7O+aACwG+E6Lw
         LZLceCG8vgTcouED/MxC3o/DWui872U9qe58PmLC7CBI6jL/KXCHfNIgRLv2XLCodMAA
         yG5t88+hTrJRv26y/lKhm6LZ7ToWX6cej5BR+4gy4Zr5X+KvZkCSnzpM9QkoLLNYGTad
         zoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554482; x=1783159282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPKfMtYxIYBX1BeW4TAoukGmm+MSMDeiJBTDybJOUas=;
        b=mGcJEcgWeFGb8rrtDiBAJ4xhrP3HStprrMDjaR/GIHArUoIJjYoNTDHiSStpF6LAr3
         ocEMeiP11NkvcVeXdmcW2tiMUwhqz/GRAXivZ8N0Xb5ejQdV64pVfOGaDI8MM9DX8Lc5
         6QK4GLEc7ZVVxvYYzcNlge1GVxB+THws/AmXuGMVvA5VFAsJJxN4VnbfnxaOJorDwwQB
         kQWJcteztUfioS9pYnOrlBci7y1u3B0sEABazwQ9b4ZwW3UZ++D8vAae1RqnxlJYLDkt
         Il5AM/j+69ZttamlX9/4L7Gyh+hM/pAg1gypv6VZ2Q+TYBU0mIZDrRdbKIl0JWmv4tf7
         rWVw==
X-Forwarded-Encrypted: i=1; AFNElJ+U2wB/vKqfB3ofX6fJw9o+IRS6eA2bXQYZBq7K42c+dRYOktLiTjWXvqi1oXPYLIg1qnIkNJ+EGqhWBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yznmi0KfA1b50De9tQvX2zYKLf63ASHUR1JG8+4Jh7UzTfTG0gD
	Sfp2x3+bApvO+y/WCnq6zYs25hIe81fi82T/usX/HfEY3LBjhieC1wwjY0NCJrSeeTfc
X-Gm-Gg: AfdE7clLMy4YPjg+QpPKwEjeUwAelj0Zmfr/v+FhHMHDqjHNTXBuW55kCuMfizKpZO2
	mhM2dX0Ej3LiJQ5LXsI2s/HIG6s2P8bpBKoqNDHU4cQKoCkHW0xiMtCSGQl5EwZ0DE7Zl4hr1Yb
	MjABCbc8izwNDEv0FqwIFTyUeeAi7m29Hmjr0/6R2UIFWrZy3B8/pwJ34OA+lk8QglcNtng+Krp
	BSFAdge3239PPuqI3fYGt8KJXok2A9VdxohxBjlMyZPCN6RjXHckOtBPG2BcqZwZFoTGWA3c5Fo
	7nLwmBf6OHMqlO2BHHGFszSMJN7mgtEYsrV6fRNR7JsRZR2r19L/d9pGlFMgBHIkWsAdunJ/4Zi
	l3BN8GWtKl5iDtFg+n2hdPSAgjE8uxV9CwWsdBXljqDO8Qk6WzfQ+P/7ss5YD8VreiFQLoaAe0c
	aKx2zShcy0bOMNuzaba9AcWM+CtJeHLarn8jtV6pqf4a07XRnpR07bCKuDXzFXhLZq48B6XA7ur
	FcfEv8BnrRZOYmnRe+UEta2uOb+EnvPCmo=
X-Received: by 2002:a05:600c:a49:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-4926686b4aamr139558135e9.1.1782554481807;
        Sat, 27 Jun 2026 03:01:21 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49271465f35sm69047735e9.9.2026.06.27.03.01.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 03:01:21 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: hansg@kernel.org,
	andy@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v3 0/2] media: atomisp: validate user-supplied buffer sizes in two ioctl paths
Date: Sat, 27 Jun 2026 12:01:17 +0200
Message-ID: <20260627100119.97650-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-65791-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,vger.kernel.org,lists.linux.dev,0sec.ai];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[0sec.ai];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[0sec.ai:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0sec.ai:dkim,0sec.ai:mid,0sec.ai:url,0sec.ai:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FE2B6D1B29

Two ioctl paths in the Intel AtomISP staging driver share the same
defect class: one user-controlled field sizes the destination buffer
while a separate user-controlled field sizes the copy/store, with no
cross-validation between them, so the store can overflow the allocation
with attacker-controlled length (and contents).

Patch 1 (framebuffer-to-CSS, FPN / S_ISP_FPN_TABLE path) bounds
arg->fmt.sizeimage to the frame allocated from width/height/format.

Patch 2 (S_DIS_VECTOR DVS 6-axis config) bounds the user-supplied
width/height dimensions to the stream-grid-sized destination config in
both the ISP2401 and ISP2400 branches.

Reachability caveat: both paths are private ioctls, and private ioctls
are currently disabled by 2b7eb2c5dc72 ("staging: media: atomisp:
Disallow all private IOCTLs") -- atomisp_vidioc_default() returns
-EINVAL for any non-zero cmd before the dispatch switch -- so neither is
reachable from userspace today. These are hardening of the
disabled-but-revivable private-ioctl paths rather than a live overflow.

Both were found by 0sec's autonomous vulnerability analysis
(https://0sec.ai) via static analysis; neither is runtime-reproduced
(Intel Baytrail/Cherrytrail ISP hardware required).

v3:
 - add Assisted-by: tag (Greg KH)
 - drop the explanatory comments; the rationale is in the commit
   messages (Dan Carpenter)
 - note the private-ioctl gate in each commit message and here
v2:
 - add Fixes: tags (Dan Carpenter)

Doruk Tan Ozturk (2):
  media: atomisp: validate sizeimage against the allocated frame in
    framebuffer-to-CSS
  media: atomisp: bound DVS 6-axis table dimensions to the allocated
    config

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.53.0


