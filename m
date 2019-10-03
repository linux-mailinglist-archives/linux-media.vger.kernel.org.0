Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B43EC9EA6
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 14:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbfJCMiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 08:38:05 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:36129 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbfJCMiE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 08:38:04 -0400
Received: by mail-io1-f44.google.com with SMTP id b136so5109234iof.3;
        Thu, 03 Oct 2019 05:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mzsUcDM2g0UBcqHEb2Rfu7NDxj07u1Rq4/MBSlHUokY=;
        b=g7UzHIjgle7y8OGY2qo0VPIApT742hZARLNz/+tsG3DkuomZbQtwQ4HxJMKI3T8XHo
         dKKi8HtnHOuCqyDRZJPTf5e2bQuOoDXo5yKAOw3B/eYyZswY8e/Z7/LstUjQI7z54JeM
         5fr+hK4Doch0MM/Hxb1glHALTuWqR+NhrCcL5UDved/tRiwlZAyj2VmktjH4K8COzmiX
         9J7vuksDshk2fr+iY88TP1AcIEqmHkMjv4xU0JxOkAsqD3lbSXXnfwofCmny9hpxfvJ4
         LsvtbBBzgl0dPpxjO1W9Rd5wNi5Whkj0W753DCci+tNy7kFN48xMZ04t4vOdtS0uTUTb
         2E4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mzsUcDM2g0UBcqHEb2Rfu7NDxj07u1Rq4/MBSlHUokY=;
        b=lHLz8QbyFi9FDxqC2f0+W+E6njxA3qo+O+/ksNWAxryxwO43qa6gUK8AIRPE71+7D3
         UTyZ1hWbi696noq7l4Fevp1uOTXF//yzyo06Ce1GOKPokX+pMoTqqCZlzoLO7FIPDo1x
         flfwcEeCkWZwRWU/1Hr9y15Vwpciq0l4d2cBeUwYyQymeSBY8ZQ0RipC9s7Y+y+LNOFo
         Fv5gy9GmnRAfyCykGnP+al46LUUQVAbJhdvK5uFHbX6PIEbEZ8WePfAR73wp1daREquc
         BZrwLGWy7AwIM7tcHBNnQDcJgSCTpxPtJXT60/+o2/W1+KDMPHUb3siI9TAxwXu7NhuD
         KnSQ==
X-Gm-Message-State: APjAAAWBB03PU1WvxalZZYkiFDnPtwKnlyxmEywHoyKslJPxYtBV5lPB
        QbIkBP8c7iTRobyEyPIo/wHBEw3neURZNmNExQ8=
X-Google-Smtp-Source: APXvYqw2SmTkJ4rLwrJ7E70hGT/CJf8JbebQxH9MeQYWV9rrtC7G56aX/0FWguTOiTaVhpxyQur4pEG//R1O2qBsCVw=
X-Received: by 2002:a5d:8ac4:: with SMTP id e4mr3159232iot.185.1570106284036;
 Thu, 03 Oct 2019 05:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190927183650.31345-1-bparrot@ti.com> <20190927183650.31345-3-bparrot@ti.com>
 <CAOoBcBUd7reG=-WOq+Vq9SynZMJ81CWFZPN35MkmaQvquZ9xyg@mail.gmail.com> <20190930155826.pimkap75k67mji3e@ti.com>
In-Reply-To: <20190930155826.pimkap75k67mji3e@ti.com>
From:   Austin Kim <austinkernel.kim@gmail.com>
Date:   Thu, 3 Oct 2019 21:37:53 +0900
Message-ID: <CAOoBcBV=4GYVXdhhyNcpi97RzO3qR_NG6TfYxk=niwn5=RWzbw@mail.gmail.com>
Subject: Re: [Patch 02/16] media: ti-vpe: vpe: Add missing null pointer checks
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

2019=EB=85=84 10=EC=9B=94 1=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 12:56, =
Benoit Parrot <bparrot@ti.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi Austin,
>
> Thanks for the review,

It's my pleasure.
Hope to see this patch will arrive the destination(linux-next) safely.  :)
