Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA4451B89F7
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 01:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgDYX0C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 19:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgDYX0C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 19:26:02 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B9EC09B04F;
        Sat, 25 Apr 2020 16:26:01 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id u10so10765112lfo.8;
        Sat, 25 Apr 2020 16:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/jw/1D+GGEln9SrW+XCVfxjT9M41jB/QZVTrC66fZqA=;
        b=R4zw41r/oZxE/7yhjWkZE2pGdlLUlO4KvSs7lezZqupEfRt2S5+y7Rx/OQ4dR6CD2u
         cb6RiNMgypHQRYKewq/qK6umZX6ieNxGforzCQtaLnBq4vPKGiEiseSFYjdPY9GKJcQC
         9UbmHyUycdG4UN0ja8o3ophTB6f4zUfdu3lVSdKuw7ruTCNfqF+5JcRTPRYzLqAeapUE
         wSY1LFsjRjWzwS9iXRqWrRnPnNhLhiaJ7QW/Rem6+yVbCx2b7Bu18NNcpcTpQ/Q2mhoi
         wdhNwx7qw2z8zyACro3ANUs0zroAzSg+eQQwonE6NmohpxP2WIn5iJS3O570ntzTAixT
         AFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/jw/1D+GGEln9SrW+XCVfxjT9M41jB/QZVTrC66fZqA=;
        b=YPnLsU/t2s4XgSrJqte3IlJnLnCLFzya0LkiCLm1xtMfH+pXUa9DRnWXPNoTNEcVhH
         L+aGnD00lxKTAXKiBxtmQf2CwF0xRSMWgWxA1ldiDsH6YHxBiEoDqK/Naay5XTTx66d3
         juTF9VKRbCO5u20jRjUGvb75um8S52s/psq+yRKu3ZnjZY7GqszYyj4iNot93jvY36KS
         JjH0kHcprq7PVsTJ8KpzeUgOawx81vk9cmIG0aY7HJdwgZwWGuSVDHpop9aM7N1cuhK8
         vP1emjuEGmlYwGHbsF2uqZjmPvqqFYYLhiaOilHm3BLpmxWfXLTg2y1gFUdC+0SUFYt9
         PlLA==
X-Gm-Message-State: AGi0PuaQVFeZP1cmZF0mYo4kBlNFpdlXAKb7Ku/cOT6KfcpdiLpF58tT
        dtEKajBUDH6MWFr38C7Wwb3kleie
X-Google-Smtp-Source: APiQypIdxkV1iQ9K4fzuVqyXoMNdDMxa/LeuR/nRA9XrfyQKnfymHu+I2YwWuAj5Oaes4LufrDT/xg==
X-Received: by 2002:a05:6512:304e:: with SMTP id b14mr10189185lfb.119.1587857159926;
        Sat, 25 Apr 2020 16:25:59 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id v8sm7590902lfp.85.2020.04.25.16.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 16:25:59 -0700 (PDT)
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <fd5300fd-33af-babe-95d0-9669b66a8c06@gmail.com>
Message-ID: <2983577f-fec9-f24c-0563-6d1f0e1dd5d8@gmail.com>
Date:   Sun, 26 Apr 2020 02:25:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fd5300fd-33af-babe-95d0-9669b66a8c06@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.04.2020 02:13, Dmitry Osipenko пишет:
> 24.04.2020 06:55, Sowjanya Komatineni пишет:
>> +static int __maybe_unused vi_runtime_resume(struct device *dev)
>> +{
>> +	struct tegra_vi *vi = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = regulator_enable(vi->vdd);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable VDD supply: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_set_rate(vi->clk, vi->soc->vi_max_clk_hz);
>> +	if (ret) {
>> +		dev_err(dev, "failed to set vi clock rate: %d\n", ret);
>> +		goto disable_vdd;
>> +	}
> 
> Isn't setting clock rate using assigned-clocks in a device-tree enough?
> Could you please clarify why this vi_max_clk_hz is needed?
> 

In that case it should be wrong to set the clock rate in the RPM
callback because RPM works asynchronously and RPM may not be suspended
on TGP -> sensor source switch.
