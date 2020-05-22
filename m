Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D774B1DEBFA
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 17:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730306AbgEVPf4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 11:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbgEVPf4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 11:35:56 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042FAC061A0E;
        Fri, 22 May 2020 08:35:56 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id t8so3020506pju.3;
        Fri, 22 May 2020 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=4wdCNXtLCBDuaQgxslwagJe+zzLi/KwEIVvOHthZ9FA=;
        b=lMXrNEnZwyFHCTIUYQCX/vQQbMMWXZZ1cgsUTzUbv0uzYASdpjz74Pvn9J2lNeo5qG
         n8lAmMitNLS3XU+Dvm7n5dtGv69ZcTeC3prNug0xuG6ziSY31i71mJd7Ikgx3pUTsmOE
         aDR6v3dcWaM+k1kSNXjFyFxEYOTaZlzHm/FlUjmv8RwxSpm9Z0GxEamdrL5S2TaHnPZV
         2oOHVWQ/IEc7Ah9PnMWAj631PZmWyoJP/B1Ykp3ZDLZiGymHyOtaitrAaJcWjCh3Scrw
         f5xN7OMP9j0DWiFn9znf2g82a+qzz2eS19HTz8NbqQOHj+PdxHsJVCH44w2XIs5R0+pl
         eUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4wdCNXtLCBDuaQgxslwagJe+zzLi/KwEIVvOHthZ9FA=;
        b=T1IA77rdvnaXYemFbUZeHhFYu3ZL8M7sXO657AW/IcqTEciPZufDjCvBwQCjH0Vr0x
         wRJEsuztIIB1siYdaoHmpoV3GJoqHsDAzROsEutToCMx5zZHJ3vS+v3H0g/9F54qCk2Y
         WrGRIdNNScliHJEropnZq08IquYoWqa3cZ9Yrgj2OQWVzcKpPjKRuyiOb2JYI2Y9EnmO
         UqMsHincK06bSWjhx6f5TJ8RbjMmULoj2W03Z3z5dhRoxsurX7EEkqIgdn9h59Pbgn7k
         3mpo3eoEYujElo4BnVU99qpVg4AXkf6fWZWXG3GdJ97RMDFXKhJ9Oql/9jVXrSNC6ybv
         Jfcw==
X-Gm-Message-State: AOAM531ARhZxeOXpU1WdzLtD+/XOkXMRvRx9/BTW+wfKD4pIB3rmZ9YD
        byGoX6lQgdierB5yqxdzdnc=
X-Google-Smtp-Source: ABdhPJw+ak4OzmaMNaX8bIQxwr+3JWDXcjU/+4BS9DgGbPOeh4quf9fS3tuFSWoLUJ5CW0z30QIorg==
X-Received: by 2002:a17:90b:888:: with SMTP id bj8mr5154312pjb.148.1590161755506;
        Fri, 22 May 2020 08:35:55 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id t14sm6492463pju.42.2020.05.22.08.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 08:35:54 -0700 (PDT)
Subject: Re: [PATCH v4 3/5] mtd: rawnand: brcmnand: rename page sizes
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
 <20200522121524.4161539-4-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <ccfca7bb-a0e7-aa4a-ef3c-a004708e9718@gmail.com>
Date:   Fri, 22 May 2020 08:35:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522121524.4161539-4-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/22/2020 5:15 AM, Álvaro Fernández Rojas wrote:
> Current pages sizes apply to controllers after v3.4
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
