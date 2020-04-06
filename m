Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58AE919F9DA
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729376AbgDFQLh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:11:37 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35729 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728707AbgDFQLg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:11:36 -0400
Received: by mail-lf1-f66.google.com with SMTP id r17so8755304lff.2;
        Mon, 06 Apr 2020 09:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qhOUGpjPKASmxoCysFaxbtOB2AHvvFDFpDiOJXOBlNo=;
        b=UrynkiAylxjENx/BTXAnxsXfsPXLlbFbVf9NAYsIXircg3qbDqGgXpl0Agz7FjWxYV
         o23532+gFX5nUrvt45ZV+JltPlf69OMbNpqjzTuosCOt+1TThYRgyYXYgYMkj+bUQNsG
         C69GB+hmlKc3cCgePelBhWBhuChb5+qwFpoG4xSqLYRjBNPx6x+CFL965NRxL6Us8zd4
         Wf/pi01y6+iKV4sj4gOGgXO+LjmCb6gg+SeknB1wc28TVxBs8RbprSXCBwbecK0DCmuy
         PR1s0hQt4uSC473SJAESyeCrMUqIFMusJ/MdF888X8m4l9XMR0JNA8DN1/oIaDaGHcDb
         w/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qhOUGpjPKASmxoCysFaxbtOB2AHvvFDFpDiOJXOBlNo=;
        b=SyVsXx2wOx8e6TxCr7c4OkNuOUldRLwD8Z5UcQzotf3BSofN0+UaVW3ir/sPbcY4yY
         rSTbBJNEsDm91I4LlOgSDKnXMxl9brXyHwsl4gJuTG4B3FJ123pXCWKOmj9gwOy9r8FQ
         eXLQXCLorQjFY61mMwXKsA6KMgJKe9RxTvqstbcRDpJVeCgCPtO8m2LeZwT5Xd2Wiyct
         leNygLt8hyJDUvd9OFOmVKOEZV3YpS4UITRSXHPRj7hJ/Q+nVKdaTFkvKQaYwilEKZ/6
         gN8KtCa5FxOD9KHG3h67I8igd0HsD4vANE/nNnYdUfSEv9AuMqXIs5FuesBY1wBcaLed
         BXZw==
X-Gm-Message-State: AGi0PuZFjZi1OYxPf1OvTmPLtMfiWqHeROEBCaLGnXMYkH92axsYZqSo
        nea+beupW+tVkcZQoaP8eTCrZTG1
X-Google-Smtp-Source: APiQypJjSmNNCPDM8/uvaTTUFwGwmlSABQOaKn62Vzpr2BzuKzoLuemeS08xNpG1PBcFQFtRQNlQHQ==
X-Received: by 2002:a05:6512:686:: with SMTP id t6mr14141091lfe.163.1586189492891;
        Mon, 06 Apr 2020 09:11:32 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id o18sm1360571lfb.13.2020.04.06.09.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 09:11:31 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <40102767-ecdb-e958-66f4-45d11464069c@gmail.com>
 <b7b77258-6309-7ed2-489d-337cf273ba1e@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6014fee9-ce97-7ced-f2ba-82176b8b36db@gmail.com>
Date:   Mon, 6 Apr 2020 19:11:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b7b77258-6309-7ed2-489d-337cf273ba1e@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.04.2020 18:41, Sowjanya Komatineni пишет:
> 
> On 4/5/20 2:11 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 04.04.2020 04:25, Sowjanya Komatineni пишет:
>> ...
>>> +static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
>>> +{
>>> +     struct tegra_vi_channel *chan, *tmp;
>>> +     unsigned int port_num;
>>> +     unsigned int nchannels = vi->soc->vi_max_channels;
>>> +     int ret = 0;
>>> +
>>> +     for (port_num = 0; port_num < nchannels; port_num++) {
>>> +             /*
>>> +              * Do not use devm_kzalloc as memory is freed immediately
>>> +              * when device instance is unbound but application
>>> might still
>>> +              * be holding the device node open. Channel memory
>>> allocated
>>> +              * with kzalloc is freed during video device release
>>> callback.
>>> +              */
>>> +             chan = kzalloc(sizeof(*chan), GFP_KERNEL);
>> Why anyone would want to unbind this driver in practice?
>>
>> I think it should make more sense to set suppress_bind_attrs=true.
> 
> From the previous feedback of patch series, we need to support
> unbind/bind and looks like this driver should also support to built as a
> module.

If module unloading is also affected, then perhaps you should use
get/put_device() to not allow freeing the resources until they're still
in-use.

I suppose that it should be up to the V4L core to keep the device alive
while needed, rather than to put the burden to the individual drivers.
