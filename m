Return-Path: <linux-media+bounces-45175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93352BF9D12
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 05:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D74434F42E2
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 03:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB102238D52;
	Wed, 22 Oct 2025 03:20:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97C122A817;
	Wed, 22 Oct 2025 03:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103256; cv=none; b=L7y+59HgxEl7Z7WAD6ul6X+S4kTAJtrDRq2AjS+LMlYJPF96iOIFOFis43olTewXog0QeTAg2uo3YiTnqaLue6+qrX4A19X213u2zpOX2YyPwqvPOKXDwkIlh5P4cNN6HJPGLrGh9Nejee0iWnGhHvpoIu0OVj7f+AZrSXAvmLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103256; c=relaxed/simple;
	bh=FPdXW0ghOR4CnNm4XC879LqbgFOVyr7E6xChvWxq2JI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R168rX7zURrySkeS/jgV949xG+egtjNlFDwu5uS1CnBZk1Zw22JIm02lOR+kOYWAwtmUiyg80sFPBN777TrIhaisf09JBC/zTgh+vH3iJ56QtoOT+BF5K1/pM10oh68FEpxpmv66IUcHLYDBnejQjocOf1oGsQUCoEe2V0bd0ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 191cef70aef611f0a38c85956e01ac42-20251022
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:016c4977-7923-4297-b1ef-c0136f3b1293,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:b063af826a2b3763aae4f392c633be88,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 191cef70aef611f0a38c85956e01ac42-20251022
X-User: tanze@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <tanze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 320240730; Wed, 22 Oct 2025 11:20:45 +0800
From: tanze <tanze@kylinos.cn>
To: mchehab@kernel.org,
	mingo@kernel.org,
	hverkuil@kernel.org,
	tskd08@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tanze <tanze@kylinos.cn>
Subject: [PATCH v2 0/3] media: Optimize the code using vmalloc_array
Date: Wed, 22 Oct 2025 11:20:35 +0800
Message-Id: <20251022032038.422230-1-tanze@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change array_size() to vmalloc_array(), Due to vmalloc_array() is optimized better,
uses fewer instructions, and handles overflow more concisely

v1->v2: Update patch #02 #03 due to typos CI robot detected some issues

v1:https://lore.kernel.org/all/20251021143122.268730-1-tanze@kylinos.cn/

tanze (3):
  media: dvb-core: Optimize the code using vmalloc_array
  media: vivid: Optimize the code using vmalloc_array
  media: pt1: Optimize the code using vmalloc_array

 drivers/media/dvb-core/dmxdev.c               | 4 ++--
 drivers/media/dvb-core/dvb_demux.c            | 9 +++++----
 drivers/media/pci/pt1/pt1.c                   | 2 +-
 drivers/media/test-drivers/vivid/vivid-core.c | 2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.25.1


