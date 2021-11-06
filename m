Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7B7446E40
	for <lists+linux-media@lfdr.de>; Sat,  6 Nov 2021 15:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233614AbhKFOOy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Nov 2021 10:14:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46114 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229932AbhKFOOx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Nov 2021 10:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636207931;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NvL28t+9mmNIhKid1W8YhAFvBVkKSYd5UykSql3UdJ8=;
        b=DSL/CjF1Mv6scTJaU+PJR0JTpOOL56zOjxyTtYSS1hoY5jGOD5J4j1jwHuYIzWUDmX1PeE
        lyAyyX0r6g+CkRRErnUfehrl5H5+ZvWN1lOKTiFpF4fkHFLKGR03w/+UJpMIUFkJ1P/TTC
        lnAb/EmAhrlNjoWb3o8CXeYPZNxQXLQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-uljQJUAqOF6Mbytv8_6-Rw-1; Sat, 06 Nov 2021 10:12:10 -0400
X-MC-Unique: uljQJUAqOF6Mbytv8_6-Rw-1
Received: by mail-ed1-f70.google.com with SMTP id s6-20020a056402520600b003e2dea4f9b4so8250037edd.12
        for <linux-media@vger.kernel.org>; Sat, 06 Nov 2021 07:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NvL28t+9mmNIhKid1W8YhAFvBVkKSYd5UykSql3UdJ8=;
        b=d9vpLm/Y60OtxHbuws8Y8C7NGZd9WV4nlvmhy+YSFMybHyoGZDFWGXmU3o6A91CTVi
         wIuue2z6Hw4XJCCKSVLelYRouVYJzigZyt6fb1YtHt/Z3MkrimNSSYmkEJRUBtuiXiON
         ZCGP36OHN1XFgla13GVLvgv/ct3fm0c2TlzbflqW4Bv4dBUt4W6LSHEyYDNGtXuX3L/R
         AqPd7CFcnGpDCY04FxAqf7pfJnxIW020yKqSiIx3uCdPPLWagjfwRBO5nUDionKT5U2N
         Gpq/vWYfNp3mZmLqFLldAnqQpKhZpMvZDJgiCKlkpmrUibxlt/cjfOgFWtegslNcuuT+
         A01A==
X-Gm-Message-State: AOAM533+3EasVTT0nDp9DdiKx9iJRYV9AExVTFAws3asvQVnaQuiQ0Iu
        4Ud0TQpHuU2gwxLAuF+fwRwlH+maNPz++Ja0JfRuCAiR9ZEXq/8zKlzA/CJIykyRLX+8+V37KkU
        ft30FaiHQ5yGd0jgjxG7Fgvk=
X-Received: by 2002:a17:906:6b1a:: with SMTP id q26mr77714810ejr.185.1636207928567;
        Sat, 06 Nov 2021 07:12:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZAKFHxsHAxT8AQIMcGt+HZHLg18xc7Trn1BTg6tRegrsxDmthab5sZ61MbsKL0W4N18i7JA==
X-Received: by 2002:a17:906:6b1a:: with SMTP id q26mr77714790ejr.185.1636207928410;
        Sat, 06 Nov 2021 07:12:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id sg17sm5793569ejc.72.2021.11.06.07.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Nov 2021 07:12:07 -0700 (PDT)
Message-ID: <3e2a32c3-1e42-a510-6010-6be07bdd101d@redhat.com>
Date:   Sat, 6 Nov 2021 15:12:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
 <8d0470d3-7356-b476-6807-5c8606ee3545@redhat.com>
 <YYQi+zpAxPDvdCHx@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YYQi+zpAxPDvdCHx@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/4/21 19:14, Andy Shevchenko wrote:
> On Thu, Nov 04, 2021 at 03:49:48PM +0100, Hans de Goede wrote:
>> On 11/2/21 00:43, Daniel Scally wrote:
> 
> ...
> 
>> Ok, I've figured this out now, with the attached patch (which also
>> explains what is going on) as well as an updated tps68470_board_data.c
>> with updated regulator_init_data for the VCM (also attached), the driver
>> can now successfully talk to the VCM in probe() while we are NOT
>> streaming from the ov8865.
> 
> Thanks, Hans.
> 
> ...
> 
>> const struct int3472_tps68470_board_data *int3472_tps68470_get_board_data(const char *dev_name)
>> {
>> 	const struct int3472_tps68470_board_data *board_data;
>> 	const struct dmi_system_id *match;
>>
>> 	match = dmi_first_match(int3472_tps68470_board_data_table);
>> 	while (match) {
>> 		board_data = match->driver_data;
>> 		if (strcmp(board_data->dev_name, dev_name) == 0)
>> 			return board_data;
> 
>> 		dmi_first_match(++match);
> 
> Not sure I understood the purpose of the call.

You are right , that should have a "match = " in front of it, but
I actually like this form found else where better:

        for (match = dmi_first_match(int3472_tps68470_board_data_table);
             match;
             match = dmi_first_match(match + 1)) {

That IMHO makes the whole code a lot clearer, so I'll switch to that for
the next version, thank you for catching this.

Regards,

Hans

