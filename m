Return-Path: <linux-media+bounces-62984-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIx0IKbAGGoumwgAu9opvQ
	(envelope-from <linux-media+bounces-62984-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:24:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D445FAEAC
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16947303E135
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 22:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB52F369D7D;
	Thu, 28 May 2026 22:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVgaA6Gh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C541359A6C;
	Thu, 28 May 2026 22:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006976; cv=none; b=F90v4yBrySm7cqo8tDaOnefvXE1mmvizsEKHoYPNFLCBj6C2hdjaddMkV5e6ytFVoD1zeqUjQnqgxwp++nT5jhrTKdVDc1P35/y3U+orfniITVqzfM4YN3hDCB5OI7B3/IF2rFKHojwOvXT1xcmh6iWoW7Jsm4zMzSvmQG59xyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006976; c=relaxed/simple;
	bh=kEhjhFBbf9yHTndAWDllWLthNat8T3zEDzSysbLs4MY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=J7Nx8qahyEJ1r0jRbuHjaUam610jAoB2Ragwnrej5mYE6aX3ySatoNaQlNwZg+MQ9kSJyJl8HLA0n7V5xzblQbQL7d481QgALmgG3BH49QB5ZuWrVO4FE5DTHrHevyQb6U7/4pp/PxwgOyY/O5ibBJznPwGlZIe/kChX4UQhnHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVgaA6Gh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540051F000E9;
	Thu, 28 May 2026 22:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006974;
	bh=RHSzqIqjJsdmncrj5+nLVXghkdnqP0I1kuHt//29DIQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nVgaA6GhqQWHoPjY0v/NiT3IMO2/7KPnFvSgdITi1dPzUo79rlzT9FHZ/l3HbtCYW
	 xJW62FEtUESmyQeIPuri1GSKbzxKL6qm60RP9n1LttYOBkuArHT+o8o6zmhVGw1Zel
	 hQPM5tBYxDT6i7GNHULAfsXN9BMJjl69UIun6ztBIvxBfee/SQyO59rk8jGEJ8TUxP
	 GnqSpE8U1a0p+h8fvmeK5TJ8imCwB6dup7SskV8a661m4CvZmpukMGfbRV60XBOejs
	 qzQVZFmN4O/ckd2K5cz7ywHqQEVO8YtI3a+ZXZlZfyxC5fWkgP6pH9RmcQq5GQawI1
	 v3SWgfK5l29uw==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/8] arm64: dts: qcom: shikra: Add CCI definitions
From: bod@kernel.org
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Suresh Vankadara <quic_svankada@quicinc.com>, 
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-5-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-5-645d2c8c75a7@qti.qualcomm.com>
Date: Thu, 28 May 2026 23:22:47 +0100
Message-Id: <178000696709.4557.9615154244947019683.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2875; i=bod@kernel.org;
 h=from:subject:message-id; bh=kEhjhFBbf9yHTndAWDllWLthNat8T3zEDzSysbLs4MY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGMA4iwNfXyN4aARCEBFcT1PxnJkHtlNStRrwA
 z+q8OWIN1WJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahjAOAAKCRAicTuzoY3I
 OrTKEAC+gqvWdwgp+bXrpElnt7SkR5L1LYcLcYuL1uhfnY3Uh6GfaFJWApUv3rQeP7ZzaNPhCzd
 etCtIf5dnwuGsO7ADpWuGa/5lErNXqfDRcU9PTPXnnBsuIFqfx5HpQvnwt+K5qyaKXdgsJkMMUn
 W5cTGniouOHij9uwqK/ggf6uRT/rqRE9qUyUBAjA5BopEvLVSIDSJgIfRIwbMrIbiB6Wo961+6Y
 7uoJMoyQ4ed+gTm/Ckw5vA1A+GmH7vYx7/m9q68TTVYd7EW09azPxIR7CVqQLnFqNXcwC54M+aR
 3SfCWY/p+hA8LdoNrraXvQcKI9rSPMTmM2HjXjyG/5fjmtJhJENHlWRu1c4N89cMOisbbuvXsj3
 Xp3BWwksxhaXBMIfbyAGSpm18NdIp+Wa9sWo/NoG7J+0aWI5VjBNpIYnRDr+8QlB9roYXI0hTO7
 RGst6d9rEjaISqeyIaYEnePD+ITk2MtJGGJdSAHqDCPe7RCxkuXHac1RL5/NZ6MJ1JEZPYoahkX
 jzbRV6Nl0eJuSpfsC3D7wTizu69iufhc3XNBytMiZlgyj7cwd7XyiaC20qFbx0TqLDoBcU7gx6H
 tI5pFb5hP/4oadddKkgUKfe+psW4IUmOhbmTN0lFMQQRO8AoMPI4JxKwjQxK9LXKeM/y5e79KYN
 u5v1PXbpgyIcnIQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62984-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.7.161.32:email];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,5c1b000:email,linaro.org:email,0.0.0.0:email,4ac0000:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 02D445FAEAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-26 22:42 +0530, Nihal Kumar Gupta wrote:
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 6c47cf2a7ef26b4bb7d7f642a240b435cf5208d8..46de35971f629ded990827ebd76134e652758ce3 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
>  			gpio-ranges = <&tlmm 0 0 165>;
>  			wakeup-parent = <&mpm>;
>  
> +			cci_i2c0_default: cci-i2c0-default-state {
> +				/* SDA, SCL */
> +				pins = "gpio36", "gpio37";
> +				function = "cci_i2c0";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci_i2c0_sleep: cci-i2c0-sleep-state {
> +				/* SDA, SCL */
> +				pins = "gpio36", "gpio37";
> +				function = "cci_i2c0";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci_i2c1_default: cci-i2c1-default-state {
> +				/* SDA, SCL */
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c1";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci_i2c1_sleep: cci-i2c1-sleep-state {
> +				/* SDA, SCL */
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c1";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
>  			qup_uart0_default: qup-uart0-default-state {
>  				pins = "gpio0", "gpio1";
>  				function = "qup0_se0";
> @@ -701,6 +733,44 @@ port@1 {
>  					reg = <1>;
>  				};
>  			};
> +
> +		};
> +
> +		cci: cci@5c1b000 {
> +			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x05c1b000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
> +
> +			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_CCI_0_CLK>;
> +			clock-names = "ahb",
> +				      "cci";
> +
> +			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
> +			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
>  		};
>  
>  		qupv3_0: geniqup@4ac0000 {
> 
> -- 
> 2.34.1
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod


