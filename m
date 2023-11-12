Return-Path: <linux-media+bounces-132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 893267E9042
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 14:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 972C11C209C3
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 13:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C9A125A8;
	Sun, 12 Nov 2023 13:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcD2nm6M"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BEB11721
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 13:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F034CC433CB;
	Sun, 12 Nov 2023 13:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795680;
	bh=wz6u0otCbI9/mTC9pHfUdQXxln4wuyBg9Hk+Z9OYaBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZcD2nm6MDjC9CFxTlHxzDoyUy4/g16VkMtWQYZZ/rbMn8ks/Fl0nTV89tCz1SiXcJ
	 MDQCRmDb7F6axWelivL2hekvn1g4dpu/qiIguZklZRzjpn/dFHtvAPg5LpSgYC9eB8
	 JKJokZHdGa1SDnMa5Lq76fA+VTFi+ROD3anS81Bt9lVZEONSCGQE6ol4jRVh0NE8en
	 we7eeOOs///kOq45h7rdqkee9oN3IS7kpd27HlrDeCzw8wvlzvf7Tq5Ipdkej+6o5o
	 N0P6g65Ykznq8OPJr3SskF8gDBtiybNyc9R8HYeYAqg7t8qafOBNiTWRdiVMQLSbhM
	 s2lNZaya4gUFA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Arnd Bergmann <arnd@arndb.de>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 02/10] media: vivid: avoid integer overflow
Date: Sun, 12 Nov 2023 08:27:45 -0500
Message-ID: <20231112132755.175757-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112132755.175757-1-sashal@kernel.org>
References: <20231112132755.175757-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.11
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
 drivers/media/test-drivers/vivid/vivid-rds-gen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-rds-gen.c b/drivers/media/test-drivers/vivid/vivid-rds-gen.c
index b5b104ee64c99..c57771119a34b 100644
--- a/drivers/media/test-drivers/vivid/vivid-rds-gen.c
+++ b/drivers/media/test-drivers/vivid/vivid-rds-gen.c
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


