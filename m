Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 777B472ECE
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 14:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbfGXMZx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 08:25:53 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:39382 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfGXMZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 08:25:53 -0400
Received: by mail-pg1-f182.google.com with SMTP id u17so21161309pgi.6
        for <linux-media@vger.kernel.org>; Wed, 24 Jul 2019 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Jl3Wrgbi+jYdrYbjQQTLUfLIhc8mm2Aduf7YUtmq+gE=;
        b=mRj79q19bG5nGS9PszyHesahLlznGTS1sTIhbBOPEximirhG+nOz2cUrYGi3XO/esY
         +QZG1JhWv7LxMEmsTrFD1KMl5WNx5A9yt/gm6hBjSvOU/ZPer9Vi/3SeYGm/jwU1ppgU
         RMH861AMz9RWZSkTR8BItaaiGCThOUUwdvl+9UhWCIibt2oQHfAo0OH5H3BGeatii2qI
         1ps7snSyCErtG9h03F32pYJEBr52wDjT+sn9Y2ZEgNHQ6FTImnDdathj4HnTAav0u+ii
         wx3tHoet2sKgVZjQ1uc7w4WYdzRIQiPHLNSPrM1e3Y5LP2uz+QdbKxgVgcVaYrvbwYGe
         1sPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Jl3Wrgbi+jYdrYbjQQTLUfLIhc8mm2Aduf7YUtmq+gE=;
        b=V34GxnsxpO0t7pKT+BzwkZPiTS6DyMTxtZn5qvMS+igDSx+uqR49ZEzP0jgZGesont
         4vPbg44TS8sFKGRQ0vhJs0oi2BMN30/t02MGdsQReQ4VdPcqLN0n1LrfqEYTqVORX+CY
         YbB1r06h66Nk8RuAPI0veRKzJ4MKjzWff4FUk1RCRpHsYmRnj9N+Yy+OxnPOKMgGMZmi
         2ehQjkoPzqh8rTMbPVENbUEbSowetEgJJ8ScsVHTFZgZnVfRN6cMTxWWT2CLOyiiilML
         AVopNKspizq4BIXN3uVM5HlWV/L83TDuGSuL8i1U/qI9R3Ch4M2v66FaWhxrsvM9vFad
         bRcw==
X-Gm-Message-State: APjAAAUJP3AEqu+WD37kNC/hievThur89R6vreD4FFvz/S/5DEKD7eaJ
        DqfN20QTAJw14pR5pbtX2bilfnxWw0k=
X-Google-Smtp-Source: APXvYqwRGX3hMZPjIgM+NFpVQAA9j6k8mu873UIcGdQRx1Fv8Ir5+sV4DblmreE+nf503F18/Z4Vtg==
X-Received: by 2002:a17:90a:2023:: with SMTP id n32mr83886905pjc.3.1563971152812;
        Wed, 24 Jul 2019 05:25:52 -0700 (PDT)
Received: from [10.0.2.15] (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id m31sm53062587pjb.6.2019.07.24.05.25.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 05:25:52 -0700 (PDT)
Subject: Re: tw686x driver (continued)
From:   =?UTF-8?Q?Mark_Balan=c3=a7ian?= <mbalant3@gmail.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <84ab52c4-9ea7-c526-c628-47d678ccf926@gmail.com>
 <CAAEAJfDgEVMWbYkEaVp0mp4hQXbhZq8xJQM8xqCXGmyq7OaP9w@mail.gmail.com>
 <2586e6ca-da28-ac87-35dc-dfa6ae66f67d@gmail.com>
Cc:     linux-media@vger.kernel.org
Message-ID: <35ebabef-46cc-f4d0-3e88-3d8f4243c685@gmail.com>
Date:   Wed, 24 Jul 2019 05:25:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2586e6ca-da28-ac87-35dc-dfa6ae66f67d@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

(sorry didn't include linux-media in first email)
I'm not sure yet if I have my supervisor's permission to declare our 
tool as open source, but I'll tell you the possible code paths that I 
think may be leading our tool to think what it's thinking.

First off, it detects a write access to desc->virt without locks inside 
tw686x_memcpy_data_free, after it is called in the calling chain 
tw686x_probe -> allocate an interrupt line -> tw686x_video_init -> 
tw686x_set_format -> tw686x_memcpy_dma_free. Further, 
spin_lock_init(&dev->lock) (line 319 of tw686x-core.c) isn't 
correspondingly closed in the function. Is this intended?

Second, there is a possibility according to how I have traced a call 
chain that tw686x_init is going to the error: label since 
tw686x_memcpy_dma_free is getting called inside another possible calling 
chain, going tw686x_init -> tw686x_video_free (error: label) -> 
dma_ops->free (i.e. tw686x_memcpy_dma_free). I would assume this would 
not be intended either.

In addition, our tool detects a read access without locks to desc->virt 
inside tw686x_audio_irq (line 72 of tw686x-audio.c). Not sure what you 
make of that, but I'd be keen on hearing about that as well from you.

Thank you in advance,

Mark
