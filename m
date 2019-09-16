Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 394DBB4117
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 21:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391019AbfIPTYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 15:24:35 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:29106 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388188AbfIPTYf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 15:24:35 -0400
Received: from [192.168.1.41] ([90.126.97.183])
        by mwinf5d90 with ME
        id 2KQU210063xPcdm03KQWVm; Mon, 16 Sep 2019 21:24:33 +0200
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 16 Sep 2019 21:24:33 +0200
X-ME-IP: 90.126.97.183
Subject: Re: [PATCH] media: v4l: cadence: Fix how unsued lanes are handled in
 'csi2rx_start()'
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Maxime Ripard <mripard@kernel.org>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20190912204450.17625-1-christophe.jaillet@wanadoo.fr>
 <20190913075709.t35ggip624tybd6l@localhost.localdomain>
 <20190916062846.GD18977@kadam>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <f67787da-dc1c-3e05-c1e2-e8737641dfd0@wanadoo.fr>
Date:   Mon, 16 Sep 2019 21:24:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190916062846.GD18977@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le 16/09/2019 à 08:28, Dan Carpenter a écrit :
> On Fri, Sep 13, 2019 at 09:57:09AM +0200, Maxime Ripard wrote:
>> Hi Christophe,
>>
>> On Thu, Sep 12, 2019 at 10:44:50PM +0200, Christophe JAILLET wrote:
>>> The 2nd parameter of 'find_first_zero_bit()' is a number of bits, not of
>>> bytes. So use 'BITS_PER_LONG' instead of 'sizeof(lanes_used)'.
>>>
>>> Fixes: 1fc3b37f34f6 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>> ---
>>> This patch is purely speculative. Using BITS_PER_LONG looks logical to me,
>>> but I'm not 100% sure that it is what is expected here. 'csi2rx->max_lanes'
>>> could also be a good candidate.
>> Yeah, csi2rx->max_lanes would make more sense in that context. Could
>> you resend a new version?
> This is sort of unrelated, but for Smatch purposes the csi2rx->max_lanes
> comes from the firmware in csi2rx_parse_dt() and it could be any u8
> value.

Hi Dan,

not sure to follow you.

csi2rx_probe()
   --> csi2rx_get_resources()
      -->  ...
           dev_cfg = readl(csi2rx->base + CSI2RX_DEVICE_CFG_REG);
           ...
           csi2rx->max_lanes = dev_cfg & 7;
           if (csi2rx->max_lanes > CSI2RX_LANES_MAX) {
              dev_err(&pdev->dev, "Invalid number of lanes: %u\n",
                      csi2rx->max_lanes);
              return -EINVAL;
           }

So I guess, that we can trust max_lanes because of the 'if (... > 
CSI2RX_LANES_MAX)' check.

Did I miss something?


> I sort of wish that people would write code which was known to be
> correct just from reading the kernel code, without looking at the
> firmware...  I guess I could mark v4l2_fwnode_endpoint_parse() as always
> giving us valid data, but that still wouldn't tell us what the valid
> data is.  It's hard to know the right answer from a static analysis
> point of view.
>
> regards,
> dan carpenter
>
>

