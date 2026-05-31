Return-Path: <linux-media+bounces-63173-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO3VAI7/G2o3IQkAu9opvQ
	(envelope-from <linux-media+bounces-63173-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 11:29:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B129615611
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 11:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C75CB30179C1
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 09:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD72435201E;
	Sun, 31 May 2026 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUOvIf2T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D632C08DC
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219778; cv=none; b=CQqQHg7YToSawDDjAjegf69p3HCFAfBlQIV0Ezv/K+n9Ta9ue5e40ITsnHZ4X1x9dtfs9csmwPYOQmNZBRkkIJrzBdF6KOLRAWyGURnCaDV36z5oKk3vX+E9V9cnzwurGB973GxAwqmxmGAtVrI8v12EEzybeiuzYQ7lKEHEYu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219778; c=relaxed/simple;
	bh=NSsCLxA9XIus0FBPdWSRkAf9rfESaDpSLkuqckRIxMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZVGMju8UxFQFya9Qer9Bj5rmvWVbuaJkpWT4YOEOeB2Hr/cCT78M6NFLfHs3tl7ZJxP7CbnfsMQs1+NejRygYntDIcNRM0Sqlb24pyBDs+V+b7s99wOY/lepeoisaOk7dyw6Lq87BpvmwYTgGwiE3cSs5iPt/CMEkWryLppUcp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nUOvIf2T; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so1218460f8f.2
        for <linux-media@vger.kernel.org>; Sun, 31 May 2026 02:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780219776; x=1780824576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Grrz7Uwuag8ALYv5V52HPJq45H3NjslcBVbddawkh3Y=;
        b=nUOvIf2TrZPqq7bkvrEoVUtx+8FLtTGEa5ySbCCwBL0u71Jmi7OpaUkCGhpwovp2q8
         hMh0M0p0Sr58sCEPR8gL4c1UujCuJ9cqcg39XpGj2lwn3P6wyJztiqCW3bP3Rzl644RP
         hdHfw1+/3RLnW5Fp89C14tvjNLOyUeQOMNLrI5dkF6bFl9Ks4DgvlWv8QwvDhWmXtXCY
         yZrs51GripPcmMOOkWWiAEPIsidnUD9pYPsLzxgDJgL1LFTRBdvc1iJ4FUrnRtX/7Gt9
         DhJOCBEn86h9Y3CkS7km60YFBAWbF8rsgr5/1hzjJ5l2uOkmn/UojuXQsdTiOMyOBqHV
         8yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780219776; x=1780824576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Grrz7Uwuag8ALYv5V52HPJq45H3NjslcBVbddawkh3Y=;
        b=Wdtfip/qIaSJv0Y4ajMh6W8H3Dia/hdE4kjn13EDmfM3d+wSf8Ne27nfgtalu+AU09
         tL21VOM6pUv40JLQ2NtEQGPjT1zulhl/91YFPrjZTmFpmHINNDal2+AqXZQQL7PgdGgK
         WH0CuiovRYowuIWxFHEMd+e5PhOaFdfb+6B9rh065unBse7Jlx9RGc4THuGD9k7lwoj/
         NfeXDKDpk0L9CBVZyB+eu70d9rBZEDColBx/dIAfODlqhcHZfNurlhZyR+0f9OwMj5QE
         Lg5ypW90hCRUgN9ti+Zsbh1WaKXtDYBIENwOXmkdLASWSvE8Pc0x62Nn7Sfc6kRGDI6T
         roVw==
X-Gm-Message-State: AOJu0YxV/qgMI6AGJ/S+SvzjSzCq7SN9f8oB/WFDYKJWluiYx/3i9HMm
	r6eEUsCx0yTDnqIZCia2hohqw6AlqLjj6v6QO7tByjysTjQ2jFgdznB0
X-Gm-Gg: Acq92OGBhwHXZYhvVGBto3lAWRCF6JdynJW4oEUyPnB/afq1CIpPSTqLGGTH1bPaVa5
	9NFjSIqh9aByQ5bV2faLgvMItgrNSMeAq9zCw3TwvP9rvb/rF5QEwCLxMbLhc73pAD2bjhOKbcW
	P9nhBFYFVi/Ee7zfMqeZaw3JqDwhRr+R+gwwpJuntJNi0yEMkAmz6BHZR1IKgvcxnkZeTGQq81m
	dQ1sR2oMsb3AJbZbxhNi/Nc6YRRyKbmq4GP5kmjmnQsGLY1Rhf+0tkOxdX4muAIPBH9JYgshpXr
	Q7WMes/dpU3d3DIXRtsBXqlN86BP15kl4b2ahHBC5pA5JVIxDK+ttzA5r8D1ept3mhyawmYGqnU
	2HF7/YKenTE13vkXKAWPAadXvC5AK7J0z/5+i5rXfJ2LmeHYcCeNVbk5kHKJuPiU6vFON/pK+qk
	naMIRV8lWc4/hpS/NY5LVZJNs=
X-Received: by 2002:a05:6000:4a1a:b0:45e:f381:cd8c with SMTP id ffacd0b85a97d-45ef6b72910mr11175999f8f.30.1780219775622;
        Sun, 31 May 2026 02:29:35 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a03f8sm17671313f8f.7.2026.05.31.02.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 02:29:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1 RESEND] dt-bindings: media: mt9m114: document common video device properties
Date: Sun, 31 May 2026 12:29:22 +0300
Message-ID: <20260531092924.12929-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63173-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5B129615611
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document common video interface device properties, such as rotation and
orientation.

Svyatoslav Ryhel (1):
  dt-bindings: media: mt9m114: document common video device properties

 .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.51.0


