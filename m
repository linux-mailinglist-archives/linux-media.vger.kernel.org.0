Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F010723E5DB
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 04:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgHGCbg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 22:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbgHGCbf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 22:31:35 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F59BC061574;
        Thu,  6 Aug 2020 19:31:34 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v12so533634ljc.10;
        Thu, 06 Aug 2020 19:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=++oNzzvMfEEwXBvsmOev1tS44REi+Mnxj7YfwgHFlPM=;
        b=t/NHzZGzCIO85kYp4Vf0XtxJ/jZYzQTIh1TVK9lniUhpbhgwazniKa9EGAQvCY7G11
         F0+fi4ZJH/zKfXWLkjPn47ZnJQlQvxX2yM2E9NVwz+k3/Eqr2jZKfWOYQc/cjqqW5Psj
         BXHQHAEscJ4KIdlGNu5P15lw0uJdoxnj3VeZummui/RX0MyGFUY6jTbjXyIzYRm4hpLD
         YWbxYmP010cQjSTuCxM21CbAeHD5M8hwT2jKC8mU1QCQPbJMOLb0oshVvgE9QnRoR8Go
         e3gcBoQmW3XUyrNSOxevg5KpZtPaPLmGATyz/jFDjB6vvFzNwfm5ExnZCqcJnB6YTipt
         8z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=++oNzzvMfEEwXBvsmOev1tS44REi+Mnxj7YfwgHFlPM=;
        b=N4Yd4uAifxtck6Z8tSw/zyo0xjWtL2sGrEkfbJNv2DmPe3Ccetmg+jNzJOY2goXjK4
         GGwCeEt1hFBImp8tD00ruQVdk9eSxDJ9NWdHUh4T7htcXzIcWCfGNoVxIXYHd/2+LxIn
         Tv59HYXbBsDSD3XCxW33/mCyDM5O9GLWfsOBnhsrcKvkt5LD2yhxAw5UgyXvvGIlpoep
         bKulKBzKbShtWc76NJpRi/Iqi57+0PGOsL4zf7XX1dQ4Mt1kQX9twi3Lkey8B/hv9PPG
         ZPz9cQlTI0ISY489skTlrZ/Vc/h9/5+diGS1OlVB4kNvX0O0Ymm7s/Nt8aDDETolX3pr
         itCQ==
X-Gm-Message-State: AOAM531tuFrlAX4MSUTGK26tEorz+YixjUhsQJumxbWj96PW7jyGMfCq
        kdcSGRn6E62OyxFnq011Y3IgHT3i
X-Google-Smtp-Source: ABdhPJyiRs9EKEEDAErq/zFize6tXrmF72/UmXwaK1kWK4yaZSOmuV3B1zf1qxncDuma82JUjUcOVA==
X-Received: by 2002:a2e:9d17:: with SMTP id t23mr5184250lji.456.1596767493010;
        Thu, 06 Aug 2020 19:31:33 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id q24sm3195272ljc.52.2020.08.06.19.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 19:31:31 -0700 (PDT)
Subject: Re: [PATCH v9 08/10] gpu: host1x: mipi: Keep MIPI clock enabled and
 mutex locked till calibration done
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596740494-19306-1-git-send-email-skomatineni@nvidia.com>
 <1596740494-19306-9-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f2522713-6995-d6a1-e691-a5443823056b@gmail.com>
Date:   Fri, 7 Aug 2020 05:31:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596740494-19306-9-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.08.2020 22:01, Sowjanya Komatineni пишет:
...
> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
>  {
>  	const struct tegra_mipi_soc *soc = device->mipi->soc;
>  	unsigned int i;
> @@ -381,12 +375,16 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
>  	value |= MIPI_CAL_CTRL_START;
>  	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
>  
> -	mutex_unlock(&device->mipi->lock);
> -	clk_disable(device->mipi->clk);
> +	/*
> +	 * Wait for min 72uS to let calibration logic finish calibration
> +	 * sequence codes before waiting for pads idle state to apply the
> +	 * results.
> +	 */
> +	usleep_range(75, 80);

Could you please explain why the ACTIVE bit can't be polled instead of
using the fixed delay? Doesn't ACTIVE bit represents the state of the
busy FSM?
