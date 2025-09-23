Return-Path: <linux-media+bounces-42986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9391FB956D2
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 12:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4201C2E5A5C
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 10:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9698F319845;
	Tue, 23 Sep 2025 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="gJd2K421"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F1C310645;
	Tue, 23 Sep 2025 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758623274; cv=none; b=Xei6Lii997xyX7dvnc77/urhvybxtoVaPkaOYh0iGWgauR7aVi2qxya0J3slsO/fjJ6OE9pyeV66jA3g8PmjR6PmQTNQBUsYxETyYOp7igHTqa0YXMmoYto7fRym63w6GVuHcOxd15eI10r5rllLnJWs2AGswz9y4Ip3BF6zNog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758623274; c=relaxed/simple;
	bh=7DNbOHNaKHAqXh6/yA4lmhTQDKdshc7fyPtpwopNmIA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q3fW15VzCeR3HTC2cjqlnxnwND7s95v4DBx4oq9X6utG0UF1pqu/IZ1ygymQyCX7b5Tbqr8Ut9nKgGaUWExFxJtzrIRR2kXJV/c+H/XiEAGmlcMT96q8b1+oR23j14LZKvZogD/v8jkGNaH7ZV7p9aLWHaZj0dlfWhlQ3uM+NZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=gJd2K421; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7DNbOHNaKHAqXh6/yA4lmhTQDKdshc7fyPtpwopNmIA=; b=gJd2K421lEKr0jTa6IxYU1zGTF
	AMOxn+22FIDzUH7XwXhl9QUd8RpXnciqAcVEJvSFmLdsspKV+N5xiWR2W7G0DqI+lESS9z8VqI5vc
	J4KsR9bQf9yKI2WvYWGQIxRys5jkO+eT2J/26b+kEX3qNTI8UdSoI0acoWT2H0wtgqi2OkKEeZ8eO
	G7j2FRYdLx86+HT5dXcd1FGrR2AVqxIfoJb6elVNJzavUIkEbOWj43T26ExivTgV5f5soqqZFme30
	wG3EZ4u0y+YPRz3kbS4wVWU3AJ28kbpw2RLrKP2ZedY/ypLcrxcdMg1sAA9s166jKeDZMFHM4NqlA
	8txKlEqA==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1v10FL-0003pV-0X;
	Tue, 23 Sep 2025 12:27:43 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1v10Ef-0002i2-1d;
	Tue, 23 Sep 2025 12:27:42 +0200
Message-ID: <14e75b6ebc3e558d3449f8b4043d31260bfaffc4.camel@apitzsch.eu>
Subject: Re: [PATCH 0/4] Add CAMSS support for MSM8939
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Robert Foss	
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Vladimir Zapolskiy	
 <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vincent Knecht
	 <vincent.knecht@mailoo.org>
Date: Tue, 23 Sep 2025 12:27:41 +0200
In-Reply-To: <bfc3838c-b2fe-40c9-a1bf-f5269b48dca9@linaro.org>
References: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
	 <bfc3838c-b2fe-40c9-a1bf-f5269b48dca9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.9/27771/Tue Sep 23 10:26:39 2025)

Hi,

Am Montag, dem 08.09.2025 um 11:56 +0100 schrieb Bryan O'Donoghue:
> On 07/09/2025 23:04, Andr=C3=A9 Apitzsch via B4 Relay wrote:
> > (This series resumes [1].)
> >=20
> > This series adds CAMSS support for MSM8939.=C2=A0 It's mostly identical
> > to
> > MSM8916, except for some clocks and an additional CSI.
> >=20
> > To fix black stripes across sensor output, and garbage in CSID TPG
> > output, 2 VFE VBIF register settings are needed.=C2=A0 So the 2nd patch
> > adds
> > helper functions to do just that.
> >=20
> > Patch 1: documents qcom,msm8939-camss DT bindings
> > Patch 2: adds helper for VFE VBIF settings
> > Patch 3: adds CAMSS_8x39 version in CAMSS driver
> > Patch 4: adds camss and cci in msm8939.dtsi
> >=20
> > Changes compared to [1]:
> > - Move bindings patch to the beginning
> > - Make the order of {reg, clock, interrupt} items the same as in
> > 8916 +
> > =C2=A0=C2=A0 append additional items
> > - Drop R-b tags from bindings and dts patches as order of items was
> > =C2=A0=C2=A0 changed
> >=20
> > [1]
> > https://lore.kernel.org/all/20250613-camss-8x39-vbif-v5-0-a002301a7730@=
mailoo.org/
> >=20
> > Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> > [Andr=C3=A9: Apply reviewer comments]
> > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > ---
> > Vincent Knecht (4):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: dt-bindings: Add qcom,msm89=
39-camss
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: camss: vfe: Add VBIF =
setting support
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: camss: Add support fo=
r MSM8939
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: qcom: msm8939: Add cam=
ss and cci
> >=20
> > =C2=A0 .../bindings/media/qcom,msm8939-camss.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 254
> > +++++++++++++++++++++
> > =C2=A0 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> > =C2=A0 arch/arm64/boot/dts/qcom/msm8939.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 146
> > ++++++++++++
> > =C2=A0 drivers/media/platform/qcom/camss/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/media/platform/qcom/camss/camss-csiphy.c=C2=A0=C2=A0 |=
=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/media/platform/qcom/camss/camss-ispif.c=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 8 +-
> > =C2=A0 drivers/media/platform/qcom/camss/camss-vfe-4-1.c=C2=A0 |=C2=A0 =
12 +
> > =C2=A0 drivers/media/platform/qcom/camss/camss-vfe-vbif.c |=C2=A0 31 ++=
+
> > =C2=A0 drivers/media/platform/qcom/camss/camss-vfe-vbif.h |=C2=A0 19 ++
> > =C2=A0 drivers/media/platform/qcom/camss/camss-vfe.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 10 +
> > =C2=A0 drivers/media/platform/qcom/camss/camss-vfe.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> > =C2=A0 drivers/media/platform/qcom/camss/camss.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 157
> > +++++++++++++
> > =C2=A0 drivers/media/platform/qcom/camss/camss.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 13 files changed, 645 insertions(+), 2 deletions(-)
> > ---
> > base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
> > change-id: 20250517-camss-8x39-vbif-975ff5819198
> >=20
> > Best regards,
>=20
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

any chance, this series can be applied for the next merge window?

Best regards,
Andr=C3=A9

