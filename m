Return-Path: <linux-media+bounces-59844-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O6eCvOr8GnOWwEAu9opvQ
	(envelope-from <linux-media+bounces-59844-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 14:45:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A107B4850BE
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 14:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 779043036EDC
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E5843E49B;
	Tue, 28 Apr 2026 12:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N3zw933t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB49643CEC3
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380091; cv=none; b=JMU2lP96aB3yS1Mk8erHrsB+CIWpj7pO94GHPr5qU45YKofULEzw/XN0EbiWXFnHTh3IkU6MLBp6gmC424+3RdHisJcsf2uWJx7Dj17YsiVo19h7YuGk2j8XgsZ2F3JV9/vo+CzRBhJj3Z7ANHdB/8y/ePBbnaTZuXSUiZJXE1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380091; c=relaxed/simple;
	bh=uyYaC1lTz0w/nk+wumPROnOpURb8EgSxj6J839JiKk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rrA87dn/DO3zwfB8QzQzDwaGv4eb8KvQa1ibE+i5IEiuyaZG5mtEDwuBaHoErbd4ffQCUzqBxjsphMo8YwoHZcQv4UxjIZjiZ8ybEcLmxVsSJaQKHmF8K7scbeIAdljRw0ANFd0SoBin1aOOeI/VgbPamI4ksd2tsZkj4LzkOXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N3zw933t; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a402b2d102so11981419e87.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 05:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777380079; x=1777984879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8cx0IS1VAS+UenVXpVCneZJCK5BcfnnFJsArKfUIY4=;
        b=N3zw933tA+5IMCDbWTUtij/vFcdEI0343ib0uWE4/CUybiWjFZ+1r82JRiKr/S5KDs
         t41mu64/rkgztmAYWt+aGdLAqlz69qQAw5u4hlpIEeA9WYZGC5wJriii5zfaKuQk8g3c
         dLGmH0gYax2PXMGjr3G7Ubdmjz+ASidAIvtq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380079; x=1777984879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t8cx0IS1VAS+UenVXpVCneZJCK5BcfnnFJsArKfUIY4=;
        b=CkcIqzZ6wUWF6i/+Jv6fJ4MA/6+mvBTBV+x7W190BDkttEKv80IAsMo9uT9FIOUO+3
         Jh7YAsMNvMCfyRMWNqRAkszrORmfsoHCwi9ZOpFQWnQDnZBD1U183oV1t/on+BCmrkZn
         mxsW5aBkasnOKXB+tAJrxt03ehSA272Q2l2whqR6ZJW5gVYd44uLwzHtuIsEi6NB2mqy
         IItkORynLEqwcm57SW180+PT4SolqLk4WC/Tw2E7CwJ0Acc6JRu61bV8Ai8A2kX9D+ld
         Xi1U7HPw1NlUPCZ4WGT8b6CapeAQb9Eozbq7P6e8AR6wm0zfDciJUNh1K9QsyekJwxGz
         4NyQ==
X-Gm-Message-State: AOJu0YxL4htp5yHTnJO1osQ79GY9uKKxgOtLeNSrODzVgQ/LGAAbLFF5
	luPsaCZZIg7DRM6twpKgiip+9NhDaOeMmJ5F+HD1PV8ystzJ1Vx4kAR6rsA7YQmDUQ==
X-Gm-Gg: AeBDieuQRa8PnGOINue4BdaiGus9BxqY1/hC7KxBBzo7wU4zfndJvqTMLPKfiNUfS09
	e37TfmCFAg5HYfqTA75giY/jFxvxFhpq9pgMzDfWvmnBhGCYqK/qEosWEfiLb5gUql8tCmRxpw3
	8U/QZyHyJXWaULvJgPnL5FAVEKTFgP+BsYznDVkLwcXby2jQ8uWVbd1RSj3usIdDJAfPa3j2adT
	JmPviT3DC0UE4kixhKi4a9IsYH9jbdOfsqKGGGcMTnU2GPtW7PCIYEfPJXPzRM9LsB+hlGyu66Q
	IsuYoFerOsRVDOyyChAu4vYY3XEDiggFFwqg6k9VdJA0X5s2+EyRh9OXcGfoFOxeS0IH2hbJlu0
	A+MalUDO3mECByf5ybsKMtdThXTmE93TukuisIK65zuYFvS/4O6RVW9JWeEjceDQDhjxmDaw6vl
	0Ya/7v3Lt3drQee5dBYLbXaI+sMAoEp8nB2xFFAUqGykIy/jmq33+iVLJtX5nDyvMh0kLZqx6l3
	InMKTvUJyfZyo2ZzQ==
X-Received: by 2002:a05:6512:2203:b0:5a3:cc81:efdb with SMTP id 2adb3069b0e04-5a7466234c2mr1158896e87.21.1777380079343;
        Tue, 28 Apr 2026 05:41:19 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5fb5sm594617e87.38.2026.04.28.05.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:41:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 12:41:08 +0000
Subject: [PATCH 2/6] media: i2c: mt9p031: Rewrite a bitwise mask
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-smatch-7-1-v1-2-46890dffb611@chromium.org>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
In-Reply-To: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: A107B4850BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-59844-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,chromium.org:mid]

The current code makes smatch a bit uncomfortable:
drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'

Probably because smatch is not clever enough (yet). Do a simple rewrite
to make sure that smatch understands what we are doing here.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/mt9p031.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index ea5d43d925ff..5c9dff030b4d 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -795,7 +795,7 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
 			ctrl->val &= ~1;
 			data = (1 << 6) | (ctrl->val >> 1);
 		} else {
-			ctrl->val &= ~7;
+			ctrl->val -= ctrl->val % 8;
 			data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
 		}
 

-- 
2.54.0.545.g6539524ca2-goog


