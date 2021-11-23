Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFAD45A23A
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 13:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235080AbhKWMNp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 07:13:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234773AbhKWMNp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 07:13:45 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F0AC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 04:10:36 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id s13so38632505wrb.3
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 04:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ln0AEhMCNJh3Azn5Z9ftRRtxhbCSbZzNKyV+isfYn0I=;
        b=hPTzTvg1+be+31JFYjnOcLMUMcgfyW583k364LcwX4aEzbiOtt4e7b6UNWTS0EJDVS
         7lMc+mIQNjRyjfCZN+c1zotmbVwg7NFi8coM7r+gCTKcabf50AlBAJhxzLOLWJcZncDj
         Cqw0ZUC2q1JXw32OPDzM+vLc4rUTonpG1JBwAYkeX1biR4PKNwq4SI8RQu8E1kV6T1jS
         GXuEYLkF/44/Eh4vjLwMHvePijfzNce/J5x38zhJaL1n7XvuxAAMPtO5/ZDTZmA2dMPx
         os66hcPPLqwIqd8vMXZlF2xUFsEPBl9IRf1Bdr/NzGwqUai0m5u/m9zqzb+jpVXBnkVl
         4F0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ln0AEhMCNJh3Azn5Z9ftRRtxhbCSbZzNKyV+isfYn0I=;
        b=vD0aDq4EwtC6uFomgSnLz+ELTp4vmi6X1IWzVkTSb4Cp030VhZuqwr1m0h8dfo3iTH
         dutcPt1g59axYdtxTDMOo5YRkNjaHJtiadBrWj5lwxBpBxf1hAzKmicWB930zy44tckg
         3tZbWPL/Wvmj68x1SlENeBvPerih+x5LeIOy067JjSGRDHpnLH8EfT2c+J8MzC6KAOzj
         MZaQAnV/QAxCM+YSjtdLP/eIau82c1ZJVNuusXlriC5SxpeZ+Ht0SKBwzFoLiYw1ZQbK
         Zs4v9wB80A0BdTlyza24pv7tLyHF/BQykKXHlfb+9WLSGsOZmeX5n13QH7t9WKzkVTcQ
         Yjvg==
X-Gm-Message-State: AOAM532WEBBtNa2rBu0aAPQDFwPNGQBpKNTVG5I/F+4I56Y2ANeyLJFg
        0n0EVwUW3+7W72hD8PEtrao=
X-Google-Smtp-Source: ABdhPJx21HeIEvROJmRRNNWO5Fq45nQB9elcILIbsuUGpD1+/7RB4GmCZnH5OO1Izd5I/ybo+sB5EA==
X-Received: by 2002:a05:6000:10c7:: with SMTP id b7mr6967875wrx.160.1637669435612;
        Tue, 23 Nov 2021 04:10:35 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id q123sm957413wma.30.2021.11.23.04.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 04:10:35 -0800 (PST)
Subject: Re: [PATCH v5 00/17] Extensions to ov8865 driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com,
        andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
References: <20211123000017.43187-1-djrscally@gmail.com>
 <YZzGxhSv7sBMJXBO@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <314bbbf4-e78e-a91c-ecd5-b13d176be1be@gmail.com>
Date:   Tue, 23 Nov 2021 12:10:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZzGxhSv7sBMJXBO@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 23/11/2021 10:47, Sakari Ailus wrote:
> On Tue, Nov 23, 2021 at 12:00:00AM +0000, Daniel Scally wrote:
>> Hello all
>>
>> This series extends the ov8865 driver with:
>>
>> * Support for binding to ACPI enumerated devices.
>> * Support for a 19.2MHz clock in addition to existing 24MHz clock support
>> * Another v4l2_subdev_pad_ops callback
>> * 4 more V4L2 controls
>> * makes the driver supported by the cio2-bridge
>>
>> There's also a little bit of tidying that I did along the way.
>>
>> The series is tested on an MS Surface Go 2.
> Nice patches.
>
> Thanks, Daniel!
>
Thank you :)
