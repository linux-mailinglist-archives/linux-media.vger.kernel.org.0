Return-Path: <linux-media+bounces-64849-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ++LDNyYPL2p17gQAu9opvQ
	(envelope-from <linux-media+bounces-64849-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:29:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC0A6822A5
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:29:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=g+QIDbI4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64849-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64849-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C399300B9D4
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06C531F9A7;
	Sun, 14 Jun 2026 20:29:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265C9319601
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:29:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468954; cv=none; b=J9KgLqg+pQhn8PkDW/tuN0dHIysog0t/XM8jTN25320+ySb5HbJm/axfpl9G1QpUPRcwY2lwxm5giJpLqgpIp3S4BgIVLFl3kWz8V+Cy+MgdH+ujr453k6nZgKu+3Ki9WJQFmSfkSgOUmbx2YieFkFrDxpTz397DKfxIu2urs2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468954; c=relaxed/simple;
	bh=CwCMM8N2M4CnhMVE72W1WIHXaoNeYaP9ES1v6clqAJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AF+vWuGw1fgoinNn/5e+Qh+Yb/KONCMv2y7K8T1tTsQUf5HzwzH0b+2AjJVg7jL66FDeh7Iz5+bVEviM7X26fIkyEHeh1q8KYg0mgjZuFi9biw1paJe65umZvjAT9x+qjPwFvI9wxq6OrPjGlyANziEv9G0u70lU6G+KLqx9+B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+QIDbI4; arc=none smtp.client-ip=209.85.216.47
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36d6bb38b44so1807075a91.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468952; x=1782073752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWZ7HGHha1CKlOVaZJvpjoaM6zYHndUPgYMsYGEPV6s=;
        b=g+QIDbI44tIPIypYOluGrXPae0Pwe9Lcb1BTB2m9yReNOkdYJLoyW17zoDwne/opUW
         mLGWa4r40e8eYyxr5nxZGYx4a5eYv6FEXvoI/hjXXJ2UvBwi03ukE2X/dRkGWTUsZ3y7
         USBd+RSA7sr0zl+0hnD9uPs8CO8ir0Fw0qUR/yQSF5AgIJBh3WUJS/H9A4nIZ0hi778E
         SosG75349VBI90Tqy2otv10Ffx7TPOg6PwXES6H+PsWVXT0ihe+9fbEDLME5enAaEtTv
         J5ILx8+SEN4zJr8u2O35WWXFUlBs1cwCbeAWIhiQJRuIu62BP8jjdTG1tgRUO9CRNxh0
         x56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468952; x=1782073752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWZ7HGHha1CKlOVaZJvpjoaM6zYHndUPgYMsYGEPV6s=;
        b=KXnHk9m5kHahKyfEW6uRhTjF5xhIA+3nuAtYEWtG/y0+YS5Yczj62d/Re3o+mY07YA
         SURWfE1n1thYZ2GVIJR1Wcr3YVWF3mIEfMwFajkEQvi1JZudopMLCGAOZzLx3g9oBWo9
         yciehQ6SEH2BrlnDaJ3Wns+wezmYjFs8xHb8xy1r/ZQ/iD4sau2h6a2d2oj/S1POnWol
         qtiQ9b9XkPzi4ziql+uqRCGs0oX+NHDJVpS4y6j1n3vSRuHeg1iDmU8GNI3o1Utr+q2h
         jbnDHQvOohKI898nyVeMVs2loKRnpHgFIDsx8parfCObz0kSur+MWiGSy3s6DaKNXTfn
         1yBA==
X-Gm-Message-State: AOJu0Yy4TIhwj5pE4pZR4PVA9pqxvKRGp0+uY0uk7W53lA8imyKcONAL
	YUYoD4rof0ZNKvxrpTf+QsG7kn8HCfIOw3kwm3Ek3ggGKOXMEA94PXAiHt+eJail
X-Gm-Gg: Acq92OHv3lg9f8SLEjpRxEzybEJApHNL9ZqouPrpLxgHyUeNtdY0TfBmdPkeX3Y4yoO
	KOKUcfxUGujpiv5EeM4eLJBoUrzQvG9KvlgwkU1BaDUZJikEmEH59g/LnPsQwJ02GvDC8z9rnG5
	InJdFT/1Bpkqsp+oXBRuAD3VhuV6WiJ3ytYJuORSd1OCUQFG3dBi7CINl1sP0zS7REQGXi0W60K
	OZ+D2zp3tCNJSX+3fjyc1xmDVEBKNTuultfcHfetyugKkSD1MrCuADjKovfF4oKSgw6J/AbWOkV
	kE/Exul8G7b2fZ5FtBlhi/RRV+/CXwTcZc31xLFE7X6PCwgd+re0O4zjk0W0sxKL0MKDK0KUI/8
	KFXFqLVlTlEGZ6Qh7CJq4YDUEZkV4kwVa/gZtVJ/79gb0C8llMP/miYntS/VjtKlma/Jz3iC+ax
	2uGh/hA5ez+++zrQXCJVDDfp64pulyd/RhNC47l/lNm9OQngcd9JiJ
X-Received: by 2002:a17:90b:2f45:b0:36a:ee1:fc24 with SMTP id 98e67ed59e1d1-37a0202fbf1mr12756523a91.8.1781468952540;
        Sun, 14 Jun 2026 13:29:12 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.29.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:29:12 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v3 06/22] media: platform: stm32-csi: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:06 +0530
Message-ID: <20260614202835.11977-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,foss.st.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64849-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:hverkuil@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FC0A6822A5

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Fixes: dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index fd2b6dfbd44c..0847fd347d56 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -1060,6 +1060,7 @@ static int stm32_csi_probe(struct platform_device *pdev)
 
 err_cleanup:
 	v4l2_async_nf_cleanup(&csidev->notifier);
+	media_entity_cleanup(&csidev->sd.entity);
 	return ret;
 }
 
@@ -1068,6 +1069,7 @@ static void stm32_csi_remove(struct platform_device *pdev)
 	struct stm32_csi_dev *csidev = platform_get_drvdata(pdev);
 
 	v4l2_async_unregister_subdev(&csidev->sd);
+	media_entity_cleanup(&csidev->sd.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


