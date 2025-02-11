Return-Path: <linux-media+bounces-25989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8F9A3064A
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 09:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FC7A1883161
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 08:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AE11F0E2A;
	Tue, 11 Feb 2025 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j27Fbnaa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4921EF08E;
	Tue, 11 Feb 2025 08:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263812; cv=none; b=PKczLbnQ3F8sLQ96frbCg08+jwhl55iHlAYrdGA9j1uL45Ua1+uavBiW2XSA8tbOLHLvrV/Xugf5jaFGM9NvQWhbYoAJxlZgJgmlrl3FiWhdHpteRNFekMq1XTMUZdRG21F9yim8pZ1zd7T/d9/2pyJt7C9meafriP5VTyHgZP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263812; c=relaxed/simple;
	bh=DCc45PUaxWDZZX/VarYIQH3gCDAkGlEG8N33POusJ/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWDTERUULEVm/PBMJYqj0cu5XqO/DlLJYEKMIEV/Pn8iECYiHwHV2VG99IuTxWUtNv+uXM4OVEDVWkyDsnXjvhwp9E3qfnQPJAZO22P0LOAVBsncjzt3VtkyT673jProhVsdJ0IcotKR4wOyVbR7axYw5fNw7y6ZX20etXK2cI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j27Fbnaa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237A7C4CEDD;
	Tue, 11 Feb 2025 08:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739263812;
	bh=DCc45PUaxWDZZX/VarYIQH3gCDAkGlEG8N33POusJ/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j27Fbnaa+cRJrOdQsIJe/AQUd0tja/pvuoXvhD7KxBpDaYoxdsS9FuwdR6WhdZLNG
	 BISY6twJIsHuVOvbxEDWYEP4oVokHgbdxxMtTnPE/pit1RLj906Q+RSCq96HghaFgS
	 FhiNd276J47D9ANsrDtTus+rkd//SD5l0NTznlGh2G8qYk5M4LR1km+X+3+nGtNImA
	 P3AAqwbrX+lI4Nki4l0boIPEY1e8I+t+q/3uHo/+W71pYAbdfrSEM/bBf7n9jyIUtK
	 hSbilN3hq4VvC2/7z61/HnLvMzl1P4F1emiZaEvlSUQXZ3dp6IzdZIuJ+jY6TL5XR0
	 2mPGz0qUIltog==
Date: Tue, 11 Feb 2025 09:50:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>
Cc: Daniel Scally <djrscally@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add DW9719 and DW9761 VCM
Message-ID: <20250211-zippy-pygmy-firefly-88a3c7@krzk-bin>
References: <20250209-dw9761dts-v3-0-14d3f00f0585@apitzsch.eu>
 <20250209-dw9761dts-v3-1-14d3f00f0585@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250209-dw9761dts-v3-1-14d3f00f0585@apitzsch.eu>

On Sun, Feb 09, 2025 at 10:51:57PM +0100, Andr=C3=A9 Apitzsch wrote:
> Document Dongwoon DW9719 and DW9761 VCM devicetree bindings.
>=20
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  .../bindings/media/i2c/dongwoon,dw9719.yaml        | 45 ++++++++++++++++=
++++++
>  1 file changed, 45 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.=
yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b38d22bf09713a7999e1f9ce6=
553de7587dbe5d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9719.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dongwoon Anatech DW9719 Voice Coil Motor (VCM) Controller
> +
> +maintainers:
> +  - devicetree@vger.kernel.org
> +
> +description:
> +  The Dongwoon DW9719 is a 10-bit digital-to-analog (DAC) converter. The=
 DAC
> +  is controlled via a 2-wire (I2C-compatible) serial interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - dongwoon,dw9719

Yesterday there was a patch for this.

Please align and come with only one thing for this. Also please
implement any feedback from the other submission.

Best regards,
Krzysztof


