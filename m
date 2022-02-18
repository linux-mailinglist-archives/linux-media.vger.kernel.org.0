Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3A04BBA1C
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 14:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbiBRN1w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Feb 2022 08:27:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiBRN1v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Feb 2022 08:27:51 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9D31216BB
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 05:27:34 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id x5so9753268wrg.13
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 05:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8pNtWT1F5TzmEkDArBHSf7GFUxFabKaRsA2UdZtl6Jo=;
        b=NUjBYFbe3P6+Ohk3l3kahdTBLm+sltAfbGjdC+pshtdWVlN8wQi6lAvs6DNcBkPXWT
         WN0pvqIhb7sdchvMLY7clY7nZNGX304Wi2Z+XvtfKDYlTkWLJAgp/mUlibrdqr2DfiHx
         XIJZU6yn/sLem9IXBxD8xUbpeGl5KJCffHjuOSAfo6m7Q0fKhDTgDLXGI+lBn13MBKg/
         4FB7+0rf3CiJfnfyk5ep63aJ81gIUSVzClS8nLASJiqNirc50lD5C0bY0FiaMu5/0HLH
         VAFJmpit+++FPl1YU7RUdoHZt3/mHZYwiJu0Dzq35e0D+vSFkGgYyDhOQWIhzp9cYrCW
         DjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8pNtWT1F5TzmEkDArBHSf7GFUxFabKaRsA2UdZtl6Jo=;
        b=OSFC/P+T4hvdYpggpF5LplRfl+GXUhQ9tLQEBYLI9fHDBsrXtU1gT3aGaZ5+lwSduF
         ktFoB2sxZtE+ky3HLDjC84ORmP9KGjBQNWI6J5ZqEh5TR53fJMZGUe07OqZPIHroHt8q
         9E83rGDPM31AsfWe2ktz0tQ2ZTsXyryWpoX16LSHuDdWHjGBws9IXwMBbx334SJOszNX
         CcVkJmX11icrX38GtFCq60mTVK7JFsgcZ8GznMWZCujn+6fI5I1ztGQjhOOhmMbUd3v7
         8eLo3ZFVPfs47cvy9tgRvT4MTcCkczwykzKiI+5sxnfYtwbVK8juOBq0F3VxuWnhpV1g
         KvvA==
X-Gm-Message-State: AOAM531bQqa+eDqX6SBIBeBIS2uCn2ItSNO0wBnIzJVJ/jb4HE8GgOzT
        Lv06yK+bv4HZHVcEnt+h320=
X-Google-Smtp-Source: ABdhPJyKEDCKPM/9221r2aCdsPmx4l9HFV48O94tJ66oGvQQ5UL16w/xXYLTdns95kBzTHg5t/olkQ==
X-Received: by 2002:adf:ea4f:0:b0:1e7:447d:2111 with SMTP id j15-20020adfea4f000000b001e7447d2111mr6134059wrn.66.1645190853305;
        Fri, 18 Feb 2022 05:27:33 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w18sm24374857wrl.62.2022.02.18.05.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 05:27:32 -0800 (PST)
Message-ID: <ec4d3e07-8807-488a-150f-c9536969955d@gmail.com>
Date:   Fri, 18 Feb 2022 13:27:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/10] media: i2c: Provide ov7251_check_hwcfg()
Content-Language: en-US
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        yong.zhi@intel.com, Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, tian.shu.qiu@intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20220215230737.1870630-1-djrscally@gmail.com>
 <20220215230737.1870630-5-djrscally@gmail.com>
 <CAPY8ntAttHzaUNP6-8mn7CPkJV1JisO-_pSRwfogiMjWNt9oUA@mail.gmail.com>
 <732686a7-8bf7-07f0-7eef-dadf1bb6e99b@gmail.com>
 <CAPY8ntA5De4Twu5KkM7EDYix0JGzca_ma_Yz=we5TceMFO7UoQ@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <CAPY8ntA5De4Twu5KkM7EDYix0JGzca_ma_Yz=we5TceMFO7UoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 18/02/2022 11:58, Dave Stevenson wrote:
> Hi Daniel
>
> On Fri, 18 Feb 2022 at 08:37, Daniel Scally <djrscally@gmail.com> wrote:
>> Hi Dave
>>
>> On 17/02/2022 15:54, Dave Stevenson wrote:
>>> Hi Daniel
>>>
>>> On Tue, 15 Feb 2022 at 23:08, Daniel Scally <djrscally@gmail.com> wrote:
>>>> Move the endpoint checking from .probe() to a dedicated function,
>>>> and additionally check that the firmware provided link frequencies
>>>> are a match for those supported by the driver. Finally, return
>>>> -EPROBE_DEFER if the endpoint is not available, as it could be built
>>>> by the ipu3-cio2 driver if that probes later.
>>>>
>>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>>> ---
>>>>  drivers/media/i2c/ov7251.c | 84 ++++++++++++++++++++++++++++++--------
>>>>  1 file changed, 66 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
>>>> index d6fe574cb9e0..5c5f7a15a640 100644
>>>> --- a/drivers/media/i2c/ov7251.c
>>>> +++ b/drivers/media/i2c/ov7251.c
>>>> @@ -1255,10 +1255,73 @@ static const struct v4l2_subdev_ops ov7251_subdev_ops = {
>>>>         .pad = &ov7251_subdev_pad_ops,
>>>>  };
>>>>
>>>> +static int ov7251_check_hwcfg(struct ov7251 *ov7251)
>>>> +{
>>>> +       struct fwnode_handle *fwnode = dev_fwnode(ov7251->dev);
>>>> +       struct v4l2_fwnode_endpoint bus_cfg = {
>>>> +               .bus_type = V4L2_MBUS_CSI2_DPHY,
>>>> +       };
>>>> +       struct fwnode_handle *endpoint;
>>>> +       bool freq_found;
>>>> +       int i, j;
>>>> +       int ret;
>>>> +
>>>> +       endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
>>>> +       if (!endpoint)
>>>> +               return -EPROBE_DEFER; /* could be provided by cio2-bridge */
>>>> +
>>>> +       ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
>>>> +       fwnode_handle_put(endpoint);
>>>> +       if (ret)
>>>> +               return dev_err_probe(ov7251->dev, ret,
>>>> +                                    "parsing endpoint node failed\n");
>>>> +
>>>> +       if (bus_cfg.bus_type != V4L2_MBUS_CSI2_DPHY) {
>>>> +               ret = -EINVAL;
>>>> +               dev_err(ov7251->dev, "invalid bus type (%u), must be (%u)\n",
>>>> +                       bus_cfg.bus_type, V4L2_MBUS_CSI2_DPHY);
>>>> +               goto out_free_bus_cfg;
>>>> +       }
>>>> +
>>>> +       if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1) {
>>>> +               dev_err(ov7251->dev, "only a 1-lane CSI2 config is supported");
>>>> +               ret = -EINVAL;
>>>> +               goto out_free_bus_cfg;
>>>> +       }
>>>> +
>>>> +       if (!bus_cfg.nr_of_link_frequencies) {
>>>> +               dev_err(ov7251->dev, "no link frequencies defined\n");
>>>> +               ret = -EINVAL;
>>>> +               goto out_free_bus_cfg;
>>>> +       }
>>>> +
>>>> +       freq_found = false;
>>>> +       for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
>>>> +               if (freq_found)
>>>> +                       break;
>>>> +
>>>> +               for (j = 0; j < ARRAY_SIZE(link_freq); j++)
>>>> +                       if (bus_cfg.link_frequencies[i] == link_freq[j]) {
>>>> +                               freq_found = true;
>>>> +                               break;
>>>> +                       }
>>>> +       }
>>>> +
>>>> +       if (i == bus_cfg.nr_of_link_frequencies) {
>>> This doesn't work if there is only one link frequency defined in the
>>> config and it is valid.
>>>
>>> Loop i=0, freq_found gets set to true.
>>> Continue the outer loop.
>>> i++ , so i=1.
>>> i < bus_cfg.nr_of_link_frequencies is no longer true (both are 1), so
>>> we quit the outer loop.
>>> i == bus_cfg.nr_of_link_frequencies, so we now fail the function.
>>>
>>> Doesn't this last check want to be if (!freq_found) ?
>>>
>>> And/or amend the loop to move the "if (freq_found) break;" to the end,
>>> so that we break out of the outer loop as soon as we have a frequency
>>> found, and thereby avoid the i++.
>>
>> Ah, damn you're right. Sorry - I originally broke the double loop with a
>> goto and then decided at the last minute that it was too ugly so I
>> changed it. Thought I was careful enough there to not need to test it -
>> lesson learned.
> Been there, done that :-)


Hah hoping that this will sink in strongly for at least a little while!

>
>>> It all feels a little odd as there is only one link frequency used by
>>> all the modes, and we're not actually filtering the modes that can be
>>> selected based on the configured link frequencies should there be
>>> multiple frequencies in link_freq[].
>>
>> At present no, but I was thinking about adding one (the windows driver
>> for my platform uses a different link freq, and I'd like to support it)
>> - it'll just mean a different set of ov7251_pll_configs.
> OK, that seems reasonable.
>
> Someone recently asked about running ov7251 with libcamera on a Pi
> which was why I was testing your patches. I've a branch[1] that takes
> your patches and then adds the relevant controls to make it work -
> I'll send them once your current changes are merged to avoid
> conflicts.


Ah excellent, hadn't gotten as far as trying to run this through
libcamera yet, it's connected to an IPU3 for me so there's a bit more
work to do there first.

> I've removed the link freq per mode as generally all modes run at the
> same link freq, and there's really only one mode anyway. Is that valid
> for your alternate link freq? Does it alter the pixel rate as well, or
> just the CSI config? There's no point in removing options if you'll
> want them back again.


Can't tell what Windows does as I have no way of forcing it to change
the mode (in fact I can only make it turn on by starting Windows Hello
set up and then waving my head around like a lunatic so it doesn't
complete / fail out before I get the chance to read the registers) but
I'd expect to implement it as a static (I.E. not changing per mode)
pixel rate that depends on the selected link freq. I think it's fine to
drop both options from the mode struct


Cheers

Dan

>
> Cheers
>   Dave
>
> [1] https://github.com/6by9/linux/tree/rpi-5.15.y-cam
>
>
>>>   Dave
>>>
>>>> +               dev_err(ov7251->dev, "no supported link freq found\n");
>>>> +               ret = -EINVAL;
>>>> +               goto out_free_bus_cfg;
>>>> +       }
>>>> +
>>>> +out_free_bus_cfg:
>>>> +       v4l2_fwnode_endpoint_free(&bus_cfg);
>>>> +
>>>> +       return ret;
>>>> +}
>>>> +
>>>>  static int ov7251_probe(struct i2c_client *client)
>>>>  {
>>>>         struct device *dev = &client->dev;
>>>> -       struct fwnode_handle *endpoint;
>>>>         struct ov7251 *ov7251;
>>>>         u8 chip_id_high, chip_id_low, chip_rev;
>>>>         int ret;
>>>> @@ -1270,24 +1333,9 @@ static int ov7251_probe(struct i2c_client *client)
>>>>         ov7251->i2c_client = client;
>>>>         ov7251->dev = dev;
>>>>
>>>> -       endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
>>>> -       if (!endpoint) {
>>>> -               dev_err(dev, "endpoint node not found\n");
>>>> -               return -EINVAL;
>>>> -       }
>>>> -
>>>> -       ret = v4l2_fwnode_endpoint_parse(endpoint, &ov7251->ep);
>>>> -       fwnode_handle_put(endpoint);
>>>> -       if (ret < 0) {
>>>> -               dev_err(dev, "parsing endpoint node failed\n");
>>>> +       ret = ov7251_check_hwcfg(ov7251);
>>>> +       if (ret)
>>>>                 return ret;
>>>> -       }
>>>> -
>>>> -       if (ov7251->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
>>>> -               dev_err(dev, "invalid bus type (%u), must be CSI2 (%u)\n",
>>>> -                       ov7251->ep.bus_type, V4L2_MBUS_CSI2_DPHY);
>>>> -               return -EINVAL;
>>>> -       }
>>>>
>>>>         /* get system clock (xclk) */
>>>>         ov7251->xclk = devm_clk_get(dev, "xclk");
>>>> --
>>>> 2.25.1
>>>>
