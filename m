Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2503F35EF9C
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 10:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348330AbhDNI25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 04:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239774AbhDNI2e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 04:28:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8DACC061574;
        Wed, 14 Apr 2021 01:28:09 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id n138so31876513lfa.3;
        Wed, 14 Apr 2021 01:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2jYkASAoW5sIyhWoTgPddOYjjE+zdkKqEacR93B79V0=;
        b=fNY1MWj+x//TkUYB7eRIvbHfrPxMD6grgtPDZbKFBJpGw4iHDym0A2Awf3F0PddtTB
         ql3HYXP/oZlewRNIFNkKG08B3t7aMkY7TqpxIJLjf3jPZcSf4NBKx/4JLbTdKM6YamAd
         QVoaVyGUN+66VRXuWfUN0rR9jszuZLJMcxP6HSnPOwSOQl9oU6bC0JbYtOOiGB2vNM/w
         21cOdAYKKb/+S8f4CQqDXsbVjLafuovGkN0QsCkYANVmoE66A1FaEc4dIAHCl/en/Ehy
         ndISh4l1cPRviOAAE45HBDUOgh2cAtT9UjIM5A7id7wPdL84GB/zNa/FrcMq20AON69G
         hTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2jYkASAoW5sIyhWoTgPddOYjjE+zdkKqEacR93B79V0=;
        b=RUSEvC9AGCpKbiWPMABcE8CblLvwOdrOztyH8KTP13raY5u4D6/QHyXe84b4eP1osL
         JIzsvXQ3hwSq6s1i+guPI0qTRoWKsMrkt+o1fhLmkQ6X5eOluWYH4ObZVLqsv0zJQiqE
         rlwnLf6hbhCSWTdJj7MkPHBtKtQ/Ybk8CXccva1bzqNDqYlXsoD+8P0Q0EkBhGo2F1JO
         16Z800IEFdAH+JyEoVcxV262yuzIuXLgtRaEdiIch++HaezJGROlN4kZV6xfkg2t2HHq
         PPPm/6OBh/zgn9sKG0jwGDdrv83hcjUgiVtFCDiVQkybWfzAvX/SL9VBPaEh7pG5P4CC
         gCXw==
X-Gm-Message-State: AOAM533W4fAwy9mDa6PcOIYw0/NhszNeE9n4pGjonQ32P9iF/dm7gidZ
        Eo85LLtMKIcI+H3Ff8mc4sHKWQiZ1HY=
X-Google-Smtp-Source: ABdhPJwe3b6ast9wwGRLwdrWSll9+SEkiHf8L9AUM9QJK7X0nnT5fpOAg5wkYtY14zv5z2PxZJuD5A==
X-Received: by 2002:a05:6512:3d18:: with SMTP id d24mr24458461lfv.204.1618388888124;
        Wed, 14 Apr 2021 01:28:08 -0700 (PDT)
Received: from [192.168.1.100] ([31.173.85.95])
        by smtp.gmail.com with ESMTPSA id v3sm3675584ljg.77.2021.04.14.01.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 01:28:07 -0700 (PDT)
Subject: Re: [PATCH] media: dt-bindings: media: renesas,vin: Add r8a779a0
 support
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20210413173810.2561909-1-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <62b0a5ab-1b6c-3532-72af-bba23f82ff41@gmail.com>
Date:   Wed, 14 Apr 2021 11:28:00 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210413173810.2561909-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13.04.2021 20:38, Niklas Söderlund wrote:

> Document support for the VIN module in the Renesas V3U (r8a779a0) SoC.
> The V3U is different from other SoCs as it have 32 instead of 16 VIN

    Only V3H has 16 VINs, no?

> instances. The VIN instances are also connected to a new IP the R-Car
> ISP Channel Selector.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

[...]

MBR, Sergei
