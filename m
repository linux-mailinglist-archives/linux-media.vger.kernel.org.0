Return-Path: <linux-media+bounces-65018-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jm9UH/lKMWq9gAUAu9opvQ
	(envelope-from <linux-media+bounces-65018-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:09:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0137168FC26
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:09:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kmzpZC1N;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65018-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65018-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61615303789D
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D7D37188A;
	Tue, 16 Jun 2026 13:09:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56C736C592
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 13:09:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615344; cv=none; b=b61k4YL2eRt9Vi6dVU8FTPO2IRmjzPz4XfaiWS+cmKxc19F1ZS65V6mMMZmcnOGMA9vf1szDqOvPOMwu0sQJ3y5CWtiHt2c9OLdVKL425Hmn1tbcm4267Yhp+/AhgU7WxNu/QiFVc4Y0wphqy1UmmkNmHQxO6jEI+7oEsynUmJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615344; c=relaxed/simple;
	bh=Xaqlj4g+M8vR1tkbhx4rU6iJQd5u3ttvSV2g1QMQTqE=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=XB3c8+vHIOYpW5Q8SYjtfFgXh8n6H4h1IMKpa6X3A7au17wjrygqpjCV3NV+UNDVog8nTBOk3bHW2gfwaQl40GN2gnmeCq+xKuawdw3RXoUqVkdKPT6M3qIl6TwqYtQnLv6u7xY9iu6FfhMgnKkiMMEkLXngxhc/4CAwVXvKK6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmzpZC1N; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2745A1F000E9
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 13:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781615343;
	bh=aW+PdojSKFkqCW6TAjpF5CApwoeZ8tOPEv87jo1iFd8=;
	h=Date:From:To:Subject;
	b=kmzpZC1NTqk9uT5ltlPJkulJPZbN8vtV4qrrUFTV5ih073etG5Y9w7rHO+Ju0Z0pl
	 Pm9+7nqQGBU3k58QsB8b6JGpsEOC679E1lAGIxdYRbLbLagEciKc2t4w06CBgaC3qU
	 Na0Skkru+q1gThR4nQndL3G4//E6K8ElKDuvwcFigtPU7dHs3Qv85CLljh9vu4AGSz
	 0Ci9ZbqPisx75rLEMrk0EKFpDNmSZzFckje/MN9mQvdQyCgAFSp8lxvlc9xBvTSktP
	 2Z11RuzJyBLYYWeMntrQbDyZ1Ii6VZ5/5c3AhaXIS+angEQvZ1EKWTpcygfM+0VvFR
	 MXhX1q7rTLLoA==
Message-ID: <30fb15c5-6c05-4d77-9a5e-ec97e71511c3@kernel.org>
Date: Tue, 16 Jun 2026 15:09:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH] media: core: v4l2-dev: use video_put instead of, put_device
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65018-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0137168FC26

There are nice inline helpers video_get/put, but in one
place put_device was used instead of video_put.

Fix this so we are consistent.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/v4l2-core/v4l2-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 5516b2bbb08f..bcd5f066a1f8 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1082,7 +1082,7 @@ int __video_register_device(struct video_device *vdev,
 	if (ret < 0) {
 		mutex_unlock(&videodev_lock);
 		pr_err("%s: device_register failed\n", __func__);
-		put_device(&vdev->dev);
+		video_put(vdev);
 		return ret;
 	}

-- 
2.53.0


