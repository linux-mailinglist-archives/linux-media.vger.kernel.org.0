Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5B61DEBF8
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 17:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730261AbgEVPfP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 11:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbgEVPfO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 11:35:14 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2F1C061A0E;
        Fri, 22 May 2020 08:35:13 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q24so5132682pjd.1;
        Fri, 22 May 2020 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=RCkeT00nFyzOKJ0+m+uJ8VynyJ/HzcwB7W5G+s1+HFQ=;
        b=ZyEjGjfVAGpMkGbpvjctw5r6a+y42f6pLVMkAR72nfmVYJWKuLh9Z9LOMiH8gnDaL6
         vfE3cs/dkHcHuHUL7HhadRpLiMHYAz6xRAZVohzb46Wq+PQZICAHpROFPW9MedDUYlqe
         DoDszFn5FVXfwcy0P60SvL3sVk61wulHHvdQ87w02n7mMLbGp8A4P9jRO0LYggtJ5OHN
         mfyGrRdc0IgkDTNjQBk2tZyXon/78PsAAYmpkCxfVpRxUkAAixffymW9Lp+ukAt6J9ny
         HxX+MnhgpXk2o1cN3IJTdbKxof8S7FqiQtKs6sThQVgSfvNM0lZ92FsI6ztavkl3Oz98
         n/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RCkeT00nFyzOKJ0+m+uJ8VynyJ/HzcwB7W5G+s1+HFQ=;
        b=oPRQOkCK2aysaVPKHqS2B0FqYK+pXLKkGYKHBP34vO/4F9s2lZAyclud7yo6Dy1Rzs
         wh26XAhVNhxd9GVB1YC/Ri5gE7pHQXqYIiySGzfFj//R97is1ki01GDoRAWmcIYuJMEY
         /Cye5EO8x6sVW9u9n5tCLpOYdbiOgRzhwZh9JLPYiVsUF+L6D907Ab5c8ElUaOjOcp9F
         Kdj3T74UbmXqGwFKnuXzk10KE6cvqLEDEY+2KGJUKk9d1IiH5en3KDxHUNAUFCwk9F1w
         J8em+aHLvJFR6EunYFkKm0lS4lw+wyEti2Fe4lk4MmhNTyQSTTGxyMqmFCe0S/EXjyPn
         eQZA==
X-Gm-Message-State: AOAM532v1TgkC2N6VFVsKFOb5sWfRLP+Q3Bb2gpYwsXbDLsBUiqYep2I
        e6azAYSvwjzPrL4H8BeoGO4=
X-Google-Smtp-Source: ABdhPJyVE7XYQOeWFksysNTqtqAThQuG7jrq6k2DORMDvAlzLJ9FncCFOTiP2lUa+Gfqd6KeUeL6aQ==
X-Received: by 2002:a17:902:868d:: with SMTP id g13mr14962098plo.246.1590161712982;
        Fri, 22 May 2020 08:35:12 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id g27sm7545812pfr.51.2020.05.22.08.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 08:35:12 -0700 (PDT)
Subject: Re: [PATCH v4 2/5] mtd: rawnand: brcmnand: fix CS0 layout
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
 <20200522121524.4161539-3-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <346c2834-3ed6-4813-7f32-d2dc8bbc4885@gmail.com>
Date:   Fri, 22 May 2020 08:35:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522121524.4161539-3-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/22/2020 5:15 AM, Álvaro Fernández Rojas wrote:
> Only v3.3-v5.0 have a different CS0 layout.
> Controllers before v3.3 use the same layout for every CS.
> 
> Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
