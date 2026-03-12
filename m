Return-Path: <linux-media+bounces-55546-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNIrJfUxs2ntSwAAu9opvQ
	(envelope-from <linux-media+bounces-55546-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:36:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F175F27A172
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78F1A31C0606
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 21:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6613F076C;
	Thu, 12 Mar 2026 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="OTH4c4+n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7798F3ED5AE
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 21:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351342; cv=none; b=oyT3jzWjAFbLE5kYnV0dN97D1piNF/loK2T65S/0tlSypiH4i+HnhUztotCyKET2OdnSaeVMH9HQnRLqOFOHeQPWDsEw16pEJ4/yS6xRF7DnyGJdBHoKMRCkQzEO6+RA3kRXr1TEGul+LfIGrvoah81060rS2SGMMOMxnw7lHW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351342; c=relaxed/simple;
	bh=cpcuYDX/wVJjN95jEdUgO4+26p09pOR1YZHWQ9wn2yg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CHixPEfknoOPBMuwRptBwQLzP7pJE2jK25/ihSgk/r/HzTVw25AU22GraUb5DvFVAuIKv5BkS/EWYVrwTIs02ZaHL81d/OjfSNQQw6xJEZ7tj+Z2ukVhVjhaPx74SUVZeyEPc+wKohSk2rwWIsVaIT7XPbnB2t6aiczw2kOHJJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=OTH4c4+n; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4670bcc40d7so640777b6e.2
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 14:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773351340; x=1773956140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfsDWd8rG40HiaOOCMmbY5Ukvzyt2CrqouVsAFCuTA0=;
        b=OTH4c4+nVThQWDzxW+5oOaG9dkm6BUtO9gYeLruMFd8tAg2zwKB/CZ6Bdq1p4NZHNC
         BRKlBnKufGHipgNCjO2yGZADjhuCEAoLN67+JdrCHytnAtUWzxWjKipnePpcltonSRg1
         N3Bd46m9AQFPdQTl8RskCJx0z3kcGfJ4nmEmQHjiob08h3HwVeLd5tIlRuxefn2ixq7Z
         XpGslaP+gjz+nu+Z3R9y8pQhL+qx7Z+tzzs9oz/nD2NOO61xr/E6h0s8UA6uDUvmwKAa
         w73XKApM7NLTXhUiOig67CYq5bBnBBEdn/rHwLiEeRneDJuZlOyJkmZU87vYyTdV3uZk
         gvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773351340; x=1773956140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dfsDWd8rG40HiaOOCMmbY5Ukvzyt2CrqouVsAFCuTA0=;
        b=Q/czVmj8yy979LhkpjHvtZOao76RAQtvb6Mz80XT9PLPHnnCm2V4luftS4kxT45QM2
         yr+NWuF/JkO+JJjVexm7spRtx2WLqMl/p/pPMhT6Ue3G3AtDn8GUAxIEGRXYu2KBMz1L
         lO+x6+Zc1fKrj9Y/XxdyXxLdNLDl942t9wWAy4bIPRXa26WPjgAIyGrYfDrsvrUxRIRL
         jj5KXxLrmaYeehq28+Umpm8JfxxFIOkWqwubtZpNDMlIdT6g9BfoCd/wgpwpfGqWwrQJ
         tE/sB3gQXmXGlS6G6SeyfNdSDGcoQb6aCK+d2UTuLQKYQaRvVBNOU1ZdgPnqJ3c+mCEO
         H8HQ==
X-Gm-Message-State: AOJu0YzkFRj1q2lyvJUTOo4UzBahGwvxVh+cgvN/MX9kfB4xjzXmphZM
	r9fIFuRl/fxVZTRV6W68ypS/jPI4cPfNuFYw0WyvZUPuxay2cb5ThuNwZ4Fengg97VVr4V9Ae9f
	I/pTnghM=
X-Gm-Gg: ATEYQzzzirrrABNIGzTsWH87v4pyj8AlP8wBFXuFk2yIrgt8kb0pTIkrD8ji7k3+x6l
	yvQLMKjec59eCGwnPBQ4O6ESRj3dqzz7vvtDBFw7QeqzX6bqEH1rLe/zjkj0/2KcvR7/fv/nE84
	wuEbkA6QcZrWkKyTFHLaznPzJNjNou3J6ivskrEBiO7sUpoCmOfQ06jUFGhYo+DuhfHycRMKiB2
	LxacDD9dAL9QhmYIT4s4fVaN3ewUOBqhS34EN+VUJmmdfUIWs7Oarc4iPV9HgVT1Q8EIY/3g6Eg
	vBDZqoCUmd+Gj+Jp4CdDn8mcyMxwZiVvriKSfrgiXU7qy/sHRlfEzX8sWIBXofOOuz+M+J/aSGF
	Mvo3MPGj9ATQRq6pxG8N0SZscjbdxRa+LpWkvrfhQmVUmw0O8dpbIr8p27BVdhG1Ca3ORn/UbEL
	SdwYZoRWeht+6IrSm2oasLiETKF0wwOak+mwK8wTCKQUo5c04MF6cS9fNRK4bUlPdXtsKNuqD67
	+bZvNpntWEkIC2zm/A=
X-Received: by 2002:a05:6808:1409:b0:467:ee:7a2f with SMTP id 5614622812f47-46757186adbmr544545b6e.28.1773351340215;
        Thu, 12 Mar 2026 14:35:40 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4673415c264sm3657572b6e.5.2026.03.12.14.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:35:40 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 06/11] si2168: Fix i2c command timeout on embedded platforms
Date: Thu, 12 Mar 2026 16:35:27 -0500
Message-Id: <20260312213532.2907276-7-brad@nextdimension.cc>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55546-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: F175F27A172
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On many embedded platforms i2c responses through USB are not returned
as quickly, plus constantly banging on the i2c master receive essentially
deadlocks the driver. Inserting a 3ms delay between i2c receive calls
and extending the timeout fixes all tested platforms.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/dvb-frontends/si2168.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index c4bbcd127cac..9f2c503ec331 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -40,7 +40,7 @@ static int si2168_cmd_execute(struct i2c_client *client, struct si2168_cmd *cmd)
 
 	if (cmd->rlen) {
 		/* wait cmd execution terminate */
-		#define TIMEOUT 70
+		#define TIMEOUT 140
 		timeout = jiffies + msecs_to_jiffies(TIMEOUT);
 		while (!time_after(jiffies, timeout)) {
 			ret = i2c_master_recv(client, cmd->args, cmd->rlen);
@@ -54,6 +54,8 @@ static int si2168_cmd_execute(struct i2c_client *client, struct si2168_cmd *cmd)
 			/* firmware ready? */
 			if ((cmd->args[0] >> 7) & 0x01)
 				break;
+
+			usleep_range(2500, 3500);
 		}
 
 		dev_dbg(&client->dev, "cmd execution took %d ms\n",
-- 
2.35.1


