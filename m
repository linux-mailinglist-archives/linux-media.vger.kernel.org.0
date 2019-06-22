Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 812274F857
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2019 23:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfFVVvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jun 2019 17:51:46 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36956 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfFVVvq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jun 2019 17:51:46 -0400
Received: from [IPv6:2804:431:d719:dd85:d711:794d:1c68:5ed3] (unknown [IPv6:2804:431:d719:dd85:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 73CC1260D60;
        Sat, 22 Jun 2019 22:51:43 +0100 (BST)
Subject: Re: [PATCH v3 1/2] media: vimc: stream: add missing function
 documentation
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        helen.koike@collabora.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org
References: <20190617133221.21246-1-andrealmeid@collabora.com>
 <20190621181705.44415597@coco.lan>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <c9602b72-7dbb-47ad-97ef-9348d7e1c3e9@collabora.com>
Date:   Sat, 22 Jun 2019 18:51:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190621181705.44415597@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mauro,

On 6/21/19 6:17 PM, Mauro Carvalho Chehab wrote:
> Em Mon, 17 Jun 2019 10:32:20 -0300
> André Almeida <andrealmeid@collabora.com> escreveu:
>
>> Add comments at vimc_streamer_s_stream and vimc_streamer_thread, making
>> the vimc-stream totally documented.
> I'm applying it right now.
>
> Yet, if this is fully documented, IMO you should add it to
> Documentation/media/v4l-drivers, replacing the comments to kernel-doc
> markups.

This suggestion is a great improvement and it's simple to apply to the
source. Where do you believe we can place this at[1]? Maybe something like


Source code documentation
-------------------------

vimc-streamer
~~~~~~~~~~~~

.. kernel-doc:: drivers/media/platform/vimc/vimc-streamer.c
   :internal:


at the end of the file?

> That would make easier for the ones to read the comments and, if someone
> changes a function call, warnings will be produced, and the developer
> will be warned.
> Thanks,
> Mauro

Thanks,
    André

[1]
https://git.linuxtv.org/media_tree.git/tree/Documentation/media/v4l-drivers/vimc.rst

