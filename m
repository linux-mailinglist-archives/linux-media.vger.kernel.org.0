Return-Path: <linux-media+bounces-13143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3AB90613F
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 03:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD4931C20FBD
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 01:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8ECD1426F;
	Thu, 13 Jun 2024 01:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Y4G9Lj7Y"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B8CDF71;
	Thu, 13 Jun 2024 01:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718243097; cv=none; b=eI3nr/NON+y8NrMozl5/ul2UuhDbKAKoFdXUt6Hcwr7c/37+o3xacC29A/gMC0RzHo7zweA0Qr/dmiYPpgDzixXzJutPyrpGSFNIvzGsggFfgHJbijzxQGElaXvk5QOaKuNbTFrLyK2kbax/F0jfmgv7dgI78TgxsMTHMJ9hdVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718243097; c=relaxed/simple;
	bh=JApacLBSnTiOxd/MDGkRAN1Y3sRYhlmQq2aTWoRE4bE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WdoeKLtn358RvcCZ5pExg4p+b67qjG2ObQ7+RYlKfZgSZva0l+cRmXzZPQ6FYEmWZNzb5Ha4krXD6Q7ZtsDt4mYO6VoOIixb6KnE6psJIuwl7r7/E+bZJn+f/ggRQhMgMwYOrJmfizn2C+e1S4v+Hn8ikaaAn2TxQNjX0qN+TF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Y4G9Lj7Y; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B6DDC88889;
	Thu, 13 Jun 2024 03:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1718243087;
	bh=8D0zdflsI+96R7w3bD5NSguq6bh8HmskkbvDsqKuIjI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y4G9Lj7YZyz826W8kg8SLmzz9PcBNKaX50qQDykFrdDIxPA84jt+DMD0TQ4JsPO+j
	 rehvu3K1/7z8DtyBOriAYXVMhgx3/yQEqgnIjrR8xCbK0lPc90qHiLZmfl2f4c9oHR
	 8+UvmkJsqFwwVliqIfSe2ebT3yxhYbsAIxvmItvr/Ce5qHRBz5cSmddPyFr1qpNYNf
	 IH+4sRid03mnPXH5mcJKe0o8g+U7E4ChhwVGn4N/3NBJsfHve2Xw57vyjQdq4ru8Wg
	 4PGYoXOL5W4kEysH9T3a1Y5xwccL4lQoVIq5Iiv78FBrv7gWDQFkpYjiViBOuwR6A6
	 7omnv3C+2ppwg==
Message-ID: <3cc52973-61b0-4698-98b7-402634f2b620@denx.de>
Date: Thu, 13 Jun 2024 03:10:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
To: Peng Fan <peng.fan@nxp.com>, Adam Ford <aford173@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Paul Elder <paul.elder@ideasonboard.com>, Conor Dooley
 <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20240325151339.19041-1-laurent.pinchart@ideasonboard.com>
 <4879631.GXAFRqVoOG@steina-w>
 <20240325204924.GY18799@pendragon.ideasonboard.com>
 <2929432.e9J7NaK4W3@steina-w>
 <CAHCN7xLFjJUZQZwPbj5xyxnprwAV3TOvd_6A6sBwOPK+V6uQPA@mail.gmail.com>
 <AM6PR04MB59412D143AA8C20AFB479E8F88C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <6ba1db19-32d6-4d25-824d-731bea65b583@denx.de>
 <AM6PR04MB594198421BCC895B506C408A88C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <AM6PR04MB594198421BCC895B506C408A88C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/11/24 5:01 AM, Peng Fan wrote:

[...]

>>>> According to the i.MX8MP Data sheet, the nominal speed for
>>>> MEDIA_ISP_CLOCL_ROOT is 400MHZ with 500MHz being allowed in
>> overdrive
>>>> mode.
>>>>
>>>> I think this clock rate should drop to  the nominal value of 400MHz
>>>> and those boards who support overdrive can increase it to 500MHz to
>>>> avoid stiability issues and/or running out of spec.  I created an
>>>> imx8mm and imx8mn- overdrive.dtsi file.  If there is interest, I can do the
>> same for the 8MP as well.
>>>>
>>>> I haven't gone through all the clocks to determine if/what clocks are
>>>> being overdriven.
>>>
>>> Shouldn't the bootloader take the work to runtime update the freq?
>>> Why need introduce an extra overdrive.dtsi?
>>
>> Shouldn't the overdrive/non-overdrive decision be done in board DT instead ?
> 
> It is bootloader configure voltage to nominal, then bootloader should use
> nominal device tree or runtime update dtb.
> If bootloader configure voltage to over-drive, bootloader could use
> nominal or over-drive dtb

I think the bootloader should always configure the minimal common 
configuration, i.e. nominal voltage, nominal clock, so that it would 
achieve maximum compatibility with any SoC in that SoC line up.

If the user does need overdrive configuration, they should specify that 
in their board DT.

Keep in mind, the kernel is easy to update (including kernel DT), the 
bootloader is not easy to update (esp. in field, bootloader update may 
render a system unbootable if it fails). I would say, it is better to 
keep the complicated things out of the bootloader if at all possible.

> If introduce x.dtsi and x-overdrive.dtsi, how to let board choose which dtsi
> to include?

#include "x.dtsi"
or
#include "x-overdrive.dtsi"

But I think your question is -- how to do that at runtime ?

U-Boot can apply DT overlays onto DT that is passed to Linux, so if the 
user has board variants where they need both nonoverdrive/overdrive 
options, they can apply DT overlay which enables the overdrive mode on 
boards which need it. This can be done from U-Boot boot.scr or similar 
boot script, which can again be easily updated, without the need to 
update the bootloader itself (if something goes wrong or needs to be 
changed in the future).

