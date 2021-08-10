Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7357E3E85EB
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 00:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235049AbhHJWHs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 18:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235007AbhHJWHr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 18:07:47 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346C1C061765
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 15:07:25 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id x12so16150wrr.11
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 15:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TxnQpwocua2iUnRWSu4IYH7rNwFFPLQnyj7bNn+TXpk=;
        b=I7vIdFJwUi6uH5qM4TMsAwzGM/dEONiJhA5iDMLZHnNztbQh6iOqCyHB+53df9nahR
         94v9tGW8TqXeSxwM9IX4Zpn7UzO+tAzpzhZicBLdGrRIxJc8vsFFqDl5PFU21iuNua1p
         zkAuSb8E6Gku7wHdMaOKnUuWDfJsYNX+Vwly5idzObTzSrHwrG2nulp1EUYwBhWcySs3
         kooGf1O6HVUcIxzlmVXk+7LXlCmDt3JcP/QV/ucAR/epFYwVFVarygDcnyXwBWlBgeh3
         H85kSEKlyka0v4682JjvjRNkzgYpt5CAt62cHVqfda/WIN7jUNQPq4S2SKOEyS+z8Lik
         Jb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TxnQpwocua2iUnRWSu4IYH7rNwFFPLQnyj7bNn+TXpk=;
        b=eBPLUBLu78RaEMthhYn8tvADDPjbvRpN2sEyMY9YTjQ0SHeokfL/T1oAJRvGgJuk5O
         y6aRayKUOD/1T4QQKi+y14J0/a0Xdm7OwTLXEkHB/PgMIcI9WbHJwtdVQoVamk7+q8LK
         k1Z1jvAqnIMQXycSJ/u0gmu7u/6D3gxPtcEfzqCBxWxaCfRGP6ogmGsdVxuzXasqb4bA
         FWcnzwKJNgDYkbsnp8felPOHvm0qq1MiTUl+GcyDJzsB+GI+9NRgabGShDyc7+sj/wQ0
         IRREluqvoc3ugdekA79xXWXE/vIC8YWd4jFD0q6Ht+Zs7R/MoNjMiJDt/XdNWOZM85+/
         wZow==
X-Gm-Message-State: AOAM53161bVu+oKZcGYQ/m0vcLPAVPpBLeUP2ZVrH5b6Oy9fZnTG0KVP
        ObJzSXC1VoLCHeyIRrGwHag=
X-Google-Smtp-Source: ABdhPJwc5TL2kIlGLcRgP1OqcvayoyoFoyViXgElldbdQv40Hqy80WmDXpOKLJO1Ljs7FGXYumNFEg==
X-Received: by 2002:adf:f08e:: with SMTP id n14mr11996652wro.427.1628633243896;
        Tue, 10 Aug 2021 15:07:23 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h14sm24719758wrp.55.2021.08.10.15.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 15:07:23 -0700 (PDT)
Subject: Re: [PATCH v2 08/12] media: i2c: Add hblank control to ov8865
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-9-djrscally@gmail.com>
 <20210810142934.GE3@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <74125e27-abe3-c596-53e6-4416cabfcc63@gmail.com>
Date:   Tue, 10 Aug 2021 23:07:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810142934.GE3@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 10/08/2021 15:29, Sakari Ailus wrote:
> Hi Daniel,
>
> On Mon, Aug 09, 2021 at 11:58:41PM +0100, Daniel Scally wrote:
>> @@ -2542,6 +2544,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
>>  				     0, 0, ov8865_test_pattern_menu);
>>  
>>  	/* Blanking */
>> +	hblank = mode->hts < mode->output_size_x ? 0 : mode->hts - mode->output_size_x;
> Is the result in relation with the analogue crop size? Based on the above
> it wouldn't seem like that.


This was a weird one actually. My understanding was that HTS should
always be >= the horizontal crop plus hblank...but that doesn't hold
true for some of this driver's modes and nor does it hold true when
running the camera in Windows (I checked the registers whilst running
it). So I went with setting hblank to 0 if the mode's HTS exceeded the
horizontal crop as the only way I could see to reconcile that.

>
>> +	ctrls->hblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_HBLANK, hblank,
>> +					  hblank, 1, hblank);
>> +
>> +	if (ctrls->hblank)
>> +		ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +
>>  	vblank_max = OV8865_TIMING_MAX_VTS - mode->output_size_y;
>>  	vblank_def = mode->vts - mode->output_size_y;
>>  	ctrls->vblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_VBLANK,
