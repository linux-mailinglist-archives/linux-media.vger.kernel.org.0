Return-Path: <linux-media+bounces-66127-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D6E9NVvrQ2pJlgoAu9opvQ
	(envelope-from <linux-media+bounces-66127-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 18:14:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4972D6E6528
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 18:14:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Hc/qVpMD";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66127-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66127-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A283312FC65
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 16:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E2F47277C;
	Tue, 30 Jun 2026 16:06:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lr2-f2.google.com (mail-lr2-f2.google.com [74.125.230.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E6E45104C
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 16:06:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782835567; cv=none; b=lfoEFypFL07mGQn70U4FBMFKRi4gj7YXuBrfrbl6ith6cX7UAJHdBZz7tg2UH2ZTHyEeNC8Y4AeR/Jv/kkakcU7jjXP+2aZAYDpw+58vM+vC0HBzmLKARODCVHzUmeFfSdmIGnSiL+UQewi0jp+azX7Jdqz/NUXvKWkwKf2wTsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782835567; c=relaxed/simple;
	bh=m3vAsK5slw0dcrp5GIzrlVJVX/5gpHWYHdhD9DgaINk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IkDDGol6+x+/8CPSnL/vHbZ8zyq2OKWplIrPjzqlmgTNNeT1SQtkmFJBB9HMj5zLN7fHK974FG/M8aOWMhr93PBYmNeaM4BVJbzxtkPuwteGnRLIYeKm27+H/RCJxwhUT/nfyZJZ1SeCai61EaKauGQlSPp5Y0LfSZRp7LvubmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hc/qVpMD; arc=none smtp.client-ip=74.125.230.66
Received: by mail-lr2-f2.google.com with SMTP id 38308e7fff4ca-39ac6d46512so2010671fa.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 09:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782835564; x=1783440364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GdkkU1grf9UGW9t3296G0fSDCaf7b9DnqBxsaoQmFhc=;
        b=Hc/qVpMDjWrW56IK9q0nSistwy8d+DHo3yQ5tj5ondmlS7tCfl0p/6M5oAJd8yepez
         RpzmY6wwYcjIOTZWmVp9E2WUSEd01A3fQcZSCIANeHZuNc24BZ++ufnjsQ4J7UPcFaZq
         1ToA2LyB9n1m07T7/ZmDY8hfknFyH5/1XkiY4LkGEgGhBeMQQojvoQKZXjmxJ94hsMpf
         bNIuBU7Y4mcYfa/5QSw9vrRd+4Bhxfjxri38nGnyeO8zugrZlTq5Y0rGMsNFlqRX5M9y
         TbyROdRHy2kSeoNxdTEkvVhcZw3kmzO/sBG8aP5fa79k9YZhI5N6rnSDUdpfKFNi2uOx
         56CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835564; x=1783440364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdkkU1grf9UGW9t3296G0fSDCaf7b9DnqBxsaoQmFhc=;
        b=G9sK47HsIHfK5hR+2CSEiuMnpuXJtZg79aozOQKbHlDou/dVO2gAnqTJflo+9c3ZN6
         iPrGt8BC/vxHHCZSWYBVAXOZxlqPHPR5DM2ePS1vUcFc8mFw0TqTOQxig42k8R1zBNz8
         ChTO5XxHh9SJexNpK8HOCfA2DMu6fWdRui45zNIB8R3ku/6eFd9mBgJzUp6wTimh2R0e
         DsMi970XJ8oXAHjaoGc9pNbGakJjOQS6+Ek16WuMtVnHRkHqgxodhvf92GlDsWgCOQMc
         qZlKHZdC0MuYiAWRbmbZpqo8FRUtjKNoI+QjNUlpFBuW3+PehnFWMMss+RrkIv0KAAfL
         5PzA==
X-Forwarded-Encrypted: i=1; AHgh+Row68Rm0159GTu2FMTQwk0q7vVQfEbmqyHREJHt9wumCOvHuPztPVhT4XP3+OJf6cQW79G9DzPArYY5qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUMhB4Z1bLMhgVwuZu9KmS62ZmDNySVLC5ZOAyFRR16pMxDZuB
	DnP9T0Yg50pUQjamM7CAuCRlgZcfODWk9JhXCkKitee8j5o9yG1z+95F
X-Gm-Gg: AfdE7cm5Hh7FmSbAJHnlVHJUELaMOQ+81/KmDxrxxGO54hHNgy/C7GtR5Wag6QrxW11
	+OL7GiCrURh4qwUbsSph6G6dKYRNxRVaIIZKJF2tqpN9v4SIFMiBnxhwghTs0kj3mGG3ESbVq2+
	+7NmpVTFkjQ6ZrVOjkoJKSIqBnLisMSFVryb4VZD8Njiw42TYOueayI9U9APes0l4rJk4ieFFRg
	rvLx3evzf4N/TWnwDM8AKiqTSSKq+1/u9ck5LNHa6INqTTBLTY9OaS3IT3tbfcEKhOzg+zUS5ef
	okdlQK0jH6A1Hn+k3u5vjr+fCH2fPUJzdiMIxeV2n/cab6bt4VfCX9fYcuj3HS5wjiY30nwJrh/
	r+/1ULrGTcyGgLcW+YmldkFRQ611cpVBT80MtzXBGucBtX9AT/ZRKv6Ie4SjVLQxs58SLmA==
X-Received: by 2002:a05:6512:61d1:20b0:5ae:bf21:22bc with SMTP id 2adb3069b0e04-5aec10c070bmr311853e87.30.1782835563310;
        Tue, 30 Jun 2026 09:06:03 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe498645sm673045e87.39.2026.06.30.09.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:06:02 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH v3] media: atomisp: fix block comment formatting style
Date: Tue, 30 Jun 2026 19:04:35 +0300
Message-ID: <20260630160435.3293-1-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66127-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:bohdandmarcus@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4972D6E6528

Fix a block comment formatting warning reported by
checkpatch.pl in atomisp_cmd.c to conform to the
Linux kernel coding style.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..20abc2c0de80 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2520,9 +2520,12 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+						/*
+						 * If the grid info in the argument differs
+						 * from the current grid info, we tell the
+						 * caller to reset the grid size and try
+						 * again.
+						 */
 			return -EAGAIN;
 		}
 
-- 
2.55.0


