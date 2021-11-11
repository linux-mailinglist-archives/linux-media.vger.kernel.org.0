Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1E844D9AF
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:00:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234004AbhKKQCv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:02:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26292 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232033AbhKKQCv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:02:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636646401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bAbPESGtFo3yvuzwtwquN7c9hFMdNyDm/P5bKVw3nw4=;
        b=MqTo/yVU/3V+Z49X9+45V1ZwilrweqdUd+3D2YvPJZJEZKIBF48hcmxJJB/S98p6hAsGV7
        h6EKSU/0GL1HYSbcpVcicdjiLYDhC5zWZGjWpKYR7rXoleIzr5tf999WLE+Op/i7f648ds
        fNH9kj7MYkjalHjDT+zLRbaMMSwNnHg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-5GMWLKiTM0umjZv6P-eGKQ-1; Thu, 11 Nov 2021 11:00:00 -0500
X-MC-Unique: 5GMWLKiTM0umjZv6P-eGKQ-1
Received: by mail-ed1-f72.google.com with SMTP id y20-20020a056402359400b003e28c9bc02cso5794349edc.9
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:00:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bAbPESGtFo3yvuzwtwquN7c9hFMdNyDm/P5bKVw3nw4=;
        b=1Bcl26QQ9mZmyTVRZD5h8hQrqTf/LQbNWrUPgEe9FFA4p0BNE2RgZ0uNB3KvE702DJ
         xBkQisP8Ucvkd5nRi+9DqF6q7hQIuDTJ0qNLimmOkOn5Ja5OYbQQ98RrZnu0cd53XSLS
         +uKRA/9Lj0nLN/oHmO0ig25enIqsAHqee+UlinRyBueg0f2m4bRxEwzJk6VC0Bv68+QV
         TRREELdlxKXboYI4nlYjXUbgTzndvHMrsz0j61McN/Ax5PcCgvpHm2V8kmQGrJX04x3D
         oiKms4jyFse63QRsMPsOBrpdMpwOLOIzVhzGrjWOfIca79rYOZrZgqylLUE2qv9qNMYd
         iSNw==
X-Gm-Message-State: AOAM533KjZUrxQpHIHnItwwhfkllxcPzi7HEiO5D00mxWFH0MqlF9oVf
        cdE+ncWsh19sLJRwrq+ulgmXhMzz1DSbp4XOJq6OiH81WKCCEtZg4lEI26YgJg+SKyHyRJ3Tuo0
        y/IbEEYwUIc5DPF7kMndd4O0=
X-Received: by 2002:a17:906:9402:: with SMTP id q2mr10740553ejx.106.1636646399203;
        Thu, 11 Nov 2021 07:59:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeQshSvv0KICKi1+QRdOT9qMooUYa+pWhea4ph2MXN+K6lf7Fdi5FPc6WJY6aNS3HvCZ9CRQ==
X-Received: by 2002:a17:906:9402:: with SMTP id q2mr10740524ejx.106.1636646399027;
        Thu, 11 Nov 2021 07:59:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d4sm1776727edk.78.2021.11.11.07.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 07:59:58 -0800 (PST)
Message-ID: <90a31605-49c9-9e4b-765f-c8f8773b3ba0@redhat.com>
Date:   Thu, 11 Nov 2021 16:59:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
 <b0a6a762-3445-7c61-3510-6bd493f8e0fa@redhat.com>
 <d0f969f6-e029-7c28-17ce-79b8228ddaee@gmail.com>
 <b77cf78f-ea5e-adcc-a1b8-8cff77ebf847@gmail.com>
 <bbfb4bd6-871a-eb14-653c-64c05c22e165@redhat.com>
 <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/9/21 17:35, Daniel Scally wrote:

<snip>

>> Talking about this Dell Latitude 7285, I haven't had a chance to
>> look into this at all. But chances are I will need to do some
>> I2C-register dumps under Windows, last time you mentioned you
>> had some small tool for this ? It is ok if it is a bit hackish,
>> it will still be very useful to have :)  And I believe I will
>> also need to override the DSDT under Windows for this, right?
>> I should be able to cope with that too.
> 
> 
> So the tool I was using was the I2cTestTool [1], which requires you to
> first hack the DSDT to enable usermode access [2]. You need the
> Microsoft ASL compiler [3] to insert the new DSDT, but fwiw I gave up
> trying to use their tool to actually compile the table and just did it
> running Ubuntu with iasl, then saved the file onto the Go2's SD card and
> loaded it using asl.exe in Windows...the MS tool just wouldn't compile
> for whatever reason.
> 
> 
> All that said; you don't actually need to do this for the Latitude 7285
> - on the Github thread a chap with that device found the schematics and
> posted them [4], so we should already have the information we need to
> populate the board data for that one. The sensor drivers need some work
> though - the ov9734 I have a series somewhere that I think should work
> but haven't ever tested, the ov8858 I don't think anyone's looked at yet.

Awesome, thank you very much for these links.

If you can dig up the ov9734 patch series you have and email me a copy (1),
that would be great, then I can start looking into getting things to work
on the Latitude 7285.

Regards,

Hans


1) No need to make it compile with the latest, I can take care of that
just email me what you have :)


