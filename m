Return-Path: <linux-media+bounces-14334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBD091BE95
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 14:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C268B22C0E
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 12:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A421158858;
	Fri, 28 Jun 2024 12:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TD6S8m/7"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE621E898;
	Fri, 28 Jun 2024 12:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719577796; cv=none; b=n5wDqA+UJNU0TYQvZq7R+6jicE/iG5tP/dscIyXniCXJ7ANXO05JqQgVBdNDm6ZEkd0O+rq84h7KJNXIrzFCpm0f+ZK3U3zmgiC/nWks9/pHSAP/Esdkdttivu8eLD+JIgvyqT8x+41djecJlzymLaGFQYhOlTz0HHIJSyNxTdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719577796; c=relaxed/simple;
	bh=rq+CB3fFlZBvv7BCrp1A1UAxIDsR9Q3w5bWH0xgRzjY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=slGB4UzgQnPgH4KUIfq2fY86sk1NrgyMfDI3N5bJGH1pQkJKD1g2wh6+0tB2G2w/ukG/REjKFmGYsS1Al+P9GL6SjbG/3zCbSJt54OkvXYzV8cWRgq19uDBslokQYrROBNqOubLrWDtHruq2IhMp4B2fZZ0IOkcFl5boJjveIrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TD6S8m/7; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719577793;
	bh=rq+CB3fFlZBvv7BCrp1A1UAxIDsR9Q3w5bWH0xgRzjY=;
	h=From:Subject:Date:To:Cc:From;
	b=TD6S8m/7XvXf1Kf7RPS16n7gKSdYtH38TiKRX/MuVxuExkrcWlF4XwYHunK+w401z
	 wqIJ4Y1LsnlJckvyn1GtwjW+AhUtgwNRfThcL6N0Ft50eCDpLPhf2hji7nf+j9Iqqr
	 pRQb1xz1o/v4A4Ed05bPGTTGGdX562G8zC2xpndETp96s/WWGbTsWF7mx3FrL06es2
	 X74ibF3BEpntH8JmDcDZ0JjtbzdJ4dRwxylu/LFUKzN/VeAABFpDzf1qzm3d0KmIlv
	 zGABAzgPLn0bgej+xzyi5RQYbnn+Xc6DmM4RcZOiJn493ajKraueJQNY4b+uus7YYq
	 HjFzUEdKfPtxA==
Received: from fedora.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 37CF237821F9;
	Fri, 28 Jun 2024 12:29:53 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/2] MAX96714/7 style fixup
Date: Fri, 28 Jun 2024 14:29:26 +0200
Message-Id: <20240628-gmsl2-drivers-style-fixup-v1-0-a4bb49f4c7a1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKasfmYC/y2NSw6DMAxEr4K8rlEIf1a9R8UigEstEaAxoFaIu
 zeCLt+MZt4OQo5JoAp2cLSx8DR6iG4BtC8z9oTceQatdKIyXWBvZdDYOd7ICcryHQif/FlnLJo
 8STOdx01cgt/Pjnxxfj/qix29V69YrhAsiZhTUQV/QR6lUaGyMC7LMlEKNS6TtaEl17Lhe28ND
 2E7WaiP4we0DWAvvQAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Julien Massot <julien.massot@collabora.com>, 
 20240627151806.3999400-2-tomm.merciai@gmail.com
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719577793; l=761;
 i=julien.massot@collabora.com; s=20240628; h=from:subject:message-id;
 bh=rq+CB3fFlZBvv7BCrp1A1UAxIDsR9Q3w5bWH0xgRzjY=;
 b=ab2ZKdG6zNnzWvWwgXA6VC9xUVxsqbUi8chK4piANFfhza4D6lDLh74Lld/w0nujAi5x0jGUw
 J1tFJXUTeMRCw4QYAey9rYGM2ldp4zV6tW5q51IoULE4j9Krr5tgsGk
X-Developer-Key: i=julien.massot@collabora.com; a=ed25519;
 pk=upOGEnAvrsJB2Icg0lU3KQah5azRr6NNj9LMEeI1c88=

There was still some open comments from Sakari that haven't been
addressed.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Julien Massot (2):
      media: i2c: max96717: coding style fixes
      media: i2c: max96714: coding style fixes

 drivers/media/i2c/max96714.c | 14 +++++++-------
 drivers/media/i2c/max96717.c | 31 ++++++++++++-------------------
 2 files changed, 19 insertions(+), 26 deletions(-)
---
base-commit: aac87ca083749ad835878df10915d8569c9fb34a
change-id: 20240628-gmsl2-drivers-style-fixup-8b7456273b39
prerequisite-message-id: 20240627151806.3999400-2-tomm.merciai@gmail.com
prerequisite-patch-id: 962642e5bbea7583a1b4f6eb0a962e60ef9ffba3

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


