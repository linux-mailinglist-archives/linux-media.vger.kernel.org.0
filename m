Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD4D3D3A41
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 14:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbhGWLtq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 07:49:46 -0400
Received: from mail-ej1-f44.google.com ([209.85.218.44]:37854 "EHLO
        mail-ej1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234896AbhGWLtZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 07:49:25 -0400
Received: by mail-ej1-f44.google.com with SMTP id nb11so3461302ejc.4
        for <linux-media@vger.kernel.org>; Fri, 23 Jul 2021 05:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=40HDoNrg7c/qfx3DsP+OtTChWRBlH+y4nzbI7cSuhxY=;
        b=pIDBsApoooTrU58+AFA/81S9RLLz2VP3z954fk/iFB3HN9MFDAcv4ENqon7jzvaek4
         1PWoDI33PA88v+TqKAJFxowUtNHeLsloXXjcbD9L7nLfkQmTr29jB9J1w4O3OSVw9aTM
         m3n608Bfnwd7LTXA1WGtErGTcEspONMSH4an6V6A2n2TbI7rZtlwcOaqScuKA1qRd4IY
         /VpsMeVurNeUIYwp78Oj0OQ5Vmt2GAUKKhTfX2GC070WnfEebDQ7e6FADtGne3vBGDrc
         wzoNX3SjvO4VE+QklmBV3jYsiSFhskthp4vafT7pUtBL1//J4tZqEkYPr5dHBzcabs/I
         IT2w==
X-Gm-Message-State: AOAM531VDCbY9CFdGt/b4bGJcxEdaabSNDdKus6Q9ogxoRE/30Jx5JK2
        xPWcLtKND7K2lX4N0csfJdY=
X-Google-Smtp-Source: ABdhPJyDhurE/O32sB8wcEwbc7RgPGs8tKxGazrD4yXCnThcM099ZyNAe+da65n0w8z7Os5o4OkKWA==
X-Received: by 2002:a17:906:34ca:: with SMTP id h10mr4539616ejb.41.1627043396467;
        Fri, 23 Jul 2021 05:29:56 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.googlemail.com with ESMTPSA id lu1sm10593596ejb.89.2021.07.23.05.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 05:29:55 -0700 (PDT)
Subject: Re: [libcamera-devel] [PATCH 2/2] media: imx258: Limit the max
 analogue gain to 480
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Bingbu Cao <bingbu.cao@intel.com>
References: <20210723112233.1361319-1-umang.jain@ideasonboard.com>
 <20210723112233.1361319-3-umang.jain@ideasonboard.com>
 <YPqrp7BKNhzKN8xa@pendragon.ideasonboard.com>
 <YPqtZl6deaxQGYhZ@pendragon.ideasonboard.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <eed29a18-968f-723c-15ac-45cded8dafcd@kernel.org>
Date:   Fri, 23 Jul 2021 14:29:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPqtZl6deaxQGYhZ@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/07/2021 13:52, Laurent Pinchart wrote:
> On Fri, Jul 23, 2021 at 02:44:40PM +0300, Laurent Pinchart wrote:
>> Hi Umang,
>>
>> Thank you for the patch.
>>
>> CC'ing Sakari. For future kernel patches, you can use the
>> ./scripts/get_maintainer.pl script in the kernel sources to get a list
>> of appropriate recipients. The list should be taken with a grain of salt
>> though, it has a tendency to return too many recipients. For this
>> particular patch, for instance, it also recommends Mauro and LKML.
>> Whether to CC the subsystem maintainer on every patch depends on the
>> subsystem (it's more common for small ones than big ones) and on the
>> maintainer's preferences. LKML is a catch-all mailing list with very
>> high traffic, and when more appropriate venues exist for patches, I
>> usually recommend skipping LKML.
> 
> And expanding the CC list further to include Dave (for his contribution
> to the discussion), and Krzysztof and Bingbu (for their contributions to
> the driver, as reported by git log).
> 

I don't work with this sensor anymore and I don't have it. I trust the
change is reasonable, but I did not check it in documentation.

Best regards,
Krzysztof
