Return-Path: <linux-media+bounces-57204-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AGeGwhJxmmgIAUAu9opvQ
	(envelope-from <linux-media+bounces-57204-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 10:08:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE23A3417BC
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 10:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19B4630293E2
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 09:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048413CAE99;
	Fri, 27 Mar 2026 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="WGJoDzIp"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A03D245012;
	Fri, 27 Mar 2026 09:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602197; cv=none; b=DHkYsyje88xyPV3+ELwGk7MwPHVI9imfk6ekq3UxgWM3AdAIiZYOFLDdo02zBdDrcL2YmgPB7FZaOsCcshs2CQc9Ticsf2LHg3NN7yniKP/cMp23zhVwIRlQBIJ+f4atCMb0PCgxduX1fTH3apTfmwHLSZMZZy6W8mPNqptssWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602197; c=relaxed/simple;
	bh=2vod2PttC6r53tbUhZzOJMt3d7LNw/UtHpSCE+oxOW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHpnMWd4lQTYmrtng2NnO/GUKaof7UEW6pBDWImahOgSZk3klYj2J0Ephc1jQzY4faIVMxVUiDzkEY0xUmPNzKpnVEktOJMuFDfPVpwkKelBrYhxi43jCcfWKvEhqNjS+t0gkQBccNhWPVxPn5w4Ho1bzg/aRFIzm0QaIQLGAk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=WGJoDzIp; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1774602186; x=1775206986; i=markus.elfring@web.de;
	bh=2vod2PttC6r53tbUhZzOJMt3d7LNw/UtHpSCE+oxOW8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WGJoDzIp/RqQoqkGYWnu4UlVkMIBqbpXGZYRPUU8uMfk5qOfPNO0rE8irIvTOuef
	 uHbZWAbSkE5ZkNeOvafKDiRHUB65ds4pYSNsp/S0fQYWRIXnjWozWA8WVhtCV08gM
	 nB6TBpSo1QAmchKkUJb8uSR10kjuY6j9RoHLB9WGDZnzOw37EMlgMMZVOmERrC847
	 SE/3UyKnAZje+I2DyQHnH6Y0Io24GWNuhy1AaHDz0v8dr/ga7muvJezClPQaXVdAk
	 IRIt2sRMfh8X+7tZ+/vyLI3JN4Q0g2MvUXXADRsShQriAy8+qaNS+Q2ceexmdXCkd
	 QgfFooYqTY6y+aNdnQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mav2X-1vYuzx2tVz-00hHP6; Fri, 27
 Mar 2026 10:03:06 +0100
Message-ID: <30d93e16-19be-4265-9c0b-44fc735bd771@web.de>
Date: Fri, 27 Mar 2026 10:03:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: tuner: add error handling for I2C transfers in
 set_type()
To: Wenyuan Li <2063309626@qq.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, gszhai@bjtu.edu.cn, 25125332@bjtu.edu.cn,
 25125283@bjtu.edu.cn, 23120469@bjtu.edu.cn
References: <tencent_607174B5FAA2EED9C402AC02B548A91B1C05@qq.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_607174B5FAA2EED9C402AC02B548A91B1C05@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IUVXnZiArIv1dr3qJ7Vi6sh2U2tmytcIOjCcvnhZ78tpec4TWX8
 yI22Ayj0MFkq10zhrNrzKP/FbMbW1YESlJACgcodyoJueOpkuRu3uP6dRze6BXVE4fspRdy
 w/oK5f/QVQjvN4UikV68lie4BLhy5YP8+E9n2qoDnOz3O2x83ndCsjW0jUr9qVX7GNJW5YJ
 aboRa9oh+XCgCN3d/0XRQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tQWOyOFW17I=;Wo4d7kUBXznHLLuiMcQtoi/8wYe
 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
 MmAAAhoyaddh5XLlvzZNo24rANWShNL6Q==
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57204-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[web.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[web.de];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CE23A3417BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=E2=80=A6
> Cc: Markus <Markus.Elfring@web.de>

Please choose more appropriate tags.
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.0-rc5#n145
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv7.0-rc5#n34

Will further patch review concerns become relevant here?

Regards,
Markus

