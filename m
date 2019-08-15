Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7338E8D0
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 12:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731301AbfHOKKJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 06:10:09 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34416 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfHOKKI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 06:10:08 -0400
Received: by mail-ed1-f66.google.com with SMTP id s49so1710496edb.1
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 03:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z+cqg8eS5vjd3qaqaySDrdCTkO9DCN1xv8OvuOzwED0=;
        b=f7AlEHVfC2jT3v7PdW0mUtkNmD+/AgnONEdWWNr+74V3mrq4RjZq9gHRhQ6BknGDzJ
         1BGm9f07rmMJUVu4/rYnciXIoe8pV65My0tjSUYGTpND0uPdegjOqhAfLbBIZa93zDAe
         Z3xX1Myojzv/lmaFuoWfT1PdMyQkmY6LU6br4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z+cqg8eS5vjd3qaqaySDrdCTkO9DCN1xv8OvuOzwED0=;
        b=fFmapPm60ASzTJ6WKMJslsY0aUdGJ0gXwPEASJAW8zhrokMm+LFTVfvNAXM2XFChBY
         2YW6+2c4Rj2wt4S0vPv6wsMqqeQWPhgTT3o/iQTfuMzCyUyAcu4ua+UMd6fx/sjpuTn4
         a+wQOpXvVW4ghpBYmPT1zxzNL0qWtFqmSNlxgewOsTnPZV+RbOEKfx0BOkvR3sgHWWlp
         kkhvSWdoQX+s8URHV10/FZ+0Ch8aR0MX2LiGgaiO2AkwzbE0ODVfGuxLnyeJD/dN0FuC
         uzBm7Syhst3hh0lv2CSSXPetevpcDXuR8ZmIl6a0yiEkgfLqnP0KgIEYo1h6BD/wZqZj
         zqUg==
X-Gm-Message-State: APjAAAVFMZ2lZaM2JbMV/SmkMLchDIRP75IcNPVrW/LBM+Nt4KJ+ArlN
        KkcKMqanPS7BgR2UIoVaSXGdIB0TSb1/cQ==
X-Google-Smtp-Source: APXvYqznU2nmQrNFxHKMskeXEbiopRi7CX5WHK/heZUm2u6u6UU0UZP+oTo/iQK0ESPVbnci/5UNRQ==
X-Received: by 2002:a17:906:1499:: with SMTP id x25mr3639934ejc.42.1565863806825;
        Thu, 15 Aug 2019 03:10:06 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id v8sm470961edy.14.2019.08.15.03.10.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 03:10:05 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id z11so1757588wrt.4
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 03:10:05 -0700 (PDT)
X-Received: by 2002:adf:f851:: with SMTP id d17mr4604321wrq.77.1565863805226;
 Thu, 15 Aug 2019 03:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-3-hverkuil-cisco@xs4all.nl> <20190814125336.GB11714@aptenodytes>
 <CAPBb6MWj_03kz1pVr5ap7iwr0Li0RVuTH9rKqqh5JqX5R+83-w@mail.gmail.com>
In-Reply-To: <CAPBb6MWj_03kz1pVr5ap7iwr0Li0RVuTH9rKqqh5JqX5R+83-w@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 15 Aug 2019 19:09:53 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BqjrNDtkjZar6i8gCrxXvSgndOL7-0ERes4-WOSTqg5Q@mail.gmail.com>
Message-ID: <CAAFQd5BqjrNDtkjZar6i8gCrxXvSgndOL7-0ERes4-WOSTqg5Q@mail.gmail.com>
Subject: Re: [PATCHv2 02/12] videodev2.h: add V4L2_FMT_FLAG_DYN_RESOLUTION
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 15, 2019 at 5:12 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> On Wed, Aug 14, 2019 at 9:53 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > Hi,
> >
> > On Mon 12 Aug 19, 13:05, Hans Verkuil wrote:
> > > From: Maxime Jourdan <mjourdan@baylibre.com>
> > >
> > > Add an enum_fmt format flag to specifically tag coded formats where
> > > dynamic resolution switching is supported by the device.
> > >
> > > This is useful for some codec drivers that can support dynamic
> > > resolution switching for one or more of their listed coded formats. It
> > > allows userspace to know whether it should extract the video parameters
> > > itself, or if it can rely on the device to send V4L2_EVENT_SOURCE_CHANGE
> > > when such changes are detected.
> >
> > Makes sense and looks good to me:
> > Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> >
> > The docs aren't saying that this only applies to stateful decoders, but I think
> > it is quite clear that this can't apply to stateless decoders.
>
> Even though this can be inferred from reading the specs, I think it
> would be reasonable to explicitly mention it though.
>
> I also wonder, since this flag does not make sense for encoders, maybe
> we can use more precise vocabulary in the patch description and doc?
> I.e. s/codec/decoder.
>
> With that,
> Reviewed-by: Alexandre Courbot <acourbot@chromium.org>

There is no reason why it couldn't apply to an encoder. I think the
idea is to actually have the encoder advertise the same flag once we
figure out how to implement encoding with resolution changes.

Best regards,
Tomasz
