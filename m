Return-Path: <linux-media+bounces-49968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B1CF73F1
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 09:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBBE130D4A3B
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 08:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F211309F1C;
	Tue,  6 Jan 2026 08:12:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798DB309DDB;
	Tue,  6 Jan 2026 08:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767687125; cv=none; b=B3mO/ToDDkmityjNRF1ssFMJrO0pvQsn6ZjitV3lI1CmQtUzWWaEjbZal/aZHtPUJMNvHB/staknNW0xlx5iJaodc6qP+DrofKggGANNjJZi2TU7E3685Ya13M1lmCN6dWr+PQ3KcoRrVqC9M2Ylj/+Xge2O0GQxJeUQCyTYaKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767687125; c=relaxed/simple;
	bh=JuNuDBhL7/IDUPgaL8v9dCU9XQO4PwPYzDaLxgXk8Uw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jG7TsR7KtzAgfw8wyc+VsP43KtE7w/+U2ebtGGYGiiiuO4SqoCbXZ8mdkFI0KEMMoS2t7ffoNpX7dXmq4Vqtf21TiBTYMzNweD/ktl2sqBN03eio/Jg/EX2cU2q6ATwrxKZZhrKCicHLEVOFeXGLadh/AJTxT+I0+Cnx+t45DLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5961022aead711f0a38c85956e01ac42-20260106
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:3c7ec42a-db62-4f28-97d7-2c8a90912194,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:02b9d54f5d5d5b7c8b91eea5f4419164,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|817|850|898,TC:nil,Conte
	nt:-10|-8|-5|14|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC
	:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5961022aead711f0a38c85956e01ac42-20260106
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 283087918; Tue, 06 Jan 2026 16:11:48 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: laurent.pinchart@ideasonboard.com
Cc: chenchangcheng@kylinos.cn,
	hansg@kernel.org,
	krzk@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: Use scope-based cleanup helper
Date: Tue,  6 Jan 2026 16:11:46 +0800
Message-Id: <20260106081146.123729-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260106035159.GA11450@pendragon.ideasonboard.com>
References: <20260106035159.GA11450@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > > This is an undesired syntax explicitly documented as one to avoid. You
> > > need here proper assignment, not NULL. Please don't use cleanup.h if you
> > > do not intend to follow it because it does not make the code simpler.
> >
> > Thank you for your correction and feedback. I made the change initially
> > because I saw similar patterns using "__free(...) = NULL" in patches from
> > other driver modules, which led me to overlook the core paradigm of
> > cleanup.h that requires a "declaration with a meaningful initializer."

> Do you plan to send a v3 ?

No, I don't plan to send a v3. Thank you.

Best regards,
Changcheng Chen

