Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDFE11A4ACE
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 21:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgDJTrN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 15:47:13 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34281 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgDJTrN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 15:47:13 -0400
Received: by mail-lf1-f65.google.com with SMTP id x23so2111904lfq.1;
        Fri, 10 Apr 2020 12:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dILpLY/RP2wcDzSbj72jyGMLBjeMuausjjMKgpvaDRU=;
        b=X6QMmeePvLV4n/dgT+K/oDmMU7P/Ells2l8mj9Pg1lk0c01hCibVY8vQGjzoZ9c5LV
         oy2x3du6uWvyAnh3EHBgN28HNmtJccbD03EysGTJuFAzuA5e+hMDCF9JUYFto2Ikkk0y
         K0NNUsYHkvKq580GXSyAPEl2CwDALp4NXIpNp7oHFHz0CStHMj4QUXmEpAsHNsfV8OZG
         4vy1NJPyNjfDeCDQg6Hira8xPKGVNL2lDhpWL7Epgg7daVYxQeot+GvxQlVOwavd+vqb
         U4oPcypI+chrRQfMBgyOq4oklb+Au3/A6il3Cr4mPwIlMq6ndf0I7P50dXqd5vFF5bjo
         10mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dILpLY/RP2wcDzSbj72jyGMLBjeMuausjjMKgpvaDRU=;
        b=NsSW9e1JXykKUno4yJW1uAexsNB1g+9J5UGKKO8Lkri69myTiHkgtq86Wo7oGp9LoX
         D4IQZ0i9wowHKO0qVHzov0KOYhdlQ40FfwXdxDSF2kTd32KPm4b2F7QvY5HJvRdQlGVk
         sBfpOxcqnlywr5KGlO2CQZ6mAyZQcDs7i9RhpVC4UTUxDb23aJy4lH5lwHot+Qkpogfq
         gaz9bojNca7ONGpxTX9DvaBgWf3BDFMDSuuQCqrqlsj9gmcr6m0jpg8u8XWTycvVkkXD
         gtWXWYTO0Ut0a3eFAA0LXr4d2cCGyGMAjl3fwjJMlzTK6BkCvsoyIhbfmVjAIkKYCaLs
         XCeQ==
X-Gm-Message-State: AGi0PubYCxmWuphwMDKcfMkFsZa541gDlD5COBe8PNI262Z3IMDDTPIm
        UwSKZkPK8pLD4TvVCHbqOnNubMt8
X-Google-Smtp-Source: APiQypLG++tIcwCbPanZnLJBiwkWExq7H8E4oHcLpvvJ2dehkL3FZEzK2HIVJTwwXXAirt9wFpuC2g==
X-Received: by 2002:a19:f206:: with SMTP id q6mr3523608lfh.85.1586548031661;
        Fri, 10 Apr 2020 12:47:11 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id n24sm1697083lji.19.2020.04.10.12.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 12:47:10 -0700 (PDT)
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
Message-ID: <775fa216-a010-4785-d6f8-28ac7c39333f@gmail.com>
Date:   Fri, 10 Apr 2020 22:47:10 +0300
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
> +	/* wait for syncpt counter to reach frame start event threshold */
> +	err = host1x_syncpt_wait(chan->frame_start_sp, thresh,
> +				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
> +	if (err) {
> +		dev_err(&chan->video.dev,
> +			"frame start syncpt timeout: %d\n", err);

I guess this and the other timeout should be dev_err_ratelimited().
