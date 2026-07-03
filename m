Return-Path: <linux-media+bounces-66518-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aM49GMLlR2oQhQAAu9opvQ
	(envelope-from <linux-media+bounces-66518-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 18:39:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5D970452F
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 18:39:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=U0t6arJr;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66518-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66518-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A84913053D33
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 16:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF22B30ACE6;
	Fri,  3 Jul 2026 16:35:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9563030676C
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 16:35:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783096511; cv=none; b=Jf83pb2man39Eyf47gqSkEJarDBbWcA7t6/7pFbxQOWYA8+fMIfrdRrv+/omq35jfO6FhiiN1S72ZV4HlwPI+U1cTPTvBTEbhJRU7NMxklE4I8lubvNo639VlOd3NhFWJkviBacm/h/k2ZOexTTshjouKwn+JqzQW5v+R7ygkJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783096511; c=relaxed/simple;
	bh=WdeqKTbBw0p9IN6WCIHfQW9SJlRN9D8ekRRYYDXPGYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u8NzfFIwHPgT6wi9TkGrvvkyqjlx/NcjK1nps6k/BlWQ0FH4Z7sfsS4NHyw0HczHCKkZz/Bw0DKii/Ylu9SZyBPIk5IPKqp+nhuOsepVVz+hI0XDO55g3gH79W0czUrXW1fgltKT9L/ST0AySsvJwteyXp2Azuftf3YpJ1awWuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0t6arJr; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c83474ddso7173995e9.3
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 09:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783096507; x=1783701307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ELIgzqdNSMVVWgszVoq642vcRbk3MvTzwUI4sM/DChA=;
        b=U0t6arJrWrNySAOsulmooDTgY5VjIUfVjjqwQsOXjXfAvMkaaFxeFE9zZTo54OGIxP
         VgzG1+XNNVydfLOQs6gIQjRv758XTsgIlUsHw1QrDxM/0mx/lQ6a/rqL8ICDbmv/LC05
         q1X4IRwgLahxvKhgTHpRiGtMGKks4I950npo498a7A4SEkPUuuR/UpxxbAFX4cO5492k
         v8GgZKIUG7T1kn4B/My2R1UQmbEvzL7VVpAu1LWTlMvUCS8l1dfsXgDaCnTO1NsUglX0
         cp92xE+jY3BSsJEDR91bRCbkeemadUQqBdQhP3oynQORvZ2lpmKQuXOMLkmMXQgLnWDU
         XObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783096507; x=1783701307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELIgzqdNSMVVWgszVoq642vcRbk3MvTzwUI4sM/DChA=;
        b=SagHBC1IiM+kb0gQckWRkwteBCTFdgCjxNoZAeiK8ZAyy04bEy7lGSJ9Fkm4DtcKTW
         kgilTsqgnNWq50AI7mnBTNwGLx1epyF+8VHTkJJKjvIhTR1UvVYdJDfeqZ0BF+JntZVS
         h9p2Lo7R0AAjlFXRMMxFkH5tSdOXRvw69NC6M+SdZ0oqu2KM+AM+k2hryLXNB5AypR1k
         10MyzS6bVEdehmhwS5MFYMySL1E0LMSRww/OC4NTj2XnmU1Y8HtTRV4wOVSiMHp6oQFl
         a2/E6mocmmhM4u+nX6Qk78y1ND4LvW6acSIyJWmkEt4x/f8f2XcrIPD0AuB1P0WSEhAu
         z4tA==
X-Gm-Message-State: AOJu0YwD6BnNz0e+o9PdrjEWHqvh1kObhQUiJ3N4YT4eLoQ0qSRxnkgw
	imclHTXH1r7N6e081z8KX7k7T8nhPFgRdiYe3Wb9hwgfhqz2Sj76VoLt
X-Gm-Gg: AfdE7clby/R+6tfuHGSaozcBIN63ydS9NDAUnoZPNiyf+djasiUOQ45JXGOLKuuCRI8
	f0o9WN/sgBx0bYNYwdzn7P58u72MHisJ+tTnEHliflPMnp8iiSHS8Bhssrb8pe0oemsNiOpWGii
	6RWhqbOHZxU4upPmEqhNuEFP+jlnUvIOw3fE5fuyy4vZDv0WwE1MMBPHvAzmWEyKPouhlwRlWdm
	bjG4kEfpLcQaUYYzTlkCUfGGCqR5InK7vhnd4g+NKS5TgOB8hQIoe99pTI3Kvvd7RZkZk1Lei1d
	VG3yAyhXmlBBSn+QUHQMzi8QolEOtlBQse1n1uGYO277YxS3lnHsvb4iDL71Nz/dQVBma5celyV
	QWb8rn3XyEWLAArCDRrs+BduY5JyEOtxJtUCVJiFWEQjHFMtRomXGMv3fvu2HDzg6b4Tf2JRXpE
	oXSJrprTZqdSmlRPuXQZaeH0sHaZ/DIOzO1IC69V/MHHcMkMBXrn/qINJXNXYi3lwQbxQbIjIb
X-Received: by 2002:a05:600c:314f:b0:493:cfd2:cd06 with SMTP id 5b1f17b1804b1-493d11cef20mr620455e9.6.1783096506606;
        Fri, 03 Jul 2026 09:35:06 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm81986795e9.10.2026.07.03.09.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 09:35:06 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: mali-c55: Fix clock leak on reset deassert failure
Date: Fri,  3 Jul 2026 17:35:03 +0100
Message-ID: <20260703163503.715606-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66518-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devnexen@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF5D970452F

__mali_c55_power_on() enables the clocks before deasserting the resets,
but bails out on a deassert failure without disabling them again. Both
callers treat a failed power-on as already cleaned up, so the clocks are
left enabled.

Disable them on the error path.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
v2:
 - Add Cc: stable@vger.kernel.org (requested by Jacopo Mondi).
 - Collect Reviewed-by from Daniel Scally and Jacopo Mondi.
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index ee4a42674..fb81141d1 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -699,6 +699,8 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
 					  mali_c55->resets);
 	if (ret) {
 		dev_err(mali_c55->dev, "failed to deassert resets\n");
+		clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks),
+					   mali_c55->clks);
 		return ret;
 	}
 
-- 
2.53.0


