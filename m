Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 397251BF9CC
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 15:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgD3NnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 09:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726577AbgD3NnO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 09:43:14 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91729C035494;
        Thu, 30 Apr 2020 06:43:13 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id l19so6508358lje.10;
        Thu, 30 Apr 2020 06:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A6YpIeXRQ3oa6pHUnqjGa6cFyQysn0a0+/4OldnV7wc=;
        b=NlMK9W5m4IrjAVP/UBA9HRX7+gBleYHX+FLGYqR8aidm2COx+iIfMluQMCW7CTLV3F
         JFHRrUlJjgrBclgNWmLhXuRws8+pVHitwE/W1J67DLM1ZqFhSoWfBpedb47/RBpPPZX0
         SVZws+ERwzguHh2vdhonfG0YQUCvlEqrlUbsXFcsPhDd4C5ixp8KeJnvesj82o2kEVLg
         6wuVc/QKj0mHwxp2J2tD+MprigE4iFM3S0xA/uqYV0bsJj0tA7a1cxV/vC0z77+sTpFK
         WhFodDLaFR5ePQ6uumzITOrPCFjHucmvUJIEHYnWi9kAK2iizMTHQrE9Kg5uAodq4gja
         SmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A6YpIeXRQ3oa6pHUnqjGa6cFyQysn0a0+/4OldnV7wc=;
        b=omRTGxERbeN8Z4zNXQQKwbbfucV0C0ICT9jmCrRP2tyQE0K2hLqQaS1HsvkBx3BvJ3
         56GOVudwY7Jj9XEG2NT/jb5aMNnN60yIrwadN956OykbSIjBS57NpELr3p6n/EmD7uIx
         q6Qxh0HDGR31W5dhfLXw1QljyDI6EZ/hOP4dpGzIQeVfOS0RZYw4kqADXU2Pcn78F/8N
         WV4EKkjPirNuWkiIVdzD9ICyOyV6SbjI1IYHKo93Y3+lv3aHUx4GAtFThFV8O/p9RNpT
         2YhpF2dTP9yUDpCjlR7HfvFFZoRMJiFS3zA94D3gb8m4eifA5GrPhMJGYYGyb5NH0Ex8
         hmlQ==
X-Gm-Message-State: AGi0Pub2NdRoeqWdOqDCBfYgImD6xtXy68wL9v1zhE6TpT2turDGoIbj
        u3NnFtjzGzfVD+PEeHXAP44PLnXZ
X-Google-Smtp-Source: APiQypLu4E1H7UuvzOwc6X6QOCGTmpm6Y0rl0EDyrOXLiRl67uwW+l1xjxt9ugjM78meqa0X0aNI8A==
X-Received: by 2002:a2e:9d8c:: with SMTP id c12mr2409610ljj.67.1588254191854;
        Thu, 30 Apr 2020 06:43:11 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id j24sm4389258ljg.60.2020.04.30.06.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 06:43:11 -0700 (PDT)
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
Message-ID: <5d559a5a-ac84-f128-ccea-270974560b58@gmail.com>
Date:   Thu, 30 Apr 2020 16:43:10 +0300
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
> +void tegra_channel_release_buffers(struct tegra_vi_channel *chan,
> +				   enum vb2_buffer_state state)
> +{
> +	struct tegra_channel_buffer *buf, *nbuf;
> +
> +	spin_lock(&chan->start_lock);
> +	list_for_each_entry_safe(buf, nbuf, &chan->capture, queue) {
> +		vb2_buffer_done(&buf->buf.vb2_buf, state);
> +		list_del(&buf->queue);
> +	}
> +

I'd remove this blank line to make lock/unlock block more human-readable.

> +	spin_unlock(&chan->start_lock);
> +
> +	spin_lock(&chan->done_lock);
> +	list_for_each_entry_safe(buf, nbuf, &chan->done, queue) {
> +		vb2_buffer_done(&buf->buf.vb2_buf, state);
> +		list_del(&buf->queue);
> +	}
> +

And thins line too.

> +	spin_unlock(&chan->done_lock);
> +}

