Return-Path: <linux-media+bounces-64811-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9rDHEGfdLmrp5AQAu9opvQ
	(envelope-from <linux-media+bounces-64811-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:57:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF7E68199F
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:57:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rDdPM4PE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64811-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64811-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F0C33009541
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC6F39935D;
	Sun, 14 Jun 2026 16:57:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9133783A2
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:57:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456223; cv=none; b=oBm1DyqyfgnHGOwshwwHPZmR/w143pi7GQ3s6sdUSWu2Gq1T0lQIiIrCr6tQ4Sq5dfBClBcf0fp84p+MjFKyfBV7puLu4iX+f4ScH3/OYDBCcpbbYmUC9E4stH4qL1wsrbv8CKWqyIAsg6JbDm48gDuoSAHhu3Dp3iH68SuDekk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456223; c=relaxed/simple;
	bh=UWqmPBb9lYmUHte5jzGL4bwmzok/E1L2sfK+HjXsU80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YqPa0xpXvFEqDCdsJKZIVfPQK2FCFuSV6UKESIfdSEUWotXYoeXmkP5GnA/56mRzqebq+3wYIC79D6P0HvGnb7qnP3Hnmk6z4JzwWLuKD3gVlYRec0nGNrmV++9pvJPopJlf7CLQR0KFsPKpLBWn51L8qUMwf1g2IuGcaID3ik0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rDdPM4PE; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf237e1433so30948675ad.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456221; x=1782061021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywqQuCxykmaaSjgy3GzHJjbLWrbgi091EGla2oDbBMo=;
        b=rDdPM4PEJF2nVcp3NLE+98PBP6hkKfd8d/kmeZfiBZePc/ToBN8WbHczLQKNccX7UE
         cyDK5mb6XUnvFU1eImR95Z5/SQjF4KtlaMt+A0sb2OQHrqC9ZJXzCAujXQbAIfHy7+zf
         9KIWE1SptK/unCZZ/p8c4YZPztFXdIa1BSmlEFKTblaQkP40mavjp5JkM6EJ78ATDGxm
         BKpIEPT8emsMtbs7nYhuz9KMZ9Sk+1vw/BRWZWBHTDxcw+B0SRTB49KL3g9fPu6p/ZVZ
         qSsHe0WnKlsp1c0EMakYaTtgamu9Bu8C7tITyH/r6EEg0miriFq2fGasATM5pOtAGSmO
         DTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456221; x=1782061021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ywqQuCxykmaaSjgy3GzHJjbLWrbgi091EGla2oDbBMo=;
        b=DDWKdqTHgAGxGLNRuamO8jddUMpQnAiODdn25D7Bz9NUjkm09NHqcMtQI8OHGyBJnQ
         SR/7bdTKs8ljsubfvUckGVQcSrJxuZL69MryULAiXcyn/DxdRhmV4yDH1u/b83Lxbs0u
         lpURdcLuppXROSNlSq1w6jdqEisUEcfPgZovTqPFRFTdXz3O7ZKJreTlRxkPUaFxN92w
         eRQfsZLnEiTPrU5JZlEV38K7IOrLO4MLNr1/6qIEGCIP+V3avNpxy0It3JNn11lfnCZG
         tWS9bzwtp1NJg/eEoQMFNC4MTd+aIDsJ+G3h/OslkAdwAk8219gaVfxG+mKnmcjGIwQX
         m2VQ==
X-Gm-Message-State: AOJu0YySa1SgG1w3VEjuoquPojiZe0S0thSju1TtVtRxC5BxYIgBY/09
	BH8hsyyEnNFxyWVHGU+9+xKnD83ao59FvECJQUxUklA26RJYNig1atBH4efPdBVp
X-Gm-Gg: Acq92OFn/t9SMLwtbMebySWbAguQKU2LWCEUlf0Oh82s0J3tBwGLF0HGTpklCFTGS5J
	N2z2d2kK4f/iRAcDrMAWZ2FpkuEI/fsDKMBH+1Id1ap253AGlNTvZ4kM2zduHf8MxWOk8VapfOi
	pdonslw0hwBtPEN4HCSsw8iH7eLXf1AUwLqkrXNSDG2HnaNSW1KO36IX0sZWIFkm1+CLVzFWSoD
	Davsrw7Pz5VGUc/vehn7AjWbOExv2MJvALT2nvvpyFPquP5cENAMLUGY2A+B181RdFDBMYuuEbU
	Rj2paUIRTV/4g5gawvSp7FevedxXnIMC2mzbaxDdvagv2R79o3YyHOhRk+k4Gyp2wrkFSC5NcYi
	0t5bwnVOlyAqN/m5oLUYSqEgRWrxIAVcKSzu+BBoIWjKap/8bEV6QTM/HieIaXT0C2oAfsZlagt
	nbKxoZZYDCdUF16nyaFJ9ql75nilAlr3SrmsObL1NhkHfwJYbzm5Eo
X-Received: by 2002:a17:902:ea07:b0:2c0:d91d:c3e8 with SMTP id d9443c01a7336-2c41050b2aamr127165705ad.4.1781456221413;
        Sun, 14 Jun 2026 09:57:01 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.56.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:01 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/22] media: i2c: saa7115: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:42 +0530
Message-ID: <20260614165630.3896-6-birenpandya@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,realtek.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64811-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:hverkuil@kernel.org,m:eleanor.lin@realtek.com,m:visitorckw@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFF7E68199F

The media_entity_pads_init() function initializes the media entity, but
the driver forgets to call media_entity_cleanup() in the error paths
and remove function. Add the missing calls to fix the API violation and
prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/saa7115.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index 48d6730d9271..64adfff3001b 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1867,6 +1867,7 @@ static int saa711x_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+		media_entity_cleanup(&sd->entity);
 		return err;
 	}
 	v4l2_ctrl_auto_cluster(2, &state->agc, 0, true);
@@ -1925,6 +1926,7 @@ static void saa711x_remove(struct i2c_client *client)
 
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	media_entity_cleanup(&sd->entity);
 }
 
 static const struct i2c_device_id saa711x_id[] = {
-- 
2.50.1 (Apple Git-155)


