Return-Path: <linux-media+bounces-65015-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id piIeLepJMWqDgAUAu9opvQ
	(envelope-from <linux-media+bounces-65015-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:04:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AF068FB87
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:04:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=iTpqKqCy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65015-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65015-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 985CC30588A3
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B1C37104D;
	Tue, 16 Jun 2026 13:01:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD7F370AC1;
	Tue, 16 Jun 2026 13:01:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614908; cv=none; b=J6k126XdZjhydQFiZii303d1GQnIe0x8xAr7QUnNGT9rXXlUlGYbV0U0a93pJXNklNIkEIh8UEohrWXeG1I9aeGY2FFjg7/KWOxrJV87tlfCEvfH4ouxRTcJYKwiKTFYk8js5ZEPNAckMFhIasmUxgcAopoImHB+Sp3ZokurONw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614908; c=relaxed/simple;
	bh=IjRz8cxkkhtD08a4YOIMEHEtoX+DdyDvLetGwfmD/Gc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X5sU+E/W9nJ+bLPzPhX1E2btYVMHPc/67pGDVeSMuJylHSEChmEWLRiWRwkLf2o6ketyzLr9Vi8VwegBAsS6aq+ojTogUNGkGWYlxdE4VbexTAS6S6ZkMMK/iU2xdbJo06ko74uOYTC23968rF3oyPRQ4gpSrpPGKfLKm1If1to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iTpqKqCy; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.1.107] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76C9E227;
	Tue, 16 Jun 2026 15:01:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781614870;
	bh=IjRz8cxkkhtD08a4YOIMEHEtoX+DdyDvLetGwfmD/Gc=;
	h=From:Subject:Date:To:Cc:From;
	b=iTpqKqCyZsHqkWh4vOBSlzPwTkhZguQ/Z9i5wWy6M1WHpGGH51ZCsW+59ZpN50vMC
	 VbWEZbThnGCAWP27icDnb/5K4DRKlE6djVueiwESjTUmbtskarYSY+AAOo7cXksm1R
	 69UHh/n5iF2YiUFOuVLa4yNlGEugIYBoE1pitZtI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 0/2] media: mali-c55: Add support for CCM and Gamma
Date: Tue, 16 Jun 2026 15:01:31 +0200
Message-Id: <20260616-mali-c55-ccm-gamma-v1-0-174fe4fedea3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACtJMWoC/x3MMQqAMAxA0atIZgO10KJeRRxCTDVgVVoQQXp3i
 +Mb/n8hS1LJMDYvJLk163lUdG0DvNGxCupSDdZYb3znMdKuyM4hc8SVYiRkY8kswQ1h6KGGV5K
 gzz+d5lI+j5RWlmQAAAA=
X-Change-ID: 20260616-mali-c55-ccm-gamma-c02a0df59f98
To: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>, 
 Anthony McGivern <anthony.mcgivern@arm.com>, vincenzo.frascino@arm.com, 
 linus.walleij@arm.com, Daniel Scally <dan.scally@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=791;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=IjRz8cxkkhtD08a4YOIMEHEtoX+DdyDvLetGwfmD/Gc=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqMUk2kZKBoMPraSh9sbyrkOl1L3fRgjuJ+76/o
 6+him0JfteJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCajFJNgAKCRByNAaPFqFW
 PMnMD/9bpYmA9t7+TSsLXES0m+dkGksZgweCQOwn/HTaccM3suwubcwmtdvMZ+NUTH6zNxqQ4ml
 5L5EG30E5VMVPPjDOoEnI9GgFhmyIWnh+03NEil9OUav2i0MvMEWWn6sWv0tZKBd+5Ufex442Nm
 BnLG9DAu2tl/00QX7+eVQfEva00EoHmvx6GWVhrb+JNdPs58UvV+LZEzUpB36w/v8jZfIH1m7pV
 NteaY7ZVPZ7NO0HwbYyL0nHj4gonut7GlmhmxidvolZmmtOiGIRv7Xq7MiXFFiJjPus2t/6l9+H
 +xHHJs+lsZ/DH/FtpccHIZuDzSNIRJmslZ57TUQgDB9V3KA5+0NihYUwDk/FWXY1KG/dX70IQdC
 VQlPMUjuXuv6lgZj9kSE6574K7TbXA/oN5q1DcVUjJyIcYWcqTqyUwcY4D9uhUBW0Kjbg4bGMSM
 aCORi5HW7H/Wk0zah6Tnq8OM02JqmCgQZP5BgXdxlG+476ajWSbFq6sOWJXfQSXRUME+r40cXMq
 AXQpYe8Xat/pV2IoCslzpNfFgRXH5i8ILhhweD0U5R5vhSvzG+v/qmYYr/C6WWvxQ8ArLR2PW7Q
 46kxK8JG1pDcLcpepbNwPF2tlwEbat0uVR5JWNOdC3DBUTndiU9GP+axxd26sV/XiClAMfaffLk
 PdEj+KunYOs7BYg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,ideasonboard.com:server fail,tor.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-65015-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21AF068FB87

Add support for Ccm and Gamma to the Mali-C55 ISP by defining the
corresponding blocks in the uAPI and implementing their handling in
the driver.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Jacopo Mondi (2):
      media: arm: mali-c55: Add support for CCM
      media: arm: mali-c55: Add support for RGB Gamma

 .../media/platform/arm/mali-c55/mali-c55-params.c  | 127 +++++++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     |   5 +
 include/uapi/linux/media/arm/mali-c55-config.h     |  85 +++++++++++++-
 3 files changed, 216 insertions(+), 1 deletion(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260616-mali-c55-ccm-gamma-c02a0df59f98

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


