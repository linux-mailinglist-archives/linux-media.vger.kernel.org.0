Return-Path: <linux-media+bounces-67341-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VyPJB3z8UWpwLAMAu9opvQ
	(envelope-from <linux-media+bounces-67341-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 10:19:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCC9740E47
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 10:19:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kIk3tQIw;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67341-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67341-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8F5D30342A8
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 08:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB2F382377;
	Sat, 11 Jul 2026 08:17:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F9735F5E4
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 08:17:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783757865; cv=none; b=BpjSqC9s8op8dcxK4yttcLJlt7IpUi9R22FfVLfOvVjneij3Pd11BxTBbHcqw5CK8CrWoBj8aRfS1N2fHwO6Q5/pn5Dr6oIYNBWYwjuCY5N1apTnAAtYxWSqLHJOsK1HM4gZFQH2qOwju3XDg7PSwMXrtryCZ2uO7uV9eM0Gwik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783757865; c=relaxed/simple;
	bh=FwZ7bPbTTmBPzsRAYQ2XsXdqwWS6rU2eFtjqpVlPBds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=siKfk6C6vMwukhGBzfSKXbcL8CTSCBDbWXYdaioYQHKrwdyy0Nyndngu/oWQ16IdBDu53EXxg/TanHAzOTvs9lDLNREF2zRC58asBnXqcl+VGwWQfnfivgyhe/ocw10u7QNbbsrr2PXsgYbFX+FStzUEb5BBluPZt/AvMOgmww8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIk3tQIw; arc=none smtp.client-ip=209.85.208.169
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3997a448ecbso16510051fa.0
        for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 01:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783757862; x=1784362662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYhcW1SCR6GHSegIq0BbrmPvOxPcseFc94iedjclU6A=;
        b=kIk3tQIwu9ylINqSyl4Lwxko6Vm7yFa+Aw5cMTMtcOY2bFx6c5PR/do9lKC3zcqO6T
         xGsIxn7Kzmai/0kNRkrTAMD15dI5LHGPcygFFGpWE1DLw22t7inIap7EmTlZl+hsxujI
         QaGGGpbYenPS0WfRCQQXHvSle0hw/5aQSNBfk4gL4uTk28jjtssxmEnCmXqYingg/XAA
         FFCF7IFnyHDkXJG9CgFmZKvysRvyeOVfVI90Ew9wmXb/Fk1JZxLvQpkgq7Vi15iRC4wv
         21OknTVUhX7+Bt7SottRmIxA3FXllNVpYZIImWB2zwlXDNKR1ya2uT+hLnmlwv7zXMsa
         RqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783757862; x=1784362662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYhcW1SCR6GHSegIq0BbrmPvOxPcseFc94iedjclU6A=;
        b=p7+s4gCurkaO6LUoEWMfmMsnwrxoe169nvCuzj+C/yUOWWKvzOMfxhV45asrvC+SxD
         S/KYnEr8Ip5zvy/EMm+qe/1aOvYZepYaTGzBLnNQjuToMgzP/QhaU7xtWNSD+FhAZPE9
         lovcpdInGXNWhu8KCZy8cOVKAH1HAtoSaYBj/4GlaW6cW9rVThR8LwfkJWWDEY5VAb+3
         +GBj0Ig34V0iD8mzFxMKNJdjNkKSnZ2QTAoOKPR01dtOAImI9JYhCt79rBUo1Y4xe+DX
         4p8BAcxnmRPXrny5v24C8Sxa6SckQ5dfEPJoEqiJhhOSpYUNfXM61gCvkn51XW3Wm1Ak
         X5Cw==
X-Forwarded-Encrypted: i=1; AHgh+Rqafn78c7tLRT7RlDU+pZhH/PyMdVBsuhTFz06QRlkYnavR7YiZ0fIKJsow1okFam1xsDUAN+EoCgO3fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSRW1E6T0iisW9NNeTBndmS4OyChJ/pS5C6vUfcNLMkuKgWDk5
	TfwCvxJIqrttv5OWQchOloOKv3d5Z3cpqm5uV7SGZ0jSVLDCbvFpvP3L
X-Gm-Gg: AfdE7cmcImrQhhyFXwxnT09Kc+kIUr+R1W1XHWILhdfA3Hu/fQ6MgOIWT4rBn4UGPB9
	2AWf/TjAiXxCDqi0NGe1umRmFIK47A4oYqqylaKNLIicp8DDaH5DsDkAxmG59YQPQUyke4IecFo
	yV1ta7PrJgWqS6XVXesXxQf5awL+yvSGkAZ9z4rc/NB7gZ+W0ZZAau/T/iIlc5h3YRKfU93Tztu
	WQ5xq8VlF3jGlbJ0l6GcX67SaM9d1fjxFe/+M5DAtR3kjux2IFXG/5WFc7ffKDonSwZ6TEy7KHV
	Fcax0LcztnEBo5KRonc2Vf/AU72JjVEmtVrgyAJ0OkbhXLI4PrCjtVWRuT9lO8tqXJfqCUD9Sf4
	zGrRMFPo+RDxn6M0qT5Ito3VNloEUW1UQthypj/3Ee7b73H5HdmydJZPC/i7lIkO08aSY4+xw
X-Received: by 2002:ac2:5d2b:0:b0:5ae:ba27:ee63 with SMTP id 2adb3069b0e04-5b023566499mr289194e87.7.1783757862104;
        Sat, 11 Jul 2026 01:17:42 -0700 (PDT)
Received: from linux ([195.54.40.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa5bbbsm1183891e87.58.2026.07.11.01.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 01:17:41 -0700 (PDT)
From: erqeons <erqeon@gmail.com>
To: gregkh@linuxfoundation.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	erqeons <erqeon@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix indentation and remove dead return
Date: Sat, 11 Jul 2026 12:16:57 +0400
Message-ID: <20260711081657.37117-1-erqeon@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67341-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@intel.com,m:linux-staging@lists.linux.dev,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:erqeon@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[erqeon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[erqeon@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BCC9740E47

Fix style issues reported by checkpatch.pl:
- Remove unnecessary return statement in void function.
- Convert spaces to tabs for function arguments indentation.

Signed-off-by: erqeons <erqeon@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9f..fb1ae146b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1419,7 +1419,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 
 err:
 	atomisp_css_free_stat_buffers(asd);
-	return;
 }
 
 static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
@@ -1885,8 +1884,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
  * Function to check the zoom region whether is effective
  */
 static bool atomisp_check_zoom_region(
-    struct atomisp_sub_device *asd,
-    struct ia_css_dz_config *dz_config)
+	struct atomisp_sub_device *asd,
+	struct ia_css_dz_config *dz_config)
 {
 	struct atomisp_resolution  config;
 	bool flag = false;
@@ -1920,8 +1919,8 @@ static bool atomisp_check_zoom_region(
 }
 
 void atomisp_apply_css_parameters(
-    struct atomisp_sub_device *asd,
-    struct atomisp_css_params *css_param)
+	struct atomisp_sub_device *asd,
+	struct atomisp_css_params *css_param)
 {
 	if (css_param->update_flag.wb_config)
 		asd->params.config.wb_config = &css_param->wb_config;
@@ -3895,9 +3894,9 @@ enum mipi_port_id atomisp_port_to_mipi_port(struct atomisp_device *isp,
 }
 
 static inline int atomisp_set_sensor_mipi_to_isp(
-    struct atomisp_sub_device *asd,
-    enum atomisp_input_stream_id stream_id,
-    struct camera_mipi_info *mipi_info)
+	struct atomisp_sub_device *asd,
+	enum atomisp_input_stream_id stream_id,
+	struct camera_mipi_info *mipi_info)
 {
 	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
-- 
2.53.0


