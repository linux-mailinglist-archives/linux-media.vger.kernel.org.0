Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3236F1381
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 10:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345507AbjD1Iud (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 04:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjD1Iua (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 04:50:30 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 502141FCE
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 01:50:21 -0700 (PDT)
Received: from [IPV6:2a01:118f:530:5d00:cf99:2017:1f3e:ff11] (unknown [IPv6:2a01:118f:530:5d00:cf99:2017:1f3e:ff11])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id AB14966032C5;
        Fri, 28 Apr 2023 09:49:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682671788;
        bh=VUJWFaoo2j2IhmVdPukw3fCfpFJlEcjndW0LyTjFVqA=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=dhr8gObYVoeCJm2bD91wuwTlxIrHt6ROrPTpNzv7B2nhtKM0Qsmp5vM3c7jsseqTW
         SMJCuKtyQoeeB02FMt88lJimo9QHaMm1zXcAPBhbxAPmMMZWyrByloRBFg5mr1GyVO
         n9GtBk8a8+7/00eT6S/USpGwlEoDe/iXyrqfLVKdeuN3HqAwS+JicN/RcxO2Ei6rAn
         K8QHeCjZX6C94W2c5ieZLgia/bAna8/RIB9JjNa2WbdGbL2lK/tLce4hi921r6/sfM
         q7JgQjYn5/o6u8c60ApfQOp2eHDM2C8bI/e4/JFUwx2ohmz01gAMpqm99KlU98WBUK
         5Y8j9n2lxcN4A==
Message-ID: <9d4c52eb-103d-e89c-bba1-89cac0e53600@collabora.com>
Date:   Fri, 28 Apr 2023 10:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [ANN] Request for Topics for a Media Summit June 26th
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <893a7e34-1d98-23e2-4d27-d25cb3ee5bf0@xs4all.nl>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <893a7e34-1d98-23e2-4d27-d25cb3ee5bf0@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

W dniu 3.03.2023 o 15:44, Hans Verkuil pisze:
> Hi all, >

<snip>

> 
> So if you have a topic that you want to discuss, just reply. It would be
> very much appreciated if you can also add a guesstimate of the time you
> need for your topic.
> 

I'd like to discuss "Stateless encoding in V4L2: Trying VP8".

I envision the discussion around these topics:

A)
- Introduction to stateless encoders and previous work in this area

https://github.com/bootlin/linux/tree/hantro/h264-encoding-v5.11

https://lore.kernel.org/linux-arm-kernel/20230309125651.23911-1-andrzej.p@collabora.com/T/

- High level decisions
- Rate control

B)
- VP8 uAPI

C)
- Challenges

About time: Let's try 45 minutes. But of course it is only a guesstimate.

Regards,

Andrzej
