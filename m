Return-Path: <linux-media+bounces-64828-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U8XhH1zeLmqI5QQAu9opvQ
	(envelope-from <linux-media+bounces-64828-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:01:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F3B681A51
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:01:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nDKr02sr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64828-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64828-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1244E300F78E
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06273CAA2E;
	Sun, 14 Jun 2026 16:58:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139913C5DDC
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:58:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456318; cv=none; b=OXsto1akXMjEquByy6/eJJFmktsaEm9fIUeS3tAf/Y+Zm9V07EE8v9ANvixy+Bkw7T35WVAXfRxO6pUbwuImMRuv5jBE17PD0gOYL1/SM28jNfviRMjXbRFutaHusaKIjypsr/yvkSam2PPrQAkYbd7wIaZXEy70bFTDAnQ+LbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456318; c=relaxed/simple;
	bh=pS9dj5hZWj+sq0xOxJ1yFaqbU1BUk5WejyxEfxd5tEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0a+ctz0jXckTMhGmB+kdhHyTLkLZZ/jdZC1QQ62Mb3nwY6UWdxUfa8eqIfFe34SnC/3hIQESIEQPaenHb8e6+YTVZ4y4+UqtiKXX9tEGc6SfWyyuKWNiQ5MTp7tn9enLf/YZuQ67j0u47bU6WFIzH1qb4kGBWaz7Zm+/G8ud94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDKr02sr; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf2247e38eso23801285ad.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456316; x=1782061116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjNYRCBlo4UVyQJ3qh9HAQ451p2iR7Z90Yo8VcpsvLc=;
        b=nDKr02srQ97CT/nB+lnIA4RLsBghZFok84kA8o6sZveQFQs58jgnGbaw1gS3ZYiSzC
         TnLSNxWy3HEhvEBUt1spGklLetOGA7SAGXMpnLHy5pvSPeN9AUh2JnDXx3Ef+X4VK8vn
         HE81bqNzVKbE5MOFEI/CcKJ3RdBjoAn0RoQRMreGY6u352wLcPwr98e57bSNsGPwQHi5
         EtmxNqTbHoDlLBl85q/1l3ViC1aHxvI+3LpOp5P6fe6p3k+PrMNnHKylPzKUASR1P+Fz
         PQu1mrFaa9JNi5WnNMvEcOP9WCZQjAffl1Pw/AMo5G5BYrV1g1My25YkCMjTcvoHFKoX
         tZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456316; x=1782061116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YjNYRCBlo4UVyQJ3qh9HAQ451p2iR7Z90Yo8VcpsvLc=;
        b=FXI3NG2bZr+zMhq5gt5BBhYCWHoqW1dwNRF+0njy1hjdq3CqFRBKWrU30ZKbZKaBEI
         4uLTrzSRmONHvaSUMfnTXiiwg+n3OAm02XaKIuChARU0ml+mYojvAwTt3ZlpWXiE2gZQ
         Da3MR6Pw8SlTi1MVB7nqJLW4rbZjyuqwaycVqUuxbXl2dWgKSTIhALwAcKPFyC7xwWkJ
         13YRYwKx8AbXtf24o6Wwneom23287u0NJV5iYH5LAf/rczoikn0BEuV8IdmKYDhYhUyg
         VxEai7Fw5uzP2c768Tr5VEIPFo8NtF3db+9JK3jSgKj06rkyGadyHLIX+Rt9rwVsrlp/
         2eKw==
X-Gm-Message-State: AOJu0Yz6bCgXeE2W4YFAB9qOlO8Rhj5m4+IgS8mYJd2jwE3c1aIBFdpI
	HfV0C+H0c3oDdx7uoFw6rppwAXeQ/T9JhYT5MD50zgr+1V7OYGX98iVX9Mq8NZAO
X-Gm-Gg: Acq92OHJ0hmm2LC59mCI7BZmpoG6cJ5cNsKBN8tGoT4djV4kqXV0NLUc4hyFf+ZW17+
	+E6VvEZTp4qddc90WKR0AFLgCDwSzvC71jaEBiK5tNtVOLC/+vZ/MMLgpHM3MCYy5jYmDQgmzEp
	p2HGWwEz4M+3IaJZddXpReDKRxUplJeT25t+peKf2SZu6n4kRW6oqqDNh/X8qJ0X0xcgJqsQx37
	CTqF/Gf4B9pdjwyPi1BzSnYinAucWmvREb2ARMqHVT9Cq5aRUDvsAQrrDjRS2iq/Dz1rb1+s2gO
	KqRG+fJ/vLmKB9rxU5P0BTGiFfl8cjouQXl9lIvBWVdMvMBmp4SHVzUwC3VY/vOMtrqxsrYY0uJ
	sFaqCqu5yTd/JLkh5oj3WJDN7x0GqxfRwmu+++UUm2f5v7Cdn+aAr8lYIJn1y7q+ZCOcjUDC2/D
	elDQ+OCLxv2+EkrI/K6FKVuvS796aTqbuj2hUHw7b9kqVZJzOe6Plz
X-Received: by 2002:a17:903:b0e:b0:2c3:5683:9acb with SMTP id d9443c01a7336-2c412e2203emr116783605ad.32.1781456316580;
        Sun, 14 Jun 2026 09:58:36 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.58.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:58:36 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bradford Love <brad@nextdimension.cc>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/22] media: dvb-frontends: au8522_decoder: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:59 +0530
Message-ID: <20260614165630.3896-23-birenpandya@gmail.com>
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
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64828-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,nextdimension.cc,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:hverkuil+cisco@kernel.org,m:brad@nextdimension.cc,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23F3B681A51

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/dvb-frontends/au8522_decoder.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-frontends/au8522_decoder.c b/drivers/media/dvb-frontends/au8522_decoder.c
index 58b959b272c6..9df590603152 100644
--- a/drivers/media/dvb-frontends/au8522_decoder.c
+++ b/drivers/media/dvb-frontends/au8522_decoder.c
@@ -741,6 +741,7 @@ static int au8522_probe(struct i2c_client *client)
 	if (hdl->error) {
 		int err = hdl->error;
 
+		media_entity_cleanup(&sd->entity);
 		v4l2_ctrl_handler_free(hdl);
 		au8522_release_state(state);
 		return err;
@@ -764,6 +765,7 @@ static void au8522_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	media_entity_cleanup(&sd->entity);
 	au8522_release_state(to_state(sd));
 }
 
-- 
2.50.1 (Apple Git-155)


