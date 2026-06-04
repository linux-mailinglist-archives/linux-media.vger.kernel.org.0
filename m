Return-Path: <linux-media+bounces-63791-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YoLWCLOJIWqTIQEAu9opvQ
	(envelope-from <linux-media+bounces-63791-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:20:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CDC640C83
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:20:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=F6bnUYbt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63791-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63791-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=pm.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4F1B3113569
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 14:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E650347DFBF;
	Thu,  4 Jun 2026 14:04:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268F83E2751;
	Thu,  4 Jun 2026 14:04:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581896; cv=none; b=Cz52EYSsXsTW4UPsoFiVMFtYDLIWmjVAbXC9L5YsSZ0CE3wxf0+33P2ZNmULcTyN+EuPRymSpWd2nG3twgTkCjPHX63CaFmVujnj5VNIMciC6m/ifeW6ZnXeOCZuwdc/UQBvRvKN3ONTGmfiGlzs98Vp86qTs4284kF9V0sQ4+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581896; c=relaxed/simple;
	bh=jyKBIcCT1hxHezZbwB5nqXBtL0MX6wXxR19jVjOssPE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OthwcqrQlj8SrS6imzzV7h+Ve90EbMK8JhvpOytM9p8E8NxsPejebSgS+aGknn1155V08Dz40jkINljprtuUN7o0i6nf67PwrlNoWMNuAyP1bPEB6BrQ3wbWtqsqJoJy2nVC4rOQ8ADHZsxzZ4AfB8gywv0YkA24/J+N76l1Un4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=F6bnUYbt; arc=none smtp.client-ip=109.224.244.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780581886; x=1780841086;
	bh=Lmd8jPKsPgXoEtRoEzRG/Af+1/6hYOlWuF1RQCZm/BY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=F6bnUYbtOZvfGev0dgV+iorSNregKT7JH38Mi4XLoWs8TwdmsWmBf45obmIn7GtdQ
	 SDlDsUIWd6/TYA1vYToQnLS9obXaBlnfZKP9Bf0I1h0WhbJ3KiXF7U8BZ0V/sj5PZH
	 /jTI0T0j/Krf8rfPxMtAQGfWcSjx4Dph2aQyf/yIaVgoxGjkENi96LZbaMK7L4tD2B
	 kC43A12fUbJTTS7A8duQ9asZbD7llhdwPgrHVeHcMJVgeLSlymOivsVnunfcANi2pq
	 APUhGBlo9vP5j2Rxv1d9GxRlBqqXTn4Oo09t+NEmyYE/I+Z1Ba+9r01tM93eaJFwZD
	 cryEcwZ6BISSg==
Date: Thu, 04 Jun 2026 14:04:42 +0000
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: iris: Add support for Milos (VPU v2.0)
Message-ID: <-iGUTQXDwv82wFFK24QU_oAgyyu3JMeq8V9nMKTafEPcC_McchQEW7T7npIOkggJPXY_K6SogruAf5pZtqG26-WyaGN7ItBR-J_9CGOHH1o=@pm.me>
In-Reply-To: <a17e8272-b8c9-e6b6-6f5f-adf3f0f91424@oss.qualcomm.com>
References: <20260529-milos-iris-v2-0-7a763d7195ae@pm.me> <20260529-milos-iris-v2-2-7a763d7195ae@pm.me> <a17e8272-b8c9-e6b6-6f5f-adf3f0f91424@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 2f96564793f61257723ed528a1b886733121e797
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-63791-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:mid,pm.me:from_mime,pm.me:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94CDC640C83

On Thursday, June 4th, 2026 at 8:16 AM, Vishnu Reddy <busanna.reddy@oss.qua=
lcomm.com> wrote:

>=20
> On 5/30/2026 2:28 AM, Alexander Koskovich wrote:
> > Add support for the Milos Iris codec. This only supports the variant
> > found on the SM7635-AB that has half of it's pipes disabled via efuse.
>
> This patch appears to be based on an older codebase. There are changes al=
ready
> merged in this file prior to your submission. Please work on latest code =
base.

I rebased on top of 7.1.0-rc5 before submitting, should I rebase on linux-n=
ext
instead?

Thanks,
Alex 

