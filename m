Return-Path: <linux-media+bounces-53894-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FMvOe2Uo2n3HQUAu9opvQ
	(envelope-from <linux-media+bounces-53894-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:22:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A6B1CA55B
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 111ED300F7A8
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC34274B42;
	Sun,  1 Mar 2026 01:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2OYfiMl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04280175A74;
	Sun,  1 Mar 2026 01:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328017; cv=none; b=QKCpVI9du4JGCQIySoEa4HqQXZLBJoq/yNThCJNiARV641QTXCaeUDwakhKvdaz3whEy6XIxdVj8zadx3Y4eD5WO4ESBy3DMm/hhvbyVXhMgOsYkCPJtMViotm2hPirB82NSfLPMZmUyaDS/CuM43ljJzqxb9pukEjEHY55tT4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328017; c=relaxed/simple;
	bh=+Q8kkxjoV7yGpX1cmSy4IL5VTM9p0jbeIpn4si4535g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jOeg0HiFvA/VOFVuJ05k40+38L7Erv/dO2WasgXyNpDxqOs7hZrvBXi8M8QuC+wsO9BE/dgMPECXmoxU9f9awHbnnFwI21jxCEcsMzS5A1kgEjdEjIDDBr02kwYnlRsoN1V1UKzhCGlKGa+jabfnwVwZsXqxNjmTD1rPN5XBe4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2OYfiMl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DAE0C19421;
	Sun,  1 Mar 2026 01:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328016;
	bh=+Q8kkxjoV7yGpX1cmSy4IL5VTM9p0jbeIpn4si4535g=;
	h=From:To:Cc:Subject:Date:From;
	b=Q2OYfiMlhkqpPEB8sveQi3Tpl3rKTBQdxMBnE3WI1M7Z2R7o5oenuGJwPS8tfR9bc
	 kem2CJVr+waOInvY1cB+CLktnI0puDtAbtCa8fKpGJ7CwZXvTJwWxTKsK3SMDf2/kl
	 FEVsBFq5UzGn/Dhyuyh8NJUH2Ef4qRZsDghN+/tcl5UCR+akHLtBW1Swl4GO30OZ6r
	 sKAMdKp3ko9R2Z4hCltGujMJM4jLJG9ksbI8GjjuAGs3LI6vX3IWwQo9SifRh7MMlZ
	 jiwUV+xk4/lap8wYq1OlaXIpyx5zS12WrkRkNxErG0v6cAXEwtVUnYZYIHF5juWvbP
	 UzOH9c4YeL57w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: cx88: Add missing unmap in snd_cx88_hw_params()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:14 -0500
Message-ID: <20260301012015.1675747-1-sashal@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-53894-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 16A6B1CA55B
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From dbc527d980f7ba8559de38f8c1e4158c71a78915 Mon Sep 17 00:00:00 2001
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Date: Wed, 10 Dec 2025 10:53:48 +0800
Subject: [PATCH] media: cx88: Add missing unmap in snd_cx88_hw_params()

In error path, add cx88_alsa_dma_unmap() to release
resource acquired by cx88_alsa_dma_map().

Fixes: b2c75abde0de ("[media] cx88: drop videobuf abuse in cx88-alsa")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/pci/cx88/cx88-alsa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
index 29fb1311e4434..4e574d8390b4d 100644
--- a/drivers/media/pci/cx88/cx88-alsa.c
+++ b/drivers/media/pci/cx88/cx88-alsa.c
@@ -483,8 +483,10 @@ static int snd_cx88_hw_params(struct snd_pcm_substream *substream,
 
 	ret = cx88_risc_databuffer(chip->pci, &buf->risc, buf->sglist,
 				   chip->period_size, chip->num_periods, 1);
-	if (ret < 0)
+	if (ret < 0) {
+		cx88_alsa_dma_unmap(chip);
 		goto error;
+	}
 
 	/* Loop back to start of program */
 	buf->risc.jmp[0] = cpu_to_le32(RISC_JUMP | RISC_IRQ1 | RISC_CNT_INC);
-- 
2.51.0





