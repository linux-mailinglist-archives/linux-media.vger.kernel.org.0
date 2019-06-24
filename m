Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8C2A50AA7
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 14:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbfFXM1V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 08:27:21 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48160 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbfFXM1V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 08:27:21 -0400
Received: from [IPv6:2804:431:d719:dd85:d711:794d:1c68:5ed3] (unknown [IPv6:2804:431:d719:dd85:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DB2C6260FDB;
        Mon, 24 Jun 2019 13:27:17 +0100 (BST)
Subject: Re: [PATCH 3/5] media: vimc: stream: format comments as kernel-doc
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        helen.koike@collabora.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org
References: <20190623164024.9836-1-andrealmeid@collabora.com>
 <20190623164024.9836-3-andrealmeid@collabora.com>
 <a1973442-5ccb-5ba3-e508-132514b6e83e@collabora.com>
 <20190624064004.224cccfb@coco.lan>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <2f22c431-3de4-f25d-66b3-9a7ba69d1176@collabora.com>
Date:   Mon, 24 Jun 2019 09:26:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190624064004.224cccfb@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 6/24/19 6:40 AM, Mauro Carvalho Chehab wrote:
> Em Sun, 23 Jun 2019 18:27:22 -0300
> André Almeida <andrealmeid@collabora.com> escreveu:
>
>> On 6/23/19 1:40 PM, André Almeida wrote:
>>> - * Calls s_stream to enable stream in all entities of the pipeline.
>>> + * Calls ``vimc_streamer_s_stream`` to enable stream in all entities of  
>> ``vimc_streamer_s_stream`` could also been written as
>> :c:func:`vimc_streamer_s_stream`. In this latest setup, the
>> Documentation output would display a nice hyperlink to the documentation
>> of  vimc_streamer_s_stream function. Is this a good improvement or it
>> will be too verbose?
> The best would be to use: vimc_streamer_s_stream(). Kernel-doc already
> handles it (don't remember if it uses :c:func:, but I guess it does),
> and this is the recommended way.
Just tested here, and worked fine. I'll send a v2 using this style.
>
> Anyway, there's a patch under discussion right now at Linux docs ML that 
> will auto-replace these to :c:func`` automatically, not only on kernel-doc
> tags, but also within the .rst files. It should be able to recognize
> existing :c:func: tags, so no harm done if it is there somewhere.
>
> Thanks,
> Mauro

Thanks,
    André

