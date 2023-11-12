Return-Path: <linux-media+bounces-157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3D17E907E
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 14:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70E2B1C209C4
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 13:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4202E14294;
	Sun, 12 Nov 2023 13:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeOWPc1N"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFD512B7E
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 13:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F1AC433AB;
	Sun, 12 Nov 2023 13:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795767;
	bh=zpefhsIhEu/dJOT1Eh1xs+buT9hmTS9Rb24DO8b8+jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JeOWPc1N85ynevhW3/9KLsxPZ/ALEx/oYABqcxrzsOF2SeIubXvo7Ay5zDkaKlZ7M
	 1E4IMnFctNrn0UEHAudAlbyABOOONAGcxq93jw59Q/b8tsaxHtetmIrQxD4K9yuSDK
	 PStg234msGFKUrrGgAYSovb6YGrZXxigb8qsF9bfgyPhodxFG8a3dso4cyEckC2M4E
	 W7XmKuciafYjbWxuC3ij7wmYURHvDvDYKjx3UXxCh2cA2kVpXBAiqAPZSle6gJ9zTF
	 NuNA84/N0LbELWaVIrPk5ZpWZbvYu7VibVVivnmT+ZesArQUnkoeUYmdny+zWEOi6v
	 FayvdOTVRy2nA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Arnd Bergmann <arnd@arndb.de>,
	Sasha Levin <sashal@kernel.org>,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 2/4] media: vivid: avoid integer overflow
Date: Sun, 12 Nov 2023 08:29:20 -0500
Message-ID: <20231112132923.176955-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112132923.176955-1-sashal@kernel.org>
References: <20231112132923.176955-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.14.329
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
index 53c7777dc0019..d2b014336f9c4 100644
--- a/drivers/media/platform/vivid/vivid-rds-gen.c
+++ b/drivers/media/platform/vivid/vivid-rds-gen.c
@@ -157,7 +157,7 @@ void vivid_rds_gen_fill(struct vivid_rds_gen *rds, unsigned freq,
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


