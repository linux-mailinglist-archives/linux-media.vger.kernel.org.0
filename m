Return-Path: <linux-media+bounces-59901-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJksGPZb8WlGgQEAu9opvQ
	(envelope-from <linux-media+bounces-59901-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 03:16:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFADC48DE9B
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 03:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFDC0304227F
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 01:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3B423C4F3;
	Wed, 29 Apr 2026 01:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Qa05oXec"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930C1202C5C;
	Wed, 29 Apr 2026 01:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777425381; cv=none; b=MkJorIIuJM/hrfzJM/2o+vxqbEu9fOjAlRGBXxvo8hXch4dU0UOeM2rnGy6GZbaWhx9ldu4yoABoNZYdWad8qdwcmop2ghe9ZR8a5E6qg6Nwm4FoBmgzPFEXFIDnhOWocWLidEC46NbB+iG/8ugLdCTTDtQkpGKLjDMVFmb7w+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777425381; c=relaxed/simple;
	bh=S+FNbfKs3zWzpba+7WwK68JDLp3UZ3kapy9H/lK6Gi4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NCOOYuk5wzN6C7t4/jDHegQM+bXauGDLqIP8NM4Mp0lJT72+6XRvkUDZrbYwpfeAHQ/ua4naW3S8OtmcVpkOaqiEH/A/qWJwhKr0UnjzB8gBKPR3YTxZIs3Uo63Qv20ZkaTMs8aO5DHJxVndqr77MKppcFf76iZRrTowREJpMs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Qa05oXec; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777425351;
	bh=S+FNbfKs3zWzpba+7WwK68JDLp3UZ3kapy9H/lK6Gi4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Qa05oXec8ahYERRQAxUaMixD+mbcDBwzibYzCA114+uzqzPlyK7SaDkf4qaibxHSG
	 xsfHa+jhuaIyG4a5EdLkEJzWeZ1Nhu+t1K2rA06WoKjW+1Oda5idsrkXcKY13Nem3K
	 df0wrlRXnSywkPorvPZZ+6wOi43zlU4Oj+oki+mY=
X-QQ-mid: zesmtpip3t1777425346taac8aee5
X-QQ-Originating-IP: jNQDoEUcLVArnC5uGOzW+T+6J0rgvHPUr5JzTWgQ2yg=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:15:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18189464401092096931
EX-QQ-RecipientCnt: 12
From: Haowen Tu <tuhaowen@uniontech.com>
To: laurent.pinchart@ideasonboard.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	rafael@kernel.org,
	lenb@kernel.org,
	pavel@kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: skip resume when writing hibernation image
Date: Wed, 29 Apr 2026 09:15:42 +0800
Message-Id: <20260429011542.1936211-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260428091356.GF3219146@killaraus.ideasonboard.com>
References: <20260428091356.GF3219146@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OV65e10zTgieZCDzPvCfK5Z3DLP3a2mWak7upSWW93O6bknB3+JlJssY
	eOJd0K1CMNpGJJbJ+qju+AnF4HE/OqvPvL+Su2LGoUCkQ4v/qt33U68b2xc035L6TM4mf6c
	MC4/V2uQQiUkgn/Wj2W2IgVa2kGCIaLC/f6BjaZfgyBX3mon/38v8Vo+63T6G7kOaB82jsq
	Ptw1d/15Jk+jgPPJKj1iCJrAPPeE7E7Wq9klef+x2ESJsi/4T4cXgKz9MqytGjTD7ENYjsy
	msmUe7MHIEueAmhk3xDUSpGAS+8ePtcfpNeTkLt+675opzFwmcWS7IrDUpkRwfHAuRBo47R
	QEh0q8g7d7MYixi+gIHDvb3Mcf7rtTdQRmoRlo/hsYSATOkZxQKxg1Fa1O9HyhSRKsbIobG
	flkoqkDJ7vvKUhYy2EEbA7ndOucKwk4NBcouUd+4H2sJiBVcMTLFArLm9Zglb09qYcCIFsQ
	KyxTPA8gWKcOwUfcYSekTc9mcSm1OkLUfGQzoUmoqYfi9+Pmeb4RFhXppMj3vJioa8Uk5Jc
	z2Hai1034SddtBhAJPs8ljPhYV5Gkar6SDq9fTrZDD7x0sqtvm94CKjqLXrBPfl7X0cVQVX
	c3C0o5wzdFKfrIlDF6eNGEfiqzY/s1/EhwNC2OF2L0OSKPitrbUCNw4lfRNZU82859M6dHL
	EQYhcBOf001r6KW0BEp9gbhDU3WnK6G2A7nOs5jEAPZ3V3fNHZp16LSeYm2wU76iPoM14nl
	rjSXab8am76oDM39oQhR70J2e/lSK1hSB1p4qlY8B+N2sIWvBaKMQTBlex4CZScaH1voFtA
	5lz1+gCf3ihv9tsfIAX/6M+7givN61j8AG2ERGPTX7hHPtgpt71s/D3gR2hW29dz82Jh0FH
	n6LpA3ap9pCDAEEuNIm9jp67urRsUbkDDaoDnDZECpPCd5f9NrMeZ85fW5Rfs0fDQDALztx
	hjR0EqwmZjZuOYv+9dzcJ2+9gJ9YOp0rUSVm627xyVlKfJ3Sd59F9DkU5NrKlWnFwv0QGqu
	njp/zdN6S4gcjn6KpPWP4NESk6q8DaZUUcHG0JUc8KoIdazwY6nWaQ1ixNK2s=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: DFADC48DE9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59901-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tuhaowen@uniontech.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:dkim,uniontech.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Laurent,

On Tue, Apr 28, 2026 at 12:13:56PM +0300, Laurent Pinchart wrote:
> Will all leaf drivers need to implement something similar ? How does
> that scale ?

Thanks, that's a very valid concern.

If this pattern ends up being needed in multiple USB interface drivers,
then handling it in each leaf driver would clearly not scale well.

My initial motivation was that the UVC streaming resume path is reached
from usb_driver.resume(), which doesn't expose the hibernation PM
message. As a result, the driver has no way to distinguish PMSG_THAW
from PMSG_RESTORE locally.

That said, I agree this points to a USB-level design question rather
than just a UVC-specific one. I'll revisit the approach with that in
mind, and will include the USB maintainers and list in the next round.

Thanks,
Haowen

