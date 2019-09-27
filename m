Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1841BFEBD
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 07:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbfI0F4m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 01:56:42 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52140 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbfI0F4m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 01:56:42 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 9DD2828D43C
Subject: Re: [PATCH 2/5] docs: media: vimc: Documenting vimc topology
 configuration using configfs
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, kernel@collabora.com, dafna3@gmail.com
References: <20190919203208.12515-1-dafna.hirschfeld@collabora.com>
 <20190919203208.12515-3-dafna.hirschfeld@collabora.com>
 <3cb0359d-aca7-ee79-350c-1065651ad245@xs4all.nl>
 <22a9898032dac2031a9b38b876957a71727b1b49.camel@collabora.com>
 <6f1ca1e8-5998-8aea-ccb6-ea25f0b36417@xs4all.nl>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <6f1f004b-89ab-786e-7660-11e4d9193f6c@collabora.com>
Date:   Fri, 27 Sep 2019 07:56:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6f1ca1e8-5998-8aea-ccb6-ea25f0b36417@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello All,

W dniu 23.09.2019 o 11:50, Hans Verkuil pisze:
> On 9/23/19 11:29 AM, Dafna Hirschfeld wrote:
>> On Fri, 2019-09-20 at 15:39 +0200, Hans Verkuil wrote:
>>> On 9/19/19 10:32 PM, Dafna Hirschfeld wrote:
>>>> Add explanation of how to use configfs in order to create a
>>>> vimc device with a given topology.
>>>>
>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>> ---
>>>>   Documentation/media/v4l-drivers/vimc.dot |  28 ++-
>>>>   Documentation/media/v4l-drivers/vimc.rst | 240 ++++++++++++++++++++---
>>>>   2 files changed, 220 insertions(+), 48 deletions(-)
>>>>

When adding new sysfs or configfs directories/files one should add
appropriate entries to Documentation/ABI/*.

My feeling is that this patch should be merged with the patch actually
enabling the configfs interface, which is patch 4/5. The reason is twofold.

The first is consistency: if a documentation for an interface is added
in a different patch than the interface itself, then at the first of the
two commits in question we either have a documentation for a non-existing
interface, or an undocumented interface.

The second is that the documentation is not only for kernel developers
but also for users who don't have the faintest idea of what code is
inside the kernel, so even though patch 3/5 of this series adds
the code implementing the interface, it is not available to users
until patch 4/5.

Regards,

Andrzej
