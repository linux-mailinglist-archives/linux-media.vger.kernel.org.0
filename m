Return-Path: <linux-media+bounces-155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 865DB7E907C
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 14:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25FAD1F21014
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 13:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CB514286;
	Sun, 12 Nov 2023 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4OQgHqh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F748F72
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 13:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A042EC433C7;
	Sun, 12 Nov 2023 13:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795757;
	bh=Rzp08aZ8nm+7xUJ3NGlETYc2bZ7eb98RZEd1aCaPi/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g4OQgHqhCLftbg9ANWHXRxML6CNObSl5FrN7K1B5M60RmW/xZXKLLzE4e7MBZLW3j
	 iVGIyVeShX0K2TzGn0ejxSX7BaTFDV9t8nuII8zQEHJl+6YEkoxdxEUimcYfG3Et/T
	 6/RDGvghbJ2xxWcfCcrLQ/dYgZvmBC9qu4SJreICQ+NrI22jNlo0vHBXNe9ySASsDy
	 RhjZq+TQ1HUjAysX5KqZnRRDTCV+rh82/bf2NA/uvLDTNE9n0ZqHgKaPQbDUC5nbHg
	 MHiXMKmKwJa9P6d4N0aGTKpPmr2dthJR9Bs3E0Y8uQ3KCm1Q6c+5cr3lPpZqLnhkwW
	 L5/HbALJg/k+A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Arnd Bergmann <arnd@arndb.de>,
	Sasha Levin <sashal@kernel.org>,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 2/5] media: vivid: avoid integer overflow
Date: Sun, 12 Nov 2023 08:29:09 -0500
Message-ID: <20231112132913.176824-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112132913.176824-1-sashal@kernel.org>
References: <20231112132913.176824-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.298
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
index 39ca9a56448c0..9f6009ac5e255 100644
--- a/drivers/media/platform/vivid/vivid-rds-gen.c
+++ b/drivers/media/platform/vivid/vivid-rds-gen.c
@@ -145,7 +145,7 @@ void vivid_rds_gen_fill(struct vivid_rds_gen *rds, unsigned freq,
 	rds->ta = alt;
 	rds->ms = true;
 	snprintf(rds->psname, sizeof(rds->psname), "%6d.%1d",
-		 freq / 16, ((freq & 0xf) * 10) / 16);
+		 (freq / 16) % 1000000, (((freq & 0xf) * 10) / 16) % 10);
 	if (alt)
 		strlcpy(rds->radiotext,
 			" The Radio Data System can switch between different Radio Texts ",
-- 
2.42.0


