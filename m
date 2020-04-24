Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B4C1B78D4
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 17:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgDXPHr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 11:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727804AbgDXPHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 11:07:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04279C09B045;
        Fri, 24 Apr 2020 08:07:46 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id f18so10258629lja.13;
        Fri, 24 Apr 2020 08:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eKcdA+dDv3apEGoIEYmiVrw3cgxqfzkbkMuXMV5Wzxw=;
        b=eF/WjjdrpYG8GbJD2epM2jYqVElc8vnk/blaeJGJJUogjkBxOL2LpiQA2uVx6sCmL/
         tyfaa+go+TW1tf8uCnKgbddliwbIp9qStq2D4BXW9ofydEk/Ej5xyCsGaiNwA4V0Xt4C
         n+gl76v1gV4v4eXB4khekXndT1gpL0ixcoNz8ZOSvjlJ9mpkcy/dsO5XTmyUseS9BKy5
         yTTcnR6hqUFkkR+4RBWZV3U+v35cN7wiRCZHFFoUXFjdj+iW9e5j+P7VuNQJArDEfyCC
         RWRDb375SFQHnO6TWGKnJWBwybRlZxTGR9Gf+ex8uKB/Pi2vXtTeoNkb4a/20D57xB32
         t08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eKcdA+dDv3apEGoIEYmiVrw3cgxqfzkbkMuXMV5Wzxw=;
        b=QghSTogBYbzuo2aQSuKdBiykGn04OEVWT6HYMsCQsEihCRrBd2g09c+ZA11oJs5pxu
         C6UN2iNzPlkueFo8WZJqBkYxGaK6etuA3+lYcOygbJzizL8bborcp1htFSpTxiMz4J89
         JmIN/C8STP16aZa53JiUemqNrkhe9LioAJDuJDr8NRquG8zgFYTpU2aiFKzSMTl1Ldn4
         rnhkZSrFsVPGaEZpDYhWlz4t0kw9/k3IVa7cPzL4CJC4LIPMkrMFYpxTEYVXb6ZQlM2g
         Eob9ey1aicG4P2u8b0X9CLAGSZzsAw0ObrLT7y0kP9fKtrSP2/2Vu9usB5HLQw6dKmcf
         ECww==
X-Gm-Message-State: AGi0PuYeIHRDrivbSfHFB8WuoJQplcdHVNJjzo1LZ69njRlnb2CE6MxY
        hIyjVl0bC49aCRqX+1holY07f9KR
X-Google-Smtp-Source: APiQypL5MY2vyLQU+YPqfQ5Dipx5sJ7h9GhaJyKYPeNiMvXVDpt5JK0SL1ZAFqjn9cgFhihxSs6Fdw==
X-Received: by 2002:a2e:8912:: with SMTP id d18mr6334430lji.123.1587740863623;
        Fri, 24 Apr 2020 08:07:43 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id e8sm4395850lja.3.2020.04.24.08.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 08:07:42 -0700 (PDT)
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3155e0d2-94b0-6e0a-bf35-b3560c201039@gmail.com>
Date:   Fri, 24 Apr 2020 18:07:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.04.2020 06:55, Sowjanya Komatineni пишет:

Is this driver compiled as a single kernel module file?

> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
> +MODULE_DESCRIPTION("NVIDIA Tegra CSI Device Driver");
> +MODULE_LICENSE("GPL v2");
...
> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
> +MODULE_DESCRIPTION("NVIDIA Tegra Video Input Device Driver");
> +MODULE_LICENSE("GPL v2");

I don't think that these macros are needed in that case.
The video.c should be enough, isn't it?
