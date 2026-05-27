Return-Path: <linux-media+bounces-62891-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHGaC9nZFmpVtgcAu9opvQ
	(envelope-from <linux-media+bounces-62891-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:47:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 355D65E398E
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BDCCF3017E98
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045AA3B9D91;
	Wed, 27 May 2026 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J7vCu8Ho"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AA3400E10;
	Wed, 27 May 2026 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882333; cv=none; b=Sud547ANhrCqzgkmm+5xH1WdcFAR1wak9GmfDQhwZYfWEFqREDaJk++hmyZKQXhqE6S54HC+xL0C8ZyynBKDC2pxG5Pz02YMkyDfFY8XHzNZ+4RZ0DeOoFcmb94emSC/WJVJYll9anagtpoMq1S4Gp8fpEFMZJEhbva7dcQmGO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882333; c=relaxed/simple;
	bh=lD8D59F0rX4/9epBtkrlRda2HI8iAifPwcgPNJwjOUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OYHHGXponaXLw60aHRJHnXYwZj0cqdWeCDGYE96dAATFbFKkqxXghJx4OeN8YDS1iYnsePL8Yl4vLROFrZeXtzJygs/wrqCoiMcG8HTat5k1MVGnWVYl+/52X88n3u+3e9W3gn0oxTZzA9q+UoMh9cMrMmBg648qSoqxT0YsTLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J7vCu8Ho; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.83] (cpc89242-aztw30-2-0-cust469.18-1.cable.virginm.net [86.31.129.214])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DFB99D1;
	Wed, 27 May 2026 13:45:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779882311;
	bh=lD8D59F0rX4/9epBtkrlRda2HI8iAifPwcgPNJwjOUs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J7vCu8HoPmZC7g5BSoY5poUe7iUOTjvbQ0zwR6cVYF0UIG9jpSpARd3cx/SXUY1qV
	 fUDe2IOFPeoYbuH/FpMCnO0fx9zbeaEEGOr2NVae40xolOl+Y+esOg2TurKlc2PWQH
	 mGp4X3HDbpyp/qoHV38IsBnG73QHJnUBeo2evxoA=
Message-ID: <cb202484-3a53-4821-b1bd-5f910e0cd953@ideasonboard.com>
Date: Wed, 27 May 2026 12:45:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] Pinefeat cef168 lens control board driver
To: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, hverkuil@xs4all.nl,
 jacopo.mondi@ideasonboard.com, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, robh@kernel.org
References: <93997447-2f03-4449-ac51-ee6a2e470d58@ideasonboard.com>
 <20260526203552.16717-1-asmirnou@pinefeat.co.uk>
Content-Language: en-US
From: Alen Karnil <alen.karnil@ideasonboard.com>
Autocrypt: addr=alen.karnil@ideasonboard.com; keydata=
 xjMEafxhCxYJKwYBBAHaRw8BAQdAXswEEnvxYiHXb8Q8GsSAuaLuXqJFs3kmsMI7EWF9EuDN
 NUFsZW4gS2FybmlsIChXb3JrIElvQikgPGFsZW4ua2FybmlsQGlkZWFzb25ib2FyZC5jb20+
 wpkEExYKAEEWIQT0whyXpTyoVtApVAlRzoJ78NRPngUCagGrrgIbAwUJBaOagAULCQgHAgIi
 AgYVCgkICwIEFgIDAQIeBwIXgAAKCRBRzoJ78NRPnkpDAP4kmtHsMfTtV6BC1z7GTb86BL2g
 9FC1EarGJDDzcafMGQEA6clsoXvRYjHPJexVebjmkI4bq1QM0X/L9Ffe0PfpdQbOOARp/GEL
 EgorBgEEAZdVAQUBAQdAsVoGZ4IK0EgJ8HU05PQKzK15jaCi/IEA/7Cw9ZzcBmwDAQgHwn4E
 GBYKACYWIQT0whyXpTyoVtApVAlRzoJ78NRPngUCafxhCwIbDAUJBaOagAAKCRBRzoJ78NRP
 nqYcAP0eh3LahCDsfNa8zsiK+8QzeujWPKhc5zDcIqrDI6xufwD+Mu9e202It54rNZb8UWEy
 V5OzTEy0JlsQfO6DYWIORwI=
In-Reply-To: <20260526203552.16717-1-asmirnou@pinefeat.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,xs4all.nl,ideasonboard.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-62891-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alen.karnil@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 355D65E398E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 26/05/2026 21:35, Aliaksandr Smirnou wrote:
> On Tue, 26 May 2026 16:54:37 +0100, Alen Karnil wrote:
> 
>> I've been asked by Kieran Bingham to review your patches, I've
>> reproduced your work on setup with a Pi 5 with a 6.18 kernel and
>> I got a few questions
> 
> Hi Alen,
> 
> Thank you for resuming the work on the patch.
> 
>> I built the calibration application but it would not work out the
>> box, I can see that CEF168_V4L2_CID_CUSTOM is different between that
>> is in the patch and in the application? Which is the correct one,
>> does the  patch need updating?
> 
> The CEF168_V4L2_CID_CUSTOM value used in the patch is the correct one.
> 
> Although the repository currently defines it with a different value,
> this does not cause any issues for users because the driver is built
> and installed locally together with the calibration tool.
> 
> I can update the value in the cef168 repository at any time, so as long
> as users pull the latest version of the repository, everything will work
> correctly.
> 
> If the driver is eventually merged into the Linux kernel source tree,
> the repository will need to be updated accordingly anyway, because there
> will be no need to build the driver locally.
> 
>> The tool to modify the device tree also did not work with the
>> IMX477, I needed to manually modify my device tree to get the dtbo
>> to build,
> 
> I just double-checked the setup on a Raspberry Pi 5 running the latest
> 6.18 kernel from the stock Raspberry Pi OS, and everything works
> correctly. Are you using a customized Linux distribution?
> 
Strange, I've taken the latest RPi lite trxie OS, but I replaced the 
kernel from the rpi-6.18.y branch.

> Could you provide the build error logs and the overlay files generated
> by the tool before you modified them?
using the configure.sh tool with imx477
imx477_378-overlay.dtsi

```
// SPDX-License-Identifier: GPL-2.0-only
// Definitions for IMX477 camera module on VC I2C bus

/{
	compatible = "brcm,bcm2835";

	fragment@0 {
		target = <&i2c0if>;
		__overlay__ {
			status = "okay";
		};
	};

	clk_frag: fragment@1 {
		target = <&cam1_clk>;
		cam_clk: __overlay__ {
			clock-frequency = <24000000>;
			status = "okay";
		};
	};

	fragment@2 {
		target = <&i2c0mux>;
		__overlay__ {
			status = "okay";
		};
	};

	reg_frag: fragment@3 {
		target = <&cam1_reg>;
		cam_reg: __overlay__ {
			startup-delay-us = <300000>;
		};
	};

	fragment@4 {
		target = <&cam_node>;
		__overlay__ {
			lens-focus = <&vcm_node>;
		};
	};

	reg_alwayson_frag: fragment@99 {
		target = <&cam1_reg>;
		__dormant__ {
			regulator-always-on;
		};
	};

	i2c_frag: fragment@100 {
		target = <&i2c_csi_dsi>;
		__overlay__ {
			#address-cells = <1>;
			#size-cells = <0>;
			status = "okay";

			#include "imx477_378.dtsi"
		};
	};

	csi_frag: fragment@101 {
		target = <&csi1>;
		csi: __overlay__ {
			status = "okay";

			port {
				csi_ep: endpoint {
					remote-endpoint = <&cam_endpoint>;
					clock-lanes = <0>;
					data-lanes = <1 2>;
					clock-noncontinuous;
				};
			};
		};
	};

	fragment@102 {
		target = <&csi1>;
		__dormant__ {
			compatible = "brcm,bcm2835-unicam-legacy";
		};
	};

	__overrides__ {
		rotation = <&cam_node>,"rotation:0";
		orientation = <&cam_node>,"orientation:0";
		media-controller = <0>,"!102";
		cam0 = <&i2c_frag>, "target:0=",<&i2c_csi_dsi0>,
		       <&csi_frag>, "target:0=",<&csi0>,
		       <&clk_frag>, "target:0=",<&cam0_clk>,
		       <&reg_frag>, "target:0=",<&cam0_reg>,
		       <&reg_alwayson_frag>, "target:0=",<&cam0_reg>,
		       <&cam_node>, "clocks:0=",<&cam0_clk>,
		       <&cam_node>, "VANA-supply:0=",<&cam0_reg>;
		always-on = <0>, "+99";
		link-frequency = <&cam_endpoint>,"link-frequencies#0";
		vcm = <&vcm_node>, "status",
		      <0>, "=4";
	};
};

&cam_node {
	status = "okay";
};

&cam_endpoint {
	remote-endpoint = <&csi_ep>;
};

&vcm_node {
	status = "okay";
};
```

And imx477_378.dtsi

```
cam_node: imx477@1a {
	reg = <0x1a>;
	status = "disabled";

	clocks = <&cam1_clk>;
	clock-names = "xclk";

	VANA-supply = <&cam1_reg>;	/* 2.8v */
	VDIG-supply = <&cam_dummy_reg>;	/* 1.05v */
	VDDL-supply = <&cam_dummy_reg>;	/* 1.8v */

	rotation = <180>;
	orientation = <2>;

	port {
		cam_endpoint: endpoint {
			clock-lanes = <0>;
			data-lanes = <1 2>;
			clock-noncontinuous;
			link-frequencies =
				/bits/ 64 <450000000>;
		};
	};
};

vcm_node: cef168@d {
	compatible = "pinefeat,cef168";
	reg = <0x0d>;
	status = "disabled";
	vcc-supply = <&vdd_3v3_reg>;
};
```

If put these into my kernel build I get:

$ make dtbs
   DTCO     arch/arm64/boot/dts/overlays/camera-mux-2port.dtbo
arch/arm64/boot/dts/overlays/imx477_378.dtsi:26.20-31.3: ERROR 
(duplicate_label): /fragment@200/__overlay__/pca@70/i2c@1/cef168@d: 
Duplicate label 'vcm_node' on 
/fragment@200/__overlay__/pca@70/i2c@1/cef168@d and 
/fragment@200/__overlay__/pca@70/i2c@0/cef168@d
ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.dtbs:142: 
arch/arm64/boot/dts/overlays/camera-mux-2port.dtbo] Error 2
make[2]: *** [scripts/Makefile.build:544: arch/arm64/boot/dts/overlays] 
Error 2
make[1]: *** [/home/admin/linux/Makefile:1498: dtbs] Error 2
make: *** [Makefile:248: __sub-make] Error 2

> 
> The modifications applied by the tool are shown in this diff:
> 
> https://gist.github.com/pinefeat/1b3a258a193754f073e171b1ed33a0cc
> 
> Were the generated files different in your setup?
I will include my working dts* for the imx477

imx477_378-overlay.dtsi
```
// SPDX-License-Identifier: GPL-2.0-only
// Definitions for IMX477 camera module on VC I2C bus

/{
	compatible = "brcm,bcm2835";

	fragment@0 {
		target = <&i2c0if>;
		__overlay__ {
			status = "okay";
		};
	};

	clk_frag: fragment@1 {
		target = <&cam1_clk>;
		cam_clk: __overlay__ {
			clock-frequency = <24000000>;
			status = "okay";
		};
	};

	fragment@2 {
		target = <&i2c0mux>;
		__overlay__ {
			status = "okay";
		};
	};

	reg_frag: fragment@3 {
		target = <&cam1_reg>;
		cam_reg: __overlay__ {
			startup-delay-us = <300000>;
		};
	};

	reg_alwayson_frag: fragment@99 {
		target = <&cam1_reg>;
		__dormant__ {
			regulator-always-on;
		};
	};

	i2c_frag: fragment@100 {
		target = <&i2c_csi_dsi>;
		__overlay__ {
			#address-cells = <1>;
			#size-cells = <0>;
			status = "okay";

			#include "imx477_378.dtsi"

			vcm: cef168@d {
				compatible = "pinefeat,cef168";
				reg = <0x0d>;
				status = "disabled";
				vcc-supply = <&vdd_3v3_reg>;
			};
		};
	};

	csi_frag: fragment@101 {
		target = <&csi1>;
		csi: __overlay__ {
			status = "okay";

			port {
				csi_ep: endpoint {
					remote-endpoint = <&cam_endpoint>;
					clock-lanes = <0>;
					data-lanes = <1 2>;
					clock-noncontinuous;
				};
			};
		};
	};

	fragment@102 {
		target = <&csi1>;
		__dormant__ {
			compatible = "brcm,bcm2835-unicam-legacy";
		};
	};

	__overrides__ {
		rotation = <&cam_node>,"rotation:0";
		orientation = <&cam_node>,"orientation:0";
		media-controller = <0>,"!102";
		cam0 = <&i2c_frag>, "target:0=",<&i2c_csi_dsi0>,
		       <&csi_frag>, "target:0=",<&csi0>,
		       <&clk_frag>, "target:0=",<&cam0_clk>,
		       <&reg_frag>, "target:0=",<&cam0_reg>,
		       <&reg_alwayson_frag>, "target:0=",<&cam0_reg>,
		       <&cam_node>, "clocks:0=",<&cam0_clk>,
		       <&cam_node>, "VANA-supply:0=",<&cam0_reg>;
		always-on = <0>, "+99";
		vcm = <&vcm>, "status=okay",
		      <&cam_node>,"lens-focus:0=", <&vcm>;
		link-frequency = <&cam_endpoint>,"link-frequencies#0";
	};

};

&cam_node {
	status = "okay";
};

&cam_endpoint {
	remote-endpoint = <&csi_ep>;
};
```

Also I needed to add `vcm` to my dtoverlay for the pi's config.txt
> 
>> there needs to be some further discussions on how we could
>> improve the user experience when it comes to enabling the vcm with
>> camera sensors.
> 
> I agree. I started the discussion on the Raspberry Pi forum, but the
> driver needs to be merged first before moving forward with that.
Sure that makes sense, lets focus on the driver for now.
> 
> https://forums.raspberrypi.com/viewtopic.php?p=2318070#p2318070

Also you will most likely need to update the patch since the line 
offsets have moved to work 6.18


