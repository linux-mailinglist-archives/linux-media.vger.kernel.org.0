Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 056F319FEA7
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 22:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgDFUCs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 16:02:48 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46939 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgDFUCs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 16:02:48 -0400
Received: by mail-lj1-f194.google.com with SMTP id r7so1051076ljg.13;
        Mon, 06 Apr 2020 13:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pR0eWnTd5h7tba4NE5cOqCpOayrnfqSpnnxsMjP0HDE=;
        b=S9IVqKB4cSk/XdyKILImMyvUQLXGZ2R5LA0gSzR07GIJkUPz3uDqjV1VOE6ec2GH3e
         T/14RAtL4JDD9Nn757zQb3y2ByFxsPsKAz6uU5HHfEblbPvafBdX5YrU5bdQAiT85Jaa
         ECId3pdWD72nu8iaOc7YBUCkB8kXcnC04xN7aSHY5h7RIZSixm5ljFk5nGxsbyQhK/o3
         bp+N0BilawMlJhoGJIYJEl2GbpC1QGpEvNB1Lg/AOX6QWW6LevjtFCN4CQB7siQ5T/UF
         9FxUCN7JfWjhMCBUrrgiJCxBvsdW5cIKSrucX78gLSSHHjLSG6nLmJE145F9EN3Sq/Mf
         3Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pR0eWnTd5h7tba4NE5cOqCpOayrnfqSpnnxsMjP0HDE=;
        b=ssafBhr3p54jQPraZz2EOKWGRJX9VdrEmMQmENsGMCd4F3ZK0cvm2gu+QWlrJWDTk3
         OThBvRfJHZpioCOSuwIjZa3J3w4Jr9Eea2u5HGBeEVJcvITvPafk/Toh0M0noEkf+P96
         WwYG3t6DOudqw1JzdngzZvG1O9+g9MAUVV74kB083WUYlnjsk0rCoyjvA2reB6i5Vl2N
         yN302p6GMp9oq6h1hAPZGCdV3lTKcH4LWdByQ/fAea2f4e92Vftp+kdsIvSG6wWxfrP2
         ljFDn0//A/L1qN/ERWV9PZMr9Q38C6R+z64lkG1HBVHU/uP+plYAYTt0nCThfE7l+qxf
         VrGQ==
X-Gm-Message-State: AGi0PuZuSD4v8P5mNFek6dHwIZb8H8DQGLjJ4sMZhGdjJDOuiW/EpU6y
        glwPflLNAOdFauXcGDwSGfiCQ64f
X-Google-Smtp-Source: APiQypJ8NvRj8C6S/AYBn0Qn7QsGzRpw9wydKuVLHtytJfXqR6C+5dok3IO2ghOEUX4n+r4jgXuHfg==
X-Received: by 2002:a2e:9c8:: with SMTP id 191mr544920ljj.259.1586203364265;
        Mon, 06 Apr 2020 13:02:44 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id 22sm10489766ljq.69.2020.04.06.13.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 13:02:42 -0700 (PDT)
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
Message-ID: <782c8c4e-f5c2-d75e-0410-757172dd3090@gmail.com>
Date:   Mon, 6 Apr 2020 23:02:40 +0300
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

Is it really okay that list_empty() isn't protected with a lock?

Why wait_event is "interruptible"?

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
> +
> +			/* dequeue the buffer and start capture */
> +			spin_lock(&chan->start_lock);
> +			if (list_empty(&chan->capture))
> +				break;
> +			buf = list_entry(chan->capture.next,
> +					 struct tegra_channel_buffer, queue);

list_first_entry()

> +			list_del_init(&buf->queue);
> +			spin_unlock(&chan->start_lock);
> +
> +			err = tegra_channel_capture_frame(chan, buf);
> +			if (err)
> +				vb2_queue_error(&chan->queue);
> +		}
> +
> +		if (kthread_should_stop())
> +			break;
> +	}
> +
> +	return 0;
> +}
