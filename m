Return-Path: <linux-media+bounces-65012-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ih2nNXZGMWqifwUAu9opvQ
	(envelope-from <linux-media+bounces-65012-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 14:49:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 562A068F971
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 14:49:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="FhKT/NLU";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65012-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65012-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F065631C940E
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 12:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2AF364024;
	Tue, 16 Jun 2026 12:44:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC1235C1B7
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 12:44:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613876; cv=none; b=hOYcaNy2iYC1QQn8LDln//wKeIWob+M4SKnjqvwFLtdQNyZ6ulwJA39s+zcEn1gdFE3+aSySspG6sUFoJX2wDl5H7aIZPKnzKmHRTZ56Kq9lOXQkuDLM9tb8tJ9dlPOWa7l0tAdY+JlapSzq4bZ3m4pQlr1+AG6Yw0vvVoo4dxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613876; c=relaxed/simple;
	bh=cGak6UewSIZR4QJf0NQn8w11AAoI6SOu8XcVnj7aWv0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=oR7DhV3oHzEKKNKMFlSBYLPV19axeVpgZhFk8pzdB1ABvICVN9vWlouPdVPWflEsG6Bsh1ZhF3qYR+5b8Fu0iXXMhqXtijIdmdhePHf8BQILHzUT7Yi8I47Vl2Ci8ERB++3DCuorVRXAC9JgKjS8cXjX54EDHhPTs7IBakh55ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhKT/NLU; arc=none smtp.client-ip=209.85.218.45
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bebde89cfd3so556880266b.2
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 05:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781613873; x=1782218673; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWwKLVsUIM6MytpX93dCt41pC6tdKxTrq94U49oj1AE=;
        b=FhKT/NLUbc5uKRjzuOF/t/Bo//kvV9gy6EpSz1mFGUirp/kyBhiZ6DBzRUy6nTPW9L
         9KhH6FwzqcYKrOYPVfjO3AN3hzYnAHbCfE8eLJ0dfAEetrL3LGkTXD29fG0CxDyop2/k
         alasGP2AIKxVMjJt4A1SqhU6vNS1O1iJIdaodyVpbiI8DX9qhoIrP1H0gCFmt/Wk7CHv
         sfEpC/tstXPRpzHTslFH1Gh6u/gFCMahqaNFoO6HvOR/eJqcOPw+b1/LsM+KJcsKPoIh
         C43DYZwHr4CU++JvBW7HV1WflMlRzTvxS2jd2I7S1lN3L9l8ooVwOLNbsdtAqlMuJSdn
         nOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613873; x=1782218673;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWwKLVsUIM6MytpX93dCt41pC6tdKxTrq94U49oj1AE=;
        b=SgCQqBC/iXpJ/P99CJG2ss1CqPlrMYxj42E3kMhYtEBss5xCtD60i2GIXZJdPSsGtd
         QRA957R5TSaenhzm8UsefWNYxdQWhe8DwEBajZIEJyS08jgrtXvDYQ7eQkgp/r+hFtmq
         xOHst5vDgHLwbqT0wZujgFGwCMDeRXUzhbBV7+zjIY2nTjIAvHWL6hKCLg228dQoh9+r
         t7K//Cu+CsalvYOXw06S9Ec6cIH7l9cW9F2XKi8eT6GLZ7zfZXguKPKlez/sULyEKWr2
         APzw+6a/WXCFtDGwG2hOakXa8W4VuoHRwDeuTCfkUulpZ7MCJvYWxBvLFsh4QZlq4RAV
         T/vw==
X-Forwarded-Encrypted: i=1; AFNElJ/FZna/fZx1qNkHz7Ie8NsPOh+j/q71o79HeyS/csPqFRiVA3vj9zZgzAJGe9K9gQ8WpVkCNE9NMCdTJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yylif6O0+36i3Pr6iHFa1ZDqD8pdWL2neK2VPsqdsCWmNOVuE5T
	jXeR0EBVourDTU4jUnfmCD3X4XjB/rNKCa3fwJ1ULtrRUQ5P+FpqIqU46PzSVu3/
X-Gm-Gg: Acq92OGkR49mzdWtXPpTDd8WruoR2SUh+oExrQeeP813uMXsjYa5arPEwX1S9w2yxUG
	sBYvqKtBIxsYuOLLvASChfSZh7TSEHFesocYuO84KVkTGbZj7svog7W1DxqjHmqV3YAv1a86CQp
	CaJI09MWjAaxmrNgrgWzVq+IHgh++4KVdrKp5p/HUSEkykl+OMtmhm0jVCqsR/Xkmr9EErD9Jrb
	C4UkptA+JM2zQ63thJ7T1/Wk/mmW+11et/zxdyzd3x1s7VJ7FuU+yHf1QdIXphHJaMSTH5sN11g
	WxqM0ojUg/ErDbUgPrgES42E/+vFxEoj954RR62lcI1CBHCx4+7HIwdhGDY/If1URLIxdFYCi3R
	A575IbAcET/LYTqADs1d5Uj5g9OThYP937eUhoQMpjy0NBaYKUKNHpRLy13fk5rVt0NmUYtceSa
	NxpRJlblWLVCDzDfhQqHWk92gAdua74lJw3wYj+YM+LoOU1s0rvmQFKSqLaC8uJnLUlufzNrzgV
	VpVl4EVDzE248Cyas9t
X-Received: by 2002:a17:907:948e:b0:bfb:1e1c:3197 with SMTP id a640c23a62f3a-c043d9af661mr198808866b.41.1781613871788;
        Tue, 16 Jun 2026 05:44:31 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420570sm641059666b.11.2026.06.16.05.44.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:44:31 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <1f178828-2cba-4120-bc6d-bb3be7b24073@symple.nz>
Date: Tue, 16 Jun 2026 14:44:16 +0200
Cc: Detlev Casanova <detlev.casanova@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5ABBE81F-3560-402D-B9D3-94F6D9842A4B@gmail.com>
References: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
 <5939C396-3A70-458F-8E6B-A55319929564@gmail.com>
 <4b3a9f32-807a-4b9e-8df2-d22f872d288e@symple.nz>
 <2CB1844A-3DB7-4973-98E0-0C141DD38B45@gmail.com>
 <1f178828-2cba-4120-bc6d-bb3be7b24073@symple.nz>
To: Simon Wright <Simon@symple.nz>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65012-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:detlev.casanova@collabora.com,m:Simon@symple.nz,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[piotroniszczuk@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piotroniszczuk@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,symple.nz:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 562A068F971



> Wiadomo=C5=9B=C4=87 napisana przez Simon Wright <Simon@symple.nz> w =
dniu 11 cze 2026, o godz. 08:15:
>=20
> Hi Piotr,
>=20
> Short version: the in-tree port didn't actually have the warmup =
running (it needs a
> probe-time buffer alloc + a pm_runtime_resume hook, not just the =
decode code). Rather
> than pick that apart, here's a clean patch that wires it properly - =
and I've now
> validated it on hardware.
>=20
> The patch is self-contained and needs no devicetree change (mainline =
already maps the
> "link" register bank it uses); git apply-clean on 7.0 and 7.1-rc7:
>=20
>    https://github.com/SympleNZ/rkvdec-vdpu383-h264-bug/tree/master/fix
>=20
>    =20

Simon,

After multiple users tests I=E2=80=99m happy to confirm: with above =
patch applied on mainline 7.1 h264 decoder works perfectly.

So:

Tested-by: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>=

