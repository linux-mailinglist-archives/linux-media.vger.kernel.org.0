Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 640A11AA9D7
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 16:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636592AbgDOOWs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 10:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391838AbgDOOWn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 10:22:43 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A7DC061A0E;
        Wed, 15 Apr 2020 07:22:43 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id r24so3885989ljd.4;
        Wed, 15 Apr 2020 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yzzMWqy+OD4Sj0S39fbp3R3eS6fFNXX/dFDozNIagPM=;
        b=KWTAORPrZ9yvy2jm6Ap6fsX3FfC6VKBcC0qtVLW22TSIvQGUqfa9ZFqAE1mcQI5H27
         sh6X1jq0IReze++5Oioq6uIiLMUIygFHw82W/+Hsa1RBWVla9KHhjQmC6YGjkZOnEzPh
         WzMtMStHr6tzuj6G3d9NYhLE18RqLXCBUlF038DeYkEG6h9tH7MT8Zn/BdfWGmXw2TWp
         68GzOO8BYt1H/L6ZWeKsLsGDme7/cJAhnGR8Mfr0fTC5bMYBlQiLut+VJGwpN99brNwm
         CKo3+PYwpg+ra/MJdYYMgEdlxKZ3SqYAOR9wFyYdNz26ECLZxIT46/U4VsLTPvBPij5x
         g/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yzzMWqy+OD4Sj0S39fbp3R3eS6fFNXX/dFDozNIagPM=;
        b=eqcEd8t9S4UrhaHvDFFlxnSepII/TRx2aYQ480VQkRB5oAZF4uJZs/vDtgGR+edlBE
         ujTc3LdgLphmGbhEm55gLS/l20pQGFvB74eMqLEliUfeDSLnvukfN3/6atj+eyZHqiP0
         MTI+UR7mZ6g2I7y629Uiehxv6hpEYe0oH+BI3UYIGqrTiac/IuhfCXH7gMYATJfEXAoZ
         TR/8y76Pydc8c3ShEJgv5P2b3HTzTHc/G+Yn9gf1dGOtgGiWMkFZZoTt9xrpfTozagBe
         fcIapmI4Iq6b8uYftwus7eOkrJy/Lc18rY7t6V9bZQ3bYnJ0gRsUISPvxiwhHEUH8XFc
         vj6g==
X-Gm-Message-State: AGi0PuammHIfVcMMRN5yT6mZhTGYeXLwyqAt1TIoLmKOKIQY1Avbh7GG
        W6BZTFIO5pIh4s48OcixHOB+W3kp
X-Google-Smtp-Source: APiQypLMYU1bFrRYsDqjdUgL9OS1QiNz+30o8kG5V5EZ+R7+XtORGUcbqKGG7ZBWbfUmpihoYf9NZA==
X-Received: by 2002:a2e:2245:: with SMTP id i66mr3534404lji.191.1586960559886;
        Wed, 15 Apr 2020 07:22:39 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id o17sm12834558lff.70.2020.04.15.07.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 07:22:28 -0700 (PDT)
Subject: Re: [RFC PATCH v7 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1586919463-30542-1-git-send-email-skomatineni@nvidia.com>
 <1586919463-30542-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4118112f-f865-5460-6319-d71271fd78d1@gmail.com>
Date:   Wed, 15 Apr 2020 17:22:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1586919463-30542-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

15.04.2020 05:57, Sowjanya Komatineni пишет:
> +static int tegra_csi_remove(struct platform_device *pdev)
> +{
> +	struct tegra_csi *csi = platform_get_drvdata(pdev);
> +	int err;
> +
> +	err = host1x_client_unregister(&csi->client);
> +	if (err < 0) {
> +		dev_err(csi->dev,
> +			"failed to unregister host1x client: %d\n", err);
> +		return err;
> +	}
> +
> +	pm_runtime_disable(csi->dev);
> +	kfree(csi);

IIRC, the driver removal is invoked on the unbinding. Hence, I'm not
sure how moving away from the resource-managed API helps here. Could you
please explain in a more details?

Have you tried to test this driver under KASAN? I suspect that you just
masked the problem, instead of fixing it.
