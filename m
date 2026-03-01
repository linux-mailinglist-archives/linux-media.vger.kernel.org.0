Return-Path: <linux-media+bounces-54024-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +k7nDKqrpGm4ogUAu9opvQ
	(envelope-from <linux-media+bounces-54024-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 22:12:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F471D199B
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 22:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 649883010BB7
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 21:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9393933468F;
	Sun,  1 Mar 2026 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2/YJS8t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3CA2D23A4
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 21:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772399522; cv=none; b=JznYmsx6l1qw+d/IFnCk83yBi1dnqRFRoH8w+l8BO4HMAdxSlU0i27HbhRC3EmSeMZTz/yICFlykX7Ddk7B8VL/BZH++f+MEWgNaCztB19FlDo76B09cSJHE4zaPQXogyCrECS/5scu+PkxfzNXUpkKjnEtWqqOVdrZaybqQNmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772399522; c=relaxed/simple;
	bh=RQ+vtHGqIS/AAu8htrEbF8eZ2rf1ifC9yYt5fnDroNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BJ6DO3QVMi4lvtFOMBGeOEvD/z9lZaP5KV0r4gCmrLSgXLYQXnd1SjzyZ0wpGSAjKyeDotiAJYpvyGfs/S9e26S7lzF5ou2Ahz/4X/8P27ZqNvwvLYotfQ8yOBJ93gsjvcV6ug5UlfXPOJcF5Hwsyz+4NV82SXxzp5MTiAeY1s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2/YJS8t; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-389f9895c81so68541581fa.2
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2026 13:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772399519; x=1773004319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bNm0amWhLXAMGz/6/V/oPbeTvN0A1hrQArZ+yuuDzPM=;
        b=J2/YJS8tUPkFL0lQm7DzA8d0j+ptSREw0GL/15topeK452E1XfdjA5yJiqo7IRCfkr
         9noCpGlGxHcGtVNM3/CmDc5mQfgZr/rsrnZQqISqgCF3sNhF3eutRw/xVmBZnFSdhrn6
         +ZpwY2QolBn89Ws8E0iGMQbO0NuwkZtjws8mh9mecwsF2MlJmEG/Qkk+7dIbKkUc8IXp
         O9fMRppx3I9D2YShxLNnFgLN6VgxLDaBAEpRxO1UKlDrXWGZxNwiARVvZ5mdjoma5CWC
         ewBrKwZ0BKzzSu+AF5ihxOj8BftDqMRpVEHQfINv213mPS2M+HomfBr5UEtUqZ5ME0Nz
         lmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772399519; x=1773004319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNm0amWhLXAMGz/6/V/oPbeTvN0A1hrQArZ+yuuDzPM=;
        b=If073nGQftnV61nsc9mTXmKP4YyYTWbvp2nHQTBD7D54P6OOgk9jgw6BDBQ2/wW2xa
         dS8V+L6cv1gnJR2+DJ0k/wp1Ci5wjnNM8w01+QH7H3qW3SZ8ncpDuc/Vr/c1oozvZBHb
         nMZNgLu6RUW9jgZni9YY0PtM/UxWzo1h+5BsskRz42wg5NPCnjw7LbtiBStGbfmDq98M
         Px2EuuceNcf0NSa6vgaaPMP/gv3oDfCMotAW0oBiTe0eVmYT/j6XBGe9cz5JIshB1z1i
         B1Fj3VFaWVen0HJG5eCTvXXh15iciFh0pa81ipp5B4UpajWc9yggqKVt0RGVw5DbALw9
         rfGA==
X-Forwarded-Encrypted: i=1; AJvYcCUKAvRDN3qqiB2i0PZf2V3xjBZEJ9WPuyxmcnIEiCQjGmQilmISLEWea1Tf9mH0bHYFvO9w93S+F5Jx7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+InAc2kUnFdZjrSjK9uaFtsd0Nu20DPazU5ATYZ85aw7tmfzM
	l1A5yhKbMJyYI9Bytw6eeSb4CMwQ761l1ZgVUiKXyeFj2v2+in+iIQUq
X-Gm-Gg: ATEYQzwx1QVyHPs002IiQNA3FzNi/k0JBuiG7bKAbyvyZVRC2cH+P3gA2t6qtU7sctJ
	xbzk+v1ycWQbhhDNKEyTW1UnsyAJ2w6Z6m81RPzaYet0mGfRRDAkXHE83WQIqtxB6vTNsfS67V+
	MTn1Sp340PMK072VvE6jMEI0sH6aFON9xJDxLs8CDqwLsirnsZ5A7ocp1F7Z0LBnHkjrmQuDOmX
	eDywoty4AxSjKJwh5ZQbGTsx2OjLgOHT8+me+rXjrPCVA6Esdl2OlYgUOrHbrKArRYS4bcD3tyx
	VLoP0QZzY1D48xvt/jFO+KxxE8S6ulLO3IOAEy+4EkH8GK7rh6qJih5iLGnzEfVesegLFLuKNoZ
	5f+ig7FfdCQ78/H2eUzptss6g19Wt2JTCy+em27i0QD1bf1nAbOTXXeMpYZ03GPveIeCfmynsNI
	zg3GDKuFiNOyrhep66qiCoaNLPjpaaWcltYWeO5U9l4Zi+Ml4jw+xSVZ26nEvUn3FmAYze/9qzu
	w==
X-Received: by 2002:a05:651c:41dc:b0:386:1ce2:11a6 with SMTP id 38308e7fff4ca-389ff34d081mr73317951fa.24.1772399518863;
        Sun, 01 Mar 2026 13:11:58 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a11a12923dsm659839e87.64.2026.03.01.13.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:11:58 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: fix indentation in atomisp_cmd.c
Date: Sun,  1 Mar 2026 22:11:42 +0100
Message-ID: <20260301211142.3479-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-54024-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rayfraytech@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B2F471D199B
X-Rspamd-Action: no action

Fix incorrect spaces at the start of lines in function
parameter lists, replacing them with proper tab indentation.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 5bc1541b1e40..9d22ec27ea76 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1888,8 +1888,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
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
@@ -1923,8 +1923,8 @@ static bool atomisp_check_zoom_region(
 }
 
 void atomisp_apply_css_parameters(
-    struct atomisp_sub_device *asd,
-    struct atomisp_css_params *css_param)
+	struct atomisp_sub_device *asd,
+	struct atomisp_css_params *css_param)
 {
 	if (css_param->update_flag.wb_config)
 		asd->params.config.wb_config = &css_param->wb_config;
@@ -3897,9 +3897,9 @@ enum mipi_port_id atomisp_port_to_mipi_port(struct atomisp_device *isp,
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
2.43.0


