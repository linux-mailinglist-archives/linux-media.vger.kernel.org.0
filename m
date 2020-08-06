Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3087B23DE48
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729562AbgHFRYE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729517AbgHFREq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 13:04:46 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66610C034623;
        Thu,  6 Aug 2020 06:32:25 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x24so8792812lfe.11;
        Thu, 06 Aug 2020 06:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LZxvFQGifO+67iYKjeLuydYAgFkWMKjwGTRkNaAuRmA=;
        b=WUFT7XZ6WlGDd8EaFKldHEkscNGOKMwPso2gE4g0kMoDMtrhul6ymRofEzEiWmgRsq
         Ka68NNykTmXUo+gX944jueoFOnF8+CCcQ/JoVMB+UI5LOfXim3dkjWg8BQvN29RWNN7w
         QYmnXQOLo9rm53R6MlNAvUb5mLLZZgxf0IcqvsOmsg9X+sBXPKNjKxSBaT7/6d9fMAPU
         Qc8g7y7+sQGW/kQr9gbxaO/x25VC1UvUEQLYYHZDXQ7cQPK24fSO0ucJKZeiZs7fhq/u
         JrPPwqu3xrE7kwq3DnK5EXHeHPAktkwcIu3ePAZXv6TO+W282wFLa/B+jQbRI+8zuSHL
         9Ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LZxvFQGifO+67iYKjeLuydYAgFkWMKjwGTRkNaAuRmA=;
        b=VMgyrvABh6bQli/5LaDEDfl8KvY20yKpzSNZ3+9s2jSQi9WZx/GfffNFnT7P9RBxx0
         9108b0uxF7Cl3hyiwbLE66VAekOjCIhGRuLOoW0QV/GhgaxIlnJdYFnu8WzqNq7kZaRp
         u9CT91Ne7J+LXF98OcuplQENkRtBZTenBOVs4l1DxPb9WxAZqrtQWth+NGPwgY8E5Yt+
         lxtQRHSSH//rt7Nf02MxyU8h8s1jLbu8jriOTr2XwPaZfl8dhGPHNTMGV+C6RI/Ztpgr
         2r4tf51yfWeOUQcPs+B2z7JdBp4buLHM55cMUW5Osta4+iSK0HAnLIA9rzPVdXxXFcZJ
         rQHg==
X-Gm-Message-State: AOAM531uuXU/piZPq693vttir9VWBhJdlK4CGE62JPx6iOQJ9nar6Rs3
        rgdZVXfQHV8aonhY9aNcNggIVTs2
X-Google-Smtp-Source: ABdhPJxNWwksICqD/uuo/XKUFPyGL1DYzGZiOXNL9vJy0Ic/lvuGHHKkvbseSJ8PTHofY2GlvQOcsA==
X-Received: by 2002:ac2:4d31:: with SMTP id h17mr3834171lfk.144.1596720736814;
        Thu, 06 Aug 2020 06:32:16 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id h14sm2387225ljb.53.2020.08.06.06.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 06:32:14 -0700 (PDT)
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <1596469346-937-9-git-send-email-skomatineni@nvidia.com>
 <20200805134600.GA3351349@ulmo>
 <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
 <dcd58ae7-58ed-11d1-0e10-7f522b651b30@gmail.com>
 <addb92e5-7c7a-6fba-117d-c7880b2d4597@nvidia.com>
 <ed80bf2f-213f-286a-59b2-fc85e4181b3d@gmail.com>
 <6eede805-80fd-016f-22f8-b6d25f6587af@nvidia.com>
 <1c12e40e-de7f-0599-a941-82760b4c7668@gmail.com>
 <9ef0b875-e826-43e2-207e-168d2081ff6a@nvidia.com>
 <4689cfe9-e7c4-48bf-217f-3a31b59b8bda@nvidia.com>
 <0e78c5ca-c529-1e98-891d-30351c9aae81@gmail.com>
 <b2098a68-d02f-b406-fc57-56e3ff5d8d1a@nvidia.com>
 <309e3b66-9288-91ef-71b4-be73eacbbd62@nvidia.com>
 <fde2431a-0585-ac32-ac25-73e198aaa948@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4025a458-fa78-924d-c84f-166f82df0f8e@gmail.com>
Date:   Thu, 6 Aug 2020 16:32:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fde2431a-0585-ac32-ac25-73e198aaa948@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.08.2020 03:47, Sowjanya Komatineni пишет:
> 
> On 8/5/20 11:06 AM, Sowjanya Komatineni wrote:
>>
>> On 8/5/20 10:46 AM, Sowjanya Komatineni wrote:
>>>
>>> On 8/5/20 10:34 AM, Dmitry Osipenko wrote:
>>>> 05.08.2020 20:29, Sowjanya Komatineni пишет:
>>>> ...
>>>>> UART_FST_MIPI_CAL is the clock used for calibration logic which is FSM
>>>>> that goes thru sequence codes and when done waits for pads to be in
>>>>> LP-11 to apply results.
>>>>>
>>>>> MIPI_CLK is controller gate clock which is also need to be kept
>>>>> enabled
>>>>> as incase if it sees LP-11 it updates registers so its recommended to
>>>>> have this clock enabled.
>>>>>
>>>>> We can cancel_calibration() in CSI only when csi/sensor stream on
>>>>> fails
>>>>> and in which case there will be no LP-11 so we can unconditionally
>>>>> disable MIPI_CLK.
>>>>>
>>>> There is no guarantee that the fail comes before the LP-11. For
>>>> example,
>>>> some odd camera driver may have a complicated enable sequence which may
>>>> fail after enabling the hardware streaming.
>>>
>>> MIPI_CLK to keep enable is for calibration logic to update results,
>>> but like I said calibration logic uses UART_FST_MIPI_CAL clock. So
>>> even in case if fail happens from sensor after having pads in LP-11
>>> then, calibration logic will still be running but result update will
>>> not happen with clock disabled. But HW will not stuck as this is
>>> confirmed from HW designer.
>>
>> If LP-11 happens from sensor stream (followed by fail) and by that
>> time if calibration FSM is done and if calibration logic sees LP-11
>> then results will be applied to pads.
>>
>> We did start of calibration before CSI stream so by the time we do
>> sensor stream enable, calibration logic might have done with FSM and
>> waiting for LP-11
>>
>> Also if we see any special case, we always can use
>> finish_calibration() instead of cancel_calibration() as well.

Why not to do it right now?

Then the code could look like this:

src_subdev = tegra_channel_get_remote_source_subdev(chan);
ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
err = tegra_mipi_finish_calibration(csi_chan->mipi);

if (ret < 0 && ret != -ENOIOCTLCMD)
	goto err_disable_csi_stream;

if (err < 0)
	dev_warn(csi_chan->csi->dev,
		 "MIPI calibration failed: %d\n", err);

>> finish_calibration() has extra 250ms wait time polling done bit and we
>> can ignore its return code during fail pathway.
>>
> Confirmed from HW designer, calibration FSM to finish takes worst case
> 72uS so by the time it gets to sensor stream it will be done its
> sequence and will be waiting for DONE bit.
> 
> So disabling MIPI CAL clock on sensor stream fails is safe.


72us is quite a lot of time, what will happen if LP-11 happens before
FSM finished calibration?

Maybe the finish_calibration() needs to split into two parts:

 1. wait for CAL_STATUS_ACTIVE before enabling sensor
 2. wait for CAL_STATUS_DONE after enabling sensor
