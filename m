Return-Path: <linux-media+bounces-152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAFD7E9075
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 14:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 102071F20FF1
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 13:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEAEB14293;
	Sun, 12 Nov 2023 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u31pITTA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0C711C89
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 13:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F24C433CB;
	Sun, 12 Nov 2023 13:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795746;
	bh=w34l9Vr77cENT1HYtdSXKDNRbqLK5wMFGaCATdauCJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u31pITTAruRcR5PgIsg+Jr5LxEEn4iR5yn/hDef8401tRR02tQAdQiLmt1DpOgQwV
	 BFjbXe3+HZVFVldejtUwETkiTphmwoZZJTJfjb8QsY83bvyxL0G6KvifZPjZgPZ0ju
	 MijyjfFVVEzeKDW0I3/sO5j3z/BBYDbYCGXFgTQlevkLa4/x7CLMfBOyfDgKh0JZDh
	 M0AEDrvEQ87il4GdjnPQKYCLpTPw5y3FvheHuk/kZrzAtntjMEUL2bF2HAc4cV3Ez4
	 ruKFclYhnlZQ8PrBQujefUjIZavGpGYI+Ut9WiU/9KLYtQFGQPxdDkCI8YxFEYf2MI
	 hSKWIXowJJFaA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Arnd Bergmann <arnd@arndb.de>,
	Sasha Levin <sashal@kernel.org>,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 2/6] media: vivid: avoid integer overflow
Date: Sun, 12 Nov 2023 08:28:56 -0500
Message-ID: <20231112132902.176672-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112132902.176672-1-sashal@kernel.org>
References: <20231112132902.176672-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.260
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

[ Upstream commit 4567ebf8e8f9546b373e78e3b7d584cc30b62028 ]

Fixes these compiler warnings:

drivers/media/test-drivers/vivid/vivid-rds-gen.c: In function 'vivid_rds_gen_fill':
drivers/media/test-drivers/vivid/vivid-rds-gen.c:147:56: warning: '.' directive output may be truncated writing 1 byte into a region of size between 0 and 3 [-Wformat-truncation=]
  147 |         snprintf(rds->psname, sizeof(rds->psname), "%6d.%1d",
      |                                                        ^
drivers/media/test-drivers/vivid/vivid-rds-gen.c:147:52: note: directive argument in the range [0, 9]
  147 |         snprintf(rds->psname, sizeof(rds->psname), "%6d.%1d",
      |                                                    ^~~~~~~~~
drivers/media/test-drivers/vivid/vivid-rds-gen.c:147:9: note: 'snprintf' output between 9 and 12 bytes into a destination of size 9
  147 |         snprintf(rds->psname, sizeof(rds->psname), "%6d.%1d",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  148 |                  freq / 16, ((freq & 0xf) * 10) / 16);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/vivid/vivid-rds-gen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/vivid/vivid-rds-gen.c b/drivers/media/platform/vivid/vivid-rds-gen.c
index b5b104ee64c99..c57771119a34b 100644
--- a/drivers/media/platform/vivid/vivid-rds-gen.c
+++ b/drivers/media/platform/vivid/vivid-rds-gen.c
@@ -145,7 +145,7 @@ void vivid_rds_gen_fill(struct vivid_rds_gen *rds, unsigned freq,
 	rds->ta = alt;
 	rds->ms = true;
 	snprintf(rds->psname, sizeof(rds->psname), "%6d.%1d",
-		 freq / 16, ((freq & 0xf) * 10) / 16);
+		 (freq / 16) % 1000000, (((freq & 0xf) * 10) / 16) % 10);
 	if (alt)
 		strscpy(rds->radiotext,
 			" The Radio Data System can switch between different Radio Texts ",
-- 
2.42.0


