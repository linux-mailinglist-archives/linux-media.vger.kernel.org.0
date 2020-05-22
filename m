Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9341DEC09
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 17:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730666AbgEVPgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 11:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730180AbgEVPgT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 11:36:19 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113ADC061A0E;
        Fri, 22 May 2020 08:36:19 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id v63so5351139pfb.10;
        Fri, 22 May 2020 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=lnZ2WUm5gsoHVGLrikaUs+9dOq4WzhfyiayZ5tcorxY=;
        b=QmiQilkrdsdW7escgA0eMPFnT4ESnOYHA3VvFSSsblONz8F3ljC5oJSjHRSN/Hk5Lz
         H+NK796zZH2R+HfLsSD+MZeu6Gndlde05bXvqHNHRYDgDvNwlvcxRe6Vv546gUbJru4Y
         Qc8RmxHxg5AbG2YJ+J2oof+brW9Bca6apzHVVxT5k/g+L4xXaDcMu815ZiePspVMkHbV
         TxFwE1cPBAUfsch9aGjwBiSomzCTwZGRQutpUyXE97tog3VabZEynqYltU7VA6uWdPnQ
         fQNLnx04gGbYnxS38RsDVol8zMAvtCedd1sKCPuIaZfhSTozJe7mbANv6ObPH6409u/J
         AKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lnZ2WUm5gsoHVGLrikaUs+9dOq4WzhfyiayZ5tcorxY=;
        b=nxcWiNIAvLAHrK2UCS7qKP/djfCfuae69lM73TIEPeR5vDtcp548VOxTRRDFTm9XTH
         LrC4Oh/FAG9vL1Bns2Tr6B12gsvH/JAeIytdGKPCVzAQFAVDrFYQbrR0zn79OIxid1/y
         UfcxxrjPJW4Hm+9i6IIUXDLzBiu0y7S/2f1RclxSL3XJsgvFmmFpWUr4JUSwbylcqOGP
         Hc/jrod1OkaWp6xK2x68zN2Kx/4fdOFi87z2PLHOwod7+IfBQkp3UR6TUGZXPC0Ggvzg
         huG1zTSYG6saqvLiTWZiH7R8WMKDO9IKQgXMipKppc2Xm9qjz3TRqrS75THF+/gIa5aG
         IpJg==
X-Gm-Message-State: AOAM530TuC1gB2mxB52j7mjNHSpZKP93LXgl5x6SBEi4R4eIWbl5Bt5m
        K92sP+/cNTSBeRxlAXttNx0=
X-Google-Smtp-Source: ABdhPJxCwZDXgvMJcaOXUWcZ2PD97knGPGulsi1s9hQZScdEGIe+g4LIaYmUPWF2UsEdb50ExqvRQA==
X-Received: by 2002:a63:794a:: with SMTP id u71mr13725179pgc.89.1590161778568;
        Fri, 22 May 2020 08:36:18 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o25sm6395243pgn.84.2020.05.22.08.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 08:36:17 -0700 (PDT)
Subject: Re: [PATCH v4 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
 <20200522121524.4161539-5-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <742a0b02-6958-608e-1e8e-6da2dbedb2f8@gmail.com>
Date:   Fri, 22 May 2020 08:36:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522121524.4161539-5-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/22/2020 5:15 AM, Álvaro Fernández Rojas wrote:
> Added brcm,brcmnand-v2.1 and brcm,brcmnand-v2.2 as possible compatible
> strings to support brcmnand controllers v2.1 and v2.2.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
--
Florian
