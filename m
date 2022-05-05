Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA9251BD5C
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 12:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352070AbiEEKpE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 06:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbiEEKpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 06:45:02 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E7653713
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 03:41:22 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id b19so5517761wrh.11
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 03:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hD2wPe9PgGvOzH0Z7GrB6dt9r1//uijsWVD0umP94yI=;
        b=NndAefhbRWI52l7iIXJBjcOtLR+H+yNrNNmpRWQ6kQlxCQFeu9tzunEq+qoNhYgRx3
         JYeboiAhatBwoALM1yTyscMNCi6aRo+j+Pw4GtErvmLcimi6+4LVh8qK5cCVkeAvwuyo
         MklyjiSRP3Zuvt78hU/jvz7I1v8Gg2VRnfTy5fUf7UHEJAn3H+vUb7KbY8W4pApoj+n3
         r8h5HsECv8B8OCcAC4Rbxvm4zJY/dOzrI4K5XnSle3EGTFzhVG7evjwtFDnEPq6UP5Vb
         Y0wCeFTHlf1jy/XuVYghUYmY/Y3E6DZWLIgzgwaQ/C9ShDrDcrIzV7PONtzlMTVhw2cd
         6bTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hD2wPe9PgGvOzH0Z7GrB6dt9r1//uijsWVD0umP94yI=;
        b=YTkQV9HeaxmmcC4q4tIljApU7thOizBnkfzbqYTewHLYuavoQPQQYYjIbKZIjCTrjm
         ZL5zitDQn7dmixbKi3y8gGMQUToJfEVbhJXpYTapGnN/x+o+yCGlJ3n0aLPaM/vmROR5
         SYsr0FZVqXQHxWay1nI6c88I8v3o9m9X3FWCMXC+4ymZLk3TYGOiExFg5DMn0JFDnh01
         A1+9WV0YKSAB5lQln3kPE98hbZNYAR+6fNe3QvyUKxpxqLnipgAioYxSkVe0PmmxkivE
         KhiEHoBBlzYkyhRJgsF6L78iXwPnlc13brFoWpI4mctjOnEmVkECV6140YvhCGpn7Lrv
         FSJQ==
X-Gm-Message-State: AOAM533MX/7VC9H0yj8B9+Wcpp4amVGzEC0LdvwCfruMXYLO4Sqs+3dO
        dylIS/jAPj4/CkFayYdDmmY=
X-Google-Smtp-Source: ABdhPJy5HAX2Uq6jdyTuvry9y4yO5FWUCi6r2OIW1M4VxuuAVGla5YLoiG4WPsDhrhFmqks7wDoBrg==
X-Received: by 2002:a5d:59a2:0:b0:20c:67de:494a with SMTP id p2-20020a5d59a2000000b0020c67de494amr13055835wrr.267.1651747281098;
        Thu, 05 May 2022 03:41:21 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id bw22-20020a0560001f9600b0020c5253d8d8sm1072860wrb.36.2022.05.05.03.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 03:41:20 -0700 (PDT)
Message-ID: <73a20d66-078b-f627-f04c-ac5d052c925e@gmail.com>
Date:   Thu, 5 May 2022 11:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 04/15] media: i2c: Provide ov7251_check_hwcfg()
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
References: <20220504223027.3480287-1-djrscally@gmail.com>
 <20220504223027.3480287-5-djrscally@gmail.com>
 <YnOj/pFvHmPZEDa0@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <YnOj/pFvHmPZEDa0@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy

On 05/05/2022 11:16, Andy Shevchenko wrote:
> On Wed, May 04, 2022 at 11:30:16PM +0100, Daniel Scally wrote:
>> Move the endpoint checking from .probe() to a dedicated function,
>> and additionally check that the firmware provided link frequencies
>> are a match for those supported by the driver. Store the index to the
>> matching link frequency so it can be easily identified later.
> ...
>
>> +	if (!bus_cfg.nr_of_link_frequencies) {
>> +		ret = -EINVAL;
>> +		dev_err_probe(ov7251->dev, ret,
>> +			      "no link frequencies defined\n");
> 		ret = dev_err_probe(ov7251->dev, -EINVAL,
> 				    "no link frequencies defined\n");
>
> ?


Derp - of course, thanks!

>> +		goto out_free_bus_cfg;
>> +	}
> ...
>
>> +	if (i == bus_cfg.nr_of_link_frequencies) {
>> +		ret = -EINVAL;
>> +		dev_err_probe(ov7251->dev, ret,
>> +			      "no supported link freq found\n");
> Ditto.
>
>> +		goto out_free_bus_cfg;
>> +	}
