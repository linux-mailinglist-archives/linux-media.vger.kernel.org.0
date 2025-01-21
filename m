Return-Path: <linux-media+bounces-25034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CDEA17B7C
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 11:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB33A1880A46
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 10:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410EA139B;
	Tue, 21 Jan 2025 10:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="pXCAOiea"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C951DEFF8;
	Tue, 21 Jan 2025 10:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455042; cv=none; b=BWrgH3PRTuyFAGRgxtEYeJawhaOjuABI57tfPZizGw3qD2kdmEek2q4djISAhjG4TzsK8slRWzxY2miCYdvjedROZpVKBrSuV6v5IDXIsCVVlyJxnbuV28Tt8PpkNW5/G6VY4ehkAPOOF53b2jtJS7kZhmKI8Td/hccgcmkFmvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455042; c=relaxed/simple;
	bh=hN3rTJEFhKdRfeiPUEQLnJzrJ9MKolZOdZwac++dtXg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pqL+1TkVsl6DOHImh4hjUDjVzQ2qfQzsN5hNxDL/i4eaBOEbHPQJUfIVGNS8bIzs3qsmF36tHZFKI2c58Ui+XGIxJ6UAvmy3Jy2jGSRUsGC8G+rMODHYw76+H2jT5RbNjPuR5p4Ul55nLI6N+co9IWH0WVao21cWqxVFpXVpmig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=pXCAOiea; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nQ2P952gL4+44rw5i/gRze994LEs23e4tW4INW+CiBY=; b=pXCAOieaFadlO4IAL+2Z8bpGWK
	r/dQ6velgJa4vPUGfn57ssQj5Q+nPWnk9F7z62LSRrdt+P+QgsYx49rIn2FR9POP6Nv0wK4KomRLE
	txHuGemOMfYxJAaFoVVc1TG6UFwLL5Ak2MV2hh+V7zrOapFp4qVLIwbOmkU/4SOqFa5A=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:54171 helo=localhost.localdomain)
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1taB0R-00CGNm-5g; Tue, 21 Jan 2025 10:57:11 +0100
From: Matthias Fend <matthias.fend@emfend.at>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: m.felsch@pengutronix.de,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 0/1] media: tc358746: fix locking issue
Date: Tue, 21 Jan 2025 10:56:54 +0100
Message-Id: <20250121095656.257786-1-matthias.fend@emfend.at>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi folks,

some time ago I asked for advice on a deadlock in tc358746_link_validate()
of the TC358746 driver [1].
Since there was no feedback on this, I have now changed the behavior to
what I suggested as a potential solution and what I know from other
drivers.
This patch is based on Sakari's v10 series 'Use V4L2 mbus config for
conveying link frequency' [2].

~Matthias

[1] https://lore.kernel.org/all/f10b9df7-62c6-4716-a3b9-e4dff1ee68b9@emfend.at/T/
[2] https://lore.kernel.org/all/20250120110157.152732-5-sakari.ailus@linux.intel.com/T/

Matthias Fend (1):
  media: tc358746: fix locking issue

 drivers/media/i2c/tc358746.c | 191 +++++++++++++++++------------------
 1 file changed, 90 insertions(+), 101 deletions(-)

-- 
2.34.1


