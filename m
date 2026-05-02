Return-Path: <linux-media+bounces-60182-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNt1AaH39Wm+QwIAu9opvQ
	(envelope-from <linux-media+bounces-60182-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 15:09:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AABF34B217A
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 15:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 434C4300F79C
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2026 13:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0AC381B0A;
	Sat,  2 May 2026 13:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="hPYYpV5v"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759DF3806C4;
	Sat,  2 May 2026 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777727371; cv=none; b=uDkAG3zBRW3BuOXCAChxCQpUrxVgnmLHUCDAmuMeXso6Y50OPiiYOh33Yl66AwoM6xpCZPMb/BTGggnRT0LcIBPNhtWjyHUvJGK/+lTwuRkUTCAhrK3p/whyTWhHuWYtfVfhzqatzXG8y3n9VqmE43Hy23wyQTSTBR5bZKG239Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777727371; c=relaxed/simple;
	bh=z+W/yjquw37SF0By8PEAxaL4ODnBVGLJHUR6gmAC5nQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=GzQNfuO0aYKEVYp8JU0w5NTWeaYsQltst4+kCXK1WLEt7NPzqGqM9TtoUstlicYCrGBEoe4wAZkRBlguzL2WY9GoM+2EYuLP9ItQXBQxyTD55cZX44bnIfGFxHfeGn+Auo2GSaPv7I9XXfLnbNxmtDahU59wAdD5VZlCVtqn8c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=hPYYpV5v; arc=none smtp.client-ip=203.205.221.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777727366; bh=z+W/yjquw37SF0By8PEAxaL4ODnBVGLJHUR6gmAC5nQ=;
	h=From:To:Cc:Subject:Date;
	b=hPYYpV5vEenFbBfRh0aVD0aFYxIyuM7YBeu3VAI3IqNXO5pDg2cBzaUBYkXjueuQG
	 BnOHpt/IbdeErEYEtjvd+sl6uDOunzC7tT9lSkEjIr1mGtDVxbs9x1UpHqPH6XmZtw
	 y9ALlEMrfG6PJzgssAfWmW26pQoLo+nF9G1yTx8w=
Received: from Lang.smartont.net ([2409:8a44:2312:14e1:56d8:1e1e:3f0b:d0f3])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 25602278; Sat, 02 May 2026 21:09:22 +0800
X-QQ-mid: xmsmtpt1777727362tzookrlu4
Message-ID: <tencent_4146F4975C2BC4DC82A0655C1C24F1CDD308@qq.com>
X-QQ-XMAILINFO: MKUhwZFKNyqxSbeA+sASx3u1uYJ7AfytbBDGtganaIuYjwqDti/5ckMIxXeym7
	 8sdqF7pHHg9TWGeugy0okyBLfnh7c8mJoAXkqWKvYWdRmDPwQeDT9cvdzM6BpYe9yThJEIwHLds7
	 WWbNgAgJOl0hgcC4ZLI6B/co8tHst+8EF/KXUpE99y5/97FquhXeWvaIpGvsfJB9g/0bFzCm02xz
	 gY31eTvLSlBHsGU3qat7eMFfsMZaH7K1xFJQmcFbzbOzVvOJCsPVouTBWqgPy53ls/mGDofFNFsK
	 DNJVB/zQ8mEfVDPIWz5jcxhWT+Wyy9ilGQwZeleaIT6a5WHheKnYMNfMH9njBiuI1UxnLLNJoGA/
	 btYcvXQ7RPG+9Es3uy7d2zs8RzbUS30tqs+PzI0vzcV1eU3ddrNHr5JR0pIqAaDTS6K2fMunCYsh
	 dQ9DRp2TduPtWp+NaPmkZz1BEwzE+JWfCPbHW+fkQBa9CTOGOb+WX9swk/WbhnVIqjyUiDfDzjsR
	 gL5zI36TIN6/EbDQZ2AYyze7sCxUUxaeItZbZx7BK4aUigmKfYWmFrvB1VNeqH8wztEcJWwCBhSR
	 /2hnlzE5el1h1z7U0s1A1RsMserSIYTTQGzQMV9TX00FxBwZshRkjzMFcdp7RfmPrfSoRr8s1gvH
	 DHzIPJfkJzYhK8f2Rz23mj70QegQnyxXBWRx4vKuvC0COXhZpKuusycTqR2U7as4Bu7xaGXYnoUG
	 5M4ZmXfGSc6nS3lNuFy0zDqJmBMMbX5YUuYHSVTiDzeyS6LEFY40/EDIKrdOBYELro5o5ebo/rXo
	 Snuozx+V/MWqegHChTQu2fsr7Ru2gPN7pV8taRAQbjT4olYiSKCVukCLyxUeLZt2xXZvw2KMtU15
	 NKhemyomYS7WjR+p4XwJTlt+U1Tr/vVO/6VtQtPhL3HPtp6nyPOlWLhrx9/nQF5K8+Kbh0ksqf9a
	 aiFD6S9NcUeVT2mpNHzgeJa/SpMKCwO5EjQVBRWeElxARKr2G56LKtRhylJDY2khQBDVxRasTL1w
	 fkPfVHzMjOvdWKE/50grkVFVn2nvY7dgkBjRGJZb0NedWS8jspdosl+Xv/tM+JslbJ4jcgFZaPAC
	 PBJon0
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Wang Zihan <jiyu03@qq.com>
To: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-um@lists.infradead.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	corbet@lwn.net,
	mchehab@kernel.org,
	richard@nod.at,
	linux-kernel@vger.kernel.org,
	Wang Zihan <3772548978@qq.com>
Subject: [WITHDRAW] Documentation: Fix duplicated words - "in in" was not an error
Date: Sat,  2 May 2026 21:09:18 +0800
X-OQ-MSGID: <20260502130921.638440-1-jiyu03@qq.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AABF34B217A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60182-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,kernel.org,lwn.net,nod.at,vger.kernel.org,qq.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiyu03@qq.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qq.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[qq.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:email,qq.com:dkim,qq.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Wang Zihan <3772548978@qq.com>

I apologize for another incorrect patch. After review by Björn Persson,
I realized that "in in" in switchdev.rst was not an error:

Original: "what position a port is in in the overall topology"

This is correct English:
- "what position a port is in" = the position that a port occupies
- "in the overall topology" = within the overall topology

My change incorrectly altered the meaning to suggest that a port IS a position,
when in fact a port is IN a position IN the topology.

I am withdrawing the "in in" part of this patch:
- Message-ID: <20260502111916.145238-1-3772548978@qq.com>

The other parts ("The the" -> "The" and "on on" -> "on") were also incorrect
as previously acknowledged.

Thank you for the correction. I will be more careful in analyzing English
grammar before submitting patches.

Apologies for the noise.

Wang Zihan


