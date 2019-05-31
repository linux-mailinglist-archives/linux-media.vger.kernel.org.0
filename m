Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 469A7315D1
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 22:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfEaUHd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 16:07:33 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42080 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727282AbfEaUHd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 16:07:33 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 5660C2639F4
Subject: Re: [ANN] Patchwork version upgrade
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org
References: <20190531124050.3f06e1b8@coco.lan>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <ac538d8e-5b2a-788f-f425-a59283497a85@collabora.com>
Date:   Fri, 31 May 2019 17:07:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190531124050.3f06e1b8@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If one tries to access a page that doesn't exists (e.g. [1]), the page
shows that Django is on debug mode. According to Django
documentation[2], is not a good idea running with debugging enabled on
production environment. To fix this, just change the `DEBUG = True` to
`DEBUG = False` on `settings.py`. The result should be something like
this [3].

Thanks,
André

[1] https://patchwork.linuxtv.org/hacking
[2] https://docs.djangoproject.com/en/2.2/ref/settings/#debug
[3] https://patchwork.kernel.org/hacking

On 5/31/19 12:40 PM, Mauro Carvalho Chehab wrote:
> Hi all,
>
> For a long time, we were running an old Patchwork version. The thing is that
> we had applied some patches on the top of it, and the upgrade was not
> trivial.
>
> Today, we upgraded it to its latest stable version. Just like before,
> you can access it via:
>
> 	https://patchwork.linuxtv.org
>
> As this is a new version, please report if you find any issues on it.
>
> Thanks,
> Mauro
