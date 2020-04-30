Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7440F1C06EC
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 21:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgD3Trw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 15:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgD3Trv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 15:47:51 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BCE5C035494;
        Thu, 30 Apr 2020 12:47:51 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y3so2262513lfy.1;
        Thu, 30 Apr 2020 12:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mIuHJU3SfHPl0RlejSUY/NsnmtLzGRCO/6m26262Qts=;
        b=RbKzr/trk67WayG7elaPPX9h6D/tQB6VZKQORz+fZuTF7YBeGLG3C4am6mD45328hT
         37OqtMi3I1RRZeMmeJy2kzEqFWdrhS8dTVqItMjNTV5lNCyn0gSvDHQaZ2m77IIgGNkg
         xZf9ztBtT0ZhdnO/YO1tY74RQbxvXkMc1LGd6u4rV4j4T/YH+ouhu5YOrlQRHb1S2/vX
         5bMBdP0NOGsn3bZZjyjKB+aMkVxPEkxZlOA8b4Tnh21QR8ewXVJ15rwVlZws9MDzdfY9
         MKX6ZPzTNVmo5CI+lTQd+fEG4rp5gLTYS5ZpqVfdct6Q4ccA2t0+9nKIZDkjlzuGqHtV
         i+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mIuHJU3SfHPl0RlejSUY/NsnmtLzGRCO/6m26262Qts=;
        b=OaUlXmsF2asSGREkue23WjF3slY+s8Jhgo7rjFH6cyGQVYyILf/EBIhGm8bj5A5cO4
         0yB/Oq2phZRMaXL2f2EHs7ciaDL65E9K6zp3+XeGx/Hv2pwF0joGJdLdmvZ2O9PT8REU
         ePELm4YIIlRkfzsaIuuuzS1F7sHJuwgqwvY6ivXr32LD135kDL9Apjvlk8CttqKj5+CT
         wAgyPud+z2N6J3Xf/GePT7iI09SYmMERgv8nCYgW2Z7kWNPEfyszhNFTVAw62aZ6V5d5
         N/B3guM2MJocHbUqag7BjYHrUcsCnDrl75PIO2aFbuStkz7gikV70e3jbpjgtO+B6Lt2
         H74Q==
X-Gm-Message-State: AGi0PuYqzC1WH5vf7uEB4kzmUfJSiyrY7TUXNIaiabnnkqArSyuirekW
        z+kcm/UV4TRP38QNdNqBohNbQO4F
X-Google-Smtp-Source: APiQypJ/PhT1DuhOzdGayhmjuvx7BfUu8iIXwu5yKcUo9HfxYkFcMc39UJZac+fPMA3r6zKqk6lcdw==
X-Received: by 2002:ac2:5474:: with SMTP id e20mr174444lfn.200.1588276069158;
        Thu, 30 Apr 2020 12:47:49 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id k6sm471090lfm.91.2020.04.30.12.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 12:47:48 -0700 (PDT)
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <34a49a30-71f2-5b24-20a4-7d98ae37cefa@gmail.com>
 <1b23178b-0e5c-c97e-434c-f9cc3c02805b@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ebfb532b-bcd2-f356-49e0-e4d72d0db933@gmail.com>
Date:   Thu, 30 Apr 2020 22:47:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1b23178b-0e5c-c97e-434c-f9cc3c02805b@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

30.04.2020 22:32, Sowjanya Komatineni пишет:
> 
> On 4/30/20 6:38 AM, Dmitry Osipenko wrote:
>> 30.04.2020 01:00, Sowjanya Komatineni пишет:
>>> +/**
>>> + * struct tegra_csi_ops - Tegra CSI operations
>>> + *
>>> + * @csi_streaming: programs csi hardware to enable or disable
>>> streaming.
>>> + * @csi_err_recover: csi hardware block recovery in case of any
>>> capture errors
>>> + *        due to missing source stream or due to improper csi input
>>> from
>>> + *        the external source.
>>> + */
>>> +struct tegra_csi_ops {
>>> +    int (*csi_streaming)(struct tegra_csi_channel *csi_chan, u8
>>> pg_mode,
>>> +                 int enable);
>> What about to split csi_streaming() into csi_start_streaming() /
>> csi_stop_streaming()?
>>
>> This will make tegra_csi_ops to be consistent with the tegra_ve_ops. A
>> separated start/stop operations are somewhat more natural to have in
>> general.
> 
> vi ops is for vb2_ops which has separate start/stop so has seperate
> start/stop for vi ops.
> 
> csi is subdev and csi ops is for v4l2_subdev_ops which as s_stream
> callback only.
> 
> So, created single stream function for csi to match same as subdev_ops.

It will be nicer to have separate ops for CSI, regardless of the
subdev_ops. It should be okay to have a single-combined ops if CSI
start/stop was trivial, but it's not the case here.

For example, the pm_runtime_put() shouldn't be invoked if stream's
stopping fails. The stopping can't fail for the current code, but this
could change in the future.

You could make csi_streaming to return void, telling explicitly that
this code can't fail. Then the combined OPS should be okay to have.
