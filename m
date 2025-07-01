Return-Path: <linux-media+bounces-36484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D904AF06D3
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 01:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ECF64E2B9A
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 23:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738C8271451;
	Tue,  1 Jul 2025 23:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bovg+wL+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5790D28136B;
	Tue,  1 Jul 2025 23:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751411730; cv=none; b=LGeWTBBtYZvkjVTW2saSvFkXelvzSg8Lyex2hzpsE9SDSvI4IJbU4FcnVLz3sNo29rYpzKdnKbnwbvG0wZBZIBB9wWD1OvP0WKUqEwRDlZHAzYPvHUTbSPu2+gokFM34mWSEOMdkpFNrFNWG/EvuG3TqQme3pAhoijmZm8Iii1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751411730; c=relaxed/simple;
	bh=+ZXx/8koRnOlNn/Z+Je1dbG6/mUersg2F6UG9LA621g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4S+8Ak3ce8yW00BmOFjUVu4Pxzp+Xm4NCyZwjBDpooaVidPkVEFFZ2RdfdIUEQbIW6tmkqpuqXUlnbLpWQcvFb2dcvqPiWbRYYjvcGQmwGCmUHW6QTAqvIyEZUaZlXxhSFx7jQw/FXzAe1OgSlfyVU4sORJxughpaGwjoyCuo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bovg+wL+; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fb1be9ba89so39181276d6.2;
        Tue, 01 Jul 2025 16:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751411728; x=1752016528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0PMznrJ6yy2pDCCyz/WETZ/iq5H1e5CY2r1aWuHOiOA=;
        b=Bovg+wL+pdHAh2XbGCZr3nTxLQrgK82yAL9OI8sTcuPO7UsEPHUul3fvb4hV+S9b+y
         +RQsQ7Uwibzu+Vd2SFhuavbZWKaujEQ7Oz0HehOHmCi40y3ifb/TpnL3c6KvCsamjnf5
         rZWg1+Hnqt/TXA9RpTqigVDrpCupwZb+8l+cMPgD2/Pwu4sp0cdCWJnBmsf67tfRIXdp
         7qoxDrDlXZesnHG6gFbVFdtjSA1/T8td6vd3VksMmqnUZn9c9rur7HrpeafOYydfT3Mm
         VvrjJSEutZFId6RDjSakZZVqCXEIGJhJvl9vzSSMFZ9kzBeGrOfQqyXxZLMYeMb8Y6Hk
         xcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751411728; x=1752016528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PMznrJ6yy2pDCCyz/WETZ/iq5H1e5CY2r1aWuHOiOA=;
        b=l3NY52KNI95jDNkus2vMRn+HBiR2ypH+R1AocCMFAADK3HaEDDl4bas/GGdyxSOfwY
         iimU3WhP0VQ/wVR89xQvymYbep/mdfKeBVKOyHo7UDXEChCOcvnP4pUsgEIGugBjP6Eg
         8eCJhSlw/H9fs/+NE4IV1Pgmh3xfiDR0U6gXmpEPtxFQuKcFJaWU22tGaWfsanww4XPj
         bKZfI+iPcn5qBRupZEDqeioHGHmWgTlDqs109kjHW2I/rMyGw5Gfa3noDGw6+cPKtzVW
         DH9k5v3wAdwdNru+p7XHTNOh02FXHo3L2Qv70TQV3CB7Y2K6Hvv4kYNWqLQI+xWIcFPl
         ly4A==
X-Forwarded-Encrypted: i=1; AJvYcCU6+RtODFAf5jqnthJ1LCv6mZ/7wgDzS1EWPd37w4tg7I7xoXDY1im0uDNGUbPhN1+zvi6CsCrUXQZ1@vger.kernel.org, AJvYcCUNbAsGROBgFs/O5NrWq4Q374WtCG2fUl2P5Y/CGSJa9xQhPsXyglwYPQgS2VHc2vL0JZAH/SSo9ceNbPw=@vger.kernel.org, AJvYcCXUDvUwVCuRqZMnBdAxoZ29x3PkY/lnW3fKqQtq5otaSabp4G8SEph0jcXA+eaFKbD9bREhHgYijNCexGXNmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww1EP5V5xbQdY65dUdHvOy9/n/uShJ7PTmqOga1E05qVtTly0t
	uR21M30VxY4GZO4KWh3+ZvkElP6P/bCJ6tmQk7H2clofAQT1/+gvAfdZ
X-Gm-Gg: ASbGncs2oy/VJ08PL3/ZhF6glt3Mi5pAuTPYNTlimC827ngJXEJ1z5G0Yj/1jbZZYKH
	Okbd/Lal6tFzWokvert4K51vjzQztlr9ifNtQk0xh9guz9wfANbsXk6R03D9hbc50aky06R3gQE
	tAOzpNk9vxvveUL26JgXOttv3AK+6z1YiISmaIve/QeiBcMlZSNZmPSX3y27GujkcBUcDvddS6I
	K2pn16Co4JbuLvpaUW9qvbug1dYuHLPffcrbwSmyfDT3YNHO/GEy6I1ivssOpxEjK+Zv+SfWvM3
	3EeNMtM1V7HMzgoWBixP2Bt0WGRb+hQcK4/5mEd0F+JweY4WDg==
X-Google-Smtp-Source: AGHT+IE3chY+Ty+YzMEEQbVtUm0Flg9bcjPrqwQ1GO/uoDdWmtmDVdh6aYgbp3pGGUm6JW86fot7Fw==
X-Received: by 2002:a05:6214:1c85:b0:6f8:b73e:8ea5 with SMTP id 6a1803df08f44-702b1bab444mr5887066d6.26.1751411727977;
        Tue, 01 Jul 2025 16:15:27 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::9bde])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d443139b31sm852417985a.7.2025.07.01.16.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 16:15:27 -0700 (PDT)
Date: Tue, 1 Jul 2025 19:15:25 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <aGRsDRnV5tc5IG3J@radian>
References: <20250630225944.320755-7-mailingradian@gmail.com>
 <3qGugliBdtpdHGZzR9xh_974TfJigMYERGVAfqmpCqe1R7O0CLU8FzXVcIESzTIc-SKzpk42ZAx5-38eDX00Eg==@protonmail.internalid>
 <20250630225944.320755-11-mailingradian@gmail.com>
 <488281f6-5e5d-4864-8220-63e2a0b2d7f2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <488281f6-5e5d-4864-8220-63e2a0b2d7f2@linaro.org>

On Tue, Jul 01, 2025 at 01:23:44PM +0100, Bryan O'Donoghue wrote:
> On 30/06/2025 23:59, Richard Acayan wrote:
> > The Sony IMX355 is the front camera on the Pixel 3a. It is connected to
> > CSIPHY1 and CCI I2C1, and uses MCLK2. Add support for it.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >   .../boot/dts/qcom/sdm670-google-sargo.dts     | 112 ++++++++++++++++++
> >   1 file changed, 112 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> > index d01422844fbf..0af6a440ecbc 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> > @@ -172,6 +172,34 @@ vreg_s2b_1p05: vreg-s2b-regulator {
> >   		regulator-min-microvolt = <1050000>;
> >   		regulator-max-microvolt = <1050000>;
> >   	};
> > +
> > +	cam_front_ldo: cam-front-ldo-regulator {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "cam_front_ldo";
> > +		regulator-min-microvolt = <1352000>;
> > +		regulator-max-microvolt = <1352000>;
> > +		regulator-enable-ramp-delay = <135>;
> > +
> > +		gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&cam_front_ldo_pin>;
> > +	};
> > +
> > +	cam_vio_ldo: cam-vio-ldo-regulator {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "cam_vio_ldo";
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		regulator-enable-ramp-delay = <233>;
> > +
> > +		gpios = <&pm660_gpios 13 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&cam_vio_pin>;
> > +	};
> >   };
> > 
> >   &apps_rsc {
> > @@ -392,6 +420,58 @@ vreg_bob: bob {
> >   	};
> >   };
> > 
> > +&camss {
> > +	vdda-phy-supply = <&vreg_l1a_1p225>;
> 
> You've got your 1p2 but looks like you are missing your 0p8 supply

This is probably vreg_s6a_0p87 which supplies vreg_l1a_1p225.

> > +	status = "okay";
> > +};
> > +
> > +&camss_endpoint1 {
> > +	clock-lanes = <7>;
> > +	data-lanes = <0 1 2 3>;
> > +	remote-endpoint = <&cam_front_endpoint>;
> > +	status = "okay";
> > +};
> 
> This looks not like how the other dts are upstream. Does this work and pass
> the dt checker ?
> 
> Right now upstream wants something like this
> 
> &camss {
>         vdda-phy-supply = <&vreg_l5a_0p88>;
>         vdda-pll-supply = <&vreg_l9a_1p2>;
>         status = "okay";
> 
>         ports {
>                 /* The port index denotes CSIPHY id i.e. csiphy2 */
>                 port@2 {
>                         csiphy2_ep: endpoint {
>                                 clock-lanes = <7>;
>                                 data-lanes = <0 1 2 3>;
>                                 remote-endpoint = <&imx577_ep>;
>                         };
>                 };
>         };
> };

I misunderstood a review comment from an earlier series. We can do the
same thing here instead of pushing a different style.

> Can the upstream driver actually consume the dt as you specified above ?

If you're curious, it does understand and let you go as far as using the
camera.

