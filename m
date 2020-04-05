Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B44AE19EE37
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 23:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgDEVLb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 17:11:31 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41299 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbgDEVLb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 17:11:31 -0400
Received: by mail-lj1-f194.google.com with SMTP id n17so12521626lji.8;
        Sun, 05 Apr 2020 14:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NWGPhfMJZZel0rwMWEjzRwrt83gzNGV4eDnl95RcfAU=;
        b=eSj2WijVRRdiVl8L9gDAZY9jUY/Fsew/0GhzfAmvk2a8oCD9IzUhxAFvEt3nTYYkpT
         j7SEnDPqU/DnobMg1ThkNVLb+ZhFOiIwZ/XA2Pg6xEWegpN7VA4oh/nbshBOgYVxDJfa
         i/EKxS+uuBdDWrWonhJzIrQz2taHsuxq9HNW6jE1yQYLaDC3iOuHFTh0X8y4stjkJpWR
         RbprIAxyBa51w/UXxC8xtyKWhzG2SppkGDKp/jcSoA1vt5wVEyOep3k6DNL/s0JYYhPR
         B+/gmSfWVMcjJDVbypi3SqUuyLd2e3M54JwZjpQn4TB3MdV1HEuq6Bmwl7CKQapAQNf6
         lcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NWGPhfMJZZel0rwMWEjzRwrt83gzNGV4eDnl95RcfAU=;
        b=n9QgRPLVdUK6X6kujGnrzmEn/g+Nx2AhTLFnrhMo6WLmSFQEI5O93DH2YpWgBjFhcs
         cBXmgfH6hD2yT+UM+Qr73N9gQx90kyVY906Rn+nW+DJ10wgUI7Cs9ScsmRkEWju+UVax
         kmmuRmiOQzY0P0qgC4H5dN7+er1Cqz5GvRxak/25KSPyGPhskViQF2MSOYrnk4GHyHF3
         AhHH10Tb1lFMHGSuM7aqA8MsBp8tYU7ofYwqwGfJ0oaoF0+7ywOP8zvz9Ecisy6SezVS
         Jek4mQ8cZyFEysmaqVXLMLbkpT6ZP16hNpjPLthPhD5FJ781OFlgP6A2daCDywfoyDWl
         hE3w==
X-Gm-Message-State: AGi0PuaybAR9DFlzn4xHsfxer8H95AdnnRKlBRGJ/mkt4tvTpX0AJgSj
        l1QPMQegK/4ds/fOSFb3T1LINbpl
X-Google-Smtp-Source: APiQypJJ7DJEjhUF1T29Imc2SI1iQoEKCcN3jsiwMvcGVreI86biQ8P1kEb9QblNCiD2v5BJwY2XFQ==
X-Received: by 2002:a2e:7004:: with SMTP id l4mr10614949ljc.55.1586121089103;
        Sun, 05 Apr 2020 14:11:29 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id s6sm8971493ljm.58.2020.04.05.14.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2020 14:11:28 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <40102767-ecdb-e958-66f4-45d11464069c@gmail.com>
Date:   Mon, 6 Apr 2020 00:11:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

04.04.2020 04:25, Sowjanya Komatineni пишет:
...
> +static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
> +{
> +	struct tegra_vi_channel *chan, *tmp;
> +	unsigned int port_num;
> +	unsigned int nchannels = vi->soc->vi_max_channels;
> +	int ret = 0;
> +
> +	for (port_num = 0; port_num < nchannels; port_num++) {
> +		/*
> +		 * Do not use devm_kzalloc as memory is freed immediately
> +		 * when device instance is unbound but application might still
> +		 * be holding the device node open. Channel memory allocated
> +		 * with kzalloc is freed during video device release callback.
> +		 */
> +		chan = kzalloc(sizeof(*chan), GFP_KERNEL);

Why anyone would want to unbind this driver in practice?

I think it should make more sense to set suppress_bind_attrs=true.
