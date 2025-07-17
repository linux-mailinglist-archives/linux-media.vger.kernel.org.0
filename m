Return-Path: <linux-media+bounces-37940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DFAB084DC
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 08:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 981191AA2438
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 06:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE55215F7C;
	Thu, 17 Jul 2025 06:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsYUzHPK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F26286348;
	Thu, 17 Jul 2025 06:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752733567; cv=none; b=NuTGI5I3dqjT7SWxtNhntaMp1g/etNlYCXeV7xgYrT2y7TPWPTYDeGUV8kegqEv8pM9C6NxUOgl1wxEe7PHUQOHjXVqL4x33jyRlZ000aEfLEoL63/07WSKXQ4NVnSLd7SXqN1s7Wg942zJDg+pjlqE7tBSWyESpjFAlRIEX7R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752733567; c=relaxed/simple;
	bh=ALc32Cmc4l9iDna3BPh+GAS5NVn2l26NMOLaLbDPIqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzYJwhANmpU25+HH/Ulwo4jxG0YUbWTu6erMc4NoB6e4seYIwDMBsLfuQms6BN4B5HEwolISvbEF3z7JU9ZRiJQeKV2qQae/vT3k2vLx+EMPld9/wHyEU2pYMttYZbyDMSeGF9ABpRnbNMaR8rM99LJhl+f4sRDZYBX7D1EvpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsYUzHPK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359B7C4CEE3;
	Thu, 17 Jul 2025 06:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752733565;
	bh=ALc32Cmc4l9iDna3BPh+GAS5NVn2l26NMOLaLbDPIqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bsYUzHPK2b6ghKNaRx0ZnkaqAowJKppyrk7QO98VhYzlmdRJRCD8FhJcw7rxhxUn/
	 s0H7D5rusPiz4JvrkyMTTTTEhlkpSUj/ZkytVtphPUdtL7fqVC76fgQg3bRXkEGSSo
	 kQDDhRgGKXT7Vp1IkZOU/uw1mVTPzHCDaZlXHa4n/IaPOFTO84ZA4c/1XV9tZ4W8II
	 BpER3Rp3dgLgy3yUTXN/BtlxhtjJGouX7Ncs1EUvbHJUWdO24sdO2tSzhq0vq5ttLl
	 sqTtWpKh4ER/oEP8duMHS0bW9oPVyGX5K4dgQh/+Ck+MaeJ+xiRFLdGlOECiw1VvlH
	 HgTWh9RjJVibw==
Date: Thu, 17 Jul 2025 08:26:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Ricardo Ribalda <ribalda@chromium.org>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Matthias Fend <matthias.fend@emfend.at>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Jingjing Xiong <jingjing.xiong@intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Dongcheng Yan <dongcheng.yan@intel.com>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hansg@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Message-ID: <20250717-ruddy-tanuki-of-foundation-ad9bf2@kuoka>
References: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
 <20250716134426.8348-2-hardevsinh.palaniya@siliconsignals.io>
 <PN3P287MB35196D806DD3183F5C3AA623FF56A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PN3P287MB35196D806DD3183F5C3AA623FF56A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>

On Wed, Jul 16, 2025 at 01:58:52PM +0000, Hardevsinh Palaniya wrote:
> Hi Krzysztof
>=20
> > From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> >=C2=A0
> > Add bindings for Omnivision OV2735 sensor.
> >=C2=A0
> > Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> > Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.=
io>
>=20
> I haven't added your Reviewed-by tag yet, as I made some modifications to=
 the DT bindings.

What modifications? You must be specific in the changelog which
modifications caused tag dropping. I don't see such information at all.

Please read submitting patches before posting next version.

I already provided you to exact documentation paragraph explaining this.
Did you clicked the link I gave you or just ignored?

Best regards,
Krzysztof


