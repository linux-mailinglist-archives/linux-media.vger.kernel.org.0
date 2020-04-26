Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11C11B8A42
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 02:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgDZATz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 20:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgDZATy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 20:19:54 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF9AC061A0C;
        Sat, 25 Apr 2020 17:19:54 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id t11so10806022lfe.4;
        Sat, 25 Apr 2020 17:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GjVFWEgrL2Ux9uVNk0g7rNZWZJTRkYADX8y42+b1M8o=;
        b=ZC3zrU05fbizWbcQ8emn7edlFo5iDg+TzQvaZFSeyPTgMqBlTrkiO7mfTOWoeR4f7j
         0QTnpwcVxBqJT81DSpxSbXsckT1+9keSn+Sn0K7cO/EojkNs+MYfglPs/Lry42tlHoD0
         RDYstxLxpFSUInviPshcJun4Yq/vA3N+cAh7c0HfDYW9GoR4664ZxL5fjhpxzT1F962+
         8HgVwtVjzr/q695NlphgLfDvLpROaOF203uHLmQ5u9TEMpar8PlzKBvEZiqfijfaqOpt
         8+ZvE3Vqh/LJCFHP4//oo4E7I1dC+rRTmt6r76grtsvlDvhj1fKzeFk2AJcuvJ6FyQE4
         He1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GjVFWEgrL2Ux9uVNk0g7rNZWZJTRkYADX8y42+b1M8o=;
        b=JTyq7qOiqgatlHFQTBOMX4BuGowEqujX4lxgX8hhAbXRzynfXRY5ggunMWzyR3rTuD
         zztHw6KaCz9qcSwJB9PFNNBL1Rz797OmfRFCTbr4zUZBEA8qeidoG6iDl762Lqg8IGMz
         DkwIHCvm2AMJDv9jY2XK5BjZ5EYdV+sq+fxs6J+eznBigZaCFUHLMP23SmYfhGjbS25o
         JFNlmnygoE1cBzcl0rwrGTJVdOaOZ+jYLecGm9hqE++P/VR8TVwwQhm05kR0LBODP1SM
         dq4wvvFUrHYFfU8zm7oF3CGQ1PFfAm33uJHCC+DbzYY2k5UAOTHKN5sFz72pvDyxg0Yc
         qhpA==
X-Gm-Message-State: AGi0Pua1KK2c4VF7HgNIHb+AWMkL459t6irBaQRDXL3mC2yranMtb5re
        KzYjIlV5zm9w3gQi/XAfFOYdei4h
X-Google-Smtp-Source: APiQypJp3zd9qElQgIFq2LZXXZ0IgoR/nbT3O3ZvVJESf2+voOmGINtB5DUPQaJyHcUCQzzka0sfdQ==
X-Received: by 2002:a19:3848:: with SMTP id d8mr10665209lfj.44.1587860392392;
        Sat, 25 Apr 2020 17:19:52 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id g6sm7016432ljj.78.2020.04.25.17.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 17:19:51 -0700 (PDT)
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <3155e0d2-94b0-6e0a-bf35-b3560c201039@gmail.com>
 <fffc09d1-a25f-2d6e-83bd-f7657dd2ff16@nvidia.com>
 <e5602c48-a73e-8e71-188d-6a53ebf8e4a4@gmail.com>
 <f6d62dde-9ab5-7001-0ff4-93ed70cb207f@nvidia.com>
 <6568af00-3d65-4ddb-f003-7a4161d751a0@gmail.com>
 <f3a122b9-3600-b1eb-be4f-39be79d979a5@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5a6f61c6-2049-fb61-3a80-e729708b3fb8@gmail.com>
Date:   Sun, 26 Apr 2020 03:19:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f3a122b9-3600-b1eb-be4f-39be79d979a5@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.04.2020 02:44, Sowjanya Komatineni пишет:
...
>> How much of the T210 code could be reused by T186/194?
> 
> vi/csi are common driver where soc structure should be populated for
> T186/T194
> 
> Tegra210.c can't be reused for Tegra186/t194 as programming seq is a
> whole lot diff
> 

How are you going to separate Tegra210/186/194 drivers from each other?
I don't think you'll want to have one "fat" driver that covers all those
SoCs, won't you?

In the end it should be three modules: tegra210-video.ko
tegra186-video.ko tegra194-video.ko.

Using a per-SoC OPS doesn't allow you to do that because the "root"
driver will have to lookup OPS' code symbols of every SoC, and thus, the
unwanted driver modules will get auto-loaded if you'll try to factor out
the OPS into a separate driver modules.
