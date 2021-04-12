Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE56A35C193
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 11:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239624AbhDLJbe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:31:34 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:58697 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242406AbhDLJ2c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:28:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VsrZl4iYLMxedVsrclcZyt; Mon, 12 Apr 2021 11:28:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618219693; bh=jIMXCtoK3i1fFvTqs9cxe9PYvmJVWGMSAAt45XYQ4aU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hFOE3g4kmzXQzO+x7fhSTpmRmmCXF6vsFwlWJqtPDZbiG9ez4wijNCzDrKn0DFdg5
         1L/a8zgxv8kSXRj8650Gr/Urqv8BZbxSzdveybSMYQNP3pwRKLxcLMaRi76UCn+p4a
         544xSfuq0cEZkIDlX4onLbmbwYvieMiIfYVS/X9bP6As8aOcJazzSwVdkzyHYMEipc
         pYx8qsKZhFDeVDD3WlT6j+q4Rxeh5CGQtm94eiUha5NMNzzJ1GWqMWtyvUoIcz3LU9
         uybNOUKiRVtvbNOLH76tD1sIKGG+UYPTVsmSc1QPumWRA8u6JC5RMalUv2CVP/emH/
         lKJ06PMEKepOg==
Subject: Re: [PATCH] staging: media: atomisp: Removed a function entry log
To:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20210412023558.360103-1-vrzh@vrzh.net>
 <20210412023558.360103-3-vrzh@vrzh.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e523c55b-9e5b-bbd1-73e8-a6c8dcd832f7@xs4all.nl>
Date:   Mon, 12 Apr 2021 11:28:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412023558.360103-3-vrzh@vrzh.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHD6S4mDk0zHdpqUOGdPIk9IEDfWsA3/MtJdLAypttASFr100ER6wZwasjrAFjwtqqZItq/moNcXYeuLi/DDrgpOqe1xA2TEDdK/PIk/NC58X5LQ5ub3
 9YI5ozN+mRtPyHflj5INtvUeAgVWylltv9wdqHv2scMuf4po98UEorsRlQVuAo21GbTRnjajLZpH/R9wSP8mYXONBfOZvFnVqCPJa4NDSNY+eq72AhsjdV6N
 PcaRBYk4dRj66B/l0Z2CGApETOGr1KnQ9na6t4z+i7u5QqU+Xo8c/8QqtxcT1YOp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/04/2021 04:35, Martiros Shakhzadyan wrote:
> Coding style fix.

What exactly is the coding style issue? Please mention that.

Also, by removing the line you change the behavior (i.e. if debugging is
enabled, you no longer see this message). That's more than a coding style
fix...

Regards,

	Hans

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

