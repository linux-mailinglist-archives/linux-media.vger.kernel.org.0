Return-Path: <linux-media+bounces-64807-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NvB8F1zdLmrm5AQAu9opvQ
	(envelope-from <linux-media+bounces-64807-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:57:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAC1681996
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:56:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=k5GvkAf0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64807-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64807-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BF68300A3B4
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009093955EC;
	Sun, 14 Jun 2026 16:56:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688B42EEE84
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:56:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456204; cv=none; b=BVGx/4sQgXQGo3+hRf3Lho2U/MT8iZRj1ypcsHYEn7sXlEr125GUW3hB9pQKxQR0ZYEOAQkhHJDDiNTOjzsmIaaJ1iNeRYvQNoJjBxB9wYgW9IaNimpwAwD3MopKfgYEHrjl03e5F/MmVjxlUG/Ic0V8uXplLKwHlRausRiiYMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456204; c=relaxed/simple;
	bh=dkJJ9uzMZ/+Wvof2subdudp1ueZI9/fdtBdT0y07Tlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLm8asjdAwXzSG49WjlKQuHH32sL9HMuI3JIYSPuiOjJsdBDAscEE7rQb56MTIDrFQRkprYm4r/CUkBwH3uqDQrNyTLBJEdIpWxRvODVvQIUlp4VOwuI1k9kFyVsA4wLv3tW1Jl1mEXC5+VsQVHYt6tnU87+IFZLVwkOsmxY8s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5GvkAf0; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so19864645ad.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456203; x=1782061003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AVHj6ed8VwyCttBF9dIP58qYaaDmNXZpDaeTXKj2YM=;
        b=k5GvkAf0qqcJ1YZ9xjIfVYOV4udIWIm1UqnTjKpYPjguP580Xu6LL/E6NvG9ezVHUr
         vE2FOitnXLYfpAahrXXktc7054hpAE0YhfPLCUNzWlhjlPEfHrNXQxFss7Ssvjj3z9F6
         PiDjQZucTwnbfrKEoxAeV+L/HeSD7EKWpo9XqTLpMkYR7gQV5R0kGR6heQ/DdauGBvxz
         ZpaYUgvcTwRgtE1wF6hvpGGtLmovvtI+n0o3TEi/SLkOZZIBLObhi7ljV+wChx7YfokZ
         p7cQIDk/J6k82O3cZwwQ9lPw34yZD/Id0IxUjH6QP+5+wFSyjDYJ0HobeKzVAAlLP4YI
         wZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456203; x=1782061003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5AVHj6ed8VwyCttBF9dIP58qYaaDmNXZpDaeTXKj2YM=;
        b=B+vA3Hxa89BW14vftEhLFde+11feN6EYZA2UeaFBRTJV/8oOhn2nAjQsmGBJ0W3GjQ
         eA6NwSzNvuo/sA+/3WDcLCh0qXPSxxB02sySCNZvge6Yrdlj5ZLQcLgeQSPXN2d4Qdtg
         N+VVKqGpiSa8/aAQip1XZpBoirFg6zcD6qMo/kbnK+RwtaTyKvI6miEGif4X4DbTgfbg
         MjZVnBm2nphf3sNlbTLQLxWL7ZnbIjytmgGmZdNjhjjIuJX3FA5nwt/2MkyAQrf5WAtG
         yrcnBy7G5FLUatskRNpvCc8UGzJWd49DwntIApTA9ILm7U8GstxMqNbi4fBm4OCm0+K1
         BiZQ==
X-Gm-Message-State: AOJu0Yw5x1y2dY1LzA2UQe2dlcrMWzszjwdC/8lH8Iyf7zIHAZ2iQJym
	9/yXiD6l6LHtq9XnsaCr67dM+Ofq/B4IsfA30Chv5Jwl1a5kuKnoWN6CecTsCtXY
X-Gm-Gg: Acq92OFwFVm2IAVhYbvLMw7HhmE6koe1q7/7GMsv08nG1n8SQfCGdz0rGWj+HqTT9Qt
	q4w//5DZYmjESGCakYC+bBeCBvILnc1x+1g/7pqrK2mT5wV8w3kTq4PnNwcrofkf3SIewf+JkXT
	UPr4MF4VKvlLM+clW29kjPLI+l2G3al6Yyc5gXqVOLaaP+Qim7HRXiRYOC5DxhGumKn/LVusJ0o
	65fK8bR4V3jfLwD3tNJ/S3Fscw+MyDaSjyLFOsFZAH14WbD9yCRcLEEMXd+2YzMYUVBhfNSJCt6
	AhzQzwpfoCAru7Zed534129fH7KqUJXz9R8Fee8RQaa8xctSHk0JXJB94FFqnmg4LdHjocx3eqf
	y2OJB/HO/H3Imvp/b11dhsty4BvGoK4ssJbwH3Zzqpx/PkwMFB2LdoNoeDDkEoaLTud0nWHJ2VH
	jwUsFJxNv72fVzZON0y86R5TiOtTZM+GtdWH4y/1x5vvG2ZAYQQRiI
X-Received: by 2002:a17:902:da2d:b0:2c4:d55:eb88 with SMTP id d9443c01a7336-2c410cd169dmr115009285ad.4.1781456202748;
        Sun, 14 Jun 2026 09:56:42 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.56.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:56:42 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Bradford Love <brad@nextdimension.cc>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/22] media: i2c: cx25840-core: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:38 +0530
Message-ID: <20260614165630.3896-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,nextdimension.cc,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64807-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:hverkuil@kernel.org,m:brad@nextdimension.cc,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFAC1681996

The media_entity_pads_init() function initializes the media entity, but
the driver forgets to call media_entity_cleanup() in the error paths
and remove function. Add the missing calls to fix the API violation and
prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/cx25840/cx25840-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index 69d5cc648c0f..a3d7473854a3 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -3962,6 +3962,7 @@ static int cx25840_probe(struct i2c_client *client)
 		int err = state->hdl.error;
 
 		v4l2_ctrl_handler_free(&state->hdl);
+		media_entity_cleanup(&sd->entity);
 		return err;
 	}
 	if (!is_cx2583x(state))
@@ -3986,6 +3987,7 @@ static void cx25840_remove(struct i2c_client *client)
 	cx25840_ir_remove(sd);
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&state->hdl);
+	media_entity_cleanup(&sd->entity);
 }
 
 static const struct i2c_device_id cx25840_id[] = {
-- 
2.50.1 (Apple Git-155)


