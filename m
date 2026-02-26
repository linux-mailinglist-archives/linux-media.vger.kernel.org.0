Return-Path: <linux-media+bounces-53435-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Lg/Emnyn2kyfAQAu9opvQ
	(envelope-from <linux-media+bounces-53435-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 08:12:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A04561A1B14
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 08:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C81DD308180A
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 07:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9BA38E5D7;
	Thu, 26 Feb 2026 07:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aX6zX1EW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1D42DEA74;
	Thu, 26 Feb 2026 07:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089873; cv=none; b=e+157d/woCZ3vTP4dVQwX7HiC0IjkNv2JG/Uq7myx7y8fMWFDDRbHnWat436Endje+UPdGQ6EkKYSeihg4YKks0XUAkflCMEJNsMd2i4nfBJO16SQkRuhWNTji5W4mzBgPy+scD8teksLFozGwT54bEvV/k6wZV1/JATuoM4RtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089873; c=relaxed/simple;
	bh=FhMuzNTXd3+fSk0m2N05mC2Lm9WqQtqXLRWD0nIiYBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkqgqeskvyhFXt0SBz2Ps5ymMP+KtUEjCxuAynesYmLFy7GbLS63ifTPaZmr5k7ab+mucj0TotUEc2RnrCtA38B5OoijAUpf+1CWQujrCz7ijWahx5t6ET4EbgDUXCUrcHAvYNqp5PnKHR1BSMrSZY0rTd10kTh4UCvq/ZFrS94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aX6zX1EW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87990C19422;
	Thu, 26 Feb 2026 07:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772089873;
	bh=FhMuzNTXd3+fSk0m2N05mC2Lm9WqQtqXLRWD0nIiYBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aX6zX1EWgnGl4txRINGhcCu8dZLEtHnvYgvON9vezRqQStu4JweO2QR5cjf9GeArI
	 ZiQ6KyNUcaSCrWtVRpMjdEoRWEx44NM813jQMk5rz5HBr4AIaPEiaNDNCU6Xyh3vu5
	 lqU5EwqE/RkVRaANosYu9kPpwtAnKPVO6X9GBpWq3mPhNRadULjtIMmOuq56RKNKtK
	 QmXsgCRx7NyZV/HhF1Ciixl6hffW2IHQR7Zq+ztwj0PNa+oOx7vg28M/yQq9EeDXyG
	 LjPefQXHH6AVyEGejEa0zXeJ5dIysrhbZcOgcf0X4v3wnPHjaso2VEvd3qt3UUTi8d
	 gymdb5W8Pjzdw==
Date: Thu, 26 Feb 2026 08:11:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v8 10/18] arm64: dts: qcom: x1e80100: Add MIPI CSI PHY
 nodes
Message-ID: <20260226-shaggy-nyala-from-jupiter-7abe18@quoll>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-10-95517393bcb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-10-95517393bcb2@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53435-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ace4000:email]
X-Rspamd-Queue-Id: A04561A1B14
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 03:11:27PM +0000, Bryan O'Donoghue wrote:
> +
>  	qup_opp_table_100mhz: opp-table-qup100mhz {
>  		compatible = "operating-points-v2";
>  
> @@ -5543,6 +5562,102 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		csiphy0: csiphy@ace4000 {
> +			compatible = "qcom,x1e80100-csi2-phy";

There is no such compatible documented in the kernel, nor in this
patchset. Either you combine DTS into driver patchset to solve this, or
don't combine DTS at all. DTS cannot go via driver tree.

This does not make easier deciphering dependencies for soc tree...

Best regards,
Krzysztof


