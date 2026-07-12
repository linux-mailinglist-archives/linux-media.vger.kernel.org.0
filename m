Return-Path: <linux-media+bounces-67400-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LRSeOaOCU2oEbgMAu9opvQ
	(envelope-from <linux-media+bounces-67400-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 14:03:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7F5744957
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 14:03:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UqULyHvf;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67400-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67400-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07F3E3046364
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 12:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8D03A873C;
	Sun, 12 Jul 2026 12:01:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ED13A7D98
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 12:01:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857717; cv=none; b=kaYsj8BSvwxR1JGt46y26iEF+q3jW73N8NzLZ+uFF/AmeLEDcnvk1usPKsAfIbnjc3ilDSxtBUIFFfDvj1iubyVjupNnDfh1IWUROfT9nkBd6EfFnc5Lzo3HTGL47yujqlVy/1o9iVjQXaBRo/WiTwihcehZHlAKV712SRpywGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857717; c=relaxed/simple;
	bh=Kjr5ogbbV4n039dsRnrCxc7VLP1owCEvcYUwwS8haF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bYEtMLCEIxbU3lex4xVtUhd4PtYictYgBGg8zzJm8oC0y1ztaO//aa5AKG96NQHphfHQ0Ec2xVO/FXgbNLZqk7aA16YigmtG9MW7QMxerol9SULTZGktLj/n+5O033Uiid/1BBI3FVtveJVt7sQBoJ43yCCoZdz87ziP8v4hoFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqULyHvf; arc=none smtp.client-ip=209.85.208.174
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39b51882d71so18014761fa.2
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 05:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857714; x=1784462514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYdGlbgDa+zSvwlcX7ZI2NcK0ly4NmG0VALpN7JdJFc=;
        b=UqULyHvfx+nDufu88EJvcuPL8FrTbOu/Co8c++nQE7V6ww+linrPCze9lLsThV8JL4
         EQsCyOJ4oSAuTuD0UCQyN3S5KIg91eAZGVGupI4gyLboeOetj+dGrZZf/xgsD6n7y5xi
         DB5R5kKQFSPJhYgcn9qcYMxPx1dEZql7N8ZKA7a5Qk2tBVI07+jPclTPMdGkrFaIa1rF
         WuUmwjxg73KRfsMDwOnQvyu7nTeujnERO/Qa5HRxrZXsphDn2x44jXhd8orT4kK3rHLz
         Mpt9VK7ohDeHjSlea0vRBTgXJ2c4/99m9zRW5S80Xus5lbqsSvMoeyKWsgDGwd4Oj7Pe
         tAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857714; x=1784462514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYdGlbgDa+zSvwlcX7ZI2NcK0ly4NmG0VALpN7JdJFc=;
        b=NSNzEUrrjFZkKhkxRcKZNKuXbGdENuvWRaKjtc5hCy3fKp27sS7Uqxy1bVmwYPphUy
         geQ3Ij/pSdObiHalQWdDLT85CuC47zYnz6m8vUf47tsUM+iuGT/YmUBQSPjx9qSTh4qI
         Ow07zAUxmsDSj+V+hAiWaN6jmCiEQbGwCmtaTVR3cPYMJJDoebb5dfkZWFBd74//R0Nj
         D0gLraoTnl9gX+yP3FS6EKg625uTLFUM47wjqxA6USmY1yawZw+95y/wQWIPs/JJM7Bj
         sGZC0E4d1luo64FIakd8p63BbZ3xCx2MbuuCU5m4MxmI0zoRImpg2irevyEJkGMji+v/
         nIYw==
X-Forwarded-Encrypted: i=1; AHgh+RplcIFPGsoDk5ZKQkVbSepzM02ADwjcC9YsUke8I4O1zvYGI/NWctcVvcfoYFzlPO4u1MSf0bPzvDzGbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTV1XoGYgcWZiSaHVmfTn44imEQZOqJWmqOf9+BRiBkYB6WR0r
	DLMnf2/TcT2gNHkiLm9rwizC518vnWZySr7m6MYMfQwzS7S6igGk0VBN
X-Gm-Gg: AfdE7cmZgcmby5Jfve4A32JRYE+M+ejlWlOLYeh2vIbTnSN63UQua2xV3ZyrnzwNQ5Y
	ZBEPPb+PCSzWWdPjOcaAT1r9ZSrrPkwEbAunWjT7U7F/Qi/FkuZZohe4QdrlJdXTGwN1UN5kFz5
	pS5pLPYIkb+Hx3LUT/pIR9A8EjNSxi7rfOvuY5PH9F2qaMuX+5AgO/GeuwXXfrk6Vy4I1ZzeYI9
	gzzXuBvVDl938FokZIic+j0hbslPNWgHZ8FKvNO4WqQt+3ibbolBBl1ttSQuDz+mmyiyf3+2Xhm
	5DkaBWd5VFxa4ib7PZ/6z7w/qPw+pB7nLamhg5vqFABHGiKkeD65tQB4v11Pl4bTC7zkly+LoFY
	wAqmX86PljzqbwpogMpctIHZDpAEBFB7zaqbjfGKb/jv9d0FeCmXi9vOjaXrW0NoBA2aMo9iZMj
	M0E4tFyXk=
X-Received: by 2002:a05:651c:1687:b0:39b:53f:bf61 with SMTP id 38308e7fff4ca-39caa872522mr7335221fa.20.1783857714514;
        Sun, 12 Jul 2026 05:01:54 -0700 (PDT)
Received: from linux ([195.54.40.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84ba1b9dsm21339001fa.35.2026.07.12.05.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:01:53 -0700 (PDT)
From: "A. Kalimov" <erqeon@gmail.com>
To: error27@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"A. Kalimov" <erqeon@gmail.com>
Subject: [PATCH v3 2/2] staging: media: atomisp: fix function arguments indentation
Date: Sun, 12 Jul 2026 15:59:25 +0400
Message-ID: <20260712115925.79047-3-erqeon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260712115925.79047-1-erqeon@gmail.com>
References: <20260712115925.79047-1-erqeon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,lists.linux.dev,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-67400-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@intel.com,m:linux-staging@lists.linux.dev,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:erqeon@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[erqeon@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[erqeon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F7F5744957

Fix standard checkpatch indentation warning in atomisp_cmd.c by properly
aligning function arguments with the open parenthesis.

Signed-off-by: A. Kalimov <erqeon@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 81d0afae8..d741f4f04 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1883,9 +1883,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 /*
  * Function to check the zoom region whether is effective
  */
-static bool atomisp_check_zoom_region(
-    struct atomisp_sub_device *asd,
-    struct ia_css_dz_config *dz_config)
+static bool atomisp_check_zoom_region(struct atomisp_sub_device *asd,
+				      struct ia_css_dz_config *dz_config)
 {
 	struct atomisp_resolution  config;
 	bool flag = false;
@@ -1918,9 +1917,8 @@ static bool atomisp_check_zoom_region(
 	return flag;
 }
 
-void atomisp_apply_css_parameters(
-    struct atomisp_sub_device *asd,
-    struct atomisp_css_params *css_param)
+void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
+				  struct atomisp_css_params *css_param)
 {
 	if (css_param->update_flag.wb_config)
 		asd->params.config.wb_config = &css_param->wb_config;
@@ -3893,10 +3891,9 @@ enum mipi_port_id atomisp_port_to_mipi_port(struct atomisp_device *isp,
 	}
 }
 
-static inline int atomisp_set_sensor_mipi_to_isp(
-    struct atomisp_sub_device *asd,
-    enum atomisp_input_stream_id stream_id,
-    struct camera_mipi_info *mipi_info)
+static inline int atomisp_set_sensor_mipi_to_isp(struct atomisp_sub_device *asd,
+						 enum atomisp_input_stream_id stream_id,
+						 struct camera_mipi_info *mipi_info)
 {
 	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
-- 
2.53.0


