Return-Path: <linux-media+bounces-23961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0130F9F9A75
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 20:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56A41164CA3
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 19:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8195D221453;
	Fri, 20 Dec 2024 19:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eurecom.fr header.i=@eurecom.fr header.b="aNQSsiUJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254E5220686;
	Fri, 20 Dec 2024 19:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.55.113.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722884; cv=none; b=KIvpl4ZnOG9d1j6aT57FpL0WXbcMWNJRx0WZQKVKPw7qFAEXc3P2lGs6IxeSnOPPCEzuWX0cZdhJv4THL9vLPBC7688T1B6M4n5T3ZLIizLhowvXfJMsMdmC1p61Xhc1FY6siDrNK28whPl4LHo3/iTEqgLfijvsj2rfJb9/4IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722884; c=relaxed/simple;
	bh=tfiHTMFmWTiqb3a/EnWZUWZ6rmMxKVZwy6fq12BjHWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qu12wu9KkzcBLwOQGmQ0OaAu2diExUJpRX31jPC5AhJ/i9mmxfjQcEMSRaChVzX40lFPGwRz95IOeTMLyPhEtzLpz7aiDEmmaj9eLK61+L0cSQ3O0etbHlIm7ugDTlFUFk79etJDxNlqiSyWQxqrRtuB/j3lNu27gqOVJEZu/l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eurecom.fr; spf=pass smtp.mailfrom=eurecom.fr; dkim=pass (1024-bit key) header.d=eurecom.fr header.i=@eurecom.fr header.b=aNQSsiUJ; arc=none smtp.client-ip=193.55.113.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eurecom.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eurecom.fr
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734722881; x=1766258881;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tfiHTMFmWTiqb3a/EnWZUWZ6rmMxKVZwy6fq12BjHWg=;
  b=aNQSsiUJHzBF4qex4W2fLpv77QesDzlU7UWXyWiCI26669/uGZaukG4B
   RGSRRRS7GUXynZvIFoprixyKZR0eQYeMJhWTXlPr7dShOkJFuxj/4yLkd
   Rz6C5s+h4fK81uTC1pOoWF0F8AaRnvUtL1JsRp7sFicGlQwyBJLbWTBDQ
   s=;
X-CSE-ConnectionGUID: DuwpNWvbRYCN2dXhTGN/sQ==
X-CSE-MsgGUID: 9TtgZQE5TryWLmfVzoQ80w==
X-IronPort-AV: E=Sophos;i="6.12,251,1728943200"; 
   d="scan'208";a="28281144"
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
  by drago1i.eurecom.fr with ESMTP; 20 Dec 2024 20:27:58 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net [88.183.119.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtps.eurecom.fr (Postfix) with ESMTPSA id 746BB24B0;
	Fri, 20 Dec 2024 20:27:58 +0100 (CET)
From: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 0/1] saa7164: Remove unused values
Date: Fri, 20 Dec 2024 20:26:30 +0100
Message-ID: <20241220192735.957042-1-ariel.otilibili-anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch clears out the Coverity IDs 1269155 & 1269156.

Thank you,

Ariel Otilibili (1):
  saa7164: Remove unused values

 drivers/media/pci/saa7164/saa7164-vbi.c | 2 --
 1 file changed, 2 deletions(-)

-- 
2.47.1


