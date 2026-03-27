Return-Path: <linux-media+bounces-57267-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFrpHC+dxmnrMQUAu9opvQ
	(envelope-from <linux-media+bounces-57267-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:07:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 138FB346774
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C5763020A6C
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB54030E0C0;
	Fri, 27 Mar 2026 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDloDIv4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38422DC764
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624041; cv=none; b=QR0otHtgCRY3BL9G/D5eH1Mxq+dgkvxD7KSURI8+BS6bck2eauDafDKVtbnu2ohbAr8wvwPb+k8xJ0BkDyZwtTw/CD+OFDMafXOok/zUvVFkJ7HGt6VKTdmz6gzzxUCpg3TeAQrppIxfNRo1xDuh0RouK6C9Vrjk984LLWCNQ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624041; c=relaxed/simple;
	bh=l8GM+I02ON7dGDzG05JviyVuJDlnxvYhsbqWrsm2Fhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L3hs73q3UP7KoVN0gY2kp4iyhMqslK6Hf+XywhrXZcnzEWlIWR+f0E/eolFpZdjsGUuglqm0ugSpEfAekoOHlJ7mupEFHz/WxhbVg3pTpTM70F3RpUEDrQ215FZshKRS8TgkcGpEKK2Y0IMSRU2XU0/OMteGS1sW0yzdQOtYzQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDloDIv4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso18203915e9.3
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774624038; x=1775228838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfymaAYWjSM3mEgWAz66dLeHt/Qk8lfr1hIn7pnGV2w=;
        b=dDloDIv4sIlfjlg62dxxC742xX7IMDp1ELSRCx/KQwPoKxQ6OMr8lKWQxmr4vuNcYF
         EMqYzTnk+b1BJbsl8y5S9/1I8nSib7h15C9cN8IAoUwlOlzPwnSSnXWjvaYY6fBAic3K
         34KxUwugsyFvkG10hjcyLgmusG3F5JH26C38zxZUeRKiz7EIK0HiLk1nz2zDRfCrOWtD
         s55ka1WlF2umiehXeRFjUihRhRqtvRiF1HFTDPIy205ZjD5iZE/BSMb28W0X5pUtKNMh
         /yS6eDJf8UeZP/92918hxbl8OR6WEY88cYn5TxKmh1XksweMvC45equs6OazCmnArYBc
         IFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624038; x=1775228838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bfymaAYWjSM3mEgWAz66dLeHt/Qk8lfr1hIn7pnGV2w=;
        b=ma1VGDJzOpAY34Qkg1fe9V63eTfuhA+VzSWeSFWQ4cbsKibI5LWklnzV+KbXnJYF50
         W4yKXKv/LwsManT2QMeSHtFtPVZRnHoDklGc6CLGKYsMFwM2TbEDP0dkJ2hgFBzVcNcO
         fYrU2v+bFu70C5eDwFZVhnQikkhEy54pJBgBM5iMm/WKMfEZ4APMKtpD/IkCHHz2y1aG
         UFXfZWjsVx//t5jwwjE817z+CQjZfOXH2rQ5Hk854cuti/wucEDGoErBCvvJW2FpoChb
         i12ZuqZQTY5QM4Eu+RLTyeOR42UV0JMiGFyZub0hbEaj36B6OvGMO3Bvkxj9AeDRRe3K
         0SZw==
X-Gm-Message-State: AOJu0Yzf5aIVA5FUgYSZz4z/6b+H87SPtvO/CLVglIWakG6cO7b2WjRs
	T/dCgMevcubADaeGxyMVy3ZiJM0vsTdVUDOe0HhqDBOCDQAdTZT1Pen/
X-Gm-Gg: ATEYQzzc/R2zA7QgXgC0f1t5TNCgEwTNEVV9HVTnA3KPQYdfz2IrDymUtbOH3I4fed1
	gWb1UT7kKqHmShWrRlp0a1umPvx/48ElPfQjW7q4hNjWdZwbVwSQ36O6cCUt08MpM1kWS/mv9+M
	Y9Hsp+luROM6/ZU1set70woobBg42bCBwtAj287RZGP2HFpBJUS2BXpG3CnQaSMkVCyc0EiMqak
	vS46CD1K18JqyNQeKHIuIqmZOmKPE+MbGpb+qx27dLxNlBiY8hXVwy5a9PAwvD8LHj3Wruktylq
	FjTvkFIMYFxOe42MGWqJnzpyL9m0Su7RJXkPkxMO0j7pX/D6VIn/qP4UaLtcS0jzAdTFTMxpjh1
	rZU5ZBPhkuleIbRQpWQSfspuu5BeBqieDF70iNIryEyZFrPh7Wgu4LShc5gAYsAPCHPWxjXAmxt
	WO3YqPfuSpoVTmtREG5qnKOcm57MgH7hVviaMEr31V+UuiCQkZmbWgE0oQzHu9ghR9BK4QxIMXi
	f9Sg+OzlMgq
X-Received: by 2002:a05:600c:c113:b0:487:1114:d431 with SMTP id 5b1f17b1804b1-48727ec3c36mr36942385e9.18.1774624038036;
        Fri, 27 Mar 2026 08:07:18 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d40741sm97475055e9.13.2026.03.27.08.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:07:17 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nayden Kanchev <nayden.kanchev@arm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v3 2/3] media: mali-c55: add missing pm_runtime_disable() in remove
Date: Fri, 27 Mar 2026 15:07:06 +0000
Message-ID: <20260327150707.256752-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327150707.256752-1-devnexen@gmail.com>
References: <20260327150707.256752-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57267-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 138FB346774
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

pm_runtime_enable() is called during probe but mali_c55_remove() never
calls pm_runtime_disable(), leaving the device's runtime PM state
enabled after the driver is unbound.

Add the missing pm_runtime_disable() call to the remove path.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 5cb59c70ffc9..38b11d5ba168 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -859,6 +859,7 @@ static void mali_c55_remove(struct platform_device *pdev)
 	struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
 
 	mali_c55_media_frameworks_deinit(mali_c55);
+	pm_runtime_disable(&pdev->dev);
 	kfree(mali_c55->context.registers);
 	of_reserved_mem_device_release(&pdev->dev);
 }
-- 
2.53.0


