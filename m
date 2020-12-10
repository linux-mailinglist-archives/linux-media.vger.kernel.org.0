Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C412D63D3
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 18:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391073AbgLJRlr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 12:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728868AbgLJRlo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 12:41:44 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A606BC0613CF;
        Thu, 10 Dec 2020 09:41:04 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id u4so3121205plr.12;
        Thu, 10 Dec 2020 09:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wg76jedNfKc/TU9UzquktTGoQhYb+6rN7M9SWX71cGQ=;
        b=U7xYP0DnAGJ++RJDicbYFohdbSw6+4dEKbL51GuDiOEwWCZ0sGYVcyfWyA7DPDyXch
         fc4vCdHmT2NtlE+Qvg/EFIw279PSUtxpDLsQ5CuCXmWrGsd8jlB18i9ODl3dGSRkRLCD
         184DyMd70p7xoWHzIdSrmEq5CBjpn6Hs9mgdfZTHpUdcS6MYj1yxqNS2jCciljxd7T/9
         sxBnbXUCV+k3qicWrYFZCKtSUrKemak5JorceOLmJ6A+C8Qkv1LFd96fsoRNfBGR+2pV
         4xXbbJ+6/vfv/zzldGFWywDgN3k5Etc2mDqMKeWOu3X8asj9O+CO9JcvuIZ/QpeiU3+g
         Ptqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wg76jedNfKc/TU9UzquktTGoQhYb+6rN7M9SWX71cGQ=;
        b=peqjjtsNtMlD6yVve+NVcyK4nR9lYnHr3JczIiqUJ0c/AxyECkfhwV8cLF1+GASuyM
         iMSZZkL1Sp2qlTOSKiBg6Adhx/bDjAQAkAPYqSKV/V8PRUNry/OJ6ahFxNr41ui4l4zq
         5uoUcq0eavRK3W/63NoHYz+R8dEhV3vgOsWVjbbH219KmS9lb75HuUkpDZE0bE5Nx97H
         DXqx3mszW9/le+d7aOnh5iGxDKtCsBaOCSaF6U41K/bHj+R9mnKvX2ww4Q6p2p56CN8O
         dXuz+D9x+I/Dcw6/o8UgkL+5QhJZPBuv5mbNAclO0ew07f/+MSAnKDiWB+oxKHBVWgVG
         7l4w==
X-Gm-Message-State: AOAM530Dp49rWU1bsA/LREqIIxIH20Allqv4RafDpv6heK5Yio1818oE
        ZBRWcQCMC8NHBzurKV6xKvE=
X-Google-Smtp-Source: ABdhPJy7sT9hqz16lIdJ9LTYu1ADeOZPUOYqL5kRiMhi+q82kvjQrH7ZjNig1UfhjJlmQh3ETeYDbQ==
X-Received: by 2002:a17:902:10e:b029:d8:d11d:9613 with SMTP id 14-20020a170902010eb02900d8d11d9613mr1407576plb.26.1607622064190;
        Thu, 10 Dec 2020 09:41:04 -0800 (PST)
Received: from [10.230.29.166] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id g85sm6912510pfb.4.2020.12.10.09.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 09:41:03 -0800 (PST)
Subject: Re: [PATCH 14/15] ARM: dts: bcm2711: Add the BSC interrupt controller
To:     Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     Jason Cooper <jason@lakedaemon.net>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Marc Zyngier <maz@kernel.org>, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-rpi-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-15-maxime@cerno.tech>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <46411f3a-9b0b-9bf6-8795-77fc11988f79@gmail.com>
Date:   Thu, 10 Dec 2020 09:41:00 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210134648.272857-15-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/10/2020 5:46 AM, Maxime Ripard wrote:
> The BSC controllers used for the HDMI DDC have an interrupt controller
> shared between both instances. Let's add it to avoid polling.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
