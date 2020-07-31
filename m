Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF5A234C6B
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 22:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728844AbgGaUme (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 16:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgGaUme (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 16:42:34 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF01DC061574;
        Fri, 31 Jul 2020 13:42:33 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v12so3403741ljc.10;
        Fri, 31 Jul 2020 13:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bteal2gJqaWT5iiU6PduiP6X6F7TRM1Ny/RVrHPf5ic=;
        b=u78uyT/dQZCoztTrF83RD6Ml+May5x7tHMpyV+KWZ95mQJwIbX1ZdMC4Sc+t3OJoGa
         Qqj8D++3421SEOuITs9LN9IFZXyY9iWq9k2f4WSAjn3cGNClr0OLnYGvZB3tJ3ft4qAL
         ead7pQYF0iMaCQLZMtnXMThyMyN0aMowTSrnOQlFHj7hBhQ945KqbRJ3cmUAR/VpH30W
         85Sv6tSbhCSxjuETdue7siVqkXuq4fy7JiWCbyT6bZ1WuKzPbUe46McJ6gSa19ZTd4mZ
         xJ43A8NDOr/XtOpsaEfqdOPBMFeAP8fqxvtqsiV1//dP6uRxwfTEJQXkwFNkjx+2iX8b
         xjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bteal2gJqaWT5iiU6PduiP6X6F7TRM1Ny/RVrHPf5ic=;
        b=O2m0b5TaPFlNULAjXn6xF3lTT9uGu3wFJZ9B5tctQN/oqIA01ktS+7mpR7R2KM9wsD
         jZPesmfR7C6jswyYhbtJl9GAA2QgHY2wi1/zwMcTxObKAwJfkuY2fuq/kBM0tCYLgBJA
         qizLn7ZVQ5/TPtqr0t4J4K9NyoKQTcBiHGHZQkFS+Db9BvNw3mICXQ4OplBwA47yo3Id
         ZmjefDrpBehPY24zjdPKMdU+2kmOE/C8tH2mXDQmZrK5vyFL+emRmjpnyoMToeNm0KpL
         AfSYKJM26nS1pWPgXiwU4qVjd35B1jbzMhlEttL47h07FgSPKJy2EfJYKxVAN3EA9++q
         WhZA==
X-Gm-Message-State: AOAM53394FsGUf8L4fkMREAkJ5wUdWWCdErUiCqwDI2AR3nBstF8pfhi
        ioxxjvkfa2aWRmiXBVvXxTZ/oUu2
X-Google-Smtp-Source: ABdhPJw8OkY8GR33ds2cRLW1HDkgp0+VDYrE+lybqbYAevvPJlg3lAQGkx6GmBW11mQzGJGbYoHgjw==
X-Received: by 2002:a2e:3619:: with SMTP id d25mr2553082lja.204.1596228151922;
        Fri, 31 Jul 2020 13:42:31 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id 193sm2608104lfa.90.2020.07.31.13.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2020 13:42:31 -0700 (PDT)
Subject: Re: [RFC PATCH v6 09/10] media: tegra-video: Add CSI MIPI pads
 calibration
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
 <1596186169-18729-10-git-send-email-skomatineni@nvidia.com>
 <3ac158c4-7df7-e3c1-f0e1-33e7ef017762@gmail.com>
 <f483329d-b5fe-fda5-e235-b8edb5fce440@nvidia.com>
 <a08af0e8-80d8-0bd0-87a3-adfc8e70a92a@gmail.com>
 <ace047fe-8a1a-666a-b91b-9d63b1d68567@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7d904a86-3189-7ef8-a7b9-1a84564f9278@gmail.com>
Date:   Fri, 31 Jul 2020 23:42:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ace047fe-8a1a-666a-b91b-9d63b1d68567@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

31.07.2020 19:29, Sowjanya Komatineni пишет:
> 
> On 7/31/20 9:14 AM, Dmitry Osipenko wrote:
>> 31.07.2020 18:46, Sowjanya Komatineni пишет:
>>> On 7/31/20 4:39 AM, Dmitry Osipenko wrote:
>>>> 31.07.2020 12:02, Sowjanya Komatineni пишет:
>>>> ...
>>>>> @@ -249,13 +249,47 @@ static int tegra_csi_enable_stream(struct
>>>>> v4l2_subdev *subdev)
>>>>>            return ret;
>>>>>        }
>>>>>    +    if (csi_chan->mipi) {
>>>>> +        ret = tegra_mipi_enable(csi_chan->mipi);
>>>>> +        if (ret < 0) {
>>>>> +            dev_err(csi->dev,
>>>>> +                "failed to enable MIPI pads: %d\n", ret);
>>>>> +            goto rpm_put;
>>>>> +        }
>>>>> +
>>>>> +        /*
>>>>> +         * CSI MIPI pads PULLUP, PULLDN and TERM impedances need to
>>>>> +         * be calibrated after power on.
>>>>> +         * So, trigger the calibration start here and results will
>>>>> +         * be latched and applied to the pads when link is in LP11
>>>>> +         * state during start of sensor streaming.
>>>>> +         */
>>>>> +        ret = tegra_mipi_start_calibration(csi_chan->mipi);
>>>>> +        if (ret < 0) {
>>>>> +            dev_err(csi->dev,
>>>>> +                "failed to start MIPI calibration: %d\n", ret);
>>>>> +            goto disable_mipi;
>>>>> +        }
>>>> What would happen if CSI stream is enabled and then immediately
>>>> disabled
>>>> without enabling camera sensor?
>>> Nothing will happen as during stream enable csi receiver is kept ready.
>>>
>>> But actual capture will not happen during that point.
>> Could you please show how the full call chain looks like? It's not clear
>> to me what keeps CSI stream "ready".
> 
> VI is the main video input (video device) and on streaming it starts
> stream of CSI subdev prior to stream of Sensor.
> 
> HW path, sensor stream (CSI TX) -> CSI stream (RX)
> 
> During CSI stream on, CSI PHY receiver is enabled to start receiving the
> data but internally capture assembled to active state will happen only
> when Tegra VI single shot is issues where VI thru pixel parser gets
> captures data into the memory

Alright, I see now.

Will be great if you could change this hunk:

{
  ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
  if (ret < 0 && ret != -ENOIOCTLCMD) {
    tegra_mipi_cancel_calibration(csi_chan->mipi);
    v4l2_subdev_call(csi_subdev, video, s_stream, false);
    return ret;
  }
}

to look like this:

{
  err = v4l2_subdev_call(src_subdev, video, s_stream, true);
  if (err < 0 && err != -ENOIOCTLCMD)
    goto err_disable_csi_stream;
...
  return 0;

err_disable_csi_stream:
  tegra_mipi_cancel_calibration(csi_chan->mipi);

  v4l2_subdev_call(csi_subdev, video, s_stream, false);

  return err;
}


It should make code a bit easier to read and follow.

Otherwise this patch looks good to me, thanks.
