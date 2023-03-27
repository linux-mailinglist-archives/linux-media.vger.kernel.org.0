Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62A946CA8DC
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 17:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjC0PZ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 11:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjC0PZZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 11:25:25 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD422D4C
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 08:25:24 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id l9so4803687iln.1
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 08:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679930724; x=1682522724;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SOaaceRUS3Zcv37ZPbi5fB5DA+SECBkpPAuvKpkTXec=;
        b=FAr5d9e/v1UD7e77B9m2iAh4O3zTAmnVC9qRnYR5TUKwEolSw5psmtII/Nl/UXIzKn
         H404fJNVrap8GLbEidgivmqVuW5ySXxbeOxKrSasRrGTU1a9N5IH+4G/eZse8SJc2arT
         mwy8ob0f/W7kmjPM+wfLtcs0H2iXNNSjHPTb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679930724; x=1682522724;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SOaaceRUS3Zcv37ZPbi5fB5DA+SECBkpPAuvKpkTXec=;
        b=eSYKN7oDBAO2mcsdWOCS1aSlfkwPt2y2ZGyt4afzWxdGLeEgpJeAzYA4isC4qXOznF
         cJS+H97p4ZvQK8PXGHF6eKrjV5EG5xsO2zpQ26ebHzqC1aVZB3UEDapGvjxx321vn88z
         7E5KhkEHmhc8H4lXiPTfQYb0qFXGrL0xTdDUdkal7mho+KK0PcZL27ZYS58PfQOpcYyU
         eSatFmiiLOJVsbq4JVPOgIectev0RrMLSvFMypyS2G7zqn/xMezhbP4i5AZNpfvTJaFo
         r+VJYgBrfhZ4p666epEyB4ujotOvno9DALKQ+0+Hu5XTvgIWzkeRZMDeJT+aedf9Fffy
         OeXQ==
X-Gm-Message-State: AAQBX9elpiI5Kb5qJV1KKhv4uCwJapnU52LbmjQD6XXhdpEcNpJV8SAW
        7LZew7kTDAsaClmaNvg2GqZ/eg==
X-Google-Smtp-Source: AKy350aRskGD6bRfN84aEcEpeoj7wulxSonER23hxlu2wmUCtA9QC0w+u3FWRRdKYSW7vLUhX/50xg==
X-Received: by 2002:a92:ca0f:0:b0:317:36d8:cfc6 with SMTP id j15-20020a92ca0f000000b0031736d8cfc6mr8449936ils.3.1679930723812;
        Mon, 27 Mar 2023 08:25:23 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id m18-20020a026d12000000b0040908cbbc5asm1884061jac.68.2023.03.27.08.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 08:25:23 -0700 (PDT)
Message-ID: <9cafaf71-76a3-5b5e-1793-27a8ce49b360@linuxfoundation.org>
Date:   Mon, 27 Mar 2023 09:25:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 114/117] media: vimc-core: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-117-u.kleine-koenig@pengutronix.de>
 <167990654945.2697263.6488572097757132570@Monstersaurus>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <167990654945.2697263.6488572097757132570@Monstersaurus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/27/23 02:42, Kieran Bingham wrote:
> Quoting Uwe Kleine-König (2023-03-26 15:32:21)
>> The .remove() callback for a platform driver returns an int which makes
>> many driver authors wrongly assume it's possible to do error handling by
>> returning an error code. However the value returned is (mostly) ignored
>> and this typically results in resource leaks. To improve here there is a
>> quest to make the remove callback return void. In the first step of this
>> quest all drivers are converted to .remove_new() which already returns
>> void.
>>
>> Trivially convert this driver from always returning zero in the remove
>> callback to the void returning variant.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 

Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Mauro,
How would like to handle this patch in this 100+ patch series? I can
send pull request for it as usual. It might be easier for you to pull
this in with my Reviewed-by ? Let me know.

thanks,
-- Shuah

