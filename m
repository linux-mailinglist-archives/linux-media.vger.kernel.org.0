Return-Path: <linux-media+bounces-51523-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK1DCEMnd2kUcwEAu9opvQ
	(envelope-from <linux-media+bounces-51523-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 09:35:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 428238582B
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 09:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D44173003BC5
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 08:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEFB313E00;
	Mon, 26 Jan 2026 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duXkA/xH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09907224B0E
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769416501; cv=none; b=bzTw6fkxu/oRu7uA9fnKcANDkZ/dcoiVzv1taI2Pfr2+rgBEgDGro8u+OxtTyOgy+7MJOt/DBNEhPWi57rXuOZgUEeNYP7vat6GWrS86b6XOeUJjwy63AiH8mPUIB+kpfHIzL2j8gHPM5NOfDTHGC6CG+cdnwEJeAfO+AfRxaOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769416501; c=relaxed/simple;
	bh=ZekFLmiiUz2eX+Wt4JtAwwuT+oqooDKpiAUItH/+AKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jbi4H0+BEmPsTKH/+gq9HBjUN6KTU2AbFWK7Ac1favkwO57jiqyoQWjMuHjMnJFxUWXghDLCRGIud3ghCAMNNg3iyUOok/dju67Sc8PNiJIBVHRXVbPTp1rVh82YvUbFaSmQFxKN1JccczJVd56NRMbVWUWaIoDCxJgXoW6u3yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duXkA/xH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4805ef35864so6101085e9.0
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 00:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769416497; x=1770021297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=urJ4Pg51iRbYp4gdaFdEANRlDyry6nPOcyVqzfMv4Ek=;
        b=duXkA/xHcXlLVZrxqOVSHC1FpACiH9XPaL1N7+bl2RR6noRg8sojucxroqqbefDLWY
         RM0j8Ap+f/SWMMpSSNcNyLWy90wd7juD854IzEzPEE7PoOGNzzorSWbtiwfXEeQxVXqk
         KmH6u2er1MluMKuZ8jl2O+f7as0M8iWbx68LCGDxHEq4OHjdNiMGQ+Y+gjal/ZdR2M9T
         TYv3tc21XoSxQtE52ME2/5ImelTLrcD+jmBgp7ML5tAPRlOjVRvbXhJyFrLH+dPlZ1ta
         eDzkR1nOa6DaR8tGXXkZYyL1pmLCDZBVYvRamaDiTl3Er8Yj/nwogAvp/MAsVKfjVw2o
         PT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769416497; x=1770021297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urJ4Pg51iRbYp4gdaFdEANRlDyry6nPOcyVqzfMv4Ek=;
        b=B7JMqCxGnAsTBwNATMZ1agBC4vdIcHPEB0tIDtB8PfbEfsngwVJh4WgUoldLUKOgyu
         DntETyseiTMuS1iI1bN6amOGCuCUglDhjI2SLqo+NMIdJqaVQsD6C1VXpFp+YedbYNNM
         LYTqcCaMgswlRtSDB5M71GQplNCCVgbUF2t06bHBshe497+sSg5t8S9soz4RsB5y/Kc0
         4phDIRZ0Hx1ru4O3SfSVEnqNAYOgcbp7srUfMiTAuYuAw7rJEcgjCFW29wZGLO5hT0Ms
         U379ZE/kenwWNQ3gOPBrgi2y4zQcYr375e1K8eoBXWAv05prnL2uXvbHIcIRxiyemPmF
         cYfQ==
X-Gm-Message-State: AOJu0Yxu+/wRT39P1xF1CtbXI9JWNR38gzBVGYmDr9cHnPJoBpYJRbsx
	uCleN1l8zI4RuzPwl9ExDwwYf6PFoXZW7Spd3XU6J3lpsyXQNexMnkhq
X-Gm-Gg: AZuq6aL0Eo8dvQEImKRNFFVERmWxNONwoOEh6nl+WWKYlQgW9vCRrhPTU7WWKsv5ejW
	PHizllFdGLxyc8wCuMlz2lU24GcuLsaoiBnEPge+SpXEcgjVtv5W+4EUzIzCP5MjyBFgRr/iiMt
	BcaiLTIK2aDwLwZp5sCLO55unTYbHXlwoIhrfsvVHQK4gFSukW8Kvzh3cd+w1AKRpg8EP1tm9rO
	hArT0jzX/7Q7ejHG5ZG41PGyZEzBZ1accqGcgFX4ByTA+h+5nm3poMer39b6LX8VJSpxZugZ5vZ
	HLlW2x9gY2TzhGSkuVxed+yRduoZQfmT5RAtpygT3pyd2Jum2bRGCfvilkSzsWxGe1V84hPMB+8
	t5D0QW3OMS+YlhcfNqxRPXfnv9+Cb1U9asB9riVSYV7sJVLtFD3vYW4lb+46bubgg2gaxDJZmnu
	7C
X-Received: by 2002:a05:600c:190c:b0:477:9dc1:b706 with SMTP id 5b1f17b1804b1-4805ce67eb4mr60532005e9.19.1769416496472;
        Mon, 26 Jan 2026 00:34:56 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d3b4625sm102096275e9.0.2026.01.26.00.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 00:34:55 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] media: i2c: mt9m114: add support for Aptina MI1040
Date: Mon, 26 Jan 2026 10:34:28 +0200
Message-ID: <20260126083430.8247-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,linux.intel.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51523-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 428238582B
X-Rspamd-Action: no action

Slightly different version of MT9M114 camera module is used in a several
devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
called Aptina MI1040. Add support for MI1040 into MT9M114 driver and
document it in schema.

Svyatoslav Ryhel (2):
  dt-bindings: media: mt9m114: document MI1040 sensor
  media: i2c: mt9m114: add support for Aptina MI1040

 .../bindings/media/i2c/onnn,mt9m114.yaml      |  4 ++-
 drivers/media/i2c/mt9m114.c                   | 35 +++++++++++++++----
 2 files changed, 31 insertions(+), 8 deletions(-)

-- 
2.51.0


