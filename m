Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69FC3EB37E
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 11:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239370AbhHMJqW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Aug 2021 05:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238157AbhHMJqV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Aug 2021 05:46:21 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0CE6C061756
        for <linux-media@vger.kernel.org>; Fri, 13 Aug 2021 02:45:54 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id l10-20020a05600c4f0a00b002e6be174c29so2492785wmq.0
        for <linux-media@vger.kernel.org>; Fri, 13 Aug 2021 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=c8yh/jsfzmphqTi8PQhqyQg8ZSZEoPdVKG8TkcZoP4c=;
        b=AakvpSnFxLiFXGpMFUfElJcVqvXJdiwiVC70HwLmy6FwFd79InF+ViRIARwTTP6fid
         mhtb7dAuegZcWXK5kuJWnTVwQ9dyCzrrb99+kmpcO8ZRmsY6IDZFYwsMwRxg8tDh+HlL
         2u/BAplhHJ74HkHnTOzomsLik9xkUquorArS+hb9hqGaCCzWI0Q+T2+DTpnTtrA3xH8v
         5vdY96D1cRV0qd0GUg/41kRblB8V/cOLR4fatRqP6pj7YkIc2whffxqzvB52uxM9RqB0
         H/zif2R9fbNDugogWpgTYEHFdaIWTsWTYGM5MtY1Ji1+VNCiziFBXN9+1ZewW+Zcx0T0
         HKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=c8yh/jsfzmphqTi8PQhqyQg8ZSZEoPdVKG8TkcZoP4c=;
        b=uhyMjNOQXlRKl8Art7k8rUCApjWkszom5m2rHQdmY1LrWrXKKNl9cgkNjv7DzQ845t
         gfAnuWZ24Iqherf9dPLE8jNWPnou06gJGPrKBjdeO6tR8nAnkqJBU3IKPI9blge2UML6
         Cy/c2xwx++EtwwFAPU/9FNLpg/xbpA1eYRsvAQGT2xUtwVUgVahJ7suarNnN8+3460RU
         kKZ5XoeqLGg0STZ/P4aIf5uiq07F6lCDZWQToxRFQbC/gX12jxvTixfi2lYOFfelVIn/
         craUe3eDarQtk3fD9kM9niLngPV3UeHubV1+JRMS2JGuLGJJylHyA87Ubm8/jvWG37WH
         /REg==
X-Gm-Message-State: AOAM533MMeGww8bu4daKBdTKaoGXL9IFQzyqHYYQQ/IzDfJDOl+cE8Lv
        0/Z+XKhvpfYeBuPa1P5NmZK3WWZ8vP8=
X-Google-Smtp-Source: ABdhPJycM/6fANHn+LvJsfcYWsrDAip35zb2/y+WY6rvdNECZTaOT+CKEIfUyWNS+LNFru4KZXIzCQ==
X-Received: by 2002:a1c:10e:: with SMTP id 14mr1763857wmb.93.1628847953596;
        Fri, 13 Aug 2021 02:45:53 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l21sm516426wmh.31.2021.08.13.02.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 02:45:53 -0700 (PDT)
Subject: Re: [PATCH v2 08/12] media: i2c: Add hblank control to ov8865
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, kieran.bingham@ideasonboard.com
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-9-djrscally@gmail.com>
 <20210810142934.GE3@paasikivi.fi.intel.com>
 <74125e27-abe3-c596-53e6-4416cabfcc63@gmail.com>
 <YRXhYP7H639DuQUK@pendragon.ideasonboard.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <189aa86c-68ec-e3a0-9804-209f3d4b1f08@gmail.com>
Date:   Fri, 13 Aug 2021 10:45:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRXhYP7H639DuQUK@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On 13/08/2021 04:05, Laurent Pinchart wrote:
> Hi Daniel,
>
> On Tue, Aug 10, 2021 at 11:07:22PM +0100, Daniel Scally wrote:
>> On 10/08/2021 15:29, Sakari Ailus wrote:
>>> On Mon, Aug 09, 2021 at 11:58:41PM +0100, Daniel Scally wrote:
>>>> @@ -2542,6 +2544,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
>>>>  				     0, 0, ov8865_test_pattern_menu);
>>>>  
>>>>  	/* Blanking */
>>>> +	hblank = mode->hts < mode->output_size_x ? 0 : mode->hts - mode->output_size_x;
>>> Is the result in relation with the analogue crop size? Based on the above
>>> it wouldn't seem like that.
>> This was a weird one actually. My understanding was that HTS should
>> always be >= the horizontal crop plus hblank...but that doesn't hold
>> true for some of this driver's modes and nor does it hold true when
>> running the camera in Windows (I checked the registers whilst running
>> it). So I went with setting hblank to 0 if the mode's HTS exceeded the
>> horizontal crop as the only way I could see to reconcile that.
> There's something very fishy here, HTS is, by definition, equal to the
> analog crop width plus the horizontal blanking. I suspect that the
> values in ov8865_modes are wrong.


I thought that initially too but confirming that the same thing happened
running windows switched me into "you're probably wrong" mode. If we're
confident that the HTS is likely wrong though I can add an extra patch
to bring those into lining with that definition.

>
>>>> +	ctrls->hblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_HBLANK, hblank,
>>>> +					  hblank, 1, hblank);
>>>> +
>>>> +	if (ctrls->hblank)
>>>> +		ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>> +
>>>>  	vblank_max = OV8865_TIMING_MAX_VTS - mode->output_size_y;
>>>>  	vblank_def = mode->vts - mode->output_size_y;
>>>>  	ctrls->vblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_VBLANK,
