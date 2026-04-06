Return-Path: <linux-media+bounces-58137-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIwdHkIw1GmUsAcAu9opvQ
	(envelope-from <linux-media+bounces-58137-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 00:14:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C803A7C56
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 00:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34569302F689
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 22:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B2139DBDD;
	Mon,  6 Apr 2026 22:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZV4pVMBm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECBD35F163
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 22:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513656; cv=none; b=V2y7QnqBCgIGLiCx/0tJAg3tkLgFpcv+V9/1lGiUw6muOSEdJZLFsocKZpN6RuMxuUjHDLV0EzzfoUbT+F4Ugso8I9YU3ra7GdXAyO0xG0JYcJb2webrU7ej60rTlhYlG9Nni8QEsiTrR6HuM3iuSQekoNBcSqq9jgQWXj7mJLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513656; c=relaxed/simple;
	bh=IyzDmVjeEnRf6+N6CScLBbeU8C6QP2hQxk/cAXQX89Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ta9zJBtRsnzzeqywhufjM0hLImBbcZ0ThbFlDVcZgsfiSag4uYL4skRUraCKoD8QtwUJNMxGgwaadPQWKYIFWD2hh76QruZD4vbrCUeSY72rMOoY/lr28egnPZgTONY/1YMLEyH6a0oW7kwP7PwSdy9qaAq9CxmWD8OGlHE8+Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZV4pVMBm; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2c981e5dcso4499386e87.3
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 15:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513653; x=1776118453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xs65Y7SOJhiSPJ4nfKCjyK6aCu/upRFc7BfzdjxKzvk=;
        b=ZV4pVMBmyYyxuw/yPJkvYEcTcatoNC0Ujmh0cNVTEAtk1Lf1ckIN4y0DLwTHXIcN4o
         cxwVa/6rqOF8H3LyDLoYCPluFFipkmuSCABlS9T9hGwcvLZI/59TEyDTAs3D/xcIKlZy
         9OTzkVZMTby0KBN2YL7a9O4ys3PoQ3MC0g55qp5tOyiT+bJtpXU4Zzng78tl7no+foZ3
         V5R/mABbvuie15KNc0Fkkz1+C5ZYSYywWyTDu/yq7VfIBfR460s3c9mUNKzco39yAihN
         95+Nl6iNmpJAF6hhBQMbL5w4HlYLZ+Hh7zcMNCHubRfHTElmXScadrMPlgIP4ymuCU/i
         eHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513653; x=1776118453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xs65Y7SOJhiSPJ4nfKCjyK6aCu/upRFc7BfzdjxKzvk=;
        b=n+UsTLndeGmEhDwpnlzL3movFqc9hbSOPsM9A/g8KY4gaC43OkdnRd6kq7q7CjMELz
         AQwxfWchi9ltDQT3NJk8fS2Qm5/I15WQIPH5ApePAbfHWagDLlf0qyqXwgPGp4TACUvl
         i55M9M9/SxI3ImklUs7Ys6r+SJYTyaqTylMP/4Bd64CSA4eNYSWXZr/UWJe1Ffm6j181
         ReDR5R5rQy8mZkB1C5y34ABfNnF1RgXHOCn0grJWLzhRYa66xkTZqZ5IuwQZ/VcyCRgT
         x0xcfwSlWgpOGac7IhGQyhhUcDfp2FLRRe7Xvct88vPwZu/LcBDfBvGgJAtjR8T6pJjf
         Hevw==
X-Forwarded-Encrypted: i=1; AJvYcCV0UYOKN5XfPhm/LUz0XoLoeJwRg9pTsGGEpp7rjTD4qFX1FSxOPkhjrbbnatzMNDmGU4XkCA2B4bWuqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlH1VJlYby/NtyBqLwEahHR7yf1p1C4jooz+EBtMI5d5WqKVv6
	h9uEA78KdJHN3oZOiR/UthV8ZZY9lPcEpkDGhJ5leFK7kVAd98v2CqRh
X-Gm-Gg: AeBDiesU3iAEeNFCfV4ocrgNVzoZwuAo4kkk1TxpS9tbu8gbk75v82vs5K3xbcBO/sB
	mV6lpi2wi5aYaNmr7i2feiK3IjRBHXeARcfxXaSDJKrlEZIyp8vQop9RpgscpNBNvjoFnYuzz8W
	xqaNG6Xpetx42jQZ6/j4liUVUMhWJvPlBEFcFT+4m/NkCkBN17GlDYWJAlp/1PrciY+DAubkliQ
	sm1/sqGR6RqyjGnsxmUQoUQT5PEtUOajvm0/aKO2p+ekK2IFCAvTGfN2t4mfIm01+0bVB/q8VkG
	iiy8CF/c2wTW4Ba3nR7tC48cJTVMOboPGG7BdqKAuDX0gIhkzT6tEq1uCsqKWm4Gvz1xPMtZaF6
	vbJdrXwfhZbnjGQS6xcu6/MRdc72LWOD6EI5o8T4bP7D5hEU+BgDDZfcRg6v17aA0wNlq5kCW8v
	Emag07ge8bBlgroaXOqTTH5EqRnA==
X-Received: by 2002:a05:6512:1151:b0:5a1:448b:317b with SMTP id 2adb3069b0e04-5a337591959mr5666904e87.42.1775513652798;
        Mon, 06 Apr 2026 15:14:12 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc5f90sm3738693e87.49.2026.04.06.15.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:14:12 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v2] media: cedrus: Fix missing cleanup in error path
Date: Tue,  7 Apr 2026 01:14:02 +0300
Message-ID: <20260406221402.3721777-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58137-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,sys-base.io,linuxfoundation.org,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrejskvortzov@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E4C803A7C56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Samuel Holland <samuel@sholland.org>

According to the documentation struct v4l2_fh has to be cleaned up with
v4l2_fh_exit() before being freed. [1]
Currently there is no actual bug here, when v4l2_fh_exit() isn't called.
v4l2_fh_exit() in this case only destroys internal mutex. But it may
change in the future, when v4l2_fh_init/v4l2_fh_exit will be enhanced.

1. https://docs.kernel.org/driver-api/media/v4l2-fh.html

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---

Changes in v2:
 - remove duplicate 'in-body' From: record
 - add details to commit message

drivers/staging/media/sunxi/cedrus/cedrus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff0e2..1d2130f35fffc 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -391,6 +391,7 @@ static int cedrus_open(struct file *file)
 err_m2m_release:
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 err_free:
+	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 
-- 
2.51.0


