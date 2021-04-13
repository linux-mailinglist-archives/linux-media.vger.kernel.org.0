Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7243035E1DD
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 16:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhDMOvn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 10:51:43 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:46097 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229721AbhDMOvm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 10:51:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WKNqlFdXzMxedWKNtlj4YL; Tue, 13 Apr 2021 16:51:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618325482; bh=Aw5lXwZyN6zUOkRQqhMZ7fpzBmLrAbcr5XjdvQMQGZs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PXb8pCp47b8F+pJo0HiiWJL2cj86zwa+oJYkVKuFmu0jY5t6UYLnk4HfTgB+1EToE
         79hzG/clvx5yAcWbL1255BSdxciS8U4tC06lNyP6TyMFaLCnax5r82gCiV9ONctopF
         RedLkeSsT4Mf42oWxh/epGDA9sQF/te9XUwaAtIjGNc7B9Bw6DMmE8u5pDDLoOy8bb
         ySLoav3TSXtUMABV64RE2M/5Xah051UGdLASmpGbpo7jlycYhCXn5ki3bPvKaOxgPD
         OeBLnH2+HWah8YxCWGmCECG1p4vmevEaO7zCnw2MHouJdwegGLllP9swRaMKRpkg2T
         gRcHRu+SiCifQ==
Subject: Re: [PATCH] staging: media: atomisp: Removed a function entry log
To:     Martiros Shakhzadyan <vrzh@vrzh.net>, mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
References: <20210412155959.6647-1-vrzh@vrzh.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <50b6775f-f6cf-afd2-9a52-c30d02b89832@xs4all.nl>
Date:   Tue, 13 Apr 2021 16:51:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412155959.6647-1-vrzh@vrzh.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMKvdxsBzI5bs1GvD9v4ZgjyPHHkFcJ+0q2bkK/WPVFLVP4AXlvnmzmX3/zkFoJ4ivinb4izY4edAvlEbdo7rg3vB5xYAmXyAmiTQBomf+5O1/vMRrC8
 /Wc2rgtK/Pxul732ZmtXRkEmvOAR14pgLUFnSjsWYYzqn6mmiK578XySYg8sUHB57oAfg05ZkVxxh8KNU6k/TNZ1CJ0EH1qMMbZr/Z1gc5dSbye9zCDDMo9u
 Ic1zsFzQ2qy07MftHkGWo1HLOhB4rdhKralZ0TzMsvVzE3341n9yuy90gvamQicP
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/04/2021 17:59, Martiros Shakhzadyan wrote:
> Removed a function entry log in ov2722_remove, as ftrace is a preferred
> method for function entry/exit tracing.

It turns out that someone else already made the same fix [1], so marking
this patch as obsolete.

There are quite a few atomisp patches pending for 5.13, so it might be
a good idea to checkout the media subsystem master tree since that is
more recent than mainline.

https://git.linuxtv.org/media_tree.git/

Regards,

	Hans

[1]:
https://patchwork.linuxtv.org/project/linux-media/patch/20210106181158.2270-1-fil.kolev@gmail.com/

> 
> Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index c017e9066b7a..912eadaffc44 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -1175,8 +1175,6 @@ static int ov2722_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct ov2722_device *dev = to_ov2722_sensor(sd);
>  
> -	dev_dbg(&client->dev, "ov2722_remove...\n");
> -
>  	dev->platform_data->csi_cfg(sd, 0);
>  	v4l2_ctrl_handler_free(&dev->ctrl_handler);
>  	v4l2_device_unregister_subdev(sd);
> 

