Return-Path: <linux-media+bounces-61073-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJnGFYyjAWpKhAEAu9opvQ
	(envelope-from <linux-media+bounces-61073-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:38:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EEACC50B0D1
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 68CBA30182ED
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9413C1961;
	Mon, 11 May 2026 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="vVw1FiXc"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4203BF684;
	Mon, 11 May 2026 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492224; cv=none; b=cRKvQVaQn44Gwb48mP6wHe6ama29odAl412PPMb2dD8G+GZBdbrHvrjoRxwHj5NgPGR8XxZ940fD6KrQGv4cRUwKClqBSpLGvpY90jX9r1MvWvQO/JJwC3daD7zxSUdxKLpqM95LPARMfH5HIaPDSMaR2WVypzhygfIPhFqBqoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492224; c=relaxed/simple;
	bh=uH3ZWiM3HP8IOlhsaGFBjJo68aLk/9GptBzpH443orc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=q9DRK5LAFt+Xa1mFSljmbRc9hFePfn0UhP4kp7jxlS5UTieuSxS0odwa50O1X1AAjKRR4r62ymTli2Ad9XA+GiSYTEdI6lHU/TCL1gv5UZY1Di5g8WUu5k0SwyEZf98ltA2PDqotPkZ2Fm0uMUmxBGpdqAEO+GkHB2W+/bFqmOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=vVw1FiXc; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1778492193; x=1779096993; i=markus.elfring@web.de;
	bh=uH3ZWiM3HP8IOlhsaGFBjJo68aLk/9GptBzpH443orc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vVw1FiXc7nSRfMeQILxb+4PoK9JO0SUvP0h1gXAopDPGB+vU/VznGgXNXxzf0+lB
	 7Yu6md4LyovAWZM+ujk+x6RAliN9XXuk3kBy5aYn52YkYHonAwYo5WZykeqXoLQLC
	 iQHMHCMqRBmCHlw6OAflmopup4oSFw11pBqI8giSVpcSDUDPqRfI2WhT/tgZ6GJtj
	 AUsbs9UDigJLDciWX77FL5cN5zy+eNgEB0aqKGGFKjHTOA/EpAaYKtbxCHZeJjg1k
	 2NVN9mESz/bQAJ+6vCvufvafrGpqZeu3Vk4hucV00OFMBYie7MBWJJD9xOrqjbsGc
	 6vNNFE0JgCt2Utjjwg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mr7am-1xAGXP1z3G-00fmxV; Mon, 11
 May 2026 11:36:33 +0200
Message-ID: <bd8e38d7-1010-4f04-8b28-38789596a502@web.de>
Date: Mon, 11 May 2026 11:36:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Pengyu Luo <mitltlatltl@gmail.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Hans Verkuil <hverkuil@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Martin Kepplinger-Novakovic <martink@posteo.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260511090924.269106-2-mitltlatltl@gmail.com>
Subject: Re: [PATCH v3 1/5] media: hi846: fix hi846_write_reg_16 handling
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260511090924.269106-2-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fgcAGPKJQZ4ynft/BV+cJqs49FnJ9QCMQMx5Xh/7+aTwz6W/oHH
 OW14R2/9wSUIiM1MXRF9+CgWlIwyIizjJ0qROHdWJ4lKcPQMCQfllvqVZ254MXrPmcuW3PP
 bhcqmNCt4XlHiZ/pd35/sZpPD/qvtNzW/m3bbKCFnyDAuRHyJ3gnNYhhXnJ9KpTGa6F6THx
 zseo30j6t73ICodaK86Lg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:25Rt7WHq6mw=;Dxo6zWfT2WGuELoALeewyBkcDg/
 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
X-Rspamd-Queue-Id: EEACC50B0D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61073-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,pengutronix.de,kernel.org,nxp.com,posteo.de,linux.intel.com,puri.sm];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Action: no action

=E2=80=A6
> Fix this by resetting *err to 0 only when it is positive.

How do you think about to handle return values by an adjusted interface?
https://elixir.bootlin.com/linux/v7.1-rc2/source/drivers/media/i2c/hi846.c=
#L1265-L1282

Would a function signature (like the following) be nicer?

static int hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val);

Regards,
Markus

