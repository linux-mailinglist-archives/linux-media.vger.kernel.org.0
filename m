Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DADE6C0F01
	for <lists+linux-media@lfdr.de>; Mon, 20 Mar 2023 11:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbjCTKfs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Mar 2023 06:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbjCTKfX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Mar 2023 06:35:23 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BB216306
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 03:34:49 -0700 (PDT)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 40F4B660308E;
        Mon, 20 Mar 2023 10:34:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679308485;
        bh=hpKGeEtlUThflQqRo4j1owubo31EL47Kslfe/FkC974=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=PzEKWEwMv5DA/i8wzaoToelcVJYLS2qxo/Ms9fPtiMd0iRS0R+h8p6ZM8zNJbzPIv
         axRMUb1/35L23nmNmM8x7hZEY9NMaN2V0C/cEJBbg6ogjdpbDM2oSdELMJNyhLyWFa
         Ik2gkrYsjTV28SEXje7P0ssV7hZ6iKltdG3QCPcPQhhhs6kTbw/XerySj75ProV8jB
         soTjcWlWhG2mABm1WQEumVpXbhkqzvcqpqJxjheCiNONZAbca7NNeEWw3nmcHnYfhs
         Al957GRKRlhxejQynYmj13JkUcy4Phlcya2chKnO4eRMTXxy8c0p/M0SR2icMdx5BP
         xdlh6dEFqEt0g==
Message-ID: <2aecb113-0c69-88ac-a726-66e03d9f0a2e@collabora.com>
Date:   Mon, 20 Mar 2023 11:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC 2/2] media: rkvdec: Add VP8 encoder
Content-Language: en-US
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com
References: <20230309125651.23911-1-andrzej.p@collabora.com>
 <20230309125651.23911-3-andrzej.p@collabora.com>
 <a142c30ab49a8ff65c59bdc9bc0e4552c48bac68.camel@collabora.com>
 <efd18d9b-172a-8978-bb9a-18bb0edda4ee@collabora.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <efd18d9b-172a-8978-bb9a-18bb0edda4ee@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

W dniu 19.03.2023 o 00:27, Dmitry Osipenko pisze:
> On 3/19/23 02:23, Daniel Almeida wrote:
>> Hi Andrzej, one thing I noticed while looking at this:
>>
>>> +struct hantro_vp8_entropy {
>>> +	/* TODO: int32_t? */
>>> +	int32_t coeff_prob[4][8][3][11];
>>> +	int32_t coeff_prob_old[4][8][3][11];
>>> +	int32_t mv_prob[2][19];
>>> +	int32_t mv_prob_old[2][19];
>>> +	int32_t y_mode_prob[4];
>>> +	int32_t uv_mode_prob[3];
>>> +};
>>>
>>
>>
>> In VP9, probabilities are coded in the 0..255 range, so if you want to
>> save space here, you can go with uint8_t.
> 
> BTW, there is a mix of int32_t and s32 in the code, the s32 is a correct
> choice. Similar for u8. Checkpatch --strict should warn about it all.
> 

Thanks. Something for a series proper (not RFC) indeed.

Andrzej
