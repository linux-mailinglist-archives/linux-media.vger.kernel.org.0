Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9D2517A2E4
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2020 11:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgCEKN0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Mar 2020 05:13:26 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:55871 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725816AbgCEKN0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Mar 2020 05:13:26 -0500
Received: from [IPv6:2001:983:e9a7:1:7c2d:3b2e:4be4:20a2]
 ([IPv6:2001:983:e9a7:1:7c2d:3b2e:4be4:20a2])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 9nVKjhfeq9Im29nVLj7p3K; Thu, 05 Mar 2020 11:13:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583403203; bh=Kgnd3zToKuRBUxYCpM+7FQ2spzn0XiARVXXCsNiNcw0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=C89R36ZOdYOrsnfSksnjWTDu12oq6e1S4Z2cYzqEjLrZRu4AAKI+eClThy4RS7jOI
         CLk3DsvFnfGb2wtoGDmVwLPyEHOcIcAJK56LS3aHhdTQuWY4uxjwRQ+3NA06VL7Y0C
         kYrhD5dH7riepKJwdQLilDkC4ODcrHP8rblHr8AsQpmC+PEKoesiZMF4rKpqOagFdb
         WYi6GiDznvQU7ZebKg35fpMmGRCtbnyfCA9y6x0epsIOvZyFfWwl7UrC9iIoDl1VB3
         FyJ0kiiCkMGNCdpz+Q6YQyOmmLI56db68dYH++ivVm9FumQbHNNHzZDgQQj0eYXCD0
         YsZ1VzVFrEcng==
Subject: Re: [PATCH] media: adv7604: Add new predefined video timings for
 adv76xx
To:     Beniamin Bia <beniamin.bia@analog.com>, linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, linux-kernel@vger.kernel.org,
        dragos.bogdan@analog.com, biabeniamin@outlook.com,
        alexandru.ardelean@analog.com
References: <20200305085908.26267-1-beniamin.bia@analog.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <edc7dadf-b05a-df8e-82a9-87c4ade3f412@xs4all.nl>
Date:   Thu, 5 Mar 2020 11:13:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305085908.26267-1-beniamin.bia@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCPpn8IpkKWh05S5KK73CAnv0075A29Y0fVXYg/zkT1rjsH+nBTrwM+1UfrdZ048LvK85HGUUaqIUtguC2ZeiPwc54RF1TQm8GtrJthMJQ3o21ZlW6E4
 AtIf/+fkkGlZwvC1zeDsZBiBCnU4ITv3LL5a1zueGqv8danYnBrz3FBHL3a/U8D7SZRBzsKstdWPE5Y8FaBOkdfYGC0uh7IZDYDhb/uvnZGJQYOMoTRVyY1V
 VjYj87uXZX/XfoZquSu8AhVIlEO+yWrF5sDvKIM+fhN8OnGw4R+jUiwdC8iwOdjrgG0dv29S499MImu1E4peiK5MBJgbZVcGr+dufdI3nNRGuzK1FNu/ErLV
 Vy9XKkRomUotfREVuOT0l70TOz2/PCoZCs/IBOTRDqylvpLQNrSGB0nepAGQjMptDO2ATFzPTT2lE8GL2ujhgNdBWRTntLZY493jLCVJK4McQqbybH9KG+5n
 1h4swGxtro3NTXa7DUECl3VDumKr47di4t5CHg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/03/2020 09:59, Beniamin Bia wrote:
> This patch adds more predefined video timings for adv76xx family.
> 
> Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
> Signed-off-by: Dragos Bogdan <dragos.bogdan@analog.com>
> ---
>  drivers/media/i2c/adv7604.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
> index 2dedd6ebb236..bf16c7a626a9 100644
> --- a/drivers/media/i2c/adv7604.c
> +++ b/drivers/media/i2c/adv7604.c
> @@ -280,6 +280,8 @@ static const struct adv76xx_video_standards adv7604_prim_mode_gr[] = {
>  static const struct adv76xx_video_standards adv76xx_prim_mode_hdmi_comp[] = {
>  	{ V4L2_DV_BT_CEA_720X480P59_94, 0x0a, 0x00 },
>  	{ V4L2_DV_BT_CEA_720X576P50, 0x0b, 0x00 },
> +	{ V4L2_DV_BT_CEA_1280X720P25, 0x13, 0x03 },
> +	{ V4L2_DV_BT_CEA_1280X720P24, 0x13, 0x04 },

Are these two tested? V4L2_DV_BT_CEA_1280X720P25 in particular has an
extremely high horizontal frontporch (2420) that not all receivers can
handle.

Looking at this line:

             bt->hfrontporch = (hdmi_read(sd, 0x20) & 0x03) * 256 +
                        hdmi_read(sd, 0x21);

I'd say that the adv7604 can't handle any timings with a hfrontporch > 1023.

Regards,

	Hans

>  	{ V4L2_DV_BT_CEA_1280X720P50, 0x13, 0x01 },
>  	{ V4L2_DV_BT_CEA_1280X720P60, 0x13, 0x00 },
>  	{ V4L2_DV_BT_CEA_1920X1080P24, 0x1e, 0x04 },
> @@ -305,8 +307,17 @@ static const struct adv76xx_video_standards adv76xx_prim_mode_hdmi_gr[] = {
>  	{ V4L2_DV_BT_DMT_1024X768P70, 0x0d, 0x00 },
>  	{ V4L2_DV_BT_DMT_1024X768P75, 0x0e, 0x00 },
>  	{ V4L2_DV_BT_DMT_1024X768P85, 0x0f, 0x00 },
> +	{ V4L2_DV_BT_DMT_1280X768P60, 0x10, 0x00 },
> +	{ V4L2_DV_BT_DMT_1280X768P60_RB, 0x11, 0x00 },
>  	{ V4L2_DV_BT_DMT_1280X1024P60, 0x05, 0x00 },
>  	{ V4L2_DV_BT_DMT_1280X1024P75, 0x06, 0x00 },
> +	{ V4L2_DV_BT_DMT_1360X768P60, 0x12, 0x00 },
> +	{ V4L2_DV_BT_DMT_1366X768P60, 0x13, 0x00 },
> +	{ V4L2_DV_BT_DMT_1400X1050P60, 0x14, 0x00 },
> +	{ V4L2_DV_BT_DMT_1400X1050P75, 0x15, 0x00 },
> +	{ V4L2_DV_BT_DMT_1600X1200P60, 0x16, 0x00 },
> +	{ V4L2_DV_BT_DMT_1680X1050P60, 0x18, 0x00 },
> +	{ V4L2_DV_BT_DMT_1920X1200P60_RB, 0x19, 0x00 },
>  	{ },
>  };
>  
> 

