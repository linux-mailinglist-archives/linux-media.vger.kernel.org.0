Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C001026DABE
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 13:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgIQLux (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 07:50:53 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:60721 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726758AbgIQL1b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 07:27:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Is3qkM7BCPTBMIs3tkllRF; Thu, 17 Sep 2020 13:26:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600342013; bh=f4uU11TplcltXscEBKpGneN6cvdGllExJEW1PbYfP6g=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PO4byAB7mXg96eKklNbeMqFiF+BXBc5YfTTlVc34KfLZHUhHIdhk+2OAnHtkEuX4s
         udqIK2fjqR9DNscCBDRsOo71erq+iM2tL7gvVtTW8NCrv5kGCuf9cTR+pMaWsydw+P
         KJa91bdZ/3EfVpo4bIiLV1btI0FDu4z0T6+tkxH2nGgc9rESJqZykSO1ir1U/dXmwd
         uL1r82b8N+8DnwdYSjtZPvTkaYmW2RRYaPRbgWiucXoZdJhXTmPG9nEkw9Mznd2phR
         oKLdROxKAKTWaP+OIQk8xd1pnX+qFRyiWFrtFBlzW66cdIEzioobVjz4/nju3D0WHM
         K2IQNdTZotokw==
Subject: Re: [PATCH] media: platform: s3c-camif: Fix runtime PM imbalance in
 s3c_camif_open
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200522082915.4731-1-dinghao.liu@zju.edu.cn>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <611ffe6a-c4ef-d23c-4d3f-a7771ce56bab@xs4all.nl>
Date:   Thu, 17 Sep 2020 13:26:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200522082915.4731-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfL73kWQRYSxDnh7SSlpi0XbenrsCQooROgHQTF9H+9opAp/kiXPa03L40yxbRGKjEKAyts40RsDxNxFPgFMbFeOAucSwIlQNk8rABAWrBuF33e87p95c
 Jj1mPqoof52toqHmpCr81RE5NVbyjq3V5o6Ug4AJ5f+t0rLTcpDsuwpYDv6vbGComj7YuSI5zLtUGH6yDPzYlEL4uI+J1Xi5ViqDM0DuErKgc5O0PCV6lnRA
 GIXRoJOLpHq5BDgzGISwDNZ2ooNBT4vFVB0hITD/XuvrUPOlAUi0nLPAfoXZY1vsc2VveR//TIgCmhyd6C2urtuzi2p6bosqV7KtXBy/y/wG8MZP2lHCz94l
 r+0sXa/LTPGq4prFv6W/A6tCPeQ/LeiAShbNKJn/eMrIyq4JNRryFqfyAtaP+oemw9Lhl2HZi0KHG5+dISZWnQUdHvENSTbX+YYLnVjOcM4l4DXAXJ/oGUVj
 KW+oYee3kH7nbcS27DEWCSDXsZ9QH5us9TmrIg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/05/2020 10:29, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
> 
> Also, call pm_runtime_put() and v4l2_fh_release() when sensor_set_power()
> returns an error code.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/media/platform/s3c-camif/camif-capture.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
> index 9ca49af29542..d42d9cfaf674 100644
> --- a/drivers/media/platform/s3c-camif/camif-capture.c
> +++ b/drivers/media/platform/s3c-camif/camif-capture.c
> @@ -552,11 +552,9 @@ static int s3c_camif_open(struct file *file)
>  		goto err_pm;
>  
>  	ret = sensor_set_power(camif, 1);
> -	if (!ret)
> -		goto unlock;

This is wrong, now this will call v4l2_fh_release() as well on success.

This needs to be reworked.

Regards,

	Hans

>  
> -	pm_runtime_put(camif->dev);
>  err_pm:
> +	pm_runtime_put(camif->dev);
>  	v4l2_fh_release(file);
>  unlock:
>  	mutex_unlock(&camif->lock);
> 

