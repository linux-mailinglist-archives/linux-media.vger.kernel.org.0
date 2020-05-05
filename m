Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D067E1C4C3E
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 04:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgEECnX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 22:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726516AbgEECnW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 22:43:22 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B61C061A0F;
        Mon,  4 May 2020 19:43:22 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a21so16682ljj.11;
        Mon, 04 May 2020 19:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b517Qv61xjeiuOiaYHCLpTy52t01kqYfbxe2GzTQY68=;
        b=oYTUQT4/gmaq3BbLehfUaJCRqwrFdcCeTvWtKNEO/U4TQlqIhfOuGBOmSGjcQATOVI
         SkkiyfBHANOGTZ80VCfe3V4K2/zXyVX+X5OmP8tXSBIM5K/X61l0uxdFNDzgKDoOggeZ
         GsEri4bMItrtKfDnlI9vSEEHZiq2MUuFIyBR+HYzfLskRFgZ5hbrHE7Q/l7egTNDNboH
         sLb5p8b7iltX30P3YNMXWdPSJqi1Xit1e5blNj8nn5GkV1jr4j5Us6UvizQCA7p1otEY
         fumCxGQeXCkklFsL9gu/V1DkcoCjDPqu9Xkf70n2BTSBcb8s1Haa58gpEqhcv599XB68
         rYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b517Qv61xjeiuOiaYHCLpTy52t01kqYfbxe2GzTQY68=;
        b=lwFEZHTotuxz7NsqIpZ9mR2eDhGKB529R8HVZBEpVhfhOG4uTisd4s/6jJEbRZmW1i
         IFZ3YZj3+qAjbzzWDhTFfsesdc3krgDvQoO69uOj4nL/31HdU1Vxd3XVo4zc5OdynFDV
         cBgX78FKYkqp8h6Qr3MgDgvWIREVMwC0UrPBUaZSyAgl4rJvojvYhaW7kLzTBEzhdInd
         Ln7TjaP45Us09wtIptLo6YhmKOQ4Lrp43bO26/1dFXmU51YGbuw50noxZ+MDA0PXo5lT
         X+2tiRum9l2sp+P0P7W5bjZzA464QQNv/JgSTH2x0j5UmiWOmOc4ufr4MnC/+QRGalYU
         m6Fw==
X-Gm-Message-State: AGi0PuZ5rmnVxiyh9rclxQM+4QuZv2MJvQB46pYXaEMeXRFhIIGRCe/p
        XLvY5jGNiLRqaT/FN9vcLB+ehDIy
X-Google-Smtp-Source: APiQypLpfrlFV2uVzWp1G7rujyzQLmFNC7OLXRnHAHWDvf9srg0Ol2e+9LnEpEmWm8/HiCA5FHy15g==
X-Received: by 2002:a2e:3209:: with SMTP id y9mr391311ljy.154.1588646600566;
        Mon, 04 May 2020 19:43:20 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id b2sm635352lfi.14.2020.05.04.19.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 19:43:20 -0700 (PDT)
Subject: Re: [RFC PATCH v12 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588645920-20557-1-git-send-email-skomatineni@nvidia.com>
 <1588645920-20557-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <db5ef9b8-dc2b-7db7-8f70-a4e223af1fc9@gmail.com>
Date:   Tue, 5 May 2020 05:43:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588645920-20557-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

05.05.2020 05:31, Sowjanya Komatineni пишет:
> Tegra210 contains a powerful Video Input (VI) hardware controller
> which can support up to 6 MIPI CSI camera sensors.
> 
> Each Tegra CSI port can be one-to-one mapped to VI channel and can
> capture from an external camera sensor connected to CSI or from
> built-in test pattern generator.
> 
> Tegra210 supports built-in test pattern generator from CSI to VI.
> 
> This patch adds a v4l2 capture driver with media interface for
> Tegra210 built-in CSI to VI test pattern generator.
> 
> This patch includes TPG support only and all the video pipeline
> configuration happens through the video device node.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
