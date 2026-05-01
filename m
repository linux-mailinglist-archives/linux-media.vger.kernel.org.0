Return-Path: <linux-media+bounces-60128-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPk0InqQ9Gn/CAIAu9opvQ
	(envelope-from <linux-media+bounces-60128-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 13:37:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9604AC15E
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 13:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CF06303A908
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 11:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36C0374721;
	Fri,  1 May 2026 11:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PCDmSwbC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E88377029
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777635181; cv=none; b=Rkx7sj4SzbAQzuoLJnE4594QRkQINIahGXK8EWkLUKCdurybzRiEvL14JTAlndE3uJepJ/woDmcLDE3uExmn4UjhErBQH3+O9U14vTVSvTYQ1akTRdELzKsupglYJlLz8tEGbnofBGjNgZHrEPRlgBvBQwgRzb+9p0DjetpX63A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777635181; c=relaxed/simple;
	bh=uyYaC1lTz0w/nk+wumPROnOpURb8EgSxj6J839JiKk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OaZJXYDSfA7f8almzXO/fklPh7yMjTnkKWMb0Z5X0GJC3/ZMbg5zKBbaECmndEc+E8g58BrFx/PyaHZMfSaw7Um5XoPuudvrWq8b1J1lP5xupF4+5zZHNdBPfqGKd2mqxLgxpu0VPQkHZ0gx8GD+cOLXzpJylQH+lIUDNR1dsxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PCDmSwbC; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a3be187ffbso2676119e87.0
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 04:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777635178; x=1778239978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8cx0IS1VAS+UenVXpVCneZJCK5BcfnnFJsArKfUIY4=;
        b=PCDmSwbCWhAGyVSPuTpr2Ub9I5xgn6RbyRfO02vW3yTYQ7/7J6lzF/6AkOl0lreXu2
         C7YJXoveVTKGvmd/gxTlLvoZRCsv4E/ERrLZ7CAqkUXuL68XDURvZQ9HvuzZgTYocGJB
         dNl1TZ5C/+gxGEroATa7aNoUkddfblq5ooMYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777635178; x=1778239978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t8cx0IS1VAS+UenVXpVCneZJCK5BcfnnFJsArKfUIY4=;
        b=gDEt5hjhaGvkuMLHyTAHym4qsEiM5DMc4LBySffU1OB9M19c0y/oAA4hES7fVMsd9T
         vzpZDLyWb1dtRYX7y8CZql5LgNTKydUBCwEcnEwZWLyrqyF3D8jaD52zNVrig2ixn1zY
         u0+AS5RI9yb5+B2XR8Ylet53DyTsV2uZnkK6jtvVn61/fR86h1fAK9h+blAgOdU9t8Jm
         xSq7hgBggyc9fMC8t7289WpVfv7WLx2xW4BJIaH2wQtQ8Sn5RQqaINZ1XdGHpEfsRHUN
         XxXtciwCjyr1phiBWaUiHtXq4RL+DR4gNiiwnDnAWZCm4ZuYZ7v8ySB7ou+8V96R3itF
         33Kw==
X-Gm-Message-State: AOJu0Yx9EqwaQiWxp0pIHMnTX2bl61GggB8fa/mHgQ9cxbj2EVEkU00B
	jTjTg8YDgRiDm9QWlkm0sb5rJiN0mnnztuX6bYGDogw5TnXROcHXMGDW+UA3XeFWXA==
X-Gm-Gg: AeBDies9uOc7U6LSw9/QRGdxKXjaCyXBj0VgK3uiHR5othGWUXYiGBRKHr6wZiWkqZ0
	TpafMZHZGjxVZThQV72SXhAVjFFwbOkqWD8Uzd0zwqNUJR+Qap282FhVNtwPUZ0olKoXSooQuSP
	KVPNw0nnQwC6E2B/6ot03R2/Ojgm/IMP6i5HDszbE0YUIp/5YZRYIIXwd0uut1OApDh0gJP2uvv
	cpqwQU83AhpxBcbDFJmBlsvgVa+V2pY3nEEIPydmnjelyNHYPC3smfgml357cAhVIMMan0MWTOk
	gSzbg6wZzWga8ItsdF1OUY2OFGCImisamrEgmTsyCvAiZt2f+F6woJEK9DxPVTLFBofOALForV9
	Wv0f0/416fSQm/0B/evMMsoQDYHkV9xYR606Djmjj7F71ybIntEDvYa2FwEazFbqvUi1I4wCJ1v
	rvlBk1gnGRtnR7+MUZ02sMqvdUBEwMKXSUGUAgiblWfKJMXBWAHVwfZ7OBl+aLytLQkYm/XQhEK
	Zh58YoLOEQYVem2/Q==
X-Received: by 2002:a05:6512:3b0e:b0:5a2:c0b8:270 with SMTP id 2adb3069b0e04-5a85274573fmr2057007e87.22.1777635177764;
        Fri, 01 May 2026 04:32:57 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346c02sm429166e87.74.2026.05.01.04.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:32:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 01 May 2026 11:32:47 +0000
Subject: [PATCH v2 2/6] media: i2c: mt9p031: Rewrite a bitwise mask
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-smatch-7-1-v2-2-a2fcfb2531ac@chromium.org>
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
In-Reply-To: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: ED9604AC15E
X-Rspamd-Action: no action
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60128-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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


