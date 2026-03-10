Return-Path: <linux-media+bounces-55031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLdDAWKcr2kTbAIAu9opvQ
	(envelope-from <linux-media+bounces-55031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 05:21:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEB124539A
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 05:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE5F43045033
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 04:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48603C6A58;
	Tue, 10 Mar 2026 04:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="MBZ7YM/v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C211021ABB9
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 04:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773116493; cv=none; b=fmKSt71b/duCX2qh8py3n6EljcmDHM9/udkZd3brF7SyZNp0saiAlsLk2KcCfXN/JTrckHAdmPBEgdqBZr6WRpOLDcWOeAj+TvLdxq/J/8cznQCoYspN7ZuOCG8dFkFZcVfxGL2Wb7Ua9FlniuY6AEHFI7ZJCtRjPlMe4oCEQ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773116493; c=relaxed/simple;
	bh=ijtq8VvhHe6QRKibUjNcDsDKKfhbkWYkXTdlk0Sc02U=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YEAaVAKvdIQr7Dw7dGvdCPm4AVNK3qwgV43Jk/gWO+d8Seh/iyxpWXfnlme2OfWNJpnvvIOWk5G1IV0L3vfq+wCzonik3QbCoVz6UGIb+6B42IDK+SWSD4Q+qKZMXZLdJrTU636Vl8uUrWTcxJhyMlT9Pj9fN60ZdquU6wzJhxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=MBZ7YM/v; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773116488; x=1773375688;
	bh=DxdcRk7AseRS8H0uuZbY4DSBjJcnkYEwMXAK/me3iB0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=MBZ7YM/vWeFBfCZYJKNDufSjc3sweCyZUEa9dBoDMAvf4n72nLB57/r1TrnLE+4n8
	 R7qtFV1AXcFA/kEmEyxoGVfdwryKo50rc7T/RNgWm5T6qqD0YXRd7bL1K2Uk1yAgff
	 0HsNadFQfFvKX0BM7b6GKlEBqiJDeVaNd6IUmXsPc/4oXU5sENkdcnerhO0N1L5k/A
	 n/jUWPgfWNHjqCt8KuGR5cKq3seGkBkBlULjJKLkV0iBV5BI7SVrGOTmUMQKK3VVjQ
	 5X+WDcUETn0/OES9F6eunEyl1geRDKhnUuwiOnEcyyYV2lsZXjatcDHjYGd5pxGleN
	 v+iZb7aOswZCA==
Date: Tue, 10 Mar 2026 04:21:24 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 0/2] ov8856: Add V4L2 device tree properties support
Message-ID: <20260310-ov8856-v4l2-props-v2-0-2717404ed045@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: ed550cef4375c3ab3ff2bf7d9bfee770945a1916
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5AEB124539A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55031-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v2:
- Updated bindings to address Krzysztof's review (only allow orientation & =
rotation)
- Address Jacopo's review by removing redundant v4l2_ctrl_handler_free()
- Link to v1: https://lore.kernel.org/r/20260307-ov8856-v4l2-props-v1-0-767=
7b4c658e4@pm.me

---
Alexander Koskovich (2):
      media: dt-bindings: ovti,ov8856: Allow orientation & rotation props
      media: i2c: ov8856: parse and register V4L2 device tree properties

 .../devicetree/bindings/media/i2c/ovti,ov8856.yaml          |  7 +++++++
 drivers/media/i2c/ov8856.c                                  | 13 +++++++++=
+++-
 2 files changed, 19 insertions(+), 1 deletion(-)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260307-ov8856-v4l2-props-def87d7854b1

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



