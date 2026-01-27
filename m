Return-Path: <linux-media+bounces-51607-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHArE9tCeGl/pAEAu9opvQ
	(envelope-from <linux-media+bounces-51607-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 05:45:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCACA8FE47
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 05:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D971302E932
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 04:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9092EA482;
	Tue, 27 Jan 2026 04:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WF5Kbspl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246071F2B8D;
	Tue, 27 Jan 2026 04:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769489084; cv=none; b=F6kZcoJCDnkt72FS+5svpbdLMSCCTLswYO2bF5ALbut6UkYBl7c8JIZutHKVse6e4Rxh6JBZk0FI+geD7bgu39lkr9/FUxFresD2DwblTL0GhdHMbV6JBbMlSdwU63g8X587n17Jhb5MNkFfh0RvtcdgKBRQZ3a2hPUX3ujFdcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769489084; c=relaxed/simple;
	bh=N4/dTgsSkKgyPM4oXZP0ylgXW3yR83HN4AMrwnF75aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbZ5EVseRActX1YCtzwsBEVAFpDuxvQsZYMz1F3BdI1J5Jdbba8O8njQi+kYVluZKq6csyqogbzQi5+tMq6GH88l3W+ueRRVo092B41NfHlu7vUMDYoI1rVFIo1D1e1vVcvGcgjW8i3j2dZfKBcHEuuk+eFuC4f/0SEr3KQ1aEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WF5Kbspl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF17FC116C6;
	Tue, 27 Jan 2026 04:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769489083;
	bh=N4/dTgsSkKgyPM4oXZP0ylgXW3yR83HN4AMrwnF75aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WF5KbspleVHuga8JwYh3EeefwmK+a6HDYpdOtJsIEhYhKi7SjlC1BWgGttTO8iTES
	 pnKiYzRN97JT9hPs+Xudm2RzaPx98OGJgd+B3CBaqga4r97b7UtC15r35QPKKKbGic
	 g02pRSd4SNV7lnfw0eCqPWJw6Ah31X1pRK9m2IP1udWZfsqBjAeOeTtyE+qzVFfxk2
	 6ACAOnIzIBkZ1r8gU/Fx2cWitvXT0Fr1JhoPMmBvXFRBnky5QC6k1Z0MSkoaI88pA1
	 xd/3vU1teyEqQuJhZpxRloBEM7oHKMRQHGs7yXbdPxjH1TaTVN+qPqm1+G1+MYw7bc
	 HP4pwwMayARyw==
Date: Tue, 27 Jan 2026 10:14:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christopher Ruehl <chris.ruehl@gtsys.com.hk>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Vincent Huang <vincent.huang@tw.synaptics.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Fix emails with spaces or missing brackets
Message-ID: <2pmaiz2yvgtmfjg6wtduoksjr34znalkvapr3dn3v6fqlxcdde@xkmnuvww7v37>
References: <20260126164724.2832009-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260126164724.2832009-1-robh@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51607-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[roeck-us.net,kernel.org,gmail.com,samsung.com,mobiveil.co.in,nxp.com,google.com,gtsys.com.hk,zx2c4.com,ew.tq-group.com,tw.synaptics.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,devicetree.org:url,gtsys.com.hk:email,tq-group.com:email,synaptics.com:email]
X-Rspamd-Queue-Id: BCACA8FE47
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 10:47:22AM -0600, Rob Herring (Arm) wrote:
> Fix email addresses with spaces or missing brackets. A pending
> dtschema meta-schema change will check for these.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml    | 2 +-
>  Documentation/devicetree/bindings/input/syna,rmi4.yaml          | 2 +-
>  .../devicetree/bindings/media/samsung,exynos5250-gsc.yaml       | 2 +-
>  Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml     | 2 +-

For PCI controllers,

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
> index 3d14d5fc96c5..7b38f2182ffa 100644
> --- a/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Sensirion SHTC1 Humidity and Temperature Sensor IC
>  
>  maintainers:
> -  - Christopher Ruehl chris.ruehl@gtsys.com.hk
> +  - Christopher Ruehl <chris.ruehl@gtsys.com.hk>
>  
>  description: |
>    The SHTC1, SHTW1 and SHTC3 are digital humidity and temperature sensors
> diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> index f369385ffaf0..8685ef4481f4 100644
> --- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> +++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> @@ -8,7 +8,7 @@ title: Synaptics RMI4 compliant devices
>  
>  maintainers:
>    - Jason A. Donenfeld <Jason@zx2c4.com>
> -  - Matthias Schiffer <matthias.schiffer@ew.tq-group.com
> +  - Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
>    - Vincent Huang <vincent.huang@tw.synaptics.com>
>  
>  description: |
> diff --git a/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
> index 878397830a4d..9196cf5dac0f 100644
> --- a/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
> +++ b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
> @@ -9,7 +9,7 @@ title: Samsung Exynos SoC G-Scaler
>  maintainers:
>    - Inki Dae <inki.dae@samsung.com>
>    - Krzysztof Kozlowski <krzk@kernel.org>
> -  - Seung-Woo Kim <sw0312.kim@samsung.com
> +  - Seung-Woo Kim <sw0312.kim@samsung.com>
>  
>  description:
>    G-Scaler is used for scaling and color space conversion on Samsung Exynos
> diff --git a/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml b/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
> index d286b77921e0..8f5d33050348 100644
> --- a/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Mobiveil AXI PCIe Host Bridge
>  
>  maintainers:
> -  - Frank Li <Frank Li@nxp.com>
> +  - Frank Li <Frank.Li@nxp.com>
>  
>  description:
>    Mobiveil's GPEX 4.0 is a PCIe Gen4 host bridge IP. This configurable IP
> -- 
> 2.51.0
> 

-- 
மணிவண்ணன் சதாசிவம்

