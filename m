Return-Path: <linux-media+bounces-52333-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFq+E38Dh2mpSwQAu9opvQ
	(envelope-from <linux-media+bounces-52333-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 10:18:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0671054E2
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 10:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85B38302334A
	for <lists+linux-media@lfdr.de>; Sat,  7 Feb 2026 09:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27D630E0D6;
	Sat,  7 Feb 2026 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYtWUurN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45D12E92B3
	for <linux-media@vger.kernel.org>; Sat,  7 Feb 2026 09:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770455921; cv=none; b=mVypgI7VSwkVgCiLqUv2fjXEZVpMawXzI/MOYgAHmUuUCemt5KhZTdKmIwwyeQvY+jRTG3DrcPao9I+yhP7HUQ6NeeTU3tWmqZhqcfG1cnWFSxwelzBhZ13iRwy9zdVFmoVAV08o6HI+tb4fumR+lL4qU1qCieF1bp+7gJfwiUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770455921; c=relaxed/simple;
	bh=Ed5YXu/0utQThGnGpYf8crs4aflH2j7x7y9WfON61U4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rU0ZW/gxhI0a1tekvo654BqPvJcxYPEPkQpBj57MXBXqNhLER1YGQQ38epN9msISwEpgMJSy46JQ9CfvvmM7hsi3Oybh6yvG2DUdekca8QmZ/l7D+g8SpK2TDip/08BrX/39QhTtdi/TAhEyK6QhgjBn3/TCHSJ4wHmIi7fYpdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYtWUurN; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-382fb535b73so26656221fa.0
        for <linux-media@vger.kernel.org>; Sat, 07 Feb 2026 01:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770455919; x=1771060719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/rR7N+AW3Fn5J5DU4HQ3nGD5R61rhSOpXueOZW6cHuk=;
        b=HYtWUurNKSz7oi8lIya2kSchUz+aFIiJbY7NTx0JCtGFhrgIVIrIj4ASxOh17Tl0HU
         pbssJb/OrHefeSMJAu++6G3hasufBE4pcwOzXqaj3qDI6GIy33ghyk63qdrEADweTc31
         tr+PKO9tf3CkRmk86OWSpkSba3MNRvIGN9XaiYfvpPa4sM3koikEdO+AdWmcayL5jeBv
         iUL8WMhPs2r6ZTn2tUMO2MAbPRsDjVAyz8OlWF+3fR69AEMIrxzIS4R8ikIoMdDIxKyr
         HX0f+l89RfBnm5v5dlYCKpIxCgkMYc91lsLy1wTq4GGfWbjtIdu67OjTv0R7FD0qWtc/
         AFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770455919; x=1771060719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rR7N+AW3Fn5J5DU4HQ3nGD5R61rhSOpXueOZW6cHuk=;
        b=Mtd+XE8tmSHvW1Div6gWkyJ1Vej6b0wF3aTS3XEZlkbENQ/+Ww/U5YKpYG+0VnnQ5b
         2gdy8r89wHtoAjHGKKXU47boSS723GkG5cY0FPXhElm2i/uJBau4PTXbC1OHhtaq6RbI
         PTEbJ6kwa5Jb4Sdt8T/Hr4+pSrVnI5DuV5ypMGyIXlZY50yTiGz0Y/Yyu1lpf6k8DRmw
         +Z6oALWek7QSqKCZ1r70PryuBh0CgrtNCJEOZzYvqyO3ULvLktt8yZhNO4OWNyijmrRD
         IJ1jLrfgNyuBmOGVPjzRg2tPrq7UsdMjou8zGx9XJfFsaloba6jW1rI/Q3TCCnWps0ym
         6A2g==
X-Forwarded-Encrypted: i=1; AJvYcCVfaz3uwu2rRxiVCSEJeXTVn4BxUGWWUe1WH8wEN0J7gpdW5ZO0ecQFNo6uvCw84k47GOa3ZUnGFvzFQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOI2KiwuoMfsp0nXQzjZ5d4tX94TQIK3yB9uc6H44yDWPxLbvl
	3iMUIHFFC6lzm3o4wMVnCK7kvFNHk1re4m8qjMHyiqeTKUFoKp3EcjE8yORK/A==
X-Gm-Gg: AZuq6aLKovHPWaLH4AxQlsPCSihfkfRK4UgayB++F2TuUA5vc9CHOTnkpPi56LyZ6Gn
	jN+RkBFnHVye/0DiJ54LeamGYkphjAzf/oai5QMwkfKQjWWpo9fSa6zt/IIZAqHLwLmNqaIj4Az
	HEzWbaKCoApfe3E8vTRvaeeqLuBu1Av8mZRWW67H8qbHXS2VYNNKRvaKJoJbbiQ86lBp/KC3EIJ
	GqMMM65zo6Ff/LdBe9ylWG3DmzhvzvTy0vJ5mO2hvCyBBS8TpYKgU1XeTmdfDFyDhGMsCXAzItn
	jlgdU7fhqZoB3ry10jDM3ofSaaxSNKY+dYETy3OTIDwsbuSfxfzkxb8HVkSJqiP+c3wMFv3ebZY
	qe/wErMurYL00Oh7a1kZ7IjtlJzhieqNV9XMQXgaEa9mS1eGuG1ZiTp6OXHzdd7zhrTxEGJcrHj
	rd2EmZ4CIuPO64ZycF0RTFp1SpRObSuAoBkh4JJPig3rgyE8BZBIEEZeYDdVr8jPTDoeLlf4Mud
	Z+T9Dww4UJPNtc=
X-Received: by 2002:a05:651c:e18:b0:382:624d:a703 with SMTP id 38308e7fff4ca-386b51873efmr18064441fa.45.1770455918702;
        Sat, 07 Feb 2026 01:18:38 -0800 (PST)
Received: from localhost.localdomain ([176.33.64.73])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b640e959sm11550121fa.41.2026.02.07.01.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 01:18:37 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nayden Kanchev <nayden.kanchev@arm.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alper Ak <alperyasinak1@gmail.com>
Subject: [PATCH] media: malic55: Fix possible ERR_PTR deference in enable_streams
Date: Sat,  7 Feb 2026 12:18:22 +0300
Message-ID: <20260207091822.601255-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52333-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alperyasinak1@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD0671054E2
X-Rspamd-Action: no action

The media_pad_remote_pad_unique() function returns either a valid
pointer or an ERR_PTR() on failure (-ENOTUNIQ if multiple links are
enabled, -ENOLINK if no connected pad is found). The return value
was assigned directly to isp->remote_src and dereferenced in the
next line without checking for errors, which could lead to an
ERR_PTR dereference.

Add proper error checking with IS_ERR() before dereferencing the
pointer. Also set isp->remote_src to NULL on error to maintain
consistency with other error paths in the function.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index 497f25fbdd13..c7225e9c8df7 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -360,6 +360,13 @@ static int mali_c55_isp_enable_streams(struct v4l2_subdev *sd,
 
 	sink_pad = &isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO];
 	isp->remote_src = media_pad_remote_pad_unique(sink_pad);
+	if (IS_ERR(isp->remote_src))  {
+		ret = PTR_ERR(isp->remote_src);
+		dev_err(mali_c55->dev, "Failed to get remote source pad: %d\n", ret);
+		isp->remote_src = NULL;
+		return ret;
+	}
+
 	src_sd = media_entity_to_v4l2_subdev(isp->remote_src->entity);
 
 	isp->frame_sequence = 0;
-- 
2.43.0


