Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E35DE059
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2019 22:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfJTUNl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Oct 2019 16:13:41 -0400
Received: from mail-vk1-f181.google.com ([209.85.221.181]:46876 "EHLO
        mail-vk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfJTUNl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Oct 2019 16:13:41 -0400
Received: by mail-vk1-f181.google.com with SMTP id n81so703191vke.13
        for <linux-media@vger.kernel.org>; Sun, 20 Oct 2019 13:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Md17fYHCmfiIQ3KVzxXZ2vBXD+0RHXTGIRfE5HDBp54=;
        b=yBHcPxxsS/KYU2MwkbqTE0dezcJn5BFydFvKU7wT4VJaCr+APxlkIaLqZxUK202tmK
         6OTfC52CiHvTKzZo4twJzA/bQ1o0WxZgwIKCvgHtICv+vrTPoxw52uEDh5ZVKKbMK8RX
         VPgQbMwQMhs/XX5XyTuvCFSF58NfSFmVjy0RL/q5bzUboCIEz/43PuyZxJMiK2LgmjDW
         jx3TlB17US7W9xvpv6LlK6hHdXzwmkvX10GdT1LSyMev9lc25Bb3165BnnxyQiD6tW9j
         8EfUrJB1a61A8xhJntgkfzQFeW/Sf9Dc13tOSH5MWhFf3pncelkvWd/1prlMwK2oSbie
         W3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Md17fYHCmfiIQ3KVzxXZ2vBXD+0RHXTGIRfE5HDBp54=;
        b=KBHCSwq4XmvPQAlusKn5NEu9vSTri4AqahDTanHWvPlDKr7q/yC3vDbZOkG68eky9t
         bRO0wDVXDGJQm7sOBhB4nwKU8gmtrOaYx7ZfNRc4B1LdR9QoiHKM+n37DyrdT1PttlW6
         YyM+dLKOEOsoyK9HFhANiTtgtLKYCib7Pj0ablRd+tlJuBLaYY9e3T+iM8LQHtdtWZ0B
         GoKSFx1hjOP1tZMMWPKNCU/IowYc3iVZfthgA3IH7avBdf+cGVX1USoIF66UI1fB6aMH
         4FmrJM4rF1fDPdjdgf/Xkvz2lxt18uQSQkUIqA891SkTnhEKt3NEIUYMZvb2W8+ayVzm
         k91w==
X-Gm-Message-State: APjAAAVFELZkm3ryoME2wDzx3kpsnPIAKobqMMShMIDVSKOcU4kAiMVD
        D9LUwzukhdiIkAG2P+v689hDgzr8/txnHUGRuZHKCA==
X-Google-Smtp-Source: APXvYqw0DU8E2PbS3GhSUSgQe6gxrYwuAXf0GXKbSIvvIS5iVp4V/VVUnIebOU2ZvhsiicxnFVvLccoFXOrvXTxSjKg=
X-Received: by 2002:a1f:21ce:: with SMTP id h197mr1736129vkh.84.1571602419886;
 Sun, 20 Oct 2019 13:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <b5b18a86-6137-99a0-0319-d389bac01206@xs4all.nl>
In-Reply-To: <b5b18a86-6137-99a0-0319-d389bac01206@xs4all.nl>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 20 Oct 2019 22:13:26 +0200
Message-ID: <CAAEAJfA+ErfDTj87C7rKmo4qSqHL9+uyFEWrWecpCg8RpJ+Cpg@mail.gmail.com>
Subject: Re: [ANN v2] Media sessions in Lyon in October: libcamera
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

On Thu, 17 Oct 2019 at 13:16, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> (Just updated the attendee list for this meeting, no other changes)
>
> Hi all,
>
> Since we have three separate half-day sessions for different topics I dec=
ided
> to split the announcement for this in three emails as well, so these thin=
gs
> can be discussed in separate threads.
>
> All sessions are in room Terreaux VIP Lounge - Level 0.
> There is a maximum of 15 people.
>
> The second session deals with libcamera and is on Wednesday morning
> from 9:00 to 13:00.
>
> Attendees for this session:
>
> Nicolas Dufresne <nicolas@ndufresne.ca>
> Tomasz Figa <tfiga@chromium.org>
> Ezequiel Garcia <ezequiel@collabora.com>
> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

I beliebe Dafna and I should not be on this list, and instead
Helen Koike and Nicolas Dufresne would be attending.

Thanks,
Ezequiel

> Eugen Hristev <Eugen.Hristev@microchip.com>
> Jacopo Mondi <jacopo@jmondi.org>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> Dave Stevenson <dave.stevenson@raspberrypi.org>
> Hans Verkuil <hverkuil@xs4all.nl>
>
> That's 10 people.
>
> Planning to use libcamera, but willing to give up their seat if needed:
>
> Daniel Gomez <daniel@qtec.com>
> Helen Koike <helen.koike@collabora.com>
>
> Just interested:
>
> Boris Brezillon <boris.brezillon@collabora.com>
> Alexandre Courbot <acourbot@chromium.org>
>
> If I missed someone, or you are on the list but won't attend after all, t=
hen
> please let me know.
>
> Attendees: it is probably useful if you let us know whether you have to
> join this meeting because you plan to use libcamera, or if you are 'just
> interested'. After the libcamera presentation on Tuesday afternoon we
> should know how many of the 'just interested' list can join.
>
> Agenda:
>
> TBD by Laurent.
>
> Regards,
>
>         Hans
