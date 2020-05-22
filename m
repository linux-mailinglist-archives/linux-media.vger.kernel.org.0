Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83BD1DEBE8
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 17:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730593AbgEVPdE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 11:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbgEVPdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 11:33:03 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79869C061A0E;
        Fri, 22 May 2020 08:33:03 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id n15so5126306pjt.4;
        Fri, 22 May 2020 08:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=3ilcLhqdRQ8Z/PzvBN+C3JsIPM0TNycFGq2+m/w7rOY=;
        b=hka3Aj+j1wlh/rLYg8FbS4/ueTrez8GlaFwP/YGgw5ZNFu81qO806MX6Ij/1TPJdfz
         Mfb1ctOvSjC8e1xnS7o8R4MrH6jCXI3v+kjNs6UWxGLt3m0libyHJeXu6EdJa1QePbJu
         25VKGQp4ERnmPqVlNGWuQIDRKg5EnuJORc0nC0buiCQwD4elhTHs7JXxN76m13KjIOgF
         26LDDzamoEfv6cBf45scUoFCT0tGOhInqL7qZpjKlr4rlutTkYHVQAW/c5Pmpf0O+a/k
         m0CtX/z7KDJ4uMy8lyKBPpxGbEYlaMBfcjD73FMyFE09o5z1uuwP4xbSfyzzjluK8kr2
         SJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3ilcLhqdRQ8Z/PzvBN+C3JsIPM0TNycFGq2+m/w7rOY=;
        b=BXQYeTNDv7PXDKR3RT+DzTZlK2a3d1eTplXrE4kJ+ozxCTgyeOlk7gCT1mrDSBSrNN
         ySpuCRwB2LkonDd9rj39OtZjE+gpBntLibzc4m9xyWftRDuVBh/0B6vDvxB6XaFdmanG
         2wCTWynOtafQEkF++FD+T+ztnUSYbEQTfQNqMQOTl1uiDGPQ8Wp3Z3Q5M0h9FO25whHT
         09FLyj0GPMnibDm77hpTgD42b9tg8MKJrroivR1rm+jdJPcucbq2gcKxOhN+jeXtYW7O
         VnXl57W71J1Qo7OijiA7TOvhoon34pLTIKb6wWhu6Uq+V5b5n0dHomSO3jR+dtkj8dZb
         ungA==
X-Gm-Message-State: AOAM5336k5elkROmypxzl/bKEbi3xwVeclO9DeirtnJxZ4zm13SA+yh0
        6VmLOC8jDd8oMw7bo5eBJ30=
X-Google-Smtp-Source: ABdhPJyBraQCp8grS+tg/y4C3LTcYKbBhKGr0X+WyySmbzdjk7B6wNgnWH0ZKj2fWGtRGzVtdLo4Dg==
X-Received: by 2002:a17:90a:248:: with SMTP id t8mr5568531pje.67.1590161582985;
        Fri, 22 May 2020 08:33:02 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id z16sm6650992pfq.125.2020.05.22.08.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 08:33:02 -0700 (PDT)
Subject: Re: [PATCH v4 1/5] mtd: rawnand: brcmnand: rename v4 registers
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
 <20200522121524.4161539-2-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <9568caad-9ac2-44be-d492-3e03f719b0d6@gmail.com>
Date:   Fri, 22 May 2020 08:33:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522121524.4161539-2-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/22/2020 5:15 AM, Álvaro Fernández Rojas wrote:
> These registers are also used on v3.3.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
