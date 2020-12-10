Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5D02D63DD
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 18:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391123AbgLJRng (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 12:43:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392468AbgLJRm5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 12:42:57 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279F1C061793;
        Thu, 10 Dec 2020 09:42:17 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id j1so3143276pld.3;
        Thu, 10 Dec 2020 09:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xhC+Epifyxy2M2mKUYAu18Eq66Rlf4culR13M+Jrfco=;
        b=ZJ2ObQpYtkzEbRFv40oN+F65lAU6Ej9gKrE5tQPiv7ix/LuBkcvUf+qMUh+Yzoxr0g
         CyVLZ1mG/UZfuxW/V3MMPsaTBSe2CWI0mDNMfEr7mKEWwiKc4c3ZI8/xXiy/OOpRRB/j
         2IZpMCpurtGq6tzatn7TAJI7V3OuMaXrfCFpdbKTT1pfnFN4C5I4tNdDjJ+tPlKhyxqi
         przoNGt/m24R6bKMKywSL6UEGQQjXmxvANoK31VrYtoQFG7CIFwswmQLapaXt4wK37sA
         xHQJydZjUT4lKZk5SMNC/6y1kHtTG0Wl7+At0IEZBHpFHOPwp1+ijx3ZwuhElpY/pmj7
         20Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xhC+Epifyxy2M2mKUYAu18Eq66Rlf4culR13M+Jrfco=;
        b=rhCbL9CTI1ypUFL6GwNzUQlwHNW8dQuxDOvmr+R2hJiSBlhmf2VMpQJ9vJ2oQRdwxd
         am675JNYibZZwkQVGfGDtd5nLpMbG5Nhd+2p7/YDUpfSOKLHKcPqoAVCHgw+aIh8begk
         UgpNrKlb9nvTQXLxekL224iAxBhvETb9F2R0FADIuCkg3nUDg5MA6Mm9qa4E/EotdI+e
         BILOiRttlB/7VtlKe6VEwdsiPg9ZcAY1DtTu+Ee9z+YQMlSkFbVPBiMTlKs8GWmKLMof
         i+gaQ77mP1XlZeueq1iqBFkAgM79HqlWGAn3WfULU8PcQBP5F53YzeCZVQeE328aOrP3
         d3mg==
X-Gm-Message-State: AOAM530YvE/hGxDWFtNsQveW07P+afYfsqcev0u0AL1AdUlvYwPPX/lc
        VCbmKfUiBhb+NU4nILDqIdc=
X-Google-Smtp-Source: ABdhPJzIx+7sRPBlNWy2an1r0b10BKDTDvE4FtqZry01Hi8E5wwZE9KecaPEs1U2F02OehoELDCOeA==
X-Received: by 2002:a17:902:8b8c:b029:d8:de6f:ed35 with SMTP id ay12-20020a1709028b8cb02900d8de6fed35mr7278561plb.36.1607622136734;
        Thu, 10 Dec 2020 09:42:16 -0800 (PST)
Received: from [10.230.29.166] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x188sm6704941pfd.43.2020.12.10.09.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 09:42:16 -0800 (PST)
Subject: Re: [PATCH 15/15] ARM: dts: bcm2711: Add the CEC interrupt controller
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
 <20201210134648.272857-16-maxime@cerno.tech>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <bd2c5b93-2ee3-23ff-5852-e3537619e0ae@gmail.com>
Date:   Thu, 10 Dec 2020 09:42:12 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210134648.272857-16-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/10/2020 5:46 AM, Maxime Ripard wrote:
> The CEC and hotplug interrupts go through an interrupt controller shared
> between the two HDMI controllers.
> 
> Let's add that interrupt controller and the interrupts for both HDMI
> controllers
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
