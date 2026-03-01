Return-Path: <linux-media+bounces-53890-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL9/DsuUo2n3HQUAu9opvQ
	(envelope-from <linux-media+bounces-53890-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:22:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 783891CA4D6
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42EF8301BFA8
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCB225F7B9;
	Sun,  1 Mar 2026 01:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/JL5jeL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FB3175A74;
	Sun,  1 Mar 2026 01:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328007; cv=none; b=ZBK0vC/EHXn/j0Fb2+JW+J+/2zA6XZIr9UFpbNc6uo+Q+84bB4T6+7bwfLZTOr44TbJZfkd1SDqntxxRFvIv905xTUEEx3ZHynaYlE+2/ooUgQOgKG+Ei5huwjYUrG88bdDyOeZGIT6IxoA7BE8fcFPZvKq7EeCuM8a69ZTjR7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328007; c=relaxed/simple;
	bh=8RIIuphDo/vh/1L5u+Pq0vzOrFuAcGRQvWpacyTbXBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nhy1KQoEe97KxGd8+TcfQN78OxHXwtmAIpQx00SF7J2qGt8mz8FJl/2JFCogWVz71I7slDtYUAxpcTl/oQ+8Nir/d7AXqeX8EU7k9qXIZSJtjgXHfMfx2yMUxw8/VHvE6R70MMt919Brm9Rzra6umG8BYI5sQ1n+FhVQQFzQbG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/JL5jeL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C0BC19421;
	Sun,  1 Mar 2026 01:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328007;
	bh=8RIIuphDo/vh/1L5u+Pq0vzOrFuAcGRQvWpacyTbXBA=;
	h=From:To:Cc:Subject:Date:From;
	b=Z/JL5jeL7Pk3YNjV4Fef5gd27YihA2ooQ2TiDIi7jC4hxnH0lO6NxZwY0Iy+ym+bP
	 G8y0qQRL/QBeT2FowZjB1MXN9zQXOog2UFBjAENgacdP+2fwe/EP1dKElIXQnmDrqO
	 jtdAT/Humaouq3huqcRGZVkuCObcPCxdZ9X8d00ATRmXbDosGLYM6qECY8VgCKskPi
	 uMy8Sxy8qgUVhtQ6ZPbvaPfs7Rso8TXMwtpJ0UPiq98dmOzgLPU6aSadq5iv/n/J42
	 AT5snadhaZljK7RI9g5ykOAkK+15CdW8/2z2uOiYgleDpbwE0E812H2c8gX10QVo9p
	 taeFMIZcCBvLQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: cx23885: Add missing unmap in snd_cx23885_hw_params()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:05 -0500
Message-ID: <20260301012005.1675541-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53890-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 783891CA4D6
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 141c81849fab2ad4d6e3fdaff7cbaa873e8b5eb2 Mon Sep 17 00:00:00 2001
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Date: Wed, 10 Dec 2025 11:02:17 +0800
Subject: [PATCH] media: cx23885: Add missing unmap in snd_cx23885_hw_params()

In error path, add cx23885_alsa_dma_unmap() to release the
resource acquired by cx23885_alsa_dma_map().

Fixes: 9529a4b0cf49 ("[media] cx23885: drop videobuf abuse in cx23885-alsa")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/pci/cx23885/cx23885-alsa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx23885/cx23885-alsa.c b/drivers/media/pci/cx23885/cx23885-alsa.c
index 25dc8d4dc5b73..717fc6c9ef21f 100644
--- a/drivers/media/pci/cx23885/cx23885-alsa.c
+++ b/drivers/media/pci/cx23885/cx23885-alsa.c
@@ -392,8 +392,10 @@ static int snd_cx23885_hw_params(struct snd_pcm_substream *substream,
 
 	ret = cx23885_risc_databuffer(chip->pci, &buf->risc, buf->sglist,
 				   chip->period_size, chip->num_periods, 1);
-	if (ret < 0)
+	if (ret < 0) {
+		cx23885_alsa_dma_unmap(chip);
 		goto error;
+	}
 
 	/* Loop back to start of program */
 	buf->risc.jmp[0] = cpu_to_le32(RISC_JUMP|RISC_IRQ1|RISC_CNT_INC);
-- 
2.51.0





