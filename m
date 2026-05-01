Return-Path: <linux-media+bounces-60166-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id o8eQJg0N9WnIHwIAu9opvQ
	(envelope-from <linux-media+bounces-60166-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 22:29:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E89F04AF7AE
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 22:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 901473014C2B
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 20:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CA63F787E;
	Fri,  1 May 2026 20:28:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6278279DC9
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 20:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777667325; cv=none; b=D4y/ckFc0d9fGvnr8BZWpbG4liOsabq8lzlyqkatcvTWUWLEMvv7ZIXCKzdF6CIaWjJyi/qoQg5WtWedN05QzhLbQeh/V/nczWRKtHY+uymlmrhbzxnEPdk7alPZRekxmqo2XQTEXAPz/WIRwOJNeVTu5Lq54PVWx1mGOrIHqkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777667325; c=relaxed/simple;
	bh=+fnUOMGC43/V/izSOosiAfCde7Vd9HN34xfQL8QGUHY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:Content-Type; b=JFlRKl0PD7stko2ek4+H5LXsXzD5fL7mqkwr7dqDUhkU62sqDGHlr1dqbgGFmhs3idunp4NpSSNh2CqDiY07lRCOYlVvNFQayHTjLLuqZsLvvhFBzcB8pqU+mOE1oZE3RHCwz8XAOXTlrJMqCBFXNmUEIXbXNNT1Y/Mfgaiib8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (213.87.139.75) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Fri, 1 May 2026
 23:28:31 +0300
Message-ID: <6a4bc954-17ec-4633-a4e2-72906e18c1ba@auroraos.dev>
Date: Fri, 1 May 2026 23:28:31 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH] media: v4l2-ctrls-request: add NULL check in,
 v4l2_ctrl_request_complete()
To: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>
CC: Hans Verkuil <hverkuil@kernel.org>, <lvc-project@linuxtesting.org>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-Rspamd-Queue-Id: E89F04AF7AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[auroraos.dev : SPF not aligned (relaxed), No valid DKIM,quarantine,sampled_out];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,auroraos.dev:mid,auroraos.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtesting.org:url];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.shtylyov@auroraos.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60166-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4]

If CONFIG_MEDIA_CONTROLLER is undefined, media_request_object_find() will
always return NULL, so its 2nd call in v4l2_ctrl_request_complete() would
fail as well as the 1st one and thus cause hdl to have a wrong value (at
the top of memory) and list_for_each_entry() to iterate over the garbage
data located there. Add NULL check for the 2nd call and place the error
cleanup at the end of v4l2_ctrl_request_complete()...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: c3bf5129f339 ("media: v4l2-ctrls: always copy the controls on completion")
Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

---
The patch is against the fixes branch of the git.linuxtv.org/media.git repo...

 drivers/media/v4l2-core/v4l2-ctrls-request.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-request.c b/drivers/media/v4l2-core/v4l2-ctrls-request.c
index 4b7e6981b8d6..5c2fc767c6a6 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-request.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-request.c
@@ -348,13 +348,12 @@ void v4l2_ctrl_request_complete(struct media_request *req,
 		ret = v4l2_ctrl_handler_init(hdl, (main_hdl->nr_of_buckets - 1) * 8);
 		if (!ret)
 			ret = v4l2_ctrl_request_bind(req, hdl, main_hdl);
-		if (ret) {
-			v4l2_ctrl_handler_free(hdl);
-			kfree(hdl);
-			return;
-		}
+		if (ret)
+			goto error;
 		hdl->request_is_queued = true;
 		obj = media_request_object_find(req, &req_ops, main_hdl);
+		if (!obj)
+			goto error;
 	}
 	hdl = container_of(obj, struct v4l2_ctrl_handler, req_obj);
 
@@ -389,6 +388,11 @@ void v4l2_ctrl_request_complete(struct media_request *req,
 	mutex_unlock(main_hdl->lock);
 	media_request_object_complete(obj);
 	media_request_object_put(obj);
+	return;
+
+error:
+	v4l2_ctrl_handler_free(hdl);
+	kfree(hdl);
 }
 EXPORT_SYMBOL(v4l2_ctrl_request_complete);
 
-- 
2.53.0

