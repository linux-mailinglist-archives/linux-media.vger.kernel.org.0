Return-Path: <linux-media+bounces-65534-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dnRZLSvCO2pKcQgAu9opvQ
	(envelope-from <linux-media+bounces-65534-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:40:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 065A46BDB7F
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:40:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=Al8wxlHS;
	dkim=pass header.d=mess.org header.s=2020 header.b=cGj3q7K5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65534-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65534-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A195303C634
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B05F3911AD;
	Wed, 24 Jun 2026 11:39:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7122C364925
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 11:39:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301189; cv=none; b=taszV+6oZn8TjVjBCaBVVkFly7djjMYEBaPTjmwDGlUymE16Y68XXSaWSbbndNww6Kdl9vowW+QUXTr687DOACNm8tDNHcCjCsPaP5HeRYbeHa6KkcmSAzdpd7rx+p8SGSSLFYeNpqIFIPKAOU+kt9/htmi7xIXtpNf6yYzg6PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301189; c=relaxed/simple;
	bh=HO/OlyaPGxIhxDkxihMk9sxj+ViyAxrrDuHy18SEHHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hLXhzrCa1UHVsb+LpmeauF65s4CCLT6Mzs3A6xYhK3tbLadVcCZRlneq8qchAcrnF2990dc9qRoHFnPFpPkdXluqFRWZfHHPeExnnc71vxEft+Ez6ujH5/iTAYXRqE1oOZs4h44tvSLEPI4/3OPHiWz5t+mEKFLN9EMEu2ehktE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Al8wxlHS; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=cGj3q7K5; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301180; bh=HO/OlyaPGxIhxDkxihMk9sxj+ViyAxrrDuHy18SEHHU=;
	h=From:To:Cc:Subject:Date:From;
	b=Al8wxlHSsuvhHKumj/ltr4lkojpgLNJL8ZNXGCkXZIamZXYtKRXqizmHiOoloxtWb
	 LB2NeKgdmJcTzpld0P2CLyOVho1Qqcs8lFzsu/alydHyvtO1nY21FyPIAPTyeNiW8J
	 gPB11i9uX6/4uvQHIHeVT5KCgyigyqF7esM8r2uTEaK7HYnQYYxI64u+epgfkHsCRL
	 LABFxODY8U0soX2YK/GgK/5cSazOnDK5zrYxypX9KJlSFZUtMa8o8patZRuVghGtfb
	 mEAnwPMZ1HxP87uIGqYQn1MleTgWHrcC+x/DtrDK1wIHbA/oBbgS9GcSoHMoroB5Wz
	 pH7Z4VY3DyRzg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 8BAA74252E; Wed, 24 Jun 2026 12:39:40 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301179; bh=HO/OlyaPGxIhxDkxihMk9sxj+ViyAxrrDuHy18SEHHU=;
	h=From:To:Cc:Subject:Date:From;
	b=cGj3q7K5gtTShsHPCEQdm51iAU5/ci8RDzT6ul+0NpG3q4q3A7v8jiKyOvlMq+QYc
	 cl1WdfgIoF10uCksPYz2GFRzysOvfQ8QT//u4FK6GKmGDTFjzkz0+ayLY2wqcfkVcR
	 syZImAjYXc04j/krdAsgYHkY5cSDZyF/oZRvhUlLz+VCyU+aQcaZO18KN9ZzIKLrzt
	 TH1oPPKipkvdNBDV4CJgkUSyUKopTv2sSgYm2d4QIcQQ3NkhvQ5yCd+x8ijo08gimG
	 KBd1mMM16wLzO815bThRB7ENrRZ+RorhIYKdOlPaJuJ/nIAfmdx5+lUPu2fIrJO6nG
	 9lnWaKF/ly9Sw==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id DB502408E1;
	Wed, 24 Jun 2026 12:39:38 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Sean Young <sean@mess.org>
Subject: [PATCH 0/4] Cleanups of rc keymaps
Date: Wed, 24 Jun 2026 12:39:16 +0100
Message-ID: <cover.1782300922.git.sean@mess.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65534-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mess.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mess.org:dkim,mess.org:mid,mess.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 065A46BDB7F

I've written a tool for media-ci which checks rc-keymap submissions.
This tool found some trivial issues.  

Sean Young (4):
  media: keymaps: Remove obsolete RC_MAP_RC5_TV keymap define
  media: keymaps: Remove obsolete RC_MAP_HAUPPAUGE_NEW keymap define
  media: keymaps: Ensure module name matches RC_MAP_VIDEOMATE_K100
  media: dt-bindings: rc: Sync keymap list with latest list

 Documentation/devicetree/bindings/media/rc.yaml               | 4 ++--
 drivers/media/rc/keymaps/Makefile                             | 2 +-
 .../rc/keymaps/{rc-videomate-m1f.c => rc-videomate-k100.c}    | 2 +-
 include/media/rc-map.h                                        | 2 --
 4 files changed, 4 insertions(+), 6 deletions(-)
 rename drivers/media/rc/keymaps/{rc-videomate-m1f.c => rc-videomate-k100.c} (97%)

-- 
2.54.0


