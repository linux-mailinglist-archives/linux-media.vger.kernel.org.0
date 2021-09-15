Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4B740CB49
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 18:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhIOQ5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 12:57:40 -0400
Received: from gofer.mess.org ([88.97.38.141]:41201 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229465AbhIOQ5k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 12:57:40 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 08753C63A9; Wed, 15 Sep 2021 17:56:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1631724980; bh=VMstnmZT3s/Xx1M7BmRDFtjl0F92ortvP9S5FHSZZZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D6sNkhCpm0enmcvmUeFPEgfHVD0DTjhJaAhjhIWvFQemVo9zNuAesuOL7SFjXR0is
         zStfR15EKMuRtLTjQbpZX0CeG16+mvx/TlPFpsOY32iKF9Y+xFuOZ+Po85Y0GTJ7/X
         B6PKSgC3Tnp+gyDczI/aNb7ND6KsORfD2DpH6uig8G6yLP3z6jssaYmCUkg8xpnezy
         My+O6ClWwTxrZU8e60gx7gWdxaziPHxezSExL3DH6hFk5Y9XIDkyGGhO+6iO9X2DcA
         ciFFnIQDYowbTkKpIpSUKX0Ywk1WHkc0e8u2rWnA70zS0x/9Wfil2viTsESbNXaYv4
         MMpxqFol7RiYQ==
Date:   Wed, 15 Sep 2021 17:56:19 +0100
From:   Sean Young <sean@mess.org>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: dvb-core: Convert to SPDX identifier
Message-ID: <20210915165619.GB18319@gofer.mess.org>
References: <20210822040625.1190-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210822040625.1190-1-caihuoqing@baidu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 22, 2021 at 12:06:25PM +0800, Cai Huoqing wrote:
> use SPDX-License-Identifier instead of a verbose license text
> and remove verbose license text.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/dvb-core/dmxdev.c    | 12 +-----------
>  drivers/media/dvb-core/dvb_demux.c | 12 +-----------
>  drivers/media/dvb-core/dvb_vb2.c   |  4 ----
>  drivers/media/dvb-core/dvbdev.c    | 12 +-----------
>  4 files changed, 3 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
> index 5d5a48475a54..e94ae9427fdb 100644
> --- a/drivers/media/dvb-core/dmxdev.c
> +++ b/drivers/media/dvb-core/dmxdev.c
> @@ -1,19 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   * dmxdev.c - DVB demultiplexer device
>   *
>   * Copyright (C) 2000 Ralph Metzler & Marcus Metzler
>   *		      for convergence integrated media GmbH
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public License
> - * as published by the Free Software Foundation; either version 2.1
> - * of the License, or (at your option) any later version.

That's LGPL 2.1, not GPL 2.0+.

> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
>   */
>  
>  #define pr_fmt(fmt) "dmxdev: " fmt
> diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
> index 5fde1d38b3e3..c7a145bfbc55 100644
> --- a/drivers/media/dvb-core/dvb_demux.c
> +++ b/drivers/media/dvb-core/dvb_demux.c
> @@ -1,20 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   * dvb_demux.c - DVB kernel demux API
>   *
>   * Copyright (C) 2000-2001 Ralph  Metzler <ralph@convergence.de>
>   *		       & Marcus Metzler <marcus@convergence.de>
>   *			 for convergence integrated media GmbH
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public License
> - * as published by the Free Software Foundation; either version 2.1
> - * of the License, or (at your option) any later version.

That's LGPL 2.1, not GPL 2.0+.

> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
>   */
>  
>  #define pr_fmt(fmt) "dvb_demux: " fmt
> diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
> index 6974f1731529..602bbc52bd22 100644
> --- a/drivers/media/dvb-core/dvb_vb2.c
> +++ b/drivers/media/dvb-core/dvb_vb2.c
> @@ -5,10 +5,6 @@
>   * Copyright (C) 2015 Samsung Electronics
>   *
>   * Author: jh1009.sung@samsung.com
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation.
>   */
>  
>  #include <linux/err.h>
> diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
> index 795d9bfaba5c..d7c341bfcca1 100644
> --- a/drivers/media/dvb-core/dvbdev.c
> +++ b/drivers/media/dvb-core/dvbdev.c
> @@ -1,20 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   * dvbdev.c
>   *
>   * Copyright (C) 2000 Ralph  Metzler <ralph@convergence.de>
>   *                  & Marcus Metzler <marcus@convergence.de>
>   *                    for convergence integrated media GmbH
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public License
> - * as published by the Free Software Foundation; either version 2.1
> - * of the License, or (at your option) any later version.

That's LGPL 2.1, not GPL 2.0+.

> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
>   */
>  
>  #define pr_fmt(fmt) "dvbdev: " fmt
> -- 
> 2.25.1

Thanks
Sean
