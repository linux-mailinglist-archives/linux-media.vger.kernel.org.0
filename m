Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5C774BB45D
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 09:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbiBRIhZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Feb 2022 03:37:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbiBRIhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Feb 2022 03:37:23 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097524E3BA
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 00:37:06 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id l67-20020a1c2546000000b00353951c3f62so5815732wml.5
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 00:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LPBIor/YNgpZUcL9S5cPGPd2KPMNmoBQO3/Are5EvKA=;
        b=YIxeBgYzDDs8/T3dsQC/nyWcPzT960bSFzYL51NOsbwdVaLhfNbgu87kIrXNMkuYAf
         uVFknGL2Z9nfw3wZgqnG2VtFia4goB5x42NoeqpkWp6S6grC569s4F5gjJYSjEYIweqz
         Y6IuKtafnwyvJGae1nqmdZuC61+L6McxHjOPhrghdsF3qpbhmY5FDzrhNl2VEFzRt1kU
         D1lbUX6l/ZnZx2iuFG0iu95tbRw+Gd+7J3SsDkf9yRO2iTTd9pjN/vAyiTy7AlkcYp32
         0QqBRiRxbgqobYd/Z60m7ilsd5yzAhy3ZzGzeZzbZ7STXmqTBXYD0rpioz5JA9kt0T6u
         aJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LPBIor/YNgpZUcL9S5cPGPd2KPMNmoBQO3/Are5EvKA=;
        b=u1dA0YWHKuQWRhYdDbPERSAdD7nqIGhARRVMcn4eeG1rulFdjoRuizlZQlEfYd+frZ
         dlJv6qBL5khVpUn+KyrajcFD7qF8oj0vXC8dSUZ6ysBviGcriklxOsSAo3YtdVIf9Pty
         XzUi4KD7j19I5woUBeYvWJlwrlkhDj2jAeJ96xLfdPY2WkiYfMFzmjwe4nDe7ja4QtQ9
         b0HMrGMeEyuHq3QIYBKIS96xen6GO4YvN61oBFMWFVpNN5JQAULv+g3zITqmYULKit3l
         WSWV1lefDXBdaZ+lLwcIcMhYJ6idXKV64G4zZGQyH466+RJUNfVc3D0m3+5a3WchJ214
         S8cQ==
X-Gm-Message-State: AOAM532zCgwSil+OXZV1HsXKYdMPR2VlKPw/RPBIgTX1hXMLKGBmG1Z6
        yiXD2ffispODjVjfK+eTuzUYE96WNBCTjA==
X-Google-Smtp-Source: ABdhPJzcVSL7zZxqpF8hGBQSrQhV7oGdy6om7sspJQ03syGXjXL5nh9exgwGUImavpBhZv4AnJZK/A==
X-Received: by 2002:a05:600c:4fcc:b0:37d:3461:581c with SMTP id o12-20020a05600c4fcc00b0037d3461581cmr6100200wmq.152.1645173424462;
        Fri, 18 Feb 2022 00:37:04 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h6sm4043872wmq.8.2022.02.18.00.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 00:37:03 -0800 (PST)
Message-ID: <732686a7-8bf7-07f0-7eef-dadf1bb6e99b@gmail.com>
Date:   Fri, 18 Feb 2022 08:37:02 +0000
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
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <CAPY8ntAttHzaUNP6-8mn7CPkJV1JisO-_pSRwfogiMjWNt9oUA@mail.gmail.com>
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

Hi Dave

On 17/02/2022 15:54, Dave Stevenson wrote:
> Hi Daniel
>
> On Tue, 15 Feb 2022 at 23:08, Daniel Scally <djrscally@gmail.com> wrote:
>> Move the endpoint checking from .probe() to a dedicated function,
>> and additionally check that the firmware provided link frequencies
>> are a match for those supported by the driver. Finally, return
>> -EPROBE_DEFER if the endpoint is not available, as it could be built
>> by the ipu3-cio2 driver if that probes later.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>  drivers/media/i2c/ov7251.c | 84 ++++++++++++++++++++++++++++++--------
>>  1 file changed, 66 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
>> index d6fe574cb9e0..5c5f7a15a640 100644
>> --- a/drivers/media/i2c/ov7251.c
>> +++ b/drivers/media/i2c/ov7251.c
>> @@ -1255,10 +1255,73 @@ static const struct v4l2_subdev_ops ov7251_subdev_ops = {
>>         .pad = &ov7251_subdev_pad_ops,
>>  };
>>
>> +static int ov7251_check_hwcfg(struct ov7251 *ov7251)
>> +{
>> +       struct fwnode_handle *fwnode = dev_fwnode(ov7251->dev);
>> +       struct v4l2_fwnode_endpoint bus_cfg = {
>> +               .bus_type = V4L2_MBUS_CSI2_DPHY,
>> +       };
>> +       struct fwnode_handle *endpoint;
>> +       bool freq_found;
>> +       int i, j;
>> +       int ret;
>> +
>> +       endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
>> +       if (!endpoint)
>> +               return -EPROBE_DEFER; /* could be provided by cio2-bridge */
>> +
>> +       ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
>> +       fwnode_handle_put(endpoint);
>> +       if (ret)
>> +               return dev_err_probe(ov7251->dev, ret,
>> +                                    "parsing endpoint node failed\n");
>> +
>> +       if (bus_cfg.bus_type != V4L2_MBUS_CSI2_DPHY) {
>> +               ret = -EINVAL;
>> +               dev_err(ov7251->dev, "invalid bus type (%u), must be (%u)\n",
>> +                       bus_cfg.bus_type, V4L2_MBUS_CSI2_DPHY);
>> +               goto out_free_bus_cfg;
>> +       }
>> +
>> +       if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1) {
>> +               dev_err(ov7251->dev, "only a 1-lane CSI2 config is supported");
>> +               ret = -EINVAL;
>> +               goto out_free_bus_cfg;
>> +       }
>> +
>> +       if (!bus_cfg.nr_of_link_frequencies) {
>> +               dev_err(ov7251->dev, "no link frequencies defined\n");
>> +               ret = -EINVAL;
>> +               goto out_free_bus_cfg;
>> +       }
>> +
>> +       freq_found = false;
>> +       for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
>> +               if (freq_found)
>> +                       break;
>> +
>> +               for (j = 0; j < ARRAY_SIZE(link_freq); j++)
>> +                       if (bus_cfg.link_frequencies[i] == link_freq[j]) {
>> +                               freq_found = true;
>> +                               break;
>> +                       }
>> +       }
>> +
>> +       if (i == bus_cfg.nr_of_link_frequencies) {
> This doesn't work if there is only one link frequency defined in the
> config and it is valid.
>
> Loop i=0, freq_found gets set to true.
> Continue the outer loop.
> i++ , so i=1.
> i < bus_cfg.nr_of_link_frequencies is no longer true (both are 1), so
> we quit the outer loop.
> i == bus_cfg.nr_of_link_frequencies, so we now fail the function.
>
> Doesn't this last check want to be if (!freq_found) ?
>
> And/or amend the loop to move the "if (freq_found) break;" to the end,
> so that we break out of the outer loop as soon as we have a frequency
> found, and thereby avoid the i++.


Ah, damn you're right. Sorry - I originally broke the double loop with a
goto and then decided at the last minute that it was too ugly so I
changed it. Thought I was careful enough there to not need to test it -
lesson learned.

> It all feels a little odd as there is only one link frequency used by
> all the modes, and we're not actually filtering the modes that can be
> selected based on the configured link frequencies should there be
> multiple frequencies in link_freq[].


At present no, but I was thinking about adding one (the windows driver
for my platform uses a different link freq, and I'd like to support it)
- it'll just mean a different set of ov7251_pll_configs.

>
>   Dave
>
>> +               dev_err(ov7251->dev, "no supported link freq found\n");
>> +               ret = -EINVAL;
>> +               goto out_free_bus_cfg;
>> +       }
>> +
>> +out_free_bus_cfg:
>> +       v4l2_fwnode_endpoint_free(&bus_cfg);
>> +
>> +       return ret;
>> +}
>> +
>>  static int ov7251_probe(struct i2c_client *client)
>>  {
>>         struct device *dev = &client->dev;
>> -       struct fwnode_handle *endpoint;
>>         struct ov7251 *ov7251;
>>         u8 chip_id_high, chip_id_low, chip_rev;
>>         int ret;
>> @@ -1270,24 +1333,9 @@ static int ov7251_probe(struct i2c_client *client)
>>         ov7251->i2c_client = client;
>>         ov7251->dev = dev;
>>
>> -       endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
>> -       if (!endpoint) {
>> -               dev_err(dev, "endpoint node not found\n");
>> -               return -EINVAL;
>> -       }
>> -
>> -       ret = v4l2_fwnode_endpoint_parse(endpoint, &ov7251->ep);
>> -       fwnode_handle_put(endpoint);
>> -       if (ret < 0) {
>> -               dev_err(dev, "parsing endpoint node failed\n");
>> +       ret = ov7251_check_hwcfg(ov7251);
>> +       if (ret)
>>                 return ret;
>> -       }
>> -
>> -       if (ov7251->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
>> -               dev_err(dev, "invalid bus type (%u), must be CSI2 (%u)\n",
>> -                       ov7251->ep.bus_type, V4L2_MBUS_CSI2_DPHY);
>> -               return -EINVAL;
>> -       }
>>
>>         /* get system clock (xclk) */
>>         ov7251->xclk = devm_clk_get(dev, "xclk");
>> --
>> 2.25.1
>>
