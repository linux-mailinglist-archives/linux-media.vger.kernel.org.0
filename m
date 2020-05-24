Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490091E01E3
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387959AbgEXTPi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 15:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387744AbgEXTPi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:15:38 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6589C061A0E;
        Sun, 24 May 2020 12:15:37 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id m12so16133412ljc.6;
        Sun, 24 May 2020 12:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6CL2t4my3kMmcneoA9b00PaxF1g5J4PSg9oIz1+47Fo=;
        b=tTC6h4tDDX3KPNwHD8NMO4I+pT38TpDmzYd+W1a6EWd6LAp2laoNMG5o3Tej2DjeZR
         CNyd5kuxLyUMEAZGN41ePqtJThlPwPDzK7tx6scCgKx7P3eOrRt0yWB8tkkVcFCJ354F
         17JgORYEPrmzehBzHJ7Z1Lq2mOh6lpqZGTSYEgGZo7KaEWUfX2xfxTtOhagkb3h2kBBA
         RGh7vTQsiNImrfeBFeUYg8L+ShabJV0WWznKWB7BcoOOfYM33E+ZPPb0zvuKVa5/u7Mq
         U+sIMU2LNdgnTMfKKoLVYJfv6InVuMZ/XHgnKTtqSDjKZllr2AvTFxiXbKiwt8CUVFBm
         s/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6CL2t4my3kMmcneoA9b00PaxF1g5J4PSg9oIz1+47Fo=;
        b=NYlPAB/A14s53Zp/0vnqQpbTdZvLltlh46HUAjLx/sHhxER1my22mhORUSTrF7Um45
         C8ZI4mboU1N/QPbs7gpq8CzNpZA1OPhW37iQj50atyBrQ7Aky8TDGkVE04dytIwJIsIO
         xoKA4lqF/WP91JRFTGQDXI3HK/OBRmlWqbxWtz9d2nFtksrC+65ymf4pWplaDDnerQ7/
         3Lks5hp8hFSb3TG9Ki57gevMiQjCvIAQn+Uhu2CFel8NKFFWYYiV1vNx7dgjRy3ZqevS
         +PouQ3PRhE2SriUqVt9DYFRUjwVMrJAVXwDo97URFVt7iSmgMc7C/VJHG11bSuY/JfR/
         RBCw==
X-Gm-Message-State: AOAM5312aUY2Xs7T+10/BOxWWFquzLoF7Nw4F12I87SJ1kmFeNekWl21
        oFVp1w5XAmeqdvCMDLUgSIFEpnXRXao=
X-Google-Smtp-Source: ABdhPJwBExDc791Zx6Qq77XZ5MQ20rmbPVXQnwCJAIeExT4YKw8IUuyAgselp96RFF76q9KvlQNuew==
X-Received: by 2002:a2e:801:: with SMTP id 1mr5181858lji.209.1590347735970;
        Sun, 24 May 2020 12:15:35 -0700 (PDT)
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl. [89.70.52.201])
        by smtp.googlemail.com with ESMTPSA id f2sm3000445ljf.113.2020.05.24.12.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2020 12:15:35 -0700 (PDT)
From:   Sylwester Nawrocki <sylwester.nawrocki@gmail.com>
X-Google-Original-From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] media: platform: s3c-camif: Fix runtime PM imbalance on
 error
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200521132933.16450-1-dinghao.liu@zju.edu.cn>
Message-ID: <7b48c521-d3fd-9246-d647-3db9d5159087@gmail.com>
Date:   Sun, 24 May 2020 21:15:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200521132933.16450-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/21/20 15:29, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
> 
> Also, call pm_runtime_disable() when pm_runtime_get_sync() returns
> an error code.
> 
> Signed-off-by: Dinghao Liu<dinghao.liu@zju.edu.cn>

Thanks for the patch:

Reviewed-by: Sylwester Nawrocki <snawrocki@kernel.org>
