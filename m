Return-Path: <linux-media+bounces-59544-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCioEZuk62nIPgAAu9opvQ
	(envelope-from <linux-media+bounces-59544-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 19:12:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C9C461AF0
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 19:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69DA03048106
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 17:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870EA3D647C;
	Fri, 24 Apr 2026 17:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHduZfUT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB013D75DE
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 17:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777050457; cv=none; b=pOYJMHHjcKA9R39ago8a1eVKcb7vr8g0MAtcxiESUwYxcc2bbMRcUtfPNU5/K0wk/yxZAH8eUbWHp5ip/HqLhIJcSboy9efj3YrtO9lzxpUvkK7iym7C/3kaSoEOopEtQcqsS0RRpDXTvhTcYVks+HsGUByT/9sm0Ex3wz0aeFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777050457; c=relaxed/simple;
	bh=pRhvZ9KCVux5KCVBEBzksHbQIt+uSWHypEMOvqUP0FY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K0WTZabOybQjtTzM9Ef4BUWExNIwF9tfjWxP1uqV2s1ajYvPHsW/7GglZR+at+4cPWDAlmpeXceL2+qU1eVpjVrkX0J6FQ5s4oIZIztDn/6c3kp1jaXrZw/zD/1tsEOs/iP9nXh4vmcvc33gIkuMcwsD338ZoRk+Kh+zeaYveco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHduZfUT; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82d0b68837aso5205157b3a.2
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 10:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777050456; x=1777655256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m2tyqV7NYkcIHpynPQ745IDJ+MBrRCWvGF7hfjz6lJY=;
        b=UHduZfUTqRYktk12j7/s37RHPJXmK2V1sq/Zi5HfYNU+uNf7heVyvogmQs9LOBzWp3
         j25lZfPd4H1MlHFrw5i4c1PfiWHld4CaIoJYxw91D2yWF360UsArTslN9uk2MfEq5NK5
         qkLiv8wH3u+tHAj2/FcFbqVcIgE/Z6vk3qt+MTDLE44mEhrKnfe4nlPOt8psR+TGFkNP
         k+QOIQGqhv6dFFb+AQavt47PJiuAXg2ue02oVPbMWXiYbUnANwCsp6GMntcZ5Jx3XSbX
         ZtVSFrdEo7SnvSYx32Q7KAVOGspvt4T0H3rtuB81TEVBbo9T1UpxM3mn6LNLafAFoCuN
         6x3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777050456; x=1777655256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2tyqV7NYkcIHpynPQ745IDJ+MBrRCWvGF7hfjz6lJY=;
        b=Dddc4fUEJ6ko52LVMFAr9kFp7VCoUtkqSGphaott0jMuVLJYPPy6Bh3UHffngh3mEj
         TjcovO4w1h59WWSnzt/DNxR1gzlvnedLZrHnMgm35APInX99Fa/05HVHBxOF5wgs6OlC
         Obht5F070uNhqEQBLz9mpc8mhez9tY88OwipHYvSl3xbIDr0zZ+uJ49E54kkGh6ODnnC
         8rNqa4DsCysjQg4bvVKyxPEDZMYmyQnfhu2Jpp5YF/rpxeD+Yb7RjTEmVek2VTXBcaEd
         X1wghjlKOFwo8oljmbUZ7ZS7fTzN/fvHTfY82dkvTZQ3qz3vR0RC4i+Xw4e9wllWNv0Q
         cP4w==
X-Gm-Message-State: AOJu0YyarGmvTe8HckBrmalErsE0N4ohXTi2sMInRz7uMP/Ql1k/97fn
	KCw3FyqsS04Tinw9PUo0F4rAaDd2zfAQtUHdFDY/FGLT70o5L4Qt7R4=
X-Gm-Gg: AeBDiesia7w6Y4kCNWlIRe9xD30zC5Tt1DpMeb/I7TmnmcLPN/BpcYHjlbWdb7lD7a3
	UwKag/AKJ1EhckEOToOSgrHUrx9JS8QFxNSBHtdf89Bu83IcpHDJPO55iMbTvV+9xTI/uZiMiN/
	c/1tus9iQCe4CKkgcjp9Izsoy44VOu77S0BnwlJRat7eydzn+GbDNpow8skNjqp/mzPHL4fev+Z
	S66oBDWwydGTIXpxJfuGeLinax6ksh2nGysRcE7tzMIpblCXQZHleoUBj4pMhfFaFyNowz6KIZo
	pPPXzhFqdT/ffRpMHOWIhKuDX91wvdz0WfGxukJo0nJcbTRRAYHPz+GHc6myAwNBZ8ayC8XdBQp
	BtPbFwIUppapyxV+WhBOjXj9rew2HQcVjSQIMxsLgr5HM4gYkK65I3OXo34RNEbxv9OZfqSrhks
	ARooxpwzbtoeA6R+Q3kWsUTk6rSzSxcUVKAgd1ipaIyaGrfgYCdx8aEdYjkLonc19AWff+7toQa
	ZxybmqVABl6joozyGG2Jf/AMEStMsrWuB83/5OSGIIqtbY=
X-Received: by 2002:a05:6a00:1bc4:b0:81f:4a36:1c7c with SMTP id d2e1a72fcca58-82f8c8c5b5fmr33371276b3a.23.1777050455735;
        Fri, 24 Apr 2026 10:07:35 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3829sm25096419b3a.31.2026.04.24.10.07.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 24 Apr 2026 10:07:35 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Eugen Hristev <eugen.hristev@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: microchip: csi2dc: unregister notifier on probe failure
Date: Sat, 25 Apr 2026 02:07:16 +0900
Message-ID: <20260424-csi2dc-notifier-probe-unwind-v1-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B0C9C461AF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-59544-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6]

From: Myeonghun Pak <mhun512@gmail.com>

csi2dc_of_parse() registers the async notifier before later probe setup
steps can fail. Those probe error paths currently only clean up notifier
resources, leaving the registered notifier on the V4L2 async notifier list
because .remove() is not called after a failed probe.

Unregister the notifier before cleaning it up on probe failure, mirroring
the successful remove path.

Fixes: 2de0b3c0f678 ("media: atmel: introduce microchip csi2dc driver")
Cc: stable@vger.kernel.org
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/microchip/microchip-csi2dc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/microchip/microchip-csi2dc.c b/drivers/media/platform/microchip/microchip-csi2dc.c
index 70303a0b69..59574258ab 100644
--- a/drivers/media/platform/microchip/microchip-csi2dc.c
+++ b/drivers/media/platform/microchip/microchip-csi2dc.c
@@ -736,6 +736,7 @@ static int csi2dc_probe(struct platform_device *pdev)
 	return 0;
 
 csi2dc_probe_cleanup_notifier:
+	v4l2_async_nf_unregister(&csi2dc->notifier);
 	v4l2_async_nf_cleanup(&csi2dc->notifier);
 csi2dc_probe_cleanup_entity:
 	media_entity_cleanup(&csi2dc->csi2dc_sd.entity);
-- 
2.50.1

