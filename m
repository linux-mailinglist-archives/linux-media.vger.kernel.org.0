Return-Path: <linux-media+bounces-51362-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFvQKrVWcmkpiwAAu9opvQ
	(envelope-from <linux-media+bounces-51362-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 17:56:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0362B6A767
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 17:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63E9B305375B
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 16:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DC7344DA7;
	Thu, 22 Jan 2026 16:26:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091BA3E753F
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 16:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769099179; cv=none; b=FCiEFUrnV36lLdhwV0rZXU87/mUUoi117527KrlhYApdWU2AjYcuCeiDPffA7zt7QUewvytLkHxrerJC6d34dtT2VZnCgkVfIjb1a+iZvamheUSwameN5lpBll6WVjJ5OfDvYvL6mmz9a+ZdwIgGAgG+rQ4IHHQImdCzQZKbZc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769099179; c=relaxed/simple;
	bh=Im8tXG+0FmEVlhxx1EqBlbPctJ+F4v7rQ8sqso9YEys=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BTCRfKK1jHGsq0xzMlEU807oNKPOlsK5J2Y2vpL5lgQ8YoP8pDM/Yp23EO7Xdyq/IcsimJA5Md5ac5n4ZVfATPFEsL9I+hzz9YIiarutvwQ1w4lg9u3z2whjGzmmIqzId4BJSgZPUCzBbPtVxeEr98fp9gIzx4qGN5pe8mjYGhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (213.87.156.185) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 22 Jan
 2026 19:10:53 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH RFC] media: v4l2-ctrls-api: add find_ref_lock()'s result check in  prepare_ext_ctrls()
Date: Thu, 22 Jan 2026 19:10:13 +0300
Message-ID: <20260122161014.12790-1-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[auroraos.dev : SPF not aligned (relaxed), No valid DKIM,quarantine,sampled_out];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.shtylyov@auroraos.dev,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-51362-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtesting.org:url,auroraos.dev:mid,auroraos.dev:email]
X-Rspamd-Queue-Id: 0362B6A767
X-Rspamd-Action: no action

In prepare_ext_ctrls(), find_ref_lock() is called twice from the 1st *for*
loop but its result is only checked after the 1st call. I'm not positive
that the 2nd call can't ever fail, so let's add a NULL check after it as
well...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

---
The patch is against the next branch of the linuxtv.org/media.git repo...

 drivers/media/v4l2-core/v4l2-ctrls-api.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 0078a04c5445..238695a7555e 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -286,8 +286,14 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
 
 		if (ctrl->cluster[0]->ncontrols > 1)
 			have_clusters = true;
-		if (ctrl->cluster[0] != ctrl)
+		if (ctrl->cluster[0] != ctrl) {
 			ref = find_ref_lock(hdl, ctrl->cluster[0]->id);
+			if (!ref) {
+				dprintk(vdev, "cannot find control id 0x%x\n",
+					ctrl->cluster[0]->id);
+				return -EINVAL;
+			}
+		}
 		if (ctrl->is_dyn_array) {
 			unsigned int max_size = ctrl->dims[0] * ctrl->elem_size;
 			unsigned int tot_size = ctrl->elem_size;
-- 
2.52.0


