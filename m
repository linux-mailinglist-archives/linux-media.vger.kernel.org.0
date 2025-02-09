Return-Path: <linux-media+bounces-25843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6F8A2DA5A
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 03:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 810093A6C71
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 02:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D088F40;
	Sun,  9 Feb 2025 02:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfGVUaSb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB24243397;
	Sun,  9 Feb 2025 02:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739067080; cv=none; b=fXLOWqCRr2Z1isjQ85D/7/MmEn02NIFtGYnQBUVSUDgBs2oItpN+0EnpPVil7wdU5+ZOiJi/ZE7LfccUDQGxknFATMnki0wBTQEvr7Ct+eLjZE40wiYb7uEeVQNiJbYEK+CS09YULiM9Cb489VmIx67fPBcc5JsEqTJ2iRFLjOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739067080; c=relaxed/simple;
	bh=qFK7B8RPzAwL/YK1uWbMTQGDX7kc0N5pqqW9E/GIQFM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I6AyXk9ZY2YSsnODIv9ZRceOQkSOD9IjsHBKzvOBoG7+Dog6oV/ufNJq9IOgJl4py9VWhdVgg8lS8ymK6kiAaAU7JIztvIeRyP35WfxgXuMjn91dnt7q3Ewda21x3vuGIxMlnTuL9ss0IpATl9aHOJOPnPpR4R+VOiEm5xOFTz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfGVUaSb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2782CC4CED6;
	Sun,  9 Feb 2025 02:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739067079;
	bh=qFK7B8RPzAwL/YK1uWbMTQGDX7kc0N5pqqW9E/GIQFM=;
	h=From:To:Cc:Subject:Date:From;
	b=UfGVUaSbzy61F1Nfo0EybrDZkz2Aa+sbXQksZSSK/Ab3V7vnvtc3Mh91xGX06xcuD
	 wRl7wyRGBI0clcSVSxJdl7s1TZv2hWqSkVdZPFBFFKuyPvqN9pKxnU9S4Zdkrr4xJ7
	 MJytwX87tmJ2Uxwv0s2v5N1pcI1nu3zVRAJ0HAQ87S7MUajMx0xhGugouoW/uB+DAc
	 pWsDBzhzNYcAmN6DiqPowJYtmmZefuwqjr2ilOhryac4Zn2grh61fiiE4fcsSychc5
	 3Erj4lREgtElqqlxg9svZMEHYFdSRPxZejV5WHC3VFfM6ZuntKbyyZZ8pY5eQyk5xQ
	 CLk9Bo4hZPWwQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] mailbox: mtk-cmdq: remove cl in struct cmdq_pkt
Date: Sun,  9 Feb 2025 02:11:02 +0000
Message-Id: <20250209021102.5253-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every client driver has the struct cmdq_client information, so
it's not necessary to store it in struct cmdq_pkt. cl is used to
store struct cmdq_client information and now no client driver use
it, so remove it.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 include/linux/mailbox/mtk-cmdq-mailbox.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index a8f0070c7aa9..4c1a91b07de3 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -75,7 +75,6 @@ struct cmdq_pkt {
 	dma_addr_t		pa_base;
 	size_t			cmd_buf_size; /* command occupied size */
 	size_t			buf_size; /* real buffer size */
-	void			*cl;
 };
 
 u8 cmdq_get_shift_pa(struct mbox_chan *chan);
-- 
2.34.1


