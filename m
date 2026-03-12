Return-Path: <linux-media+bounces-55544-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHYfBekxs2ntSwAAu9opvQ
	(envelope-from <linux-media+bounces-55544-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:36:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B1E27A164
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A58531AF3EB
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 21:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A943EF65E;
	Thu, 12 Mar 2026 21:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="L05b1Twh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEED1B4F0A
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 21:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351341; cv=none; b=iEIGZbx3EyWKpCSGsvxaNq70qtUESWlFUD0ecxxgUh93nUhO0J2jpWFP3cZxPx0s+90Y4K1VtBKrtJvs9OqttyKDMxIXIkRhI2FwkkevfFKzPxJho1MnlhCUcSrPIZkTr7Y5O05wyljenGTT65ynkXy4slsWVFKNcpuWaErQckw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351341; c=relaxed/simple;
	bh=6YEPeTQ5YLoEPxjdpZLvbyfp6mxBKSsVvk9snlLKTsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XThZMl8eitJWXh4IQil4ODkkZcGUQuIvAHFiyn4Q2YG2DI7oJbq/k67sDCiez2ULomnMU54j/fEUJoyP9oUR5slI2Tr1S1n5LStnabLj+DAPgRRHgxyBEbQW9VjplpSdfLpiOUJQdlgXB1VebeBk14r5AjFT+2FF0vEcb2r+cFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=L05b1Twh; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-46726528f1cso1113604b6e.0
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 14:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773351339; x=1773956139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BWGhzEaVrxGO9CCsrFLL11Axc840r7xaXVpyyaTxbs=;
        b=L05b1TwhJOrGnPXOnsOiaaApFCHOxX5OtuWOA+1Wf9inlUKurCZcL+naGa5pBihErb
         4VLjIjsJ7YBscN/dPqmnQNC6FMsif9oSMoTGZQfrK2BEBZSoCwuFmJf+Gw97o9gr98bN
         X2wl+5j/wQBe4ABOHtNOns/twLcsenQKNIEl9Ez7D9VNNe5rc4z8ZTMLLbywUNLwhx24
         5/AvJu8uz5oVqnzkgkVQrQpqFnLSnloU+3565+viOpUi8VIyUgDNwN/B/bltYx3p+y3D
         UIIdPrXOQ5ODyyIwjjgPDTR5GvEp2yf9Udr/QW7NzKm9npB/Hx+nrPPoNTkeJ9wdM+mN
         4yxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773351339; x=1773956139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9BWGhzEaVrxGO9CCsrFLL11Axc840r7xaXVpyyaTxbs=;
        b=iupMGduEY3fONsb3XjOZ7VDRT6SG5Sjpkav5B3MGSy9qDc5WoshfK4OUIAOyGJJd0n
         fJFOXY/Nbs8UvNyjR8f1ObGLe0kONe1wOhzbHIRj2i3dNMbPXbqjyEMQX2xlRtG3qSUn
         OCEI+YFnouZk+thoBZOJ+49nGCEcWep479MG0hU0zAIWfzq2TZInPP9pWjui2tLt+S+j
         Bt7CVE+wLduepW9PtxXY1uHEX2HYmXAiHHaY40ntPyGoVuXBGuv7waEWTIiaRzswFpNf
         0Gr2r+bXQCbS23qDi9WIRnzbM5JpEW2yFsvhRWRmH+cVJgZg0PG9u5mdM27QjvSSIuWH
         9V2A==
X-Gm-Message-State: AOJu0Yy/CBk4EgNg/dPBIMFTAar7Fu8aygaeyp3cwjwn9V6xTblxxGCP
	meO5xyKEU0uc0fTuZPfdN3xOfhv9k5JkhWOo2jZrs+b31giG27k4mJWlVPnZAoHMwJuV1EJlArI
	fZ2A4yNU=
X-Gm-Gg: ATEYQzxnYhnbNQryxnr5PF7ZFu1u3iDR/TzCuTEgVdrcpjHVzKj2B8jVmfL2dpM/JW3
	E8U/ckE2Wk7Nmsu+EZRgEZuFHJa5oJcOvglxeKbBQozPKDLC6lieaQgd44M38RltphLdhoJt5st
	jnBSPn9WIrN3ZD3AxvoGPNG2tKH+nLxc0FlcCvhWxtZF7UaWHHRR1OBwp0cWEdJGVZzbv5xpa6I
	d0cU3DaJLpOtZfrgdvNHkuQhEV9H40ja3PWVtBO6VCbX9pzqDX4wng2ykGVGJFxlDmUmja59klo
	ZZwKujSruxb1zQeJ5JFPTMuzqPk5CRNIAG0Kj0Ym1v1j3mId+Z9RTPRb+mw5g3UflqgglcxDTIY
	hdpQUSCNieBj8Io08V1RwFlI4yhSJBMWBIW+tz9CCZxS4+4gR6tobt3C08OwrtiB5muqsaYMdRj
	7kmJ7tK5QnSj3rpYOCq5365UGWlDSZK2RLwMaAfioafO6YCMyNqexfVqrE9Jjfvl7PoM5OH//aU
	pgjB1sztwGm/bU2wZs=
X-Received: by 2002:a05:6808:6d8b:b0:467:11ab:cd86 with SMTP id 5614622812f47-46757420e66mr452700b6e.43.1773351338984;
        Thu, 12 Mar 2026 14:35:38 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4673415c264sm3657572b6e.5.2026.03.12.14.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:35:38 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 04/11] cx231xx: Fix AGC levels for NTSC-M
Date: Thu, 12 Mar 2026 16:35:25 -0500
Message-Id: <20260312213532.2907276-5-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260312213532.2907276-1-brad@nextdimension.cc>
References: <20260312213532.2907276-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55544-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A6B1E27A164
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Windows uses the implemented command sequence to set AGC for NTSC-M.
The previous Linux values work, mostly, but on some embedded
platforms NTSC-M is very unstable. The Windows default values
completely fix any signal stability issues and produce clear iamge.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/usb/cx231xx/cx231xx-avcore.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-avcore.c b/drivers/media/usb/cx231xx/cx231xx-avcore.c
index 1cfec76b72f3..0a5c635da040 100644
--- a/drivers/media/usb/cx231xx/cx231xx-avcore.c
+++ b/drivers/media/usb/cx231xx/cx231xx-avcore.c
@@ -2027,10 +2027,9 @@ int cx231xx_dif_set_standard(struct cx231xx *dev, u32 standard)
 		status = vid_blk_write_word(dev, DIF_SRC_GAIN_CONTROL,
 						0x000035e8);
 
-		status = vid_blk_write_word(dev, DIF_AGC_CTRL_IF, 0xC2262600);
-		status = vid_blk_write_word(dev, DIF_AGC_CTRL_INT,
-						0xC2262600);
-		status = vid_blk_write_word(dev, DIF_AGC_CTRL_RF, 0xC2262600);
+		status = vid_blk_write_word(dev, DIF_AGC_CTRL_IF,  0xC2262600);
+		status = vid_blk_write_word(dev, DIF_AGC_CTRL_INT, 0xC2260000);
+		status = vid_blk_write_word(dev, DIF_AGC_CTRL_RF,  0xC2260000);
 
 		/* Save the Spec Inversion value */
 		dif_misc_ctrl_value &= FLD_DIF_SPEC_INV;
-- 
2.35.1


