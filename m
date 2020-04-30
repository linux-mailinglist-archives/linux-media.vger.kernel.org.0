Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBDEE1BF9DB
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 15:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgD3Nqm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 09:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726577AbgD3Nqm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 09:46:42 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266D9C035494;
        Thu, 30 Apr 2020 06:46:42 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id j3so6532125ljg.8;
        Thu, 30 Apr 2020 06:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gByK1hVIoGmpbKq/K564ocm27XhEcO16Cceo/NwgrXg=;
        b=RuGyAmUMGaCUk0BaYmZOq039/HBT1+/vOb0guZKk8HpZYto9QSJffpDhsVwkdud7Rm
         pUUtLVEGx3P6Vg19koHRdOiI1KFd9zskQU/Ja+uRB0bRu/JUPst4nE90l05qOmTjjArs
         ma+mjM6PQvSKUqlstS3FpFkmzG1L6ZBRtIfBONiZznrmG/uowg51AwpEkkoC9dA0RFim
         Mu4u9bcH0crF0vtG8uebFuyanz5vV3oH3bZTW84a3K6Rcr6ILGzedjQdzK+gr2TAQTPJ
         fyxI6R7fNjaJo5WGQFN7aTH0pdPjrrTpkZkejzKoyYvoSoKNJmcL4Sxfn2AXGua8P1Q3
         t0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gByK1hVIoGmpbKq/K564ocm27XhEcO16Cceo/NwgrXg=;
        b=S7HCaa8SOpugdwqQ048VH3xDUMUCJISC17H2lKVP4bZB5XH5aM5WYw4ughgp3aKDqc
         kF7/60G43LPmiOYxLjeltIGcU5YlwPS26swQwNuTjUAAEgATHTAePcralIqpZouG+uDs
         EyLH7VAseX6KO9cb9X2kIZuQeIWi9zs0F/Qwr8GNVDJH3h9gMI2cNKqQWmzfxC/JvRfu
         t16CvyUjzUtF/KJB1Qzd+wFecL5RYi4quYvraEyO1X9hVziAwjCO06DlyNr6YOMjvC9O
         03y8uhgyv7hSOVaE2Eky4XAMabnwqxqVstIOMnO5qDy7yEuuAORRNsbQsEIWUhJ+PLmh
         oEvA==
X-Gm-Message-State: AGi0PubAotYqeDeDv7WdeJOLSfLQBlUsyKxXZDJ0sR5HiDDvefhTc5ZR
        6WYnrpO78/Jsx4giCgaUn9z1QJqU
X-Google-Smtp-Source: APiQypJWUwti9EK5+POHi+IzMTQqhLMiVMThh/7KFAZyecKiVMN2XH+SR2cfskeyIJ5jXd1GhXWw/w==
X-Received: by 2002:a2e:8296:: with SMTP id y22mr2418268ljg.254.1588254400429;
        Thu, 30 Apr 2020 06:46:40 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id a13sm4411192ljm.25.2020.04.30.06.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 06:46:39 -0700 (PDT)
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ab3db20e-ac9d-0271-802f-dfd99899fc66@gmail.com>
Date:   Thu, 30 Apr 2020 16:46:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

30.04.2020 01:00, Sowjanya Komatineni пишет:
> +/* -------------------------------------------------------------------- */
> +

Such comments should be unnecessary.
