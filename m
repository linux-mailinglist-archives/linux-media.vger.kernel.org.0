Return-Path: <linux-media+bounces-58606-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ra8DBBSa22nbDwkAu9opvQ
	(envelope-from <linux-media+bounces-58606-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 15:11:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 593163E3EF1
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 15:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF6593010530
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 13:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C329137BE91;
	Sun, 12 Apr 2026 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5Ge7AyB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF1B33F361
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 13:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775999493; cv=none; b=GrbiYzcUQga4F5lJJA7le79B7VNN+iwjtdvukCduzKMF87fxhxgjz7AxDbZHl+ZA5AVcB+zGvYNim2/O429f3lSL+cgByvtrduMZu4M48jUhSy+T4YOCZvgBY7mSm2R84/j8AK8K+COodU/3JuJ/zlRmuFe6QIwvxyFc7r8uL1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775999493; c=relaxed/simple;
	bh=9ORhOmOo7pQGqV/KEhfoDyzVQztENrA7wLaHnm7HUIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uv0Hx19FUjaqIZyNb4/H8yyTVOUDIg/tvdD7DdMos+CKysg1LJa3+48xuBLS76c1y5cTZc31e+ht9XcoieVBKruffW/ALBP6F3woSXM+Gfgut9iB0yZ4otZTMEA08e/Gq/KsH98nLSM3v01OtB/xMn3qjvIFe6BUil4CRSt4lAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5Ge7AyB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8d7f22d405so530488866b.0
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775999490; x=1776604290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xXuLy3cmAMuKNsqyUuKisoZNG/MVNRRAYF77qaziXP4=;
        b=l5Ge7AyBMwumyNO3BtrELHu5PuNbVHvfg5PMNoqsBPLHECCthO5DbWwQk6O8DIu+Aa
         xYQMfUYNKL5uP3In9cHH1Fzy26q9Rb3Is+YTLtvE+r4j/LcK52vbD553C09b5e28YFIG
         rTTl0IEeW03yRiv7qc20ZYQsJWy64C9UMvFb1aUNf1td6/hL+68iOmdpqrKAYw5fHYhc
         KE4SDp9khYQrQPGt2pyTdt1GUkWUTXxXgcPKt9HwW/oSRgmsd7HGoULl1leU+3mgQEXm
         ujrT5pOVGI8MEwkxOj4jipPdwuLgAUw830LXvmcvnwvD3RV4D+z6/b/VN0M5u2F+rtQL
         7ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775999490; x=1776604290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXuLy3cmAMuKNsqyUuKisoZNG/MVNRRAYF77qaziXP4=;
        b=RjXGNEl87gNr5MK14ZdKfZkKp2Dm3+iWqVqZP7jEA/ZbKzHOVK1HcEIqjRqX6T7B5G
         WPzHkOHl/XaPCkaubIMBGDvABtJAHEfnPzi2/0SVdNhvOHE028sMwypj12KM5ti7N4vk
         vg/UcdWniQc2JuqUuMNmlKUaTr5ajSkqSIdgS0axHJlRapmbJPrVW/lHZcQ+/jLpP+fq
         CPDuFZCni9qhTRPvmmtd7qacOvME7lIM7UEjHKFSgtR+vQQPUEIcTS4YbKxbAb1GTGD0
         tRq6MHbla5qIjZ7p1+fb4ZSFJz22VcSFGaWgUfJFFCmJYLpDutlzkV37u+A2jF3wmpB1
         Vo2A==
X-Forwarded-Encrypted: i=1; AFNElJ/IJev8Gp0ppOVEx8ddpxPIGEMsrBGeSIi2aUVJG/rxi2OzAIEcFcV/mCA4bwr7tV/Z4D1NfCSay04e1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Vh3ohb8zTAUC5r6pz1RaEik+eHc5kp7vqihn9/SAig7JonHK
	WXxil2RUDRTZEnt41lMFp8k70u8K86KKhSR63ngUqYKCr0CNuMbSiYWmAEWEy9DMtiY=
X-Gm-Gg: AeBDieuuRD30ygTkyIcXmQ0FoBEHEwNGq9TSq8EP4clT47ecAzsWXsLjzeTLR75iKB8
	hUC0mq7CiB1sYMpqhSGoxj+DUl4nFYEdkqDR5wyYHW5pAy4mmhmVCuaiLVpeaca+5E/mqyZntag
	qYW+uq/vQjVQG/QUu5MzwGtIGtbPCKURrKnD1TQZtTTQOdgSs6I/FIsOIiUZqsOhL0Xg+1WCh06
	omtJib8uoxhxqf2zHyWIcNBHp3jMozncHEPmc0ZUfHXBTk7JeI1LD3kl7cqUocWzMRvBX8Aezj0
	3hsFGUVZ5VTJ4WIxJCww7vmgyfUxUdnLUMt3vjdLzKuz6Mxpn7V27oNjQJX1WeHJMAq8rUKX5lW
	cvF+AdZk3tWVGve8pvf8/7ZkP1OzV+HASrDPH+DC9uaIwJQipeNmSPhw1J3fSCTSGJ3F4KlnPgX
	kEbnHiJPxf7eauFl/cmNnxallTLMOzWQ==
X-Received: by 2002:a17:907:a1a0:b0:b9c:69df:4d8e with SMTP id a640c23a62f3a-b9d7298091fmr391580866b.25.1775999490059;
        Sun, 12 Apr 2026 06:11:30 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1ccb:26a3:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c56d3sm243600066b.32.2026.04.12.06.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 06:11:29 -0700 (PDT)
Date: Sun, 12 Apr 2026 15:11:27 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: syzbot <syzbot+afc686a471d70896c5d9@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] memory leak in vidtv_psi_short_event_desc_init
Message-ID: <aduY8CsgJq3SUXD2@gmail.com>
References: <69d411c9.a70a0220.a26f2.003e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69d411c9.a70a0220.a26f2.003e.GAE@google.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58606-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,afc686a471d70896c5d9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 593163E3EF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

#syz test

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index a8a76434989c..61186d219b7b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -543,6 +543,11 @@ static void vidtv_bridge_remove(struct platform_device *pdev)

 	dvb = platform_get_drvdata(pdev);

+	mutex_lock(&dvb->feed_lock);
+	if (dvb->streaming)
+		vidtv_stop_streaming(dvb);
+	mutex_unlock(&dvb->feed_lock);
+
 #ifdef CONFIG_MEDIA_CONTROLLER_DVB
 	media_device_unregister(&dvb->mdev);
 	media_device_cleanup(&dvb->mdev);

