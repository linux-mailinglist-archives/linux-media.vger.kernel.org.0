Return-Path: <linux-media+bounces-57546-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLcNISMoymnX5gUAu9opvQ
	(envelope-from <linux-media+bounces-57546-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:37:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39883356862
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FA233003D05
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 07:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2841E3A1A2B;
	Mon, 30 Mar 2026 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dejl3Vq7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989723A16A4
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 07:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856177; cv=none; b=PnVbrJggyQLybGXYD7vhA+ai/erqAnj9O40j1AdpZLe2XQubesoCeOT9wZRZia+okoZDRfE6Es285eoNIIyB6oRMNAGD4VKPx2YgYweAd1NFSOBgRsoZ+h2/NHdASAGHVDRUjUqFABgqhC8qY9cjkjInb5O9UUum7sd+3uDziTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856177; c=relaxed/simple;
	bh=gmQ8qib91/MURsT4umIJTHqgTjd7DNDJ0EiCZzRTbu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KDSCucwBOmsZ2rcSmDT3opqVXNoq2l9+gpl4UDa5uLx0YiSmtDE1bMqxG5o4kXRNmEs8PTGvpVxXcHOl6ltRguFyK3cXhYzNEo4bMLtGk12il9ays9IpVAtnvl5eQ3yP7GI/loydNM2AityvqZj9nPchacdYIVibXqvYdyCzNpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dejl3Vq7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486507134e4so48070855e9.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 00:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856173; x=1775460973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gnd3vtjEEK1Ylf3QTK0JvWS8DR77h7l5RXxPFxFA2GI=;
        b=Dejl3Vq7n1O2+yAEA6iLMUi4GOauhewRq/uycvp2/rX6wQyJ2DvtBAV4Y7WLl229YQ
         wXSeDADzKarrPVln9iFOwdMilegUL9qrd9DzS5S7rz4rSQIQ9/x9t4HJr77TP1S3vId2
         ZLHGiHZ/2IrZdxThYTJpIF4nL8uEUoVMAv6MQM1GeH/UxXVF9f5yMglnbOgwSnCveRDL
         zqVYpptGaYHbE8S2SDu3dPwXv/vaohZqY4V9p325AQxdSdrpK1Em9IT+M2nX6LMp+UOD
         gp4AWCSqod7Xp2v5ZgzShOABKS9PTtQme8ppQG/4n/Oz3awec3dVZJxLIVMvCM5LFGmg
         vS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856173; x=1775460973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gnd3vtjEEK1Ylf3QTK0JvWS8DR77h7l5RXxPFxFA2GI=;
        b=lnPThDDFB7UJkWKuLNSZJ5mX8aoMT1fHYb7e6dz1gpCJwJ6hx1e12uzpGBd8eZVmob
         /1isXgy/xP/D6X9ndzjom1paMgZai81Nxu52dR5a00OuEbJudo2qM5toLH8YD2GHPQpz
         3uY/nAVvKizifmPbmtJpyRbDL0Us/36u8T4mlLB+L2lBIrFMVlHmgQdtsDFBjOEUyNxb
         hZdqfSwiKrL7fMPSq+b6uTKUHcr7vZgIXsfhSvGE3c505DCNMsKZ9F5BMX5w5Kkff7ZW
         N1D8dwUjDkTVoNEtfdI35fLNI4dxtIlPGif/4dnycN/Y/Mt/Ry2Ab17LWW107q5nPTjH
         CaWg==
X-Forwarded-Encrypted: i=1; AJvYcCVa3lFzeieyP+yVi+wet8qbHiVnmDDes1HeipQ+SNS0hr575QYwy7hcCarIQrEvppPJYmVsFr3xEiGLXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YysZ4XoWMb03TZZugnUJTOW/+z+A6DEiQJqMDoa/8TCz8T4WK2Z
	ifLplfm0s4mS3p3rz8kQ199Lq3XOQn/gZxUfvdyUExefAPYft5saIY+7
X-Gm-Gg: ATEYQzwS3nCAFjWBVrLzi25YW0taZ3LuTSTmQ8UU5l2Q47Bdf+nxdo84zvp/IH+F5fg
	2VyhRI7ts7TwadcNDn0Lbccmyx1+XNMZep7w4xRKFcC0KiN48HSzadZQQyHB9jfYykdMThjCulU
	ih7Vbo9r+RrXe0/m4ozSGQ11wtteWsApzghdZ/SqhnQg2wm6+H9dqwd+bLESWIpFhdZLCYvwTWB
	SvTHHM8of/shCLDEj9qftMpg9o4LQWc4P3IbsRsMO8pPjQRYbR8sStT6aM+PCeD/cZOmu1bXTw7
	cPox5TqVPuuc0yJe9H3ws5LxRcT/8yRb/HoRvFALC/A4yQU06yGBXcnKi/i7JHBC5f3s4OEPgDs
	xfzBkb3d2YwFEvQ2M8TocfkNuIi4ib9SZmiyok5lS3/yi9IgJo+XDn+CjmtLZGfX8kNj+SQfqh6
	VWaO1whxErA5l9YbHRiszZCpnLgXOZNyi95JLE9fwX4HPJFvG5IGs=
X-Received: by 2002:a05:600c:3b27:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-48727d5a252mr194547585e9.7.1774856172717;
        Mon, 30 Mar 2026 00:36:12 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm389407255e9.0.2026.03.30.00.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:36:12 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	d-gole@ti.com,
	m-chadhry@ti.com,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v4 2/4] staging: media: atomisp: 
Date: Mon, 30 Mar 2026 10:35:47 +0300
Message-ID: <20260330073549.5782-3-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	SUBJECT_ENDS_SPACES(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,nxp.com,vger.kernel.org,lists.linux.dev,ti.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57546-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robyserbanpascu06@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 39883356862
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct a spelling error in a comment: 
'uninteruptible' -> 'uninterruptible'.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index c99fb649fb5f..6420436d88f7 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -28,7 +28,7 @@
 #define DMA_DDR_TO_HMEM_WORKAROUND
 
 /*
- * The longest allowed (uninteruptible) bus transfer, does not
+ * The longest allowed (uninterruptible) bus transfer, does not
  * take stalling into account
  */
 #define HIVE_ISP_MAX_BURST_LENGTH	1024
-- 
2.43.0


