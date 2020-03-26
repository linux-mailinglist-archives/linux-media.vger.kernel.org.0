Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9FD193EC8
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 13:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgCZMYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 08:24:39 -0400
Received: from einhorn-mail.in-berlin.de ([217.197.80.20]:33203 "EHLO
        einhorn-mail.in-berlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbgCZMYj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 08:24:39 -0400
X-Greylist: delayed 859 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Mar 2020 08:24:38 EDT
X-Envelope-From: stefanr@s5r6.in-berlin.de
Received: from authenticated.user (localhost [127.0.0.1]) by einhorn.in-berlin.de  with ESMTPSA id 02QC9wFn024198
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Thu, 26 Mar 2020 13:09:58 +0100
Date:   Thu, 26 Mar 2020 13:09:57 +0100
From:   Stefan Richter <stefanr@s5r6.in-berlin.de>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux1394-devel@lists.sourceforge.net
Subject: Re: [PATCH v3 17/22] media: Kconfig: mode firewire comment to
 firewire/Kconfig
Message-ID: <20200326130957.63299c27@kant>
In-Reply-To: <94f1d3fc3467bf2335a3e286e2c6055bdf7c37d5.1585129041.git.mchehab+huawei@kernel.org>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
        <94f1d3fc3467bf2335a3e286e2c6055bdf7c37d5.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mar 25 Mauro Carvalho Chehab wrote:
> This comment should only be visible if the DVB_FIREDTV
> config will show.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Stefan Richter <stefanr@s5r6.in-berlin.de>

> ---
>  drivers/media/Kconfig          | 2 --
>  drivers/media/firewire/Kconfig | 5 ++++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> index 4fbebb6bda15..ad9636692183 100644
> --- a/drivers/media/Kconfig
> +++ b/drivers/media/Kconfig
> @@ -185,8 +185,6 @@ source "drivers/media/mmc/Kconfig"
>  endif
>  
>  
> -comment "FireWire (IEEE 1394) Adapters"
> -	depends on DVB_CORE && FIREWIRE
>  source "drivers/media/firewire/Kconfig"
>  
>  comment "Media ancillary drivers (tuners, sensors, i2c, spi, frontends)"
> diff --git a/drivers/media/firewire/Kconfig b/drivers/media/firewire/Kconfig
> index e7837da5905b..0c1f326f581f 100644
> --- a/drivers/media/firewire/Kconfig
> +++ b/drivers/media/firewire/Kconfig
> @@ -1,7 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +if DVB_CORE && FIREWIRE
> +comment "FireWire (IEEE 1394) Adapters"
> +
>  config DVB_FIREDTV
>  	tristate "FireDTV and FloppyDTV"
> -	depends on DVB_CORE && FIREWIRE
>  	help
>  	  Support for DVB receivers from Digital Everywhere
>  	  which are connected via IEEE 1394 (FireWire).
> @@ -18,3 +20,4 @@ config DVB_FIREDTV_INPUT
>  	def_bool INPUT = y || (INPUT = m && DVB_FIREDTV = m)
>  
>  endif # DVB_FIREDTV
> +endif # DVB_CORE && FIREWIRE



-- 
Stefan Richter
-======--=-- --== ==-=-
http://arcgraph.de/sr/
