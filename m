Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33EB32DCDE
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 23:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbhCDWTa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 17:19:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbhCDWTa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 17:19:30 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D95C061574
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 14:19:30 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id q20so20061960pfu.8
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 14:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=KxrqX35sqpFtAfI8oDLjTLW65rgdE9avEnYaR0uY7gQ=;
        b=GCW+Vc2I/9oTIV07P74f7Q65qHsUAq72nOLb6vZ2l+Jlvbu2xopMnqcJG4Byr1kAsg
         ozW4SAi02QOIkNQkq5dCwqxweVLeLt+knCS3sHTC3pl+R3qyFH8/s/5wr4GHT8+8Lenw
         k1ULh8DmNbVfkNGBJwb/U9utbJRuU8MASBllU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KxrqX35sqpFtAfI8oDLjTLW65rgdE9avEnYaR0uY7gQ=;
        b=KyYhJjPvqFiUXJmoLowVyxjSC1FI+sKngxy4dU5zzhJbCBhVH0smLLIxmIG0MFgKkM
         l+RzSJrzLrhsAhc/3OBblqT/fiwFxCmCajwRIsPBi60meS8+bSVyma2P8Uc5aQhGOuvs
         QITU8CnhWLBbQ/ZNGG9Ze6VVM0582Ql3eQta5DKqHrvZMkeUcsZYnN5qYCGklQBdAvHn
         pqnSeECpFVbziRAYCw9o+iZwIy02y4AJBSglY54BI+KJ0aic5HcgqenKsD4B01YqP5Ci
         pwvaS2yfiO3U/sdVfORTNmq2MwtpfOF12nIFuCeGdngGxynsuQRlpxQzikFdgH0H3Z7h
         bYcg==
X-Gm-Message-State: AOAM531/EhTb0tCblgrR99NVIHf14pM1DEmDbagzWQoItMmcJaUoqyD9
        DqPlDnpPLdKHD7V8WcBuWJ3tIfeFAM5Oyw==
X-Google-Smtp-Source: ABdhPJxTm5mn70PLqgKqCritkY6htT9+8T/qgjnwNl6hNwM7A0U2HCO3cNh9UJbjs7SpEttWQnH/YQ==
X-Received: by 2002:a63:4845:: with SMTP id x5mr5150324pgk.315.1614896369429;
        Thu, 04 Mar 2021 14:19:29 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id v185sm326985pfb.125.2021.03.04.14.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 14:19:28 -0800 (PST)
From:   Wren Turkal <wt@penguintechs.org>
Subject: Re: v4l2loopback and v4l2-mem2mem framework
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>
References: <45cda97c-a0e4-eef2-ba8f-ddc7e33b40d5@penguintechs.org>
 <4cdd691f-dc55-fc6e-1830-ac0c24b8e96b@penguintechs.org>
 <CAAEAJfAyuGwL==BHwyEwF0dMfrUQacEQyv8+zz82_P+BM-C5bw@mail.gmail.com>
 <20210304201055.78145b04@coco.lan>
Message-ID: <687af51f-c489-bb81-61fd-7e17ca38ec92@penguintechs.org>
Date:   Thu, 4 Mar 2021 14:19:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304201055.78145b04@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/4/21 11:10 AM, Mauro Carvalho Chehab wrote:
> Please, don't top post.
Sorry about the top post.
> The loopback driver is not something that could be merged. It was
> already submitted a few times.

I'm willing to develop something new if you think that would be a better approach.
I just want the functionality of the loopback so that OBS (or something else) can
be used to compose a video scene for use by all the apps on Linux.

> One of the main issues is that userspace may sleep, and this could cause
> some bad effects and even hangups due to V4L2 core and VB2 mutex and
> spin locks.

Is this something that could be fixed? If so, I am happy to try to help do that.

wt

