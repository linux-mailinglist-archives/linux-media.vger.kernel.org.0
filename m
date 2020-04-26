Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4321B8B19
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 04:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgDZCTn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 22:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726087AbgDZCTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 22:19:42 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50BBC061A0C;
        Sat, 25 Apr 2020 19:19:41 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id k28so10918362lfe.10;
        Sat, 25 Apr 2020 19:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BWBm7/mVEXhWuPVxLsh6N26LOmhjPIMhMvd6hBXqCfU=;
        b=kHS7cMNq4luW+Dv12Ull6rhXLP8u1mUKeYWf4a9eHUftTkPKfkSTaJU/ba+zrefdpj
         VF2FOHEUzMBRJq+yeRuGdQNOu9ayMtrJjslLsy+1dhRRMmEBDPuWH+1zoiGcbqJbjhGM
         GfJWJCSZHsruZIiN0Z6Sj/Zgwqv4nSThbz8vbceGiNtBKXw5FKYqaG6lOohkAK7OkcAv
         Ma1YRsvpZNR2Qyit/kvL9I15jUwJZbOJ2EqXdsNUhWfk/Io2H2bwsM7rJsADulBiYXvU
         tERTwxsgEUGMuenrSGwC7unQmXMCoxINzx+9P/iaVfjgg3dFLBlfCesgPHT928Pd6JHj
         lwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BWBm7/mVEXhWuPVxLsh6N26LOmhjPIMhMvd6hBXqCfU=;
        b=B2mi2P4Mb4ftczRff4ytt7HYnHOx+v8mMhvnbjqfR2MHZP/3ASgx0v5lZZLenynA12
         HDEKIZIIPHpWgob3d14fEFdW3iaqmoOlkAiX0Twg5jRvPE9CEdav5Dk+o3v41qkro+oU
         ugAuMjxFO0UrvBnN52OYSJ6DkI8bes2k+FcQ72c4Q9+C5GC9JG4GBFtx1ZIjxNaN9lgn
         l2Nw13fo7V9VbEYX2enLBYFcU8GFJ+TDtaZQjK0s/IfxAjHtU7PVXiJM0pqsBC7H+Wjh
         Yb/HSgUsX7ESwIqH1EZ2lX7UmYmAUPcczpoQMx6RIMj5xVuzkb+vfZV4DSpGfw9R03aF
         mTkA==
X-Gm-Message-State: AGi0Pub4NAbxfNlFx4toNgkbDf1Bkp+vgokKi5XuHjK8hWwxuxMm/WvF
        EBT76PaJNKoo4K5vvhZYjH/J1Bu/
X-Google-Smtp-Source: APiQypIIxxRdfeo5otCtYYxQleaZuzDb4kY/HNsRdUV71uYhG5rPdIMCDsU5BdLOfKFFBtQFEgHqsQ==
X-Received: by 2002:a19:a411:: with SMTP id q17mr11374733lfc.214.1587867579759;
        Sat, 25 Apr 2020 19:19:39 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id j22sm7061153ljh.107.2020.04.25.19.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 19:19:39 -0700 (PDT)
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <6ca93ff9-ca59-544f-767c-4355d01a5c20@gmail.com>
 <62546d1f-eca5-06be-2bc2-e45ccd53830a@xs4all.nl>
 <50fd1016-ca8b-ec5d-e5a8-f257138b152e@gmail.com>
 <658c4232-94d9-3051-8c93-bff7046cf5f2@nvidia.com>
 <03426915-25ea-69b4-bc64-f87f3046d33f@nvidia.com>
 <aabaecc4-3494-0137-7d2b-853304bfa68b@gmail.com>
 <09f20441-fec6-7496-2edc-c69db535e441@nvidia.com>
 <61799fab-858c-8b0d-ba7d-846cd041e044@gmail.com>
Message-ID: <99a5c82a-bd84-5c80-e6d7-7b6f2858aa78@gmail.com>
Date:   Sun, 26 Apr 2020 05:19:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <61799fab-858c-8b0d-ba7d-846cd041e044@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.04.2020 05:10, Dmitry Osipenko пишет:
...
>> currently other Tegra host1x driver (drm) also does similar. Single
>> module for all Tegra SoCs.
> 
> DRM driver has a proper separation of the sub-drivers where sub-driver
> won't load on unsupported hardware. The tegra-video driver should do the
> same, i.e. VI and CSI should be individual drivers (and not OPS). There
> could be a some common core, but for now it's not obvious to me what
> that core should be, maybe just the video.c.

Maybe video.c csi.c vi.c could be moved into a separate module, somewhat
like a common driver framework. Then the individual CSI/VI drivers will
use those common helpers.. Just a quick thought.
