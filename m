Return-Path: <linux-media+bounces-53978-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJO2Nv6go2k3IQUAu9opvQ
	(envelope-from <linux-media+bounces-53978-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:14:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3421CD4DC
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 938D233FB515
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE9D3115A2;
	Sun,  1 Mar 2026 01:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpewUyQl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B232F6927;
	Sun,  1 Mar 2026 01:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329784; cv=none; b=ZZ9258KhPR3LH+rb/orACtXH0/pIcwthpMdviIYeNlshIdmt4kgJRQkemquUSccSlhfXWrlc4Xu1ZVIVSt4SA6K1XjtHYRwGZP+XT5gf/d1au46F/MkGUeBm/AixnjcOcjJKrBt/iAbVZ1pJTPmthasGs4LI5g8e0pkXgOmMsqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329784; c=relaxed/simple;
	bh=FfNy4PIWytOMEBTZ5bEdashv692fsThA29MEwRB/lF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mr22v3YPJSNiHv0ZFcUMzkIDjOnIgjX3bFGSO6kekuviem8d37ERMgxsQUxQAmXMQ+9iTMHArqLJTcCUcDMJ+RM2YW00ospra0x0f8lGvQFf9fl7ugkh85YSSFmU+3qvNn+bguUOM3+j2BXfMhPD+DuFEX0PU8MEJG/kgmgfAZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpewUyQl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4BBC19421;
	Sun,  1 Mar 2026 01:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329784;
	bh=FfNy4PIWytOMEBTZ5bEdashv692fsThA29MEwRB/lF0=;
	h=From:To:Cc:Subject:Date:From;
	b=LpewUyQlfGGjovQ8gEvYoFXGXqQuO5phKQRLGEIf+F7xzDrpg/tvCRNs6dU0zke9I
	 9DFAHqGmMUrGgtNQzj6MsQW+yZgMLbmv1Tn1RCEMrBG5b8PXgswR2VNrl+aTBgQ0rx
	 /8IlcWjDon8DJ8jo2IN/4/4+E9n3Z4RyUmi0aR4AsFaPtkLxuNyGYUiFk5VdG542a2
	 /xWiuH8rThF8/Q5JTMeQSi+UXPRjS04viv6UCtjBj9OjG3lOJ15o08FOlTACTp1CKn
	 oTMA1Ku2MxIedRnx0c7XBvo3u9vL2RiS664hGlB8Zc7W7G/LAcFc+hDtaAcargnO8d
	 jHhKamY1SAIAw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: cx25821: Add missing unmap in snd_cx25821_hw_params()" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:49:42 -0500
Message-ID: <20260301014943.1714507-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53978-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 3D3421CD4DC
X-Rspamd-Action: no action

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 863f50d583445c3c8b28a0fc4bb9c18fd9656f41 Mon Sep 17 00:00:00 2001
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Date: Wed, 10 Dec 2025 16:52:30 +0800
Subject: [PATCH] media: cx25821: Add missing unmap in snd_cx25821_hw_params()

In error path, add cx25821_alsa_dma_unmap() to release the
resource acquired by cx25821_alsa_dma_map()

Fixes: 8d8e6d6005de ("[media] cx28521: drop videobuf abuse in cx25821-alsa")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/pci/cx25821/cx25821-alsa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
index a42f0c03a7ca8..f463365163b7e 100644
--- a/drivers/media/pci/cx25821/cx25821-alsa.c
+++ b/drivers/media/pci/cx25821/cx25821-alsa.c
@@ -535,6 +535,7 @@ static int snd_cx25821_hw_params(struct snd_pcm_substream *substream,
 			chip->period_size, chip->num_periods, 1);
 	if (ret < 0) {
 		pr_info("DEBUG: ERROR after cx25821_risc_databuffer_audio()\n");
+		cx25821_alsa_dma_unmap(chip);
 		goto error;
 	}
 
-- 
2.51.0





