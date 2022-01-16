Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA2F48FF41
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 22:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236242AbiAPVnb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 16:43:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44380 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236232AbiAPVna (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 16:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642369409;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=taQuWT5xJYKx3LxT9idmbpsA5KNaLici4QvmZ7C1DHI=;
        b=IVmcBCoVWG5DE7Y5fKercY8WjrgNrkkFLOdsXTYE5SyNcJdggecNkUYLp1kbHElRsF+YCt
        tSscC4Scz76ldAIYSnCLAs6h/smAZ3bzzqoma0ISMnhewYooexfcK0vSf7AmywLnm+D11H
        TXvt8xJu7DQSpv5n8AvTU8yr106nkdM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-OikDI5e7O-Op0MMFumxgOg-1; Sun, 16 Jan 2022 16:43:28 -0500
X-MC-Unique: OikDI5e7O-Op0MMFumxgOg-1
Received: by mail-ed1-f69.google.com with SMTP id r14-20020aa7da0e000000b004021fa39843so1815642eds.15
        for <linux-media@vger.kernel.org>; Sun, 16 Jan 2022 13:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to
         :content-language:from:subject:content-transfer-encoding;
        bh=taQuWT5xJYKx3LxT9idmbpsA5KNaLici4QvmZ7C1DHI=;
        b=6Bon2yatqTUgrVZPGzSjz7HGTSwFB4jJUo58KN3tWXSBmODlFDnzUor8gxyfM+3CDP
         pwGSK74HH2QAYxIAMECDQrMxn1OU2JYh4l/XkQlPn+SxL545HucVAnc2ZnTWeGYvEV6E
         6ipj5t7bdmtRRwNmJZ1T2phyXz3bQr3Xawwerto0OS569Kps5yeE6vkmZi+HuKI5QQeb
         ezYE441M2cRLLeUSiZTChcrlWBSuO6yRrIJm3nKY+VdEN9xYNKjAJfXdzHV8c687zAIl
         y7tpT4o/pJr8X3mY4VewwZLLsw3p8/4LADOzYielTx7/XDi76Q5rTMrEwHB0pda36z5f
         zbag==
X-Gm-Message-State: AOAM531kFTAVdh9NW8wl9ncDtXdHBEsBRjTuusby7Bk2ZcbpkzOo9B6n
        GYZzUEhxLVwKnT3BZGqDgDLyOwqPdiZXyOuccGNKKgnjpkBzeyiS4xPrPdGUyapVHNbiX3ALAiZ
        V+KVsb3FX3Z8pCXryn48auNY=
X-Received: by 2002:a05:6402:42d4:: with SMTP id i20mr18275603edc.52.1642369407016;
        Sun, 16 Jan 2022 13:43:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/xdfIu7tFXBtVkMOmAbt0Mpk5F5avYbatkIpBGs01bxK9+PEoHHzrIISCUU1+3LHW7nlcCQ==
X-Received: by 2002:a05:6402:42d4:: with SMTP id i20mr18275593edc.52.1642369406802;
        Sun, 16 Jan 2022 13:43:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id r15sm1183257ejz.39.2022.01.16.13.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 13:43:26 -0800 (PST)
Message-ID: <31c05526-f6fc-f48f-a900-8103ac5c4215@redhat.com>
Date:   Sun, 16 Jan 2022 22:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Firmware (devicetree/ACPI interface) for marking camera sensors being
 on the front/back of a device
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

IIRC there was some discussion about $subject a while ago,
esp. being pushed by the ChromeOS folks (IIRC). If you know what
I'm talking about, please add relevant folks to the Cc.

While doing some work on atomisp support I noticed that the
ACPI device fwnode-s describing the sensors have an ACPI _PLD
method, which is a standardized ACPI method to retreive an
package (ACPI for struct) describing the location of things
like USB ports; and in this case of the camera sensors.

And upon checking the Surface Go DSDT the sensors there seem to
have the _PLD bits to. And in both cases at least the following
PLD field (bits 67-69) seems to contain valid and relevant info,
quoting from the ACPI spec 6.2 version, page 329:

"""
Panel: Describes which panel surface of the system’s housing
the device connection point resides on:
0 – Top
1 – Bottom
2 – Left
3 – Right
4 – Front
5 – Back
6 – Unknown
"""

This seems to be consistently set to 4 or 5 for the _PLD method
of the sensor ACPI nodes which I checked.

So rather then defining a new devicetree property for this and
embedding that inside the ACPI tables, IMHO it would be best if
the ChromeOS devices would use the standardized _PLD ACPI method
for this too.

Regards,

Hans

