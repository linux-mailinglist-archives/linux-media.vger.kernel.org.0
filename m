Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6467F2F74C5
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 09:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbhAOI7Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 03:59:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbhAOI7Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 03:59:24 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3751FC061757;
        Fri, 15 Jan 2021 00:58:44 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id v24so5426837lfr.7;
        Fri, 15 Jan 2021 00:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yoHSmWqLEgOaqrsaqCRDQK3B4dOZRw9xdRI7JhzzteE=;
        b=vFRmv5ETC4uP8sDjMBmXiNUGt9deXfFgVIk4VckzrnU4FPtT0qCpoWgmneijK09ZWc
         w5YlV5V1A3L3qpQ75u4tb5HBgO8Ia64zIR9L+M4aeyfXKoSioMCD07J7XvzOsx1neWIN
         Sa3QFTH/WP8L6HByxqWjMVg/dbltNIP5pfkMfo0ypautkShhDBf2KakMaYJQej3+qRuJ
         uEA2xIiqEmw8b8gQhoNyNSkA+71qGDh3K++j6fPFy1XdCEfblIQzZt3+LPem7RNBqXFk
         YaWaE8x2kaDTvocyArhSabML8lzGZRn1vPJGBQNi4ymD/eM6n1ySSe+NO9oxYhJUReC5
         m8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yoHSmWqLEgOaqrsaqCRDQK3B4dOZRw9xdRI7JhzzteE=;
        b=lDgnPMwk53kCQPDEkN+CyTooINPTHuSUHUmGcd/epQLZRv0DmfHxwTmZi/OYPdaUdt
         OlzbijCDPocoi9AHeYd+jelrS0b5heUyHvBjnFx+9b306KEMUi7SH2DJy14ebcXo8kky
         W7rZxPP6UOdjggFId3sez19Uj/Ox6y9EiD29hNdvqFnIlyUzWDx49faiBhOYnHQJzpnI
         hkiuL75j4grGQXK+S1dYUnZytwpTEdK5KB5niGmYL+BdqrZRIZRJUptpwn5weHqs9/Hy
         E0i+F/XhDYKWnM2bNEuaWVJHz/0xDRSUjkBSzZtPAaelHRODIrd40s5MEZ9araevZBYe
         a4cg==
X-Gm-Message-State: AOAM531+ioSsKOsCaOfXoLYLdlDESkLeS58RsoAkQsDSIv5qJKneqIn3
        +OGahXeGQX8fKVKsw97Oljlo0fwdlHIErg==
X-Google-Smtp-Source: ABdhPJzWw+TkPMfkvIslzJD0f/V/yDnmC+fu05uR1a5pG0GBOMgIXw0UqbM9iL8o2SEEm8O8gUniYg==
X-Received: by 2002:ac2:5981:: with SMTP id w1mr5560436lfn.374.1610701122526;
        Fri, 15 Jan 2021 00:58:42 -0800 (PST)
Received: from [192.168.1.100] ([31.173.86.2])
        by smtp.gmail.com with ESMTPSA id y21sm508948lfl.84.2021.01.15.00.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 00:58:41 -0800 (PST)
Subject: Re: [PATCH v2 4/4] rcar-csi2: Do not try to recover after transfer
 error
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20210115002148.4079591-1-niklas.soderlund+renesas@ragnatech.se>
 <20210115002148.4079591-5-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <664cfe51-1739-2294-75fb-f2357402fa91@gmail.com>
Date:   Fri, 15 Jan 2021 11:58:27 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210115002148.4079591-5-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

On 15.01.2021 3:21, Niklas Söderlund wrote:

> Instead of restarting the R-Car CSI-2 receiver if a transmission error
> is detected inform the R-Car VIN driver of the error so it can stop the
              ^ , woiuldn't hurt here?


> whole pipeline and inform user-space. This is done to reflect a updated
                                                                 ^ an

> usage recommendation in later versions of the datasheet.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergei
