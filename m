Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACA7119FF62
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 22:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgDFUpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 16:45:31 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44912 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgDFUpa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 16:45:30 -0400
Received: by mail-lj1-f193.google.com with SMTP id p14so1196134lji.11;
        Mon, 06 Apr 2020 13:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2TwAK6CIvOGj1m1Wxupnzx1SAQcBc4vTS5R9uhjDJic=;
        b=rAkxhqam2uIBwwk5bUMs5DFLIVzXPiDcnVEO8xu4lgjCDxE7N9DAv35EPx6CDA1lEX
         TCwv+wafC53L9JJciyGTHBfWMXTWc9yLe/7/qUVWePJuYzt0MRs99twMThOCEaH/r5ps
         vPD1l7ehtt7iKAgRGGi7wNqSrzUHFT3lANJzGgRa8IbTgpwmSWJObdPYeTVBKwGCwqeX
         K565HKd/wu9dznMlu1Ib1zQ4rENCztxnQmmDQis2Ngz+IF126hGjQE47WqzSvrlvf1ta
         fQGPgRE4exP9M7YOp+D6Z8F2MtRZq7L2+kd4I1hDSI5IfBxWHjli8kgO/KxShMbQ0yZ4
         iPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2TwAK6CIvOGj1m1Wxupnzx1SAQcBc4vTS5R9uhjDJic=;
        b=QcwVWcVQ693D0tqFkl5xvz6iZuIDizBPE7zkZzOyTu8n6HHRa+lMJ/AoCr+K2dtLMH
         4GJ3BKxRINs1x96pQWTzIT0Uep2IsX4X361UHF0a+ywNtue27tMIyUVS8Z28+ZYKKF5g
         KqouKACqOyUXpm3sI6yC2DoPUZ7mBdAEL3oZ5irfalK7GK1MyF+X0FKAzmsqytOR5dax
         UpBUYrlCTRyEGbWdGZ8IyCjKPzIbOYpnQvA2QHpllVDprsdtdL85+7vsl+E/kjlXmwbk
         NKBlDvlD6BDuxLzbFmIlGJPF7uXf3Qw191AGCINRlJQx2f5lNfNixonnrPg4vVzStT1i
         Bguw==
X-Gm-Message-State: AGi0Pubrqb6UcI0RK18Tunmd68NvfAqbxhVJH/hJ7r8WODM58hWgekhK
        8FFcd5dNOwZL0RIm6Rkor8ZgKrz6
X-Google-Smtp-Source: APiQypLClTno4SZElehZQYVE+lDHbwt+yIw7aDUqIsFsXrMH5fE9MXJV+hbnagr8GItROxrsruhlOA==
X-Received: by 2002:a2e:45c2:: with SMTP id s185mr633822lja.66.1586205926367;
        Mon, 06 Apr 2020 13:45:26 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id m13sm1568316lfk.12.2020.04.06.13.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 13:45:25 -0700 (PDT)
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
Message-ID: <200bb96e-2d07-764f-9e14-55538dc742fd@gmail.com>
Date:   Mon, 6 Apr 2020 23:45:24 +0300
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
> +static int chan_capture_kthread_start(void *data)
> +{
> +	struct tegra_vi_channel *chan = data;
> +	struct tegra_channel_buffer *buf;
> +	int err = 0;
> +	int caps_inflight;
> +
> +	set_freezable();
> +
> +	while (1) {
> +		try_to_freeze();
> +
> +		wait_event_interruptible(chan->start_wait,
> +					 !list_empty(&chan->capture) ||
> +					 kthread_should_stop());
> +		/*
> +		 * Frame start and MW_ACK_DONE syncpoint condition FIFOs are
> +		 * of max depth 2. So make sure max 2 capture requests are
> +		 * in process by the hardware at a time.
> +		 */
> +		while (!(kthread_should_stop() || list_empty(&chan->capture))) {
> +			caps_inflight = chan->capture_reqs - chan->sequence;
> +			/*
> +			 * Source is not streaming if error is non-zero.
> +			 * So, do not dequeue buffers on capture error or when
> +			 * syncpoint requests in FIFO are full.
> +			 */
> +			if (err || caps_inflight >= SYNCPT_FIFO_DEPTH)
> +				break;

Am I understanding correctly that this thread will take 100% CPU,
spinning here, if more than 2 frame-captures queued?
