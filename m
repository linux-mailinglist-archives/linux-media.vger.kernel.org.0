Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3C2AC553
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2019 10:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405825AbfIGIVr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 7 Sep 2019 04:21:47 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43046 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387862AbfIGIVr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Sep 2019 04:21:47 -0400
Received: by mail-qt1-f196.google.com with SMTP id l22so10063588qtp.10;
        Sat, 07 Sep 2019 01:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SqY8ipdjRhPdcT06V8HKR0Y7vgkgALycJ+/dO+E7hb4=;
        b=uKfuuY2Lm9JG+rC4DDqFP4gESkl5s39hLVu+j88OsKXjSfJqQTUhi2+d1sE65YsaqQ
         XhrMRsJFWeckH6l6ICM4XFqnmB8N1L3aqMdQDbFcrMKFEvesVNzyQvokrmJsLH7jfrhp
         omn6+ASjDmXYVbn+mCZOYjMER2bG78MG/vU6yjM/z2XUzKUCU9T8oHZep3xVSfcevZ7Z
         YBa1UpudSP7Xq7s0RQZ20q3xJIqzOm6jWeg+1pjXq6qbPAVZt6Naum25hbOo7EbvH6xi
         Q1MobXhlfZOdt+bb1Py+82vbEf1pfr7dZWpQOpAaQq4JdRpctI/hJI//mCUF90sBCHVt
         iudg==
X-Gm-Message-State: APjAAAVj+tyhebFRSbrLpz878p3tLWDWDgPSCoAuSzJVV0qa5wzXFTE2
        W47wid+dePKqU0tHddwTOfo5c3YG0KXAGQpOWKY=
X-Google-Smtp-Source: APXvYqzRYVVMyM77Vt8gvI+FbKLaNN+wwlYJ0v6SQkWNMVU/hob4fIebzW9qddRL6uNYcNSgC61iAhB/e3TAzYo2s7s=
X-Received: by 2002:a0c:d084:: with SMTP id z4mr8031422qvg.63.1567844505515;
 Sat, 07 Sep 2019 01:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190725131257.6142-1-brgl@bgdev.pl> <CAK8P3a1FXyRRi5q48h-=egFjgoRJvy6_zuO9MQaAOMA-bsJKRA@mail.gmail.com>
 <CAMRc=Me_7aw_RvU_tZnVUgduN2wWYGqJ7hQirQ2RLzxGiPujvQ@mail.gmail.com>
 <CAMRc=MdCviMA4gakqFS3+F-nU2XkdmmZbCb-m1mBJdGRHufKGg@mail.gmail.com>
 <27eb964a-bc6c-3a0d-c2c4-48e908465986@ti.com> <CAMpxmJX7osgdzx1Lc=627RpHZDs+ha8a6=AnhaQJ5HkLVp-xKg@mail.gmail.com>
In-Reply-To: <CAMpxmJX7osgdzx1Lc=627RpHZDs+ha8a6=AnhaQJ5HkLVp-xKg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 7 Sep 2019 10:21:29 +0200
Message-ID: <CAK8P3a0+kfDbGrcFi5TLxNNpoOM6u6KRW+PaLFNSQJ9BTxX=-w@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: make DaVinci part of the ARM v5 multiplatform build
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 28, 2019 at 9:55 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> śr., 28 sie 2019 o 09:44 Sekhar Nori <nsekhar@ti.com> napisał(a):
>
> Actually I tested this without the clocksource conversion and it works
> - the previous driver still selects relevant config options. But I
> think you're right - it's worth picking up all the bug fixes from this
> series and then merging the rest once dm365 issue is fixed.

I just had another look at the series and found that the driver fixes
(patches 1 and 2) are queued in linux-next, and patch 3 was merged.

If you like, I could put the remaining two patches into the arm/late branch
and send that after the media and staging trees are merged into mainline.

      Arnd
