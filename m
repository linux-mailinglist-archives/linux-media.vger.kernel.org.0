Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7770123D100
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 21:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgHETzY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 15:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727831AbgHEQrv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 12:47:51 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A333C0A891E;
        Wed,  5 Aug 2020 07:05:45 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id g6so35183571ljn.11;
        Wed, 05 Aug 2020 07:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ev09fQIwwVoCVctHIyJV4BoifzLSy9cjs96TIWMwjTk=;
        b=cNVGeAkym4a82t1dKh/mLk7LiT1I62FNbECk1sMfA46ZzG+zxPAK4lb3stMHwJb/rV
         WWRVtEmCsbISNWfopFqtqONM27I7dFWv+eI//FBFAWQQCWLwleiBkKNfzfVzd9jmW1Tb
         V+6lP1qFgd/v133DkeicAvG0vM7mflZVB9ncOeL7VXu439S13YBGPyvTrQ3QAFqviVd/
         6HquEkXbMfV43y5jThSrRMnTEGGRGLnBHFRe2BdrXBqhPQ3rEpsAfk7H5kF4BG/XDGb3
         8NYYYM+cye/RUHA1EVk1pgdQxmPTECvT9dVp740ngutHv66JxGiYINPAkY+AEHyUByrF
         3WcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ev09fQIwwVoCVctHIyJV4BoifzLSy9cjs96TIWMwjTk=;
        b=HKPM0CazDAvehVn+o6R3lkrfCQMW5JJGuNEPH3zl2OhUMq/JqwWGltnuLVucQzgsU4
         1rvk3+pWoZ0U80rVPYAJWUZ4HEekrMSsZ6ZEZxOkV0q1/Q6V6dnrI1uhnSIgUsN2667A
         x0zKbbdDW+C3+D6f1IzbQMnYqGrml5cw3jRooqc4z+hGjrBYS+HKP9OUCRw9FLGqsDpc
         CVu1zzNlwnFrKWx49cBnpvVd1+Yuq/md7qfVg9dJWF7xARKxQZYPao/1B0xRvx8oHg6A
         3SdMzYcyhXe1coG8wiqWU3iyWGFS5shrV1sdVo9fJV8vsvtkA4QA4rRaZTCsBPazcuCI
         FXfw==
X-Gm-Message-State: AOAM531zE73JdOeoCToyMHQvmbj33x34NB9vyy+SvTJTZ39DTVSMhfVP
        g86pZ475JTgaSMRli3qNe+X4z6Bu
X-Google-Smtp-Source: ABdhPJxUHKn3jgLLgt9PNMiup+D3HBXI8zcR+vLF4HsyQfIBRuNgWjulNBCag9k50dUroJkG40tq4w==
X-Received: by 2002:a2e:164f:: with SMTP id 15mr1603373ljw.68.1596636342876;
        Wed, 05 Aug 2020 07:05:42 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id q20sm941582ljj.42.2020.08.05.07.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 07:05:42 -0700 (PDT)
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
Date:   Wed, 5 Aug 2020 17:05:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805134600.GA3351349@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

05.08.2020 16:46, Thierry Reding пишет:
> On Mon, Aug 03, 2020 at 08:42:24AM -0700, Sowjanya Komatineni wrote:
>> With the split of MIPI calibration into tegra_mipi_calibrate() and
>> tegra_mipi_wait(), MIPI clock is not kept enabled till the calibration
>> is done.
>>
>> So, this patch skips disabling MIPI clock after triggering start of
>> calibration and disables it only after waiting for done status from
>> the calibration logic.
>>
>> This patch renames tegra_mipi_calibrate() as tegra_mipi_start_calibration()
>> and tegra_mipi_wait() as tegra_mipi_finish_calibration() to be inline
>> with their usage.
>>
>> As MIPI clock is left enabled and in case of any failures with CSI input
>> streaming tegra_mipi_finish_calibration() will not get invoked.
>> So added new API tegra_mipi_cancel_calibration() which disables MIPI clock
>> and consumer drivers can call this in such cases.
>>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/gpu/drm/tegra/dsi.c |  4 ++--
>>  drivers/gpu/host1x/mipi.c   | 19 ++++++++++---------
>>  include/linux/host1x.h      |  5 +++--
>>  3 files changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
>> index 3820e8d..a7864e9 100644
>> --- a/drivers/gpu/drm/tegra/dsi.c
>> +++ b/drivers/gpu/drm/tegra/dsi.c
>> @@ -694,11 +694,11 @@ static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
>>  		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
>>  	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
>>  
>> -	err = tegra_mipi_calibrate(dsi->mipi);
>> +	err = tegra_mipi_start_calibration(dsi->mipi);
>>  	if (err < 0)
>>  		return err;
>>  
>> -	return tegra_mipi_wait(dsi->mipi);
>> +	return tegra_mipi_finish_calibration(dsi->mipi);
>>  }
>>  
>>  static void tegra_dsi_set_timeout(struct tegra_dsi *dsi, unsigned long bclk,
>> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
>> index e606464..b15ab6e 100644
>> --- a/drivers/gpu/host1x/mipi.c
>> +++ b/drivers/gpu/host1x/mipi.c
>> @@ -293,17 +293,19 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev)
>>  }
>>  EXPORT_SYMBOL(tegra_mipi_disable);
>>  
>> -int tegra_mipi_wait(struct tegra_mipi_device *device)
>> +void tegra_mipi_cancel_calibration(struct tegra_mipi_device *device)
>> +{
>> +	clk_disable(device->mipi->clk);
> 
> Do we need to do anything with the MIPI_CAL_CTRL and MIPI_CAL_STATUS
> registers here? We don't clear the START bit in the former when the
> calibration has successfully finished, but I suspect that's because
> the bit is self-clearing. But I wonder if we still need to clear it
> upon cancellation to make sure the calibration does indeed stop.

Apparently there is no way to explicitly stop calibration other than to
reset MIPI calibration block, but Sowjanya says this is unnecessary.

Perhaps having a fixed delay before disabling clock could be enough to
ensure that calibration is stopped before the clock is disabled?
