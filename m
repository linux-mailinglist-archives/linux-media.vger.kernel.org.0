Return-Path: <linux-media+bounces-67519-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FteUG01ZVWrdnAAAu9opvQ
	(envelope-from <linux-media+bounces-67519-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:31:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C560F74F441
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:31:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=kk8eWypp;
	dkim=pass header.d=mess.org header.s=2020 header.b=YjCxCoph;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67519-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67519-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C282304741E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69AC363087;
	Mon, 13 Jul 2026 21:31:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A50E35F185;
	Mon, 13 Jul 2026 21:31:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978293; cv=none; b=g+5iRTru0LwpszRkxjzF3bcfDEMwS/+YakuMT9FGCYYmItMN3cLikEm85iC3YmIbWnOUEG6RCviqA7ICJ+tSLVOBCv9UW9OV9M+8Gqt0+ADPAholayRHwLM6g0yScHkLQmID8LGQCYQSYTa+X2HOQSnXqj10xxsm+D4exR+0KGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978293; c=relaxed/simple;
	bh=+TpKe/mgJklkLKnDljH7vM67ggh0YzGDXp06CXV8Mjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDa33OmKEA7Zndq2zariRFoPaDRaCUly/lQHHOAy2f53HNLZyEbBw7wc2vudz1tmCYqXoyIdBUPTqqY6UbOPtEUvkHwPMbiUOPaKL3UP19FoSILMfWh8Wt8YvLqIbDEQpuO9/brPjAXHV7sk4gqN5ymVN8D39K4JY1IL2H3xIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=kk8eWypp; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=YjCxCoph; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978282; bh=+TpKe/mgJklkLKnDljH7vM67ggh0YzGDXp06CXV8Mjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kk8eWyppKmZol9pJ+z+Ghiycu4f4mBQpESexDfqmGxt99dqi27y8vGcROvj247wxe
	 BhKQnXMgC490hAagXCgD5HkhFy8pcFvmhvjPGE84iRkWxnmFMrFgzx8slgBBFs0656
	 gFjTVHPvp+U+3ut0sZr8CGbkFT7srMTuDT232LTfdXnsi9/4IQ3BW+87lgeajgvHk2
	 iIKJ9Fo0y02WQxIpX/1oy4ma/FfA8kbuJB+k7VtUsoto95APJNmo/qLCS9UWAVCL9A
	 drFOix8v+GGKpafLxbAbRiUOObGvtMFOVnieKfUc3kGQ7cNZvEdkkx2uT+20fTbqdU
	 k02EN1SrAKJKg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 2FC2140A3D; Mon, 13 Jul 2026 22:31:22 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978281; bh=+TpKe/mgJklkLKnDljH7vM67ggh0YzGDXp06CXV8Mjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YjCxCophy55RgB68zoH6Mo+LWEwPLO1i9+mvWYm+jXogOaZbvWphrjl5AnR9GsWOk
	 PwddnuGEnQ2s8xqyFgeoet1zulNbCkHM0LYTeOM9ok5UAXkZ7s3RNvxKGrtxaAZfdJ
	 7a3c6l4djKeeljsi56s1UhO9d2xYCPoAvPWXxyvIQuWHC+Mi/HbiDy/Fl0ZAXWeLzB
	 ZE1VDMWLfCObNgbidf5JUh+iIZdLP4IBUszNYbMDEN7zBX/V7VYfEb4k1B5J52ABAh
	 PPuWmy0aOOfAPtfpAwrMNJzPFd1ZSPBGv1HH66Fs178GkCG24RER4r7cqqe9oR+GtM
	 LHqqXwDOy7YUQ==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 4808240A3B;
	Mon, 13 Jul 2026 22:31:21 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/11] media: streamzap: Add missing rc_unregister_device()
Date: Mon, 13 Jul 2026 22:30:55 +0100
Message-ID: <25401d24a7f341ef3d92bded7ebb447e248f8cad.1783977550.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-67519-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:oneukum@suse.com,m:hverkuil+cisco@kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mess.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mess.org:from_mime,mess.org:mid,mess.org:email,mess.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C560F74F441

If usb_submit_urb() fails during probe, then the error path is missing a
call to rc_unregister_device(), which will leak various things like the
input device.

Fixes: 42844992664f ("media: rc: streamzap: Error handling in probe")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/streamzap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 307985d74fe8..41195ad82734 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -365,6 +365,7 @@ static int streamzap_probe(struct usb_interface *intf,
 
 	return 0;
 rc_submit_fail:
+	rc_unregister_device(sz->rdev);
 	rc_free_device(sz->rdev);
 	usb_set_intfdata(intf, NULL);
 rc_dev_fail:
-- 
2.55.0


