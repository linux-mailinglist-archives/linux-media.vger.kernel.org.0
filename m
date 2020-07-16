Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5156221DC9
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 10:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgGPIA2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 04:00:28 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:53173 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726057AbgGPIA1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 04:00:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id vyoWjTct7yPEdvyoZj3Ksp; Thu, 16 Jul 2020 10:00:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594886425; bh=SInDJIGqiVUk/ecuBpRUmMlyDptHWMibkD1brPTmZ2w=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=b3H5jVbNV5GeBK/jPLTdfHSQtOYk0y5PhixGywZqsQuYlSvTWSD+3YxKTlM23Q1Ss
         uvYH9XWPV1rKuK643leRXptasQMhBJC/TLpGMwG5hXyliY50NHujbCJn7NjMraAS2R
         Ma0WKS2Qv30TCjj0+LTnC87qF4KBqtN4wqyuvkNugKQg7LSHN9ECA9ql9QUs0TnTLO
         LLK5/c0fs0/Guvls07FA8PGTad5KNakkF2w2+0sNvHIFnGITSoQRCUyfZxOIXvCdiC
         N5Tp8Z1Vf5MgtyahcgYCzxY+IBvvR3Z/UQGOHklqKuMWuh/uchktZLdH5SZwhkEUUs
         BvFIOYJxyv7vw==
Subject: Re: [PATCHv3 1/7] videobuf2-v4l2.c: add vb2_video_unregister_device
 helper function
To:     Robert Foss <robert.foss@linaro.org>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Helen Koike <helen.koike@collabora.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
 <20200713113048.1150542-2-hverkuil-cisco@xs4all.nl>
 <CAG3jFytwGeu5EyxWwfF8FyZ=LK-3Nzsr00Y9-=u4N0WN5w3zdw@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <73d865b3-e4f6-c4d6-53fd-d1f3cb9d466d@xs4all.nl>
Date:   Thu, 16 Jul 2020 10:00:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFytwGeu5EyxWwfF8FyZ=LK-3Nzsr00Y9-=u4N0WN5w3zdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLpTcLJbVPvkN2UCpCOLfmnUG/tVSvUMKbMQVDPSu6F9hrmXC5AzWF9rZ+X5+dzlhcF1+VjEzxEYyfNIq8rYFARGGlVjfrUvklukjYMHwKJseKgA/FDd
 /vqE+vzpJq9vfJdjtfdeAD85KDUnEjBuZoLmaF0kvMgxXhObdnBHkHb3vg7oF7+8ABK3KyWtmwFZO7VBq6dFMDbMbFpNs5CdTJw0N5M+C8Vsf06SaBmGbKbf
 IRoxl9ByhQUKBdYPam2ss73X8rY2aHiaLp6AT05GrRDJnwzKwRKubDExPk71iBrWiU0zPTqe1iJ4k7ei4DPUJDTx04SU8Qi7APSeNzsd/tWXb8RtGeZtkWL7
 IK1cvwhf/XWrAWI8Uezigtn0MtxN6TKTD10cniu8E1UQ2vDmPP18ba8fe3KXeitt7BGQGHcQf25ty66rS8yMo2nXNbJsmg7bBj4zOZTXLpIjqzMvNW13NgTe
 Jvvr4v/caCkhuvtnAZr2SoGg/Ojk8q/yXrx3b4CeFlwuhXpPGTuCX6SJK4zm3jql9xpbGCTR9tN2DdofvVSHCS2pD2FRhS19O/Tyud5nK9lYlfrbtJ3lN/yj
 suVwucqboeSJkyz5U2G3dtL0s/s76G+3pndn6mVkeToVpA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/07/2020 17:55, Robert Foss wrote:
> Hey Hans,
> 
> Thanks for submitting this.
> 
>> If a driver calls (_)vb2_fop_release(), then such a driver should also
>> call vb2_video_unregister_device() instead of video_unregister_device().
>> This helper will all vb2_queue_release() if a filehandle is marked as
>> owner of the queue. This ensures that at unregister time any streaming
>> is cancelled and all buffers are returned to userspace.
> 
> Nit: "This helper will all vb2_queue_release()" wording is a bit confusing.
> 

Oops! all -> call

Regards,

	Hans
