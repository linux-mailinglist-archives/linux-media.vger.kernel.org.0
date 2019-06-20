Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE924DC77
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 23:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbfFTV0e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 17:26:34 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51636 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfFTV0e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 17:26:34 -0400
Received: from [IPv6:2804:431:d719:ae74:d711:794d:1c68:5ed3] (unknown [IPv6:2804:431:d719:ae74:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2877C286270;
        Thu, 20 Jun 2019 22:26:30 +0100 (BST)
Subject: Re: [PATCH 1/1] staging: media: fix style problem
To:     Aliasgar Surti <aliasgar.surti500@gmail.com>,
        linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org
References: <1561008675-30224-1-git-send-email-aliasgar.surti500@gmail.com>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <f5789433-6403-db2b-48f5-732257f7be0d@collabora.com>
Date:   Thu, 20 Jun 2019 18:25:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561008675-30224-1-git-send-email-aliasgar.surti500@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Alisgar,

On 6/20/19 2:31 AM, Aliasgar Surti wrote:
> From: Aliasgar Surti <aliasgar.surti500@gmail.com>
>
> checkpatch reported "WARNING: line over 80 characters".
> This patch fixes the warning for file davinci_vpfe/dm365_isif.c
>
> Signed-off-by: Aliasgar Surti <aliasgar.surti500@gmail.com>
> ---
>  drivers/staging/media/davinci_vpfe/dm365_isif.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/davinci_vpfe/dm365_isif.c b/drivers/staging/media/davinci_vpfe/dm365_isif.c
> index 46fd818..e9c8de1 100644
> --- a/drivers/staging/media/davinci_vpfe/dm365_isif.c
> +++ b/drivers/staging/media/davinci_vpfe/dm365_isif.c
> @@ -532,7 +532,8 @@ static int isif_validate_dfc_params(const struct vpfe_isif_dfc *dfc)
>  #define DM365_ISIF_MAX_CLVSV			0x1fff
>  #define DM365_ISIF_MAX_HEIGHT_BLACK_REGION	0x1fff
>  
> -static int isif_validate_bclamp_params(const struct vpfe_isif_black_clamp *bclamp)
> +static int
> +isif_validate_bclamp_params(const struct vpfe_isif_black_clamp *bclamp)
>  {
>  	int err = -EINVAL;
>  
> @@ -593,7 +594,8 @@ isif_validate_raw_params(const struct vpfe_isif_raw_config *params)
>  	return isif_validate_bclamp_params(&params->bclamp);
>  }
>  
> -static int isif_set_params(struct v4l2_subdev *sd, const struct vpfe_isif_raw_config *params)
> +static int isif_set_params(struct v4l2_subdev *sd,
> +			   const struct vpfe_isif_raw_config *params)
>  {
>  	struct vpfe_isif_device *isif = v4l2_get_subdevdata(sd);
>  	int ret = -EINVAL;


When you resend a patch with some modifications you have done after
receiving some feedback, don't forget to increase the version of your
patch . One can do this by adding the `-v2` flag at `git format-patch`
command. It is also a good practice to changelog what modifications you
did bellow the `---` mark.

Have a look at this v3[1]. And please read "Revising your patches"[2]
for a complete documentation.

Good hacking!
    André

[1] https://patchwork.kernel.org/patch/10999271/
[2] https://kernelnewbies.org/FirstKernelPatch

