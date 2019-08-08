Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEA5386863
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 20:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732327AbfHHSCh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 14:02:37 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41161 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbfHHSCh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 14:02:37 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so92581210wrm.8
        for <linux-media@vger.kernel.org>; Thu, 08 Aug 2019 11:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+9cAtm2YRhqh7KwGkh5X2lRhqZ+DxZm8WuF9bMNIk2M=;
        b=SXBZGIHKkE3+JErgQdfFPX9zrShs0byJOvcFkBSAEid7HpFTqUEjsSpIjMMojY3Unw
         MPwqecLcZ3qjLQXLNW65dNTZCuuDTs6lX1vIdX1j4dQotwYa45ODhttfW9/002A20n1a
         9c3oQ0xaOpvrjZoLEGJBM95ZjErV4e0XhntMgMcXDs/DELgeadxyaLOy06W0kQXxcUsd
         bl1f7euwcqROu82Wm0fzciKpD5vXQ32BJ4BShTmnsbPf2mtlIs/cMOKWPzgSfdIrE2G6
         iqgjqEXXiWCvVNlIl+bSe4sx6OVsJdyuhgeLkW7X2adzCzzzJi0NQ3iUtKqGpE/6nw8w
         5eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+9cAtm2YRhqh7KwGkh5X2lRhqZ+DxZm8WuF9bMNIk2M=;
        b=a/SGZ9qpz+ps0QeEE3p4ni+VpG7kGzzuXxVJVpCfSBu0ZHn8RCix2g2G5j3MsvP7as
         GhbtlA2fkEq0NswaNi5vedkCO7T/ThWoDShsa6FwWq3U5nL7Z9e6mLhxVn2VL3kdr7rm
         NFt4ocHX0D8B8PJxC7B0nfY7Ryrix4sH+5gj0VKAEdDw7ezQIBGNLG9cNiXZw4BcxpZE
         SwBvPs6I9KynebgFsMq5j9gTXD3zq3G7TSwA/cq2/zql/tHbFCHAB5PFxk6bkwlrvfW4
         s+B2BTkMADGqqzu65sVgFQVPE6YOBQAqz7kgBiEhpjrQ+QQBzTgn3jJnIWXobxvgBHJ4
         +h5w==
X-Gm-Message-State: APjAAAVevrv92ONPB5uz9C/pOLEQp1hZIPU7q7qNTGC/woKB2sOozEip
        6wLNc0shyr2E5rAgnGHsNYI=
X-Google-Smtp-Source: APXvYqxCv54PfxchpuCgel1Za/OWJwHRYc/leS+/2339ax0J2quIZYWRTOx6KOYZC3fGKnH7i7zhxA==
X-Received: by 2002:adf:edc9:: with SMTP id v9mr10448764wro.125.1565287354749;
        Thu, 08 Aug 2019 11:02:34 -0700 (PDT)
Received: from [172.30.88.58] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id x129sm3821620wmg.44.2019.08.08.11.02.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 11:02:33 -0700 (PDT)
Subject: Re: [PATCH v3] media: imx: mipi csi-2: Don't fail if initial state
 times-out
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Fabio Estevam <festevam@gmail.com>, hverkuil@xs4all.nl,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org, mchehab@kernel.org
References: <20190627222912.25485-1-festevam@gmail.com>
 <1561963729.3753.5.camel@pengutronix.de>
 <8b859fd7758c3f95b45b5b70909be0d2ae2e4f34.camel@collabora.com>
 <20190807120626.GE822@valkosipuli.retiisi.org.uk>
 <73d82df753e0579bd122dfaf9fa12ba8cad95d88.camel@collabora.com>
 <20190808082605.GA917@valkosipuli.retiisi.org.uk>
 <1565254405.3656.1.camel@pengutronix.de>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <e4b84958-28c7-1141-e34f-e1e3ad5b35db@gmail.com>
Date:   Thu, 8 Aug 2019 11:02:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565254405.3656.1.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/8/19 1:53 AM, Philipp Zabel wrote:
> Hi Sakari,
>
> On Thu, 2019-08-08 at 11:26 +0300, Sakari Ailus wrote:
> [...]
>>>> Have you checked how it works if you simply leave out this test?
> Whether this works or not depends on the sensor used, and for some
> sensor/drivers may depend on timing (or random factors influencing it).
> See below.
>
> [...]
>> Some devices can be commanded to enter LP-11 state but some will just
>> briefly visit that state. The LP-11 state is mandatory but software should
>> not be involved in detecting it if at all possible.
> This is a good point. Devices that can be set to LP-11 state
> immediately, but that don't stay there long enough (either because they
> wait for less than the required by spec 100µs, or because system load
> causes this check to be executed too late) may end up working reliably
> even though the warning fires.

>> So if the hardware does not require further initialisation to be done in
>> LP-11 state, you should remove the check.
>>
>>> We had to fix at least OV5645 and OV5640 recently because of this,
>>> and I can imagine more drivers will have the same issue.
>> This is actually an issue in the IMX driver (or hardware), not in the
>> sensor driver. It may be that sometimes it's easier to work around it in
>> the sensor driver.
>>
>> So, I'd like to know whether the check itself is a driver bug, or something
>> that the hardware requires. The fact that you're sending this patch
>> suggests the former.
> This is something that the hardware requires, according to the reference
> manual. See the comment in drivers/staging/media/imx/imx6-mipi-csi2.c,
> especially step 5.:
>
> /*
>   * The required sequence of MIPI CSI-2 startup as specified in the i.MX6
>   * reference manual is as follows:
>   *
>   * 1. Deassert presetn signal (global reset).
>   *        It's not clear what this "global reset" signal is (maybe APB
>   *        global reset), but in any case this step would be probably
>   *        be carried out during driver load in csi2_probe().
>   *
>   * 2. Configure MIPI Camera Sensor to put all Tx lanes in LP-11 state.
>   *        This must be carried out by the MIPI sensor's s_power(ON) subdev
>   *        op.
>   *
>   * 3. D-PHY initialization.
>   * 4. CSI2 Controller programming (Set N_LANES, deassert PHY_SHUTDOWNZ,
>   *    deassert PHY_RSTZ, deassert CSI2_RESETN).
>   * 5. Read the PHY status register (PHY_STATE) to confirm that all data and
>   *    clock lanes of the D-PHY are in LP-11 state.
>   * 6. Configure the MIPI Camera Sensor to start transmitting a clock on the
>   *    D-PHY clock lane.
>   * 7. CSI2 Controller programming - Read the PHY status register (PHY_STATE)
>   *    to confirm that the D-PHY is receiving a clock on the D-PHY clock lane.
>   */
>
> I read this as the hardware needing to see the LP-11 -> HS transition
> after the DPHY reset has been released, and before the CSI2 RX
> controller is programmed.

I think that's a fair assumption, and there's another paragraph at the 
end of that comment above that adds more evidence to that:

...
* All steps 3 through 7 are carried out by csi2_s_stream(ON) here. Step
* 6 is accomplished by calling the source subdev's s_stream(ON) between
* steps 5 and 7.
*/


So the driver is expecting that the LP-11 state persists until step 6, 
at which the LP-11 -> HS transition occurs when streaming is started at 
the transmitter.

But if the transmitter only stays in LP-11 state for the minimum 100 
usec after it is powered on, and then _automatically_ transitions to HS, 
it's quite possible the LP-11 -> HS transition will happen long before 
the DPHY is taken out of reset. That's because the transmitter's 
s_power(ON) is called when the capture device is opened (via 
v4l2_pipeline_pm_use()), but the steps above are carried out when 
streaming starts, so userland would have to issue VIDIOC_STREAMON well 
within the 100 usec expires after open()'ing the device, for the 
receiver hardware to see the transition.

Perhaps that would be an argument for moving steps 1 - 5 into the 
driver's s_power(ON) call, which would first call s_power(ON) to the 
transmitter and then immediately go through steps 1 - 5. Steps 6,7 would 
then remain in s_stream(ON).


>
> If not all lanes are in LP-11 state at step 5., we can't guarantee that
> the DPHY has already seen this transition nor that it will see it in
> time before we start enabling the CSI2 RX.
> Since this can lead to anything from sporadic to 100% startup failure,
> depending on timing or whether the sensor is configured correctly to
> produce this transition at all, I'd like this warning to stay.
> It has been helpful before when developing sensor drivers.

Agreed, I think the warning should remain.

One final note. The CSI-2 receiver in imx6 is a Synopsys DesignWare IP 
core, so these timing issues are likely to be an issue on other SoC's 
that use this core. The CSI-2 chapter in the imx6 reference manual is 
lifted/hacked-up from designware docs. It would be a good idea to get 
the full documentation on the Synopsys DesignWare MIPI CSI-2 Host and 
Device Controller docs at [1] which would probably shed more light.

Steve

[1] https://www.synopsys.com/dw/ipdir.php?ds=mipi_csi2

