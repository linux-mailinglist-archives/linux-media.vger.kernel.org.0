Return-Path: <linux-media+bounces-42032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E53EB49418
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 17:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D1B9206C73
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 15:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9E2310762;
	Mon,  8 Sep 2025 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="jMBIfvOx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B72930F541;
	Mon,  8 Sep 2025 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346221; cv=none; b=t75q3DroYCeYMUgLR4y0kZyl/TGxRxzTWOPzmj2VQCyBqbnY2H88FP2/BHcAAIEfkD8wHG+sA+Ja3ZC6dNAOJqFYlLeeJgIs/5qLry/+AKiHfo5tjxD0vjpwRz20dIwCKoWkkb+suuYyY8OYN7p32NKnidzkClahlXSEPKdJ034=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346221; c=relaxed/simple;
	bh=x9Ob/glSFueHSPO0Wj/dOLbbFRpTBrMxJISHgqFSZ14=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tVuV8K6z4JABIRtqbCVw3Gkv/wU08xYfK1NHxDujbjV4uEit7jt2cAVtWNs0ubTdq3AzkL5bDZD4fc8whChDIXv1YZO7JQrDS5G4kYxufEQ/B1rtcmSVg3qqE8FsXaq8xRhzAYBnLdn8S3v1QWPuwVlb/eI/47+m05K5S63bii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=jMBIfvOx; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757346209; x=1757605409;
	bh=x9Ob/glSFueHSPO0Wj/dOLbbFRpTBrMxJISHgqFSZ14=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jMBIfvOxy9+Ao7hYxmZScjkS1BLtG8iLGw4n108iE8nSZGfhW8enmg8RAyBPmP6BY
	 E+UHWrwC54nm1MgodC3GrYy2cTO8nZbiDjuXftayZZcC2ZLvMJMmWwRx8JkW96J2dD
	 1mBdyOLSTGhkoJgq+Gu7lBl7HCEPBAg9vymZOhyNCXuoASsHxx0CTIVDBN4VkarVKB
	 D5d/u4Q0eic+0R9HOeq/S5BHTiVNjh4Vbun4GF8gu2RhFc2k/apqy/01mNsGudDmDH
	 jsZKa8bBIWfz9y9EtLP+jgWGLPpyDxvjAoBiX7klsi2dgu84eADM56B6IXQb06xoIS
	 9L4zaiATsVGmw==
Date: Mon, 08 Sep 2025 15:43:22 +0000
To: "Rob Herring (Arm)" <robh@kernel.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Pavel Machek <pavel@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>, Hans de Goede <hansg@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-leds@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Daniel Thompson <danielt@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: add generic LED consumer documentation
Message-ID: <COW1cS_CD75b8_MjT5gZA2c8oVf7iAbYPP7RR0TfJwPCqyhpf7LJn8YRjePaJHKnqE4TQZq4UTvmHGlSiv6rVJjdQSmp70FAjg5zkPbEeh0=@vinarskis.com>
In-Reply-To: <175734087835.1809005.14330068317471966084.robh@kernel.org>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com> <20250908-leds-v3-1-5944dc400668@vinarskis.com> <175734087835.1809005.14330068317471966084.robh@kernel.org>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: eae4543f989db2525140815fbb8eb7d8efde1f9a
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Monday, September 8th, 2025 at 16:15, Rob Herring (Arm) <robh@kernel.org=
> wrote:

>=20
>=20
>=20
> On Mon, 08 Sep 2025 01:18:03 +0200, Aleksandrs Vinarskis wrote:
>=20
> > Introduce common generic led consumer binding, where consumer defines
> > led(s) by phandle, as opposed to trigger-source binding where the
> > trigger source is defined in led itself.
> >=20
> > Add already used in some schemas 'leds' parameter which expects
> > phandle-array. Additionally, introduce 'led-names' which could be used
> > by consumers to map LED devices to their respective functions.
> >=20
> > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > ---
> > .../devicetree/bindings/leds/leds-consumer.yaml | 89 ++++++++++++++++++=
++++
> > 1 file changed, 89 insertions(+)
>=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/l=
eds/leds-consumer.example.dtb: camera@36 (ovti,ov02c10): Unevaluated proper=
ties are not allowed ('led-names', 'leds' were unexpected)
> from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02e10.yam=
l#

Rob: this is because the 1st patch that adds `led-consumer.yaml` uses
ov02e10 in its example, while the property is added to
`video-interface-devices.yaml` (which is used by ov02e10 and other
cameras) only in the 2nd patch. As I see it, reversing the order of 1st
and 2nd patch would likewise cause 'error' when 1st patch is checked
without the 2nd one. I don't think that 1st and 2nd patches should be
combined, but if you prefer to do that so the warning goes away - please
let me know.

When running checks on the entire series/last commit, no binding errors
are present.

Alex

>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202509=
08-leds-v3-1-5944dc400668@vinarskis.com
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in this patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.

