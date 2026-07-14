Return-Path: <linux-media+bounces-67573-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l6l1JQNKVmql2wAAu9opvQ
	(envelope-from <linux-media+bounces-67573-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:38:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E18755F29
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:38:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=datapath.co.uk header.s=mailjet header.b=nFJy40hv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67573-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67573-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=datapath.co.uk (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4F8A3053882
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CA438A728;
	Tue, 14 Jul 2026 14:32:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from o128.p8.mailjet.com (o128.p8.mailjet.com [87.253.233.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ACE35E1AE
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 14:32:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039558; cv=none; b=AfzU5noMC6ybNYAddPptfPiCvU49sfQGqZBF4KMhtosGbAdFd6puUhZeaUF/t9iQPziD5va5YVo3L7NdFmUBlbMO3LSEEi2rpW96hGMV3T+iqzzO9hR9KHlwA3xo7rfSMdfAcNYFiKbVQXLQtLjPFXkyMUq2KRgFr08ea1Cyxd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039558; c=relaxed/simple;
	bh=zkgY23z2EpYFIDBMgDBP1604C7K6PurcKcAB1VGSoLc=;
	h=Message-Id:MIME-Version:From:To:Subject:Date:Cc; b=ILmDdlGGJiv5gaZDN3xQuRhgPRDF+oSem1qmXkUo6S8rtoF0dgkHQhkZ0shVMaeXM2G2H7fe1QTo7V+bESO6siHoP0r+3iejrxuPP1LJQUGwshIvZzgdjJKzyo7xigoVqPIxG8x8p6ZigQ1tC8y9GZ7PXShQoiaT5A9Z09jhckU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=datapath.co.uk; spf=pass smtp.mailfrom=a1809859.bnc3.mailjet.com; dkim=pass (1024-bit key) header.d=datapath.co.uk header.i=przemek.gajos@datapath.co.uk header.b=nFJy40hv; arc=none smtp.client-ip=87.253.233.128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; q=dns/txt;
  d=datapath.co.uk; i=przemek.gajos@datapath.co.uk; s=mailjet; t=1784039554; x=1784046754;
  h=Message-Id: MIME-Version: From: To: Subject: Date:
   List-Unsubscribe: List-Unsubscribe-Post: Cc: Feedback-Id:
   X-CSA-Complaints: X-MJ-Mid: X-MJ-SMTPGUID:
   X-REPORT-ABUSE-TO: Content-Transfer-Encoding: To: From:
   Sender: Subject: Date;
  bh=zkgY23z2EpYFIDBMgDBP1604C7K6PurcKcAB1VGSoLc=;
  b=nFJy40hvMxub+qaicENOiybpeyZc1H1ZnworUD5rpa1E4eHNwR2S5dQiq
 FcenRSoHph9j7UjKELuDCkT8GvUTCpmz4o7fx7lxnEhX4+NK3Y+fvwGHveex
 1x/zQN5aVacAtmhOSlEpYrH6tn+0q0g8yEfLx2P1Vxg3wDpXNew2CM=
Message-Id: <fb3f8857.AVEAAKBfiogAAAAAAAAAA-L_6E0AAYDONroAAAAAABudwwBqVkiC@mailjet.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Przemek Gajos <przemek.gajos@datapath.co.uk>
To: linux-media@vger.kernel.org
Subject: [RFC] media: Question about reserving V4L2 UAPI control IDs for
 out-of-tree rgb133 kernel driver
Date: Tue, 14 Jul 2026 15:32:26 +0100
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org
Feedback-Id: 42.1809859.1736069:MJ
X-CSA-Complaints: csa-complaints@eco.de
X-MJ-Mid:
	AVEAAKBfiogAAAAAAAAAA-L_6E0AAYDONroAAAAAABudwwBqVkiCE9VaXLXzSw2zgc7N13w5_AAafYU
X-MJ-SMTPGUID: 1df59b07-2528-4224-aca3-0358e1d0bb10
X-REPORT-ABUSE-TO: Message sent by Mailjet please report to
	abuse@mailjet.com with a copy of the message
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[datapath.co.uk:s=mailjet];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[datapath.co.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[przemek.gajos@datapath.co.uk,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67573-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[datapath.co.uk:-];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[przemek.gajos@datapath.co.uk,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailjet.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,datapath.co.uk:email,datapath.co.uk:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04E18755F29

Hello,

I maintain the rgb133 V4L2 kernel driver, which is currently out of tree.

The driver historically uses V4L2_CID_PRIVATE_BASE (0x08000000) as the base=
 for its private controls. With the modern V4L2 control framework this is n=
ow rejected, e.g. v4l2_ctrl_new() fails to create such controls under my 7.=
0-based kernel.

I would like to ask whether the media maintainers would accept a request to=
 reserve a dedicated block of custom control IDs in the V4L2 UAPI header (i=
nclude/uapi/linux/v4l2-controls.h) for our driver?
On initial research, I have not found any information about restricting it =
for out of tree drivers.

If this is acceptable in principle, I can prepare a patch for review.

Thank you,
Przemyslaw Gajos
Technical Lead - Embedded
Datapath Ltd
przemek.gajos@datapath.co.uk
=

