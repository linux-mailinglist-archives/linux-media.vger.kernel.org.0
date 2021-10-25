Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36017439355
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 12:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232734AbhJYKI5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 06:08:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55667 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232710AbhJYKI4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 06:08:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635156393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ceyKC3V4hk0KTkaHTfWdP+WWLxWLFjYhQSVYOIImGDo=;
        b=eaMqN0Vmw9XJVtVgsaBUXnzrFpG81iJ8cLKzuO7HSNXHo/nE6QXDFw98iipdS6reYFG2uA
        tTwuXHdoUf+/wMktbRe1IkS/7AWFDh5WaiuZcDMCbJQguFerjKRw7HTAmU0eG7iEz2YXFf
        5vSrLZjUIzctaR+XVREV0/cE5aZLyKQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-1mJu8sCVPmeLtOx97phkug-1; Mon, 25 Oct 2021 06:06:32 -0400
X-MC-Unique: 1mJu8sCVPmeLtOx97phkug-1
Received: by mail-ed1-f71.google.com with SMTP id i9-20020a508709000000b003dd4b55a3caso3054111edb.19
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 03:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:content-transfer-encoding;
        bh=ceyKC3V4hk0KTkaHTfWdP+WWLxWLFjYhQSVYOIImGDo=;
        b=J/P6aG3GMSIv9B9tQ9N0RgZPgxxvZf+kbq3j5bfqBsZOoRF7O0EL4U29QAhKXxGlMP
         bmpxFhm7KFB7jK6PoAR16ZqKrZTULLBz6o+qt6MA4YzWLA1e3lgTqL+/jUhBO5KUVQfa
         7hsdNvHwCP4Plc4f4uHx93xrHOwNV2EkFYRyqpJJhJoNYET3ufwsExIdkB3ig7PEvFHY
         K2V3BGuAQGLKztTHsaLsuRGnIj+j+B1P/6CeMlVjVx9OArE4wpCDWFofOQrBD0ycum92
         i9pGlqHw9v5LrnEhxIfUrrcLQ8DZ0k9ywyehggbqPnsOUOrwLFyBxnCvyVU316UpM7gX
         sGxg==
X-Gm-Message-State: AOAM5308c2Wqorx8O1XvGs8tKM1jOWV1xO7OMgy/ETSzY2/ZxUeRQvU0
        8V5dOrtj1wL7BMtSdn59cAbw5rqi5MnkeaNm4MIp2hbqUQZpsFtNJbcK93Q0oiAsdJPkNqscp2o
        ScIGYtvWC87F7sKokNrRrDxM=
X-Received: by 2002:a17:906:3f83:: with SMTP id b3mr21633638ejj.233.1635156391218;
        Mon, 25 Oct 2021 03:06:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxC1wnO4kFlFBTjWzoiQ+44BmcqeuK+O0ewlHPNVy1XYLsS0H3NooBFJ6e8X5e88dMafqtSSw==
X-Received: by 2002:a17:906:3f83:: with SMTP id b3mr21633612ejj.233.1635156391012;
        Mon, 25 Oct 2021 03:06:31 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id g26sm655521ejz.21.2021.10.25.03.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 03:06:30 -0700 (PDT)
Message-ID: <c7c94544-8af4-ad29-04ef-6131774e68b8@redhat.com>
Date:   Mon, 25 Oct 2021 12:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Userspace API for controlling the focus of the Surface Go [2]
 main/back-camera
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

With my (and Dan's) kernel patch-series to enable the back camera on
the Surface Go shaping up (and hopefully going upstream soon),
the next step is to enable control of the focus lens for the back
camera.

The focus is controlled through a separate i2c-client which is
described by a 2nd I2cSerialBusV2 resource entry in the ACPI
device for the ov8865 sensor. By default the kernel only instantiates
an i2c-client for the first I2cSerialBusV2 resource entry for an
ACPI device, getting an i2c-client for the 2nd one is easy and
out of scope for this discussion.

The question which I have is, assuming we have the 2nd i2c-client
instantiated and we have a i2c-driver binding to it, how do we
represent the focus control to userspace.

I see 2 possible directions we can go here:

1. Somehow inject an extra v4l2ctrl for this into the v4l2ctrl
list of the sensor. AFAIK we don't have infra for this atm, but
we could add some generic mechanism to do this to the v4l2-ctrls
core. IMHO from a userspace pov this is the cleanest, but at the
cost of some extra work / possible ugliness on the kernel side.

2. Register a separate v4l2_subdev for the focus-ctrl and in
some way provide information to userspace to which sensor this
belongs.

I believe that both are valid approaches. So before diving into
this I wonder what others are thinking about this.

Specific questions:

1. Hans Verkuil, what do you think about adding
support for another driver to inject ctrls into the ctrl
list of another v4l2(sub)dev ? Maybe something like this
already exists ? If not do you think this is feasible
and desirable to add ?

2. If we go with a separate v4l2_subdev, how do we communicate
to which sensor the focus-control belongs to userspace ?

Regards,

Hans

