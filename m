Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68A6E191E20
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 01:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbgCYAeL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 20:34:11 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40620 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbgCYAeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 20:34:11 -0400
Received: by mail-lj1-f195.google.com with SMTP id 19so646684ljj.7;
        Tue, 24 Mar 2020 17:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UmzJJ1sBsi/K93++MwxgB1lpuwtWNL5ZiLz4oULTYSU=;
        b=aySC5VtF2Lpz1SCaOxutjcQeJM+oSmgXt7I3r3vBp9aMGjay3IP0ixSC6lKICaiU0K
         Y4jhr8sB3x3mN9ZKHTg5M7dX/fMdjamkzJI7K8bF1W28Gd6JpfDwT3ISFra5loOE9KqE
         9M6H1LOQQvYww1+V0mT641WwD+/pS4f2wSuoJn4XNkeCOLttqQXaTJKBvpLkXsCvvMxi
         VqNdUxnbaI8L/5qp+hm43ww+ZLmqMy+gIlL7Dh7YZesT3e/9EofY0JF40mPn75zz5sBk
         vwn7bPQv2Y/3SGXUNPAFUMv/dm68z3BvDK3erxKBwzm4pqo16CrW0W0CWi5lAfgF4h90
         wdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UmzJJ1sBsi/K93++MwxgB1lpuwtWNL5ZiLz4oULTYSU=;
        b=H2C3Ja2df+eBq7l4Erx5QQ/52g7HoKz5e9LsMlMpH377dSh8YGHG6hWejbwGfgkGxc
         ky4ugrNnRwMdQakvxM9wwb7MAqioQOExOjpJ/g4gaf6cANx9+76O/rBkQ8PSGkOsPYer
         8tdSWFLYU/a9bE8REVjiq7uXGngQALtFQ/pffoY1qHSwfI6DQ9Nkq2gliaWpFsJJFv9r
         q0oaGjdc5AHZ6XBFnEiGINkTrcS0yUJx3jj8EDUez7OZoduIsq513DOdvvW/X/2/6IP6
         9YJ4m0/ktqMklVfGc/xkp8nLekt785JjUGFq6QMzlAZ9QMU+zjW1bjUhZthz4JbljV5N
         twRA==
X-Gm-Message-State: ANhLgQ2N1KUvj1s1gPskoGUvlXLGcdlKXF0Yz4KyqBS7aWBuQkF2+XP5
        FlK4Q4JDDP87wTmQM83smFQPUMh9
X-Google-Smtp-Source: ADFU+vuCxpuw4rfOM+Omo0XN30+J4cvPl2YMt0oWv/u/P6eoWP5wpufAJYEV92UIOYxtWfIn0YJCCw==
X-Received: by 2002:a2e:90c4:: with SMTP id o4mr188845ljg.287.1585096448059;
        Tue, 24 Mar 2020 17:34:08 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id x2sm10601960lfn.79.2020.03.24.17.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 17:34:07 -0700 (PDT)
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8f44e42d-2008-fe53-f4fb-b57502da91a8@gmail.com>
Date:   Wed, 25 Mar 2020 03:34:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

23.03.2020 20:52, Sowjanya Komatineni пишет:
> +static void tegra_channel_vi_soft_reset(struct tegra_vi_channel *chan)
> +{
> +	/* disable clock gating to enable continuous clock */
> +	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, 0);
> +	/*
> +	 * Soft reset memory client interface, pixel format logic, sensor
> +	 * control logic, and a shadow copy logic to bring VI to clean state.
> +	 */
> +	vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xf);
> +	usleep_range(100, 200);
> +	vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0);

Is it safe to reset MCCIF without blocking and flushing memory requests
at first?
