Return-Path: <linux-media+bounces-797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2557F458C
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 13:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E6CF1C2096C
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 12:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204AA22077;
	Wed, 22 Nov 2023 12:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="gwGcZpgW"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACBE991
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 04:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700655429; x=1701260229; i=wahrenst@gmx.net;
	bh=5a7SpBIqBTj9NQorp+HarjQLazaHAF52dvsI8opYEco=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=gwGcZpgW8otqf3uW/m2+GQ+xA/lPEB8X6qgkk8IM4zLNM2Z+DNGftdwMAJadm+Em
	 vcXTUYdScFby4GUpEuNvVmVtkNFWuGLZU6hO9j3cQV5Ktc1ugwIth4rghgTjmCLo4
	 Z5XN6QqEPIfqcEMV/UpEtCUCHQ9FTIcQAPQH7NBlqzuxvYMK+j2v2jf+iVsg1nmeq
	 SZXFclh+LR89Lphb+D3g9YLWK693TgVQwpDhFXjMR9Gz5UWClIsrjcTyHNPx/TJvr
	 kBQuTxo+x+a0ewBYOPKPa+OBw0JHjvxSGd3ws1YTjbeF6zKSa20V7okrH2j6XwpgD
	 fvlsTCnmu1e9e7u4Cw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhD6g-1rayJy3KHy-00eN5S; Wed, 22
 Nov 2023 13:17:08 +0100
Message-ID: <8351ddaf-c63e-4527-809f-d002bd79ad14@gmx.net>
Date: Wed, 22 Nov 2023 13:17:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/3] staging: vchiq_arm: move state dump to debugfs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Phil Elwell
 <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 "Ricardo B . Marliere" <ricardo@marliere.net>
References: <20231029124837.119832-1-wahrenst@gmx.net>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231029124837.119832-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:p0oLHKWYdNhSl73B7peyp8TDoBwFXoVkK+RCNfI4SdwEd85tQTr
 V+b1DNRjebmEF7qIwQ7MCN+JBa8NrJ3e+nYilrHQwiiR37kR+iT2Da1sIjnjS/uG4g78xGs
 MRxsRVbsCqVx03oDcTQdN+mMtf7kHLsDce7ECD4NoQkahNH3RzaGL6JpOcaV9lEnkBVggxg
 qGNaMIEieloJbfBnSRXhw==
UI-OutboundReport: notjunk:1;M01:P0:8P2WDA8tsIs=;AWIv+OuOsyn5KiGUtheE0QUjJUr
 Cnw1lYT8PWLtpUegjUYajXIjTwFl/heK2qOKgkVkXdPaxszsuN5IQCqSPjU8F11eEmwauWpfJ
 cNdrLBpDBgpg0qgxURCWmrWsrKawrG/1XnldT+aDkIQYzpgXMEtUJBsPqhTq59lbu1v6BfEw7
 l5b+sZDH6EMRUAm/Af8vnHUKawQ1+t+Kv4Zns8IWMAXvx3kxu68AXFa4sVtDlcSBqFssyLQEJ
 MqEyyyrAAItwWo7pk5wRvwinSu7L0JJk220/KJntDwqm8yCeF9ow4KqOMr+cpdzRk0Es7IGAQ
 eI7e3ZOpM5nScPVlL2k0UbQO4RO+DRtFnIB+4ENcsx9yh7y+0kcM8eRNDiihlqSsimoX0xwfp
 IeUQMGqmupmnKNSUp9TB0M8e0+vzUf1kMfh4Befs3qepHfxQ3BLcZKo/Yk0ZYJtbiMOKOKXTp
 r40gDsGmtrGeh9dEKYY4FrqxQ19zzl06gbmX1JRRX3H9AjYDhH32c/IZ384ahGupZO32AlVYi
 KLX51yB7j4Hoo42wC8sroV+smMCBCbDqGKLdH8w8qClp6MljVyHCuaRUV5sfn7gg1VX0g8Fiy
 R5yfFmdF7vIme2hC1wC4eaRJZXNUP39XSKorBoJP9QFP3Kh4GcdvT12BHo9lwClv2EbMAgINK
 w5nAlCa9wM6RPJnr3LLCHisVTcsU1+YSl13HF4xnsimH7A4ygNaq1HGm1ZZpNu2JOVcIHhUBo
 nxJrxxUFBig0VKjXDA2ojv+NqIJPpBGQ7fudLbXUq0gWGCiobKZQEl51R99c1tpNe3w6un0SG
 sU8YKgHcafGS2nli2oeeLrfMp8xlxQfzrAfus6TS/aGETuWyWzjufic5/zFOV6vvE/+5n+7ms
 ihK7CggPUqpKrtV2oXZh1UfubDa++Li8/Df9tIcpGwL4zsbZhioM++E28zhle5Dn0lGUus4bh
 KKreFQVS4BEH76e6RmArvYa4ZpI=

Hi Greg,

Am 29.10.23 um 13:48 schrieb Stefan Wahren:
> Hello,
>
> since recent discussion raised the question about the future of debugfs
> for vchiq [1], i want to submit this cleanup patch series as part of the
> discussion and a small Halloween present ;-)
>
> Best regards
>
> Changes in V2:
> - rebase on top of current staging-next
> - address suggestion from Laurent Pinchart in patch 1
> - fix checkpatch issue (too long line) in patch 2
>
> [1] - https://lore.kernel.org/lkml/7ea529c2-3da6-47df-9b09-28d4ab36c4ef@kadam.mountain/T/
>
> Stefan Wahren (3):
>    staging: vchiq_core: Make vchiq_dump_service_state static
>    staging: vchiq_core: Shorten bulk TX/RX pending dump
>    staging: vchiq_arm: move state dump to debugfs

should i resend incl. the received Reviewed-by tags?

>
>   .../interface/vchiq_arm/vchiq_arm.c           |  94 ++----
>   .../interface/vchiq_arm/vchiq_arm.h           |   7 -
>   .../interface/vchiq_arm/vchiq_core.c          | 274 +++++++-----------
>   .../interface/vchiq_arm/vchiq_core.h          |  16 +-
>   .../interface/vchiq_arm/vchiq_debugfs.c       |  10 +
>   .../interface/vchiq_arm/vchiq_dev.c           |  21 --
>   6 files changed, 137 insertions(+), 285 deletions(-)
>
> --
> 2.34.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


