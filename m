Return-Path: <linux-media+bounces-14459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2AB91DB77
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 11:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3210F1F2303B
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 09:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6566582899;
	Mon,  1 Jul 2024 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SGoc53oL"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E450524C9;
	Mon,  1 Jul 2024 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719826332; cv=none; b=OLqNr1Ag/yKXM2z52c7+SL4e1RnC+C85yI8pWJg0KV0LazyUvGTm4i0nZF20WGZhdT6pjBETszmaPc4oQPgugcK4l8izrOYpb5yrhSRGue9i3fbQ1fGhJxea1zVZal5vGttaGRgWjKWAS9VExBnmeiiFlfAfm/sNSli1pvoZP7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719826332; c=relaxed/simple;
	bh=/NG60rOdIbiOJj35xIghT09hHRzlYMNfztQi73HnlCc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nauCc4j3nxjMMYlx3xRQjszeRFp+D+Uqoun1HS4cEqW6FyUeQLEmpX4w48EW7bsC17wtpptkNYlfllfJyUKH2FZAj4XaCl55KC1kfDkOLnjzp2KxdSjzrdHkm3cy42Sst4p6vNl1mCSHK5dlOHuVrZJuUdQGe8xcLsPrtu4v3AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SGoc53oL; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719826329;
	bh=/NG60rOdIbiOJj35xIghT09hHRzlYMNfztQi73HnlCc=;
	h=From:Subject:Date:To:Cc:From;
	b=SGoc53oLRENuhZppA8qnZWcLkKgw9FIdvDzdU86IUfk3HfE8Z7PIUmPOHDyXaakT4
	 DFgbGO3vimhIeqwT6kUP1QKw3K8QxY4ZR/2Y9BMBfOdDnqWN/ujE6kLCoIdZkGidos
	 XridcfelQKzq3YF+6gyR7Ac30zPbe03vCoKuK3bV4SjzaIhkmzDt6HkrAEx3B9kcF4
	 U4gri+9CX+e5HvBZllyLi8XqKx9lztMnmZEhKdbp2RVXmJKodJetlqV8IX9qPv00em
	 KVi5SE0D/EsLLy8/oxjlz0Nq3S7MOVYEjJnSh4lut3t4mdaCCgHIHnNmL5OcedXNBE
	 LqDY/nYcVJKwA==
Received: from fedora.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 54CA037804B2;
	Mon,  1 Jul 2024 09:32:09 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 0/2] MAX96714/7 style fixup
Date: Mon, 01 Jul 2024 11:31:41 +0200
Message-Id: <20240701-gmsl2-drivers-style-fixup-v2-0-6b02bd6c1e41@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH13gmYC/42OQY7CMAxFr4KyxlWShrZhxT3QLJJgiqWEgFOqQ
 ah3n0x7AZbf1n/vf0RBJiziuPsIxpkK5XsNer8T4ebuIwJdahZaaiM7PcCYStRwYZqRC5TpHRG
 u9Pt6wOB7c+h03/rWitp/MNbHyj7/bJnx+aqKaTuKhKW4VVGNm6BXBzXIrmmttUZK0DDllJqEH
 MjRaUyOYhNyEv/EG5Up83sdP6sV+cXOWYEEZ7w39mpC79Qp5Bidz+w28rIsf0/SHnsYAQAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Julien Massot <julien.massot@collabora.com>, 
 20240627151806.3999400-2-tomm.merciai@gmail.com
X-Mailer: b4 0.14.0

There was still some open comments from Sakari that haven't been
addressed.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Changes in v2:
- Fix uppercase in register address for max96714 driver as suggested by Tommaso
- Link to v1: https://lore.kernel.org/r/20240628-gmsl2-drivers-style-fixup-v1-0-a4bb49f4c7a1@collabora.com

---
Julien Massot (2):
      media: i2c: max96717: coding style fixes
      media: i2c: max96714: coding style fixes

 drivers/media/i2c/max96714.c | 18 +++++++++---------
 drivers/media/i2c/max96717.c | 31 ++++++++++++-------------------
 2 files changed, 21 insertions(+), 28 deletions(-)
---
base-commit: aac87ca083749ad835878df10915d8569c9fb34a
change-id: 20240628-gmsl2-drivers-style-fixup-8b7456273b39
prerequisite-message-id: 20240627151806.3999400-2-tomm.merciai@gmail.com
prerequisite-patch-id: 962642e5bbea7583a1b4f6eb0a962e60ef9ffba3

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


