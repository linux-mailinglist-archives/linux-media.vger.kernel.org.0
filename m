Return-Path: <linux-media+bounces-55802-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KfAE5RutWlz0QAAu9opvQ
	(envelope-from <linux-media+bounces-55802-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 15:20:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE09A28D7BC
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 15:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B6FA3031AF7
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 14:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9131376BC2;
	Sat, 14 Mar 2026 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="EGLEwi+W"
X-Original-To: linux-media@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6262239E76
	for <linux-media@vger.kernel.org>; Sat, 14 Mar 2026 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773497990; cv=none; b=OMDceNxs2DRbiMtR/uLqhfZeAnJ53yxDRKRKr/Og793LccMVMDdZamtHx70fNzQtbtIifFZyUJsqMu7Q9T8rOi0eFV1jB6wQGlKIgavHH87RLuqq3bNhHxpGY3r7UhS3y2r4gnc7Dqo0CNNeslqaTn55B+91JsxIWfOzMZDS7wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773497990; c=relaxed/simple;
	bh=+Q2NHbqyScT8pUlf7wHWUJIw0RO1x/ZiSkOBZGtVGzI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:Cc:To:
	 References:In-Reply-To; b=GRuSsRVzwu2jDGZUXRangNzJFqfRN2EtB25x+RKE1gtCnRnu0SFRTFLOxbIfz0yifW2wIaVVFdmhqTce2LJ0WgLWO6vHkdNTrzlQTScbHz1a75/yKYGymjghXBqulD6meq1ru4aqH+EDO9Vn9KJ5kG5UaV6chnqHF2ogco0IQJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=EGLEwi+W; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1773497976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xl+Uf18fqruXHqchg5arUmkQufHcl9O3lBTne7YsaaQ=;
	b=EGLEwi+WJkwvV8gz682AmrPTMD1U66aeOBTeWeosWn8TziuY17rzTDlXucPem7yuwUbLq7
	k3uD0kFRayntDssYJGY5sVuAI4wWbmSzOu41+ADPrUqBWx/pcBVOU/y3PRMs7gzvDGYPQp
	pAUXoiRHvDVg7A3RYc4ZIKtqh/wY2k3K/nqRwi0G2EU1+QwCIg9Yt9XjmSAnqGUL6Hxno4
	bUE/fjvSpd7TFrBVCvYoMrAD9BRmxj8kEs1IeCwDxG1FQZv8v6n0o9bdsXtqGvZM0FsP3S
	0NOxd6rWdW1wq8uXlM6U+ImQcs3Sb6OhNdv01nvwlWX2ZRas/1r+Da2eeYSf5w==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 15:19:22 +0100
Message-Id: <DH2KK4G8Y2K1.3VO7LIFPTGDV1@cknow-tech.com>
Subject: Re: [PATCH v2 0/3] media: rockchip: rkvdec: add support for the
 VDPU346 variant
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
Cc: "Christian Hewitt" <christianshewitt@gmail.com>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, =?utf-8?q?Olivier_Cr=C3=AAte?=
 <olivier.crete@collabora.com>, "Ezequiel Garcia"
 <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heiko Stuebner" <heiko@sntech.de>, "Diederik de Haas"
 <diederik@cknow-tech.com>, "Dmitry Osipenko"
 <dmitry.osipenko@collabora.com>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Dragan Simic" <dsimic@manjaro.org>, "Chukun Pan" <amadeus@jmu.edu.cn>,
 <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Nicolas Dufresne" <nicolas@ndufresne.ca>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
 <ee0fd1ecc6c940811cae743f087e96d348909c9a.camel@ndufresne.ca>
In-Reply-To: <ee0fd1ecc6c940811cae743f087e96d348909c9a.camel@ndufresne.ca>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cknow-tech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[cknow-tech.com:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55802-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,vanguardiasur.com.ar,kernel.org,sntech.de,cknow-tech.com,linutronix.de,manjaro.org,jmu.edu.cn,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[diederik@cknow-tech.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[cknow-tech.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AE09A28D7BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nicolas,

On Sun Mar 8, 2026 at 10:40 PM CET, Nicolas Dufresne wrote:
> Le vendredi 26 d=C3=A9cembre 2025 =C3=A0 11:31 +0000, Christian Hewitt a =
=C3=A9crit=C2=A0:
>> This series depends upon Detlev Casanova's current v7 series for VDPU381=
 and
>> VDPU383 support [0]. It adds support for the VDPU346 IP block used for H=
264,
>> HEVC and (in active work) VP9 on the RK356X boards. VDPU346 appears to b=
e a
>> close relation to VDPU381 used with RK3588, except with a single core, o=
utput
>> limited to 4K, and minor feature differences, e.g. HEVC level 5.1 on VDP=
U346
>> vs 6.1 on VDPU381. To handle differences we declare a new compatible.
>>=20
>> The device-tree changes are derived from prior-art in Detlev's patches f=
or
>> RK3576 and RK3588, the vendor kernel [1], and some earlier patch attempt=
s
>> from Piotr Oniszczuk and Diederik de Haas.
>>=20
>> The register differences between VDPU346 and VDPU381 appear to be minima=
l so
>> we currently and intentionally reuse the VDPU381 h264, hevc, and regs fi=
les
>> to avoid duplicating code. There is some evidence of buffer size changes=
 in
>> testing which still need to be explored. If further register analysis ne=
eds
>> separate files for VDPU346 the refactoring will be beyond my current n00=
b
>> coding skills and I will either need some coaching or would be happy to =
pass
>> the series over to a more experienced developer.
>
> A fluster score and explained error report is missing your this cover let=
ter.=20
> This will probably highlight some of the instability issues reported in t=
his
> series. I'll mark the series are "Change Request", as you have few review
> comments and now this test.
>
> Overall, I'd like to see probably investigations of the problem before go=
ing
> ahead.

FTR: You replied to v2 while there is a v3 here:
https://patch.msgid.link/20260110053727.2295260-1-christianshewitt@gmail.co=
m/

It (still) doesn't have a fluster score, but it is the currently most
recent version posted on the MLs.

Cheers,
  Diederik

