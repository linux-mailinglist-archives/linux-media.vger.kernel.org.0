Return-Path: <linux-media+bounces-65260-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BTeJJPETNWrYmgYAu9opvQ
	(envelope-from <linux-media+bounces-65260-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:03:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 184616A51A2
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:03:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=P2XYjoLs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65260-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65260-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77057306D84F
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA5C36A36E;
	Fri, 19 Jun 2026 10:02:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B0D35E931
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 10:01:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863322; cv=none; b=NTs7EfAdHcg8pWR6UwZjUHsBjNVm4lx+WFmLdc6DaQlW5yHndQmC823XzDkSUnkL/oNQYQ+6VLjDn65EK1TI9LFpSK9TCtbCghWpGYJCypn1opIvKvqNT1D1j65nDTdhDJBoOL+Ydg4Is70tn5IXh9Ge0Vi0BGw08dGQ8Rhx9hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863322; c=relaxed/simple;
	bh=i4mBeWBtfpfFt0+P0JhD6g0u5BxiBJ0m58jRImvw8D4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4OdKmWy3BH4NHRIzVkpR3pZ3AZt1/rs1/+1ZfOF4RypbxRXzvWm3gpBGEd1+Qum9Peh4a0iKzIzv3P4lAIbsqsLiS22H3nQKxL6XF1hdvNpUZh+07DxfI8xIgmehrASeqakVrya7T1ih7peDx5EWlG3pcuaJAnqlsgRF2+rEgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2XYjoLs; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36dac5d5d05so853154a91.2
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 03:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781863317; x=1782468117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDYXTJeseYyGOGrxpNPIxZFKkJNyk2IK7j2sW6AK4CM=;
        b=P2XYjoLsxYKqMlu2pYBIHYRtZDpPbegNtMou3dQxGdFAIVIjnKUyNgiI+wW+4pyjuG
         soj1xecPXchTJE0MqcHPfFQnBq+9/eGlLHVaU61d9yUyM9gFE363oAtITCAQE6isrRNT
         /8t8DrY1AWPCLk0onzRTncAxtvXn0/ThAs6fQlbg3ZZcVno3kG5M6EGpzyTA1VycNRBX
         dg0MLTEzyzji+Pmv9bF7SIqfDk+tyRRRyr0HMAWNHOPP7e23nU5J9jFlYeSyUFr2Ojep
         uR3uUyse3UkeWiJ4L06TV+WJpW5Z2HmUM69gnoCDEFYbVHHnLuFtoBx+JkesJeY1DEy2
         fBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781863317; x=1782468117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tDYXTJeseYyGOGrxpNPIxZFKkJNyk2IK7j2sW6AK4CM=;
        b=L5NgnV112f2ewNS+YaGDKd4eIATlcDnuQgUW3dBr8XtDg8tWflVi0S4Jxy9JjKNlAn
         m5VY5Mf0fS9czsHke76nDJCtbdpO7ZkYmCIeepdKzj1Y4F/AqKNecWDW6yP+1XpDvuvy
         HkZ2/hnohq8KG069NmYgobhdKjQy2u97KMUphTGGXH8awSM1IvYWUqJGPUlbllSb63G7
         Rqk0hYqkHPtJu5kz2H5l2wLw0aZnvo2AL+z7X7ZtwQFAH+MXDZXZnNfZ8ZX7jEKC3PLx
         iNjGKc9Pt5pfJBtliYOotGjuVFDGyqjyhBVD0PxS/DcJO6jSEXqMRSn3y0npBGDgup+N
         Xd8g==
X-Gm-Message-State: AOJu0YySvphgonIeRXMkdX0hWhguNpel+930441RO9plBhvMKbuYfRbG
	nahvXnQVf0AAOGHVqMXX2gy1XyW46uEZF4AfqSB7ektSnuOqJk6K7Xb8ObyCM3Qm
X-Gm-Gg: AfdE7ck+Sw4Rk74GjVuX6Sxd7yI/OxwqPqp7/yjfAUq6oSUFZN6FdKu6OYXPxaIKUOX
	eGBNiCuaDqw7HsaQezcyZBYaLTRb2VwHPbO3coE9EI0NC0P2CkICS57IWo4O2rr9s5VJT9DGoe7
	DM2d/jI48eg+BKPNtsS83c6d1LVA8Fetn2K1/ekIvMNgaZ23VFTYjpDjykxDp0je8S8xldgkFBE
	u3EY2coAyoY4T+66JUizqbe+RD854k0cm3rqmVlPwKPJe+zhViUTVBOdT0TQ65wiHX8kQJI4k0V
	eDYsNCXbMmzdJVJ/O20qJ0dH0zw19b2u0Aa0ieMt5npFwIAB7qZ+7UtwanLOOxb39YMACRwk0x5
	eRFfao9YNOQh8gbyqVNjyt4OTVABeW29S6Q6RJw4GYKD2aaTHqcQY7y4pfRMgX33PcO0LjkXl1A
	k8Im2zOkJFIiyNzhi5J9mb1ZDPzaIUjgvkQEWv+llyAg==
X-Received: by 2002:a17:90a:e704:b0:36a:7c8f:1423 with SMTP id 98e67ed59e1d1-37d15df1ffcmr3620570a91.9.1781863317133;
        Fri, 19 Jun 2026 03:01:57 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1558b599sm2340902a91.7.2026.06.19.03.01.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 03:01:56 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 3/5] media: i2c: msp3400-driver: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 15:31:30 +0530
Message-ID: <20260619100126.22197-10-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260619100126.22197-7-birenpandya@gmail.com>
References: <20260619100126.22197-7-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-65260-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 184616A51A2

The probe error paths and remove function are missing calls to
media_entity_cleanup(). Add them to prevent memory leaks if pads
are dynamically allocated.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/msp3400-driver.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 4c0b0ad68c08..d977a6039e6c 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -812,6 +812,7 @@ static int msp_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+		media_entity_cleanup(&sd->entity);
 		return err;
 	}
 
@@ -865,6 +866,7 @@ static void msp_remove(struct i2c_client *client)
 	msp_reset(client);
 
 	v4l2_ctrl_handler_free(&state->hdl);
+	media_entity_cleanup(&state->sd.entity);
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.50.1 (Apple Git-155)


