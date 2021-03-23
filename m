Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E799C345576
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 03:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhCWC0n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 22:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhCWC0Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 22:26:16 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F10C061574;
        Mon, 22 Mar 2021 19:26:15 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id cx5so9733695qvb.10;
        Mon, 22 Mar 2021 19:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vVo4FApJALJ1xuAq2TcN72ZgoqnSObmGOyddPDA53sc=;
        b=U/FLFFoBgu6oCLWZPmWFM/avHLNStaZ8Z9H9LP2CPuACOIltBbwXiZMrn7dgMGf+pL
         f5TlGIuO4CCaWyOye6exMndYPTHWhIQwfacCZKDbE/XcNxDanJmJE3s5FHrjVv1OZa+3
         4VoKXCLmh1KExXiiE5XaoTVMYytrfWfoSySVxn7yPpAv6+1o7sPPtcwya4hhdmA1ahpn
         Ug4X3jp+t4MCUsufb69wSrWLmdLVR7pcFg+c46ZiZNjbdbmEoFUrtMqLkICT/i1LHxUC
         bW+3yY+KJwVP/B7Vzah1xadaeiz9+gXa2A0Y9eavaAOnOPLZAcmE/FAVu81Wzp8mKZet
         UIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vVo4FApJALJ1xuAq2TcN72ZgoqnSObmGOyddPDA53sc=;
        b=PXBGtb72zHB3mbfYoTl6wXIUiY+fw3QD47vZJNiKnKN71Qc6wGdIrrtf7yhvwTpSJJ
         +T9HXk5Cns6/6euhFvU9H9sq+tjKXgu1zSSPrfu7uVOJG0hIKSdjuuJEvpPoH27asr4U
         J969QEXcb6fB/wyr3LMpPh4msnt1QwjkbGnNeX3GUA2x0JJQXX6mEVu8h2Kp+Wt5O8DT
         XiNMppCKDHSOM15k4jOxB4CgNkXPn+DkQxAPSZZiOp4a5VOOfwt4Wg9FZcMSLNwzLR/J
         iwotPhxShWiYdhbLVKpAADuKa2bAQaTLp3ZEzdf8l0vI5PnkOZ5hl3mIsHc5a3eQwnfo
         frIA==
X-Gm-Message-State: AOAM5338UvJoVviTx1bdSs2nfXxozEKAJAEk1nHmz6yAX5NbpobA6Ivy
        oGBvH1YJ5jBQf3ctK9+tVvY=
X-Google-Smtp-Source: ABdhPJy45bGOizVa76luzvNz3xVCpJ/lCTC3Mod4nBKlxyK/F5L8HVD0cFeWYUmvzfuysdvUeLz2hw==
X-Received: by 2002:a0c:cd0f:: with SMTP id b15mr2712664qvm.49.1616466374956;
        Mon, 22 Mar 2021 19:26:14 -0700 (PDT)
Received: from ?IPv6:2804:14d:72b1:8920:9d72:75bc:e42b:f19e? ([2804:14d:72b1:8920:9d72:75bc:e42b:f19e])
        by smtp.gmail.com with ESMTPSA id r17sm10104182qtn.25.2021.03.22.19.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 19:26:14 -0700 (PDT)
Subject: Re: [PATCH] media: test-drivers: Remove duplicate include of string.h
To:     Wan Jiabing <wanjiabing@vivo.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net
References: <20210323014724.137234-1-wanjiabing@vivo.com>
From:   Daniel Almeida <dwlsalmeida@gmail.com>
Message-ID: <e8094382-59db-3fed-501a-2a31768deefb@gmail.com>
Date:   Mon, 22 Mar 2021 23:26:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323014724.137234-1-wanjiabing@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wan, thanks for the patch!

Unfortunately, however, a similar patch has already been accepted [1]


[1] 
https://patchwork.linuxtv.org/project/linux-media/patch/20210306113255.217387-1-zhang.yunkai@zte.com.cn/

-- thanks
-- Daniel
