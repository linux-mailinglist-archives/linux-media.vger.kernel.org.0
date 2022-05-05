Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4B6351CBD4
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 00:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351502AbiEEWHv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 18:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237116AbiEEWHt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 18:07:49 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE971EEF0
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 15:04:09 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id e2so7740552wrh.7
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 15:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BQNQPRYrF0dA1B3BhbXjfvOAUZO9ZbvtoK+rc9ZdmXw=;
        b=VqB5qfdNvN0TQm463LRcgHJfzcYm2/2VYmf2bPqhWHlWi29kjgWdCykk3UszdSnMCf
         fqYZDj6nd/LSJ+OR6aPQxSX9uZMOpliXyQvTtsIXZZrFbHJUXxyffoyIWjZ1sjg0ZcyA
         nAhssR9rzVyOvaJH8N2H9J2HXmgzyzVS1xUC4AR9tDhC1deGlUMMcG7RFaTT/9qLlMJQ
         CQTn64XMrFrmbjrDkSanIJJxJeoDMCfn+N9fUSSjmlrddsnR/su5CxOeKFQ4GRe9KluZ
         NXls53cQ5dLcNwevNph+KPqIkR1fBSA+ldQgc60f4Vc59rz9+o/CTiQNGf5SZ9u32UKD
         bTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BQNQPRYrF0dA1B3BhbXjfvOAUZO9ZbvtoK+rc9ZdmXw=;
        b=Zjc0I34vpv4xHSL7Nkpum6uzpfKYA8rKz2CHsu3VosBbMffNYggwXCDlYSio0dsydq
         4RRkqphaJ2EteWb0wXVBtRMu/WGHi6ZyGezgjDjBhp1uJ7Zi5cBaWNaea/HmgmMRatl2
         J4bIgz2q67tNgZjVSexT3EsKOWwSsOMAe3sdjpCqdNTYiPxqqXFbirO9KdRFGZO1oZCD
         k6VMvYAusmmEKZGvs00RmkUVsvzfmGdX+RQmRe0xDcWl3yRLEDGgF2+jTDNZNQBqntwe
         Xue/noHO5DqNQg3ir/IfV0Wl54gU5jL8R0WLP64edWsulLlbYZ2TWXsNRSR4c8LVaVrV
         34uQ==
X-Gm-Message-State: AOAM531q/iSjv+BkwY/mGjmprn+lLxI0egZumIQmxyfp90HGO5Z6djAN
        VI9hLWsF85Pgdm0ScwdN7XI=
X-Google-Smtp-Source: ABdhPJymmrxPcMysgFsg2cFvPD0+PUd+4pGv3EjshMqdgAf/zq03Yo0iu+czZJxlq0kDSxLWDUFeow==
X-Received: by 2002:a5d:47a6:0:b0:20c:5f07:2c5 with SMTP id 6-20020a5d47a6000000b0020c5f0702c5mr147100wrb.397.1651788247426;
        Thu, 05 May 2022 15:04:07 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c021200b003945237fea1sm2544350wmi.0.2022.05.05.15.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 15:04:06 -0700 (PDT)
Message-ID: <b821fcf3-1d4c-f1e5-8b3f-72ee4cf1397a@gmail.com>
Date:   Thu, 5 May 2022 23:04:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 15/15] media: i2c: Add vblank control to ov7251 driver
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
References: <20220504223027.3480287-1-djrscally@gmail.com>
 <20220504223027.3480287-16-djrscally@gmail.com>
 <YnOnl51UTkg28/FW@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <YnOnl51UTkg28/FW@smile.fi.intel.com>
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


On 05/05/2022 11:31, Andy Shevchenko wrote:
> On Wed, May 04, 2022 at 11:30:27PM +0100, Daniel Scally wrote:
>> Add a vblank control to the ov7251 driver.
>> +static int ov7251_vts_configure(struct ov7251 *ov7251, s32 vblank)
>> +{
>> +	u8 vts[2];
>> +
>> +	vts[0] = ((ov7251->current_mode->height + vblank) & 0xff00) >> 8;
>> +	vts[1] = ((ov7251->current_mode->height + vblank) & 0x00ff);
> __be16 vts;
>
> cpu_to_be16();
Most places that do this seem to do the conversion in the i2c read/write
functions, so in this case within ov7251_write_seq_regs(). Can I do it
there, as an extra patch? I actually have more changes to make on this
driver but they're not remotely read yet so there'll be another series
in the future
>> +	return ov7251_write_seq_regs(ov7251, OV7251_TIMING_VTS_REG, vts, 2);
>> +}
