Return-Path: <linux-media+bounces-2913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF5381C910
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 12:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CDBF286648
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 11:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843F2168DC;
	Fri, 22 Dec 2023 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Ax7QBb5M"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB8C168A2
	for <linux-media@vger.kernel.org>; Fri, 22 Dec 2023 11:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1703244382; x=1703849182; i=wahrenst@gmx.net;
	bh=TqdG12bFAOI+j1S6/BbfaE90X3abTcB6iCaGVSIMnBQ=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=Ax7QBb5MWQNIjOGLBtzlatMYoQtIUJgXWTF5zUkvucEAgQjPjVpbXQtV4AD5hv0L
	 tI6tQfn/3ZFDdNsxpyEY1T32fLB2HZJYC1nyPL+9cZ8S6Bmp1oXoo/al4PUBRzD+Z
	 OIEKgdtrA1bukx3EVPFQeNOOVByrcERGnot2O0Mrl1hP0S5U9vPdgT+7LyeWB1QAQ
	 QhF2kregbIr+86DD1lnmjT5skyPigZYLRpE9vdnE83UTpmZrfShhnb2s8BXzyRVXQ
	 OKQz0T4gaGVkP6cHJQkN1/8XeCOyEeahOohf3XHlmVg6x6EKS+igC0dKhvMtqyhvn
	 KfY/+AIYx8DOlnkwzQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqs4f-1quS8l0PLt-00mry4; Fri, 22
 Dec 2023 12:26:22 +0100
Message-ID: <6cc73cc9-cc57-44ef-baf0-809e634c38c5@gmx.net>
Date: Fri, 22 Dec 2023 12:26:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: imx7_media_csi probe deferred
To: Tim Harvey <tharvey@gateworks.com>,
 linux-media <linux-media@vger.kernel.org>
Cc: Schrempf Frieder <frieder.schrempf@kontron.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Marek Vasut <marex@denx.de>
References: <CAJ+vNU2Kj=a-_xDBsNO5zkyP_mgLsVtA2bXqkAkpmCQmVEA_=w@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAJ+vNU2Kj=a-_xDBsNO5zkyP_mgLsVtA2bXqkAkpmCQmVEA_=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6UN8JbXQfzRZpvniPgcCGdw1GYr7Dw4UL760qMmp1YxAprstKM2
 Bg/o8iSuWTA5pWyIathT5kPr7745nuPSEdWbxrvkQ8zHRp39Eg+qqHuV4S2EWeizqJ4MIUO
 h9qdas/dUxyCqUPfxisXVDe7peyYah52mVSlz1MhQkNRMfcX72VcbiKfYzyYzY3wJs0wtYW
 pchVGwUzKP8xyku1g4gxg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IUKuVTKCukQ=;xvXfsr83lbdMfbNVk5wYeZUug1c
 TeN/wcphyciYOXAF98zWOeHvlVLyept2vegZgNqrq9O0JiTih05ErV5U1FRz1U9dByDucdI1p
 2I4VzA+xcH6pWHvciMzCGa3IO4BAmKx1d/5sQ9EitcFX5lbhSyvQMt3M23jLn65xCcQaSJQlt
 709zU7Riiw6/hPQpwbuxONlElk3o0dPptLs4uun3z7VnQ5XJNS3ME+oFKz5hlGm0EE/v0lDd6
 1K5lwGMIg5Gt8tmkgrPKshri1ii822F+d8JBRR7JqpQtCmq8jJ8bNhDJLJpByQsF0ACB5g5z9
 /ZmEpDl0Po9asIGutyBvqR/K3Wlfm/McdpMT14z2dRLQW/xLnTFgil2VFkJAX59qM9S5aeKkQ
 gfahy+qwyjJh7/kDZppKPfq7IRd9SAPdzJIVl1IZjxwmyrmgmZ2+S8OqbwYTGgn2h4buHja2b
 nU805mTQb/AjWtXDhIaUwHn2kgm9BuH02NBd4rkONKkupVNTTCdAxlgh5ZDqsQUyeDGZbtZII
 sJoLTuIzdpt+LoUao5EZ11rH3oX6Iltj3y4WnTOEQFQ5HXWNBWAFlnNaxlkZ9snMicLu29dPr
 t/Hye8vQt9cmkBpKLK38bshIyC6Ygo7V4WaFH78/rP85KNGDAkT5sYNwJGs7QiQCzcDAUwsIz
 lcYKJCoSsWocubbbtl85AfNLjYOQLAbVSjjt/DID0dbHfz+lKtrgFufpRR4VVy8YXa4EcKzDK
 xAa/OMQUNP0L7XnZEdri7t7hNUyGoLZ735/FgDTobVyXgr4DXMqy5fUCDoe1zjrXfC9Ps7dBS
 7gPWHDFCK27QAQDSrOb/UTV5w7Kuuo9fCIcPuppgyt/GUW6h1pz2G7NsW9aSy/0X3zfnoiUs5
 8xIvH15mbaBcisBsq1MZ5W5gOk3TVHWfHTRm7J29gHvG70lJ0OabKXMJMozM+yqvzaOay64YL
 N59uqA==

Hi Tim,

Am 22.12.23 um 02:12 schrieb Tim Harvey:
> Greetings,
>
> I'm running into an issue with Linux 6.6 (6.6.8) when compiling with
> modules where the imx7_media_csi driver probe is deferred and I'm not
> clear how to troubleshoot the cause.
one important question would be "did it ever worked before?"
>
> The board is imx8mm-venice-gw73xx-0x [1] with
> imx8mm-venice-gw73xx-0x-imx219.dtso [2] and I'm using
> arch/arm64/configs/defconfig.
>
> The kernel reports the following:
> # dmesg | egrep csi\|mipi\|imx219
> [    1.293264] i2c 2-0010: Fixed dependency cycle(s) with
> /soc@0/bus@32c00000/mipi-csi@32e30000/ports/port@0/endpoint
> [   12.001419] imx219 2-0010: supply VANA not found, using dummy regulat=
or
> [   12.044885] imx219 2-0010: supply VDDL not found, using dummy regulat=
or
> [   12.164308] imx7-csi 32e20000.csi: Registered csi capture as /dev/vid=
eo0
> [   12.178460] imx7-csi 32e20000.csi: error -ENOTCONN: Failed to get
> remote endpoint
> [   12.200047] imx7-csi: probe of 32e20000.csi failed with error -107
> # cat /sys/kernel/debug/devices_deferred
> cpufreq-dt
> 32e30000.mipi-csi       platform: wait for supplier
> /soc@0/bus@32c00000/csi@32e20000/port/endpoint
> # zcat /proc/config.gz | egrep VIDEO_IMX219\|VIDEO_IMX_MIPI\|VIDEO_IMX7
> CONFIG_VIDEO_IMX7_CSI=3Dm
> CONFIG_VIDEO_IMX_MIPI_CSIS=3Dm
> CONFIG_VIDEO_IMX219=3Dm
> # lsmod | grep imx
> fsl_imx8_ddr_perf      16384  0
> imx8m_ddrc             12288  0
> imx7_media_csi         28672  0
> videobuf2_dma_contig    16384  2 hantro_vpu,imx7_media_csi
> videobuf2_v4l2         32768  3 hantro_vpu,imx7_media_csi,v4l2_mem2mem
> videobuf2_common       57344  6
> videobuf2_dma_contig,videobuf2_v4l2,hantro_vpu,imx7_media_csi,v4l2_mem2m=
em,videobuf2_memops
> imx_mipi_csis          24576  0
> imx219                 20480  0
> v4l2_cci               12288  1 imx219
> v4l2_fwnode            20480  2 imx219,imx_mipi_csis
> v4l2_async             20480  4 v4l2_fwnode,imx219,imx_mipi_csis,imx7_me=
dia_csi
> videodev              258048  8
> v4l2_async,v4l2_fwnode,imx219,videobuf2_v4l2,hantro_vpu,imx_mipi_csis,im=
x7_media_csi,v4l2_mem2mem
> mc                     61440  9
> v4l2_async,videodev,imx219,videobuf2_v4l2,hantro_vpu,videobuf2_common,im=
x_mipi_csis,imx7_media_csi,v4l
> 2_mem2mem
> spi_imx                24576  0
> imx_pcm_dma            12288  1 snd_soc_fsl_sai
> imx8mm_thermal         12288  0
> imx_sdma               24576  6
> imx_cpufreq_dt         12288  0
>
> The relevant dt looks like this:
>
> csi: csi@32e20000 {
>       compatible =3D "fsl,imx8mm-csi", "fsl,imx7-csi";
>       reg =3D <0x32e20000 0x1000>;
>       interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>       clocks =3D <&clk IMX8MM_CLK_CSI1_ROOT>;
>       clock-names =3D "mclk";
>       power-domains =3D <&disp_blk_ctrl IMX8MM_DISPBLK_PD_CSI_BRIDGE>;
Just a wild guess, has the power domains driver probed properly?
> Strangely I have a kernel config without modules where I do not run
> into this issue so it has something to do with modules but I haven't
> been able to determine which configs make a difference.
>
> Any ideas what is wrong here or tips on troubleshooting the cause for
> the probe defer?
In case the complete dmesg doesn't provide further errors, you could try
to add "initcall_debug" to the kernel cmdline.
>
> Best Regards,
>
> Tim
> [1] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/f=
reescale/imx8mm-venice-gw72xx-0x.dts
> [2] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/f=
reescale/imx8mm-venice-gw73xx-0x-imx219.dtso
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


