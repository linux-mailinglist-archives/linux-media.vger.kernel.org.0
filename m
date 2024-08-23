Return-Path: <linux-media+bounces-16677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F104695D873
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 23:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D6B31F22FBA
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 21:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288381C8228;
	Fri, 23 Aug 2024 21:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="VBJcJj2a"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AC724B4A;
	Fri, 23 Aug 2024 21:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724448711; cv=pass; b=QTnShlJKwLB6u3yQUPEejpWZEPVNBoLrAmd/nbFnl1fnP96/ck7lHEVwqDau/i0HpB6DkKcGuanohhMGnwouCw0m38BMSNzeKoG0DzCUFi8DdniQF51u5z6uiyh8bxie9+SCM/4a9dXKaZS29oYRQjXY7H6Pivb8DynBWIhrgbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724448711; c=relaxed/simple;
	bh=wyI8ML1w1FqMTbEMu76Hut5sbuOD/A3g4xPUxN9NUzk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pYqcz78+qW/ambenLMO7fIq3NZIjfIuVVNtYoVPCN0r2xgsibY4xqH5sxbdZ4SnKuw8o3QcbtSlcL5gd/jchqRFB5R18qo+wfw9AmCZRvmhwB6ubf1OR7o/cDbMa3lsMAbvAm0gaIO3G8pi4PQzDibdnGwf3ePT1OwRhHzi+9Vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=VBJcJj2a; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: angelogioacchino.delregno@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724448699; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xl/Zfx7Xclz/z3s5EKpVC3Mc6D9WtpIC8WB6JtqKqAfKm8EuRUMtAO6zGcbaJz0g8AMFMhfEwQkhynAZbdMtRHrPGxLeBHjjk/QrWHRsQVRovqTlyHCjGVqk+lX5tRMh3jYmrQSf7AmYFvnhjIWBMMDCrXLmnQV6cIEMvJs4yNY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724448699; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=faZTWsJecnvdOlAjahWLoCMiZoe5zzRsIAbS695uofU=; 
	b=gZNFjaHEAzJTeZbVs8HfU8F3lF5rHviSxRhdgHhHUdFQH4nwsNSUCMMBU+G4DAOYxhBtmRLETE/VUW59/BsYP0cfNtJnyMan7FAkellUDem8+cDyzDAL4bGVzULqFsyUg+iXDYm84Upw86B25KQn408W1HwQUbyZEP7nUOUH7gc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724448699;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=faZTWsJecnvdOlAjahWLoCMiZoe5zzRsIAbS695uofU=;
	b=VBJcJj2a6CK6e/COGZqI72JcoU5MjdRtuehW7/nwwIunu1OVppSk1RY4CTDfrbRz
	nLv0Kiu/HQt2WdO6Mj08thXxzmoc201SVyvChJ6SL7Q7a2pqiYiUKRW6Y7YOIQYE+1g
	dMOGl91JuRPif0UQCOtLGcufLxkcK+FTP1HC2JaQ=
Received: by mx.zohomail.com with SMTPS id 1724448697934898.310874403391;
	Fri, 23 Aug 2024 14:31:37 -0700 (PDT)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/4] media: platform: mtk-mdp3: Cleanups for masking in
 cmdq operations
Date: Fri, 23 Aug 2024 17:31:20 -0400
Message-Id: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKj/yGYC/x3MwQpAQBCA4VfRnE0xuySvIgfGYIq17UZK3t3m+
 B3+/4EoQSVCmz0Q5NKoh0so8wx4HdwiqFMyUEG2aIhwn7xBPnaPvMngTh9xHhu2puTK1gQp9EF
 mvf9p17/vByQ94RFkAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.1
X-ZohoMailClient: External

This series contains a few cleanups to remove unneeded masking in cmdq
calls and in the helpers that call to them throughout the mtk-mdp3
driver.

All of the commits in this series are cleanups and don't cause any
functional change.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (4):
      media: platform: mtk-mdp3: Use cmdq_pkt_write when no mask is needed
      media: platform: mtk-mdp3: Remove useless variadic arguments from macros
      media: platform: mtk-mdp3: Remove mask parameter from MM_REG_WRITE macro
      media: platform: mtk-mdp3: Remove mask parameter from MM_REG_POLL macro

 .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c   |   6 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   | 537 +++++++++------------
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.h   |  29 +-
 3 files changed, 253 insertions(+), 319 deletions(-)
---
base-commit: bb1b0acdcd66e0d8eedee3570d249e076b89ab32
change-id: 20240822-mdp3-comp-cleanups-fb8c431c5462

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


