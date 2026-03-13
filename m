Return-Path: <linux-media+bounces-55656-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK9xOunxs2nYdgAAu9opvQ
	(envelope-from <linux-media+bounces-55656-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:15:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D46128210A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:15:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0C8030F69F9
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A17E3859F7;
	Fri, 13 Mar 2026 11:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QeL6xajd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB15277CA5;
	Fri, 13 Mar 2026 11:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400453; cv=none; b=FlBSRuDUx1+LHyj7ZnHlaBDVQKtJ4icpQH7W1yOFNKdCsaXo/5QE168dgLUvVhJADOgny0MfwVX8l+9XOWhQza9cgBWT2CFFG4ZnvUrv6ACRdF3m43eQFs24fjWnPjpmpZbkpPoH9O/YTuM6o5/xCm/pc4qYgB8Z3Gcg0MR4ld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400453; c=relaxed/simple;
	bh=VTlKAUXRjtNvrAzU2KtEl0Xt/Sbz/0Q0eCX6rPkRKI4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V2KwBCUr64/soMCbI6IrXsRueuTuUknVvhUV/8ewG2xOBYgQlKLRCh81ug+el9qKdAkJgW0aDzA4YKRNEZVOpqWiu8Trxc4bORBs6jVZwJkVEZUO7pDPKcWIkvc45IFHduxAIGBSNpOvwCemND1EPXjMxZ5N1286ILUIng7nz6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QeL6xajd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [37.159.92.229])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8D8BF52;
	Fri, 13 Mar 2026 12:13:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773400381;
	bh=VTlKAUXRjtNvrAzU2KtEl0Xt/Sbz/0Q0eCX6rPkRKI4=;
	h=From:Subject:Date:To:Cc:From;
	b=QeL6xajdN+KPfkUJVFYQDyeaTDCtAxa63cjN/n7v+762tzTIxpGWULdSU2flA0Yg2
	 CohibMjOLsVTku+Z78e4koqYm3IH0E4hhL+HJlWvmxMzV6/MsXfq/Jmc0FBKKlqRBI
	 d7+Pdl3majuKAHtcWq36STOFQrkmzg1M4nZniVmw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 0/7] media: renesas: rzv2h-ivc: Fix concurrent job
 scheduling
Date: Fri, 13 Mar 2026 12:13:56 +0100
Message-Id: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHTxs2kC/x3LQQqAIBBA0avErBtQJ7K6SrQom2qgLBQkiO6et
 Hx8/gORg3CErnggcJIop8/QZQFuG/3KKHM2GGVqRVrjMe6CkhwucnPEZFFhRYsjmhprW4J8XoH
 /msd+eN8PNXTyyGUAAAA=
X-Change-ID: 20260311-mali-ivc-fixes-v7-0-43fc33b87793
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>, stable@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=VTlKAUXRjtNvrAzU2KtEl0Xt/Sbz/0Q0eCX6rPkRKI4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps/F/p4LONZvvLS3Q+nCbe0IYpcgOnCu8w62OT
 rZ8zKwYYe+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPxfwAKCRByNAaPFqFW
 PPDRD/9naa62MXEZEtp5n4BqX2lQpDgyjCahw95256IbdKhX184rWnUuTWfuRyGEhmyyaG9xWys
 oYHSTQ1OaOLKrHo+DC8IcKLDHTacSTWX0M+t/IOAQ1x3EIhaP/Pmq/dMxZHMfMJRCybdIBZpL1/
 GvShq2omK+StfmhqSo5jpHa1c51I+7gsBSXm7vSDTxhEL6xeM3FuNB+Xt+FqEP1CZgL5v7uA+1a
 0HkIu9eMlWvXUGjuxH1SPdyfe92gimTqe5OEnleEsWUgHoud9Mw8YcCe+tUbemjmoVN33Zn6Um4
 q24/5+YL37VhWppxKQH4CWu59YxR0kxaUQP7DFMZIXZcJq9mq4wnWmI6CzeGIlePF7Qa7eUgmHu
 eUmx3LC4Pmzyo+id1qLycKobmU3nslGIRNb4O7/AQm8w0EsIlcg+dmvH0Vpc7XkoG+9ROaJ9BoP
 VbjelR++ZZSPqvzx+7+5NR6WcC6RrSUVN3ruaGJfSkmG4O5E2DYPK4e4W/bU+3V1shMe58hs+Am
 1nye+Emzgsg7ZG5yteJXEQd8HV94+cAblW2c7kEkCtY9PhzaWPOUzA2+iaIInNHPbNpj+Z8hgxj
 LmLZj+fTmV3mxgs9TAyostUmS6Dt64Bj4Qdk0082PgbsCoaMoaAq8ykX01MS2JjYhczDjtw1QY1
 7v6MDwPDnhltVww==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55656-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 5D46128210A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We have been exercizing the RZ/V2H(P) IVC block quite intensly these
last two months.

Here it is a collection of fixes and improvements to the driver.

The first 4 patches in the series address a few registers writes that
do not respect the documentation.

The 5th and 6th patches fixes concurrent access to the list of queued
buffers and fix a WARN() visible under heavy system load conditions
caused by concurrent buffer transfers.

The last patch is actually up for discussion. It is my opinion that the
trouble of setting up a workqueue item is not justified by the
relatively small amount of work that has to be carried out in interrupt
context. In any case, there shouldn't be any functional change
introduced by this patch.

Patch #7 makes patch #6 reduntant: if we use direct function
calls, then the issue of concurrently running workqueue items cannot
happen. However, I actually think patch #6 has value regardless as it
makes the code more robust.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Barnabás Pőcze (4):
      media: rzv2h-ivc: Fix AXIRX_VBLANK register write
      media: rzv2h-ivc: Write AXIRX_PIXFMT once
      media: rzv2h-ivc: Fix FM_STOP register write
      media: rzv2h-ivc: Fix concurrent buffer list access

Daniel Scally (1):
      media: rzv2h-ivc: Revise default VBLANK formula

Jacopo Mondi (2):
      media: rzv2h-ivc: Avoid double job scheduling
      media: rzv2h-ivc: Replace workqueue with direct function call

 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     |  2 +-
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 63 +++++++++++-----------
 .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   | 13 ++---
 3 files changed, 39 insertions(+), 39 deletions(-)
---
base-commit: f6390408a846aacc2171c17d88b062e202d84e86
change-id: 20260311-mali-ivc-fixes-v7-0-43fc33b87793

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


