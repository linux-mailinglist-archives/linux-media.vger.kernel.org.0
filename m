Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A0749C92F
	for <lists+linux-media@lfdr.de>; Wed, 26 Jan 2022 12:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241020AbiAZL6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jan 2022 06:58:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241018AbiAZL6U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jan 2022 06:58:20 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928BDC06161C
        for <linux-media@vger.kernel.org>; Wed, 26 Jan 2022 03:58:20 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id g13so25936908qvw.4
        for <linux-media@vger.kernel.org>; Wed, 26 Jan 2022 03:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9WWhrOEPYv4PBUz0HuH9oBi24LTK3/VFJe00gCzGl/Q=;
        b=BWrK2hFUjUdzAwE1YoqH4qeX89UTE7erJoLJNd66RWjMvh/KpAB0MyasaRTp65MVjY
         ls2OwBMKIl60VANcV8SEOUPEy7PjK4Mzpw0byQ4tpNzSWD2JRE40Y5gYHO5IGE9aFmD+
         9j6yk5G7ON0B9kRm7nPfXJ7MmN1w4AVaLP23c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9WWhrOEPYv4PBUz0HuH9oBi24LTK3/VFJe00gCzGl/Q=;
        b=WkzJLkurP9atQRO+KsUAcMI6fuXnLL+JphqS9OekwUBYm/gVimRitHDh34LoB+IwsA
         bKhg0ZeLDUloXsJQEPVrjdTyYxLaq2tdYeMvJvOF88L8pMpU4vMzuqLW8K7uR1Xoevtv
         AQJcjNOg7cFtmq8BddklWzjcHlCEvDZwhU0ba+ullk8KZgKISF5iBF3NLZFZBE+bHlA3
         k5KtBixjbstASkbrki8z7uLNwDff08nJiXkml3DS/m3e08YG5dJ7vF5A5CTgeGTOupTt
         P4FDLDKmmr3sYMQ2ZoQVkbnGmssIdIvSdn3dELyZ9YYUBmVQDIoONXHEr2lLCw8JcmAy
         G0zg==
X-Gm-Message-State: AOAM531/gl57kXwtiVSGzHeQDk1UoOmCMIQ/7YT49O0YD7N1UPofFGx4
        BEpAH63+ezZLN0a4+dqJ24jnu5COY9sORA==
X-Google-Smtp-Source: ABdhPJzKpNunxiOarFBsMnkIziQRLer6U/i6DoY7EKx1iQxMDgSJTmxCZQFFe71oqDngkWIgxtMjAA==
X-Received: by 2002:ad4:576e:: with SMTP id r14mr23415165qvx.99.1643198299537;
        Wed, 26 Jan 2022 03:58:19 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 22sm695659qtw.95.2022.01.26.03.58.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 03:58:18 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id l68so70070722ybl.0
        for <linux-media@vger.kernel.org>; Wed, 26 Jan 2022 03:58:17 -0800 (PST)
X-Received: by 2002:a25:9103:: with SMTP id v3mr35362616ybl.416.1643198297346;
 Wed, 26 Jan 2022 03:58:17 -0800 (PST)
MIME-Version: 1.0
References: <31c05526-f6fc-f48f-a900-8103ac5c4215@redhat.com>
In-Reply-To: <31c05526-f6fc-f48f-a900-8103ac5c4215@redhat.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 26 Jan 2022 20:58:06 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A-EoaMuviovH_3LSKacX-2=cXWhxVEosEZ6c-uAJ8R3g@mail.gmail.com>
Message-ID: <CAAFQd5A-EoaMuviovH_3LSKacX-2=cXWhxVEosEZ6c-uAJ8R3g@mail.gmail.com>
Subject: Re: Firmware (devicetree/ACPI interface) for marking camera sensors
 being on the front/back of a device
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

+Ricardo Ribalda +Sergey Senozhatsky FYI

On Mon, Jan 17, 2022 at 6:43 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> IIRC there was some discussion about $subject a while ago,
> esp. being pushed by the ChromeOS folks (IIRC). If you know what
> I'm talking about, please add relevant folks to the Cc.
>
> While doing some work on atomisp support I noticed that the
> ACPI device fwnode-s describing the sensors have an ACPI _PLD
> method, which is a standardized ACPI method to retreive an
> package (ACPI for struct) describing the location of things
> like USB ports; and in this case of the camera sensors.
>
> And upon checking the Surface Go DSDT the sensors there seem to
> have the _PLD bits to. And in both cases at least the following
> PLD field (bits 67-69) seems to contain valid and relevant info,
> quoting from the ACPI spec 6.2 version, page 329:
>
> """
> Panel: Describes which panel surface of the system=E2=80=99s housing
> the device connection point resides on:
> 0 =E2=80=93 Top
> 1 =E2=80=93 Bottom
> 2 =E2=80=93 Left
> 3 =E2=80=93 Right
> 4 =E2=80=93 Front
> 5 =E2=80=93 Back
> 6 =E2=80=93 Unknown
> """
>
> This seems to be consistently set to 4 or 5 for the _PLD method
> of the sensor ACPI nodes which I checked.
>
> So rather then defining a new devicetree property for this and
> embedding that inside the ACPI tables, IMHO it would be best if
> the ChromeOS devices would use the standardized _PLD ACPI method
> for this too.

Thanks for bringing this to our attention.

We don't seem to be using it in our ACPI tables, but I agree that it
sounds like something that should be populated.

However, we probably still need something else to describe rotation
(as Laurent mentioned) and position on the plane (when there is more
than one camera facing the same direction).

Best regards,
Tomasz
