Return-Path: <linux-media+bounces-62501-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB0XJhUMD2omEgYAu9opvQ
	(envelope-from <linux-media+bounces-62501-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:43:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF955A624C
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B4FE307A7BE
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 13:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CAA3DA5B5;
	Thu, 21 May 2026 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5eJpyte"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316A4284693
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369559; cv=none; b=Kf2MbAMIktbnlYTMteFCiLEvI3v8O1LSGOshjdSIYwyd0eVIF1R57TqABGWVORiG+ARAjZ2VRQD6cg9AQVkST/ewiAeni5GmkSVbBITAaG6ayXRw7Sq1vDUH8b2mYRa3+eo45/ySKzy60bKS5ZovitXHcs+u7BrOEAqKyDhPpaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369559; c=relaxed/simple;
	bh=16QY/QJzWEjPqahS/pj9spMomkd8qYLLznAV2zSSiSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T4hiffg+x/6OG2PyH3ZUDzNxCQCccKjGXkbQ41Pv9k5cT150I9FLg4g6MWCq52g52v3g7gXM14k1jmb10Slc56mxpTZ367wxMXQYEQntZckFhl0x7tcfe9wAS+4yvCdvk5ITUF4rf/Ei/6+Vbqgr0Bn1Eeed5B2Im8Ow/gefkX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5eJpyte; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so4896333f8f.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 06:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779369556; x=1779974356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b7bRKatPZuRsf9MzYE7O4zt6PuUBozxZsH88W9EeXPk=;
        b=V5eJpyte1mwszBLZZ74Ux18+mqm1XAXJ61llhNvN5HV67dz4N1J8Rq8S8LsnSwLQQr
         UwsoxkHpbMmgYUPP2ZCMqRcQ5vBQEv3qj6JKr0B5DlS4lXkoChayw6zxzQtjJzT5yGTM
         ZF1REhVP5lypUHpjz7j1RIqnIPyUSIhJ5uSxocOL3PGgcv5K4grx3ZEflts6smOLNvcV
         jFuictEfOWlD9CSMF6/vWp2DB33u4KMgVxQ44qNOs8oZR23Q1rHasqXQqRmyL/rf3itz
         uYWdGExSN+lCSZbh3q7ZVcwcxxuBL40aw15V1dxx9/Fv3DxHMBJ26ATaohfDMyjbUPiR
         EzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369556; x=1779974356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7bRKatPZuRsf9MzYE7O4zt6PuUBozxZsH88W9EeXPk=;
        b=NgnGXGka/DmBWpF+JZvzhIl6GLEqzNTnAirgBn8O8TmWcPUMYRUGUHU36YM9IZdIZq
         OFmXeypjNuD8eIDNoa5XWspJfsB+Ye6LBtNI4OMS2x54u7u+T+iUqeIuEe4aKg11Xfgw
         Wwt+ru0G6rCEBcp10EyCZFFgFO3xfe9rQhQkhf1Qt6SMB2o8mTldGqxEjWc0WeG6GEMs
         kX/GoWZ668Juy/imHmHfmpN03RTZe4SuAVePNVRxAPx1u0ktFOnE5aKh9pX8NNUcHD6J
         2as+4PkgTcgMEHDngAbFUbx+t1BJfiCnn/IZrlbfb2BHAmfnduSML5oew4RWlkk48lKw
         yJCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BXg+fSAVYuKvTrGpOxF7L2hLPdGulGIKKGeN7eVjV0oBwB2i3IBpQDIZr6uwD+qwBdWmVMDZq4s2OLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPTHXet3wMMaJT4FiH9BxPIKE/cA67of5ah85vDNCuao502Lj1
	BrWTD9/Id3VTVUODb4a4rTDU7XEcTyEjDI+rSSPlY+9iBRhsj3gLTXWw
X-Gm-Gg: Acq92OFTf1LtrhNNb5NTfv3YLGgcmPRCsoFTTWbW0usXt1amF2+U+YXVhffmI6e1OfH
	31qwo5Rtjqtu+yagJfQLCnVjyNowLivT4U9zPN0uB+6wSreBotw3J/13wgWMi7PLbTRYJkoUqyI
	q32R8TlcuzzQIuL1CFnDl49VPV6fa0/FRad4I7WXnMa9ErpOWN/4yugX5/JwSaGBQRmwK4YMX4h
	UCerH+x+Xn67neQkZV+o8PgtwtoCDLuoPsyZniW7LtmpUNrXsJzCcq+2U8AKgdlwUCcyINaz7As
	gO4L0RjBhZxNgbLPx4uB9sSReTE8IoXrn/4cLM/wZdc5u5+qWT9ghaT1nvSsmK5T3S8Sc8Pcy6m
	3BzOAuW5XuzsWu7V2tAD6ajCaZlxGGTojxeYmoPPHvsw4rl8iUJEFbOr0yWd+FJ6RX+kjOLSOVY
	jMpuyJmYJ1D0uOhsPjqmSSXwW6JEpUOCJzlIA3hXH9ceAK1kfaI1F8h2vIs4VxCNGsMTHcmryAw
	DQ09AgFHgg6WnKEi5yW5AeSjTlmA7JzxPlwrA==
X-Received: by 2002:a05:6000:26c5:b0:45e:739b:2750 with SMTP id ffacd0b85a97d-45ea34955famr4690762f8f.9.1779369556319;
        Thu, 21 May 2026 06:19:16 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e184:549b:e5bf:ab7f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cd815sm4163164f8f.6.2026.05.21.06.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:19:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH] media: rzg2l-cru: Remove height alignment restriction
Date: Thu, 21 May 2026 14:19:11 +0100
Message-ID: <20260521131911.92845-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-62501-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5BF955A624C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The CRU hardware found on RZ/G2L and RZ/G3E SoCs does not impose any
height alignment requirement, so enforcing power-of-two alignment on
the frame height is unnecessary.

Remove the power-of-two height alignment restriction in the call to
v4l_bound_align_image() by changing the height alignment argument
from 2 to 0.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 1ab4b4c1745e..8d8103c51f29 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -843,7 +843,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 
 	/* Limit to CRU capabilities */
 	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
-			      &pix->height, 240, info->max_height, 2, 0);
+			      &pix->height, 240, info->max_height, 0, 0);
 
 	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
 
-- 
2.54.0


