Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6BEB1BFAEF
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 15:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbgD3N4t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 09:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728885AbgD3N4s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 09:56:48 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966A7C035494;
        Thu, 30 Apr 2020 06:56:47 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 188so1281687lfa.10;
        Thu, 30 Apr 2020 06:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3gswp6hcYzQc3s447UZL4JEqcj83pPEFgQbY9aLBIPE=;
        b=XDiRg0coz1JSo501wpD7JZHgkWVAmnY6dM/sDPCrf1o6il2EB8ZMP4RQ7pUXLVURMp
         POM8/vHxH8TuIX2sLXN+r09H+e+kg7n5VQDlTdYfWlmJ/qQW3sioaud0ngdkWeeW8cCW
         TAqwfDk2mKWpU2+UkHrwr/uSs7fZP+eUpX28wZyEnbRrKV1q8xuU9Zs2wzIjfaDwQpRN
         eLUNu3KB30UDufqPl8kx8K8z0Iis9OcpJQSA5TYrWQ+dl/3u5fSFsyTAKtAdzg4nsaLZ
         XuiZiKQIxtg55yPfKOl6w3YP8/1TLD0wtgl8L6WqG5PU8OD8yyk/XYFWRtCijy8Z95rE
         BZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3gswp6hcYzQc3s447UZL4JEqcj83pPEFgQbY9aLBIPE=;
        b=pXb/qLLw3V9MXdgAhvGR0+5kZ9guLtNYmAl2UUanL6dRJDB6/RaPAfa4Gy7nHfjGkz
         NiO4ieNQANA1VhbccZ7OXLFuwgUEhkXr1dH0F8UQUT3nPrRXPkHd+pkSsEmXJWNr357C
         WND+AmmJZI8W0bLV+aFsOW4cLH7V8RCKJyKNTVwbtYlOY5zfFtYfzygzFxn9rCIAi1Ce
         04KqP73RL7nUOHzCKPvd4LZZtGMevC9aP4pe1FN3mnmiUEFVcOngyVajyENpWG+FZJ9U
         zKHJXkQk/2w3KqmVTdDuN9FzuMLAHKMuOVb9+AQq58MLxs6KVLi9/4NGe4uayYyyy8OX
         U5Dg==
X-Gm-Message-State: AGi0PuaS9+g0pG1VQAkNFAZLywmlybmLxaIU0RdqP8qY+LsQsDFu11tS
        hsPVkazMFIPEb+HPpWdqqxaOJz8Q
X-Google-Smtp-Source: APiQypK46PRL3v3DYR8dl4DeEVpliW6UGYANs3SGyaSLfacl+8hLEH5qKMGOTotKyFCr+Sq00HlE2Q==
X-Received: by 2002:ac2:489b:: with SMTP id x27mr2308645lfc.60.1588255005883;
        Thu, 30 Apr 2020 06:56:45 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id j23sm548483lfh.65.2020.04.30.06.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 06:56:45 -0700 (PDT)
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
Message-ID: <bacc4308-4b95-f566-b80e-096ff96407b5@gmail.com>
Date:   Thu, 30 Apr 2020 16:56:44 +0300
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
> +static int chan_capture_kthread_finish(void *data)
> +{
> +	struct tegra_vi_channel *chan = data;
> +	struct tegra_channel_buffer *buf;
> +
> +	set_freezable();
> +
> +	while (1) {
> +		try_to_freeze();

I guess it won't be great to freeze in the middle of a capture process, so:
		if (list_empty(&chan->done))
			try_to_freeze();

> +		wait_event_interruptible(chan->done_wait,
> +					 !list_empty(&chan->done) ||
> +					 kthread_should_stop());
> +
> +		/* dequeue buffers and finish capture */
> +		buf = dequeue_buf_done(chan);
> +		while (buf) {
> +			tegra_channel_capture_done(chan, buf);
> +			buf = dequeue_buf_done(chan);
> +		}
> +
> +		if (kthread_should_stop())
> +			break;
> +	}
> +
> +	return 0;
> +}

