Return-Path: <linux-media+bounces-395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 536C17ECAF9
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 20:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB916B20C49
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 19:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435063A8E2;
	Wed, 15 Nov 2023 19:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3B1DC;
	Wed, 15 Nov 2023 11:04:17 -0800 (PST)
Received: from [192.168.1.129] ([37.4.248.43]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MMWcT-1qkyqR1Jzz-00JbZM; Wed, 15 Nov 2023 20:03:48 +0100
Message-ID: <3b9ec650-8a99-4bac-9ac9-d2cd87efced5@i2se.com>
Date: Wed, 15 Nov 2023 20:03:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] staging: mmal-vchiq: Use vc-sm-cma to support
 zero copy
Content-Language: en-US
To: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
 kernel-list@raspberrypi.com, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Ricardo B . Marliere" <ricardo@marliere.net>,
 Dan Carpenter <error27@gmail.com>
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
 <20231109210309.638594-6-umang.jain@ideasonboard.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20231109210309.638594-6-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:hRUgUPLJ7rFTcdE7NnVcI/4HzsqA4QYhQf3aFo9afPhySVvhACg
 ///NpGH8Kc41l0Xucn7dDL/L68PirBZ42PrNbUYgYG7D3G2W3tYshi8mtRw3lfS+XnAmCM0
 rQo082W3D2O9M9Nl8qzao9eoEA9zyeQKotc0xhQmXhA4zIyxpFBCw0WAreIMUPosdf23Y9l
 9ZXAY34760qzi05XY8MZQ==
UI-OutboundReport: notjunk:1;M01:P0:xlxB7dXYVbM=;ZzonCn7mXukF7za8R8WhfIBem8b
 7Y+9VSl8Tcrq8BKgZ/qdjJa092opnS/WGchGNB4vD6z/z0co4MooUwc6hKWDTSOFqmKyF6RmH
 tHMDIcfftwNr7OGnPsGp9dF/m7GK2N1xoZHjbyJOMcIqHSFuBScs5lW7YkzhX7HqSj11teeJD
 madIE93cDzmtvv8NW/eQqmkUfvWgIe5D+wRsXSMqSpQsdAzCvMea1B1i3gtYFsbC9YTYXKGYR
 LcW2sue9WGkd9aUG5GtuDsqZP+LQYf0D7uAMYD5TOHnAmvj4ALnQPdBAGcJcj+0P4II4Tlgt9
 Z7cAh2JSGQNIJ4LaiYh9nZ2MjCv5NoN0a1Y1/5ZYlT9e1BvTEnh7iGFWrOGOMD23P5GbNvaSP
 F4K1wxOB+S8cjrPXJZfsORyCzBeg8Ct+yfUUKBS7LKfkM2cTJao6bU+htyqSeBpbkTrcPHPqi
 G/BwZTn2UR1CIWitUnIXf4yBDsKDcM98tl8BC/NXTlLxESoxPzhMhwZRpOcvKSkqmCmefxLhK
 6+lFEmy+r1TpBcOhmz+QgZ5oxxZTIdHLX3zTU5rEo4PrDc5tOIdER3ays+WMPTFPDti1XHN69
 zv2C0GFnpjuMmN0w7Goi31uUPkY/WkOYiunN1SVGOPhf7PebD24l/7RRzw6eQklTWliwzODF8
 QcMgFKp+r9NMw7Ooti/bzBDg7o835td7ZpadUSkka0A8eJfkm+ulZjsR6L982lccHvqy0YpOp
 9vFguXT7+uTdMVllqp8sJdXvkl0i2duPtjG2EUjn7TgW+AR0tuxiJTMwh3X7Y/I5PALa2JO1x
 3boMM0fPaeZvXhWGFLHGkvGZPUkodRg0Yn5SgGvVNb28EE+G4VMgqceHUb5iq71/72EMIz7dG
 JMx4H6eWoWYghCg==

Hi Umang,

Am 09.11.23 um 22:02 schrieb Umang Jain:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> With the vc-sm-cma driver we can support zero copy of buffers between
> the kernel and VPU. Add this support to mmal-vchiq.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../staging/vc04_services/vchiq-mmal/Kconfig  |  1 +
>   .../vc04_services/vchiq-mmal/mmal-common.h    |  4 +
>   .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 84 +++++++++++++++++--
>   .../vc04_services/vchiq-mmal/mmal-vchiq.h     |  1 +
>   4 files changed, 83 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/Kconfig b/drivers/staging/vc04_services/vchiq-mmal/Kconfig
> index c99525a0bb45..a7c1a7bf516e 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/Kconfig
> +++ b/drivers/staging/vc04_services/vchiq-mmal/Kconfig
> @@ -1,6 +1,7 @@
>   config BCM2835_VCHIQ_MMAL
>   	tristate "BCM2835 MMAL VCHIQ service"
>   	depends on BCM2835_VCHIQ
> +	select BCM_VC_SM_CMA

i think we need more explanation in the commit message of the relation 
between these both modules.

On the one side BCM_VC_SM_CMA should be a driver, but it's not a driver 
for a specific hardware. It looks like more an extension of VCHIQ MMAL 
or does other (maybe not yet imported) vc04 driver make also use of this.

My question is: is BCM_VC_SM_CMA a real member on the VCHIQ bus and why?

Best regards

