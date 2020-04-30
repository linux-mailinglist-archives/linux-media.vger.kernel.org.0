Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF35A1BF9B3
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 15:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgD3Nil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 09:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726577AbgD3Nil (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 09:38:41 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18462C035494;
        Thu, 30 Apr 2020 06:38:41 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y3so1247305lfy.1;
        Thu, 30 Apr 2020 06:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B+WEF5edk3Tx9yanz1zjhNZZoZVcwwOPFtC6hwTP6dM=;
        b=MLbZulFwsobx2KLyBx9iY3KB/SsuKASOCPvckS4/rEG0YLBxkXcxBOK4JwIrjClClW
         HM9xvsP96epewF1COZ3VhWvXZPn5ce/0+1mtDrLog+3LPgZ+P72mqOeDTEky2sDzw31k
         4UstRsS9T9moos73+h10ZAwPxM9WAUV3ncUMgNeTtZSsPHbcgVZL4p2oQCOdaW0XnJl+
         zUeq5Ekqkf6RD9CS6u6OIhZ2ySvqzWU1cbcukfDv4w+1fJpRsgZ82fL6qkcFWo7sLlk0
         pWljap3l1bBcniTqo4PnxtDZcvyo2dSBUWE2FheFlcHGDsLCtHSw/M76g//dYLFny3l4
         UWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B+WEF5edk3Tx9yanz1zjhNZZoZVcwwOPFtC6hwTP6dM=;
        b=T9JFTVzMDg4xcSNsJC43pfVqz8nD7p9krgFHRFmPqIVOdYkaM0PyNh3Mc5PJ/8Tg6K
         QrKZ7lFLioKRa0BbQcQ1xFFmbyqtWtcAPwcZq91/QirDf8Ebdcle7+A5DIQUQ5dnK3AH
         PQ6/gZW1HOMx17FvVo8kIs+p1P3mKeWw1bddj2mJSpFEGQR9CrWIKgYstf+LL929Y0lF
         N3fp7WxNv6px6d7CDcXR+9exjdPN9tLbDyJBbSDAIj1qraNpOCYuTXUe0qRYaL1caave
         Xaq9AjUYJPssysUSa5w/kYjFANkxugkundyO/Y+acXZ+aQwMkwlka4qvr2ks9Nnmdoh5
         YLyQ==
X-Gm-Message-State: AGi0PuarU/2dvc3oMEjq4OdIX2aB/R3SfNgSFO7Ew+xfUFT3+G5CiE3T
        ROLC+3TY6FxvNisEVt3GbavW4Enh
X-Google-Smtp-Source: APiQypJ86i8X1fZBJtufv06LFX3G9YR/9Aie7eK1K0RIR5jgol3yOqUMOkg609LIspq7NaRIbtxRcA==
X-Received: by 2002:a19:490b:: with SMTP id w11mr2253959lfa.9.1588253919346;
        Thu, 30 Apr 2020 06:38:39 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id q125sm4413979ljb.34.2020.04.30.06.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 06:38:38 -0700 (PDT)
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
Message-ID: <34a49a30-71f2-5b24-20a4-7d98ae37cefa@gmail.com>
Date:   Thu, 30 Apr 2020 16:38:37 +0300
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
> +/**
> + * struct tegra_csi_ops - Tegra CSI operations
> + *
> + * @csi_streaming: programs csi hardware to enable or disable streaming.
> + * @csi_err_recover: csi hardware block recovery in case of any capture errors
> + *		due to missing source stream or due to improper csi input from
> + *		the external source.
> + */
> +struct tegra_csi_ops {
> +	int (*csi_streaming)(struct tegra_csi_channel *csi_chan, u8 pg_mode,
> +			     int enable);

What about to split csi_streaming() into csi_start_streaming() /
csi_stop_streaming()?

This will make tegra_csi_ops to be consistent with the tegra_ve_ops. A
separated start/stop operations are somewhat more natural to have in
general.
