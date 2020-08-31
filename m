Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977E7258308
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 22:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbgHaUyg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 16:54:36 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:15127 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgHaUyf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 16:54:35 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4d635d0001>; Mon, 31 Aug 2020 13:53:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 31 Aug 2020 13:54:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 31 Aug 2020 13:54:35 -0700
Received: from [10.2.173.243] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 31 Aug
 2020 20:54:34 +0000
Subject: Re: [PATCH v4 4/4] media: i2c: imx274: Add IMX274 power on and off
 sequence
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <hverkuil@xs4all.nl>, <luca@lucaceresoli.net>,
        <leonl@leopardimaging.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1598903558-9691-1-git-send-email-skomatineni@nvidia.com>
 <1598903558-9691-5-git-send-email-skomatineni@nvidia.com>
 <20200831202350.GD844@valkosipuli.retiisi.org.uk>
 <b4db7b37-a0d7-9324-c47a-53ad22b8c444@nvidia.com>
 <20200831204833.GG844@valkosipuli.retiisi.org.uk>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <81747729-bd4c-adc5-5cac-608fd662e4fe@nvidia.com>
Date:   Mon, 31 Aug 2020 13:54:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200831204833.GG844@valkosipuli.retiisi.org.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598907229; bh=p093iRGVPrUZ61UL4Pe0s/usKPXOncq6QObAg+7Va9w=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=R4yPx7WbKPqfnloYwYy/SRObCTkyvJxGvM/13QfZ7STap7LIGJpzgK3ynVD+HSUjA
         gFocUq2q+tJOYgI0TeMPQD1puFn5tGSdA7r8fgo6ivZJkt0FGNoeHXkjaoeR7WpnyO
         JoWNQA0iJ7BqJ582R84QAGaUHbiuz21Go+fgi68Q5s36mu+L4IFdRZsBQu/tb6yac1
         uqsMa0jxLgMlaNkFjxE1+nQoMjTgi+r64JxgaxlAXk9L1D0FHAZhY6+WxV+CiXNhXP
         1bNEXgAnJgU5OvazrtOCp5TUjbz9x5cjKxXzVtbDwuE2UkNd3FP2itF+SGwy+M3GWJ
         CQ4mmPsXHZj7g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/31/20 1:48 PM, Sakari Ailus wrote:
> On Mon, Aug 31, 2020 at 01:46:00PM -0700, Sowjanya Komatineni wrote:
>> On 8/31/20 1:23 PM, Sakari Ailus wrote:
>>>> @@ -1968,19 +2087,45 @@ static int imx274_remove(struct i2c_client *client)
>>>>    	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>>>>    	struct stimx274 *imx274 = to_imx274(sd);
>>>> +	pm_runtime_get_sync(&imx274->client->dev);
>>>> +
>>>>    	/* stop stream */
>>> This really shouldn't happen and the driver isn't expected to handle it
>>> either.
>> Do you mean to remove stop stream during remove()?
>>
>> Stop stream is not part of this change and as writes to sensor can't happen
>> when power off, added pm_runtime_get_sync
> Indeed.
>
> But there certainly isn't a need to power the sensor on to stream off, is
> there?

yeah not required. Will remove get_sync.

Will remove imx274 stop stream during remove() as separate patch as it 
was not introduced in this.

>>>>    	imx274_write_table(imx274, imx274_stop);
>>>>    	v4l2_async_unregister_subdev(sd);
>>>>    	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
>>>> +
>>>> +	pm_runtime_put(&client->dev);
>>>> +	pm_runtime_disable(&client->dev);
>>>> +	pm_runtime_set_suspended(&client->dev);
>>>> +
>>>>    	media_entity_cleanup(&sd->entity);
>>>>    	mutex_destroy(&imx274->lock);
>>>>    	return 0;
>>>>    }
