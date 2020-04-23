Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBE11B6894
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 01:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbgDWXQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 19:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729136AbgDWXQK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 19:16:10 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3D6C09B042;
        Thu, 23 Apr 2020 16:16:09 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a21so5158231ljj.11;
        Thu, 23 Apr 2020 16:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8qJvmaPgFPJLMzlBpUP3e9FdupJ5/GzejZ+T8BwXEys=;
        b=gnA8a2Vgx6uioCmpFLX58qJhmVK19TlagkIB+2WPTaUf15MUkyJ41BmhrQ3Afmj9bI
         AvYygrPnfA6E/yvPbqI4YC38L65vkD9YY6BkVGLVVBx8qzo4nsUiYXGuXBncD/dWQslY
         Fk6Chfe7sHpRjG4lx79QEXfU02cgaLmkiW7VBPRuaa2KiJdptJmTLhYcjhteyW40M6aw
         m2BGG1O7wvWC9+XqkTVFiPZ7uKRt/acY2w/pOwVytTDv1aGQzsJs3OL9zTd92vfNA41h
         3LLPSSTjyae4BmWu7ggMe5daEbcZk39Bv0bz0dXJm9VGnbGJAE4hyWNa+fCt2qOjBiAq
         znWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8qJvmaPgFPJLMzlBpUP3e9FdupJ5/GzejZ+T8BwXEys=;
        b=J9yyvtuhOTB+v3gWs63lx/fe6M3ujJSgTbi6JIuU16uyQDswWCpT5vqO6gltmj4tjP
         QpyK+w1SQevjTPbccmSpNlahYO7qztlk3WuzP/H0P/pYOrLFHYIq/NLOOukHQQs76EiA
         6TElIRC65pmvJUMIQMSQn7e5czbQwBNI8OxplnLMQHkPCwJUFhymnYeV8E8KZNT13VOY
         NTgzlSoaNtp1B926RMszHmD2+6Tr5GFzcItLXG2kRO6dc6iAAZd+Y/Mdg71fv5XXUigr
         x9FeWGP9I6d0m/jvKW95aqgPLUKo3YTmJTYW65z2D3Oi6dUhyue+ldb0buIjjAYFFHnF
         MmCA==
X-Gm-Message-State: AGi0PuY4zEyH2/yB59AhEOf5m9FVpeqMTO4uHtjbuEtEa/qhmQIXQAnB
        /I72yniDwyRz8KZVa99mfkAa8fbp
X-Google-Smtp-Source: APiQypJhoG1u4KBT0Y3dIF1unc2wCeJ4aWSgoyLf6n7IGDCtJ6EDz2jCTp7jf1nKNef4dy5fuTgutQ==
X-Received: by 2002:a05:651c:2002:: with SMTP id s2mr3564032ljo.285.1587683767789;
        Thu, 23 Apr 2020 16:16:07 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id r2sm209644ljm.8.2020.04.23.16.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 16:16:07 -0700 (PDT)
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7e473fa9-0409-d868-e818-2e7928a8acca@gmail.com>
Date:   Fri, 24 Apr 2020 02:16:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

22.04.2020 09:18, Sowjanya Komatineni пишет:
> +static int chan_capture_kthread_start(void *data)
> +{
> +	struct tegra_vi_channel *chan = data;
> +	struct tegra_channel_buffer *buf;
> +	int err = 0;
> +
> +	set_freezable();
> +
> +	while (1) {
> +		try_to_freeze();
> +
> +		wait_event_interruptible(chan->start_wait,
> +					 !list_empty(&chan->capture) ||
> +					 kthread_should_stop());
> +
> +		if (kthread_should_stop())
> +			break;
> +
> +		/*
> +		 * Source is not streaming if error is non-zero.
> +		 * So, do not dequeue buffers on capture error.
> +		 */
> +		if (err)
> +			continue;

This will result in an endless loop, I suppose it wasn't the intention.
