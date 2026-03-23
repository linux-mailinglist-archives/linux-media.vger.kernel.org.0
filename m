Return-Path: <linux-media+bounces-56673-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIAfDI0IwWmtPwQAu9opvQ
	(envelope-from <linux-media+bounces-56673-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:31:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 861132EF1D1
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1703302E931
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5522386C0E;
	Mon, 23 Mar 2026 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7zh3Pdw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9F538645F
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258266; cv=none; b=It7VFeR/i7LUauBSa00ArG05yl62hrz6Hcu9lqoZ1tlIjL99eDPnm9d7s88M+xSlT5HWI3puBe+cPSSSY5zH/GuX9YRupOyB4KewO7CqpaVKMI3SfSTreUHEgM+H0h3ho5bOXcOZfu/2TAo6Ezt6+Q1zPvOyDsb0dkwl00Bx+CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258266; c=relaxed/simple;
	bh=lRfKnvbz6HfyzfdpWmIU/4xImoHXJtkyjg6AMlsEER8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqKrVM+RGsdsHc4dys+ItGwWj3YsXKHhmyezqyAmwgiqNEF2LZaNKlZ4mBwfLXivhvX58Keht8NNBrG6xXP/01Ujt/KIgrxGrmMl+8wbkpPPGHjt1p3ctkeGmCzTzfF0FyzBeKO8AnYOzQ2WuKBjXmjtd+fN+nru0E4X8AFYlek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7zh3Pdw; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82a62714fe6so1890885b3a.0
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 02:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774258264; x=1774863064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yIpCenjjsVI7qTkDHK0m1zE/y2DR0ltK5SBk0aYTNq0=;
        b=k7zh3PdwHFAja8m5yxlI9rxCuG7Hz0Aqa+D9iF4xXasHQ6/oQN1ecDwC/42/9CkBRc
         uwkBYsy9tU2r0RD//x8GuXzEyd42R1vOOuDmYviOdeBPlP+7bDdzQTd/xGso1pY7LePX
         F2XGyyKpkYrjkC5p8aFVMnaaqzEk0g4sJnplY/Eo0oPR4jSsmSeYK4z2kQZc1F1etvty
         o9eLj8pmt6eImKcuKwsqko0mUBMitbDPYpVh1GN86rsxF+d1OHSh9oLa1AVV3eW/nG0z
         upABVmKXgg3OD5Q1z1DY7vtT4yaZpvIIKkqITTEo5BUpkpAAJzSxA8nRkUrM/rpSTbZT
         diYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774258264; x=1774863064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIpCenjjsVI7qTkDHK0m1zE/y2DR0ltK5SBk0aYTNq0=;
        b=VJO2LRn0oc/bwf0lPjvwISP8sI1dtOF1MSSfqtplrnOYpArVKnZhHndqGuuDfyLSYa
         KYlNHcwGWSTBEstK1DuLxnldjDU7gYWaLk4ISHujvFhrdrntzWlT+3Bw5NZkfQ0v1Egg
         bn5WD5r7Y4fD/VhvWscVoW6+9wz/TgxyWnW9JhfoMlPtk3VlfB0YiZbtUNWNCSVRKVoh
         f9FNvZqjAzBb9VEVp4PfWqrdJSlJBCFaq71zm4dAQ91if7rCY/RlNtaMIPIE0/PfVyXD
         jlyabpDtyM650ySECTFe80DlMFo4xVQMxlx2uXl32WEtJIM2Ne1vX69JqFDGcMSyDmSb
         kMaA==
X-Forwarded-Encrypted: i=1; AJvYcCWX4zWVhGc9TDewIx43gdlOwnozGupubxwz7WqX9Nq22Dn9dPPlPSXDawaK2tG0dj7sbjdFy0zJLAbWQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxurputSt1QAJ6Vid4PI5P86aqjvGMAS6QQmTFlSAqyMrsnUO3L
	AZYjVSmOf/0NzuR4s78Vlt9LGsALROiI2k3z2UvgJVerJpeWjOwLqBwE
X-Gm-Gg: ATEYQzxXUBeU0JbHX1ZgSAQ1lcxcxj/c3CU0BaH/QQUqs0pDgfNITJn0NFRcPwpUeRv
	WcHJrVEtgFTyVhVJg/ymnghhxhiZpm3upCb1tyqjFmZQqgdC1fW7gA++pjZrSL3Awf9Q/c1zXoI
	gXfvoDRFER32IcVmYpcGRPCv9TsokWb9kEVAShIR4h3d3YPFMIRE5Cl2D+gfF/J3cM8ZnA5Kokf
	RsJrDXoCDWUMseXwa51Uy7uFcXBcFPVyfaqWSVfgCD5dW/lBTrzzYyVZWw4caZzJp1Vb8vWE9cC
	TaLkJ2VXD61BoYVeLSEn/kIYLHhj158U5rxaQXdcamBaqtTYXsHcmgSXqfkF7pHXAkbgMU8VIMK
	D4+4cGjDt7S/7msDnP4gBX1IRmtAor4GYP1ZwgQu57Q5+3dH8MxCczro7F5AfN79+Odw1X+nzA5
	ee49PO+yNN7cU+N/70Skf/I2h4KzBO
X-Received: by 2002:a05:6a00:2e9b:b0:824:3ef6:a815 with SMTP id d2e1a72fcca58-82a7a80b69dmr13719942b3a.8.1774258264535;
        Mon, 23 Mar 2026 02:31:04 -0700 (PDT)
Received: from localhost ([2402:3a80:45f8:9077:e390:2476:966e:8063])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03aa5a9bsm9031726b3a.8.2026.03.23.02.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:31:04 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Anushka Badhe <anushkabadhe@gmail.com>
Subject: [PATCH] staging: atomisp: vf_1.0: fix open brace placement
Date: Mon, 23 Mar 2026 15:00:24 +0530
Message-ID: <20260323093024.38704-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56673-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anushkabadhe@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 861132EF1D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix open brace placement on function definitions and control statements to comply with kernel coding style.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
 .../atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c   | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index 3c675063c4a7..940b5767954c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -49,7 +49,8 @@ int
 sh_css_vf_downscale_log2(
     const struct ia_css_frame_info *out_info,
     const struct ia_css_frame_info *vf_info,
-    unsigned int *downscale_log2) {
+    unsigned int *downscale_log2)
+{
 	unsigned int ds_log2 = 0;
 	unsigned int out_width;
 
@@ -65,8 +66,7 @@ sh_css_vf_downscale_log2(
 	* test for the height since the vmem buffers only put restrictions on
 	* the width of a line, not on the number of lines in a frame.
 	*/
-	while (out_width >= vf_info->res.width)
-	{
+	while (out_width >= vf_info->res.width) {
 		ds_log2++;
 		out_width /= 2;
 	}
@@ -86,7 +86,8 @@ configure_kernel(
     const struct ia_css_frame_info *out_info,
     const struct ia_css_frame_info *vf_info,
     unsigned int *downscale_log2,
-    struct ia_css_vf_configuration *config) {
+    struct ia_css_vf_configuration *config)
+{
 	int err;
 	unsigned int vf_log_ds = 0;
 
-- 
2.43.0


