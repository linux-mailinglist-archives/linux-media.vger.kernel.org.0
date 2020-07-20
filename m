Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D6022634D
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 17:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbgGTP3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 11:29:15 -0400
Received: from mout.web.de ([212.227.15.4]:54565 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726030AbgGTP3P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 11:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1595258943;
        bh=uEiVJHEV+DfJoAWzxBhYC8PVyxwxsp4pbi6k/1AD87w=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=CIJM+amHKP5DvTfDb4aJ2w5jvcC3jLg6y2pOyKY2q+vT2N1Va8XWX9C7F9Bmr/l3X
         vHk2pDtF6wcykZxTmqdkj4SIUSRqrNJmdHTbFzau7+oerGz0tZMiuoMWClqlBY6ABk
         c4Zl7OLKSUOjQuI24kYjR5YPWoxf0MCLjFN9l+bg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.85.87]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MIeTI-1jzja30TdY-002Grp; Mon, 20
 Jul 2020 17:29:03 +0200
Subject: Re: [PATCH v2] drm/virtio: Fix memory leak in
 virtio_gpu_execbuffer_ioctl()
To:     hexin.op@bytedance.com, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liu Qi <liuqi.16@bytedance.com>, linux-kernel@vger.kernel.org
References: <20200720144407.13706-1-hexin.op@bytedance.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <4c3fb9c5-b386-64d7-5d3f-d8633b881222@web.de>
Date:   Mon, 20 Jul 2020 17:29:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720144407.13706-1-hexin.op@bytedance.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MKZy2xLNE7UGaJ1ihNVGlTbIT3gVNBgHzrkfbX6WdfxLuUxYmCX
 ZoMYLbGc08cBYS7ijPLPSZLw+06RHyRtoRXJekahro4YfglWpskX5jxGF4YCK9RekaqOfOj
 DhzedOl9YBnFlqDcV92AyeNEBY7jmaI9PQJtE9lOpbpU4kRAYCdi4pCPZITO39bF48R0hSn
 3ha3eXvgn/h80Npb810yQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Adl02Pii3lk=:dnvTKvFWNJVlmbGVwf6JMV
 B6aS2ox8As6vaeQ/blp8aq+LsiH0eFFT5OqFxTapbVGwRlRFAmPYgAtSBwzJVcifdxCa/4bAj
 JAGeGCE3AIZ3VkBgSaD2ua3eggPHwr7ZHfnlIcM046zVeS9oDaklXZuCSHfx0Hc+4+rOynpFT
 YsKo3/HhN3abOOrBF5bov2/RaWQrnbqoJv/erJjHisSd96R5pBa5ESPgQCBfCSgY/qNmA5QZx
 0PhNpwi45Wpq5NFcWjcKBOrLwzqmd0BTBZmRhAtD8uHND0ynTywDf1h1cuHFb7I0SDnx6ovUp
 x6ZZq0Qhy4qSFirKm4T6wJJEgJFK5zA497B5Gy+9EpC/vH57FHkOGi1wPs3bW8zh3Nv65j9nI
 CUGzKzFn/cHRf/3fD4NE7RJVxwJmA1kCQoZZOi2wXR3Jw5AgzoSk0yoZf1AG+iGUF7NM4Y8pI
 OguLgVkHOIv6eLtPc/vgBkhdFtU+z0yza7X1FqPjdTj/Oyx/9d8yX6W+aU4nUyJE/uD2/FhLr
 I5tY+W4o0JLnfAMn9zqN7O75dpVwxXi0A0prB6hWFsM+63t06G/R57DsYo5ocZFlv1pTeR8Fz
 NJd5gz61uel8AGoJgncz4fRbbeAarYXRl8g89gmbuW5V6aE0IxvItc8fTxDUF5IYbjRqKrE55
 YFih9tT5EOOo+DrmudOu0h21nALucl8PCtu271FTqflwLtW6R3CIKHucDqq011dZOKAl5iTfn
 N77m/8xiXYhNWVbbfl86/fTVzbxFy5Mrh0UDTooX3WsVsBUplDo9aD5CUeVlEBl+lKBR1k4/c
 XDPoaf7CW8kLJLoPw6cqSkCJwF5Q8i1AtPDqOuZerp2WkZmJSKGCHCnt07mMens0rpf9DqH2Q
 dFP3w5I9hx819MhwsNy6XUnAXfoowyJrEVArcOoD9i/dyZi2uShSZ1UtmtNPGcx6DIFg2r4Xm
 cJDgvwOFAXX4yFls52nJislXVnZ2fY1SQiysZ40+p4Cqo5d89nF53abUj9MmdY2Or+mtxcKmO
 n9jgf/Yu1C+lBIWQMXzlfSGPv4nvtG1WxRZdOqjuVFGpUQFnBWhnsaO5pE4ClO9L37xi1EgNN
 GfCDdIZhj2usbnJiA4k61U4DAw4OEilinLohuzxaOWiqRP/C/ztbMB5yexKnC2FgSFaSI22N5
 UUF3yHU2Yf88rU0+gM4OQoaJtHWGOyTDvhRvD4yFWtMLL1BF8t3aH52VPVGxZlhYoBXhiBCg4
 ToQcG8iO7mmg+Ph2oR6ciJPGEqCWti9w1yIy0lQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> =E2=80=A6 To balance the reference
> count initialized when allocating fence, dma_fence_put()
> should not be deleted.

* Would an imperative wording be more appropriate for the change descripti=
on?

* Is the information =E2=80=9Chexin=E2=80=9D sufficient for a real name?

Regards,
Markus
