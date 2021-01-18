Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 231002F9D50
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 11:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389687AbhARK6E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 05:58:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389689AbhARK55 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 05:57:57 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D40C061574
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 02:57:13 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id u25so23447515lfc.2
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 02:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=68Yluvx4tzCmcvXHftLVbVjKZDJx2JP2LcWC/s+gH0E=;
        b=hpYASEDc5qD8uqE7Lo4g9RO9D1ifAzP59ZtLDusHO6F6kOVOsbDsrc1HJYkUUyvRvx
         fyJ66zFlaSn5GB6UwIT3O3bPRI7IzOeFM5kdr15L5HbsCeocoM07Pu1tomb/5NMOFkV5
         R9INORCkxB3mipuTKDFNEW7dZQVWb+4gTPtmvjBhTi1tPxgvzQv7PQRQDZcGvSWC37wi
         NssqT26h+VHSVjPXpOMGvVs9J0uAUK1HPnxGCZM7ltrc7DLal1vnx0jze4MRnRuAkrtY
         UgY3XVzgcNZcFjbwxgsZMnCQNo24IWyOirHiVFao+U8tZ9gM2/iotfhHn6Z87ghtMYJQ
         h5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=68Yluvx4tzCmcvXHftLVbVjKZDJx2JP2LcWC/s+gH0E=;
        b=f/qRWYv+nVHQsKcwpHoWSDf8nSfgMnOakxfDpS0u7ZfAaSNjO8KDAmuXQkS+PsNcK4
         5zEdt6+/AQ7HUhc4q7ixHPKBxJKCDIkC8BqgM9czyvftOfyJ6iBAXw52GfpAEWB168pP
         ZPKjOIuwExfMS6CBw63LMMIA0e424YF9W6aHr+i2jnXJK98nzhPORzZ0brkod1NjQqT+
         rZ/nDMTWpfTgJiUBxQ3tuLnPqDuoAknuuRUcX0WfF7jEuNwzSBcosPIh/hwgi8WP8yad
         vlMyqRUokDvOPMvmxASgFOhTOHqt+3q2irngWUhJgnQmK6eaPh2TpI7m6eE2WNqcDVoH
         P3aQ==
X-Gm-Message-State: AOAM530KoaR1YEiJGnh22+NZUWQgUdONJaIJn/Xs0B3Nr4OFAqYL1pDC
        ECt7iXD8dR+b2ZHIZGDy7OVvh7TWUnpo9zGdYbc=
X-Google-Smtp-Source: ABdhPJyKEFub4K6W6ZmYWWdzXGNY6+s4vbon7JMwCUYVXv5l6ZCOXI+hJHOVs+hQo/RxTP8Ih5hLyHTSb0G1IGC/uZU=
X-Received: by 2002:a19:d93:: with SMTP id 141mr10972695lfn.229.1610967432021;
 Mon, 18 Jan 2021 02:57:12 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5A3Dr2SF_u9z9p1dAwBrrPXTqkdVqZuBR0v6iYRPcJEig@mail.gmail.com>
 <CAOMZO5B=2z5sHWQvb0872v4f7YYN8Aq4ptf4YuDmoebJBtEY+w@mail.gmail.com>
 <f8d2536fb5dadf7b7bdb4bfb6b3aaadf68318a88.camel@ndufresne.ca>
 <CAOMZO5DBRGqn5DTsMG3RRHdN1HMo7CtP6HYw3PajK3A6Y6iCoQ@mail.gmail.com> <CAKQmDh-KgO4TameRQs_D3_rdW8n0oY-ZLmbsQzWQPOkUJdiObw@mail.gmail.com>
In-Reply-To: <CAKQmDh-KgO4TameRQs_D3_rdW8n0oY-ZLmbsQzWQPOkUJdiObw@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 18 Jan 2021 07:57:00 -0300
Message-ID: <CAOMZO5DCzodXDVygMfnhJi=DF3W64NZJQxLBT6LoOJ_V6NJ9Hg@mail.gmail.com>
Subject: Re: Coda: imx53 plays video with incorrect colors
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Sun, Jan 17, 2021 at 10:18 PM Nicolas Dufresne <nicolas@ndufresne.ca> wr=
ote:

> At first sight there is nothing wrong from GStreamer happening. It picks =
i420, pass it to KMS and it comes out wrong, first suspect would be the dis=
play driver. Understand that yuv formats are often unused and untested as m=
ost display server / compositer uses rgb type of formats converting with GP=
U.
>

On i.MX53 I see this 'wrong color' behavior when playing videos into
TVE as well as parallel display.

Are you able to playback video successfully on i.MX53? If so, could
you please share your Gstreamer pipeline?

Thanks
