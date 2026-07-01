Return-Path: <linux-media+bounces-66194-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HNEqEYH1RGol4AoAu9opvQ
	(envelope-from <linux-media+bounces-66194-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:09:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A22766EC94D
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:09:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RTtuXmSo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66194-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66194-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 876A530D51F4
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 11:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3564643CEF4;
	Wed,  1 Jul 2026 11:04:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457BF439006
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 11:04:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903867; cv=none; b=oqbXASIq83PEyt12Ut2rCB4E3X0UzemrQwzD7I5l0dDAbPkd3pw6U0lYzQP3RrgH462ZisRh3xC7Wak/RjOAyhwm1w5hRMc1APCauLXSci7q1EULuIQc6pQyoBetpcLZx2Y+lJWP6I+3uab3KGJ6TyiA0HAOH9Qg+ehVNp5HSyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903867; c=relaxed/simple;
	bh=EoiXCnMfqaEvp6ChiEvuJfXjBruKNhqBu88qaW28Izs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JI3tvLWJNe6fQrb9hzb+rS4ENeacUAYo9EwML3nW/L4LJ5q9E8QnP5QtJy6ysS+MmanDqVVnwPLRWXig8PvJ/QZeYPYoj12/bE6GLwfZ3LiaRFslq6L4n5A4qKSJTdeUSioeFTvDTOuTmw5tAvAZwlwO8hLTvrnOdI/zMnMtCYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTtuXmSo; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so4664935e9.3
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 04:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782903865; x=1783508665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DzEMcOPWAAc3ya4BWHLrviknUVsExWDTeL6YrPN8Pco=;
        b=RTtuXmSoNCy23Dy+USryl6rjSjXPFRSIcQmSdzdcHTnzJmFRkGr23m2v8wvWFcys01
         z7TLOr8Zsiv8qgbw24lE5m8JIciWViuaBd+4kZISYQUCYYS9V6AXb8I0NvJBl27X6Puw
         nVK2ZbK3Y/ZKmxV+S3wNRQs96FWx1FyGy+snm3A9EtFgj1n9A9VYpVje/M1vgcwq7wKz
         nrEiHpgpF6dtRZs/Pbs5xNKWy4doI1ieQHQreHa/iXzBZyoRULysvM73PlznyC6kwrNc
         nJ5ZWeX20frHwNyCJN4VLSGHq/lNQD/Yo5MdISBVNUisIpbKY7LM3Lmd6ZMEn/mZkLha
         nXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903865; x=1783508665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzEMcOPWAAc3ya4BWHLrviknUVsExWDTeL6YrPN8Pco=;
        b=OUvwOuowFYQT5u3DrWfmnjZhu1Dgj2i/3E2OKGUpb5GXppHvW8eubhEucQUnysxhop
         nOKKEn1rDGa+FzkTQot9j8zhX7VIQLqhvsxOekO5K6WbwyXOhJn/tkMussfDWK92hk6v
         cLTnTS15Bd6sHINGS629t7KcQQZAuD9obzdA5gENkb8DviIeZTXRN+mLSvUe0ennsNED
         uZFy1jqSuqxDJfxxb4LrZ5CPzKBVAGAH9aMp+9xWyzr4ERD1t6DSv/3MLTukDYzO3lgz
         I9fnoWqUFMvllTx1R0TjlusBuQ+cIRaB+ADAYr/QBnA4JbhBsV46NDg1+5UYk7mdkWB6
         mxjA==
X-Forwarded-Encrypted: i=1; AFNElJ+TtuYgfQTxVqsv/Ez/wGqQ4c31AfDkkL+pFsfQdyhxeH06uvNlr6PMszPLGJXV8+D0/7jfBzQMpcBB5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA/pyuvL4qlOqLoS8EnvtHw9aIhcTFSCbcz7fRO3nz456OvP4F
	6yDNKGZsNljel3rbInbGb8E0uTDgtiPqkWDb1GjUQMt/KFCfKs5/TKuB
X-Gm-Gg: AfdE7cndDXL+tKI7phJqm3n1myRTV13vqHzAeeRWSHMJ6HcY8zKJzZM/TtR9QkTcpe9
	77cXu6K54733iFSS9jqKWoH0g1CZ+zfQTkQ8UFPZ9Wtg8xvpTAfv+uvLSbOVdD5JeNdBLjmDBtf
	WmsDPWuQnHJhv1ysoC5t4ZAkRGEPxiILIIARRYPYHeelvzOY4caRK768EVlkFEGYvNoe2adUTK5
	3rHTfJcD/xYqrijQmVa5djLc8EjbK6IZ4pidSpm0z0UnxCjI0SJN5oDh4a5wbnVW/MrhmK3CgTf
	mUleVS8JrpZs11jja0tDrdeNhSAAtOFczL6C6v+k/EHYh9fbUEqLK8IRkXUztOS4OKM4GhPoaki
	ov4hzhHCkOjtgON13C0HJAhjTcJA9SX6v5uc3Z9EOwwTHKl3Q0wUNyvSTtwrjuEp+/TyOJgtRhE
	idCWqUjza+/X+sGc9WxKhJX2adYAS8AthpvJH2yOFWYBlfDf5cxcMBoKPu26AlhA3YlvPpL0EKJ
	OSZ
X-Received: by 2002:a05:600c:64c5:b0:493:c3e0:99ab with SMTP id 5b1f17b1804b1-493c3e099bbmr437705e9.25.1782903864587;
        Wed, 01 Jul 2026 04:04:24 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475641e4659sm17142835f8f.12.2026.07.01.04.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 04:04:24 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: andersson@kernel.org
Cc: sumit.garg@kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com,
	sean@poorly.run,
	akhilpo@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	vikash.garodia@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org,
	elder@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	jjohnson@kernel.org,
	mathieu.poirier@linaro.org,
	trilokkumar.soni@oss.qualcomm.com,
	mukesh.ojha@oss.qualcomm.com,
	pavan.kondeti@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com,
	tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com,
	jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org,
	apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com,
	linux-kernel@vger.kernel.org,
	sumit.garg@oss.qualcomm.com,
	harshal.dev@oss.qualcomm.com,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] firmware: qcom: scm: add missing IRQ_DOMAIN select to QCOM_SCM
Date: Wed,  1 Jul 2026 12:03:38 +0100
Message-ID: <20260701110344.1999068-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-66194-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:sumit.garg@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:trilokkumar.soni@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.com,m:jorge.ramirez@oss.qual
 comm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:julianbraha@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_GT_50(0.00)[50];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A22766EC94D

'drivers/firmware/qcom/qcom_scm.c' calls 'irq_create_fwspec_mapping'
so it will fail to compile if IRQ_DOMAIN is disabled:

drivers/firmware/qcom/qcom_scm.c: In function ‘qcom_scm_get_waitq_irq’:
  drivers/firmware/qcom/qcom_scm.c:2512:16: error: implicit declaration
of function ‘irq_create_fwspec_mapping’; did you mean
‘irq_create_of_mapping’? [-Wimplicit-function-declaration]
   2512 |         return irq_create_fwspec_mapping(&fwspec);
        |                ^~~~~~~~~~~~~~~~~~~~~~~~~
        |                irq_create_of_mapping

A patch-set in review proposes making QCOM_SCM visible in the kconfig
frontend, so let's ensure that it's safe for users to enable:
https://lore.kernel.org/lkml/akS_6izxrhgK-I22@sumit-xelite/

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/firmware/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index b477d54b495a..9d137fa2aa23 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -7,6 +7,7 @@
 menu "Qualcomm firmware drivers"
 
 config QCOM_SCM
+	select IRQ_DOMAIN
 	select QCOM_TZMEM
 	tristate
 
-- 
2.54.0


