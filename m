Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B5736D6A2
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 13:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239339AbhD1Li6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 07:38:58 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:44827 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234057AbhD1Li5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 07:38:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id biW6lVBsZk1MGbiW9lOAqa; Wed, 28 Apr 2021 13:38:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619609891; bh=Zr6Rfum8iWwkboYZL48b5BsLX8JH1sDdHNd4md0GZqU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VZ4S4xu8It6p1lqcYdRG80cJwIxuWfiz1EEjXbcEKtsVKC2rbhWaF0gFIGRntYFL1
         lJqWod96dC+e8L8jBL6WZ4iMdpgvsuQUWl5RnQi92be3W+T04mRoGBVJVqi77Gznpv
         8pqpTkf2liRE5+ITO4h/pfjhJ1Sshit4yc1Ye2k7gH2u5TR/uVANfGpzPl+Rds2S8w
         V1TzIeeiHGREIF9ruJkZCyp1ltxX6MNnYbKBX9PEPF3GQJXlZgbTwBnRj75Ojr2EUV
         TRAK2+blYqJtQqI6Jub4h++sIgjt01j2MkWBRqdHHPxuORJbq6TCBbUU85ptXqboM3
         fNCuK64v7Mg0A==
Subject: Re: [PATCH RESEND v3 1/6] staging: media: atomisp: improve function
 argument alignment
To:     Deepak R Varma <drv@mailo.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <cover.1619199344.git.drv@mailo.com>
 <9b517e04d1a9b56dc14494a246d70915d51b1839.1619199344.git.drv@mailo.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6711378d-9769-c4da-3210-b381e67d3320@xs4all.nl>
Date:   Wed, 28 Apr 2021 13:38:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <9b517e04d1a9b56dc14494a246d70915d51b1839.1619199344.git.drv@mailo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHuEPMoUNg08xVKfb5qzjnEzDNLWinUEB+iBdcVW8ACisAfMggJm6E+JwT0PEAd/m8HhdFwVEsDTI+S1xa+AQeHwBOrMfIDwvxFvejyLTJzGPkISTOXw
 7p9d7kUzOcUt7tHPGnZM1IW9SLlO323UCOqT+GAKgw7Oyvzucusq6KtMMHGL/og0tuq/rrn9HfSrGsgAi5RHVgDOgVMcAcp2zWv9xXHv6j6Vnq63rgPQ8SFK
 9huNb8RfwgYmhA/+HDfXLuts8kz742SgUKfZgyCUD30TKoxthaOPCGuUzzr3u7j4+y2Oi6IV7gZjia31bU9B7tf8ps316vVv8hdqytTl75MoGAcjoTjqTYMV
 Va0S8dc3HBAO08uf2Xl87NykGRRVrkxq+CC9NzOijJlYNoo036vcL2ZEwdC6BEBa62e+IMyD
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deepak,

I'm dropping this patch since others have fixed this already.

Regards,

	Hans

On 25/04/2021 10:41, Deepak R Varma wrote:
> Improve multi-line function argument alignment according to the code style
> guidelines. Resolves checkpatch feedback: "Alignment should match
> open parenthesis".
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Changes since v2:
>    - None.
> Changes since v1:
>    - None.
> 
> 
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

