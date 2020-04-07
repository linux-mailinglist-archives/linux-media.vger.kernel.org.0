Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6711A161A
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 21:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgDGTjG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 15:39:06 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40492 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgDGTjG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 15:39:06 -0400
Received: by mail-lj1-f196.google.com with SMTP id 142so536039ljj.7;
        Tue, 07 Apr 2020 12:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zLcAPrdHJTiOlU+Vohv35MeNqZnxV8vWIz+r7YmHilc=;
        b=LM3rAhtTTjnkZ1iIh8WZemFvYAu0N5VIhOLI9ksG4cpplJmIO55BPNi4CqaJoiRHcm
         ImpGasuoshNZJdpe5Ki+cTs6iyiN5l1rqVfhgcwLB11GtgoazdmRBYgsXQ2AVleCa8SN
         P7XKhpUysj4j1KYsTzSnmWvMPBGPCuja8MKm8xR8SpM56HxiUVYvGDxgw6juSEqJ7q/i
         pr7y7b2IRBkmr9iHJ8kX/rBYt5QpA4hA2j4iUXFOIwa195gcWI6Nw76siqZdWMlXb4CD
         r5yFv2BOkbpn2XJuM17H6zNV3JtE5532XAlQovkoYHVqvRyptPDpFH4mgC6NnmNfpJK9
         kD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zLcAPrdHJTiOlU+Vohv35MeNqZnxV8vWIz+r7YmHilc=;
        b=ITkpGE/uBLw3voBISnxIHOCdqNYbbM1Yn9mWh4PVnAzyhqJwKynrbS0l+f4B3vOyQH
         8pEcxaJxqjTtT1rbLQYvoHJUhufOK/44w6OWjAvN6ARvcN+CLMc0aO9+MeOpQkCvtmOl
         QrtCnRLjSmF9KFgJ0YXY+N5uDpDtsnYn2GIP418+sEPwQKOaHFAPnPAFAYV2Mcb5ZDQP
         Czw03VR+SIF84J8vPct4Qv6IrHH/BttJzhUkxSLLe4tgjGNtANFaEfc8IBDNSWqbX6x6
         Jx65cerUSJL6qq0L7v75vqSg/zYrUXlFHY5+mmxvEMJ4nWrEnynSUACRHuWnqvVk/Sru
         mY0A==
X-Gm-Message-State: AGi0PubfUP+hN9FTpRX0rGk5NSrfI4Rtg6EiOmeBkeiaT+dz2N2g/w8V
        tRCPaZV02SWOgpmLAwdiMFDk5jTd
X-Google-Smtp-Source: APiQypIGjUsAGDXlzydI9bWO6M0/Yuew5+4My4ojzFTz6EdfIqkgZW9wbFZMtjvZN5qigbULI1yT7A==
X-Received: by 2002:a2e:3c0b:: with SMTP id j11mr2803432lja.9.1586288343010;
        Tue, 07 Apr 2020 12:39:03 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id f26sm12187680lja.102.2020.04.07.12.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 12:39:02 -0700 (PDT)
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
Message-ID: <430efa4e-5435-7e2a-fe07-c3a0d0dc967e@gmail.com>
Date:   Tue, 7 Apr 2020 22:39:01 +0300
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
> +static const struct dev_pm_ops tegra_vi_pm_ops = {
> +	SET_RUNTIME_PM_OPS(vi_runtime_suspend, vi_runtime_resume, NULL)
> +};

Aren't the suspend/resume ops needed?
