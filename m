Return-Path: <linux-media+bounces-18228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E96A977174
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 21:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F3D8B21BD4
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 19:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541591BC09F;
	Thu, 12 Sep 2024 19:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="EFLZWG46"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D4F4AEF4
	for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 19:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726169455; cv=none; b=a8CpIP2DIweReQfA9bDnvaa+FCieFmPrUmPn8Aul1bCj5YV6q9/HVOkQeNpwCRNTB82ifMTzpxk3kmeuDWh9zcNraCqcJ7RtfsNKJ4C8oQ2vLAmzh5SGXb19Olcg9SCzHn6kF4+7zjSomvOy8Iqp0pgBoPoSLk9sfaE539t2Rv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726169455; c=relaxed/simple;
	bh=JUirZW1Ci1XBAwNTttY62Bf1OfJpXmW+qorQ0TJYuoY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jh2AP4ek+08siIfyLKA0PtBSGHGoqImM3RO7SpNnTaml9cQHe2923nU5PKARIL+1gqDY8RkxIx2DpN3FkKoVjW2tgXStsNOgEMq8RzNizi4b7q/J1YNsnr0cMoR88fhQSgPiYHrPFFkQm5jgyPccN5ty2H5/tL6BBr5q/AXC9bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=EFLZWG46; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=H9MSZwD75seWuTcpIk4cLIZInbSf1bXzpt6wRs0/01Q=; b=EFLZWG46fG0Pc7hlSd3nDfH9IE
	IToNxBnqsY+W++2wKkwUeIujD7+MMTotE1HIoYWpaT4KO+1gxHpaJA6U2DN3hzrWeVoN7JoWs9cNL
	ZOb03OmjFT9yT4kmjEB2m3syOfGtnx/Kay8oeKJ9f50nQDw7q9f+C8+OTppFJ1jj91wIrHqmXupPz
	lGqR2Yu671UdmOpaXHye6eL4OekfiykWYsXgNBy5dqwFWKRGpAfoRl3JgclPRhyyUgJlcc3+J/2vG
	K7syalzqqJNPMBwxoFMVzT2w6KHdAFZ/UAxXm2Qn3X4nx5ruXJtqFipvePh5ltA5AgpQWABZy3eTA
	+ZMWb6Yw==;
Received: from 179-125-71-245-dinamico.pombonet.net.br ([179.125.71.245] helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1soouz-00CyKn-Ll; Thu, 12 Sep 2024 20:51:50 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	kernel-dev@igalia.com,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH v2 0/1] uvcvideo: require spec compliance to avoid bugs
Date: Thu, 12 Sep 2024 15:51:32 -0300
Message-Id: <20240912185133.1181322-1-cascardo@igalia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some syzkaller reproducers have triggered cases where the devices would not
comply with the UVC specification and warnings would result.

These cases can be simply fixed by preventing the allocation of entities
with duplicate IDs or zero IDs.

v2:
Squash the two commits into one.
Version 1.1 of the spec already mentioned the restrictions on section 3.7.2.
Renamed uvc_alloc_entity to uvc_alloc_new_entity.
Print error message.
Return PTR_ERR values.
Fix checkpatch warnings.

I used section 3.7.2 excerpt from the spec as it is not specific to Output
units/terminals and it also mentions that zero IDs are undefined.

Thadeu Lima de Souza Cascardo (1):
  media: uvcvideo: require entities to have a unique ID

 drivers/media/usb/uvc/uvc_driver.c | 70 ++++++++++++++++++------------
 1 file changed, 43 insertions(+), 27 deletions(-)

-- 
2.34.1


