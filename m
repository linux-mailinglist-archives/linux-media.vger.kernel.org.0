Return-Path: <linux-media+bounces-45130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D43FBF7162
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 16:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 50FF34FBEB1
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 14:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6833B337B8C;
	Tue, 21 Oct 2025 14:31:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442361A0BF3;
	Tue, 21 Oct 2025 14:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761057098; cv=none; b=oYlFKhSVHAWUkgC8RE8IKG5ptPuTBSb9CPFCwMq+X7Z2XvT17+5pYmpP4wLhCoY5iwWBTVXlAGU46xCXUp+QU3EZ30ikPLwfxPcUw/4yEt6S7vBZUFojktYv2ITfmXPCNCBbfBjBGTkWItFiIQSo7AReF+1sT49r+kzWe2ZfRkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761057098; c=relaxed/simple;
	bh=6arZ3b4z7epl8WoYGnD2fZzhOv553Mma6mxwkUVYslM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ICMCruiRptsJdpvf8EHhuMW7FAyAPa3LOrj/bVKMJtuxdFTNqraITV6o+PUWfz3JZK46hVPBnWf4+VWUKeOmxIh81YmHzP72nNkv4QvNevVbqv6mng31wvusw3SyqbfTD26cHl3zy361HGghr+/U6N9N3L+nNB0YhgEGE1qSeIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a05d8448ae8a11f0a38c85956e01ac42-20251021
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:c1ba92de-9844-4f13-813f-888319a3d223,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:c0be7328241b23f8edf2f99dd47419ce,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a05d8448ae8a11f0a38c85956e01ac42-20251021
X-User: tanze@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <tanze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 787104212; Tue, 21 Oct 2025 22:31:26 +0800
From: tanze <tanze@kylinos.cn>
To: mchehab@kernel.org,
	mingo@kernel.org,
	hverkuil@kernel.org,
	tskd08@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tanze <tanze@kylinos.cn>
Subject: [PATCH 0/3] media: Optimize the code using vmalloc_array
Date: Tue, 21 Oct 2025 22:31:19 +0800
Message-Id: <20251021143122.268730-1-tanze@kylinos.cn>
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


