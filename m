Return-Path: <linux-media+bounces-63001-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOK0DOciGWqVqwgAu9opvQ
	(envelope-from <linux-media+bounces-63001-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 07:23:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD365FD4EC
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 07:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A044930640BB
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 05:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244103A2540;
	Fri, 29 May 2026 05:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEk0OV9j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB173A1A54
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 05:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780032177; cv=none; b=qNGH4hgcbRDZgDrPkC3gYryYqEFCh1oT5ZH0DbC0aBTY0CSQQY3I0QmlG3TrMsoU27yMt/r5y+Yr5witb1wiLY3QIK2VQ5t2J3QH2LiBGIRK2C1pZX0z3MYVNeGLnaZ+aso/x+QUZ0qVVnBhevgMM87F3C7laEg1VyWz5k4v/qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780032177; c=relaxed/simple;
	bh=T4zdCWM1w4bByz1c2cKlwQxSjvPUfAWxKCPZoEfbaaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVGI6HhKpktTJwq9I9HkvdV9Kpb2cNEwMeTOMl0jYszjyIkKd5L+JBG93axVxoGtGCnrH5E6rLJFUsXFWArbG80Rh6FkVkeKCicryKgvXmsp3vjQ0CctItnOV0YA3vh5LNOHzpn7zTjJW0KMVUtVo7YkgNjPsMU3IpnOG5rqbcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEk0OV9j; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e603d0ee0aso4444872a34.2
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 22:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780032175; x=1780636975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8y9FkhHEIxGsnXBCWmwSdl4mvBOFnGqj5GzxpKDmAM=;
        b=bEk0OV9j5MhXcLpOG4M3BtcPjzQtGedrdafbiKEL5fA/80u4ibpfB8QdWiT+N8hEGI
         kofIVM2hXj6MjFEybPNSaEOqtatA97LbA7FRW/1BYPXXblLC9waPZmT4jFdhtXFCnThK
         AzObzdlr/YS7+b5yjOQW3+6ICfNJhRtGrzf2Mrze3d8TGr7c6VXxoE6QjPX02gg0djoE
         qksZ0lPDpn3ovc+H4+8JRyqjhqke8NSCoAcCl95WN2Q77MCEOs1QuGGdeO6p6O3FLech
         i34DP0D0uvAd1hRoqSIe0o10VfEdEKPpWLRNVdc7hlki3jeCQkFJeZAgyit6Ci3SkNiB
         apVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780032175; x=1780636975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q8y9FkhHEIxGsnXBCWmwSdl4mvBOFnGqj5GzxpKDmAM=;
        b=drE+h65uVkOZrY5IWCeOuFCiYHPoop2NilbUD9xhIJ+HysIchSeW/Ju85JePuGaX6s
         Jg2dxw3ytSfATIV6E+CtSRUh4kT0nSWujU/Cl/oRYx4E2nvC9WHF6LyA1LOQmCfxpSHg
         KKF1uV3pEk4ZgOb2lbfFqucFtb4AQqj2vWr5xNXTz5CNJiWcmfXBZcZ/IdwZOW9UVnyn
         3HMlj4HcUysMFCfsh7E2cBHz8OEnoPZD09LTFbj3yqdFvP+f/XnRWv431O0hkNXJY93c
         oCyE3dz8l3lXLMf+VVVyTUOyO8SOti0R0gyIa2QsCzJIHgyMXKFiTImFliSkg7xd9OkR
         Gztg==
X-Forwarded-Encrypted: i=1; AFNElJ8YF2sUr7tjip0+cfcWxC472IBLgvCTBlGe20Oe6oOn3zN5E3JNusTxnpc0tFbJgLP07I5OkVTz7EQNhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUNz43y/hX2zJoPYO83jS1h61XGFbXI/4nYAYZr9D8kexFYxch
	jOq2NGRWdy83JS3kkYyFFKJOtE22uCcoG0BvGuFcovGnlgfYhof98YM1
X-Gm-Gg: Acq92OFzlsa+RsIIFhhisVSedtWMJrEG7pCXE/ibSk9J5sBuHp/bWxa7ypOJ7/QKVa6
	ktVUbjy0lwtrfl6AdLyRnkKQFtQX/nK9YtlQ2JUEpMACubvtSlmfM9dnSJk7UzON8PKXIV5uN8i
	clrCZBXavtUlNVZtRmEQxIm3jatWUuyOWdYB1myI6IkGGSpX2hiWKe5ZXllpET1cVVeEDSnaIbQ
	2RMjPXgZsATh2p0Cz2k+ApCpDnrJWYVoEKG7m+uiip/Eozlb4912ccuIYOWTJfdmN6KQkptXrFH
	ClATEHChmeTPfw7X8WsSRl7V7kATOIeNxAYYVs5FMKIeYFGikx2YATVCiqc9qjCfLbr0o/1kGg8
	8XsJB9ia3AQfD10j+uZ452RbTOPOIHOXQWtVyXluN1AKC/xhk297z1o5cRQgRjL36z0Vt/kW+Dd
	vlk5e2Vrov2kNYfXEnuS2vqLRh7GIrUKFzsxQb6++ZUixhN8UiZqayVvWjDDoM/as=
X-Received: by 2002:a05:6830:8285:b0:7dc:dd58:50a1 with SMTP id 46e09a7af769-7e694db77a3mr1174335a34.15.1780032175559;
        Thu, 28 May 2026 22:22:55 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695bd790fsm760909a34.10.2026.05.28.22.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 22:22:53 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: media: remove obsolete rc.txt
Date: Fri, 29 May 2026 00:22:39 -0500
Message-ID: <20260529052246.4934-3-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529052246.4934-1-akash.sukhavasi@gmail.com>
References: <20260529052246.4934-1-akash.sukhavasi@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63001-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akashsukhavasi@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: ABD365FD4EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

rc.txt has been a single-line redirect to rc.yaml since
commit 7c31b9d67342 ("media: dt-bindings: media: Add YAML schemas for
the generic RC bindings"), which introduced the .yaml schema and
reduced the .txt to a stub in the same change. The .yaml has the same
filename in the same directory, making this redirect unnecessary
for discoverability.

One file still references rc.txt, forcing readers through an extra
hop to reach the .yaml. The stub has not been touched since August
2019. Update the reference in hix5hd2-ir.txt to point directly to
rc.yaml and remove the stub.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 Documentation/devicetree/bindings/media/hix5hd2-ir.txt | 2 +-
 Documentation/devicetree/bindings/media/rc.txt         | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/rc.txt

diff --git a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt b/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
index ca4cf774662e..f777c2707e65 100644
--- a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
+++ b/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
@@ -11,7 +11,7 @@ Required properties:
 	- clocks: clock phandle and specifier pair.
 
 Optional properties:
-	- linux,rc-map-name: see rc.txt file in the same directory.
+	- linux,rc-map-name: see rc.yaml file in the same directory.
 	- hisilicon,power-syscon: DEPRECATED. Don't use this in new dts files.
 		Provide correct clocks instead.
 
diff --git a/Documentation/devicetree/bindings/media/rc.txt b/Documentation/devicetree/bindings/media/rc.txt
deleted file mode 100644
index be629f7fa77e..000000000000
--- a/Documentation/devicetree/bindings/media/rc.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has been moved to rc.yaml.
-- 
2.54.0


