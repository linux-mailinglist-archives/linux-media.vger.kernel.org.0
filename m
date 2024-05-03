Return-Path: <linux-media+bounces-10707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE378BB21E
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 20:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A133B1C23315
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 18:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AD615957A;
	Fri,  3 May 2024 18:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="nPVhPcUj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YWEzDtAy"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2727B158D61;
	Fri,  3 May 2024 18:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714759412; cv=none; b=adbiR1iVHdX2jmkep+L/adOgdHjXoV8oRzMTZwPhqk6KR5FnlzGOFi7AzB2utXKl+8PtMkadsGXJtzAZaMP2gX091U3C+Ygtme/IYkxUWHUUuQFGzWLbiLfk/xAeqgfoG57ewAwWd9ClBQgPsR5kz+DfHVP5dq0gAUcxx6plL+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714759412; c=relaxed/simple;
	bh=2NYuAByuuf+joirRIQd21905rgIpIxMQxSRMW56H+Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZCkzh7VWTiBnx8U36Pdg0wkyIXdbQZPCXsbLCuT2ecPoWN18GVPpsC556enQvt9KVitAGy/gdSpDpOu+j1zbXc+sWzRTQDPjZlipWWBLrrYajIe6jYdT/ZbCWKsw7duKmeBUq0ROOTLbPmHFBXQAFa0Iboy7wNZnkaJehGpzTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=nPVhPcUj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YWEzDtAy; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0956611400A5;
	Fri,  3 May 2024 14:03:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 03 May 2024 14:03:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1714759406;
	 x=1714845806; bh=Ga2Wpp3j/t3tXlk6Ge2dcRU+hsgif24Ama0dEbT3KC4=; b=
	nPVhPcUjpPLfeKROQlE/MzUPQGa6/sGcFLbEZpkIzwEWjd/+KKqJ7uegJqseZzSX
	CXIHiyORjUjVauGabfm3cYDcZoVgojm+5o7nANy7zm2DkeyrZ/gcHvNfXrepKoli
	BWR1cjPuzMNHFjmpJGQYdcPw0G9fybwwBtFslEhyJN5msJ3+dzJy1+1YknH5avEv
	Gj8fB8mpNcAv87gR4ePYht9fP48/9G6aDd2xAnSsHPVG96XduWQoLgraqQxXBSZY
	7+Y5aaRLeRZGwNcYUfm+7oYoSpORbLPCWi0s7eeGvS0yCh5rIbkTuTA9NJWx3xyQ
	rOzjhZ0Uo4015Dqyj8EUUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714759406; x=
	1714845806; bh=Ga2Wpp3j/t3tXlk6Ge2dcRU+hsgif24Ama0dEbT3KC4=; b=Y
	WEzDtAyHLhoKFTErXMoPM4flsucktG7gdpTqEEXXjO945fPg/nkaXSDPn3OCwnc2
	Cf92v5njqt5MGYs7CZSaDsMLU7FgaQ5Tr0uGgbq8LonGIpfmmTk5kwDkgYMgT31Y
	djsgfqwYV91O0mirBRzGGsyd+oHZ2araw0JsNbXozxCdo8mso+TDWma206SzXorr
	MeoznnGg+5FSPQceA8yUl5X6JryFqS6eKVfuf55ieVpeZCEWO0ZFItUSx4Gj8cMo
	QR0m4pev+20kXhTNGoM08bGja7T27T4ZuYTuQxVuEGNYt1mP/jlojss0MveLg/Vo
	kPbIyr0s1K3z3ay4JL7cg==
X-ME-Sender: <xms:7SY1ZnKW5xwbRFvnhE3nHbQ8YmGUQfQm-WWBQyzUUMmNqOvAL5P_1g>
    <xme:7SY1ZrKW0zTItjDVJi_jKoTGq2mEljXXf6SPjKDtWbzwDLym1wkkw947SPjLsqBfm
    dwwflWBtbgm7w-EiRQ>
X-ME-Received: <xmr:7SY1Zvtt89Y63jcaaJjxjkWJR3zz00-UTHQ3qlwdaZ74Q2f007NpBr5rST9bISfd4dTUCdut82wpJSDO14hE3sHaxtdrTog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvtddguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhi
    khhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleel
    hfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohgu
    vghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:7SY1ZgbCvIzgoXRUyAyCWn0qRLfkKpMok3Ep6VNvdpj2rmghabMZrA>
    <xmx:7SY1ZubEe9CyHbRxGI2i2-VqYW47OQve9TvVTLzhm_dzT-p2iw_Knw>
    <xmx:7SY1ZkAWiHAnY5-Qnic1fcquNj9BCWZnzW2uSynTLjxVjj-NKuXtYw>
    <xmx:7SY1ZsaKjKMSHAjLrSk3KZ5vWqpQ2Vwsg3_6EFo2ZJr0yNrJbt1O9Q>
    <xmx:7SY1Zm4x-At-KKMqwYaT0X0gjxmn7QH0T2VApxRpv6HunFA1nNOTPsCh>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 May 2024 14:03:24 -0400 (EDT)
Date: Fri, 3 May 2024 20:03:21 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 04/11] media: rcar-csi2: Use the subdev active state
Message-ID: <20240503180321.GK3927860@ragnatech.se>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-5-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503155127.105235-5-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thanks for your work.

On 2024-05-03 17:51:19 +0200, Jacopo Mondi wrote:
> Create the subdevice state with v4l2_subdev_init_finalize() and
> implement the init_state() operation to guarantee the state is initialized.

This fails and produces -EPIPE error when trying to capture on R-Car M3N 
using ADV748x. If I only apply patch 1, 2, 3 of this series it works as 
expected, when I apply this as well capture breaks.

You can test this on a remote Gen3 board without any HDMI or CVBS 
source, just enable a test patterns on the HDMI and AFE sources, see [1] 
for my test-case output which demonstrates how I produce the failure.

Oddly enough if I use the old vin-test package I can capture from HDMI 
while CVBS capture still fails with -EPIPE. Not sure what's going on.

1. Ignore the "Unable to get format: Inappropriate ioctl for device 
   (25)." from the "yavta --set-control ..." commands, they are 
   unimportant and not new. Focus in the "Unable to start streaming: 
   Broken pipe (32)." errors from "yavta -c10 --file=..  /dev/videoX" 
   calls, they are not new ;-)

===> star <===
Last login: Fri May  3 17:48:06 2024

Renesas Salvator-X 2nd version board based on r8a77965
0;root@arm64:~
arm64 ~ # echo wkbfirytku $$; rm -fr /tmp/vin-capture; echo ygxezpiinz $?
echo wkbfirytku $$; rm -fr /tmp/vin-capture; echo ygxezpiinz $?

wkbfirytku 403
ygxezpiinz 0
echo agyxksooma $$; mkdir -p /tmp/vin-capture; echo kvwostutox $?
0;root@arm64:~
arm64 ~ # echo agyxksooma $$; mkdir -p /tmp/vin-capture; echo kvwostutox $?

agyxksooma 403
kvwostutox 0
echo vtmzcdhjtc $$; grep -l 'adv748x 4-0070 afe' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo mwqkcmnuju $?
0;root@arm64:~
arm64 ~ # echo vtmzcdhjtc $$; grep -l 'adv748x 4-0070 afe' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo mwqkcmnuju $?

vtmzcdhjtc 403
/dev/v4l-subdev1
mwqkcmnuju 0
echo yavkazxvyn $$; grep -l 'VIN0 output' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo wpijcgewrd $?
0;root@arm64:~
arm64 ~ # echo yavkazxvyn $$; grep -l 'VIN0 output' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo wpijcgewrd $?

yavkazxvyn 403
/dev/video0
wpijcgewrd 0
echo nkitspntrm $$; for mdev in /dev/media*; do if [[ '$(media-ctl -d $mdev -p | grep 'rcar_vin')' != '' ]]; then echo $mdev; break; fi; done; echo ngoqmbhfqr $?
0;root@arm64:~
arm64 ~ # echo nkitspntrm $$; for mdev in /dev/media*; do if [[ '$(media-ctl -d $mdev -p | grep 'rcar_vin')' != '' ]]; then echo $mdev; break; fi; done; echo ngoqmbhfqr $?

nkitspntrm 403
/dev/media0
ngoqmbhfqr 0
echo ggokwokuyh $$; media-ctl -d /dev/media0 -r; echo yydmasvhba $?
0;root@arm64:~
arm64 ~ # echo ggokwokuyh $$; media-ctl -d /dev/media0 -r; echo yydmasvhba $?

ggokwokuyh 403
yydmasvhba 0
0;root@arm64:~
echo ftqgotsvwt $$; media-ctl -d /dev/media0 -l "'adv748x 4-0070 afe':8 -> 'adv748x 4-0070 txb':0 [1]"; echo ohfyvhjfrt $?
arm64 ~ # echo ftqgotsvwt $$; media-ctl -d /dev/media0 -l "'adv748x 4-0070 afe':8 -> 'adv748x 4-0070 txb':0 [1]"; echo ohfyvhjfrt $?

ftqgotsvwt 403
ohfyvhjfrt 0
0;root@arm64:~
echo nhtnyteajn $$; media-ctl -d /dev/media0 -l "'rcar_csi2 fea80000.csi2':1 -> 'VIN0 output':0 [1]"; echo vovincdzqi $?
arm64 ~ # echo nhtnyteajn $$; media-ctl -d /dev/media0 -l "'rcar_csi2 fea80000.csi2':1 -> 'VIN0 output':0 [1]"; echo vovincdzqi $?

nhtnyteajn 403
vovincdzqi 0
0;root@arm64:~
echo rulkcoorky $$; media-ctl -d /dev/media0 --get-v4l2 "'adv748x 4-0070 afe':8"; echo esoiygqdfq $?
arm64 ~ # echo rulkcoorky $$; media-ctl -d /dev/media0 --get-v4l2 "'adv748x 4-0070 afe':8"; echo esoiygqdfq $?

rulkcoorky 403
		[stream:0 fmt:UYVY8_2X8/720x240 field:alternate colorspace:smpte170m]
esoiygqdfq 0
0;root@arm64:~
echo dmdgcctvqh $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 afe':8 [fmt:UYVY8_2X8/720x240 field:alternate]"; echo ighfsicfux $?
arm64 ~ # echo dmdgcctvqh $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 afe':8 [fmt:UYVY8_2X8/720x240 field:alternate]"; echo ighfsicfux $?

dmdgcctvqh 403
ighfsicfux 0
0;root@arm64:~
echo mqlvxrvync $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 txb':0 [fmt:UYVY8_2X8/720x240 field:alternate]"; echo elpiosmlzj $?
arm64 ~ # echo mqlvxrvync $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 txb':0 [fmt:UYVY8_2X8/720x240 field:alternate]"; echo elpiosmlzj $?

mqlvxrvync 403
elpiosmlzj 0
0;root@arm64:~
echo aoldaiatak $$; media-ctl -d /dev/media0 -V "'rcar_csi2 fea80000.csi2':1 [fmt:UYVY8_2X8/720x240 field:alternate]"; echo iymsospuex $?
arm64 ~ # echo aoldaiatak $$; media-ctl -d /dev/media0 -V "'rcar_csi2 fea80000.csi2':1 [fmt:UYVY8_2X8/720x240 field:alternate]"; echo iymsospuex $?

aoldaiatak 403
iymsospuex 0
0;root@arm64:~
echo nxpbvfvtbv $$; yavta -f RGB565 -s 720x480 --field interlaced /dev/video0; echo dppdatfote $?
arm64 ~ # echo nxpbvfvtbv $$; yavta -f RGB565 -s 720x480 --field interlaced /dev/video0; echo dppdatfote $?

nxpbvfvtbv 403
Device /dev/video0 opened.
Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format set: RGB565 (50424752) 720x480 (stride 1440) field interlaced buffer size 691200
Video format: RGB565 (50424752) 720x480 (stride 1440) field interlaced buffer size 691200
dppdatfote 0
echo zsqtrrojrr $$; yavta --set-control '0x009f0903 1' /dev/v4l-subdev1; echo xkrxhzzdcq $?
0;root@arm64:~
arm64 ~ # echo zsqtrrojrr $$; yavta --set-control '0x009f0903 1' /dev/v4l-subdev1; echo xkrxhzzdcq $?

zsqtrrojrr 403
Device /dev/v4l-subdev1 opened.
Control 0x009f0903 set to 1, is 1
Unable to get format: Inappropriate ioctl for device (25).
xkrxhzzdcq 0
echo jifvldisax $$; yavta -c10 --file=/tmp/vin-capture/cvbs-solid-#.bin /dev/video0; echo tmzmlnjlsq $?
0;root@arm64:~
arm64 ~ # echo jifvldisax $$; yavta -c10 --file=/tmp/vin-capture/cvbs-solid-#.bin /dev/video0; echo tmzmlnjlsq $?

jifvldisax 403
Device /dev/video0 opened.
Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format: RGB565 (50424752) 720x480 (stride 1440) field interlaced buffer size 691200
8 buffers requested.
length: 691200 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffb1037000.
length: 691200 offset: 32768 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffb0f8e000.
length: 691200 offset: 65536 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffb0ee5000.
length: 691200 offset: 98304 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffb0e3c000.
length: 691200 offset: 131072 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffffb0d93000.
length: 691200 offset: 163840 timestamp type/source: mono/EoF
Buffer 5/0 mapped at address 0xffffb0cea000.
length: 691200 offset: 196608 timestamp type/source: mono/EoF
Buffer 6/0 mapped at address 0xffffb0c41000.
length: 691200 offset: 229376 timestamp type/source: mono/EoF
Buffer 7/0 mapped at address 0xffffb0b98000.
Unable to start streaming: Broken pipe (32).
8 buffers released.
tmzmlnjlsq 0
echo wojwgdpxnx $$; yavta --set-control '0x009f0903 2' /dev/v4l-subdev1; echo dghaavszch $?
0;root@arm64:~
arm64 ~ # echo wojwgdpxnx $$; yavta --set-control '0x009f0903 2' /dev/v4l-subdev1; echo dghaavszch $?

wojwgdpxnx 403
Device /dev/v4l-subdev1 opened.
Control 0x009f0903 set to 2, is 2
Unable to get format: Inappropriate ioctl for device (25).
dghaavszch 0
0;root@arm64:~
echo tldblgblou $$; yavta -c10 --file=/tmp/vin-capture/cvbs-colorbars-#.bin /dev/video0; echo pofbqvttib $?
arm64 ~ # echo tldblgblou $$; yavta -c10 --file=/tmp/vin-capture/cvbs-colorbars-#.bin /dev/video0; echo pofbqvttib $?

tldblgblou 403
Device /dev/video0 opened.
Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format: RGB565 (50424752) 720x480 (stride 1440) field interlaced buffer size 691200
8 buffers requested.
length: 691200 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffb75f7000.
length: 691200 offset: 32768 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffb754e000.
length: 691200 offset: 65536 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffb74a5000.
length: 691200 offset: 98304 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffb73fc000.
length: 691200 offset: 131072 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffffb7353000.
length: 691200 offset: 163840 timestamp type/source: mono/EoF
Buffer 5/0 mapped at address 0xffffb72aa000.
length: 691200 offset: 196608 timestamp type/source: mono/EoF
Buffer 6/0 mapped at address 0xffffb7201000.
length: 691200 offset: 229376 timestamp type/source: mono/EoF
Buffer 7/0 mapped at address 0xffffb7158000.
Unable to start streaming: Broken pipe (32).
8 buffers released.
pofbqvttib 0
0;root@arm64:~
echo maubyyzesr $$; yavta --set-control '0x009f0903 0' /dev/v4l-subdev1; echo dzbvegabvy $?
arm64 ~ # echo maubyyzesr $$; yavta --set-control '0x009f0903 0' /dev/v4l-subdev1; echo dzbvegabvy $?

maubyyzesr 403
Device /dev/v4l-subdev1 opened.
Control 0x009f0903 set to 0, is 0
Unable to get format: Inappropriate ioctl for device (25).
dzbvegabvy 0
0;root@arm64:~
echo pffcsadwlt $$; test -e /tmp/vin-capture/cvbs-solid-000007.bin; echo xilwxnvrrd $?
arm64 ~ # echo pffcsadwlt $$; test -e /tmp/vin-capture/cvbs-solid-000007.bin; echo xilwxnvrrd $?

pffcsadwlt 403
xilwxnvrrd 1
echo grglvpwocj $$; grep -l 'adv748x 4-0070 hdmi' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo hvcawnkqdt $?
0;root@arm64:~
arm64 ~ # echo grglvpwocj $$; grep -l 'adv748x 4-0070 hdmi' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo hvcawnkqdt $?

grglvpwocj 403
/dev/v4l-subdev4
hvcawnkqdt 0
echo nnpccbuzak $$; media-ctl -d /dev/media0 -r; echo zigvuehatt $?
0;root@arm64:~
arm64 ~ # echo nnpccbuzak $$; media-ctl -d /dev/media0 -r; echo zigvuehatt $?

nnpccbuzak 403
zigvuehatt 0
echo xyngygxuyr $$; media-ctl -d /dev/media0 -l "'adv748x 4-0070 hdmi':1 -> 'adv748x 4-0070 txa':0 [1]"; echo oknofsbyvn $?
0;root@arm64:~
arm64 ~ # echo xyngygxuyr $$; media-ctl -d /dev/media0 -l "'adv748x 4-0070 hdmi':1 -> 'adv748x 4-0070 txa':0 [1]"; echo oknofsbyvn $?

xyngygxuyr 403
oknofsbyvn 0
0;root@arm64:~
echo jkzuanypyp $$; media-ctl -d /dev/media0 -l "'rcar_csi2 feaa0000.csi2':1 -> 'VIN0 output':0 [1]"; echo onsaxggllz $?
arm64 ~ # echo jkzuanypyp $$; media-ctl -d /dev/media0 -l "'rcar_csi2 feaa0000.csi2':1 -> 'VIN0 output':0 [1]"; echo onsaxggllz $?

jkzuanypyp 403
onsaxggllz 0
0;root@arm64:~
echo lttzkqwwoa $$; media-ctl -d /dev/media0 --get-v4l2 "'adv748x 4-0070 hdmi':1"; echo imxtuqbxgf $?
arm64 ~ # echo lttzkqwwoa $$; media-ctl -d /dev/media0 --get-v4l2 "'adv748x 4-0070 hdmi':1"; echo imxtuqbxgf $?

lttzkqwwoa 403
		[stream:0 fmt:RGB888_1X24/1280x720 field:none colorspace:srgb]
imxtuqbxgf 0
0;root@arm64:~
echo degzwngmzk $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 hdmi':1 [fmt:RGB888_1X24/1280x720 field:none]"; echo vgqpdhbhjt $?
arm64 ~ # echo degzwngmzk $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 hdmi':1 [fmt:RGB888_1X24/1280x720 field:none]"; echo vgqpdhbhjt $?

degzwngmzk 403
vgqpdhbhjt 0
0;root@arm64:~
echo iwtingcfbz $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 txa':0 [fmt:RGB888_1X24/1280x720 field:none]"; echo qircbjupbq $?
arm64 ~ # echo iwtingcfbz $$; media-ctl -d /dev/media0 -V "'adv748x 4-0070 txa':0 [fmt:RGB888_1X24/1280x720 field:none]"; echo qircbjupbq $?

iwtingcfbz 403
qircbjupbq 0
0;root@arm64:~
echo twrjqisqff $$; media-ctl -d /dev/media0 -V "'rcar_csi2 feaa0000.csi2':1 [fmt:RGB888_1X24/1280x720 field:none]"; echo ocaivovrxk $?
arm64 ~ # echo twrjqisqff $$; media-ctl -d /dev/media0 -V "'rcar_csi2 feaa0000.csi2':1 [fmt:RGB888_1X24/1280x720 field:none]"; echo ocaivovrxk $?

twrjqisqff 403
ocaivovrxk 0
echo ajqwydmzik $$; yavta -f RGB565 -s 1280x720 --field none /dev/video0; echo fayawxvllj $?
0;root@arm64:~
arm64 ~ # echo ajqwydmzik $$; yavta -f RGB565 -s 1280x720 --field none /dev/video0; echo fayawxvllj $?

ajqwydmzik 403
Device /dev/video0 opened.
Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format set: RGB565 (50424752) 1280x720 (stride 2560) field none buffer size 1843200
Video format: RGB565 (50424752) 1280x720 (stride 2560) field none buffer size 1843200
fayawxvllj 0
echo pealtxybun $$; yavta --set-control '0x009f0903 1' /dev/v4l-subdev4; echo juhrczaeao $?
0;root@arm64:~
arm64 ~ # echo pealtxybun $$; yavta --set-control '0x009f0903 1' /dev/v4l-subdev4; echo juhrczaeao $?

pealtxybun 403
Device /dev/v4l-subdev4 opened.
Control 0x009f0903 set to 1, is 1
Unable to get format: Inappropriate ioctl for device (25).
juhrczaeao 0
0;root@arm64:~
echo oaxoraqdid $$; yavta -c10 --file=/tmp/vin-capture/hdmi-solid-#.bin /dev/video0; echo bfsxvmqitj $?
arm64 ~ # echo oaxoraqdid $$; yavta -c10 --file=/tmp/vin-capture/hdmi-solid-#.bin /dev/video0; echo bfsxvmqitj $?

oaxoraqdid 403
Device /dev/video0 opened.
Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format: RGB565 (50424752) 1280x720 (stride 2560) field none buffer size 1843200
8 buffers requested.
length: 1843200 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffafa8e000.
length: 1843200 offset: 32768 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffaf8cc000.
length: 1843200 offset: 65536 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffaf70a000.
length: 1843200 offset: 98304 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffaf548000.
length: 1843200 offset: 131072 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffffaf386000.
length: 1843200 offset: 163840 timestamp type/source: mono/EoF
Buffer 5/0 mapped at address 0xffffaf1c4000.
length: 1843200 offset: 196608 timestamp type/source: mono/EoF
Buffer 6/0 mapped at address 0xffffaf002000.
length: 1843200 offset: 229376 timestamp type/source: mono/EoF
Buffer 7/0 mapped at address 0xffffaee40000.
Unable to start streaming: Broken pipe (32).
8 buffers released.
bfsxvmqitj 0
echo pmbwbnrkkw $$; yavta --set-control '0x009f0903 2' /dev/v4l-subdev4; echo ucgivtjwvw $?
0;root@arm64:~
arm64 ~ # echo pmbwbnrkkw $$; yavta --set-control '0x009f0903 2' /dev/v4l-subdev4; echo ucgivtjwvw $?

pmbwbnrkkw 403
Device /dev/v4l-subdev4 opened.
Control 0x009f0903 set to 2, is 2
Unable to get format: Inappropriate ioctl for device (25).
ucgivtjwvw 0
0;root@arm64:~
echo rvkbtaiuan $$; yavta -c10 --file=/tmp/vin-capture/hdmi-colorbars-#.bin /dev/video0; echo fdlcrvrylc $?
arm64 ~ # echo rvkbtaiuan $$; yavta -c10 --file=/tmp/vin-capture/hdmi-colorbars-#.bin /dev/video0; echo fdlcrvrylc $?

rvkbtaiuan 403
Device /dev/video0 opened.
Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format: RGB565 (50424752) 1280x720 (stride 2560) field none buffer size 1843200
8 buffers requested.
length: 1843200 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffff86f8e000.
length: 1843200 offset: 32768 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffff86dcc000.
length: 1843200 offset: 65536 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffff86c0a000.
length: 1843200 offset: 98304 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffff86a48000.
length: 1843200 offset: 131072 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffff86886000.
length: 1843200 offset: 163840 timestamp type/source: mono/EoF
Buffer 5/0 mapped at address 0xffff866c4000.
length: 1843200 offset: 196608 timestamp type/source: mono/EoF
Buffer 6/0 mapped at address 0xffff86502000.
length: 1843200 offset: 229376 timestamp type/source: mono/EoF
Buffer 7/0 mapped at address 0xffff86340000.
Unable to start streaming: Broken pipe (32).
8 buffers released.
fdlcrvrylc 0
0;root@arm64:~
echo hrgnrsupul $$; yavta --set-control '0x009f0903 0' /dev/v4l-subdev4; echo bvgysmcxve $?
arm64 ~ # echo hrgnrsupul $$; yavta --set-control '0x009f0903 0' /dev/v4l-subdev4; echo bvgysmcxve $?

hrgnrsupul 403
Device /dev/v4l-subdev4 opened.
Control 0x009f0903 set to 0, is 0
Unable to get format: Inappropriate ioctl for device (25).
bvgysmcxve 0
echo znlqovrrra $$; test -e /tmp/vin-capture/hdmi-solid-000007.bin; echo sjpcuiptaf $?
0;root@arm64:~
arm64 ~ # echo znlqovrrra $$; test -e /tmp/vin-capture/hdmi-solid-000007.bin; echo sjpcuiptaf $?

znlqovrrra 403
sjpcuiptaf 1
exit
===> end <===

> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 138 +++++++++++----------
>  1 file changed, 75 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 2d464e43a5be..4d4dfb59b025 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -587,7 +587,8 @@ enum rcar_csi2_pads {
>  struct rcar_csi2_info {
>  	int (*init_phtw)(struct rcar_csi2 *priv, unsigned int mbps);
>  	int (*phy_post_init)(struct rcar_csi2 *priv);
> -	int (*start_receiver)(struct rcar_csi2 *priv);
> +	int (*start_receiver)(struct rcar_csi2 *priv,
> +			      struct v4l2_subdev_state *state);
>  	void (*enter_standby)(struct rcar_csi2 *priv);
>  	const struct rcsi2_mbps_reg *hsfreqrange;
>  	unsigned int csi0clkfreqrange;
> @@ -613,8 +614,6 @@ struct rcar_csi2 {
>  
>  	int channel_vc[4];
>  
> -	struct mutex lock; /* Protects mf and stream_count. */
> -	struct v4l2_mbus_framefmt mf;
>  	int stream_count;
>  
>  	bool cphy;
> @@ -808,20 +807,25 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
>  	return 0;
>  }
>  
> -static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
> +static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
> +				     struct v4l2_subdev_state *state)
>  {
>  	const struct rcar_csi2_format *format;
>  	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
> +	struct v4l2_mbus_framefmt *fmt;
>  	unsigned int lanes;
>  	unsigned int i;
>  	int mbps, ret;
>  
> +	/* Use the format on the sink pad to compute the receiver config. */
> +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +
>  	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
> -		priv->mf.width, priv->mf.height,
> -		priv->mf.field == V4L2_FIELD_NONE ? 'p' : 'i');
> +		fmt->width, fmt->height,
> +		fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
>  
>  	/* Code is validated in set_fmt. */
> -	format = rcsi2_code_to_fmt(priv->mf.code);
> +	format = rcsi2_code_to_fmt(fmt->code);
>  	if (!format)
>  		return -EINVAL;
>  
> @@ -849,11 +853,11 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
>  			vcdt2 |= vcdt_part << ((i % 2) * 16);
>  	}
>  
> -	if (priv->mf.field == V4L2_FIELD_ALTERNATE) {
> +	if (fmt->field == V4L2_FIELD_ALTERNATE) {
>  		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
>  			| FLD_FLD_EN;
>  
> -		if (priv->mf.height == 240)
> +		if (fmt->height == 240)
>  			fld |= FLD_FLD_NUM(0);
>  		else
>  			fld |= FLD_FLD_NUM(1);
> @@ -1049,15 +1053,18 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
>  	return 0;
>  }
>  
> -static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
> +static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
> +				    struct v4l2_subdev_state *state)
>  {
>  	const struct rcar_csi2_format *format;
> +	struct v4l2_mbus_framefmt *fmt;
>  	unsigned int lanes;
>  	int msps;
>  	int ret;
>  
> -	/* Calculate parameters */
> -	format = rcsi2_code_to_fmt(priv->mf.code);
> +	/* Use the format on the sink pad to compute the receiver config. */
> +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> +	format = rcsi2_code_to_fmt(fmt->code);
>  	if (!format)
>  		return -EINVAL;
>  
> @@ -1114,7 +1121,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
>  	return 0;
>  }
>  
> -static int rcsi2_start(struct rcar_csi2 *priv)
> +static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
>  {
>  	int ret;
>  
> @@ -1122,7 +1129,7 @@ static int rcsi2_start(struct rcar_csi2 *priv)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = priv->info->start_receiver(priv);
> +	ret = priv->info->start_receiver(priv, state);
>  	if (ret) {
>  		rcsi2_enter_standby(priv);
>  		return ret;
> @@ -1146,17 +1153,16 @@ static void rcsi2_stop(struct rcar_csi2 *priv)
>  static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> +	struct v4l2_subdev_state *state;
>  	int ret = 0;
>  
> -	mutex_lock(&priv->lock);
> +	if (!priv->remote)
> +		return -ENODEV;
>  
> -	if (!priv->remote) {
> -		ret = -ENODEV;
> -		goto out;
> -	}
> +	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
>  
>  	if (enable && priv->stream_count == 0) {
> -		ret = rcsi2_start(priv);
> +		ret = rcsi2_start(priv, state);
>  		if (ret)
>  			goto out;
>  	} else if (!enable && priv->stream_count == 1) {
> @@ -1165,49 +1171,26 @@ static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  	priv->stream_count += enable ? 1 : -1;
>  out:
> -	mutex_unlock(&priv->lock);
> +	v4l2_subdev_unlock_state(state);
>  
>  	return ret;
>  }
>  
>  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> -				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_state *state,
>  				struct v4l2_subdev_format *format)
>  {
> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	struct v4l2_mbus_framefmt *framefmt;
> -
> -	mutex_lock(&priv->lock);
> +	if (format->pad > RCAR_CSI2_SINK)
> +		return v4l2_subdev_get_fmt(sd, state, format);
>  
>  	if (!rcsi2_code_to_fmt(format->format.code))
>  		format->format.code = rcar_csi2_formats[0].code;
>  
> -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -		priv->mf = format->format;
> -	} else {
> -		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
> -		*framefmt = format->format;
> -	}
> -
> -	mutex_unlock(&priv->lock);
> -
> -	return 0;
> -}
> -
> -static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
> -				struct v4l2_subdev_state *sd_state,
> -				struct v4l2_subdev_format *format)
> -{
> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -
> -	mutex_lock(&priv->lock);
> -
> -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> -		format->format = priv->mf;
> -	else
> -		format->format = *v4l2_subdev_state_get_format(sd_state, 0);
> +	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
>  
> -	mutex_unlock(&priv->lock);
> +	/* Propagate the format to the source pads. */
> +	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < NR_OF_RCAR_CSI2_PAD; i++)
> +		*v4l2_subdev_state_get_format(state, i) = format->format;
>  
>  	return 0;
>  }
> @@ -1218,7 +1201,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
>  
>  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>  	.set_fmt = rcsi2_set_pad_format,
> -	.get_fmt = rcsi2_get_pad_format,
> +	.get_fmt = v4l2_subdev_get_fmt,
>  };
>  
>  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> @@ -1226,6 +1209,30 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
>  	.pad	= &rcar_csi2_pad_ops,
>  };
>  
> +static int rcsi2_init_state(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state)
> +{
> +	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
> +		.width		= 1920,
> +		.height		= 1080,
> +		.code		= MEDIA_BUS_FMT_RGB888_1X24,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.field		= V4L2_FIELD_NONE,
> +		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> +		.quantization	= V4L2_QUANTIZATION_DEFAULT,
> +		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> +	};
> +
> +	for (unsigned int i = RCAR_CSI2_SINK; i < NR_OF_RCAR_CSI2_PAD; i++)
> +		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
> +	.init_state = rcsi2_init_state,
> +};
> +
>  static irqreturn_t rcsi2_irq(int irq, void *data)
>  {
>  	struct rcar_csi2 *priv = data;
> @@ -1251,14 +1258,17 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
>  
>  static irqreturn_t rcsi2_irq_thread(int irq, void *data)
>  {
> +	struct v4l2_subdev_state *state;
>  	struct rcar_csi2 *priv = data;
>  
> -	mutex_lock(&priv->lock);
> +	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
> +
>  	rcsi2_stop(priv);
>  	usleep_range(1000, 2000);
> -	if (rcsi2_start(priv))
> +	if (rcsi2_start(priv, state))
>  		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
> -	mutex_unlock(&priv->lock);
> +
> +	v4l2_subdev_unlock_state(state);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -1870,23 +1880,23 @@ static int rcsi2_probe(struct platform_device *pdev)
>  
>  	priv->dev = &pdev->dev;
>  
> -	mutex_init(&priv->lock);
>  	priv->stream_count = 0;
>  
>  	ret = rcsi2_probe_resources(priv, pdev);
>  	if (ret) {
>  		dev_err(priv->dev, "Failed to get resources\n");
> -		goto error_mutex;
> +		return ret;
>  	}
>  
>  	platform_set_drvdata(pdev, priv);
>  
>  	ret = rcsi2_parse_dt(priv);
>  	if (ret)
> -		goto error_mutex;
> +		return ret;
>  
>  	priv->subdev.owner = THIS_MODULE;
>  	priv->subdev.dev = &pdev->dev;
> +	priv->subdev.internal_ops = &rcar_csi2_internal_ops;
>  	v4l2_subdev_init(&priv->subdev, &rcar_csi2_subdev_ops);
>  	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
>  	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
> @@ -1912,21 +1922,25 @@ static int rcsi2_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(&pdev->dev);
>  
> +	ret = v4l2_subdev_init_finalize(&priv->subdev);
> +	if (ret)
> +		goto error_pm_runtime;
> +
>  	ret = v4l2_async_register_subdev(&priv->subdev);
>  	if (ret < 0)
> -		goto error_pm_runtime;
> +		goto error_subdev;
>  
>  	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
>  
>  	return 0;
>  
> +error_subdev:
> +	v4l2_subdev_cleanup(&priv->subdev);
>  error_pm_runtime:
>  	pm_runtime_disable(&pdev->dev);
>  error_async:
>  	v4l2_async_nf_unregister(&priv->notifier);
>  	v4l2_async_nf_cleanup(&priv->notifier);
> -error_mutex:
> -	mutex_destroy(&priv->lock);
>  
>  	return ret;
>  }
> @@ -1941,8 +1955,6 @@ static void rcsi2_remove(struct platform_device *pdev)
>  	v4l2_subdev_cleanup(&priv->subdev);
>  
>  	pm_runtime_disable(&pdev->dev);
> -
> -	mutex_destroy(&priv->lock);
>  }
>  
>  static struct platform_driver rcar_csi2_pdrv = {
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

