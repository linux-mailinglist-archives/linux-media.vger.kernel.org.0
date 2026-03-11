Return-Path: <linux-media+bounces-55287-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJjfJ5TSsGmLnQIAu9opvQ
	(envelope-from <linux-media+bounces-55287-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 03:25:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E3625AED0
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 03:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B02D305A429
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 02:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3698B1D5ADE;
	Wed, 11 Mar 2026 02:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FY2bT0go"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D932BDC29
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 02:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773195911; cv=none; b=g5UDIo/TSBUDPaYHK6tJJFbAlMw3BxTKaEtNg89xftM2bmiN8wSJBHLsvZ7CTerfPfZ9PLKwJk8T/vEI4ydzNJPtOczo8Ur2BQWbFAgel6kzSMC9TctczkoYiVFTeinKFCyVWqFTfHQe+5xI6Iny/4+KX7DUPtN95WbyThrhWK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773195911; c=relaxed/simple;
	bh=x3oA4b9XXpfnN8kUiNhtlS/tc1BuEX7AW97CTEgFyIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBUH8lZTUR7eFzJmqeWi7XP/PtYiHUXpKBVr3qIApOhYHTreodXVP7v2axmEOiicL83Sknhx+o8BYebmP2pzfDke7CPXilsZIGpJFeuKe7EiBOC6WnPzin5gCrBI1DcKQ7JR0cmvY8x+HI1KCOh7gMwpY8E0Qricq2IP//kk+RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FY2bT0go; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5091d71aa11so5803441cf.1
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 19:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773195909; x=1773800709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pdOODwOyqf2HXTJor8x6+j1U0inwH0LLdlGvfoS1Vfo=;
        b=FY2bT0goJi+eGxVKUdDcVzRwoQgrQnVLnDcA7loJJil0P4Ni8pMG46aYtZLbnzYCmL
         ttG0XvTy8yd/gnIaI7o5qrih4Kn+rgjI47B8IO3PTeKTbFI+kHx1XjLEs5+eaM4nB2e1
         +DYVbLzQRgvKCQr8i0dsxeA03Z3dbFuQyDMtV8NIGYZCX5VpgkgYDtaWauNrOv9jXteO
         dCe3Eob7ZRKNsS2XQ4HujfFkZZBi7CuGsR+y9/w6OLKI3CM8ihaDROZVBmSR5h8CTnLN
         rWHfL7sy3cHpmKkxD7DcXmXWeaY/5qn2IElaygmHlm3aEjYk5glgV5tSpCh9/lLyx5P6
         It4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773195909; x=1773800709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdOODwOyqf2HXTJor8x6+j1U0inwH0LLdlGvfoS1Vfo=;
        b=hVyC2AAB5cS5t/r4Spqr4jQ9i6r+vs3IKGN5ptDhhWiSVI4s3qiUcFZivcZzng29PC
         cl+hROfZojH/iqcQC0O60nAhEpGfhRShZgiB0YQO/loBRd3GIhtVGuonkIDasUOnS9Kr
         ITvtrvTKV+R+UjLXPePFrXjiTamzsARxSLUQDg19EI/jdKujY3PJnA/fhBxsTOF5UvgO
         q2ifO6qFgh60otHc+oLf3706WC/HjJgP7PxgEX85xHzG59+5gxUJHj8Q5UFD0CuXQlvf
         jP1AVBv7+UqmdmylhFlEFYhLnvbv5jVM3GgCNxDnEZF+9x5KSe3kpJZQh4qr9XEADGFf
         +h/A==
X-Forwarded-Encrypted: i=1; AJvYcCW6gyr4PX9flLM54luLDSlAhrEwkjpeymjygy8UQPWeITP/HLdTqnVi453zIA+ZW94zOH3DmlQ/AJ2lWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFmkiztmNHUa1/jwG8HVNpA0BjRKBwv1zPgvjzNgIfA82FL/wA
	M2je4QprOT1Ttc0jEIb/y1jCDF8neb9hinp3gUq+NHtiqU6Klu983lPe
X-Gm-Gg: ATEYQzyPL+nXIWkv3caLtSJPv5DusxZ7LOuJh1ZiKrCkDmbhRfMoqcG2eDhU2fW1v07
	EVHHzTVRpN/+mBnEPZI1JAq4Dbu2CuuxEssavjWl/OyIlxZjsbfcWJOdEqH4Qn6N9Cvi49UVD5d
	2fXuHvAIhGvWxn5fGOo1pJvtdmAg6UfRGEvMW+xY8E4cpiy4oHIq5A3OpM79ymdQ8qkeB+WIMJT
	/P5bnnkL+GWruMUcIb0Z0EeJU7jt+qiTseq/bcM0nuTElhvGrvxX1BRguBY6rlSxEglTgQ8HO2W
	0/4b8SraksJQgS2JRh6Vl8+/xSTcFsnWVpj//FrRlGTpmV//J4WcLQq2KRF5mXAv1R72flx7Qlq
	gz17gWAcf2xisigNavjrG77+O9aU9l8J+mjnH8qOBffHERjd2bmOBZ/DT1BcJwYZBeqQkzpvFyX
	J6PzC4Llr9cZzNQAlM5HKReqMeqQ==
X-Received: by 2002:a05:622a:1111:b0:509:1be4:97d1 with SMTP id d75a77b69052e-5093a19d134mr10124061cf.34.1773195909341;
        Tue, 10 Mar 2026 19:25:09 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50939ec63d6sm5194251cf.12.2026.03.10.19.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:25:08 -0700 (PDT)
Date: Tue, 10 Mar 2026 22:25:40 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <abDSpE3BNb0jFrqx@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-8-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217002738.133534-8-mailingradian@gmail.com>
X-Rspamd-Queue-Id: 03E3625AED0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55287-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,qualcomm.com:email,1a:email,collabora.com:email]
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 07:27:38PM -0500, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/sdm670-google-sargo.dts     | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 
(snip)
> +
> +&cci_i2c1 {
> +	camera@1a {
> +		compatible = "sony,imx355";
> +		reg = <0x1a>;
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&cam_front_ldo>;
> +		dvdd-supply = <&cam_front_ldo>;
> +		dovdd-supply = <&cam_vio_ldo>;
> +
> +		pinctrl-0 = <&cam_mclk2_default>;
> +		pinctrl-names = "default";
> +
> +		rotation = <270>;
> +		orientation = <0>;
> +
> +		port {
> +			cam_front_endpoint: endpoint {
> +				link-frequencies = /bits/ 64 <360000000>;
> +				remote-endpoint = <&camss_endpoint1>;
> +			};

This also needs data-lanes.

