Return-Path: <linux-media+bounces-62273-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFaBGySnDWpr1AUAu9opvQ
	(envelope-from <linux-media+bounces-62273-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:20:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6AD58D884
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B9FE301F16F
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620B73D811E;
	Wed, 20 May 2026 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2c8DS+6e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7DE3DBD72
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779279300; cv=none; b=un+4EOFUPw9W6BqYGANYtvXR5U8yJgerZsV4A6AV3tSyNGKwyOA1frCsNOqY3eZFCQ6g81Wl3lYiM/GCtE3rsSnlVJYtURqmGQVSdk7+ftstl/83SkyRI1NVrsMB8jF74xSXXIvLtxd2O8GL5R2MlR38Mxl5X32/6+dfBG7dIME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779279300; c=relaxed/simple;
	bh=c20waQ3ciaPhuvDx9sD7rBsAnnmu0YP6ZK66HfND+vk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=VTUS5Jy9Th9dxNLcgabj5OoC/AF3I4xBR3jIN3JsHUSucsmn15jq9hlE896bkK7u61+0pJ9yAY4qePzUaY+hPbTXCLvfonpTtgX2THQV1IqyO2Q9mEqAJQYBEFsXE4QvXT3gxyARewpYi8bZM/stUk3S99nDfxnqH35XGf1SECk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2c8DS+6e; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67b8d9c26bbso10853295a12.2
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 05:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779279297; x=1779884097; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XpYHzlqjA32IUkHlT71NisujrYawqJ/BOyAN5JmGyM=;
        b=2c8DS+6e6Uj7GZlhNIJ66CaRAg3WVVmSv6Dbmyi9IklK3iZexA++PhMKUkRkSxceXW
         LVpBAu7D8hCNhrW9jd749Hym4Yal58iX0Svea3miw9AZC3XYnJS83XjTdbLGebU8gz2J
         C8ZuiK7pX9a6iMp95Ue849K6Ejq0lpA50cupQIsshZ5KOKmR7i7NnGK+Nz1wRl5IZ/tB
         qei7gQiJjpMzKjrleGNopbm9v/Sy2WUiwBXDOjzHAwmpv+uEqax0/vb1/E5rQ7Xl4nV7
         UtKc4TD+U2HhoqpTDgkQZFS7TQ2eqCY7BYJgTwgY0ttA1wMuORtmzndVQQumGIozE/OU
         +qvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779279297; x=1779884097;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3XpYHzlqjA32IUkHlT71NisujrYawqJ/BOyAN5JmGyM=;
        b=WZGPFZUru/e8PVA/LrdJXSBPFLF69KpxYjSgOw78Y9N2VCXGeG7Dp3uVvy+tedBoh+
         I9srmisCkxxoSGExDzKmqG0DVwYXi5ClrWlr5eoJDIgcX7JDoFkR4RRwCVinaVPHiCuF
         80XB4gLcy6JpHrAGq06kZDwcFWmJjX0kj4u/RQ8zpDIVETVMVlVZG+OuXTAyAe5qg76D
         df+Qn9ykaDJpzDsUGIruONpbf+Uzb8lHSVDrSGbu3dWvooCakVKgS1CzFUBK7gAqAp4Q
         3+bAf0w5CvjhNBVR+xJNZ8NGQ61sngHgWmV+nJVYlw8vuyva/uj7l3ye7bC5uuP1Xswy
         fG4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8MobhWNJpD52w5BpVwFhDhVVuTIMwdqtSYwjnZlrIMHisW/jvpPYILuUjGFZuGCyyUXt4UgNC4EwMQ2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhyEOntZCe9urSFLcqoyyrhKxMFzhTzOqN4pRdLIjSSpBaHgJV
	hIca8YDojDy6pDvXv1P4A+pOBURQAY/hinwlrMSDNeqOL9jItA95WniDkrQLFy815vQ=
X-Gm-Gg: Acq92OHDTaDJ4vbiU113w3Jj+RcOxZ5llfaXqmEquZ9DtUKhRVqjn1Ism6cDxmk27TX
	w/Bbg3WKojYeKZvKpZW/bQezjxqMSqEr/IuGUfj6Q1u8MTwnf5a3EyHSx79Xh5Q7CHHA5m4yRlH
	PJmtvlljG6APplDF9h+5Hq0Ku09SdN7Aiv1pdnNEm+Ftx22CNNtCkV5eDRdMm57wUZBX3cZ7Fat
	pOeH4VldQXT1HGyG34qYRqzCnk3+c47KCD/nZPkPleRR+552lL6M0WpAgSZoSGStDcCyJWkYhT1
	DcR9JSgKWsqGP7i3YwPD8XtTl0ztyPbVs3mpPrtQZj/q73aHn4DsMaLqg4h4YotynxAHMqR2vuF
	pkLWrzlUwW7JIdBQZ+Mfc3CP5gZpMgoWcCgV5ngYi5Tbukh1ZRqfUsIoOqrMshFv57txvWmrm8R
	y0Bys8SHvQhli8RFoVxSwSRbOrmAxwXRSRb/0YxppOsejpD8J4PBTqa+dheny0DUMd/gTl
X-Received: by 2002:a17:907:9607:b0:bda:17d0:cf02 with SMTP id a640c23a62f3a-bda17d0cf22mr285739166b.19.1779279297448;
        Wed, 20 May 2026 05:14:57 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e604e6sm840883366b.52.2026.05.20.05.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 05:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 14:14:56 +0200
Message-Id: <DINHVCP2GI7N.2AJJFB3CM2DHN@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Himanshu Bhavani" <himanshu.bhavani@siliconsignals.io>,
 <sakari.ailus@linux.intel.com>
Cc: "Hardevsinh Palaniya" <hardevsinh.palaniya@siliconsignals.io>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Elgin Perumbilly"
 <elgin.perumbilly@siliconsignals.io>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Walter Werner Schneider"
 <contact@schnwalter.eu>, "Kate Hsuan" <hpa@redhat.com>, "Svyatoslav Ryhel"
 <clamor95@gmail.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
 <20260520115641.11729-4-himanshu.bhavani@siliconsignals.io>
In-Reply-To: <20260520115641.11729-4-himanshu.bhavani@siliconsignals.io>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62273-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,ideasonboard.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,siliconsignals.io:email,0.0.0.50:email,fairphone.com:mid,fairphone.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.10:email]
X-Rspamd-Queue-Id: CD6AD58D884
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Himanshu,

On Wed May 20, 2026 at 1:56 PM CEST, Himanshu Bhavani wrote:
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
>
> Add device tree support for the Sony IMX576 front camera
> sensor and connect it to CAMSS via CSIPHY3.
>
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io=
>

Your Signed-off-by is missing here as well

> ---
>  .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm=
64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 3964aae47fd4..5fb0f3eddf66 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -17,6 +17,7 @@
>  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interfaces.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
> @@ -547,6 +548,24 @@ vreg_bob: bob {
>  	};
>  };
>
> +&camss {
> +

random extra newline

> +	vdd-csiphy3-0p9-supply =3D <&vreg_l18a>;
> +	vdd-csiphy3-1p25-supply =3D <&vreg_l22a>;

If you're already enabling that, please also add the supplies for the
other CSIPHYs (0-3).

But also, since camss for sm6350 hasn't been merged upstream yet, this
patchset depends on
https://lore.kernel.org/linux-arm-msm/20260216-sm6350-camss-v4-0-b9df35f87e=
db@fairphone.com/
You need to declare that in the cover letter!

> +
> +	status =3D "okay";
> +
> +	ports {
> +		port@3 {
> +			csiphy3_ep: endpoint {
> +				data-lanes =3D <0 1 2 3>;
> +				bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				remote-endpoint =3D <&camera_imx576_ep>;
> +			};
> +		};
> +	};
> +};
> +
>  &cci0 {
>  	status =3D "okay";
>  };
> @@ -582,6 +601,34 @@ &cci1 {
>
>  &cci1_i2c0 {
>  	/* Front cam (Sony IMX576) @ 0x10 */

Remove the comment now since you're adding the node.

> +	camera@10 {
> +		compatible =3D "sony,imx576";
> +		reg =3D <0x10>;
> +
> +		avdd-supply =3D <&vreg_l3p>;
> +		dovdd-supply =3D <&vreg_32m_cam_dvdd_1p05>;
> +		dvdd-supply =3D <&vreg_l6p>;
> +
> +		clocks =3D <&camcc CAMCC_MCLK1_CLK>;
> +		assigned-clocks =3D <&camcc CAMCC_MCLK1_CLK>;
> +		assigned-clock-rates =3D <24000000>;
> +
> +		reset-gpios =3D <&tlmm 35 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 =3D <&cam_mclk1_default>;
> +		pinctrl-names =3D "default";
> +
> +		orientation =3D <0>;

I personally like adding a comment to make clear what '0' is:

		orientation =3D <0>; /* Front facing */

> +		rotation =3D <90>;
> +
> +		port {
> +			camera_imx576_ep: endpoint {
> +				data-lanes =3D <1 2 3 4>;
> +				bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				link-frequencies =3D /bits/ 64 <600000000>;
> +				remote-endpoint =3D <&csiphy3_ep>;
> +			};
> +		};
> +	};
>
>  	eeprom@50 {
>  		compatible =3D "giantec,gt24p64a", "atmel,24c64";
> @@ -1115,6 +1162,13 @@ platform {
>  &tlmm {
>  	gpio-reserved-ranges =3D <13 4>, <56 2>;
>
> +	cam_mclk1_default: cam-mclk1-default-state {
> +		pins =3D "gpio30";
> +		function =3D "cam_mclk1";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};

I think I was told before that this can go into the SoC .dtsi

Regards
Luca

> +
>  	qup_uart1_sleep_cts: qup-uart1-sleep-cts-state {
>  		pins =3D "gpio61";
>  		function =3D "gpio";
> --
> 2.34.1


