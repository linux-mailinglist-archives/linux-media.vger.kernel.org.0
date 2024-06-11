Return-Path: <linux-media+bounces-12911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B858B902EA1
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 04:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B40371C226CB
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 02:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6210A16F8EF;
	Tue, 11 Jun 2024 02:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="LIwdmBe2"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BBF1581E2;
	Tue, 11 Jun 2024 02:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718074473; cv=none; b=JSVXOe/8kFrSXWvY8yeL18rXgHe5AQwOTJLkWSnwFQL1kkjfb/vA6eXez4PqWmeITvg1BSF0Xkj8oW7+gp2W5WS9QGG9Effov3v5w+og3ols0QP6j7+c0qqND1vnYY/NMtSOoJkj5esMig5WiIC9YYQ1yVcAWy6R80IA9QUsN0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718074473; c=relaxed/simple;
	bh=B6JrR8spYLAtMxuiTQPXoUh3bzKZddatUwstvKi5B0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oatxT+ypsXWwapvC5znwjJ9YQgCFToRDTT0lXv/LvMyEbqqfhV1+4ANv2tnt4cSwsS/3w9D2R50iTvB6dDtQTfj8G+E4R8M3XmVncVRtq6iVMhUiNbE9hlwxz5MnbVsA2cKPrMRDjoGEAllMWM2v9TIm32+rk3LUPTA2gJuMEJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=LIwdmBe2; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 82774882F0;
	Tue, 11 Jun 2024 04:54:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1718074469;
	bh=3wcGmMprIXyqpMErHENzofPCAVoUfxmFpUsgL6R8fkY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LIwdmBe2sDkkvDx3BCYuUulWJsOIryQwDL7dtfbohiFn+1+ChNG59/PZZvHsSyw+A
	 2vu7XD2EB6TNK/dBRay2CvnrJQmbGJephxGflR83O116QBuTzJ1wAxcbF4C7mrVu9r
	 9omvqqx0hjRrjsZbVcqpZaOKgjHLZhEM50BQOHHtj11erGj0/L65DRdjp4ZyxLidwt
	 mkwLsKGLmrHnDNjgBYw+r+P9RXFMEQR9nfvcco6+jmCuarO8Pp95/pzkm65rDKN5df
	 eKDbRKPTJg5SVORHzCQnc0a1MvAr3FHkv13oO9X+BGZUnlLEtDnqOWMoqu5VnbmlYJ
	 cCskrSbQlTFCQ==
Message-ID: <6ba1db19-32d6-4d25-824d-731bea65b583@denx.de>
Date: Tue, 11 Jun 2024 03:34:05 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <AM6PR04MB59412D143AA8C20AFB479E8F88C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/11/24 3:04 AM, Peng Fan wrote:
>> Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
>>>>
>>>>> Something like
>>>>> ---8<---
>>>>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>>>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>>>>> @@ -1837,11 +1837,13 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
>>>>>                                                    <&clk IMX8MP_CLK_MEDIA_APB>,
>>>>>                                                    <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
>>>>>                                                    <&clk
>>>>> IMX8MP_CLK_MEDIA_DISP2_PIX>,
>>>>> +                                                 <&clk
>>>>> + IMX8MP_CLK_MEDIA_ISP>,
>>>>>                                                    <&clk IMX8MP_VIDEO_PLL1>;
>>>>>                                  assigned-clock-parents = <&clk
>> IMX8MP_SYS_PLL2_1000M>,
>>>>>                                                           <&clk IMX8MP_SYS_PLL1_800M>,
>>>>>                                                           <&clk IMX8MP_VIDEO_PLL1_OUT>,
>>>>> -                                                        <&clk IMX8MP_VIDEO_PLL1_OUT>;
>>>>> +                                                        <&clk IMX8MP_VIDEO_PLL1_OUT>,
>>>>> +                                                        <&clk
>>>>> + IMX8MP_SYS_PLL2_500M>;
>>>>>                                  assigned-clock-rates = <500000000>, <200000000>,
>>>>>                                                         <0>, <0>,
>>>>> <1039500000>;
>>>>
>>
>> According to the i.MX8MP Data sheet, the nominal speed for
>> MEDIA_ISP_CLOCL_ROOT is 400MHZ with 500MHz being allowed in
>> overdrive mode.
>>
>> I think this clock rate should drop to  the nominal value of 400MHz and those
>> boards who support overdrive can increase it to 500MHz to avoid stiability
>> issues and/or running out of spec.  I created an imx8mm and imx8mn-
>> overdrive.dtsi file.  If there is interest, I can do the same for the 8MP as well.
>>
>> I haven't gone through all the clocks to determine if/what clocks are being
>> overdriven.
> 
> Shouldn't the bootloader take the work to runtime update the freq?
> Why need introduce an extra overdrive.dtsi?

Shouldn't the overdrive/non-overdrive decision be done in board DT instead ?

