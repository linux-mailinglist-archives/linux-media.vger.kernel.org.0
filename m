Return-Path: <linux-media+bounces-55516-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEqIKvX0smmLRAAAu9opvQ
	(envelope-from <linux-media+bounces-55516-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:16:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0983127675F
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 878F7300DEF4
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 17:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5B23FD142;
	Thu, 12 Mar 2026 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="A8X980ck"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CC43E5EF4;
	Thu, 12 Mar 2026 17:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773335788; cv=none; b=YcSHveu9uSgGGCgVrcnL+iincii1T767/vmQluIBh7GS07jM3tulx4MP7oI5aXIBv29Jq1Q1q06aNbe4EVEUC/VGmGunHPVbmYhg9qmtCW5AJLwQsGBBHhW7hLbkiUSkvVq5aIgtd0xWrS33AWcWfJENTY/RN6Nx+uubNdZabnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773335788; c=relaxed/simple;
	bh=rrv1iaxApfXlRRnoW1o+B1Hb7PxZnLBO1vZhq7Nguf4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T3XeCAsfNnxXGCLvWs8qaaLuIIfPmdos8jZpykHxxPGcpay81DMgXwaedu6jeOwC3uSYhKhvYE3fotezlTFeTTVVejOrYcacWURQN83tWmKcxqchgHcOJS1MiSOf0/2RfQDirEEo+oux/hfXatrDUtwfUDb+LP1Um63DzWCUUdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=A8X980ck; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773335779; x=1773594979;
	bh=WbRJD3fZmKepPJHwpzuESHFy/tHTPZLWMEtZ2JB/jnQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=A8X980ck87BWAVJFwrna7P9WxZt0zk0wkVbxn8oRyKs5ofDgC9bwZ2BecRfFe99ra
	 FYRq1ctLkRMc2bXQfF5uIWmo56FTNovAOBNIII/E7lbZy5EdNVUmr5DntoTC+1uhiE
	 j/8KAyF0r74Y0/kwkojBL3iNirAbcl+2TUDAV8pl7n+H16AbxQl6QDXxxoFxjkf12J
	 j/ZfKxM5vVVAbVykDtjtnexXPs5or4Q9LnlqIfi/rLgaVOod+m4K+kPPtPoI937MHB
	 SPZJ86UL+TTzYAAYdjuQg4/vQ7F/5lFrjDex8951yh+1kA8S7FOkfRSUobExACQiOF
	 rgrCbZoKO1TqA==
Date: Thu, 12 Mar 2026 17:16:12 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ben Kao <ben.kao@intel.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] ov8856: Add V4L2 device tree properties support
Message-ID: <20260312-ov8856-v4l2-props-v3-0-3771ab40a4c0@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 3b16c92893d8fff2c83ed48a52039c60240618ba
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55516-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,samsung];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0983127675F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v3:
- Free control handler on error in ov8856_init_controls()
- Drop blank line between orientation & rotation in bindings
- Link to v2: https://lore.kernel.org/r/20260310-ov8856-v4l2-props-v2-0-271=
7404ed045@pm.me

Changes in v2:
- Updated bindings to address Krzysztof's review (only allow orientation & =
rotation)
- Address Jacopo's review by removing redundant v4l2_ctrl_handler_free()
- Link to v1: https://lore.kernel.org/r/20260307-ov8856-v4l2-props-v1-0-767=
7b4c658e4@pm.me

---
Alexander Koskovich (3):
      media: i2c: ov8856: free control handler on error in ov8856_init_cont=
rols()
      media: dt-bindings: ovti,ov8856: Allow orientation & rotation props
      media: i2c: ov8856: parse and register V4L2 device tree properties

 .../devicetree/bindings/media/i2c/ovti,ov8856.yaml |  6 ++++++
 drivers/media/i2c/ov8856.c                         | 23 ++++++++++++++++++=
+---
 2 files changed, 26 insertions(+), 3 deletions(-)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260307-ov8856-v4l2-props-def87d7854b1

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



