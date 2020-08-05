Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1748423CC70
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 18:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbgHEQoW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 12:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbgHEQmM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 12:42:12 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237C9C0086D2;
        Wed,  5 Aug 2020 07:19:56 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h19so47888800ljg.13;
        Wed, 05 Aug 2020 07:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qm6Ej0exkuDwKqXg5SiXppSqBSR/B5iSnMsDgHpre7I=;
        b=gwlV0g6jtWbcz3d4+dfyYotSLCuWXlwfq5pi61UDD/9b97I+lD8aaLS+mZb52iNqIe
         IS6aCP90M8Va2j9rHpQr/J2yKrX8DJYesdYthy28qYmvwgaP1eLNkABPQgu1PxN5KaYA
         jNI9o3XnFGb+RX1AQaLbu072D16Wx5oXtsHISbtvOiYFa8hqYxnNt3cBVNw4gImM1AyG
         0YCTkAiOMV76R7adrn1xyldkdCAfT34MhLg/oGUw+7HG9sUxJHcUUEwbW8X03H/Rs/ka
         KUTUUJasa2YqvCfN7ltLjnKV+nDdJlpMR+TUaAr0NhLPBtCtpw66i6spOVroxsWeb7+j
         +ujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qm6Ej0exkuDwKqXg5SiXppSqBSR/B5iSnMsDgHpre7I=;
        b=bXaBAVIP8mGjAvjdhzqjUlnoQVV0JFJ4RoQ9nIn3ffAq9DPuNj6EIo8aA33PBDAT+j
         mRx6DIcGVhdo7i8/yEVP7+wJ6Q/00TsQKGQAd0k2wOE1ntm1jrgY3EzdKzxJNSfOyFfH
         VdmRLE127qMVkdq1WlDdZrF10B7aFvH3lc3/XAqOFyW0dcSBFEMjcUS9Oz0t8gRgteNJ
         NQPL+EeQpmzodI3+wDnvT/5cIrYzkX7AGCk24kT3xKZm7++fRHwAGuZ4bNDYCEEYA4wT
         ZD+62oAHJkNiw8izYjGLzFeFYJjYtuIvlkYPzwSeuYW/JJ1n+uNTCQCV3bGzBLgHlnEX
         fHnw==
X-Gm-Message-State: AOAM530goFGc9eoPb0Opk5XgX0kRkkK/fqq9eK5EEQq6jouedmezCx3T
        8S67q0hZypCbLIjYDPbgbLHlMT7i
X-Google-Smtp-Source: ABdhPJyX/nk4BnxYLi+IZ2EQX/2K3hvXCNEtxm0Q1OtvaDN4g1VTEtKtaj5iBJmRqEIBT+Wsd7t/Nw==
X-Received: by 2002:a2e:9449:: with SMTP id o9mr1667761ljh.403.1596637194081;
        Wed, 05 Aug 2020 07:19:54 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id c4sm1263842lfs.27.2020.08.05.07.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 07:19:53 -0700 (PDT)
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <1596469346-937-9-git-send-email-skomatineni@nvidia.com>
 <20200805134600.GA3351349@ulmo>
 <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
Message-ID: <dcd58ae7-58ed-11d1-0e10-7f522b651b30@gmail.com>
Date:   Wed, 5 Aug 2020 17:19:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

05.08.2020 17:05, Dmitry Osipenko пишет:
> 05.08.2020 16:46, Thierry Reding пишет:
>> On Mon, Aug 03, 2020 at 08:42:24AM -0700, Sowjanya Komatineni wrote:
>>> With the split of MIPI calibration into tegra_mipi_calibrate() and
>>> tegra_mipi_wait(), MIPI clock is not kept enabled till the calibration
>>> is done.
>>>
>>> So, this patch skips disabling MIPI clock after triggering start of
>>> calibration and disables it only after waiting for done status from
>>> the calibration logic.
>>>
>>> This patch renames tegra_mipi_calibrate() as tegra_mipi_start_calibration()
>>> and tegra_mipi_wait() as tegra_mipi_finish_calibration() to be inline
>>> with their usage.
>>>
>>> As MIPI clock is left enabled and in case of any failures with CSI input
>>> streaming tegra_mipi_finish_calibration() will not get invoked.
>>> So added new API tegra_mipi_cancel_calibration() which disables MIPI clock
>>> and consumer drivers can call this in such cases.
>>>
>>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>  drivers/gpu/drm/tegra/dsi.c |  4 ++--
>>>  drivers/gpu/host1x/mipi.c   | 19 ++++++++++---------
>>>  include/linux/host1x.h      |  5 +++--
>>>  3 files changed, 15 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
>>> index 3820e8d..a7864e9 100644
>>> --- a/drivers/gpu/drm/tegra/dsi.c
>>> +++ b/drivers/gpu/drm/tegra/dsi.c
>>> @@ -694,11 +694,11 @@ static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
>>>  		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
>>>  	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
>>>  
>>> -	err = tegra_mipi_calibrate(dsi->mipi);
>>> +	err = tegra_mipi_start_calibration(dsi->mipi);
>>>  	if (err < 0)
>>>  		return err;
>>>  
>>> -	return tegra_mipi_wait(dsi->mipi);
>>> +	return tegra_mipi_finish_calibration(dsi->mipi);
>>>  }
>>>  
>>>  static void tegra_dsi_set_timeout(struct tegra_dsi *dsi, unsigned long bclk,
>>> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
>>> index e606464..b15ab6e 100644
>>> --- a/drivers/gpu/host1x/mipi.c
>>> +++ b/drivers/gpu/host1x/mipi.c
>>> @@ -293,17 +293,19 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev)
>>>  }
>>>  EXPORT_SYMBOL(tegra_mipi_disable);
>>>  
>>> -int tegra_mipi_wait(struct tegra_mipi_device *device)
>>> +void tegra_mipi_cancel_calibration(struct tegra_mipi_device *device)
>>> +{
>>> +	clk_disable(device->mipi->clk);
>>
>> Do we need to do anything with the MIPI_CAL_CTRL and MIPI_CAL_STATUS
>> registers here? We don't clear the START bit in the former when the
>> calibration has successfully finished, but I suspect that's because
>> the bit is self-clearing. But I wonder if we still need to clear it
>> upon cancellation to make sure the calibration does indeed stop.
> 
> Apparently there is no way to explicitly stop calibration other than to
> reset MIPI calibration block, but Sowjanya says this is unnecessary.
> 
> Perhaps having a fixed delay before disabling clock could be enough to
> ensure that calibration is stopped before the clock is disabled?
> 

Actually, there is a MIPI_CAL_ACTIVE bit in the status register. Maybe
it needs to be polled until it's unset?
