Return-Path: <linux-media+bounces-62925-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLaEEHxLF2r0/wcAu9opvQ
	(envelope-from <linux-media+bounces-62925-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 21:52:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2875E9B97
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 21:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85F6E3116F29
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 19:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A901B3B1EC6;
	Wed, 27 May 2026 19:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XO5zxaDv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86541311973
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 19:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779911302; cv=none; b=D/dbyrAymZbKQGZrf7U/jJ7ZmfCDgyAkoZk6lEP6xNRFuCsh8NItd0A1D5CKIMKrcJSRqNeUDsxr5Tmu9CiRnnqJaACU2P1BNJD96mnbvCYVPYE+S9oDCj+1xEyXthGiNRMEPkOZP5DaIZQ06n0JVvsCjRzkO77Xc/X0cAF1cnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779911302; c=relaxed/simple;
	bh=ls9Q2NTNnUqYE9WFLwlbflCuLfOEy5TVf3Kpig70cRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=au3S69X9GwbyTQgUU1jz8jxeL2f7KCEzsWaK8U0UD+lsd70ObQvrFQisQyF/gBXnyno5rj6QaWGrAbRH1P53SwQ913cvVOAqToGt62MG11rf4BOthMWeizO7cirPvTudQWUaHvX6Rc2vVj1z6yrrDqbLwJu/WEJ/zzEAc+/U7Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XO5zxaDv; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-914c1ced558so275593485a.3
        for <linux-media@vger.kernel.org>; Wed, 27 May 2026 12:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779911297; x=1780516097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c11hqP4/VNZytv7vm7NkzIMTSch4hrmtgsXa84FfdMs=;
        b=XO5zxaDvZ0LMHTjBLddhkLHWvWBYhqL638utXQjFZwtRywTnBEsGZq2zr0jwLYdR8u
         TjlflIt/dKRMIOlPSSWDYt9vi2JjpSDi2gecYh2bO6IAV/fmV5YwIu6Z9/xIHKtDBKp6
         Eolsou11QjEm57zW5r36jRAcrZbUKF8FYikqcHbK9Av5P8vQkvL+JVrN5gOajLSY7cjP
         7Sus64U1cN2pFu5ZdRc6vwlmCH1nWJFGwwXCsoVe0azOIBAcZhufbs1c3vSjxjfSAIg9
         j6O+Vf0+UPqGvgIVH7exyExixOwJNwnJMSXu3N4uDCdF25cETaa7NTOaq9Xo3ccDSlk/
         uIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779911297; x=1780516097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c11hqP4/VNZytv7vm7NkzIMTSch4hrmtgsXa84FfdMs=;
        b=CVzc3QJLd+5+f0dQks7oWnLpXowZ9P8l9AOfivTW9TmW5kiY+7g33ZARlf6OaBU8J+
         h0HD3268yEsrML4RGNSfwYGNCYUzh1j9DS+LQ3scJS7BvxBYn164M6Eh87pf2XLhv6Eg
         Rv4k9MmcQ305WCQezhLq8PvhmtrB1XfwHPVZbxgM8ADNfPzXd7X5qF9CQsAfTDHp6yih
         WHf8SHFJUkNxJA8n97h/MIxZzve0gtlhExO3IrHxUFxdjTnZ9t+1iSb1fDqItJYiuvPA
         WKJdBl8L+Q5Go9HmNmpc2fyLRSJYuoPZcHgwNTvd0Ed7o2ykahf8O2G2E21enfTSXslh
         XqEw==
X-Forwarded-Encrypted: i=1; AFNElJ/tKWX0Uc6Gt65mA1wM48zwS+tvvrG3RCUvc3nhwG06UwMsVfdzE6inPOwWjYKT43NArBMILVPqw3oRTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlITVh5XyNSBWaAaIf769hHTbK9J6upmT5NuEAis2gGUZ0Vr3t
	VOB2Om/4XhEDmTpfCK6qOGWoP0MLpMbZLshD++qe51lB8ypqU0YQsMNT
X-Gm-Gg: Acq92OFhUvi325UusR5DcRyvDxZtij7tqOEqR2GYOGf8w+7ft7w7nXHhiBfAp0sBeVu
	mjtjgV1n/+W5ocVRD4Yc03Ndg9v2/rPkRHZcJyHigCNf6asuLNm60FDp6Dz2t8bLYdtWoqzJdcJ
	xO1k3z6+GJdq/b/KpNqDOCU1m1UItV2GuhdNMGuoy3hmL9X8ATsSL+gycA4Rqdj9P0XMon4vELr
	R0XQCFD+vzTKc9mhfdm2iKf/W0dtqeiDDDOclP6NjKV7ck/eaR96+pU5CzEfF6BZmOd2IN3/mEo
	EbUVPoJAOwBKQB6kQIg1DZUDudvQOUfy+pj6jr9J7A/sFNJ2fWZsKwEN/OEeZCU3yF3vS/6zIv+
	0NnukjorNZzLW5lnopuDC5ActUwoJEzLs3nkZV2Lw7YIlhcNHHf6yrAYPJzcmz+fUIAbv/Va+Xx
	dsrGxzLeD1MpY8Gi9cxB7xm8JlSXcxqZ6SXZ0W9ZcavjqjFdg7WFfwvsw1k1j/vm5QsGsDIk91a
	ipdwt3M4Og3fFGiHOa6pheD2KjUxWMzZYsenml8K3D14e/9snsTjQ==
X-Received: by 2002:a05:620a:2a08:b0:90f:624d:70d3 with SMTP id af79cd13be357-914b4928045mr3475904085a.23.1779911297364;
        Wed, 27 May 2026 12:48:17 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87017a0sm564942385a.15.2026.05.27.12.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:48:16 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] media: rkvdec: hevc: tighten EXT SPS RPS control dimensions
Date: Wed, 27 May 2026 15:47:35 -0400
Message-ID: <20260527194737.1999409-2-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527194737.1999409-1-michael.bommarito@gmail.com>
References: <20260513181922.2075438-1-michael.bommarito@gmail.com>
 <20260527194737.1999409-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-62925-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:email]
X-Rspamd-Queue-Id: 8C2875E9B97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The VDPU381 HEVC driver registers V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS
and V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS with .cfg.dims = { 65 }, but
the HEVC spec caps num_short_term_ref_pic_sets at 64 (ITU-T H.265 7.4.8)
and num_long_term_ref_pics_sps at 32 (7.4.3.2.1). The hardware descriptor
table (struct rkvdec_rps) sizes match those spec limits: refs[32] and
short_term_ref_sets[64].

Reduce the dims to { 64 } and { 32 } respectively so the V4L2 control
framework rejects oversized payloads before any driver code runs.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Suggested-by: Detlev Casanova <detlev.casanova@collabora.com>
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e96..4fd06f4c04db0 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -278,12 +278,12 @@ static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
 		.cfg.ops = &rkvdec_ctrl_ops,
-		.cfg.dims = { 65 },
+		.cfg.dims = { 64 },
 	},
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
 		.cfg.ops = &rkvdec_ctrl_ops,
-		.cfg.dims = { 65 },
+		.cfg.dims = { 32 },
 	},
 };
 
-- 
2.53.0

