Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 237FD2D63AA
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 18:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392735AbgLJRex (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 12:34:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391246AbgLJRep (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 12:34:45 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCA9C0613CF;
        Thu, 10 Dec 2020 09:34:05 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id 131so4754174pfb.9;
        Thu, 10 Dec 2020 09:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lNV+r0IppAZRJTMBGlPd7aQiGXuhonx9MT/VwxzjdOI=;
        b=ViSLsucSzbhWox3QJJ8d+ac7h6BvoCeM0lqomCBd4vRbFl+CdXiFn0mDlGOlptmyYI
         PPMPfTqfeT6WHQVekZw+odl+rTG6kg89jekdO/s5m++np+ENtoDqN5QujPzHYY13ImTX
         bXlQWP6DPnjzgeeSdQwhfD8/KHEXXxuh175Bmi80EQQW5Hq1k8DyH78SiJRKjRoBImIa
         5UpOnyoozg27bHEKkdci3fBSk0i9SV/40J6bF7M0PBPQZeT2BI3rlfCiwxcVfi9Q01LO
         6NcMDeMYmsIpgy4feBzzwvBbDHGjRRbnIl2q2TLsqDx4ijjJPnocdKXZUjRjo8hILZwQ
         UkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lNV+r0IppAZRJTMBGlPd7aQiGXuhonx9MT/VwxzjdOI=;
        b=LgzRbVD/RV25fQ/sqRZW/k2ZSE1t/0gJdyhj7viBsQefi0XFiT3rI4Xm7JXN8AlpEQ
         Wk25eUNVFOKuZC4njXWxyX5EZF1N9RnQg3kOzMj2+ZaLBdfMv6aOoPrdkToO5DahhdB9
         29Xi1q65FschvaDUwGx2kDOGj1VogD03LkLOAqIk/MXmp5Lcghu9T+/hD4N85CVwilfm
         eom9mD3BkdguPzq/1b1lrv39pLTrVBNoPKkYNbd/gXb6BN9W55HMS4cnodzuJvrOukYm
         vuSXDjlYJh7hSys4eIDMjXFJqv70XhbDmoEkDQWUuaGnkdmJTIGVaM6LqfOijefFWR7C
         fWwA==
X-Gm-Message-State: AOAM533iSe+p0+Ri/Q1LZ1BQR2qHVSw3FadmCXho3fCcGB0vNH71tk8u
        wa/L+P74OaLhTDp8PdYGwpg=
X-Google-Smtp-Source: ABdhPJwNZKeRKA6MI5jWS1XQbWp2xNRfwbC/lQQAa0pRweX0TNjTfHxDqrkpIiT0lSE76MavwUqu2w==
X-Received: by 2002:a62:5f81:0:b029:19d:ccc0:9c42 with SMTP id t123-20020a625f810000b029019dccc09c42mr7786239pfb.61.1607621644944;
        Thu, 10 Dec 2020 09:34:04 -0800 (PST)
Received: from [10.230.29.166] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 136sm6796774pfx.112.2020.12.10.09.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 09:34:04 -0800 (PST)
Subject: Re: [PATCH 01/15] irqchip: Allow to compile bcmstb on other platforms
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
 <20201210134648.272857-2-maxime@cerno.tech>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f224bd8f-559d-0692-9025-4ee30d0d0846@gmail.com>
Date:   Thu, 10 Dec 2020 09:33:52 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210134648.272857-2-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/10/2020 5:46 AM, Maxime Ripard wrote:
> The BCM2711 uses a number of instances of the bcmstb-l2 controller in its
> display engine. Let's allow the driver to be enabled through KConfig.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
