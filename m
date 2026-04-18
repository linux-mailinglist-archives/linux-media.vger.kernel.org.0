Return-Path: <linux-media+bounces-59073-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGTLGb1X42mbFQEAu9opvQ
	(envelope-from <linux-media+bounces-59073-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 12:06:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A9C420A0D
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 12:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 092883055DCA
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 10:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0142346A13;
	Sat, 18 Apr 2026 10:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b="XN4MZOUy";
	dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b="XN4MZOUy"
X-Original-To: linux-media@vger.kernel.org
Received: from out13-47.antispamcloud.com (out13-47.antispamcloud.com [185.201.17.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D7172623;
	Sat, 18 Apr 2026 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.201.17.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776506764; cv=none; b=UjSTbw6obkXsEYpB/n2p9pIKc+m15Oi4PewI/azfoHyj6x+00KVrPzNTqh+o6JZ3LW6yh5EFFo5JChGvDGKrkeiiSPY4M4QxGsMs8rESdpIH4AI+jApq7sltS+G7sPhGKcrswK6zgb+B9JHicfGmQPEwGO0Is+C8q9dcDuLXBv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776506764; c=relaxed/simple;
	bh=7/9bwd2WcQP5/XURXA8ikNMwHn+Djf2Bn3Pb4T7PPpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ezGGFH5LT3Xw42t7gdRNL8df9ncHYJB9AQ5Qe3wCmIXDjNMmcLqBI8kxMCinKg7gG5Vl/bkg/ApCQm1QG/LeP8v57zEJG4UQ4gW/4BwyHftz0dccC58VjQhcADjxXyNurOq2sNNv0IzY1zAHCL7ipsDDJjLhlkc1Gv8FeN23NQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zonnet.nl; spf=pass smtp.mailfrom=zonnet.nl; dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b=XN4MZOUy; dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b=XN4MZOUy; arc=none smtp.client-ip=185.201.17.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zonnet.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zonnet.nl
Received: from mailout1.c3.isp-net.nl ([77.95.250.13])
	by mx297.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rn.mast@zonnet.nl>)
	id 1wE1xg-008EJL-4b; Sat, 18 Apr 2026 11:27:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zonnet.nl;
	s=mailout1; t=1776504453;
	bh=/JahKD0FpAawLqf5XBm6BkuysiGdjwvL44OWTsyz5b8=;
	h=From:To:Cc:Subject:Date:From;
	b=XN4MZOUyBhdACbM5nCKKoKyuMCImh0SIiIL4FLfnE8U75NlOYxYVsFH/QdpW33Woj
	 58Uiqzq/Qb2rHdqEYXyy+0c8iyYB7fNKY99WQXQ3PqXXc+lkH3cJU9FhhilSRCXDHU
	 OtRwUL0+l/iVpiNeOp2Tr258rlfzzFxXG9NFZSqYnCiV0fMehaRIx5XoDDsgSbC/Zn
	 hKD3+1eAtHiuGpyYJCHaKoLlaR2O9WTlR+dNFrPAlMV3gm0260B1yMCHyUPd8JFuOl
	 c2QX6byPyny767jpWRePHr2aEQnRefHCXohum9p1cgja7YqAv5lwZvz2coyjNvY1hY
	 t4WkMS91sPlqA==
Received: from localhost (localhost [127.0.0.1])
	by mailout1.c3.isp-net.nl (Postfix) with ESMTP id C2F7F84FF2;
	Sat, 18 Apr 2026 11:27:33 +0200 (CEST)
X-Virus-Scanned: Debian amavis at mailout1.c3.isp-net.nl
Received: from mailout1.c3.isp-net.nl ([127.0.0.1])
 by localhost (mailout1.c3.isp-net.nl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id MthFPuaOjm7B; Sat, 18 Apr 2026 11:27:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zonnet.nl;
	s=mailout1; t=1776504453;
	bh=/JahKD0FpAawLqf5XBm6BkuysiGdjwvL44OWTsyz5b8=;
	h=From:To:Cc:Subject:Date:From;
	b=XN4MZOUyBhdACbM5nCKKoKyuMCImh0SIiIL4FLfnE8U75NlOYxYVsFH/QdpW33Woj
	 58Uiqzq/Qb2rHdqEYXyy+0c8iyYB7fNKY99WQXQ3PqXXc+lkH3cJU9FhhilSRCXDHU
	 OtRwUL0+l/iVpiNeOp2Tr258rlfzzFxXG9NFZSqYnCiV0fMehaRIx5XoDDsgSbC/Zn
	 hKD3+1eAtHiuGpyYJCHaKoLlaR2O9WTlR+dNFrPAlMV3gm0260B1yMCHyUPd8JFuOl
	 c2QX6byPyny767jpWRePHr2aEQnRefHCXohum9p1cgja7YqAv5lwZvz2coyjNvY1hY
	 t4WkMS91sPlqA==
Received: from 2001-1c04-390f-9300-d19d-7a59-d56b-16f7.dynamic.ziggo.nl (unknown [10.120.0.246])
	(Authenticated sender: rn.mast@zonnet.nl)
	by mailout1.c3.isp-net.nl (Postfix) with ESMTPSA id 3A39384FE7;
	Sat, 18 Apr 2026 11:27:33 +0200 (CEST)
From: Robert Mast <rn.mast@zonnet.nl>
To: hdegoede@redhat.com
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	Robert Mast <rmast@live.nl>
Subject: [PATCH 0/1] media: atomisp: mt9m114: Graceful teardown atomisp and mt9m114
Date: Sat, 18 Apr 2026 11:26:50 +0200
Message-ID: <20260418092651.7873-1-rn.mast@zonnet.nl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spampanel-Domain: zonnet.nl
X-Spampanel-Username: 77.95.250.13
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=77.95.250.13@zonnet.nl
X-Spampanel-Outgoing-Class: unsure
X-Spampanel-Outgoing-Evidence: Combined (0.15)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuVzkKdCtcsyq2M+fj6t3NdnVaPuWW65IIT8
 lIUNtU+PTCu2SmbhJN1U9FKs8X3+Nt2LTcqLh1fYYSBrpo52T+cL08LSf6AHMaTqrYEKhfhw68gN
 /EyREE3YB/fhubmAJ7RwGYjbvhzWX8Co+5c+eruaCtmoQhY2xrBb8C+tWUvqrqBKsSdhvd/J5sX5
 daZjkYvf97og0NB52/5kO+HLq4D+zthz0vNkOX8Em4cj6D/wdWXeV9Bd+eCGFz94bj3J6mCWSPpc
 XGZyIXbjKlxA1QmXB6mHSb/tl+iz4DGx+nERWImLb10M3gdB4OsqltIBjR9LCxe/kHASpASB4Jqm
 OHLQ7yqeeI5+Rl7EMeeJ/dab4KYkKPorzaj90qQygCBize+Vjxz+gARbgmnGRdC/MLl+z0G6NyzM
 pr9q/TEXF7MaiciKl07WT7s9OXetZcPJ+iEZIDb+tWwVtfEkTd1DmWEMx4cxclVLGJ5zG2OKuuiu
 LBW3wDcLkxizMm6cIsmgKgHdc2FzsiphQiBWCBo+Rdog0Ienw6D2na211delpluLBnJeaTquL51B
 C5DECL7dg10Z0FtiGnvQOxRcjF6FhN0WyZgbhy6Ip7cFP895tjTrYd9lnKjPBBGLOreEEmSS6X6j
 y+7pKH36/g9onY8H2FYgMM9I0/4fnjl8YFS6mESzJcZB14E0iQtvqvjtp9rD8IfQ/D40Z68B2DiK
 dvr2RLXgBm3U2UtwRO06Xf+KSztJsS9B50OkMrZKWOcI0A7s2lynG5VyenLLXzp3KCqmaIP06041
 BnhL3X2pUAH2LrOXNMNpU7pwNatB7azi+0J+PaEKUJnMDx2D0A8JqK02gelEf/MW44Mgw/GHzNfM
 4bWy7ZZKUzHB2ndISgNJ+yXYIRny3wXb2+8uXM3rwifAL98dASJFC/49WOPBr5nlEUI4xB8RBH+w
 GHpYBB2QwDWcbc/ExllEU0r/aN4Ii1hX3eP+ZWPsENg/R75+e0JnezcDE2pS6YK4BnWd/ehiIgV5
 n7rk99FEUFwJuzU2/TUeNbFcYty60UbGpFUGUU5Q390bMrYu4cVaGUj5ebRlOfbbOqfJtLgsqGtK
 oYlxJjEQ1a8Kz6joSu9VHAzKO3VFvsaAZGxh8ZoUi//5A8og9+ennCoBhUrB8OO1EKZRhSvCGboA
 7yvhQpVo1vO+SyY9HKzlh4sJf5/wSxYuFQ95wCsE2mxHfjjfSML936hXJs1KyZFK3enQQ1JvIb+B
 wZuSOcQMbF38UsCgfA33cC9f3Jp4Hw31MU62oe4qNRYfW7XcddzgZJ0Q4x+0GOxZvoENDONKwfMs
 KvKUfj3CUGQZVNqeRfoGaCfmlH8/z+izyVynxeituhq/IGZ0cCvl49xdmzHJuw==
X-Report-Abuse-To: spam@quarantine14.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[zonnet.nl,none];
	R_DKIM_ALLOW(-0.20)[zonnet.nl:s=mailout1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,linuxfoundation.org,ideasonboard.com,live.nl];
	TAGGED_FROM(0.00)[bounces-59073-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[zonnet.nl:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[zonnet.nl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rn.mast@zonnet.nl,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0A9C420A0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Robert Mast <rmast@live.nl>

During the many iterations on mt9m114 and atomisp on my T100ta baytrail
I was annoyed by having to reboot each time, as modprobe -r/modprobe
wasn't able to fully reinitialize mt9m114 and atomisp, resulting in cpu
core hang ups. I asked Github Copilot Enterprise to fix it for me, and
the fix looks quite good and has served me well since. I'm not able to
distinguish any structural flaw, so please review.

Robert Mast (1):
  media: atomisp: mt9m114: Graceful teardown atomisp and mt9m114

 drivers/media/i2c/mt9m114.c                   | 118 ++++++++++++++++--
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |   1 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   3 +
 3 files changed, 110 insertions(+), 12 deletions(-)

-- 
2.53.0


