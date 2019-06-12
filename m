Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51DDF42161
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 11:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437654AbfFLJuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 05:50:20 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45592 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437364AbfFLJuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 05:50:20 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so16127128wre.12
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2019 02:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=ZJsTW+O05AROy+G1apR5WOZNSvDTqWHYGjlS075tzxY=;
        b=eizuwhiWUV3n6xSdHxd58HiKve+9u6jUiT/ljZXK5s3j/Ex/t6ffqk451rstA8sSd9
         o6UbfiQYP9wNyOBKN6anmcqEj3HmZ6RKxgLeSc2HFHg5rQMeMvZpy3Ul75NirVMZOe5j
         wk2PHVD2dzfIb1h5gols1sqIVsDDy1RhsKnh7PZCkoEqQC7oJgllo6Z4Kj5oNXPIwS/a
         4Ydwu5P1bbWc+/HD+X3pQl44TGbjFU55kGwlDzHbKpUdTxrjonLtQxQpzQe4salCr3KK
         6Gyf05YfxbLo5I9AlqHxCmX0SQDpq0QZxGHlic+lt/7WBI1PHuL+6MNd4k0IpXa9EZQ3
         YrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=ZJsTW+O05AROy+G1apR5WOZNSvDTqWHYGjlS075tzxY=;
        b=P7p5UNKdsndMiqm0xpGiyVPBoyzr/Gz74vcznqx8HxGHK6AtZvw0tZvZ2FIU82KFDI
         Pc44icJCZjfd2DBCtInfZ5XpPJ3GmRZhI+i6q1qDgNAsFd+fiET81WitpgMIyylHNEfI
         Egk0mBfGVBIE1086HgcO/YgAlI0pBu4+HTC80K2IVfuHJG7ycMwJkEuaVqLaRND9Dguv
         0SjCPVKSGJXF+jd23pAhVxOn3V0AsNQQuIFyqNEl1Y8qGPPEQXKDyd+61brcrd3vCIvd
         BSn0MdMu3d+RM48wpjCnSxNl15r8bKCeLhhefhfs1YBWdZcG50TVllr7Cf2xBP7HaGl6
         +r0g==
X-Gm-Message-State: APjAAAUpZz4WlUDt0zdjzAhbTH8Z+SM/O2/rd6nMfotF2xhgABQlk002
        /vJ9voCSOnurs8yUsxp3BbqKv84hrHs=
X-Google-Smtp-Source: APXvYqwstYueRUQK30b7+nKYXI4lqIsUtJkY3tMf0xUd4VogyyisAy9gS+ENqOj4a4S+hj2He2lugA==
X-Received: by 2002:adf:cf0e:: with SMTP id o14mr888526wrj.250.1560333018158;
        Wed, 12 Jun 2019 02:50:18 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id s188sm7698462wmf.40.2019.06.12.02.50.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 02:50:17 -0700 (PDT)
References: <20190611150955.8038-1-rui.silva@linaro.org> <20190612074319.GE1915@kadam>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     driverdev-devel@linuxdriverproject.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, devel@driverdev.osuosl.org,
        Sebastien Szymanski <sebastien.szymanski@armadeus.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: imx7-media-csi: get csi upstream endpoint
In-reply-to: <20190612074319.GE1915@kadam>
Date:   Wed, 12 Jun 2019 10:50:09 +0100
Message-ID: <m31rzzp1ym.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,
On Wed 12 Jun 2019 at 08:43, Dan Carpenter wrote:
> On Tue, Jun 11, 2019 at 04:09:55PM +0100, Rui Miguel Silva wrote:
>> When the upstream endpoint is neither a mux nor a CSI2 module, just get
>> the source pad directly upstream from the CSI.
>>
>> Fixes: 05f634040c0d ("media: staging/imx7: add imx7 CSI subdev driver")
>> Reported-by: Sebastien Szymanski <sebastien.szymanski@armadeus.com>
>> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>> ---
>>  drivers/staging/media/imx/imx7-media-csi.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
>> index 9101566f3f67..8979ee0c8202 100644
>> --- a/drivers/staging/media/imx/imx7-media-csi.c
>> +++ b/drivers/staging/media/imx/imx7-media-csi.c
>> @@ -442,6 +442,14 @@ static int imx7_csi_get_upstream_endpoint(struct imx7_csi *csi,
>>
>>  	src = &csi->src_sd->entity;
>>
>> +	/*
>> +	 * if the source in neither a mux or csi2 get the one directly upstream
>                          ^^
> is?

yup.

>
>> +	 * from this csi
>> +	 */
>> +	if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
>> +		src->function != MEDIA_ENT_F_VID_MUX)
>> +		src = &csi->sd.entity;
>
> This would be easier to read if the white space were tweaked a little:
>
> 	if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
> 	    src->function != MEDIA_ENT_F_VID_MUX)
> 		src = &csi->sd.entity;

Agreed, Thanks for the feedback.

---
Cheers,
	Rui

