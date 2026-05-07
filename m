Return-Path: <linux-media+bounces-60855-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCDEMdr9/GmxVwAAu9opvQ
	(envelope-from <linux-media+bounces-60855-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 23:02:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8254EF172
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 23:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29003306465E
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 20:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABC833F8B7;
	Thu,  7 May 2026 20:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Niv6IERJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BB73382E5
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 20:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187496; cv=none; b=bDuxlrW16Hfm2xauZnARHzBlqdQmsE3O14uTRQBZmbw5vpGV/McKurHD+HxUYwYRnWoX6z0fk/m4nZEkjFJxnsqNk0kP8Fg9wZrPOdisBqSxrQTqiZfl9YS+PmaGV+cZjnmw5DmxIMXcBABxn3oM8EraloV7G7/7YvNoSmeSJH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187496; c=relaxed/simple;
	bh=uz/gROx+rjRO7Y7pLi9uXLD8lzDUoRiVHf25jEK7m7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ssRKE3yx9QGkp1Pln16CN1cPidoGSB5Rhr6iMHkWEu4kAVMpZhOt765dcTdL/1kMNVxEnzDQPuBwGfEV9ksrkX/rKswyArFaDAf0wVIAylSKxfQe1j3QplObDO0jLA6640L9+5aWN3wW8K6J26HtTKZHj+kfN2qXrJWHE80Z5Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Niv6IERJ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38e8292423fso9942471fa.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778187493; x=1778792293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsiVHzLscfDV0/HZD1Y9rxslOuv9oKsD+zQVHA3Vk98=;
        b=Niv6IERJPUAEOnXDdoAiac4Ssp/Z2t3fvstgiqlqsxT3+nnOJCXri7ABwzIGtVIu6m
         87SVZU4bb+MLdPBzJD40Xk/eF46+NxC6ARu9iQfdQbhpyD7XVrANL/FR+dTxntqreSfm
         mL0cXYyg25jWZsk9k+klLuYsRH1oqGmJsK38Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187493; x=1778792293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wsiVHzLscfDV0/HZD1Y9rxslOuv9oKsD+zQVHA3Vk98=;
        b=APNvzdNuxDh1k/qmgjcJX+TqNQnK4FziCMLtniI7Qxwzm8GOvJO1tOle/+O9H5b3Pu
         VNnmlOsVzHY3F90W7D90IVYOPH8kqAbTBjlZydnZtbsVlUvhRi5wv1dVuRYbdOkl3xuQ
         MGaiZbrWo0JmhKZt2Ei5/y7+dLR9kcWbFH7jk0Lmk433W3oCPTX4l7eYuJ8YNl9wNLQS
         r7MX+gTtGQBTgnQOaBgUdVqF2I/2uWqTkaq7+xBZFUHW3pVhlaB1Biil5aERiwAeyZVY
         x3qSfuOkNiTcxFhu1uVDbD8EGAdwvldppsddkwkWrpn31kxESvkxuLnUkYE4Sa4TvE9Y
         ggOw==
X-Gm-Message-State: AOJu0YwrJN6KJ39eY5p+1fUO3rjZzW+Lzx+D3KFXdMZ9a7PQfjGJGw4k
	9eyHWs1Fh4HyqIEBZ0a5UPdPX7wL4g9v9wax/Br6fXTTUc6Pez2NIPdnZ9L73wNFdg==
X-Gm-Gg: AeBDieubK2RG0/QO6dcBAv9zN9IO4eYVTd3S0GNyhellssVKI7vnu+YdybczoFLxfLJ
	41jc934nAnwNWp9/RnR7POXxSIo54HZGt83HVka2AEJt+GtgbfYyHkkWkSo1x4NRrhvq/nGizzd
	s2FEbIMs8qrBhIcsFDjKJ+ahUL+inlynQXOTYcOe8YOexySpk6W0obRg2kExOYr/8lNALsIxEFA
	KibEFw24Ultk06e1hDSFnlMGetZEoOrmSkxPfJ9JrE1BZ69EBW44+pwncpZo5AVybmqZ2mgmzmM
	E1UfK89hUZmbPvknr2R/guQGAFqekE6D2sEhGyTvgojzsvx+aQ1L8f4lFfI0eci/mi13H74Llue
	5UrOTqSmN8vDfpj247vvtfTPXA2aedyC37Swfqex5ESXKM3oFbyYg0H7exKmcKfJA8yLSKFao7R
	24WCfBeFPy2Z0NCHVcUsdteLplFn95R9Jv+ttkV6xX/x11cQbG1zj0z+TJn/dHiyQtXFzfkPItB
	shot+w=
X-Received: by 2002:a2e:9bd1:0:b0:38e:36c2:9bd1 with SMTP id 38308e7fff4ca-393c40fe441mr24746121fa.11.1778187493409;
        Thu, 07 May 2026 13:58:13 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393eee53655sm2325571fa.0.2026.05.07.13.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:58:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 07 May 2026 20:58:07 +0000
Subject: [PATCH v4 2/6] media: i2c: mt9p031: Rewrite assignment to make
 smatch happy
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-smatch-7-1-v4-2-cc195f142167@chromium.org>
References: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
In-Reply-To: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 3C8254EF172
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-60855-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

The current code makes smatch a bit uncomfortable:
drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'

Probably because smatch is not clever enough (yet). Do a simple rewrite
to make sure that smatch understands what we are doing here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/mt9p031.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index ea5d43d925ff..8dc57eeba606 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -796,7 +796,8 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
 			data = (1 << 6) | (ctrl->val >> 1);
 		} else {
 			ctrl->val &= ~7;
-			data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
+			data = ((ctrl->val - 64) >> 3) & 0x7f;
+			data = (data << 8) | (1 << 6) | 32;
 		}
 
 		return mt9p031_write(client, MT9P031_GLOBAL_GAIN, data);

-- 
2.54.0.563.g4f69b47b94-goog


