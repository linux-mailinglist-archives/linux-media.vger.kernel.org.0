Return-Path: <linux-media+bounces-66865-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1gM+DVMaTWqQvAEAu9opvQ
	(envelope-from <linux-media+bounces-66865-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 17:25:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3737171D3B6
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 17:25:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="jm9LUGO/";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66865-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66865-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E14830BF866
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 15:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E41142CB0C;
	Tue,  7 Jul 2026 15:06:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2EA3E2AC9
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 15:06:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436781; cv=none; b=pwDCZFn4HlNCy2gKtvdP5Sbw59SVU9V0BQUNWPCXFk6gGKu6IhosdaEl0ZI+O+5+LvG9SUDWqQTC7iqJ7q2BHtRVfqxEK2QHBXbNEqjLL945dNMnO+7fnxUiVXToWNIBbxxIAuHbF4+O96s3onvolhLJZb5Zm87ADT/P8d6fGr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436781; c=relaxed/simple;
	bh=VJbiLxjuLtw2ZDpVa8oIt+SV6G0E5M2f4Ct6nlFd72E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aQc4SfE7dCo+wsfG08nn6J9xK4tW/MaIYYJborQq8gXeo+WqPRvH3nFP6AKAKNX/kZm0W054xP0WeHYQCjkmYJLhAGEbdtPEjSX/w7cDvjup8DnC84poWZL1YrfYo9yEVquJmSdS0cvdFq41HGi3xYrtqxdAucoNu9PKBi72Iwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jm9LUGO/; arc=none smtp.client-ip=209.85.210.174
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8454160043aso4294251b3a.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783436778; x=1784041578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5SjgDzZeIMTL9X91tZ0pgVIK9jW7UN9flsvre64Izsw=;
        b=jm9LUGO/aOYdoyZuUTVT4OFmmIAe/mMsjaabEvP+oc4jWWGHZLOsQih9suoXY/lBJC
         mzCrhhJjLZxJh0/tbwpT8W8UBjFydWkRmo2OPpjLqyle41CEL2vQglVvE4Z9Kzi9dXeR
         /4oVYjGGmqpfC2iAG5cbUK32iEhUWU2uYRkCsti1WpQExkUOaiHIFF1T/V6Ap4eM/9Bm
         YcxWOP6ktPfVac9NGX+IQEdEHkuMCnXvsNssVgXFaPEjK5v+tmxAjtDdXwew4d0wG5ai
         f1TttjebabBn4DdOxh8+8y+ce80dqw6Y/OSlj2Pw6Yjmu8rpgSq1du5+WtFEtDOM8R+J
         GMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436778; x=1784041578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SjgDzZeIMTL9X91tZ0pgVIK9jW7UN9flsvre64Izsw=;
        b=sSk+TkYDRmX3vMMc9fzZ3RvekEg5nBbEb7ApIAt50cs9ehSvrjrvHH3taC0snbONXJ
         IZRWSw0NXewSHDXaIUGtq9N0j7pEWAb4/axGEN2aIZDbOONNJfGh/6a/m/BF7Tazk+Y7
         ymMUlf5Gw89ZgZpk3EaUQ4rBzfYd/sP7ixREAhZ4LDb5KpHdpj59NX1SLn7IuFxdarzZ
         PIR69ouWkL+4d7Rn2FrgRLXpMetf2OqvellVp1h6xIqSnpmAIN4OwQ4TUIOeJVdeKPXl
         rYSksaStnw36rkz8QN4g7q3bbEJWIIDNJOvvK0zrfhgPZcJuELjkCt0oM3YDZiE6o7cC
         0eZw==
X-Gm-Message-State: AOJu0YzWI1JyCZrTh4zTOKDqzSeavtBoeB5cJSbK2nmaNXTyQeY0hTTc
	IWGqhnDSKUWNZi8GoCjRqSwnrPWSbmO43pSzAzW8GNMD5JIVCoXPr6Co
X-Gm-Gg: AfdE7clMlbDgp04YAxknqiEpGtDRkxdmbVkrreoZj9T0BScYZRN5r6OBYk8CJ1OV9fh
	uGgV2KZ5i0OA4RiOLivWiZVMSIAHtr76UWgVWlIKYm6iXdZXy4wUAjs4beIwYuMBpC4dCYsNE3X
	iQ4YwG1mB6tc6vjN5KdAj+gWAOGno/EfPro41dLz8RZptiumEjRkHrRkKsdVFY4KsKrH5g6M/2j
	hqmr2qjlG/e9c0CPu7lZQViwmUwsCGlkgn693+1bNFJKyVcX4w+ZrO8mOVm83XHjsNesfn/MObH
	e2rXk8gubR4KtJxVAc295rnlwIx2KFo582ac5Z88J/Pha4NTM7vsGkzLtpldebt7DkWAreQOqBk
	uK8P9dmI6U8xvKOFusEOZfwGGxpkAGxMc+l7tOBQ/lsnv6PbtXX7BEjkumHiBdzlKcUO0eaR+DM
	6rUqw7YRhr0OCI77cZGg9el04T6RFmKfBy
X-Received: by 2002:a05:6a20:9151:b0:3bf:80a5:51b0 with SMTP id adf61e73a8af0-3c08ea3d412mr6462278637.0.1783436777654;
        Tue, 07 Jul 2026 08:06:17 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:239e:a31b:1d0d:374f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162b59sm1116536a12.16.2026.07.07.08.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:06:17 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v3 26/44] media: cec: Serialize exclusive follower delivery
Date: Tue,  7 Jul 2026 23:06:12 +0800
Message-ID: <20260707150612.2276688-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66865-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ruoyuw560@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3737171D3B6

cec_receive_notify() read the exclusive follower pointer without the adapter lock. Serialize the no-follower check and message delivery against mode changes and release.
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/media/cec/core/cec-adap.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index a90cb84a4b4d0..b616ed382c0e7 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -2219,9 +2219,13 @@ static int cec_receive_notify(struct cec_adapter *adap, struct cec_msg *msg,
 		 * Unprocessed messages are aborted if userspace isn't doing
 		 * any processing either.
 		 */
+		mutex_lock(&adap->lock);
 		if (!is_broadcast && !is_reply && !adap->follower_cnt &&
-		    !adap->cec_follower && msg->msg[1] != CEC_MSG_FEATURE_ABORT)
+		    !adap->cec_follower && msg->msg[1] != CEC_MSG_FEATURE_ABORT) {
+			mutex_unlock(&adap->lock);
 			return cec_feature_abort(adap, msg);
+		}
+		mutex_unlock(&adap->lock);
 		break;
 	}
 
@@ -2234,10 +2238,12 @@ static int cec_receive_notify(struct cec_adapter *adap, struct cec_msg *msg,
 	 * Send to the exclusive follower if there is one, otherwise send
 	 * to all followers.
 	 */
+	mutex_lock(&adap->lock);
 	if (adap->cec_follower)
 		cec_queue_msg_fh(adap->cec_follower, msg);
 	else
 		cec_queue_msg_followers(adap, msg);
+	mutex_unlock(&adap->lock);
 	return 0;
 }
 

