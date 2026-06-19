Return-Path: <linux-media+bounces-65273-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FNkpIkUnNWq7ngYAu9opvQ
	(envelope-from <linux-media+bounces-65273-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 13:25:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7096A56A7
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 13:25:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=fra1.rp.oracleemaildelivery.com header.s=prod-fra-20191115 header.b=cxWJOh+h;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65273-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65273-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=tuta.io (policy=quarantine);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0D9F301F7BC
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 11:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C335F37B00F;
	Fri, 19 Jun 2026 11:18:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ach1ajh125.fra1.oracleemaildelivery.com (ach1ajh125.fra1.oracleemaildelivery.com [138.1.108.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B231D370ADF
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 11:18:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781867937; cv=none; b=Le5dFYP61gN4LrulgP8sdiOS3XzcBRaa0GpdZc7pRGRgWAvtN6DVDYJ5Lms8hM0Cxv7+78kwNty8vK6H6soUVUbv9JLjDI7AuxyHat9HFMQn+DK1FQi8V1uwfiQQ8CPDPn4YBvSylsOZzWaCcXGUPlODrzyJRvmgCuDMvMYiU6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781867937; c=relaxed/simple;
	bh=yUqsEQr/jT04FwCxmCi0ja056F/j+KRH1JyuTm/60II=;
	h=From:To:Cc:Subject:Date:Message-id:In-reply-to:References:
	 MIME-version; b=g7/Q9HJ6GP7gRbdnWDDIng3cDhGEMLLluL25RFQoVi0nq1DkXNwTi6nZcewue9gmAXJnXd/KXAuZ5L7mb2tVatWIMkA5PulhJlLGOUmb8D5lyb+R9CkIWDVxVT7xwPMZC0kASYtqCVlWMyMRB388UFqNGSVwkaUjWVBAvPL25lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tuta.io; spf=pass smtp.mailfrom=fra1.rp.oracleemaildelivery.com; dkim=pass (2048-bit key) header.d=fra1.rp.oracleemaildelivery.com header.i=@fra1.rp.oracleemaildelivery.com header.b=cxWJOh+h; arc=none smtp.client-ip=138.1.108.125
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-fra-20191115;
 d=fra1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=6XHOLVNfYc8PIK7z4Ng9VzyKHaePVd2K3FxJTjYMoD0=;
 b=cxWJOh+hmpHpYUX/I0jQMH7lnJO4WS1iFWI0pE08aXk1NeorsOJy43hfGhdHEztYXHv31/EDnZJH
   drdzYhrjoAno0Nd+nhFlT/ck/y3EOLhm2B6LvBg2T11cMzMJjlNdG90uMgRaB7GQfhK+ezFmhPWx
   dp3ocuej7SvXOI5tt8+DfptXqPLi+J+tdGOO2mRTsRlGn7Xvd7SkPyzI5AaqhP2u4iZVTEvFQ5xo
   UARKKpOXddzYAoT4VSyv3MTMSX7Db/tAG6xKO8coH2RKOHxh9frwG8eaHSDWW2IAXiet7estrdLM
   Zs93hg8DrDCRjgLeySVJ4+NlUWwoBdLO/OBTSw==
Received: by omta-ad1-fd2-1401-eu-frankfurt-1.omtaad1.vcndpfra.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TGV02OJLM3I2R50@omta-ad1-fd2-1401-eu-frankfurt-1.omtaad1.vcndpfra.oraclevcn.com>
 for linux-media@vger.kernel.org; Fri, 19 Jun 2026 11:18:54 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Laszlo Fiat <laszlo.fiat@tuta.io>
To: simon@symple.nz
Cc: detlev.casanova@collabora.com,	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,	piotr.oniszczuk@gmail.com,
	Laszlo Fiat <laszlo.fiat@tuta.io>
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
Date: Fri, 19 Jun 2026 11:18:10 +0000
Message-id: <20260619111810.564384-1-laszlo.fiat@tuta.io>
X-Mailer: git-send-email 2.43.0
In-reply-to: <1f178828-2cba-4120-bc6d-bb3be7b24073@symple.nz>
References: <1f178828-2cba-4120-bc6d-bb3be7b24073@symple.nz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta:
 AAHEBF5Wo5zo4vZcl51G3QQ/nsUQJAqJmt+1l4LvQ0r+TmC9k8mvhq/SL3JumIek
 LC5KmDFa0ezU/jXPQSGKeRg1wCVyaA1bb5gepJj1yaIBG2BwVSREOSRsIdLxKeIk
 jCnvulAiYWQyCmufPRUsaDve4wUi2Po58Di6wTwCZn/BOzc6xDBA+OZPHCZd9wjd
 Pe7Y8iuaZ7N6pl18bB1MnUteerXt4IrsyHUkbhxQHdqVydiQUa5e68PRIFw2ldjE
 LXATfcfDa5BWE35UkPEx1Dnn7lgeLspL9byJd6M1m2L4TL40nLBWBqSLP5MMXLX9
 yM+90J5bBSurQR2b3u9yye5bKGki0mFKpBuikofeWWz7kUWl74Ya39u68hm59ra7
 xNdJq5Vb1OGLENfLz7ma2CmPiRM/5EG23HvAcsFd118mDi5SyZ86EdhaVOYx20rl /c0=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[tuta.io : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[fra1.rp.oracleemaildelivery.com:s=prod-fra-20191115];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:simon@symple.nz,m:detlev.casanova@collabora.com,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:piotr.oniszczuk@gmail.com,m:laszlo.fiat@tuta.io,m:piotroniszczuk@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[collabora.com,vger.kernel.org,lists.infradead.org,gmail.com,tuta.io];
	FORGED_SENDER(0.00)[laszlo.fiat@tuta.io,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65273-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[fra1.rp.oracleemaildelivery.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laszlo.fiat@tuta.io,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,tuta.io:email,tuta.io:mid,tuta.io:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A7096A56A7

Hi Simon,

I've experienced this problem since Detlev sent the VDPU383 support patches to the mailing list.
We had a brief e-mail exchange about it in January 2026, he couldn't reproduce it.

I've tested your patch available at [1] on 7.0.12 stable on my Rock 4D.
The patched kernel builds, the expected "RK3576 H.264 deblock priming..." line shows up
in dmesg, and this is the first time I have H.264 hardware decoding working properly
on the Rock 4D.

Thank you for your work.

Tested-by: Laszlo Fiat <laszlo.fiat@tuta.io>

[1]  https://github.com/SympleNZ/rkvdec-vdpu383-h264-bug/tree/master/fix

