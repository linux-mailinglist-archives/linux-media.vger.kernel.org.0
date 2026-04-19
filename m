Return-Path: <linux-media+bounces-59107-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF88GU5B5WmhgAEAu9opvQ
	(envelope-from <linux-media+bounces-59107-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 22:55:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 029E94257FF
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 22:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98A193029E40
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 20:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F53930DD2F;
	Sun, 19 Apr 2026 20:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="v/uy9GLB"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830471A6831;
	Sun, 19 Apr 2026 20:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776632119; cv=none; b=YRRdEgp93Tp2XyY5sbZRwTa9m8DKGkmTQLNaHR/zrSS1gYo36bUh4rO273bGspX2y4AI/jp53ZhwZno+BsoACStjCAaKXfrKSIf8avmtKgSPbwFTlA+75WZgiGbA0FzMGRSL6RnjRsZDQZ+idRfKM/UsyWqjndrbyl8jMUBj2xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776632119; c=relaxed/simple;
	bh=mMXd/kazajBIcAdcXmWmpbLcdsL3+deZiodDRu1n87w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qn0uxqNcio/udnNp7VolRrDtq2lpFbfNd7M7YSRX60T4BV26H60gYBGDgjinKGtr6rx8CSJ1sSq3LiIjovcY6+1eFF6NdEFm04jrg7YM2w/qW5GBiX/3cP/QbfLX6iI50IjiNtPSbRYX2RocE2ANQrT5pqPbScH3vBWPIJN5S+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=v/uy9GLB; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=8QJGLTOhJGOcLGXJwTPrhXHSouYTwqDUTTa8K1Pchto=; b=v/uy9GLBvVYkrWkA6SvLb0BA3b
	OVOQMOxwGg8WTYnDAHcWZENwcIOTUsK7b33ebOC1PlFF1BgDGGrpMFW+i7urk9wrSnENETpWPkImJ
	HuQr4OMQJcT59PG1LDbYS8uJjfTlhxcEOq36HiOrCQObErVWonlQrFZUFUSJ1PYjdOHX1knRTt2iT
	R52hxwQtG9ix7UYLhmLdPSVOrRBbEFOQCVgOA52As38fbFpSxUxFk0lrmOPThRSFoawdk57jFlovg
	4Sm3bGq97rT8s5rABh1dvuHdrPrLUvFlhMHXR/oJtCa3s74gkxWnXG/Vvu5iL+MDS22iPpQod7LsK
	KdEDrucw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1wEYjL-0006vf-2J;
	Sun, 19 Apr 2026 22:26:59 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1wEYjK-000FSx-0B;
	Sun, 19 Apr 2026 22:26:58 +0200
Message-ID: <a09485c54946b754741259540257393734b518c3.camel@apitzsch.eu>
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Erikas Bitovtas
	 <xerikasxx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bryan O'Donoghue	
 <bod@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio	 <konradybcio@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org
Date: Sun, 19 Apr 2026 22:26:56 +0200
In-Reply-To: <37poakqgqhsuavvrm2dyzwk36syyq44o4cfdsylkzwsupbh2yt@ycdvyrxgnrcs>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
	 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
	 <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
	 <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
	 <37poakqgqhsuavvrm2dyzwk36syyq44o4cfdsylkzwsupbh2yt@ycdvyrxgnrcs>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/27976/Sun Apr 19 08:26:09 2026)
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[apitzsch.eu:s=default2410];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-59107-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	DMARC_NA(0.00)[apitzsch.eu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[git@apitzsch.eu,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[apitzsch.eu:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,apitzsch.eu:dkim,apitzsch.eu:mid]
X-Rspamd-Queue-Id: 029E94257FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

Am Samstag, dem 18.04.2026 um 02:40 +0300 schrieb Dmitry Baryshkov:
> On Thu, Apr 16, 2026 at 07:57:30PM +0300, Erikas Bitovtas wrote:
> >=20
> >=20
> > On 4/16/26 6:17 PM, Konrad Dybcio wrote:
> > > On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> > > > Enable Venus video encoder/decoder for Asus ZenFone 2
> > > > Laser/Selfie.
> > > >=20
> > > > Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> > > > ---
> > > > =C2=A0arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
> > > > =C2=A01 file changed, 8 insertions(+)
> > > >=20
> > > > diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > index 90e966242720..231a3e9c1929 100644
> > > > --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > @@ -267,6 +267,14 @@ &usb_hs_phy {
> > > > =C2=A0	extcon =3D <&usb_id>;
> > > > =C2=A0};
> > > > =C2=A0
> > > > +&venus {
> > > > +	status =3D "okay";
> > >=20
> > > You need a firmware path here
> >=20
> > When I tested Venus on my device, it loaded without one specified -
> > msm-firmware-loader creates a symbolic link from modem partition
> > for firmware. Additionally, none of the MSM8916 devices seem to
> > include a firmware name. Has something changed since then?
>=20
> Us becoming more strict? Or more caring? The default file paths are
> supposed to be used for unfused devices. So if they don't work with
> yours (most likely they don't), please add firmware-name:
>=20
> firmware-name =3D "qcom/msm8916/Asus/z00t/venus.mbn";

For BQ M5 (msm8939-longcheer-l9100), venus works with the firmware
provided by linux-firmware [1] and the default path (here "qcom/venus-
1.8/venus.mbn").

Just to be clear, should the firmware-name still be added in this case,
even if it is the default one?

Best regards,
Andr=C3=A9


[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware=
.git/tree/qcom/venus-1.8

