Return-Path: <linux-media+bounces-56110-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGw4K3GTuWk5KQIAu9opvQ
	(envelope-from <linux-media+bounces-56110-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:46:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B592B01C4
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7111330B82A7
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49702D73B8;
	Tue, 17 Mar 2026 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWjakLsx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D0921D5B0
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 17:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768119; cv=none; b=s9EPCG2zIlP+QP9RW26nzjSlfb00pHQyaoJd4N0u8AS3+em+lAYyk6L73DuwBOxFsq9WQ20bBcAPzRl3dGFC3UoRGrNYMa0xBVT+zlZoUG3SN37lgOhH8m9EFqqJWY3W6KTHB2u6pHKWXLRwz6XpMFbiZ0YpLUEbupBMxDDIjE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768119; c=relaxed/simple;
	bh=RIrcjBVTWFWdS8g12TomIKFnoLbjWzlU+4/7ub9UfAI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E79nTD6tdxn2ksgveosum6mYjg9UNY+L+oNKf3sHtXvCcyWBLciiuKfGTKkfaUAHMuzpbOTUK8jCcQQouGO+xtKQeOcHlzMmeaKtrp/+GJcKQ0DgpchkzJ3q2zH2R6VayWo/MgR6Etgh+hCX+hAseH5VENSYKuFDGhkooaQYFJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWjakLsx; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b04fc8851cso29537515ad.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768117; x=1774372917; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=utaSnyq3myPjK3fsmlWbqjzof7555I/m+N4R25ZlcDw=;
        b=hWjakLsxKL05ZZJ8o/g/GC5wcteoAjgind35ry4ujMD5IekqTz3FfhrVNbz3oI/A1O
         Ns9Wk/4G0dHplkGooNVYLftTkwut04TKrSzrSwli1Cjcy8aDjs2K3P5+jIFzfdMFQn3/
         uElBMFdjrcE2gT+2VPyqM8+OS9Ul8x2r1mF7FitPKbLJ2JywZoCWauSvpDdbXTSR7/BI
         yRQx3OWczq7PJeQ1gYMJp9JEyI4B1ebqzg7pG50AlqW3+64D71PexWM0RDyOI0JuT51X
         VRRkS9tWn9Y5C+uih6IeT20r5dGjrXMCcU9a+Ur97yIXnWq9tWvmoVQ7PuIEzRfIPaTZ
         uczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768117; x=1774372917;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utaSnyq3myPjK3fsmlWbqjzof7555I/m+N4R25ZlcDw=;
        b=HGFbw/7+ft7bazWX+4oduHUsethxkgclSNK4ebbCxFSB/lbrJScIlmHSSnHmR4Bb5K
         nxV0VYt9KpIlBPRlM/P0encICm5cg+EecBT73w92ce4EPoF2/N0kLXvNLM/iKYzqDNNf
         GrA9LTnKGFoYF2s9tAS1Ymu37du5P+pJ5zc6oAzNkL4Gsl0fvlj1CIqXrpSXEzPk49iy
         TGqZgBMBICyoMaTEFEbFcM2Qsr3cWGD5CF96GdeRIimnPMKaRvxkNtgWHYLPI4dwP7Fz
         Bfiih6j5yjsQk2GdvA61X6Zj4YutwGaOUrOQl5wuU+h7736WCNn46aaKpjdF9OYPABMX
         OhZw==
X-Gm-Message-State: AOJu0YyNL2aNTD/W/MCEJLjjr6/V77f6VSBmfm0Cratxp8HDLbl9ZO2D
	GVrTXBiz/GehUBp8vmS5jwrDNUPJg+mcSk/9EhxeRQ2+bKJMwRV1+4x+
X-Gm-Gg: ATEYQzzcussNmZGVwg8IdpcF4Ns12TsekxsHwbVMhprd2qq6WNdKu9jyeruxIul2KQ5
	TMqQBLfMWuTFdnWPQpALFgNQeLPVExbL2r+9NvCUQW7GGO3X5igfgfxO4tpigu8zv7DDa/GnnZL
	VZJ+SNRt70JcJfKWL0mOu34W/Up8kvwVfUxRAVaAqslTbwf1Vsp5nGSSia9b09gP73o46UV7lwa
	X4EJIWj/WQvaUpW3I52fS0iX6lpR5C12ab/1vLz47DjVke++/pHrJg00+ZIXlWXx9X+AJemmky9
	DS2psfj89Q49nCkSF9gqbzFapOANVpcYIVXrkdIp+aZIQQilFdtKKJPysPgSfR4dXKBpl1clW1E
	1cL532m/oGrIlv0hRFlN9IPqRaRpl+qEj8CXzXQp0CXbLHQCvyjUEuaVekn0NTLTBUBRQfMQVYE
	OCpy2zuf7EtXI/jjf7GLyDte971sYrbBTENJkzr3FyVFR48H0=
X-Received: by 2002:a17:902:cf11:b0:2ae:4948:f866 with SMTP id d9443c01a7336-2b06e3779dcmr2718255ad.22.1773768117565;
        Tue, 17 Mar 2026 10:21:57 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e608a66sm934825ad.61.2026.03.17.10.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:21:57 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH 0/3] media: ti: vpe: three small fixes
Date: Wed, 18 Mar 2026 01:21:52 +0800
Message-Id: <20260318-vip-v1-0-5fdcdbd01829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALCNuWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Nz3bLMAt1EozQzA0NLYwMDM1MloMqCotS0zAqwKdGxtbUAxvOoA1U
 AAAA=
X-Change-ID: 20260317-vip-a2f601930065
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dale Farnsworth <dale@farnsworth.org>, Benoit Parrot <bparrot@ti.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sukrut Bellary <sbellary@baylibre.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773768115; l=542;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=RIrcjBVTWFWdS8g12TomIKFnoLbjWzlU+4/7ub9UfAI=;
 b=P0nQO/b4JhbgjLcLyEqMlgFRof6okgN0vhNIMwDNGaBrE3VFj0ErYstN9mC4zfU88mBb/p1OY
 aGK/omeP3anBsjxYesbl3iGRefIGmTQn5reNgQkCb14m89dQirA1fLo
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56110-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E9B592B01C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Felix Gu (3):
      media: ti: vpe: Fix fwnode_handle leak in vip_probe_complete()
      media: ti: vpe: Fix the error code of devm_request_irq()
      media: ti: vpe: Fix the error code of devm_kzalloc() in vip_probe_slice()

 drivers/media/platform/ti/vpe/vip.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260317-vip-a2f601930065

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


