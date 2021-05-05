Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6D637380C
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233072AbhEEJt1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233002AbhEEJtY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 05:49:24 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2536CC061574;
        Wed,  5 May 2021 02:48:25 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2so1704796lft.4;
        Wed, 05 May 2021 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T9xggn2FMiHUCK0JlgIAaoS/FDcktmglWb4xoxeN6Tg=;
        b=RMdoQG/DGvhjj378i2tgVHLSU7jPCo8Q3GAdPuFYp6Els+PiHp77O/IHNmbxSb+hOD
         IQmq10ICgbhp3gULA5p22NXW7Ify3NZwatHUWvJmWqmPmsMJICeKYccd3dR9Fd6kLiiO
         9Le+1+wRrIgHWYku54L1HX8KBNWufzjB9CSpfymTu6w500Vq65JXfzGphiR7zgCT1GMo
         T2IX3iDpsEDLcQAaCpXuJQF5TtAxym6tyHDnpxcfbaI+zqvUP7vhN+L63tY7QAgFMH2G
         z5OxOn95+iqqV3mO582NFFtBjB42z1nNiDqBnHdRFcmwpHywoVD1hPOLH48gP9m0/wp3
         5P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=T9xggn2FMiHUCK0JlgIAaoS/FDcktmglWb4xoxeN6Tg=;
        b=A/0dBZbN6WxJWKP34qS45EVq4fAAiURMAH5wPBMAHYZDOWH3/e5kRfaieo2S9Uwich
         E1Qa/4P3Tt/6DAy865cMw2oZdgFsUoyZBlYZFGFSJjDIg6cAzqUIit+wTNsBxB0Ebovn
         4alShfxF7iMtb7+Fgdj/PLjsRXh3uJodRgz6uoABIm5IdQtMOaB9+MRENJSC8NSBBi0D
         GYSegakkYW57VKrOfma0TsStNcF/irTvSA5DhJpJfnnVulmYL5ib0i/T4I5I9UDbdnXv
         Uq0rqLzaAMLwCgQa9ooJwpnpOS0LmOMMxhkUnibC/UBWHnMA0c/N6Ok4Xe/uaetTHvPO
         RJVA==
X-Gm-Message-State: AOAM533uPonWtDQeEKjavvnBIlmVjhd3IXiczp1qn2dY+E09Gjrj/GH0
        f7J/HXVvIF+Vx5cy42jxwIkaU3aQxQU=
X-Google-Smtp-Source: ABdhPJwNQpAAyMQzifb+wR7LJgqRVho6ApD70rHoAY1Gt66RZsTl0RO2v2lvGHo8oeN2+QIarHBIpQ==
X-Received: by 2002:a05:6512:92e:: with SMTP id f14mr19752982lft.347.1620208103478;
        Wed, 05 May 2021 02:48:23 -0700 (PDT)
Received: from [192.168.1.100] ([31.173.83.246])
        by smtp.gmail.com with ESMTPSA id z27sm2009990ljn.23.2021.05.05.02.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 02:48:23 -0700 (PDT)
Subject: Re: [PATCH 12/25] media: rcar_fdp1: simplify error check logic at
 fdp_open()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
 <c9e7c9b02841c149b0127a7658d2a3e2828cfb90.1620207353.git.mchehab+huawei@kernel.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <42cf9dff-5c8a-02bd-610f-d88507eb7519@gmail.com>
Date:   Wed, 5 May 2021 12:48:17 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <c9e7c9b02841c149b0127a7658d2a3e2828cfb90.1620207353.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

On 05.05.2021 12:42, Mauro Carvalho Chehab wrote:

> Avoid some code duplication by moving the common error path
> logit at fdp_open().

    Logic?

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
[...]

MBR, Sergei
