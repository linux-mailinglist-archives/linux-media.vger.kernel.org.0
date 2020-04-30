Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 061571BFE15
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 16:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbgD3OZO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 10:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgD3OZO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 10:25:14 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0BDAC035494;
        Thu, 30 Apr 2020 07:25:13 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id j14so1371441lfg.9;
        Thu, 30 Apr 2020 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tCY9CYxU1gOzRgXfCj/hSl5kyF2mN2AlCiXAxXLnSuM=;
        b=Yls6c42gjD6zTZpJzYY5ocdHYSZeyoSnujMd9pi8JSCHJ3DnixNK8u1NSrrQghA6w8
         9tkHj0U6/xNjU7hJhx8h64wdiry/1JMSUI1rS4Mm7eqZh7AXgVBecNthGqNzwOb4DOaE
         lIlIiTvDtAl+OPGwD17vAL7ZWINU10TUkLgRdmS3s1IACHN7iF6cKMPYGnz+EVz+fsAS
         Y3NDUEKc5nmiGii7c4qhPvDTYfG+Bu2MVsm0Qw8qJnBq9C46ngDOfo/okVRzh1+OtHl+
         x60FWuExZgACWju7/R55m1NGf8Ig87+ClD2hP8N6zTo29DsWU3piOGyPfZ6qSbIkpxRf
         6QJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tCY9CYxU1gOzRgXfCj/hSl5kyF2mN2AlCiXAxXLnSuM=;
        b=AmNOpei6ToD9ZUslZq0usvosFVEDuYZPrfMyzAfGmIxuxSnRnxIAiK15nKJEH7Pxqf
         emgmSUX/dsSN8zSjimgBtkNP8mqTSYAhHKUrzU94xm0A6NpeK34N2U6vLer2tDxZ9GLF
         tS5zLFGAbGq7o0gYtk6VGkciyRod/ajo2Za4STy6gEO3yu6ZW54GEs8kfT7LLJKD7d7M
         ovQvNb6cNI+51gWjxwJbx5RFMFjFUT6BG5yVlSTvjGm9uSTpEegtzBrqerp7XK1W2dvS
         5V9u3b72gvM1Uhu0V2Y0OSwNUnfNVDnuFjRgcgXfk/V3zCSiqO8CGBAgZVgdeXOBsaFU
         l80w==
X-Gm-Message-State: AGi0PuY7rL9dyRxLBqW0bZNJisuuC9E0XsSiXa+c0hU2BS6CwAHRnOdJ
        sMSCxLvDGSHSuylzYWSUJZWuwZBP
X-Google-Smtp-Source: APiQypIxKIrY61iyWN8E2p2v+gt5AUX6i+jScFYei172jZBeATJ8+md5KljdfAj8+Dhqh3p5r2H+ig==
X-Received: by 2002:a05:6512:108a:: with SMTP id j10mr2368340lfg.38.1588256712061;
        Thu, 30 Apr 2020 07:25:12 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id a28sm4893311lfr.4.2020.04.30.07.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 07:25:11 -0700 (PDT)
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
Message-ID: <05271cd8-010d-6e09-2bb0-97519d3db3c6@gmail.com>
Date:   Thu, 30 Apr 2020 17:25:10 +0300
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
> +int tegra_v4l2_nodes_setup_tpg(struct tegra_video_device *vid)
> +{
> +	struct tegra_vi *vi = vid->vi;
> +	struct tegra_csi *csi = vid->csi;
> +	struct tegra_vi_channel *vi_chan;
> +	struct tegra_csi_channel *csi_chan;
> +	u32 link_flags = MEDIA_LNK_FL_ENABLED;

> +	int ret = 0;

No need to unnecessarily initialize variables. Same for all other
similar occurrences in the code.
