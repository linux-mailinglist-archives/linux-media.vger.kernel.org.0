Return-Path: <linux-media+bounces-64413-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hdMRKPJHKWoeTgMAu9opvQ
	(envelope-from <linux-media+bounces-64413-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:18:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14113668A79
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:18:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=V4G329sX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64413-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64413-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD02A31054E3
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A688C403EB3;
	Wed, 10 Jun 2026 11:11:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99AC380FFA
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:10:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089862; cv=none; b=oX0CS4u4U7mYYnPyyNEis5q5rHtoG69Kx31Ir99RBAJL/jxz2JivqHrWfOBZpiueEIa9WjLyxvoXymKsH46I/H7+J5zMoA1ArnLpsh6tyMUmry10YnM4uS4K0l7J/eYuPAv/rvyEdewqFO0vGzYcZDmnecU0QEyKHBQWblOQriQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089862; c=relaxed/simple;
	bh=XHn7KPrJ2p0ewsN97d6TWFtfPpubwutN2aH4bFYak88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SFrPaXIipuC57QCEmRYGdIr0oz/zBTdGMhyToujP6F4V8Ovm9VB57gb2Ja3s290uKjJcyiVKpZiZ19dEpjvZXpAe97OQJH4G/30BFxGVn073SuSZyLLbUdgmPMuVR/yJ7ICx8oc48UDkzUjRJEX+VlynGanfgZGB4nei63Fu8b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4G329sX; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso45617385ad.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 04:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089857; x=1781694657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPG5xL6X64inzSZqvGNNgIEqvH99YJwMXuPIgK1PxVY=;
        b=V4G329sXR9TGPJ0o7W8pSRWUe1t1SS1ClwHEoSOUNxqUB6abxKEozkX8oapYjNWyoW
         UuB9Dd7eq9xSFk71wQ9x2efNKy4NsPuqkNAmfTtc1d6fVnO6SafsdtusdOj7BCf7Mv4i
         kxQVNqoW1c3eSzzMX0OlB7EHaDEm6r/DHAFEfaMelUELTENZReGOOaO7XVlFKtC7z7gx
         tfeMpYeJL5BYrsPWcyJhAGpPzKZlunM/ZJ4lFDSWu88+r7eoqCnhMAdiQj7tGjnOSikc
         GSHGb6iwCm+/PaI8G6tSFzv3/OehaugeWJM+8a9ls0QZY8M0a4idofOhoOyZXUnxfUOG
         rEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089857; x=1781694657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tPG5xL6X64inzSZqvGNNgIEqvH99YJwMXuPIgK1PxVY=;
        b=hv1BAwUT+b9BDO3aAzi5OOkJ54QByOB3RViGfvL1N2A2Vn4mhiG0OZzl8xKuMRrUhC
         uTrTDwJbZNt3+id/IGb1tdfkW6Qd0eizgU1AxDW1JWpfTr5fS59sxmL7+GyMXeCwlmns
         7G0rbsCnO6K6W4Huegxdxlfa9EqXBfZ0jMBD5UU+cpBvRMu6kfuMx2fDlCL4viuq5CSY
         DtNTkQ7Ycia4dFTfu1+Vu+IO5eu07wPuYN3+ddswgQJMGySOQnV1EQ9wP8xWgMVjeqI2
         sOk2lH5GFk+xECzMC3mEalzUGnoFObYCblgJxcjYl1MFJKxDLH3zTQTxfYQ/GQn5m5ox
         6WMA==
X-Forwarded-Encrypted: i=1; AFNElJ/V0Xan4aShCJ6rIUWbwXvBAbmAzbna+dj0vHIQbVUQpGe6z8YRoZe15GwMRkICOIJkt+pSKP2HcOhWHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4k5meAq28r3SM6+UeY+WdIk+7dm3LYr7A/WKMr9qULH6Denbr
	MUg4icRWz3ZA9MCDMyC9RHr1zJMTBxVYRwIZk83VHcckfizv+24IV1/1
X-Gm-Gg: Acq92OEYPmSXcZUmqNTjZYBOzReq5I9/FbMwx7VJhwyxNOORTYiPpJuGQSG33JCMVLp
	M5nNaRRW76zfy493HwX9fMhRDW639ZETCcYZZOHxbofY72Og0RPqLv+T4P/u12s37YsotRO7NNE
	sjSG7+RX8sV/nUEC6kggUpRuDZ+DmDVvwv5rAy/d0D+sGecu/uBTpMANLKJoT8Jut2xAgmXS7wP
	5MJgjx56RTFp3vYy6Sce5uIM0/0oorTp1Rx0f22/z5k+iiepxjUmltw8jw0NdewpKSxSyNDeMOS
	Xw2zSv+HnLRsHtubNeFiKaJvA0YLrWNDipud1f5YIhGkZUhHyJCHAVBQrgAmzwK3GRcmLj+Eo33
	s5gBtwMD3fseIoMaHROT685XGd9Upbpd3oI6IiBc+rLNC7K2OjpJyb4QyWhj6CbkkScQpGDEs6T
	zHlbcNt+AkvnwsDNb3r6QnO8OprvqZol4Lh/NAlzRSAiL7rfyz
X-Received: by 2002:a17:902:ecc3:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2c1e8339808mr278966455ad.33.1781089857057;
        Wed, 10 Jun 2026 04:10:57 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:10:56 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Date: Wed, 10 Jun 2026 16:39:29 +0530
Subject: [PATCH 4/9] MAINTAINERS: add entry for the Himax HM1092 sensor
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-a14-himax-hm1092-v1-4-0c9907da47ed@gmail.com>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, Ramshouriesh <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=822; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=XHn7KPrJ2p0ewsN97d6TWFtfPpubwutN2aH4bFYak88=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYOY+2bxqPX1ojdxk+vvzgmcLZnSyOoaAYMQ
 HpRDlIdPFCJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGDgAKCRAVlYpeERwF
 3qDsEACjzb9x/8nckfrFGo0m5UCdxAiUwRrnwyY3IU+svHoFZIYklIViyHgK99TWKEme6Rzj+Tl
 7hCc8VP8aPvNBTa4f4VbAFPTboeLZaJ3aUk025O6s48y0w1M3gM4DCE64PaejgoRkMosAvJB+tA
 DSpV2dvKVAcHscHQ1hIJnBr4YHzyYDAlcDi2XSgmYTQhy24owgngdMiIjULBZo6pqyrGxHI2PC9
 Yzlwba0LHtLgBR/aRUSbSqAZVzbnFxIz06bdsEXcl4MT/lsT+iQ5S+C04vOn8tnGJqmlMPcVQr2
 VAn6ZlyxG5qklxons9I2R6fMXzxjyT8IGpw31An4ix2W0rEf28e191Q11toJgcDYuRCA9nULjNd
 r4lERaJ3ELlOg2KPmOLh9eEbf/w7pmo5lxCSQe2N6qkzxu2iA2lA+HNFp6KzjmOl6rCqJBkkXo1
 nmvkLdCoAU1Saag/vz4OX6Sek5ayCX+Fji/GEaMsYdsmfH03mLExJoyvcoMxMN7WJMXzG0Dd/Q9
 g2y83UwvQ13A20GKRcxiS6ImZXIaoU9EP+BRevhPxlJt7V5OMHlF58/1rBoiT/wPbd+YbESwQUx
 f8MTtEpRj9WD+Jms4Y2wSSShDOln/Z7BhsL75NMHMg4hWWd2JssyT8LXZViHyFv8s+TrUsCC68f
 yHhNgvuRKASw2Ag==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64413-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:rshouriesh@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vinarskis.com,vger.kernel.org,lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,noorman.info:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14113668A79

Add a MAINTAINERS entry covering the Himax HM1092 NIR sensor driver and
its DT binding.

Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dadc54fe2bc8..ece71732e6dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11643,6 +11643,14 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/misc/hisi_hikey_usb.c
 
+HIMAX HM1092 SENSOR DRIVER
+M:	Ramshouriesh <rshouriesh@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
+F:	drivers/media/i2c/hm1092.c
+F:	drivers/media/i2c/hm1092_regs.h
+
 HIMAX HX83112B TOUCHSCREEN SUPPORT
 M:	Job Noorman <job@noorman.info>
 L:	linux-input@vger.kernel.org

-- 
2.53.0


