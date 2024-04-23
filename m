Return-Path: <linux-media+bounces-9954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 651BD8AF589
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 19:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAC77B2346F
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 17:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA38613DDB4;
	Tue, 23 Apr 2024 17:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="PSHpeoND";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="CBMg5wQm"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A52B13DBBC
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 17:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713893546; cv=none; b=FtwSVGRy4oKVou4DgcFwXcOOCjx12+xaAGwNCCT14yhwdsWCx03zbN77Bd9cIsLiu9QTsBzerm1oLN5XpB9Nc7KM7VwIRSbR3gCWSb00nzk7ZU3I7A+pxBnikmXajGKUgIj4Gp4lGuFc7WKQBJDMQrBN96L7lN/6uzM2RlqehOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713893546; c=relaxed/simple;
	bh=4TS7401BzC7HHkLpSyb6sswb1tyKMwwPWPbxPiKPtn0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=AG1wdMXvCK09OCEQwi9Hxl0anj681lc08dZUkVmq3FY3Qb4Dry9z4k3OmCfvMZc2YZDGb1B9xnWLRqsi3i+QVbK7ve8FpgMLd85Nys9SPaEwjeORsM6XOoAt+TeIjpVlGmLjD0rCoaCHrYT8/YiMtegKTUGeoRyvzsq3vci15CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=PSHpeoND; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=CBMg5wQm; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1713893536; bh=4TS7401BzC7HHkLpSyb6sswb1tyKMwwPWPbxPiKPtn0=;
	h=From:To:Subject:Date:From;
	b=PSHpeoND0bQClzuxVi3BTqwiTG3NzDaGT2yUfCCzzH+pHv1Jy2vS0jorsKpU8OYq0
	 jKAUcSv5bQYWGGIzJOmHRXZ4PkhaKgOf+hw4riMSnhySWElpzBfX/WqN7hiAKar3MJ
	 HTOuxueiQXBJO6Zi1oPtj5NiN8t2uSGW3tjcWvokEDCCiOMhrGeALo9jRxi9DcJziO
	 4Uix6OXba4DwTwjoAYB6q5XGj7NkwB0hj9jGQSJkk/BMkh8aXWjY6pWUm83sgQOZZO
	 Kxay7bA4In4KSzbz2f2tg2zNhnbjlXc7lciyLLyRi9gkaVEerjhfTOL9JV1ZO8T7WY
	 Wf1LMnMUIoq7A==
Received: by gofer.mess.org (Postfix, from userid 501)
	id 78C211009EC; Tue, 23 Apr 2024 18:32:16 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1713893535; bh=4TS7401BzC7HHkLpSyb6sswb1tyKMwwPWPbxPiKPtn0=;
	h=From:To:Subject:Date:From;
	b=CBMg5wQmyolWz/JCWKrA4yE8ran3NDqJGDMMNnF9wt7f90eQ8AzsO3K9Mm+UkzWrX
	 RdgiBs08PUa8Z9b/d0xTauqKqvaQKFMBYNLn7ZDvckaVtqvQRou1GvEaGOwmBdARul
	 El2uIVc2T2ynnxVAzLjYxUT+VogT2eVCNdPXzSX3WPiH+bzbI/CTOHC4rhE+2A0ppv
	 0GJ+LzrbM5xFF3U/X0rjNl/2k9497NRWmh2iCsRyHibcvQEtw8NJK0RI8N08AhBKy6
	 kDTJO9wx8kwClYFJca+HjU3QAnz+q41nOWIbpfCqVTEfFsoHC3vvT1Qsv7lOs4Mrnk
	 1tIw6sS5Wqivw==
Received: from localhost.localdomain (bigcore.local [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id DF18F1000C2
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 18:32:15 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [PATCH v4l-utils 1/2] ir-ctl: add optional header to manchester encoding
Date: Tue, 23 Apr 2024 18:31:54 +0100
Message-ID: <20240423173155.46009-1-sean@mess.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The optional header was not included when transmitting.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/ir-ctl/bpf_encoder.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/utils/ir-ctl/bpf_encoder.c b/utils/ir-ctl/bpf_encoder.c
index 1d075d94..886f046f 100644
--- a/utils/ir-ctl/bpf_encoder.c
+++ b/utils/ir-ctl/bpf_encoder.c
@@ -101,6 +101,14 @@ static void encode_manchester(struct keymap *map, uint32_t scancode, int *buf, i
 {
 	int len = 0, bits, i;
 
+	int header_pulse = keymap_param(map, "header_pulse", 0);
+	int header_space = keymap_param(map, "header_space", 0);
+
+	if (header_pulse > 0) {
+		manchester_advance_pulse(buf, &len, header_pulse);
+		manchester_advance_space(buf, &len, header_space);
+	}
+
 	bits = keymap_param(map, "bits", 14);
 
 	for (i = bits - 1; i >= 0; i--) {
-- 
2.44.0


