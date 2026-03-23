Return-Path: <linux-media+bounces-56691-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIRIHp8YwWn5QQQAu9opvQ
	(envelope-from <linux-media+bounces-56691-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:40:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B90D42F0586
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A136300DE0F
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE95A38CFFA;
	Mon, 23 Mar 2026 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="gbxSue5G"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C9C377000
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262022; cv=pass; b=RUHr1yM2pyzjf2lOvB3EKWrRzIA8ImJQxKfdO3hAiuqQaFoItaHCoJ5Z+2isbtmBuicC1XvUxNkRCgJ7EBMjMSm0BobeH2ipk6BthTByAU4mKFIvdcwrr8Zm87zusHnkxWu6ljog+JPFEVaPHwzxiVdBwPoqASltNNflTw+Dd9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262022; c=relaxed/simple;
	bh=J4NyMkgX2wWF94dC5S06mY+QzPlp6uHxzUQO7UfIxfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cHm/ST2ZcjUOrI0i0BiOTbHxftDMQltBzjLKdJvf1zOSiEfmoVtQEu2IVUUWqwWmvIzPhD55yj18OjjFOv1QQ7E3jKNul4hA/7kn+mJvomgXvnAHs2FK8SANTI6Xp8eRYUXYUni8IcFG/AQjkKGh1+a4GZTjopVUlvsRmue4Zyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=gbxSue5G; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4ffTzC40M9z49Q4j;
	Mon, 23 Mar 2026 12:33:27 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1774262007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=PWJUQw/UOsw4aCqUZCnKkWfXCGYKBWZtsCJUgG514fk=;
	b=gbxSue5Git9NJjzZ2WI+GoKNrFp12TNxZLWUmOw6NmHeTKQt3nlNQTe6t+vL6PX0vC/CNn
	6YyRsLXF++A6kh908yJ4nI90fnrqiEAIGNDFT1LrKgDraJQisaVn9h1vL3qbNanDMH39FM
	N+o1SVjwZhGiqAOSCR5yyJ+T/dQEnkTL1cHKRtDVVAIxHSMs2zqNIpDofRP2Be20+3dc2Y
	lsj5i0IITFtp5v7SWmZICg47qXSfE2h1KKl8nMDgNDswxaHMNhw3ZqvrD+IFAFUfXjZvjN
	taWqx/kpYsrczWYmsYmj3w32dithadIJvxa3nf3rSKY/VSFFV11fmQW6NNScdg==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1774262007;
	b=n93rtEm9KwsxlIfxir5TFR9DE5cOcR+qpAzLdtzZiMpN3/d1F258gBd9DcNDsPk1QLuhqZ
	ckzwO8Yq0xV+Y7tIk/tJ42JecWqrE75DKmCPtpKLkVObWqNjzbMz/i0v48umRdnTGPrVo9
	5jpNK4evEEX9Vhc6zoDd4FcJ5UKTpyb8pWVxRXLznxj8HuYZB9fM7Hm//lpksGmUpWPkVW
	ysMZP+FyWCGBQdLANQiasVN6C7BFdDpww70CSzge9sS3YCCe6G3gS2L+yhggobo3UO5Qxr
	4oyQ/eWvPXsbOodECI1MUyqogg3DYTRtyJ6S/d2P1w5Z0sVTkLiRlrUZIOwXNw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1774262007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=PWJUQw/UOsw4aCqUZCnKkWfXCGYKBWZtsCJUgG514fk=;
	b=eWMvjO2VCAGJT3tTqYgOyj2+Nh5wngt/k4ybvCMx/4X1fPFQWiotEWJo3i2thz+mW/hBWG
	jQ7MdP01Us25QQdlOKpelf9xqns9ZUaZG+1k/mSNxAPOpkOOZjp6BVTzoe5F++8/vSm3JB
	66r/cy+oa3Oja+aavUYj5+O9NeD64oEdAaBKaWWmstYusu4QsjeeBXESx5Q5Nu6H/50r8U
	xSXce5nQJhWr0Eak9MPG5RVtfAAFQDLInCTKL8UiCwL7l7DKa8lFZSgfYAcyN57vPcsDyA
	F0eWePX7F7s5ENbhTl3T2XahbVjCaTqYCetTMNXMqutIi/EFEAr+cz+XavatMQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A1BE2634C4E;
	Mon, 23 Mar 2026 12:33:26 +0200 (EET)
Date: Mon, 23 Mar 2026 12:33:26 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT FIXE FOR 7.0] CCS driver deadlock fix
Message-ID: <acEW9s8ysFi4ppSh@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-56691-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[iki.fi];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iki.fi:dkim]
X-Rspamd-Queue-Id: B90D42F0586
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

Please pull.


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-7.0-2.1-signed

for you to fetch changes up to 092f6562541e293d9e325ed94847f92f58c8ad6b:

  media: ccs: Avoid deadlock in ccs_init_state() (2026-03-21 23:31:22 +0200)

----------------------------------------------------------------
MIPI CCS driver deadlock fix for v7.0

----------------------------------------------------------------
Sakari Ailus (1):
      media: ccs: Avoid deadlock in ccs_init_state()

 drivers/media/i2c/ccs/ccs-core.c | 2 --
 1 file changed, 2 deletions(-)

-- 
Sakari Ailus

