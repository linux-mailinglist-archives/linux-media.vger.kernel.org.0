Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D72A482CE
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 14:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727465AbfFQMoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 08:44:00 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:52551 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725995AbfFQMoA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 08:44:00 -0400
Received: from [IPv6:2001:983:e9a7:1:9450:c90a:3140:14fc] ([IPv6:2001:983:e9a7:1:9450:c90a:3140:14fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id cqzLhurNe5qKacqzNhWuWj; Mon, 17 Jun 2019 14:43:58 +0200
Subject: Re: [PATCH v2 0/4] vicodec: a couple fixes towards spec compliancy
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>
References: <20181102155206.13681-1-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <879d93cc-3777-bd61-5c14-34108fc8501a@xs4all.nl>
Date:   Mon, 17 Jun 2019 14:43:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20181102155206.13681-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDBN6Aq8NaUd1o9GftFPjVaJ8bzCoLslLLlkJZVKterR/FZ/MPFk1v9taMOLiQRI6wuib46u1OHTpumOL/VYaE0nYUZ6HmG3qh4SI+V1hG7N4f49Q083
 IiyspnxtIA1pOwEye0ULPSW7TKrVI8C/vndRE9k9j2wA7cXgSbcYREZ5LB6V9fGx3BzHgUX4e7J+/Tfwl7YKiaF54QJlrQeFp4ejYdaF+wgTQ3L+Lp4pWv2f
 yIo6JMbVu6ZmO3LLgQ2ZVVKMk400ex7vfdUKJSgZwXc2oxIM/1c80K5WFvy+i892hjAWerhuZb7PQTpyy6KS8Ch+HACMGQ6fVVElFlZJsjUdJs80Sa4J0XrH
 5kK/YJaOBscnKYO9wVQ3OA8sPAd7z4fpb8BS8Pe5jHTob2UMnQMRhhlr2Myo9y/+oKZKmSKZlyoExdXURWMGMUXn9tYPb3/S3WthuMNb2rs+aOaaOus=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On 11/2/18 4:52 PM, Ezequiel Garcia wrote:
> Given the stateful codec specification is still a moving target,
> it doesn't make any sense to try to comply fully with it.
> 
> On the other side, we can still comply with some basic userspace
> expectations, with just a couple small changes.
> 
> This series implements proper resolution changes propagation,
> and fixes the CMD_STOP so it actually works.
> 
> The intention of this series is to be able to test this driver
> using already existing userspace, gstreamer in particular.
> With this changes, it's possible to construct variations of
> this pipeline:
> 
>   gst-launch-1.0 videotestsrc ! v4l2fwhtenc ! v4l2fwhtdec ! fakevideosink
> 
> Also, as discussed in v1 feedback [1,2], I'm including pixel format
> helpers, as RFC for now. Hans, Tomasz: is this what you had in mind?
> 
> [1] https://www.spinics.net/lists/linux-media/msg141912.html
> [2] https://www.spinics.net/lists/linux-media/msg142099.html
> 
> v2:
>   * Add more info to commit logs
>   * Propagate changes on both encoders and decoders
>   * Add pixel format helpers
> 
> Ezequiel Garcia (4):
>   media: Introduce helpers to fill pixel format structs

This one has been applied (or probably a later version) already.

>   vicodec: Use pixel format helpers

This doesn't apply anymore, but it would be useful to have.

If you can rebase it, then that would be nice.

>   vicodec: Propagate changes to the CAPTURE queue
>   vicodec: Implement spec-compliant stop command

This two are obsolete as far as I know. The vicodec driver should handle
this correctly now. If you think otherwise, please let me know.

Regards,

	Hans

> 
>  .../media/platform/vicodec/codec-v4l2-fwht.c  |  42 ++--
>  .../media/platform/vicodec/codec-v4l2-fwht.h  |   3 -
>  drivers/media/platform/vicodec/vicodec-core.c | 197 +++++++++---------
>  drivers/media/v4l2-core/Makefile              |   2 +-
>  drivers/media/v4l2-core/v4l2-common.c         |  66 ++++++
>  drivers/media/v4l2-core/v4l2-fourcc.c         |  93 +++++++++
>  include/media/v4l2-common.h                   |   5 +
>  include/media/v4l2-fourcc.h                   |  53 +++++
>  8 files changed, 332 insertions(+), 129 deletions(-)
>  create mode 100644 drivers/media/v4l2-core/v4l2-fourcc.c
>  create mode 100644 include/media/v4l2-fourcc.h
> 

