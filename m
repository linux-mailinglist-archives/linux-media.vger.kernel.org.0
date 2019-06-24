Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23FA151BE2
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 22:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731307AbfFXUDQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 16:03:16 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:37884 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731301AbfFXUDQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 16:03:16 -0400
Received: from belgarion ([86.210.207.101])
        by mwinf5d57 with ME
        id Uk3C2000K2BnxPa03k3CLv; Mon, 24 Jun 2019 22:03:14 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Mon, 24 Jun 2019 22:03:14 +0200
X-ME-IP: 86.210.207.101
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mt9m111: fix fw-node refactoring
References: <20190603200155.24358-1-robert.jarzmik@free.fr>
        <20190620101717.7h2hczachuk2rjr6@valkosipuli.retiisi.org.uk>
        <20190620123509.7pssbcqjqcnh3kmc@valkosipuli.retiisi.org.uk>
X-URL:  http://belgarath.falguerolles.org/
Date:   Mon, 24 Jun 2019 22:03:12 +0200
In-Reply-To: <20190620123509.7pssbcqjqcnh3kmc@valkosipuli.retiisi.org.uk>
        (Sakari Ailus's message of "Thu, 20 Jun 2019 15:35:09 +0300")
Message-ID: <8736jyycn3.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari Ailus <sakari.ailus@iki.fi> writes:

> On Thu, Jun 20, 2019 at 01:17:17PM +0300, Sakari Ailus wrote:
>> diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
>> index bd3a51c3b081..9761a6105407 100644
>> --- a/drivers/media/i2c/mt9m111.c
>> +++ b/drivers/media/i2c/mt9m111.c
>> @@ -1263,9 +1263,11 @@ static int mt9m111_probe(struct i2c_client *client,
>>  	if (!mt9m111)
>>  		return -ENOMEM;
>>  
>> -	ret = mt9m111_probe_fw(client, mt9m111);
>> -	if (ret)
>> -		return ret;
>> +	if (dev_fwnode(client->dev)) {
>
> &client->dev
>
>> +		ret = mt9m111_probe_fw(client, mt9m111);
>> +		if (ret)
>> +			return ret;
>> +	}
>>  
>>  	mt9m111->clk = v4l2_clk_get(&client->dev, "mclk");
>>  	if (IS_ERR(mt9m111->clk))

Sure, you can take the patch as yours, or sign off my modified patch, whatever
pleases you.

Cheers.

-- 
Robert
