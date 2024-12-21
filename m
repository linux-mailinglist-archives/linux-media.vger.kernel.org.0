Return-Path: <linux-media+bounces-23965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 391AB9F9DD4
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 02:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9537E188B7AB
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 01:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E994B5A7AA;
	Sat, 21 Dec 2024 01:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eurecom.fr header.i=@eurecom.fr header.b="YHaGbPs3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B409B259484;
	Sat, 21 Dec 2024 01:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.55.113.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734745817; cv=none; b=SeHBdaXrQeUvMTO5L4WF07GDcvKSBVQJ9M6VLUjh+aHGB2cHcRjUkE/CqRxEpimpjeWlmSRu0sKle24nW9MxJ0hI2h8JgPyt/6IhCYREO2xymmZ3FL+Glx9GYwABE7Txspf4SYXM3olHpGoC4kjl9ftivMwOxBBqtolt8DeV8+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734745817; c=relaxed/simple;
	bh=BtdQXUPBKbErSA7p6yJb3vGSu7+1+KapIIWxp1mxHmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CaZuJPN/sgwYsZYvmtK/Yyq6IHA9JdHrBruRsTzrLX6m3NWp0vKOD9LGGqkugpBZVM4TgumHcKL7wSfJqBralVM5gQRTKb4KLucEwVh3frR7azsin13ytFToFnSamhd1WJx4lbBr2pdq0dJSJAKaF+iJ+mDnUmqJ5RcKgZfLihw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eurecom.fr; spf=pass smtp.mailfrom=eurecom.fr; dkim=pass (1024-bit key) header.d=eurecom.fr header.i=@eurecom.fr header.b=YHaGbPs3; arc=none smtp.client-ip=193.55.113.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eurecom.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eurecom.fr
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734745813; x=1766281813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BtdQXUPBKbErSA7p6yJb3vGSu7+1+KapIIWxp1mxHmQ=;
  b=YHaGbPs3r8/QDsjf8gUebsAfFa5Axvv1cxKFV6R7tFKT14OUlNkqQ+Uv
   hLD6dS6F4QLRDj6FaL0BJmhmL68liCZJJjXTd+b4Vu3O/0RwEr7WtCHRp
   8DcXh9Lmeu8opzOQXN1YLACyPpYbK3Q86m7NJe8/dUpCi307XviCDnjhF
   U=;
X-CSE-ConnectionGUID: ZvTpiYOjT8GVNG4Oznkw1A==
X-CSE-MsgGUID: ++AI8z+xTuyZ6U+yQDcPgA==
X-IronPort-AV: E=Sophos;i="6.12,252,1728943200"; 
   d="scan'208";a="28282601"
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
  by drago1i.eurecom.fr with ESMTP; 21 Dec 2024 02:50:10 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net [88.183.119.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtps.eurecom.fr (Postfix) with ESMTPSA id D395024C7;
	Sat, 21 Dec 2024 02:50:09 +0100 (CET)
From: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
Subject: [PATCH v2 0/1] saa7164: Remove unused values
Date: Sat, 21 Dec 2024 02:46:49 +0100
Message-ID: <20241221014951.1003440-1-ariel.otilibili-anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220192735.957042-1-ariel.otilibili-anieli@eurecom.fr>
References: <20241220192735.957042-1-ariel.otilibili-anieli@eurecom.fr>
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
--
v2:
* fixed CI warnings: removed Cc & Fixes in commit
* see, https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/68535079/artifacts/report.htm

Ariel Otilibili (1):
  saa7164: Remove unused values

 drivers/media/pci/saa7164/saa7164-vbi.c | 2 --
 1 file changed, 2 deletions(-)

-- 
2.47.1


