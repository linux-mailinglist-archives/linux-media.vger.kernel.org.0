Return-Path: <linux-media+bounces-66794-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sXxrKDkPTGqKfgEAu9opvQ
	(envelope-from <linux-media+bounces-66794-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 22:25:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E573715699
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 22:25:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FAIDk4t2;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66794-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66794-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAE51301B937
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 20:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1DB3E00AE;
	Mon,  6 Jul 2026 20:25:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079A43DC4AB
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 20:25:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783369517; cv=none; b=KC69KbaTjc2iCr2AIrf1HfawhhHuSdnGIRI0FHndQo3a/yggHwq8qSqsDvaNxJNxgbnFEp1gmiA7xjhhpA2sCXYCwnCOCzs87S/snlwLNbD+PUflSnmkjxMu34kQYAxFKZ3Nq1XPmVrIiQgsZ8Q58icOnpGj3c/qqp8ObqA7zC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783369517; c=relaxed/simple;
	bh=uFTC/JWcsUa+gq1IKNRDOiasOcI2nH/oZgetBLHx4/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9JNR0ISb4jqipo+RhblSCxt9+1l2PzNDTMNgtO0KkIhtUgVPw7bVsx0IoQUAFyLurNNDLqP2VvjXkJ0ymCMmFEAoifyt53r3tiIQYr+PktC6C9iepMVlJ9HCWmAEzhlxqfCpG+MQ+A3ET/FeSDEbyBCNYD90eWxEUZsGG92hwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAIDk4t2; arc=none smtp.client-ip=209.85.160.178
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c05dcdf49so38786371cf.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 13:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783369515; x=1783974315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZwUuzdhxUy7lZpgkfJAvtlDYtX2QPmbs8dk3tuJJRk=;
        b=FAIDk4t2N+6nhpKf1gajde2PG/3AWUbGTOovon9EaF8VM0ib4vjjVqv1/T96uB/Y22
         FXX8QUiDFVrfccaq39mcwin0qNacncSvcm1krseLm57Uc3OpBsGTSwefX92aLnwBrMnk
         2Txu/yzla9YgPzU96tkzaDdD48bwkf4Cd2QaP2kB9/6FiAssANaIML+Cu/sWuhZgziBe
         3PVq5WT9kWymmUSVJOEnqmDJgx1iEKPpmCwUaneijX5Eqdo39kgWoVrfCM4woEVe9g0H
         dhQUZNOI/xuUPgWcQKOrfJJHUbuyD/6+/1N1iVZb5GmAU1rhwYLqSKU5Jdp59YskiapM
         XAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783369515; x=1783974315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xZwUuzdhxUy7lZpgkfJAvtlDYtX2QPmbs8dk3tuJJRk=;
        b=BHS25QTp3qfdGUeS3QimbhPStM2h05Z0+LHZzHRGbX7zkQkbcfkEn7eaYTRta1ceEu
         0++0+oZnrTf1mcwuiZgW8RElpM8o7lHGx48fVi5saGgtxRqlW2nJhj3Z3O1O/R+1fqAc
         AFkxuOGwqj4GJIcuTqrsSva6jVc8WGyKhw3/jmjhR4yfZa0vwz6WdP5ui8QQ8EGNdRf2
         AthjY2HBQ6AogTg3QoW/2XjGZm/ByA4e5q7EAqFMjAVF7ncLpB5+GfNRUtGhGiHa5F1m
         7RcrKgxhNXAUXCe/UxMzqRQeJYe8RKyLASewHM189pkJ0e9b9sq3fsUjQ27OEmY79TNu
         rNXw==
X-Gm-Message-State: AOJu0Yy8ATjcG+3vC+FnTIohDpu9izioMrEAAU6yfo/uzdi3SxBapv0R
	RGGi78uHih98Pdvd4v9kLrnju4JWc6IMSEj3LtFatIISTYafR1PpQWwE
X-Gm-Gg: AfdE7ckVG92SqA7ht90sO9FJmSdLG1QhRD8UP5SJ0/NERqdKOtNgRrXryelCy1wI6vS
	EmSNcS/UJWrcPofTcaugoUJmU5n/9XnLd12MIleJgBC2VKszGvRGDMYDwpkysm/gZOk+7iQV5tI
	3mWSthZTUjxNjZaUUaAbdmi7hZ2/Nf89bmFv4PSPtl1vH9hEEUt33yiEsWAR2/LF1NqqxCy+Xc6
	812Ph/lBOdaAr0MRCr3CGdW4j9qbYdyBxJEBBKEHz6PH/sz7PAQjim9jAlSofiUQ7aGPZK756hu
	g2qKdLzuWYKyk/BfyAVDp/9SSlGovjV2muNPo9ch8xqD6feMWSS6uA6v6GwE8o4irZHUNJ9U5Qo
	MkvYqCnN2DPR4g+JwDN+UOpllc6LKhtKCzwOhGpcHCpsVVXFsxahEbYu2YR8usyiX9f5As9xzcR
	94QCP3V6CXzCi4UQqmMByLnp+YlwGE65pSBkdj8fFvCQ==
X-Received: by 2002:ac8:5ad4:0:b0:51c:1a11:75cf with SMTP id d75a77b69052e-51c747ae66cmr27132301cf.7.1783369514644;
        Mon, 06 Jul 2026 13:25:14 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471813c8dsm144074096d6.25.2026.07.06.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 13:25:14 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Subject: [PATCH] media: usbtv: keep device alive while ALSA card exists
Date: Mon,  6 Jul 2026 16:24:06 -0400
Message-ID: <20260706202406.1381177-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178144969601.60470.4852887710381872458@gmail.com>
References: <178144969601.60470.4852887710381872458@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66794-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shuangpeng.kernel@gmail.com,m:shuangpengkernel@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E573715699

The ALSA PCM callbacks store the driver state in pcm->private_data. An
open PCM file can outlive USB disconnect because usbtv_audio_free() uses
snd_card_free_when_closed(). The disconnect path can then drop the V4L2
device reference and free struct usbtv before ALSA releases the substream,
so a later close dereferences freed memory in snd_usbtv_pcm_close().

Take a V4L2 device reference for the ALSA card and drop it from the card
private_free callback. This keeps struct usbtv valid until ALSA has closed
the remaining files and freed the card.

Closes: https://lore.kernel.org/r/178144969601.60470.4852887710381872458@gmail.com
Fixes: 63ddf68de52e ("[media] usbtv: add audio support")
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 drivers/media/usb/usbtv/usbtv-audio.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/usbtv/usbtv-audio.c b/drivers/media/usb/usbtv/usbtv-audio.c
index 333bd305a4f9..ae0a14e5ed2a 100644
--- a/drivers/media/usb/usbtv/usbtv-audio.c
+++ b/drivers/media/usb/usbtv/usbtv-audio.c
@@ -317,6 +317,13 @@ static const struct snd_pcm_ops snd_usbtv_pcm_ops = {
 	.pointer = snd_usbtv_pointer,
 };
 
+static void usbtv_audio_card_free(struct snd_card *card)
+{
+	struct usbtv *usbtv = card->private_data;
+
+	v4l2_device_put(&usbtv->v4l2_dev);
+}
+
 int usbtv_audio_init(struct usbtv *usbtv)
 {
 	int rv;
@@ -331,6 +338,10 @@ int usbtv_audio_init(struct usbtv *usbtv)
 	if (rv < 0)
 		return rv;
 
+	v4l2_device_get(&usbtv->v4l2_dev);
+	card->private_data = usbtv;
+	card->private_free = usbtv_audio_card_free;
+
 	strscpy(card->driver, usbtv->dev->driver->name, sizeof(card->driver));
 	strscpy(card->shortname, "usbtv", sizeof(card->shortname));
 	snprintf(card->longname, sizeof(card->longname),
-- 
2.43.0


