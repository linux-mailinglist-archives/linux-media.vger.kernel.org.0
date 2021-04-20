Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886F33659F0
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 15:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbhDTNZJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 09:25:09 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:46765 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230479AbhDTNZI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 09:25:08 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YqMilY68X8K3KYqMllzmro; Tue, 20 Apr 2021 15:24:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618925075; bh=H6wnEcKeZ+8/tOf0g5ZRihQj8kY6LqmYDHCwodi5Or4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BxWGcQI11dCDZIo6rEYJd75xkcjX83WxkBh1pir48ranKpteycux14t2tz26RwXff
         R3vW6DnKBvSnu9joVEhJCmRxzDp9icVTYhrHl/qMpSWPuHGHiH2tN04sQpJ/DgdGNc
         ApdDKO8KjK4y70QN9STeiv0kwtv3Tdym5qFPVpW3LroJJ5Y9HymzJk1A6TKIfDTLDL
         xaksgg+48es3wvvnZm/poxPiToiY+FmBuDHVOsrIQf7AkPy2kF1Eoo7W5fL0xuFZMb
         zIWdkheF2vOicU/mYVgusCm7GgAjIR+8VLEZZLd4B+3RcXkjcbn9t9Myze1dl5lT1L
         9CDCJA6R486Jw==
Subject: Re: [PATCH 1/6] staging: media: atomisp: improve function argument
 alignment
To:     Deepak R Varma <mh12gx2825@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <cover.1618859059.git.drv@mailo.com>
 <9b517e04d1a9b56dc14494a246d70915d51b1839.1618859059.git.drv@mailo.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <401d7d5a-70b7-3443-8612-eb4812e22af1@xs4all.nl>
Date:   Tue, 20 Apr 2021 15:24:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <9b517e04d1a9b56dc14494a246d70915d51b1839.1618859059.git.drv@mailo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJIFED2aVn04IwaztxkGJ1BQIM74DfjRPx0fZbZVAxOSm3NS6cl9drhoJaytTzJobL7jeP9OjjQjpAN4nd5iskNpGcNPHWRtWWEFNNsr8gJTlCelelnX
 kzBQHEkf1K/7WxC6gh1I+aoG/odu0JVOmtPro8XlN49Cd1beXO3ADh+HQHVMbV6hOsZGAah7wSPKOvWoMkXE+Nlxs7vZs0vTzKuMlJcZmKZJEnWb24GnU+uK
 Et6EMYnNs9sdw5Puvdlyz/bL7kl3tM8YgNkBM3FhDYf+zSsquZxOystKo0hEt89brvhhKCudiUC3wjb/z0Mbp7Vffdsrv27GIcepdCAR9nMQCOSv2W+V9g/f
 IEyBwyHLvpBzbo73q/rfcFw/4sB3gOfbVWREYhXsa8R7ibXDdoIU/GLlFCXTns76EozAXzHT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/04/2021 21:12, Deepak R Varma wrote:
> Improve multi-line function argument alignment according to the code style
> guidelines. Resolves checkpatch feedback: "Alignment should match
> open parenthesis".
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>

WARNING: From:/Signed-off-by: email address mismatch: 'From: Deepak R Varma <mh12gx2825@gmail.com>' != 'Signed-off-by: Deepak R Varma
<drv@mailo.com>'

Which email should I use? Ideally you should post from the same email
as the Signed-off-by.

Regards,

	Hans

> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 4 ++--
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> index 2b71de722ec3..6be3ee1d93a5 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -192,8 +192,8 @@ static int __gc0310_buf_reg_array(struct i2c_client *client,
>  }
>  
>  static int __gc0310_write_reg_is_consecutive(struct i2c_client *client,
> -	struct gc0310_write_ctrl *ctrl,
> -	const struct gc0310_reg *next)
> +					     struct gc0310_write_ctrl *ctrl,
> +					     const struct gc0310_reg *next)
>  {
>  	if (ctrl->index == 0)
>  		return 1;
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 78147ffb6099..6ba4a8adff7c 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -171,8 +171,8 @@ static int __gc2235_buf_reg_array(struct i2c_client *client,
>  }
>  
>  static int __gc2235_write_reg_is_consecutive(struct i2c_client *client,
> -	struct gc2235_write_ctrl *ctrl,
> -	const struct gc2235_reg *next)
> +					     struct gc2235_write_ctrl *ctrl,
> +					     const struct gc2235_reg *next)
>  {
>  	if (ctrl->index == 0)
>  		return 1;
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index eecefcd734d0..aec7392fd1de 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -212,8 +212,8 @@ static int __ov2722_buf_reg_array(struct i2c_client *client,
>  }
>  
>  static int __ov2722_write_reg_is_consecutive(struct i2c_client *client,
> -	struct ov2722_write_ctrl *ctrl,
> -	const struct ov2722_reg *next)
> +					     struct ov2722_write_ctrl *ctrl,
> +					     const struct ov2722_reg *next)
>  {
>  	if (ctrl->index == 0)
>  		return 1;
> 

