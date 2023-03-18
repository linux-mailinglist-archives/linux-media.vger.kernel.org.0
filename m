Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5FBD6BFD71
	for <lists+linux-media@lfdr.de>; Sun, 19 Mar 2023 00:28:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjCRX2C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Mar 2023 19:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjCRX2B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Mar 2023 19:28:01 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EFF41F4B3
        for <linux-media@vger.kernel.org>; Sat, 18 Mar 2023 16:28:00 -0700 (PDT)
Received: from [192.168.2.157] (109-252-120-116.nat.spd-mgts.ru [109.252.120.116])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4B6C86602FCA;
        Sat, 18 Mar 2023 23:27:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679182079;
        bh=QDpYTfP5Nl+tyhNy705vCQcvMrV8hZy9oCjs9iAWG4g=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=AJSq8BJo0bfS84aE/ePOKY3WPloP1KpgI3DbNp4npS9TUBvG2yWswcOh+hx6tHnL0
         NUU4d0ttF4Yquqabn8OuN6QFk9HL6axhJJm41ddatXql8y9/y/rV//GWSGWR+29GV2
         KsDLOBR6w02KAr8/kumgm0j4tUuHgKntyQrLFVBkKzvpC+lV6KwTfo+IfCAXGE3jvY
         XBJT1e40dzVMq2AWZI2QJu6FVOuOdpxiJCMzAIm3zbrBOiLRoLA9qDyGS/E7ivfynH
         TBDP8mqDDiYcFReX7PYZ1vqbtAbfvpcJwSAq545RBCaxNwSBqG2znYgLxPxcyHh5D5
         GgUFkyb56Oobg==
Message-ID: <efd18d9b-172a-8978-bb9a-18bb0edda4ee@collabora.com>
Date:   Sun, 19 Mar 2023 02:27:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC 2/2] media: rkvdec: Add VP8 encoder
Content-Language: en-US
To:     Daniel Almeida <daniel.almeida@collabora.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
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
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <a142c30ab49a8ff65c59bdc9bc0e4552c48bac68.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/19/23 02:23, Daniel Almeida wrote:
> Hi Andrzej, one thing I noticed while looking at this:
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
>>
> 
> 
> In VP9, probabilities are coded in the 0..255 range, so if you want to
> save space here, you can go with uint8_t.

BTW, there is a mix of int32_t and s32 in the code, the s32 is a correct
choice. Similar for u8. Checkpatch --strict should warn about it all.

-- 
Best regards,
Dmitry

