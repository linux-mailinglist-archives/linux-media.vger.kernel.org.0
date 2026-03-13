Return-Path: <linux-media+bounces-55660-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPVbMOXxs2nYdgAAu9opvQ
	(envelope-from <linux-media+bounces-55660-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:15:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E135282103
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B2F430804FF
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFEF38D011;
	Fri, 13 Mar 2026 11:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NuN4iG4l"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4262A3815F4;
	Fri, 13 Mar 2026 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400460; cv=none; b=bR2Gq0HqkMKcF/KJ/+AtxGoTg/s2hMC/b8clVjQxys8WS5wq0M+friEDKANHbjMhc/Odw3+GU6jDuiMavCjCFe8LOT2l7rFItQBlVo3Mxef5i5G3xaO4VLSN/4OveYFnhfs/Sjdbn0LonY+nJue+1O53A3Fya0gqjw1QKQSvaGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400460; c=relaxed/simple;
	bh=2vjfmNRK6NCrgsI9jMmVTWUnzjDZIxh8672M67eU4U4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hAy9D3IxH+oHvt6AlnGHqNlMP9mqvmugWvUzpzaJzaF/Y8j6VpKJ0wwmH88tXwnzNk8SsLmtW/kPlSJD7/QbnhRow+al7C86yCQWdpa4osi4ISTwGWEVxP9Zw90GrE08wbHYh+0LoCS8Zf0Efcb6ghq5ZSrtAxD5XYd3xtBDGkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NuN4iG4l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [37.159.92.229])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A6E5F52;
	Fri, 13 Mar 2026 12:13:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773400388;
	bh=2vjfmNRK6NCrgsI9jMmVTWUnzjDZIxh8672M67eU4U4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NuN4iG4lHSvTnVr4TDI6kh8yeYW+BmY4Wrxjq3a7Gqtym/H1ellUi9lwcWf2YSfk1
	 Bf2krhjFYIg4tOUzN4nR84/Ih1l2iE+sQxkBRTKWcqJtnNtOl2FFhJap6/ON3RIHk/
	 e37X08bEColSry1ECT/lxvUQ9JKNqwzAedVG2k8k=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 12:14:01 +0100
Subject: [PATCH 5/7] media: rzv2h-ivc: Fix concurrent buffer list access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260313-mali-ivc-fixes-v7-0-v1-5-cb0714cd1279@ideasonboard.com>
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1746;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=F4PFojuBms+JkHMba5rVpVUdG0Zz8csyM/6PENMaCLc=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps/GAT1JEF5uRbEGGnTov3OAPkEMr7YW1JIRFp
 JCf3ccCD4OJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPxgAAKCRByNAaPFqFW
 PA+/D/9Mvr7OAc5UR+kFz1MdXW3kq/SJOUZYwT0pu+2X+dDgrFWrIDMq1EHvzR6jKFHnhaYy5wA
 M+49wvxBnekcaBQnqSUA6fG+ZYw1ilnBNupHkGaNITEBCJdG6Rzbvf5C5cr0hW0udWnUSIGPYVF
 tnqnaJHP9rZFd+S576IJ4FyS2Dbz8U98pRN0HZCMWaADPh1YXh1qdYOv4i/J/QzZklhTag5S0cl
 Q2bALpuR6VRdtQak9ZB2kVh4Kn5Y1sJM6f6SZu3lPHWzovmSMtHkvYThzwYwfyoqqRu3QtMNEpm
 dfz0InXMafX+TUtM8ldifWXQBZx53psrkdvd+OLaY1qvW+TThFy+NDMsils5bEk3t34UlfG2+Sm
 4+1M8frWeSiF/k/TOnWS6fPEk6ALjXhDUazBDKMsmbisszRTSq/Kvp9m6bpVGI6NqV2cnR8J3p5
 ybE72RYijwPisqVGhOBhgKc8UqAlh4VIqcXifxAnnFd7xp1mbQ2jqUTHaljbAUrZzSFvlgPZycA
 7Goh+5Kr63NXyQV5SzDglAaMte5Sy11futzqaLehG7J1AKb+XFHPhmgx8NLDQNUiXvqHCxYtBOi
 JMtY8+TUHS05g1HvqP2xNDPzflWhOJlveLREbhRbN0atQIEw/UXOsRbWgpre36idZrgYmknbL16
 ODemG7RVpHEOJhA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55660-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 3E135282103
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>

The list of buffers (`rzv2h_ivc::buffers.queue`) is protected by a
spinlock (`rzv2h_ivc::buffers.lock`). However, in
`rzv2h_ivc_transfer_buffer()`, which runs in a separate workqueue, the
`list_del()` call is executed without holding the spinlock, which makes
it possible for the list to be concurrently modified

Fix that by removing a buffer from the list in the lock protected section.

Cc: stable@vger.kernel.org
Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
[assign ivc->buffers.curr in critical section as reported by Barnabas]
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
index 9b75e4b10e99..a22aee0fe1cf 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
@@ -153,14 +153,13 @@ static void rzv2h_ivc_transfer_buffer(struct work_struct *work)
 	scoped_guard(spinlock_irqsave, &ivc->buffers.lock) {
 		buf = list_first_entry_or_null(&ivc->buffers.queue,
 					       struct rzv2h_ivc_buf, queue);
-	}
-
-	if (!buf)
-		return;
+		if (!buf)
+			return;
 
-	list_del(&buf->queue);
+		list_del(&buf->queue);
+		ivc->buffers.curr = buf;
+	}
 
-	ivc->buffers.curr = buf;
 	buf->addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
 	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_SADDL_P0, buf->addr);
 

-- 
2.53.0


