Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261F11CCC03
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2020 17:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728681AbgEJPjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 May 2020 11:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgEJPjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 May 2020 11:39:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C8B5C061A0C;
        Sun, 10 May 2020 08:39:32 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w65so3516679pfc.12;
        Sun, 10 May 2020 08:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=seBRUeC3dXeweg1N46JHOrRIXAJ2J/eJ5PgpRDXu7Xc=;
        b=s4FTilbcUE8qHtABX9tC1pNRpLYSHM1TMUlKxdLHfC5Tof1lVZLrrpHEv2HJURUQAt
         gOqR0S6tdssLEU8p+wfY3407Y7n55X6ZgOiSWOYBr3SW7vwyDWMeXdxrGbFvIvTEKK8M
         FUxjaYGr2auuqB8f99EyUk5Eo7XSa1/dZc5OnGudxkdFz5beN77mjR7VSeXtEO8+G4y1
         URSuKE3HIbfwgkv/ma0LxIZF9/TwzVBUHO28l1oHJuKxu1bRlQYBtHpFvy6Qd290+Chv
         SSJwqDx3X/p7oMekjkjXbZrakW5q0inyzqjAfWSP+dub16WBR639QzqdIKuJgV4pEiDj
         MAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=seBRUeC3dXeweg1N46JHOrRIXAJ2J/eJ5PgpRDXu7Xc=;
        b=qSz5Mq5brMM+/2I+3e6MuoWc8h9ONlBd+v4In8bQUCSzy05CcTgqe0xNCn9tM+6Ufe
         uBHSg9vvm5LMeqwM1Iuck+graRSAwcbMF8gqRPmtvJ13Nu99ThxdymwD29MrIjhDuYho
         gGJoyXeQrD9kMJdzOiZ1OxQ7jHrS3+2AmqbdpnBna7JPa6PGvwt7/lNaQ+AHFeHmlCvl
         gMfDEjKOod2NyLP/TcekIhVsWY7K8404STshiO7V4hWqFW/v3vnG2QfLRREOREc/999t
         vfl84YyF98Jv5aoEtEu7w+eLTCvKWkrjJfKquM/Zbgofaa5cGbo3d+1e2EVUn9mzDp8e
         64Uw==
X-Gm-Message-State: AGi0PubzWF9KodfRaI0GTND+0NJdpnbDFH93MrkKSQhEUwZZekTJ5zgK
        GdBRJkQJ2EcrJ2dwyG8qG18=
X-Google-Smtp-Source: APiQypJCzqQ1G38MUBlHGJNY+XRYSsDfA3QS/iaiPMPTtOCZltcGYKqYDBQ/vmE4+rvfmkAA0ntZVg==
X-Received: by 2002:aa7:9432:: with SMTP id y18mr12463677pfo.82.1589125171929;
        Sun, 10 May 2020 08:39:31 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id s136sm7208036pfc.29.2020.05.10.08.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2020 08:39:31 -0700 (PDT)
Subject: Re: [PATCH 3/3] nand: brcmnand: support v2.1-v2.2 controllers
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20200510151406.2527856-1-noltari@gmail.com>
 <20200510151406.2527856-3-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e0b9365b-f22c-ac56-481b-ab21490a3409@gmail.com>
Date:   Sun, 10 May 2020 08:39:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200510151406.2527856-3-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/10/2020 8:14 AM, Álvaro Fernández Rojas wrote:
> Tested on Netgear DGND3700v2 (BCM6362 with v2.2 controller).
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Can you fix a couple of things for your future submissions:

- for patch count > 1, please provide a cover letter introducing your
patches

- for this specific patch, you are missing a Device Tree binding
document update with the new compatible strings you are adding

Thank you!
-- 
Florian
