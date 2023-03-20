Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1A8C6C0EEB
	for <lists+linux-media@lfdr.de>; Mon, 20 Mar 2023 11:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbjCTKeC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Mar 2023 06:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjCTKdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Mar 2023 06:33:46 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C62FBA25F
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 03:33:32 -0700 (PDT)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 51416660308E;
        Mon, 20 Mar 2023 10:33:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679308410;
        bh=L+CGbnJ6J7Ytj/Wx4PJF44kzKsWq/OYxHHuaz5SrlXI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=TVlzEZvcAk6GmtCCb2KGTNGd7hwd99mCTK6vkNfxaVviyyf5RXCHkHJ+PpdeYqI/X
         1RG5lEb83dujIUNTbJX31aBnQgPJeFEafIIxeJ/KWinCga2VTiE0ieDSCghJxn270Q
         5LQqaA4LIsxw8AyNw250fdauYFWXl9ov0CAIG5Gode9EwpRYWNGt1wf9WHM8RyTHsh
         T33Dt2S7aaN/8X71lB6Y7FMpsC0DrXitabzecw8+WyDWErssf/XKkYEOwQczQ4qbLN
         VzdS18dPjiLxokhq5ghh8Y9mSz1XyJJ6cxBTT0IpoS72+OAFKWVOtDRgIMmaz2K2+o
         VUWEI+HjxpYjA==
Message-ID: <defe43a2-0521-a8f4-9575-4aa0a370a29e@collabora.com>
Date:   Mon, 20 Mar 2023 11:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC 2/2] media: rkvdec: Add VP8 encoder
Content-Language: en-US
To:     Daniel Almeida <daniel.almeida@collabora.com>,
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
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <a142c30ab49a8ff65c59bdc9bc0e4552c48bac68.camel@collabora.com>
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

Hi Daniel,

W dniu 19.03.2023 o 00:23, Daniel Almeida pisze:
> Hi Andrzej, one thing I noticed while looking at this:

Thanks for looking!

> 
>> +struct hantro_vp8_entropy {
>> +	/* TODO: int32_t? */
>> +	int32_t coeff_prob[4][8][3][11];
>> +	int32_t coeff_prob_old[4][8][3][11];
>> +	int32_t mv_prob[2][19];
>> +	int32_t mv_prob_old[2][19];
>> +	int32_t y_mode_prob[4];
>> +	int32_t uv_mode_prob[3];
>> +};
>> >
> 
> In VP9, probabilities are coded in the 0..255 range, so if you want to
> save space here, you can go with uint8_t.

Please note that this is a hardware-specific/driver-specific structure.
And, in particular, this is not a uAPI struct. The reference code uses
32-bit quantities hence int32_t here.

Andrzej

> 
> -- Daniel

