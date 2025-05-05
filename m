Return-Path: <linux-media+bounces-31704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E6AA91F6
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 13:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 978C43AA3D0
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 11:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E9820298D;
	Mon,  5 May 2025 11:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMDHyM9f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E26202F70
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 11:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746444118; cv=none; b=Mdpt2+ZxWWg4G8Fi0xbcObNNvSaAqTJrVwF14D/LJLoSGPvWGKMgoItuh2kQzFmLzk3votCtXh3n21hoDLSdehQJwEZc2mjzFE7n/zGkQ18Q2c7+rmXi5RPWUc+9CmoqIKQkruw4SnB3LM5LbcMZpPlCsDVzFgDMbtnvr2ocmtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746444118; c=relaxed/simple;
	bh=JZVWCqMGefyj6lB02eVut0uOZ2W79WhK1NPglfeR+AI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=hg9TWta+11tneLkC1nBymcCzT+Bksgfz3TKAbxIeFWBdhlj4iW2XaucbhEkf/cSO1lusg5P3qsyRqjGN9+etFmWYVNYMWjWKGpTjoeTzLnNRJWYPpVwOiQfQ3Me3HQHoIJY4BCeRqMOcHiI2HNt6zSoPeCOPAo1e81MAevzJUag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMDHyM9f; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af5139ad9a2so2790332a12.1
        for <linux-media@vger.kernel.org>; Mon, 05 May 2025 04:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746444115; x=1747048915; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iSlYYY0BQFuyV0G6eViNuk4bAU6VV+UsxtHYMCKJTP8=;
        b=KMDHyM9fwZ5RkxdCbtiI5TupxR7G1WbT5tpBa0OR/oUTFWmRrDPSslp798i3/ZHQqM
         P+ZIZX9dFICzwGTO2eiACRBdrJ3/m0fPpMK/bZdzzlscUzLS6//yyeWYDWtO9HKoIR8T
         sPSmwnpaIYuLb4Y5ftGKjavFVxTSKnaUZq/l/akLBL6PpmGfxPlyShG5PCqX8SlofI/u
         cfqGouhWJC2t9TVhetnNYyRw3XcPXshxs4Ob7+TFirLLWVQhWEkXWICiLKpUxnVlfYuS
         2DkacU9U7EYbwCwOlQoY8pr3fsCZCig8abNzuTB37pFdcj0XnvYnwrqqN5DQdE5H6m8z
         L+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746444115; x=1747048915;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSlYYY0BQFuyV0G6eViNuk4bAU6VV+UsxtHYMCKJTP8=;
        b=c59LD2fgjLUFpeS8TxNlNb+u4zPR2TzzhK6TNUJH7o3FbYnQ5MGtJWImZLjp1mnyKF
         nOy2SoJIQKyWq2gb0yGW4szBRR3Wbs9/RpIIp96KlLJHurUcy6NtI5+Az7UhSPKawghj
         dHE9euPlTMp4ZeQWlDaTQBwMoesv9DHSiaMXLsfB9ZLF0Tlxj1R65nDgX0eLeoDZtW1t
         mfzYj6WwkTik4qCr5s51AqoZzUCoAfQkU6hYG8VR0XhZ7eHG5kdwQSsKNRlperQGxDeX
         w1vc0WlmWRdx41rmJgZp94D0cALLIvLrDGYDOLkhU7HuN9BD0SjuiutTxlzobaoh4V8i
         33Fw==
X-Gm-Message-State: AOJu0YxNVaNvMOQ60v7OeFipLeWRlmMwqEC1RIJ8JWpx3lG5KKYn6kK/
	jmzw35mljSYiAu5TX/k+vN7ok0vimaswE2vuI4SWtNFYZZRNlKOyBNg61XKdiJOXEtBWa6Xu3eH
	Txh5TCkyF+D3ExrLP7q+656BBCDtfzd+u
X-Gm-Gg: ASbGncuuhWbV7yk0rKN//buuhn36WcsJkSUuvEiV4nmYL0ng2EyMtp4c600Qhws1QoU
	R+/jg9J9g0DR9HEAsXiBfXjU0oeN+CAeq6Py0MjLTqiBvSH/ftwHd4XNLCljyjUmhb8pcb6IE4u
	umlPYRPZJFggIhWEgpY/+zqyMna1nt69qc
X-Google-Smtp-Source: AGHT+IHSdXvB4tExO25fFnUVnGVvtxjxqPB70uonGmUbbHaamErkNjkEy0gFCnm/gUD7FKR/ml3RwH1CpCIxKUDdEX8=
X-Received: by 2002:a17:90b:2711:b0:2ff:5357:1c7f with SMTP id
 98e67ed59e1d1-30a61a44ef7mr10731703a91.30.1746444115312; Mon, 05 May 2025
 04:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Stephen More <stephen.more@gmail.com>
Date: Mon, 5 May 2025 07:21:42 -0400
X-Gm-Features: ATxdqUElXPMpI4BjHXfSChlrEM4R3gOyvxpADMUG5PuiN_IMUy2wDSve9RuJvGI
Message-ID: <CAL2vA_ORWceuQdiAVh57TuJ1FBAsbOfMsMGn7tMmTo_0Bojw=w@mail.gmail.com>
Subject: [PATCH 1/1] doc: dvbv5-scan add example for North America
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

dvbv5-scan is missing a real world example how to actually run a scan.
This example has been tested to work in my region.

Signed-off-by: Stephen More <stephen.more@gmail.com>
---
diff --git a/utils/dvb/dvbv5-scan.1.in b/utils/dvb/dvbv5-scan.1.in
index af6f25f8..0dae9046 100644
--- a/utils/dvb/dvbv5-scan.1.in
+++ b/utils/dvb/dvbv5-scan.1.in
@@ -152,12 +152,17 @@ the frontend detected.
 .RE
 .SH EXIT STATUS
 On success, it returns 0.
-.SH EXAMPLE
+.SH EXAMPLES
+.TP
+.BI $\ dvbv5-scan\ \-C \ US \
/usr/share/dvb/atsc/us-ATSC-center-frequencies-8VSB
+North America - Scans broadcast digital television transmission over
terrestrial airwaves (i.e. OTA signals received with a normal TV
antenna)
+.TP
+.BI $\ \fBdvbv5-scan \ /usr/share/dvbv5/dvb-c/the-brownfox\fR
+.PP
+.SH OUTPUT
 .PP
 .nf
 .schar \[u2026] ...
-$ \fBdvbv5-scan /usr/share/dvbv5/dvb-c/the-brownfox\fR
-
 Scanning frequency #1 573000000
 Lock   (0x1f) Quality= Good Signal= 100.00% C/N= \-13.80dB UCB= 0
postBER= 3.14x10^\-3 PER= 0
 Service The, provider (null): digital television

