Return-Path: <linux-media+bounces-58466-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHR7NCFl2GlDcwgAu9opvQ
	(envelope-from <linux-media+bounces-58466-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 04:49:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DADC93D18EE
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 04:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE0593053770
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 02:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB252C0303;
	Fri, 10 Apr 2026 02:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.cn header.i=@sina.cn header.b="UlsgTIjU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail115-76.sinamail.sina.com.cn (mail115-76.sinamail.sina.com.cn [218.30.115.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA4F242D89
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 02:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775789183; cv=none; b=d+/LRcyla9hWsRvFNVm5GqTWRpNfX8hUbOTqPakAGgAFHl46tbiVBnlYwRkj1BVNuhvuOHq2lusw7tp3BaznfcY3Kuhi7Xzk82wD6R29p/Zt9j9gr5HFD+VaimVzizgZxoIEaAgMV/7QKKSgkoKoxaEv/uITzjuQzhmdkD/nQYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775789183; c=relaxed/simple;
	bh=a4lni9hcsti9FZ1wRpFGW1X6Y+us/2ONM6YdbyDS/ig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tAwW96DSzHzhagVe5XAV5gNXbAagssStVBOd8W/Xm/lDV/g0KsG9kP+ARr+7TO/lyZBIHRUnQ5wWhL7nzpiLjaSdWdL32jBPFTGbSyLMHGriZ8gS1nutz/hNsfO1trSdz3YbPGQ1T0EYPzzHcwtRRxrm6Y3AE92tDWWila98fXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.cn; spf=pass smtp.mailfrom=sina.cn; dkim=pass (1024-bit key) header.d=sina.cn header.i=@sina.cn header.b=UlsgTIjU; arc=none smtp.client-ip=218.30.115.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.cn; s=201208; t=1775789180;
	bh=ruYH7ms7tY97YQislZdAnstwK+shvlV+EpfW2XTw8BM=;
	h=From:Subject:Date:Message-Id;
	b=UlsgTIjUJ+SGlKixCMg22ghvqqSJoKB2TTy02BzS9gWG5T2Om+5nUXKsB/394JLJz
	 1ITFYoGdR8acRX7aPtd0ArFV59BioaGE+jdFenkGnTI29qlLfp44HLYZuxeKy330HU
	 BJXWLbVAizY1BHgoWj/1UjM8hcajEhD3lZdy1XJs=
X-SMAIL-HELO: NTT-kernel-dev
Received: from unknown (HELO NTT-kernel-dev)([60.247.85.88])
	by sina.cn (10.185.250.22) with ESMTP
	id 69D863300000308F; Fri, 10 Apr 2026 10:40:51 +0800 (CST)
X-Sender: jianqkang@sina.cn
X-Auth-ID: jianqkang@sina.cn
Authentication-Results: sina.cn;
	 spf=none smtp.mailfrom=jianqkang@sina.cn;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=jianqkang@sina.cn
X-SMAIL-MID: 2701797602325
X-SMAIL-UIID: 35D1CE780ABD41B7A80F43E657DA5241-20260410-104051-1
From: Jianqiang kang <jianqkang@sina.cn>
To: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	arielsilver77@gmail.com
Cc: patches@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	mchehab+huawei@kernel.org
Subject: [PATCH 5.15.y] media: dvb-net: fix OOB access in ULE extension header tables
Date: Fri, 10 Apr 2026 10:40:48 +0800
Message-Id: <20260410024048.3765362-1-jianqkang@sina.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sina.cn,none];
	R_DKIM_ALLOW(-0.20)[sina.cn:s=201208];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-58466-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianqkang@sina.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sina.cn:+];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[sina.cn];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.cn:dkim,sina.cn:email,sina.cn:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DADC93D18EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ariel Silver <arielsilver77@gmail.com>

[ Upstream commit 24d87712727a5017ad142d63940589a36cd25647 ]

The ule_mandatory_ext_handlers[] and ule_optional_ext_handlers[] tables
in handle_one_ule_extension() are declared with 255 elements (valid
indices 0-254), but the index htype is derived from network-controlled
data as (ule_sndu_type & 0x00FF), giving a range of 0-255. When
htype equals 255, an out-of-bounds read occurs on the function pointer
table, and the OOB value may be called as a function pointer.

Add a bounds check on htype against the array size before either table
is accessed. Out-of-range values now cause the SNDU to be discarded.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Ariel Silver <arielsilver77@gmail.com>
Signed-off-by: Ariel Silver <arielsilver77@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Jianqiang kang <jianqkang@sina.cn>
---
 drivers/media/dvb-core/dvb_net.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index c594b1bdfcaa..c8cbe901bcf0 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -228,6 +228,9 @@ static int handle_one_ule_extension( struct dvb_net_priv *p )
 	unsigned char hlen = (p->ule_sndu_type & 0x0700) >> 8;
 	unsigned char htype = p->ule_sndu_type & 0x00FF;
 
+	if (htype >= ARRAY_SIZE(ule_mandatory_ext_handlers))
+		return -1;
+
 	/* Discriminate mandatory and optional extension headers. */
 	if (hlen == 0) {
 		/* Mandatory extension header */
-- 
2.34.1


