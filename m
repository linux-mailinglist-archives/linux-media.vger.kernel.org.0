Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8FB407E22
	for <lists+linux-media@lfdr.de>; Sun, 12 Sep 2021 17:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234355AbhILPvK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Sep 2021 11:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232231AbhILPvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Sep 2021 11:51:09 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4878BC061574;
        Sun, 12 Sep 2021 08:49:55 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id g1so4078888lfj.12;
        Sun, 12 Sep 2021 08:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EmaR3mw88t9sUDxC5TH9IKso00i9J8FNQ4ju9r70OL8=;
        b=i4cmIAukr7uGSEzMdzDm9CwZ0hsI/H6HtVgnePYg3MnNYGvzCZWE1It1f97QlvZyrF
         /iJBr/qB2UUJPrn2pOmjaNSYv465/HlrsiOyARDEAcIBz/JALJkSP8n6amFoSKUTxnts
         bV6zRN09eJiTcHcO78o43oAwtjkokreVEV8MDL9CbSY/Foaf87za17Rlrp81C4SLQhDI
         onYU+FSvTDsC2HYu4AQOCnlJwI11LvnkAfup2wSz2puVsPYdXrc7lstPo5hEuHrmIzzv
         Czn7jyET3SR2P7OTyBDG5nCDNddn9KowWwtSeptacq0mUAvVvT9ak/xRAPk3jfn2aQWu
         fDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EmaR3mw88t9sUDxC5TH9IKso00i9J8FNQ4ju9r70OL8=;
        b=nceE8H/qavIz14Pcb4tpbhahYvfOn7TM9i5TiG3p/eNpSvXKtRpKVjqfJedtZnCiTL
         I/flEMIGRueMQL+By7DEFZXAIEOb4dKrNl7PPynlgdQQrzf6hZCdiJw6rNRZ9CO34WQh
         2lRtIPRj8XBiNU9ZnSxB+OAuNSyLGb5BaAcX2Mij2oTB/inQuSPLGraY5cAiLDdK7lO4
         bXSN9RvmiwV3jIWeXWwU+CwOLj/Oet1pMLeX1uCoYF50E2dnZKu+AZhBlGL1Mrg9Ho0E
         YnRn8DOQf6IAne6QW4EO5QEpARMgBQKlV5OIhMtZroO8Q0Xe73ty3T65G9kIewK3xBQI
         7yNA==
X-Gm-Message-State: AOAM531M4StCOWH+r3i47L5GzDCV4yfI8SkxlCnf7ZKB1rsEXxGm6TkA
        uuX8zrMYDCNSgtppkPG8rBg=
X-Google-Smtp-Source: ABdhPJyZghj0UBqn34NGnjP1+doKihi0Muaw4yMqq8Rw4blefC+7AD17b7xTmBpEWT3cLwCN6vvJsw==
X-Received: by 2002:ac2:4185:: with SMTP id z5mr5901276lfh.391.1631461793597;
        Sun, 12 Sep 2021 08:49:53 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.70])
        by smtp.gmail.com with ESMTPSA id j1sm547304lfe.153.2021.09.12.08.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Sep 2021 08:49:53 -0700 (PDT)
Message-ID: <c1c0d250-afa1-254e-421a-d35790688c60@gmail.com>
Date:   Sun, 12 Sep 2021 18:49:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH v3] media: mxl111sf: change mutex_init() location
Content-Language: en-US
To:     mkrufky@linuxtv.org, mchehab@kernel.org, crope@iki.fi,
        sean@mess.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
References: <20210819103859.17498-1-paskripkin@gmail.com>
 <20210819104221.27122-1-paskripkin@gmail.com>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20210819104221.27122-1-paskripkin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/19/21 13:42, Pavel Skripkin wrote:
> Syzbot reported, that mxl111sf_ctrl_msg() uses uninitialized
> mutex. The problem was in wrong mutex_init() location.
> 
> Previous mutex_init(&state->msg_lock) call was in ->init() function, but
> dvb_usbv2_init() has this order of calls:
> 
> 	dvb_usbv2_init()
> 	  dvb_usbv2_adapter_init()
> 	    dvb_usbv2_adapter_frontend_init()
> 	      props->frontend_attach()
> 
> 	  props->init()
> 
> Since mxl111sf_* devices call mxl111sf_ctrl_msg() in ->frontend_attach()
> internally we need to initialize state->msg_lock before
> frontend_attach(). To achieve it, ->probe() call added to all mxl111sf_*
> devices, which will simply initiaize mutex.
> 
> Reported-and-tested-by: syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
> Fixes: 8572211842af ("[media] mxl111sf: convert to new DVB USB")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

Hi, Sean!

Did you have a chance to review this patch? Thank you :)


With regards,
Pavel Skripkin
