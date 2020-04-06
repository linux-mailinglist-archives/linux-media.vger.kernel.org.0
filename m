Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11DEC19FE66
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 21:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgDFTsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 15:48:06 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36810 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgDFTsF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 15:48:05 -0400
Received: by mail-lf1-f65.google.com with SMTP id w145so490950lff.3;
        Mon, 06 Apr 2020 12:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/big40mQJPZUYL0hhY2GKn9zAZBw853eJB7EhVN3kls=;
        b=lTHkPi9pxKic893EROuyYqPWfUKg2oKaYoWvm3Hrp7vu339wkQ90dFBQYtVP666+MW
         tM2E1296dcsOlp/MpS2ve1zYtQiBXr4oV9yMVIy6tWglZgt9GI1+28wt6tVxzI2amihT
         +CoHVCkSqmGy9yME32O5E/2Hp3ES7aiZYk1NGXGiRZ8Bxc0M7giaNod7wTIKXWa/wPbd
         hHLpcsagFF6EDCQOpb40zIkCJncbSZdlIMpxboFG4pE1LCpxK7xHkArfug6Y5QhVWFZ6
         CgoBCarhUdfyIHN9Lq5rtQeOgz8Dn1ToLhjPA3ubT2LLpVs/xE23QRbC/Wyz475ZhAcV
         gjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/big40mQJPZUYL0hhY2GKn9zAZBw853eJB7EhVN3kls=;
        b=BeZ9L4nNjyH+E/tfp0L9S0yKciqAnv9GoD9lJdQABRUxw2w953F95LiGihOzBPR8By
         Dt3TWuriCCDCZ0Ux2qxkGdcfILyzIu84zNSm5zPfLNblUgza/09da0UMRYGMUTam8riB
         fxGE4KjODOVPM1lPEQxkl6EPa35vXeED0zvR8/0hSRQKVQ3NWKLOTnI9YrBzjNOBhMuM
         SZYDhsHdJ/TvOOiEtLogZDR6KlSjlEBhBYBF85gBgLXDd5tHs6K0l42vF5Yy5gju1TR5
         5c1oPZBpGbztgv/Iv7dr6g8jx1IPy0/nfQt9Ele7WrlBUKoXXlDp7jsF0b+UbBbQ/aMx
         AxAw==
X-Gm-Message-State: AGi0PuZpMGSUuLIkT3KC3Rj1iogJHtpPPl6WOJMa/gjGuDZB3UDvqQ2W
        XDN55qqSrKpfZv7kmL1jNhN7ScG8
X-Google-Smtp-Source: APiQypLc0DzWmpYVQ7ZS0j1d6Qu2tF5kjftU7L0BXVhpviK8HwXpSiXlObhxjZU1wRwK4IKZisBOcQ==
X-Received: by 2002:ac2:4466:: with SMTP id y6mr2394099lfl.125.1586202483170;
        Mon, 06 Apr 2020 12:48:03 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id h23sm8817640ljg.13.2020.04.06.12.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 12:48:02 -0700 (PDT)
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
Message-ID: <0809c1ae-57c9-508e-2959-724acc4ae068@gmail.com>
Date:   Mon, 6 Apr 2020 22:48:00 +0300
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
> +static int tegra_channel_capture_frame(struct tegra_vi_channel *chan,
> +				       struct tegra_channel_buffer *buf)
> +{
> +	int err = 0;
> +	u32 thresh, value, frame_start, mw_ack_done;
> +	int bytes_per_line = chan->format.bytesperline;
> +
> +	/* program buffer address by using surface 0 */
> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_MSB,
> +		     (u64)buf->addr >> 32);
> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_LSB, buf->addr);
> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_STRIDE, bytes_per_line);
> +
> +	/*
> +	 * Tegra VI block interacts with host1x syncpt for synchronizing
> +	 * programmed condition of capture state and hardware operation.
> +	 * Frame start and Memory write acknowledge syncpts has their own
> +	 * FIFO of depth 2.
> +	 *
> +	 * Syncpoint trigger conditions set through VI_INCR_SYNCPT register
> +	 * are added to HW syncpt FIFO and when the HW triggers, syncpt
> +	 * condition is removed from the FIFO and counter at syncpoint index
> +	 * will be incremented by the hardware and software can wait for
> +	 * counter to reach threshold to synchronize capturing frame with the
> +	 * hardware capture events.
> +	 */
> +
> +	/* increase channel syncpoint threshold for FRAME_START */
> +	thresh = host1x_syncpt_incr_max(chan->frame_start_sp, 1);
> +
> +	/* Program FRAME_START trigger condition syncpt request */
> +	frame_start = VI_CSI_PP_FRAME_START(chan->portno);
> +	value = VI_CFG_VI_INCR_SYNCPT_COND(frame_start) |
> +		host1x_syncpt_id(chan->frame_start_sp);
> +	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
> +
> +	/* increase channel syncpoint threshold for MW_ACK_DONE */
> +	buf->mw_ack_sp_thresh = host1x_syncpt_incr_max(chan->mw_ack_sp, 1);
> +
> +	/* Program MW_ACK_DONE trigger condition syncpt request */
> +	mw_ack_done = VI_CSI_MW_ACK_DONE(chan->portno);
> +	value = VI_CFG_VI_INCR_SYNCPT_COND(mw_ack_done) |
> +		host1x_syncpt_id(chan->mw_ack_sp);
> +	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
> +
> +	/* enable single shot capture */
> +	vi_csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT, SINGLE_SHOT_CAPTURE);
> +	chan->capture_reqs++;
> +
> +	/* wait for syncpt counter to reach frame start event threshold */
> +	err = host1x_syncpt_wait(chan->frame_start_sp, thresh,
> +				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);

What is the point of waiting for the frame-start? Why just not to wait
for the frame-end?
