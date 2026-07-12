Return-Path: <linux-media+bounces-67399-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XKQQNYKCU2oBbgMAu9opvQ
	(envelope-from <linux-media+bounces-67399-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 14:03:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76273744953
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 14:03:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nwlRoYmD;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67399-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67399-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CB98304178A
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 12:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0713A9D95;
	Sun, 12 Jul 2026 12:01:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887293815E3
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 12:01:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857709; cv=none; b=rQkS8Gh1ou447F5N8B9ngTU5pCzjeMY23TZx/9GGXI9cbTpJjcZ968uOkg1hCnBB+KoPCDWYsvooF8OioQgu3nqxLTIgx4yLkqDr/+9vjQzrWAu2ICNBO4p86wsf8DObwTMCFfmvlvT9D7UOg4Gm/jsr/iZvVJEcUEibYDuWKkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857709; c=relaxed/simple;
	bh=DTEGmz4BX/wALdmLpF+G1NKVsyV8dXEGvJGfJPbVix4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRFPU5T/Dngpm/46G0bM1P7cHgiEQckeYDZlngk0mQ3Xu+mW4SNANu5EFhy+FJa5HGBQXKc14fMqZBt5qTVFBNtj6SnSUMWbGoGBuO7o2hwsqsCOP7BbIWGj+/Uxwk2VMN2hc5kx3I5ZYIQJe6yn9gQBjvVf0rmpDBNKcplmXjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nwlRoYmD; arc=none smtp.client-ip=209.85.208.172
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c923b8c2aso20111581fa.2
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 05:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857707; x=1784462507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTT35MmNa0dy11O7UDCHIeYzW/F4/jUWHxbyQtcgeSE=;
        b=nwlRoYmDjOipg0z32octos34aFtNwkd+bFzz5ePmZ03imjWG5U4zFjqp2aVWzKEoKE
         gc2RX35ZbWz9A0xaqV8rIqx+5zw9gmtG4eveUzPflF48JlBgN15SXaoc1y/fJ/pPUFya
         UaMrhwPxpVkXoxS56wayeKcRiTUE+8tWqyA/Qw8MHmVpFi7Ldd2HB+b/W3WUod/evqX8
         UY8jKoy3+3DeSY1stxO0bOofhnTyJQ/ukZW1Zwt+OyJWU5rGRMeHkl/LP1MQXYwgWGij
         8ltkeYKBYxJxdrH1B7TzCtm4caTQROGDIQucGTUJ2q6nmdGIt67rFoYfailQPXHh7dJX
         0PVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857707; x=1784462507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTT35MmNa0dy11O7UDCHIeYzW/F4/jUWHxbyQtcgeSE=;
        b=EH5fkjnlgYmEn+ln6Hb+X4h1f+V7gHPM1ioRRcB5pLm8JrtPLz+yR6+7/hjtI8NY78
         lh78nH/dmGeLUo/wazOlTf3QfURFVmkLPSbCu6RWowzT5//Z7rOv0M2bkQae/h/NmAP9
         NejgunJHDQcvKelMCuyVgmyyldG8OJcgmfQ4XSthZD0t5OZfQHsqYmCOTuboJlwUKmvr
         U2bUvjUUHgHbAyCVPqp10fvH8xvO3DwtMbfhvt4RgFAnb4/3bkSWarCG96Jt/TzLkEXh
         qaMHjwBOxvdd7jWqWjwlx+Y1JW/2wSxhCul0CKcOB6whxA70GDV6l9/qOGFoWc4HSrke
         9CKA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0j+45xY6+9iQD1eVHKvWQcOuEPcpGVcV+nH/jyASGJnVj8KYDyR8RGyrad/fXLA1XvH8iWixrSvN7mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzizRpbj6Hjkwn49T+k/31rF8aAp1hZswMmtGnj+jESnWCJVAog
	9SE7WDh1KRH9HTlWLWxbaTyixb8q/NNNmJDn4XDWfSC94ZMgTzpHUBkn
X-Gm-Gg: AfdE7clVTfJxKUx94iFxZdEeNsBiQw4rBYSiOjo6ycvfNJ04fqhDfzh3w6TxVEkhfrM
	A3wG7PFg+HMeMwFhODMEtZTGcoN1qL+JlpEfhvSLUeWcd1LbyJc2aDgaN5QLWmrgp/ge9xQ4Ccd
	LfvwWvDbiMWQzb7rWz8h8nl7YqWYTvufHwjTlEwA+fbXE0PzU2k4E1fjb2TRPVmmzEDyJZquocJ
	fentcbiptTwIPW0wRBgubrigsiqxNbmPkyUTz5P8LOpJeYp2yI7c6VjFbJ82YiyW4uG6WaXWAcd
	NKNCukgZnGV/Mrxt3vVv80OIxcpr4ANuRF88eV48Z8rb6DIEj+VQASP8HYZWKa7L4r240tiWleD
	lvYf01ltwix4MjLZkvPH38ulIoxYlA/viHAez/JYXmj7oQmQyLi//qCHkBvBr/sJ/EPbwAVIc
X-Received: by 2002:a2e:ad92:0:b0:39c:a06f:12ba with SMTP id 38308e7fff4ca-39caa8b50dbmr11042011fa.40.1783857706696;
        Sun, 12 Jul 2026 05:01:46 -0700 (PDT)
Received: from linux ([195.54.40.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84ba1b9dsm21339001fa.35.2026.07.12.05.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:01:45 -0700 (PDT)
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
Subject: [PATCH v3 1/2] staging: media: atomisp: remove unnecessary return statement
Date: Sun, 12 Jul 2026 15:59:24 +0400
Message-ID: <20260712115925.79047-2-erqeon@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-67399-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 76273744953

Remove the unnecessary return statement at the end of the void function.
This cleans up the code and aligns it with the kernel coding style.

Signed-off-by: A. Kalimov <erqeon@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9f..81d0afae8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1419,7 +1419,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 
 err:
 	atomisp_css_free_stat_buffers(asd);
-	return;
 }
 
 static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
-- 
2.53.0


