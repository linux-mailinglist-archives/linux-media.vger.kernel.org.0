Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D06B356DB2
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 15:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234168AbhDGNq1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 09:46:27 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:55571 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230142AbhDGNq0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 09:46:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id U8VYlSAykMxedU8VblIbRb; Wed, 07 Apr 2021 15:46:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617803176; bh=0lWAigJfnBdAZZQf3xF3B3OZq3RPO5pT/vKIgwsduMQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vST2vnOgJPU7s+FPHN0Q54yvcyoSD7k9oeeKzrGKDbE6+74lG4lDfxVosdujxghWy
         x7sGxou9eNRcfTUgwccyAEfUSUu0TOo7Nf3aYenv3T94ouZA1RMmyjiNq63/yZ5wDT
         pOaZI37q5LW3okoZ91lGVJVzJFgCkRdPzgEk0e8b6EEtb3mct7VeV8hnMxHSWFHzUT
         bE8BTZqXWGyU6w+c7epFa7h2IDx/7EQWk7bBLvOl1espNYbyRKWH6WPGniZTi2A12b
         K7C/sNYGyGAsWH1e2B5eHkrSfZ2PI71cDgj6xpBTCU+8R43Bd8wbvhVB41gx1c1HZH
         iyU5fznWkfSng==
Subject: Re: [PATCH 1/2] staging: media: omap4iss: Ending line with argument
To:     Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com
References: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
 <441d27060ff6477d0ad418f41e194b96373c1f7f.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e1b25826-1359-24dd-47ad-41fbd3a406b9@xs4all.nl>
Date:   Wed, 7 Apr 2021 15:46:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <441d27060ff6477d0ad418f41e194b96373c1f7f.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNyliiv7nqtDF3kIRgP2dS9nBfW2ds8w63Jf79FQQWaIoEcHFIWi6huzpYLA5yqNGxoRT32w4U8wVkdExRuFjCfLwiMYYo1FfWj1lqUpC9td5q8uJpiv
 nKAy8OxtaAgzCY497ggGunKAC/ZzitJ2sJZ5Sljlj7J4hiifOlrG7mp7PpbBIzQqNbEy67oJT6S4lU4QO8vU3d5NHv1yCWShnf4ijAeoOscHl1dlVC0fJsfg
 EKYl+taFLexwvVQRxGHVyI490LxnpmMdgsJJz8BkOFKa8SnBBGiCCMRSNJ5QSq0uMHmqq7ZnG5+wQHNW9LRcLOLqFLmpZxK4hdryQGvAIeNKk1JcSXLHydv8
 rHnSlJ2c0faHosLFp2C2Rqx0/PuV5KZdqPwnMA7Hrp9rAOasg5OgtA6/gz+aKa0nQbwkhtBgeyPTD26OWEPYKoCkT3Q1Lw7v8HkjzjtTq/Nw8QQbiRtSrCRS
 W8mqMJ9ec2s7CYbLuN1nL3uCxqxTc5zWwpskSg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Beatriz,

I'm now reviewing staging/media patches instead of Greg KH. See Vaishali's
email from today: "Sending patches for the drivers/staging/media".

On 01/04/2021 17:07, Beatriz Martins de Carvalho wrote:
> Remove checkpatch check "CHECK: Lines should not end with a '('" with
> argument present in next line and reorganize characters so the lines
> are under 100 columns
> 
> Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
> ---
>  drivers/staging/media/omap4iss/iss.c | 46 +++++++++++++---------------
>  1 file changed, 22 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> index dae9073e7d3c..e8f724dbf810 100644
> --- a/drivers/staging/media/omap4iss/iss.c
> +++ b/drivers/staging/media/omap4iss/iss.c
> @@ -559,9 +559,10 @@ static int iss_reset(struct iss_device *iss)
>  	iss_reg_set(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG,
>  		    ISS_HL_SYSCONFIG_SOFTRESET);
>  
> -	timeout = iss_poll_condition_timeout(
> -		!(iss_reg_read(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG) &
> -		ISS_HL_SYSCONFIG_SOFTRESET), 1000, 10, 100);
> +	timeout = iss_poll_condition_timeout(!(iss_reg_read(iss,
> +							    OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG)
> +							    & ISS_HL_SYSCONFIG_SOFTRESET),
> +							    1000, 10, 100);
>  	if (timeout) {
>  		dev_err(iss->dev, "ISS reset timeout\n");
>  		return -ETIMEDOUT;
> @@ -583,9 +584,10 @@ static int iss_isp_reset(struct iss_device *iss)
>  
>  	iss_reg_set(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_CTRL, ISP5_CTRL_MSTANDBY);
>  
> -	timeout = iss_poll_condition_timeout(
> -		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_CTRL) &
> -		ISP5_CTRL_MSTANDBY_WAIT, 1000000, 1000, 1500);
> +	timeout = iss_poll_condition_timeout(iss_reg_read(iss,
> +							  OMAP4_ISS_MEM_ISP_SYS1, ISP5_CTRL)
> +							  & ISP5_CTRL_MSTANDBY_WAIT, 1000000,
> +							  1000, 1500);
>  	if (timeout) {
>  		dev_err(iss->dev, "ISP5 standby timeout\n");
>  		return -ETIMEDOUT;
> @@ -595,9 +597,10 @@ static int iss_isp_reset(struct iss_device *iss)
>  	iss_reg_set(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_SYSCONFIG,
>  		    ISP5_SYSCONFIG_SOFTRESET);
>  
> -	timeout = iss_poll_condition_timeout(
> -		!(iss_reg_read(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_SYSCONFIG) &
> -		ISP5_SYSCONFIG_SOFTRESET), 1000000, 1000, 1500);
> +	timeout = iss_poll_condition_timeout(!(iss_reg_read(iss, OMAP4_ISS_MEM_ISP_SYS1,
> +							    ISP5_SYSCONFIG) &
> +							    ISP5_SYSCONFIG_SOFTRESET), 1000000,
> +							    1000, 1500);

As several other people already commented, these changes do not improve readability.
Just leave this code alone, it's good enough. Even splitting up the condition into
a separate function would degrade readability since that would make it harder to
discover the exact condition that will be polled for.

Not everything that checkpatch.pl flags is necessarily bad code :-)

>  	if (timeout) {
>  		dev_err(iss->dev, "ISP5 reset timeout\n");
>  		return -ETIMEDOUT;
> @@ -1104,33 +1107,28 @@ static int iss_create_links(struct iss_device *iss)
>  	}
>  
>  	/* Connect the submodules. */
> -	ret = media_create_pad_link(
> -			&iss->csi2a.subdev.entity, CSI2_PAD_SOURCE,
> -			&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SINK, 0);
> +	ret = media_create_pad_link(&iss->csi2a.subdev.entity, CSI2_PAD_SOURCE,
> +				    &iss->ipipeif.subdev.entity, IPIPEIF_PAD_SINK, 0);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = media_create_pad_link(
> -			&iss->csi2b.subdev.entity, CSI2_PAD_SOURCE,
> -			&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SINK, 0);
> +	ret = media_create_pad_link(&iss->csi2b.subdev.entity, CSI2_PAD_SOURCE,
> +				    &iss->ipipeif.subdev.entity, IPIPEIF_PAD_SINK, 0);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = media_create_pad_link(
> -			&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SOURCE_VP,
> -			&iss->resizer.subdev.entity, RESIZER_PAD_SINK, 0);
> +	ret = media_create_pad_link(&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SOURCE_VP,
> +				    &iss->resizer.subdev.entity, RESIZER_PAD_SINK, 0);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = media_create_pad_link(
> -			&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SOURCE_VP,
> -			&iss->ipipe.subdev.entity, IPIPE_PAD_SINK, 0);
> +	ret = media_create_pad_link(&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SOURCE_VP,
> +				    &iss->ipipe.subdev.entity, IPIPE_PAD_SINK, 0);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = media_create_pad_link(
> -			&iss->ipipe.subdev.entity, IPIPE_PAD_SOURCE_VP,
> -			&iss->resizer.subdev.entity, RESIZER_PAD_SINK, 0);
> +	ret = media_create_pad_link(&iss->ipipe.subdev.entity, IPIPE_PAD_SOURCE_VP,
> +				    &iss->resizer.subdev.entity, RESIZER_PAD_SINK, 0);
>  	if (ret < 0)
>  		return ret;
>  
> 

These, however, are readability improvements, so I'm happy with that.

Regards,

	Hans
