Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 444F56321F2
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 13:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbiKUM2s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 07:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbiKUM23 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 07:28:29 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 388242BEC
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 04:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669033646;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wKxH9/fWSqKGEkCfEcHmUeJnfpLMxgDZZRQLqro+QtU=;
        b=jWUdQRomgeUvORZC/QY5kwJLFVL8zc7/wfia9uNBGKeQSeQZk4JJiiPu/49N6Ja2esdbe6
        siAoyoL6mzmj8CQkB6I7W0WGdSpOWO/JIOC5LmwDOWrDtFzStHpKK6wRc/Kj4i03lequdH
        FXPxKvIeR1W5pwV0wDAaeGjm+zee1Kc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-yFBolZ4wPwyM041isgYlXg-1; Mon, 21 Nov 2022 07:27:24 -0500
X-MC-Unique: yFBolZ4wPwyM041isgYlXg-1
Received: by mail-ej1-f69.google.com with SMTP id sb4-20020a1709076d8400b007ae596eac08so6648365ejc.22
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 04:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wKxH9/fWSqKGEkCfEcHmUeJnfpLMxgDZZRQLqro+QtU=;
        b=VyqNLqo42dMlol8DbhSuIhek+mo+IkaavPPQweMWZrQlF55De8lJnOHaL6rW83i5Ru
         9c5gDJGDWaT976qGRU0j3mSq2Qmdd2VrYpagYwzbYeSVDEoQ7bEXFQpt60rO1juLsof9
         BjStgi8w+sIostdns/YZ5D0YsFkFmlLiAbFBMgp5N/moGzeIZ0rDFFZska/h4tTNENPM
         OQxtmE6Fu6hK1LiDzGrbKYb2ZVqwY+xRMBIJK44eMWiW4Vb4BorymE6PMZahDhoZan9K
         YNR40P+dMNNQWavraiHB57YrJMjE6vtyUvp7HeG0NjYPRPVE96cRcAOg5XgO804ctUFD
         2GFw==
X-Gm-Message-State: ANoB5pma/l/Qi+tFnPtr6GXrLJnALWm+q3mJHJUendbHm/Wn1cbY1ffU
        0qev0ba8Zux+9h9PiUzeDbascsdq1ZZHGIaVr0vWOWMd5jj1mbM8/gD8iaUSYfcE9S1zB54zy4Q
        nPow22OVMpz5A1N8U+T98eHI=
X-Received: by 2002:a17:907:7782:b0:7b6:dd6d:b829 with SMTP id ky2-20020a170907778200b007b6dd6db829mr2456661ejc.602.1669033643586;
        Mon, 21 Nov 2022 04:27:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ca6+OaZv/0S/phi/znpxDmtprdtWtxlfAkP2Y7dCPF6UJn5q16s1ThL3qZr3Xb02QVOsGTA==
X-Received: by 2002:a17:907:7782:b0:7b6:dd6d:b829 with SMTP id ky2-20020a170907778200b007b6dd6db829mr2456640ejc.602.1669033643352;
        Mon, 21 Nov 2022 04:27:23 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b007415f8ffcbbsm4999398eja.98.2022.11.21.04.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:27:22 -0800 (PST)
Message-ID: <37d912ae-b33a-3be2-30d1-4fa6b6ddf098@redhat.com>
Date:   Mon, 21 Nov 2022 13:27:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 01/20] media: atomisp: Silence: 'atomisp_q_one_s3a_buffer:
 drop one s3a stat which has exp_id xx' log messages
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-2-hdegoede@redhat.com>
 <Y3s84dzxX3ARSZPb@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3s84dzxX3ARSZPb@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/21/22 09:54, Andy Shevchenko wrote:
> On Sun, Nov 20, 2022 at 11:40:42PM +0100, Hans de Goede wrote:
>> Standard v4l2 userspace apps do not consume the s3a statistics block
>> data. Until we have a userspace consumer for this (libcamera), which
>> might also involve changing the API for this, lower the log level
>> of these messages to dev_dbg() to avoid them filling up the logs.
> 
> ...
> 
>> -			dev_warn(asd->isp->dev, "%s: drop one s3a stat which has exp_id %d!\n",
>> -				 __func__, exp_id);
>> +			dev_dbg(asd->isp->dev, "%s: drop one s3a stat which has exp_id %d!\n",
>> +				__func__, exp_id);
> 
> Please, drop __func__ as well. Most probably this can be run on the systems
> with Dynamic Debug enabled, meaning that __func__ and __LINE__ can be enabled
> at runtime.

Fixed in my media-atomisp branch.

Regards,

Hans

