Return-Path: <linux-media+bounces-61558-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBcqGQERBWrvRwIAu9opvQ
	(envelope-from <linux-media+bounces-61558-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 02:02:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6532153C345
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 02:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66FE33018AD1
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 00:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6101E19CD03;
	Thu, 14 May 2026 00:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arjYlFWw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDCAEEC0
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 00:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778716920; cv=none; b=HMSQQOJt6V4eS32ro7KZkUTZWMGDk+BnfCF4OEglrERqf7lkvbXBBH+gjk56Dz9p43dGZfy9T0OPnFvZIbvSB53qYNEeez8l8P5oeG2cEp5nWsAufWbIKC/TauCC7Uw6x+sHYsOC6sY15CRkPizGoK0PKxlSXGvBu3sSRlZN82k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778716920; c=relaxed/simple;
	bh=bv9X9C6ybvBXVMAO8U6jO4EDYmS8S3AlJGFSYWl4PTw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CzO0UgNtCXwflKLh5RVudpSETA4NPfTMRnTu6m9s4RLKuBD2kPjyhHVCaBfJ9V3D3Fkd9n5mjml1yTo4uIc70CRlPVXmc7v2lW0KVfFdXYyFtLULzSSh4LjVSY0EJo24jbqFpU5Wf10kqXqO4/qzG4t95BbBfzGPpN76nhRiHmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arjYlFWw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ba4efedbeaso51921425ad.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 17:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778716919; x=1779321719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OP4TJnoSOJJLQkWv+kPmUFMD5Nz5E/Le8rvbutXj/wM=;
        b=arjYlFWwaFvaJXRCTCwE1CPFHPIyR+rHL1aXqZqHXYtyVFhlgTuip4crmFT6jY9l0B
         SwPIi8A9o+JP197CyJb1uUd5coRVBSRuLo/BhVRazP6ZfQj5avOSalR/Mfm4Ojhez2VC
         Rhz/MoWiC66zxv/ENoDb4Z1LNgPpa3SxBXwo/EA5kBmQ2PNfWmNdwwddZ0L2KLH8/lyq
         AFeQKm2+O0oyrwP1higGVCsV0hdzGzzoTpITEkittFrNGbtrNmryOyJkH2ZHY0PRr+mw
         vgBhWPQwGX5HTZv/jaMwzFuhZkPLlUcoE9mcNF/ZuKvXrzyhXqqVUt39fs8H5Y+PywN+
         isow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778716919; x=1779321719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP4TJnoSOJJLQkWv+kPmUFMD5Nz5E/Le8rvbutXj/wM=;
        b=QqauPV0n4M+wUjJL4N6qNbPc5/gyS6rucmQ+UuvnBsZrEOVt2L7KyMhJWY8WdV9+x3
         Vy6emAGM84ga4QJx9A+7rmKKRbfTZmiqXEk5LQsL3xsRzaM9iYtW9lPOdP1HtSmMBpL4
         whdW8f2j5927HzfwG0HNtQo4wBcp99yc6kBuyp5pq5r5tzmXhzf9el7n0LuS5LDi46dC
         6aC3JoKqUmNIhg8K0pVKkOuamKFQztAIsgWZljW3NtzjNNd99Pbzx18DYAp37hZt+xZv
         5G1nNNolgfyxD9KkTGMW36Dr0Ef3rOoWDAeDp98BDxxK0ycv68pgYGf89TuB8zgxnnvf
         nkeQ==
X-Gm-Message-State: AOJu0YwfbD28lh1gO61Re+PdFGDVQoSy4WXfxGu+JseZbiHYNGIyAKX6
	81EDQwHZKjnFTzhQxLRD0vbZuWcU+tL6PCcg0HhhMrMcLXzW3XRIRA8zq/J4pkti
X-Gm-Gg: Acq92OHh7jreCQug7V6VjRm2oGtdlke34Z7Obspb+xKKp6Xc2JHdiHLhKodSBgVkRUd
	G7edm0mzftkEECZVXdlnQKGZ4YukgjjrjttK4Ogx+7tc7b4n65JyhOIqj4jBi377qrJtTeDV9Yu
	cLEN7Z+s+wDJja1nu62PTUiYfh1qsX/YrH5E7rl8GBOscBxQqYN/4NA+xglYAvdjpaOfTKiE8JC
	lxRBVS3TJImuX9CDoVwSg8G9gQ75XaS8Kpu1sCWlk6ugMHQ1e+9FwS/OZLw4qUsF6P1jVBLnkMy
	qdU0yLVClk+cbttrPvVN4o7p68mW9ISADRHGmxcwYWK7KXKhR59/7R+4XehlVA2Tj6f/DkF8tDG
	n32iVJcjccfHfuLmRe/v5HGr0RuBFtOQ4xxOxFf0CO57z83HHazofxY/FXHoTMRtOXasrEmezCm
	ufCqCdpuGhp3JC3TJyAACBG9BgSjDByL7ziPi64uLV6xSMvjohdI701/jih0FrWr9GxDB6XYGPP
	TBtFA==
X-Received: by 2002:a17:902:ced0:b0:2ba:67f7:9326 with SMTP id d9443c01a7336-2bd2f6080a2mr54506925ad.9.1778716918700;
        Wed, 13 May 2026 17:01:58 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([203.194.102.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f30bsm4497835ad.16.2026.05.13.17.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 17:01:58 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Moksh Panicker <mokshpanicker.7@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
Date: Thu, 14 May 2026 00:01:51 +0000
Message-Id: <20260514000151.9776-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6532153C345
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61558-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[mokshpanicker7@gmail.com,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

When mxl111sf_ctrl_msg() is called during early probe, state->d
may not yet be initialized, causing a null pointer dereference in
dvb_usbv2_generic_write() when it accesses d->usb_mutex.

Add a null check for d before proceeding with the USB transfer.

Fixes: d90b336f3f65 ("[media] mxl111sf: Fix driver to use heap allocate buffers for USB messages")
Cc: stable@vger.kernel.org
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/mxl111sf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 870ac3c8b085..9908675c355e 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -56,6 +56,9 @@ int mxl111sf_ctrl_msg(struct mxl111sf_state *state,
 	int wo = (rbuf == NULL || rlen == 0); /* write-only */
 	int ret;
 
+	if (!d)
+		return -ENODEV;
+
 	if (1 + wlen > MXL_MAX_XFER_SIZE) {
 		pr_warn("%s: len=%d is too big!\n", __func__, wlen);
 		return -EOPNOTSUPP;
-- 
2.34.1


