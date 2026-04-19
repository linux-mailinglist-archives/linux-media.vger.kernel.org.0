Return-Path: <linux-media+bounces-59103-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id N50LMyn05Gn3cQEAu9opvQ
	(envelope-from <linux-media+bounces-59103-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 17:26:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F37B2424755
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 17:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 230F03011594
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 15:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A42D37E2F8;
	Sun, 19 Apr 2026 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b="rmOnonmt";
	dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b="QC32NDOz"
X-Original-To: linux-media@vger.kernel.org
Received: from out15-47.antispamcloud.com (out15-47.antispamcloud.com [185.201.19.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F505280A56;
	Sun, 19 Apr 2026 15:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.201.19.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776612382; cv=none; b=R00GEUuaaBwoGNg/ZwIxTr8ZKTRVQJCGiyPqD14ryv9f7C6LRialf/Sr0KJZ75LXGGthPB4mHU/oe88qpSWY4+fXyqrcVZvdnWGOqTzaVoikwNKGUO8EqPUD5qrE/KwVW8hVtRemZ3FuivStb8npvCT8qna6clynGg7wfBevbXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776612382; c=relaxed/simple;
	bh=AlLE1A8KF66ncM/5GEObGo/A7dbM/CvUSHeI1ue9sY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=noC6899ovkVoo3Erk6/4GV1oTFS8a9MaLECVgdPpTdk6jH0RYZWq/I5KmLR55d77/M3q7Ga+HJ8/VvyPj4c5A0+MWWQlv3FRDj00p4gYjmJWPsPRnWaTJ/lxxrW1ZD1iyhNcfFDDqFgZxdV03x9VY34byxX8aR87d51Wt4Ry/sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zonnet.nl; spf=pass smtp.mailfrom=zonnet.nl; dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b=rmOnonmt; dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b=QC32NDOz; arc=none smtp.client-ip=185.201.19.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zonnet.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zonnet.nl
Received: from mailout2.c3.isp-net.nl ([77.95.250.14])
	by mx298.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rn.mast@zonnet.nl>)
	id 1wEU2j-00GnFI-Ln; Sun, 19 Apr 2026 17:26:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zonnet.nl;
	s=mailout2; t=1776612358;
	bh=3VKbh6UT0r+Erdbz8pTJd6r00nTxCROle3auYtYimZQ=;
	h=From:To:Cc:Subject:Date:From;
	b=rmOnonmt6VIn44f79pR8ZKb8ffp99fdBzyjeFmWUcCAPCUss4BV7pjrQLvy4TkTpi
	 D3s+2rO90v2J3PXIQrDhXLr5SKmmD4wo+TaEEiO9yzvB7t+ryO8USSvSqS09TmVcKX
	 jg2Mz8CgkQMW32HpaLaT48bEyWki014Qqo2RlGiLKw1pMJybpnxAgdDoTZNWHLPCrg
	 QHlUqna2JqSqlhcHPg0STxHHzAN1tiVdkkZBgEQSMA1haJWgVAeFSLt4t82XIWu85k
	 wt3ceQh89u/+/G1MNTlFBlt12hwpPmPgxyXfFaax/h1QJSaTauS00sgJTtpfwQpNPH
	 9Cj3Od1LplFzA==
Received: from localhost (localhost [127.0.0.1])
	by mailout2.c3.isp-net.nl (Postfix) with ESMTP id 197F6800C0;
	Sun, 19 Apr 2026 17:25:58 +0200 (CEST)
X-Virus-Scanned: Debian amavis at mailout2.c3.isp-net.nl
Received: from mailout2.c3.isp-net.nl ([127.0.0.1])
 by localhost (mailout2.c3.isp-net.nl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id v0y7DFckfxpO; Sun, 19 Apr 2026 17:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zonnet.nl;
	s=mailout2; t=1776612357;
	bh=3VKbh6UT0r+Erdbz8pTJd6r00nTxCROle3auYtYimZQ=;
	h=From:To:Cc:Subject:Date:From;
	b=QC32NDOzZZT53a8/Ytqh89/QXfewkdk2mSaNkcVBqYIvgDwWcYdB3imYscLpO1grr
	 I4RadpLXDFv798Zv1gGSYJpsSU82m9HnmGEyAULdTx88+YmDJXh6EGzzcHoWAJqEEk
	 MCfEwtqLip2cg+rR8LiV+GymblBYF9Cf2Az/b9N0BBu0rEz1OH+QXKDX8JY46wocQZ
	 uVo2tHE5FRkVWTMssXOqmQiiPUTI6ohtzs7EbDItYW73usRqiBxhHF8/rHu5q40Ezo
	 CbWtyAkc2orZm/k2ta4ATqNi1gfkBeEdWYSEW7/31MQNEnw0LC0gSCu8NgrjHpF2a1
	 p4oC/h25vzSGQ==
Received: from 2001-1c04-390f-9300-d19d-7a59-d56b-16f7.dynamic.ziggo.nl (unknown [10.120.0.246])
	(Authenticated sender: rn.mast@zonnet.nl)
	by mailout2.c3.isp-net.nl (Postfix) with ESMTPSA id 76EB6800BF;
	Sun, 19 Apr 2026 17:25:57 +0200 (CEST)
From: Robert Mast <rn.mast@zonnet.nl>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	Robert Mast <rn.mast@zonnet.nl>
Subject: [PATCH v3 0/1] media: atomisp: mt9m114: graceful teardown and reprobe fixes
Date: Sun, 19 Apr 2026 17:25:13 +0200
Message-ID: <20260419152546.78513-1-rn.mast@zonnet.nl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spampanel-Domain: zonnet.nl
X-Spampanel-Username: 77.95.250.14
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=77.95.250.14@zonnet.nl
X-Spampanel-Outgoing-Class: unsure
X-Spampanel-Outgoing-Evidence: Combined (0.14)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuV4bHyZpFjITPucBYbBeMeq7zfXTHJy+4hr
 qzaHOc4sRyu2SmbhJN1U9FKs8X3+Nt2LTcqLh1fYYSBrpo52T+cL08LSf6AHMaTqrYEKhfhw60xa
 xbjFtHXwfWAPVzp//E10xYCHwzEoZpUBagq+YQPMCtmoQhY2xrBb8C+tWUvqrqBKsSdhvd/J5sX5
 daZjkYtD4nv5HHMIoTrfn8R52ZPvMK4JHKgLAcgeoG73EzSF9JLN8EqOrj2jEKT+woaXpsWWSPpc
 XGZyIXbjKlxA1QmXB6mHSb/tl+iz4DGx+nERWImLb10M3gdB4OsqltIBjR9LCxe/kHASpASB4Jqm
 OHLQ7yqeeI5+Rl7EMeeJ/dab4KYkKPorzaj90qQygCBize+Vjxz+gARbgmnGRdC/MLl+z0G6NyzM
 pr9q/TEXF7MaiciKl07WT7s9OXetZcPJ+iGwuwoMrFc4FuxUoXwLrhGmgejsJaMIBsfqW9wSybAK
 bXgHVYiBUNBJEOULy6r3eKk4kWeHW34Rpkd3GnbOPuHkTsVxuB/KWyFY76KJquzPhdRKSXnr2ZbT
 fJwflqPJY1NdPFg736Hj4qCv9Wq9HmRLlTitRX4q2vK/HxntPEyec/94/DuYtVM8tLN7unVILUGO
 3UAfp99QU2NoNyPM/URofCzdNGNoLjYW00m5NbCHvNvcv9YVeCh54zE9YvOKLPnuxK+BUkpJJGBZ
 H9gqPGZ7qYPIDNFTimSJAIqlu4XUcuwHFBEUYgkLqRVHmxP+vt0ISgS2K9OI8OhDoaI/bgdWet8L
 RYeQ5TA1TXS7v2mji2kQCOZULz3HFWlQO8EA3hI4xyIEAn1bt67HEm1wJD9I1dc68oARMVF47W6M
 5We9hRVmnnXdB1GOLcTHq+o4y0F/y2AjKqZyZrGH4jUZoZEFrSOIPpeqwlm2NDGXIJ2x7Hhfa15S
 Vf7sP5xhgDgArAMixg/ps/IAbGhPj+47MhrEKMw3jLj2Toe4W1sF+3K9oGpS6YK4BnWd/ehiIgV5
 n7o4uoc0Fnv9FTiL3ghUwUplYty60UbGpFUGUU5Q390bMrYu4cVaGUj5ebRlOfbbOqfbX6DPJMEK
 onOCAPoGHJqyz6joSu9VHAzKO3VFvsaAZPlIXalUITvNFfp2BsKuLcm+cnktkDOeY88grcpk6rDy
 7yvhQpVo1vO+SyY9HKzlh1oDjT2DhP8eeWRAl/P8oIdHfjjfSML936hXJs1KyZFKw6LLRFBRGPpf
 BiJg4xs3CV38UsCgfA33cC9f3Jp4Hw31MU62oe4qNRYfW7XcddzgZJ0Q4x+0GOxZvoENDONKwfMs
 KvKUfj3CUGQZVNqeRfoGaCfmlH8/z+izyVynxeituhq/IGZ0cCvl49xdmzHJuw==
X-Report-Abuse-To: spam@quarantine14.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[zonnet.nl,none];
	R_DKIM_ALLOW(-0.20)[zonnet.nl:s=mailout2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,linuxfoundation.org,ideasonboard.com,zonnet.nl];
	TAGGED_FROM(0.00)[bounces-59103-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[zonnet.nl:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[zonnet.nl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rn.mast@zonnet.nl,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zonnet.nl:dkim,zonnet.nl:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F37B2424755
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

this series addresses unload/reload instability between atomisp and mt9m114
seen on ACPI Bay Trail systems.

Problem summary:
- notifier lifecycle in atomisp could leave stale async state behind,
  breaking subsequent probe/reprobe cycles
- mt9m114 remove path could race async unregister callback ordering
- reprobe after module cycling could fail or crash around endpoint/clock setup

This patch hardens teardown/probe behavior by:
- explicitly unregistering and cleaning atomisp async notifier state
- synchronizing mt9m114 async unregister via completion
- adding safer remove/shutdown handling in mt9m114
- making link-frequency control/validation robust when frequencies are absent
- using safe fallback clocking in the ACPI no-link-frequency path

Observed result on the test platform:
- repeated modprobe -r/modprobe cycles are stable
- no probe oops during the tested unload/reload loops

Changes in v3:
- clarify commit message around teardown/reprobe failure modes
- keep atomisp notifier cleanup in both normal teardown and parse error paths
- keep mt9m114 fallback clocking in the no-link-frequency ACPI path
- refresh cover letter with tested behavior summary

Changes in v2:
- initial split and hardening for atomisp notifier + mt9m114 teardown paths

Robert Mast (1):
  media: atomisp: mt9m114: Graceful teardown atomisp and mt9m114

 drivers/media/i2c/mt9m114.c                   | 118 ++++++++++++++++--
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |   1 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   3 +
 3 files changed, 110 insertions(+), 12 deletions(-)

-- 
2.53.0


