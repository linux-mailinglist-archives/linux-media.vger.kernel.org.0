Return-Path: <linux-media+bounces-44467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D15BDAD1B
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E832C4E7004
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D685F3093DF;
	Tue, 14 Oct 2025 17:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWfXk4XX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3068A3043A5
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463674; cv=none; b=Pd3FS8brBNNKemPqezhrEpU6mybS+e8+R719fLCgaFvhnU3pGf4rTb+PYaUMvrA6u2gmgvqT3xYsosvBaMBfl3XMn/0sT2IckJqz9UThVplmcO3AYaDPNofzTCy2NrEvqTNgWEO9XDXJG3C2NSofnOHKiS+ms4KGfaKA/zADg0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463674; c=relaxed/simple;
	bh=SxaeVei2hdRAC+SR3Q8zZr8g+IGizff1Mt9cqOR6Qzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ukcxaN7elYbNVkQ0Czx7F1EIowlZcnMhg2l2oHX0WrclvcS23gAP49xXpoidUYXQb94UESEf2iYZNSw65IXS46NndhoAAkQ0KMEoceTj3yXC1M+q6LxcpGHOm2YGa2b4W6o/ku8Mmfn7wuNEhPnc7Mb6/5/uLnipikPq9xqPvKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWfXk4XX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655F9C4CEF9;
	Tue, 14 Oct 2025 17:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463673;
	bh=SxaeVei2hdRAC+SR3Q8zZr8g+IGizff1Mt9cqOR6Qzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWfXk4XX0j6Q3rtnGG7MDahH9JI6FhlDWztYDxfZlzPhlGPAcg50l3KUMtcDRALaM
	 MLItUxo8rLKSrdYv5SaYq1/+1qAmBbvuYfEXI4dO71P32/8gW9JekPAK5xvRKM5LIz
	 PIVNJeUvlk5/dtD1+Hs6+MLFsbUhueVKxEEmKzdlidN1F6zji0OWIaiLOEYe7WHycv
	 m9D37I+LDfeeAgPKpHPr44M7Hobhyt2hz+EYLTtREJy/1ooJuU0tTLFH7dz3BqYI82
	 OLMyxjjcXXbOq0iyalVi/lNo0AohoWnSt6zRTOHcujnqpPY3uqNbDveXXCzZJl1H7r
	 PPtktesFXnOWA==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 20/25] media: i2c: ov01a10: Remove values set by controls from global_setting[]
Date: Tue, 14 Oct 2025 19:40:28 +0200
Message-ID: <20251014174033.20534-21-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Registers 0x3501 (exposure), 0x3508 (analogue-gain) and 0x4503 (test-
pattern) are already set through __v4l2_ctrl_handler_setup() drop them
from ov01a10_global_setting[].

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 77c82201815b..17d8778561d4 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -123,11 +123,7 @@ static const struct reg_sequence ov01a10_global_setting[] = {
 	{0x3002, 0xa1},
 	{0x301e, 0xf0},
 	{0x3022, 0x01},
-	{0x3501, 0x03},
-	{0x3502, 0x78},
 	{0x3504, 0x0c},
-	{0x3508, 0x01},
-	{0x3509, 0x00},
 	{0x3601, 0xc0},
 	{0x3603, 0x71},
 	{0x3610, 0x68},
@@ -197,7 +193,6 @@ static const struct reg_sequence ov01a10_global_setting[] = {
 	{0x4300, 0xff},
 	{0x4301, 0x00},
 	{0x4302, 0x0f},
-	{0x4503, 0x00},
 	{0x4601, 0x50},
 	{0x4800, 0x64},
 	{0x481f, 0x34},
-- 
2.51.0


