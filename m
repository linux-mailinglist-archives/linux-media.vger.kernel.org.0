Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8898F35E1BC
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 16:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343607AbhDMOl2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 10:41:28 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:51147 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343561AbhDMOl1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 10:41:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WKDulFZNhMxedWKDxlj1ke; Tue, 13 Apr 2021 16:41:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618324866; bh=74hmlOqxJVAplFkW4sQYIcBkrauVYMNATTRiGar5X8g=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Y4mMz6Jn5/WuZzKqu9LFgrM/iEjDUlyp1SaOA5wvuUWRExMM2RWUeVhNWswi8xfBZ
         HFQnUA0O6HMtQP7A+3S1tFUIFjk55Y+HMPfuUVWkzlJYNSfFIM2gcy3rldJfhtxaUG
         IjQ1cWBGSZP7Q2jxmyyQUeGlc6Rmu4FXZDGyowBpnuJ6wS/O3ZW7tR3vbzBoJQ0XTX
         RtKwghekgD3TkbiXxGlDAfCxSxxYleqFM5vYWYtRdZ5gHCdgtakC78pK0oIr8i7WFF
         +94KpfG52QSergrE4Q9OTd0TcXEgYGtZW6tpgVa7GO/Iqxvk+gjRVA2kajEMMdgcwb
         KF1g7Q8LUGpUg==
Subject: Re: [PATCH] staging: media: atomisp: Minor code style changes
To:     Martiros Shakhzadyan <vrzh@vrzh.net>, mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, jacopo@jmondi.org,
        linux-media@vger.kernel.org
References: <20210412160203.6925-1-vrzh@vrzh.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <eda1c459-f654-e9f4-5738-5d611f267a9e@xs4all.nl>
Date:   Tue, 13 Apr 2021 16:41:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412160203.6925-1-vrzh@vrzh.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfO3K8+L9Btu8C1jYW9k0Owcubp8qR1SkqLvO2xstEeH7DEOmpPc86Yk7rcoL3/fngwU+B69OKpQCHxmKvxYFiqsrQsZk0rs8WzeJjTxScqCXG0IpmL65
 /12+9uRwH+M3i41ERsQE9k6XNAQm2jT+TSZMM4UtkJzjH4NVbgggPHM/Jh5fOVo8EyIkzd9xJgg4JIQONoA+OpbkKikM1nDFIAtk1pb1O8cFKkMsqMgqwfmX
 DqLWYDxOEFcs/CR0v1Hqn48vHpqwhB8ej3pWBNoqN8LfNWS6DPQXhzQ9DsYLTqix3Yn+BJRhdiO+PNy9wLAV+w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please repost with a '[PATCHv3]' in the subject.

This version should have been '[PATCHv2]', but you forgot the v2 part :-)

It's important, since now I had no indication that the previous patch was superseded
and I tried to apply both, thus discovering that the older one should have been skipped.

Regards,

	Hans

On 12/04/2021 18:02, Martiros Shakhzadyan wrote:
> Fixed line continuation and parenthesis alignment issues.
> 
> Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index 912eadaffc44..90a985ee25fa 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -49,8 +49,8 @@ static int ov2722_read_reg(struct i2c_client *client,
>  		return -ENODEV;
>  	}
>  
> -	if (data_length != OV2722_8BIT && data_length != OV2722_16BIT
> -	    && data_length != OV2722_32BIT) {
> +	if (data_length != OV2722_8BIT && data_length != OV2722_16BIT &&
> +	    data_length != OV2722_32BIT) {
>  		dev_err(&client->dev, "%s error, invalid data length\n",
>  			__func__);
>  		return -EINVAL;
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

