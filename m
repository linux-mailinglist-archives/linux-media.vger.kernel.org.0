Return-Path: <linux-media+bounces-66832-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5wh6MTjhTGrfrQEAu9opvQ
	(envelope-from <linux-media+bounces-66832-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 13:21:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 455C371AE11
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 13:21:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxsw.ie header.s=protonmail header.b="l6K72T/N";
	dmarc=pass (policy=quarantine) header.from=nxsw.ie;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66832-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66832-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E2503030294
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 11:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602F63DF011;
	Tue,  7 Jul 2026 11:15:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF6B3F7A98;
	Tue,  7 Jul 2026 11:15:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422953; cv=none; b=YVA+3MHXeG0M9HmqBhRZFbO3TZ7g5Ro2YYNQRyWUmZ0LOYRea79le5Nx+fSClMJsnZCDhZ9K/KKQ5VeQLw+In6snBQx3axtB97VmR4+1QummAkHn6qzkeudhVCNYG+IIyRb/uHeguTEx8s4mqSbjOYoxDtmKYAEiAUTKk9rfGtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422953; c=relaxed/simple;
	bh=qI+Ei3tsAZSAGfCfZ7Shquqehahpqhe5H5hktkr4fto=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YCTj1lgCcKYdyedvrjc0tiQNUvZMRX2Y/QASqdgAeFkvMlyozeKA6x1rEjKT7eYjw5UrHCXT90IRmuyvaPgB6ypo2qivO3e26+dtJrjG6WSv/NcgEOaHATm/dWKEhEfMR56zzxF5c0H3N32fQQHnHjJ9/SBIcBdTCSbDVpq97yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=l6K72T/N; arc=none smtp.client-ip=185.70.43.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1783422943; x=1783682143;
	bh=icBPuK8zJs9D4y8hJQBR50mYz7RAhS4xWm+I4ZBkNCM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=l6K72T/NwYBgzJmzdNcQcNFCsYmg3lXAUeOuJHCC+uDvqGyg3MRMiLImBOURLPWoo
	 PW6CCOUl2TAdPWAd4kWVeIXyxx/I4gWvmNht26gQIoKr6igPQgTliCNNds7y0801en
	 SZRrWFmmLxFfLdxqtZXGU18i40nETomBVF8CSCIEwDd7G7b/C2pBN2IBfHknuNw9dz
	 e7o6OarQ1ErNeX6WGOPXj3ZDEYPDSkmp1s9ttYj2DNkaS/i/NN9QukqmRFZyK4NdC+
	 osh1/HQQhsYPRDzqEHBhNVR45ndJX/J2Oq9K3Zq/TO7Y2kryfqXuAC4qtye7mmQ/2y
	 u/NHRGNXRgF4A==
Date: Tue, 07 Jul 2026 11:15:40 +0000
To: Bryan O'Donoghue <bod.linux@nxsw.ie>, "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
From: Bryan O'Donoghue <bod@nxsw.ie>
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
Message-ID: <4a2c098f-5d46-4339-9b09-e0ace37e4052@nxsw.ie>
In-Reply-To: <7e36238b-96ac-4269-a6e5-0a6763e437e7@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com> <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org> <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org> <7e36238b-96ac-4269-a6e5-0a6763e437e7@oss.qualcomm.com>
Feedback-ID: 54899767:user:proton
X-Pm-Message-ID: ae16e520ab282b7e3808bbc22be9f004beb69630
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
	DMARC_POLICY_ALLOW(-0.50)[nxsw.ie,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxsw.ie:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bod.linux@nxsw.ie,m:gjorgji.rosikopulos@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[bod@nxsw.ie,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-66832-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@nxsw.ie,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxsw.ie:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxsw.ie:from_mime,nxsw.ie:dkim,nxsw.ie:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 455C371AE11

On 07/07/2026 12:13, Bryan O'Donoghue wrote:
> camera-bus {
>  =C2=A0=C2=A0=C2=A0 compat=3Dcamss
>  =C2=A0=C2=A0=C2=A0 power-domains=3D<whatever is common>
>  =C2=A0=C2=A0=C2=A0 csid {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compat=3Dcsid;
>  =C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0=C2=A0 jpeg {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compat=3Djpeg;
>  =C2=A0=C2=A0=C2=A0 }
> }

* compat=3D"camss-bus"

---
bod


