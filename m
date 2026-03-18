Return-Path: <linux-media+bounces-56250-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHOQMOgYu2nLfAIAu9opvQ
	(envelope-from <linux-media+bounces-56250-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 22:28:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB032C2F90
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 22:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1E4B3186FB1
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 21:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD7337C114;
	Wed, 18 Mar 2026 21:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="zkwOvaxn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF532D1913
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 21:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773869244; cv=none; b=cAe+RRIfYc4MDTwLJTNIKMlR1wvHeAK74ewfYMFIgRYaM63xkkQZtbt2B3qPb1e+153/+p1VPDuDdgJ/h+unvkOKHY0+2VEKSlzQb18A+rGnvfEMn0M4ZlJACoD2OcYmeyRXb3+qrxnHf2IcIDb4gHVGiIbHtQ8UtCAcJ9SptzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773869244; c=relaxed/simple;
	bh=rM2dZM0qMqnXHr/mEQLFCYmhBQHVuaJpuztZuLPFcoQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ud3yAHYKc0hs7wWmdKVHvYs6ebbXcQh3Zy5IbiznbeCgPfJ1pr44+GXz65WdU99ayLkrmQAm7BQVvqhTb+1H6McdkeaU3AA9VyXrXULS60nLqSnZUYD1f4JH/FYzNUeZhbv722kpjNEi4BmJ5TbDRe7oSfCydT4DM5UXoN4kr+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=zkwOvaxn; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773869240; x=1774128440;
	bh=rM2dZM0qMqnXHr/mEQLFCYmhBQHVuaJpuztZuLPFcoQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=zkwOvaxnZTfLcGoY+uRHp56ZL8OAuFykGDOZCgssJT+PxheD1ZYTUpx5gllBv6IiH
	 a0GvgzYbZEDsJ24u1ZCGIOYPQTb+IXvkxh9it1bwSwt+v0k+wny3/7h7XDh/erqKd5
	 qGok8HD8Nfxh74j+dkOonc9fZuDgiJrIVHvKzWQpl7bwyJrANca/4g7iXL3HCgvcgg
	 ZW8nubWkRPvPL9neBKxDbfot6kO2A6assDX8aJ1OPq7v3X4WAdlJpTB/S3SrSN6l96
	 zLzHj0Ed1WweyFACY5BUYtqww57xEBzpWHBBrknY2NhhvR7N0VWnoMzcJMPqtDWKrc
	 wRCEGyw3SyZiA==
Date: Wed, 18 Mar 2026 21:27:16 +0000
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Abhai Kollara <abhai@protonmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Abhai Kollara <abhai@protonmail.com>
Subject: [PATCH] staging: atomisp: gc2235: prefer usleep_range over msleep
Message-ID: <20260318212645.2014561-1-abhai@protonmail.com>
Feedback-ID: 8137229:user:proton
X-Pm-Message-ID: 7060df1210ec361ec9ec7bfbbe532dc88c918bf4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56250-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	NEURAL_HAM(-0.00)[-0.917];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhai@protonmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:dkim,protonmail.com:email,protonmail.com:mid]
X-Rspamd-Queue-Id: 5DB032C2F90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Abhai Kollara <abhai@protonmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/s=
taging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..db5e007efc56 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 =09=09=09goto fail_power;
 =09}
=20
-=09msleep(5);
+=09usleep_range(5000, 6000);
 =09return 0;
=20
 fail_clk:
--=20
2.43.0



