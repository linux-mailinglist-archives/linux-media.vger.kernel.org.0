Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 370DC435E2F
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 11:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbhJUJss (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 05:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbhJUJsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 05:48:46 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2953C06161C;
        Thu, 21 Oct 2021 02:46:30 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id o133so126835pfg.7;
        Thu, 21 Oct 2021 02:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EDRM8W6FOAtvtAXHLFNxHPspkjXHpbma09BaDzDAfkk=;
        b=KgIdsoP/g2OAXrxTNMjC6ueK0rtI9wId6jmD1NLZ+ukOc6wed/9v2WdIPCOTb78aYz
         GDEI0Tx1FzIjMhNSYKC0imMjswnVYlL12x0Iq29KUXq3cHcjFVqcnMb61bBpfCO/YIvy
         J9BtJlXLY6L/4/oNs/djFOC4S13qOnFPQxQvj3KHl7Bbf+s/1xL4KlBNo0BZCiRhk8fd
         f7MqX4qX2BcqBBt+T8loS5nxfKHOkZlz3Tw8fseURIG1IlQNXEZGj1T21nnlrtuzfm3m
         Hs8POdJeffO/Ja0gLm0NXER5nZVtZy39KDVBeonuZxI8VcV4JWKAEK9tDmATfYQm4kAr
         H1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EDRM8W6FOAtvtAXHLFNxHPspkjXHpbma09BaDzDAfkk=;
        b=Fu05JTaw03d2Cn7YkHY1WfVOz+Fw6bB730mojB04qoF4CcNKsK/pxZ2HpZZLqubtJC
         ZgnwPSJv91rXEf7j2V5VjWDJIoX8doBTlVMGwmRRwf2gCPVxNTtLvMEvGUY2bou4ZKuI
         xlj2yLvd8HE/IpjOFusx2659Dgt7WYrqz5ndNUdgiiTPo066iPPeLe4pZIwWx3DT8hPJ
         EQj37j4sMI0eEs5QWPgO+m3yQJpCgDUNucgD9aYQLusTigj9nPjbFmymyb1IcyzO4ssv
         8qRG6SOf1xPmGPymlvMlUCRfDujq4LoDDtQX8yyUhLHOvfRl7bDwLFb7M/8AbGM5SNgo
         xFMQ==
X-Gm-Message-State: AOAM530JVsq7ltuJClC45ZswCh5k/NohAmMbUAAoBTsn91hgZbIbAVco
        Oe7hcdlTHRBCo1asYWMLtpI=
X-Google-Smtp-Source: ABdhPJzP9kiHoflcziBGhE9zKMR5PHN1xmhpPriwS/SWZWPCtCppPM0AVdWw26PUjZdV/baM0YInCQ==
X-Received: by 2002:a63:b11:: with SMTP id 17mr3594840pgl.51.1634809590394;
        Thu, 21 Oct 2021 02:46:30 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id g17sm5258410pfu.22.2021.10.21.02.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 02:46:29 -0700 (PDT)
Message-ID: <ace1264d7254f7159865602614d70caf7ff4b609.camel@gmail.com>
Subject: Re: [PATCH 16/17] [NOT-FOR-MERGE] media: atomsip: pci: add DMI
 match for Microsoft Surface 3 with broken DMI (OEMB)
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Aniket Bhattacharyea <aniketmail669@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alan <alan@linux.intel.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Date:   Thu, 21 Oct 2021 18:46:25 +0900
In-Reply-To: <71b5b886-2ca1-27a9-6776-b3bcc430e5ed@redhat.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
         <20211017161958.44351-17-kitakar@gmail.com>
         <71b5b886-2ca1-27a9-6776-b3bcc430e5ed@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-10-18 at 09:56 +0200, Hans de Goede wrote:
> Hi,
> 
> On 10/17/21 18:19, Tsuchiya Yuto wrote:
> > This commit is added for Surface 3 with broken DMI table. HACK-ish.
> > Not intended for upstreaming. Thus, NOT-FOR-MERGE. But, if someone
> > knows a nicer way to address this, comments are welcome...
> > 
> > > 8-----------------------------------------------------------------8<
> > 
> > On some Microsoft Surface 3, the DMI table gets corrupted for unknown
> > reasons and breaks existing DMI matching used for device-specific quirks.
> > 
> > This commit adds the (broken) DMI data into dmi_system_id tables used
> > for quirks so that the driver can enable quirks even on the affected
> > systems.
> > 
> > On affected systems, the DMI data will look like this:
> > 
> >         $ grep . /sys/devices/virtual/dmi/id/{bios_vendor,board_name,board_vendor,\
> >         chassis_vendor,product_name,sys_vendor}
> >         /sys/devices/virtual/dmi/id/bios_vendor:American Megatrends Inc.
> >         /sys/devices/virtual/dmi/id/board_name:OEMB
> >         /sys/devices/virtual/dmi/id/board_vendor:OEMB
> >         /sys/devices/virtual/dmi/id/chassis_vendor:OEMB
> >         /sys/devices/virtual/dmi/id/product_name:OEMB
> >         /sys/devices/virtual/dmi/id/sys_vendor:OEMB
> 
> I wonder what the bios_date field contains ? Typically when the DMI strings
> are no good (e.g. often they contain "Default String" or "To be filled by OEM")
> we add a check on the bios-date, which together with the broken strings is
> considered unique enough to still allow a match with broken strings in the
> kernel.

Thank you so much for the comment :-)

Here is the full output of "/sys/devices/virtual/dmi/id/*" (not showing
files that need root permission to read):

        $ grep . /sys/devices/virtual/dmi/id/*
        /sys/devices/virtual/dmi/id/bios_date:03/09/2015
        /sys/devices/virtual/dmi/id/bios_release:5.6
        /sys/devices/virtual/dmi/id/bios_vendor:American Megatrends Inc.
        /sys/devices/virtual/dmi/id/bios_version:1.51116.238
        /sys/devices/virtual/dmi/id/board_name:OEMB
        grep: /sys/devices/virtual/dmi/id/board_serial: Permission denied
        /sys/devices/virtual/dmi/id/board_vendor:OEMB
        /sys/devices/virtual/dmi/id/board_version:00
        grep: /sys/devices/virtual/dmi/id/chassis_serial: Permission denied
        /sys/devices/virtual/dmi/id/chassis_type:9
        /sys/devices/virtual/dmi/id/chassis_vendor:OEMB
        /sys/devices/virtual/dmi/id/modalias:dmi:bvnAmericanMegatrendsInc.:bvr1.51116.238:bd03/09/2015:br5.6:svnOEMB:pnOEMB:pvrB16D0SM1C4G1X1:rvnOEMB:rnOEMB:rvr00:cvnOEMB:ct9:cvr:sku:
        grep: /sys/devices/virtual/dmi/id/power: Is a directory
        /sys/devices/virtual/dmi/id/product_name:OEMB
        grep: /sys/devices/virtual/dmi/id/product_serial: Permission denied
        grep: /sys/devices/virtual/dmi/id/product_uuid: Permission denied
        /sys/devices/virtual/dmi/id/product_version:B16D0SM1C4G1X1
        grep: /sys/devices/virtual/dmi/id/subsystem: Is a directory
        /sys/devices/virtual/dmi/id/sys_vendor:OEMB
        /sys/devices/virtual/dmi/id/uevent:MODALIAS=dmi:bvnAmericanMegatrendsInc.:bvr1.51116.238:bd03/09/2015:br5.6:svnOEMB:pnOEMB:pvrB16D0SM1C4G1X1:rvnOEMB:rnOEMB:rvr00:cvnOEMB:ct9:cvr:sku:

The "bios_date" ("03/09/2015") looks not broken.

I also noticed when writing this mail, regarding the ones that need root
permission to read, "board_serial" and "chassis_serial" are now empty.
"product_serial" now shows "OEM":

        $ sudo cat /sys/devices/virtual/dmi/id/product_serial
        OEM

"product_uuid" looks not broken.

> Also have you tried doing something like "load bios/setup defaults" in
> the BIOS setup ? Maybe that helps ?

Unfortunately, there is no option like this...

Regards,
Tsuchiya Yuto

