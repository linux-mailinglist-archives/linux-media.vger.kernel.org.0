Return-Path: <linux-media+bounces-26577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1725A3F3FB
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 13:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34402189FE4A
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 12:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB96920B21F;
	Fri, 21 Feb 2025 12:16:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79C1155336;
	Fri, 21 Feb 2025 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740140211; cv=none; b=J5asLmKNj7aGbS+nVsMtnyh//S55Xpq9/lLIIGIH7nNu2qi/GFXVG4grR7FhdtF1tXjEG2MRZ9x5vQxG9rn3TlUrYVUd+fX12V+kpK6fn5YodCZBZKENp6IUPLO/aCyfd8pG0jkAVGLUqzLuMZvDQ/qoIT971k4EtXd+hnWqtC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740140211; c=relaxed/simple;
	bh=xmD6NKAGm9Q5uQLNboQykz4kAobFmsUomdqLzIfO8kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HOTUGQ9eRaDItV/GCCS1Yg4sF6RBOSuJkpCGd9lrik57qTFCiDSFzliuBLz2qRd7ciEuXolhc8OmRKU364s179ulmX9rmSZiW3pCc/J59E9tyQxFGEE7eHhjGRznpY9BgjYfu6XJSWyeUv6VH5SaQi0977PP/TL+jwzFCPwALxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id E7C6A3142D;
	Fri, 21 Feb 2025 13:07:49 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 2/2] media: mgb4: Fix switched CMT frequency range "magic values" sets
Date: Fri, 21 Feb 2025 13:07:43 +0100
Message-ID: <20250221120743.1703-3-tumic@gpxsee.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221120743.1703-1-tumic@gpxsee.org>
References: <20250221120743.1703-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

The reason why this passed unnoticed is that most infotainment systems
use frequencies near enough the middle (50MHz) where both sets work.

Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 driver")
Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_cmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/mgb4/mgb4_cmt.c b/drivers/media/pci/mgb4/mgb4_cmt.c
index bee4bdf54d1c..c22ef51436ed 100644
--- a/drivers/media/pci/mgb4/mgb4_cmt.c
+++ b/drivers/media/pci/mgb4/mgb4_cmt.c
@@ -135,8 +135,8 @@ static const u16 cmt_vals_out[][15] = {
 };
 
 static const u16 cmt_vals_in[][13] = {
-	{0x1082, 0x0000, 0x5104, 0x0000, 0x11C7, 0x0000, 0x1041, 0x02BC, 0x7C01, 0xFFE9, 0x9900, 0x9908, 0x8100},
 	{0x1104, 0x0000, 0x9208, 0x0000, 0x138E, 0x0000, 0x1041, 0x015E, 0x7C01, 0xFFE9, 0x0100, 0x0908, 0x1000},
+	{0x1082, 0x0000, 0x5104, 0x0000, 0x11C7, 0x0000, 0x1041, 0x02BC, 0x7C01, 0xFFE9, 0x9900, 0x9908, 0x8100},
 };
 
 static const u32 cmt_addrs_out[][15] = {
-- 
2.48.1


