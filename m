Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 994C04F432
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2019 09:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbfFVHoN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jun 2019 03:44:13 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:43337 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726092AbfFVHoN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jun 2019 03:44:13 -0400
Received: from [IPv6:2001:983:e9a7:1:c087:883d:6305:97f] ([IPv6:2001:983:e9a7:1:c087:883d:6305:97f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id eaguhVBDg7KeZeagwhQqlg; Sat, 22 Jun 2019 09:44:10 +0200
Subject: Re: [PATCH] media: atmel: atmel-isc: fix i386 build error
To:     Eugen.Hristev@microchip.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        sakari.ailus@iki.fi
References: <1560928828-31471-1-git-send-email-eugen.hristev@microchip.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <26c3aae1-c385-fa13-8baa-82a011f7b243@xs4all.nl>
Date:   Sat, 22 Jun 2019 09:44:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560928828-31471-1-git-send-email-eugen.hristev@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfG4wOSwZ9jtKh3iwxbJ24OF7fIMGc6xRcRI+oeh9cz8bAIix89ngRNyoLd9xOqxH+Ssq9npO5Sudu/x+mEBeAhkapSZRGOitLBe234aMh1/+poMUDVCD
 qQkshVWi+mun8Y1a1vD3m300wWjuNSonvcfa8E86PGgN5JHHU6HGf2zHilz+gRAGt353BAjN2zY0Aw00snhe/NieWILEB1oD39kmTAL2v93Ow2P/p3axXSs1
 DNsj1B8K1RHvfjbVLJ/O2OfKJ4TO2CqxjPYvbamHzyommFHA7xtoWrgzgJd0GoadYf5dtCfLrQNTeTj8YSM0Qmp+6JZdrkWWZzZVlSFY0KR236z4MCqLMM6Z
 BSJmrz34jk3MX1MfOiu1wWvvIgFxB9G+jwOXL/Fnlfl/R4lLsH+zjsLvrAAihNpY15BYrd660sW31NHSPJjcpnW5iuB3zA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/19/19 9:24 AM, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> ld: drivers/media/platform/atmel/atmel-isc-base.o:(.bss+0x0): multiple definition of `debug'; arch/x86/entry/entry_32.o:(.entry.text+0x21ac): first defined here
> 
> Changed module parameters to static.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> 
> Hello Hans,
> 
> Sorry for this, it looks like i386 has a stray weird 'debug' symbol which
> causes an error.
> I changed the module parameters of the atmel-isc to 'static' but now they
> cannot be accessed in the other module files.
> Will have to create a get function to be used in the other files if needed
> later. Any other way to make a symbol static to current module and not
> current file ? It would be useful for other config variables as well.
> I was not sure if you want to squash this over the faulty patch or add it
> as a separate patch.
> If you want me to squash it let me know and I will come up with a squashed
> new version.
> 
> Thanks,
> Eugen
> 
>  drivers/media/platform/atmel/atmel-isc-base.c | 4 ++--
>  drivers/media/platform/atmel/atmel-isc.h      | 4 ----
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> index eb1f5d4..c1c776b 100644
> --- a/drivers/media/platform/atmel/atmel-isc-base.c
> +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> @@ -35,11 +35,11 @@
>  #include "atmel-isc-regs.h"
>  #include "atmel-isc.h"
>  
> -unsigned int debug;
> +static unsigned int debug;
>  module_param(debug, int, 0644);

You can also use module_param_named, or use dev_dbg as Sakari suggested.

In any case, I've added this patch to my pull request since it's urgent to
fix this issue.

Regards,

	Hans

>  MODULE_PARM_DESC(debug, "debug level (0-2)");
>  
> -unsigned int sensor_preferred = 1;
> +static unsigned int sensor_preferred = 1;
>  module_param(sensor_preferred, uint, 0644);
>  MODULE_PARM_DESC(sensor_preferred,
>  		 "Sensor is preferred to output the specified format (1-on 0-off), default 1");
> diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
> index f5f5932..bfaed2f 100644
> --- a/drivers/media/platform/atmel/atmel-isc.h
> +++ b/drivers/media/platform/atmel/atmel-isc.h
> @@ -230,10 +230,6 @@ struct isc_device {
>  
>  #define ATMEL_ISC_NAME "atmel-isc"
>  
> -/* module parameters */
> -extern unsigned int debug;
> -extern unsigned int sensor_preferred;
> -
>  extern struct isc_format formats_list[];
>  extern const struct isc_format controller_formats[];
>  extern const u32 isc_gamma_table[GAMMA_MAX + 1][GAMMA_ENTRIES];
> 

