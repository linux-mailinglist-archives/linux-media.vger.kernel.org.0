Return-Path: <linux-media+bounces-59847-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB6TAoas8GnOWwEAu9opvQ
	(envelope-from <linux-media+bounces-59847-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 14:48:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BD848510F
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 14:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D98F30968D7
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033ED449ECA;
	Tue, 28 Apr 2026 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="laPv0bTZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1607A42DFEF
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380099; cv=none; b=ggwBtF1vfmPLj3f1buM30mDvrKq/epQv9/vO4qkLw7h2eJI+MjjuizKFts9KHNxU67kvebdZ8ORQowYhabm1mBJ1JhXPEdOZhc6ovPefxh8K9EvHmasFpZeJvvTbKmrgZXdObOUbMQfgrpzx9vzrhA/6z9YE8Cp02kJ4E0FfRFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380099; c=relaxed/simple;
	bh=GwGpe5Wt4f65zgUFFPN3Xc69ChmANQfroRnFxnuMqXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RxZf0a3e82aNH97Yvfs0sybbM4WgBijQhEqAR7Qoi0n5yle1ZXEhAz23s3B81i/JA1RvSO7gAyiUaCFH/zhEedLP0Tl99visNT2/jwryVMFSZhLlY3cPpQFw1JT/mp0YTIAYNwMKKWpBhhr7r7muRUYV+y9rSSWyKw62/o0of5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=laPv0bTZ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a283c44478so17833578e87.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 05:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777380088; x=1777984888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jNyWZOzTH0keZ+Or/bxi1/4rkv0VzTqmw2qXTfXKYk=;
        b=laPv0bTZsWTSUHsKrdkt8BEtSKsLDd6r/8OU07m8YbR5fD9r97wyRcvG+U3v1fLzgY
         SGqe/xwPIVlMC1e697jZDDeRJn0KMICvVp8vWcsDHPZrPDdDlC4X/ybSyKjyNy6+j4KR
         ew1stgf+KvUbsQAN2dG2ObtyH1QLqybTeHv3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380088; x=1777984888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7jNyWZOzTH0keZ+Or/bxi1/4rkv0VzTqmw2qXTfXKYk=;
        b=JqkBfy5n7ck4QyVEdnYs2HNiJgXbpfbK7oxGt98EiynWHwqiurlUQyDRzXE2aA6rCq
         SWkHS5Kgla3HOFo2m245kb2VSQNcZ8r4q7ZNXGOfKBE9b9NwPGQwsaNMlShsk6pfzJpu
         b85F7x2GrpDvJ1H3YbGl+Ht7lx4VB/luJeZtsC6vC4Aco6N+7HhHAzglMkjSpbNKnsgr
         Ah3N0JAIPrOvGyP37OkKqUYi3WYfr6syI4KzlvgDURA9gFbGblPs+1eVBOBwan8FQ3Ca
         pjNXbb2bt3Ku8HZHrFBRPzu/36yXitMX//uWjxRW3XtQHxk4JanFORXEyfm0SJTz7dtg
         v34A==
X-Gm-Message-State: AOJu0YzBHfduyn7ctkQUPU+bxvQnNffGSq8+4gJ5SGAP5hq8QlbU87ne
	nyGWJbPo7j15YLJn2QBGqttZ9ER5uuFE5KFKaXrFB+136jBM3tXTBn+b02q5K4KZiQ==
X-Gm-Gg: AeBDiev76lgCNuxVzpbUGwK02c9BTnqV/CWAmpwxe32lVL355xvT80I+7fR1Mv3TTrH
	3Ow+/uNZZO0M1wkrEihzCoqaohSDdQjjHi9wmVEp4GpfqedFQdqqB9qJlTRYUW+dINytEdQ5m9G
	07qVYDnQRpQd4FDztJBkphjLMhfqCO2GRUSImV5Ka8R87fzsJP62mk5gsUTHBtRN5LATKcbwmac
	ppW8bdvBrZUV9+i3UbHbCJ8BaAOZaA3LXqQL7RJXg4C3wnYCrhv/l9uiN9IRPuKLmdUkuLpapph
	tsQZ4OHIxAu/FqHOajLF8Jl7H0gKmUUPsLafV0ReniGrkIY6xUSHqZtz5v/mzPuQ9pWWZ8RCJcR
	NdmZ4IddDUu0AAXyKxAhTMIi9gfxOmjvDGqC/FEAd4adsKJQd8EDVXitm8dGbw6ARK/DsnrogHT
	yXiu4cfAmsKWvbBUAwVot7FD3Wsw7JeNrX/IlSNoh109j7ql8ThmM+2kbcGk8ru9qVisqMM0MNH
	dmht9P0IC7SB3r04A==
X-Received: by 2002:a05:6512:3502:b0:5a2:86a3:709f with SMTP id 2adb3069b0e04-5a74660cd3amr1254340e87.17.1777380087720;
        Tue, 28 Apr 2026 05:41:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5fb5sm594617e87.38.2026.04.28.05.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:41:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 12:41:12 +0000
Subject: [PATCH 6/6] media: amlogic-c3: Add validations for ae and awb
 config
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-smatch-7-1-v1-6-46890dffb611@chromium.org>
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
X-Rspamd-Queue-Id: 44BD848510F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-59847-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,chromium.org:mid]

Avoid invalid memory access if the zones_num is bigger than
zone_weight.

This patch fixes the following smatch errors:
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index 6f9ca7a7dd88..42d780f684d1 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
 	c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
 
 	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
+	if (WARN_ON(zones_num > C3_ISP_AWB_MAX_ZONES))
+		zones_num = C3_ISP_AWB_MAX_ZONES;
 
 	/* Need to write 8 weights at once */
 	for (i = 0; i < zones_num / 8; i++) {
@@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
 	c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
 
 	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
+	if (WARN_ON(zones_num > C3_ISP_AE_MAX_ZONES))
+		zones_num = C3_ISP_AE_MAX_ZONES;
 
 	/* Need to write 8 weights at once */
 	for (i = 0; i < zones_num / 8; i++) {

-- 
2.54.0.545.g6539524ca2-goog


