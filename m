Return-Path: <linux-media+bounces-13866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78196911245
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 21:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34D1F282C84
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 19:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353B61BA061;
	Thu, 20 Jun 2024 19:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="C77MmbHS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEE01B9AAD
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 19:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718912243; cv=none; b=Gch9GbTaF53fmDpWOCjoYTlMAxPKnuiGdJNWx5raNboAFV8GPav00qL448KsfFLqcCaYCALhfdlMnuTMlQHx4pKSdyob/zjqhZKQtl7+sieIc5wVcUisNnut2Hi9rkCuolPcf8bgynTFN23YOvzTgCeeJt+IQHVHg8BDCCBAcik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718912243; c=relaxed/simple;
	bh=rXsyJA9QBMX+RibxYe3uJ4xaYsp1C4y1HPJLv7IepjE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gC6X21xmZxFizvbHk6VNs45X38ilker3TG3RrsSKFwsazUDB+9nk4qr76CEAx3WWU4jD6R733RF3sNssIIunTuUQfCKlOSqUN+IQGWl4d15C646UoRmcx8p3kMLXh+oCNCLDekOF3s/ZLSr8T+/FSzLjmN8MITy4HENx92uxLjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=C77MmbHS; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6b50018e054so6289906d6.1
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 12:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1718912241; x=1719517041; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H4Z+ybUYMauqZ31ugavPoL4O/Q0wanX4Mqqn+IQJwQQ=;
        b=C77MmbHSlvfgIKxKrCPFvxcLzpqVEWqj6e2AcZu2DrIpqSxszEGhLFdrfiilCnZd+q
         G0QKvZzsbPT8VBq1MVlDeGmDmdcuxi8t+62a+H+amepDOjfiCiAawZ5a5GOZwc3aZw9l
         mQYhneBvWK97l19IamULSrkjnraFCL5V1TIccy5IR2tjxiCqBNCI+BB3bQEHjL9mfzSn
         1ULDD34YiNprsLdUcq41z8nuwAMckJBDFhdQr+Gd6jvXLX5ygTmEftq+SAt/fN9vSrqg
         iFxtCHk3mUYUt4OcuA3+9xnRss3I2INiiBeXZworAIzSnG1nYtZKbVO+zxEco5sUwYL0
         zyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718912241; x=1719517041;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4Z+ybUYMauqZ31ugavPoL4O/Q0wanX4Mqqn+IQJwQQ=;
        b=VepACXLauU5lHSvDE7RCl6HPDm/a834HJnqFTMclwqB+n7r6tN8fAkdrDITCT0MJpp
         mH0AiOa8G9Z48M8Dqs4emsk7LhLD4M92lA4mx0zqn7OjtbYTNKSMXb+z0iV8FXG/borZ
         /G2Ri4vz6sjAdRoPiI+mE2in1uRUKz7hI3dtOI4DkEePz0ojBXBqmmWu50bX0F3mPfu6
         HyNwLc32nT5jqSUr+jcH/lYMAHWO06C4uYCvpmResbD8FlQGwcNE47fWPlusVZ0BNnbT
         Fm8JKFrqQPpGz1e1oMolFDZ43UZdbVk2XFh6QNgOmjg6wFjqBptBiIgl0FAzT+Cl91W5
         6V/A==
X-Forwarded-Encrypted: i=1; AJvYcCUdJW3oYw/yBBAYerelDQuzeKZzs9OPI++gTKAOpmTuOHFibUm2/fs4ReslKT7Wr2Y7AM60PdiqQ0GLPFPsxJXFyCb7cV/+jI8NzLE=
X-Gm-Message-State: AOJu0Yz1IPFoKLiodwwhrRgNsG7AaTMyiz8MgGk3VYItJIKh/D64ex6h
	riSdmc1Gpc850gvqZ5tRb7xX4etbyBGVoAToSX328JVlNZ6r0qd7az04utq5Jvs=
X-Google-Smtp-Source: AGHT+IHNbneA1rPJZPgvcj3mwHKuiGb77Z6vVNX3UHTpocfd13qKN824+8NQu/mJjvCXPM6WtEQUuw==
X-Received: by 2002:a0c:ca92:0:b0:6b5:34b:8c02 with SMTP id 6a1803df08f44-6b5034b8dbamr63633426d6.27.1718912240911;
        Thu, 20 Jun 2024 12:37:20 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:6d4e::580])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b51b90472bsm3248726d6.143.2024.06.20.12.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 12:37:20 -0700 (PDT)
Message-ID: <d31f18cae640095ca0704185f8238184c13cf93b.camel@ndufresne.ca>
Subject: Re: [PATCH 0/4] Support MediaTek MT8188 Media Data Path 3 (MDP3)
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, amergnat@baylibre.com, 
 moudy.ho@mediatek.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org,  p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
Date: Thu, 20 Jun 2024 15:37:19 -0400
In-Reply-To: <4e1a8383-fdcb-45b9-b3d8-7019ed8c07bb@collabora.com>
References: 
	<20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
	 <4e1a8383-fdcb-45b9-b3d8-7019ed8c07bb@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 19 juin 2024 =C3=A0 11:23 +0200, AngeloGioacchino Del Regno a =
=C3=A9crit=C2=A0:
> Il 22/03/24 10:28, AngeloGioacchino Del Regno ha scritto:
> > This series adds code to support for the MDP3 block found in the
> > MediaTek MT8188 SoC, including the necessary bits for mtk-mutex
> > and platform data for the MDP3 driver.
> >=20
> > This is mostly compatible with MT8195, with a few differences
> > "here and there", with the former having less instances of some
> > of the MDP3 IPs compared to the latter.
> >=20
>=20
> Gentle ping for this series getting stale.
>=20
> The soc bindings and commits are already upstream (v6.10).
>=20
> The commits that would go through the media tree [3/4], [4/4] still apply
> cleanly as they are.
>=20
> Should I resend this, or ... ?

If 1 and 2 is merged already, a rebase and resend makes a lot of sense.

Nicolas

>=20
> Cheers,
> Angelo
>=20
> >=20
> > AngeloGioacchino Del Regno (4):
> >    dt-bindings: soc: mediatek: Add support for MT8188 VPPSYS
> >    soc: mediatek: mtk-mutex: Add support for MT8188 VPPSYS
> >    dt-bindings: media: mediatek: mdp3: Add support for MT8188 RDMA
> >    media: platform: mtk-mdp3: Add support for MT8188 MDP3 components
> >=20
> >   .../bindings/media/mediatek,mdp3-rdma.yaml    |   1 +
> >   .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
> >   .../platform/mediatek/mdp3/mdp_cfg_data.c     | 280 +++++++++++++++++=
+
> >   .../platform/mediatek/mdp3/mtk-img-ipi.h      |   1 +
> >   .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   1 +
> >   .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   3 +
> >   drivers/soc/mediatek/mtk-mutex.c              |  41 +++
> >   7 files changed, 328 insertions(+)
>=20
>=20


