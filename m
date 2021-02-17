Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4213331D3B4
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 02:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbhBQBNk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 20:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhBQBNY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 20:13:24 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E255AC06174A;
        Tue, 16 Feb 2021 17:12:43 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id cl8so476856pjb.0;
        Tue, 16 Feb 2021 17:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wNVZYewXDzKdq3nivCVCuJM93zq5lmDXKFfuCe08TZU=;
        b=lze8dBm3rNnLESFrVkK3G9iztt0PsgOI/qDTKzkgci30CWAZwENz2kt4IoLhdNYWTd
         4DGVKvBwUnm1xVNxS3o/C1Q+TDopRCdasjx38BwpwAEIKNq4MIqlm0MB25PGq0GokhY5
         CDYZ/yslGXhBJGQH6VEvEzVOrXW6lNco4g42us0/5lVnH0wf7dirjcj44TtQuATNUnYh
         TFWxjJzEVbwAKWT0/JA8tzzlTI46uPvxTauJdd4XakpCu80NxofMqf4j7gd7Q2eTOxtX
         1bcQz+ndQ8NhF7H61meQMPZ2TE/vbNX/bNhLTmOwsZKXWyRsmvx0XreYPXkN5fj1E1RM
         YrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wNVZYewXDzKdq3nivCVCuJM93zq5lmDXKFfuCe08TZU=;
        b=UWSbKC6zuJesSFT4X5We/bWtUXYlKqMS7hPFSuS9UJQ2eDuXnBst+SEfvzQ1MekmHM
         Rn2QpSkHrC4Azuan+G1NgzU3QVDZA5pmo2Z5sSHH9W9fe6qlPzXGAeZLKHNnA5cq9FMu
         9qstkiBOX+8bEDcnSfwqcvk/yMZ/UtYJ+JEVGDvZmTj7f4gAFI8mvnhmL+9jnSkEeTrR
         OOUhVJFTEx4k3BOunBWDyOu9oRBFd4/Y0QHObMy1h9XfYlRt13U3vCs4ja0uwsjzootg
         ZC62PpKkL8zE2yq5JfYVKYFYu1W4j4JTVMDnJKK2rpj7zzdongNFFW1YEKREsfOnET8I
         57eQ==
X-Gm-Message-State: AOAM532MUs6ehm/hGmuDPfItN0vPN+/VpSb0Fuhz3aeje+bdyTwomrkr
        0n7hdOQMy0HJxl8d5GoIaOj/f6kU8QM=
X-Google-Smtp-Source: ABdhPJxI42w5Dp3+mhtK9Eu+GOs7t/DjNXtsyX/1HLRij6cQkCWDcR+YtmZ70nMLW3lATeCUnw7Fxg==
X-Received: by 2002:a17:90b:17c7:: with SMTP id me7mr6781873pjb.205.1613524363086;
        Tue, 16 Feb 2021 17:12:43 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id y22sm326153pgh.19.2021.02.16.17.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Feb 2021 17:12:42 -0800 (PST)
Subject: Re: [PATCH] Revert "ARM: dts: bcm2711: Add the BSC interrupt
 controller"
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     dave.stevenson@raspberrypi.com, maz@kernel.org, eric@anholt.net,
        tzimmermann@suse.de, linux-rpi-kernel@lists.infradead.org,
        hverkuil-cisco@xs4all.nl, nsaenzjulienne@suse.de,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        dri-devel@lists.freedesktop.org, maxime@cerno.tech,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210212191104.2365912-1-f.fainelli@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6ce9e820-992f-7f97-ccaa-f8cb99698a68@gmail.com>
Date:   Tue, 16 Feb 2021 17:12:39 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210212191104.2365912-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/12/2021 11:11 AM, Florian Fainelli wrote:
> As Dave reported:
> 
> This seems to have unintended side effects.  GIC interrupt 117 is shared
> between the standard I2C controllers (i2c-bcm2835) and the l2-intc block
> handling the HDMI I2C interrupts.
> 
> There is not a great way to share an interrupt between an interrupt
> controller using the chained IRQ handler which is an interrupt flow and
> another driver like i2c-bcm2835 which uses an interrupt handler
> (although it specifies IRQF_SHARED).
> 
> Simply revert this change for now which will mean that HDMI I2C will be
> polled, like it was before.
> 
> Reported-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to devicetree/next, thanks!
-- 
Florian
