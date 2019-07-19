Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 088816D880
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2019 03:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbfGSBmB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 21:42:01 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35080 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfGSBmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 21:42:01 -0400
Received: by mail-pl1-f195.google.com with SMTP id w24so14790373plp.2
        for <linux-media@vger.kernel.org>; Thu, 18 Jul 2019 18:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=bQcjBBEkNXjFEzOz5x+1NCK+cPdy1YIVYsXzLeO1qDU=;
        b=gr2sNrCEux50zngYM/NN8xQvDBXeoiHtrru54pv0sHGSuTUHGOQFenifrorXXW19Yr
         8jmC0/wBHe2NxaWuaM5KZ3OAvJh7svcsOJiVWF0g7iu9Dzc6oXGMsvZ70qzdMPwUyzZD
         0UhYIrPnOLfk5/3LOM3TBi3JqcQ/kHW2ft1bLpN5Sq7TIfGVSgbI6P6xJgZZB8x38MtE
         C/kIlGirQsQgziUfYzxS+OcitMTlIYbzdJVDxbLtfam8eAgDKCg95bObpvcX0jmc8krB
         neqtq25YRyJJVWmZtzlzlfJ+I+gZBUVfMuS3haDfAmvX4gfTSSVWj9Dux3L2Nr/Wpcs2
         bOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bQcjBBEkNXjFEzOz5x+1NCK+cPdy1YIVYsXzLeO1qDU=;
        b=PefiMVTEE3EQo1BlITk70PEY8cuX1vvtN4F4GTC/ZMpKWzuFa+0G03BH/278J1c11z
         WwCniPmqNh24RCC2V4fznv2NLbbtSIZt0qKMeh+qwTPJXKCVdcevHYugWkdm3bKtzvkS
         bq+CrGxrtqEuFJ5ad1xcAwi5JN9n1hYaLQiIURsssKWX2P2ElQjBPL65V7bJ6zqReW3y
         +gssmz5FvGD2BVm38CU95IpFYR5Yy6gSyAXltYCWeI+N0t0SqrC2T7ela6a5CBeWiJVR
         Imo+EIvkuwMj2IByhzLRWaWSgBw9hCPi8vVqi1ub7iGAByGF/Im/ZsNJJdLD3QGCKnGv
         FRIQ==
X-Gm-Message-State: APjAAAXY3cKV0OrRhmk9eFgXD6u0uogTOCv12v6L8dJZmOCSEy6Ke6Ox
        XjriW4oR5JN77lYMC5hVFmYATJwmUto=
X-Google-Smtp-Source: APXvYqxTPUPLx112YIk4isAriCFLp/Uc8xcApIFdSS3PKz2aDCnLKVBujPICXdppSG8FQlHFg1pXLQ==
X-Received: by 2002:a17:902:6b44:: with SMTP id g4mr53224491plt.152.1563500519857;
        Thu, 18 Jul 2019 18:41:59 -0700 (PDT)
Received: from [192.168.3.4] (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.gmail.com with ESMTPSA id d23sm23075221pjv.18.2019.07.18.18.41.57
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 18:41:58 -0700 (PDT)
Subject: Re: [PATCH] media:dvb-frontends:Return if Max devices are added in
 dvb_pll_attach().
To:     Vandana BN <bnvandana@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20190717141204.19433-1-bnvandana@gmail.com>
 <f8d9af33-d7d8-22d1-428f-b7b7c1d84062@gmail.com>
 <1c150bc5-0b15-23bf-2170-758c9cc046e3@gmail.com>
From:   Akihiro TSUKADA <tskd08@gmail.com>
Message-ID: <2912b5af-ae8f-e6c9-0e74-8790f5762997@gmail.com>
Date:   Fri, 19 Jul 2019 10:41:55 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1c150bc5-0b15-23bf-2170-758c9cc046e3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Will it be better, if dvb_pll_devcount is decremented in dvb_pll_release(),  instead of removing module params?

But you cannot know deterministically which device corrensponds to
what "id" (when you have multiple dvb_pll devices),
since "id" is dependent on the history of register and unregister
of dvb_pll devices.
So I wonder about the benefit / practical usecase of "id" parameter.

--
Akihiro
