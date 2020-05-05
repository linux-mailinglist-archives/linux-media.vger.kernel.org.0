Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6FA1C5167
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 10:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbgEEIzu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 04:55:50 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:34765 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725766AbgEEIzu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 04:55:50 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id VtMejTYJKhEkrVtMijx1ve; Tue, 05 May 2020 10:55:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588668948; bh=Ccvi09j039SC2YcP0LHx86Wu6B3IoL9FiSRG8yv4P2s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=o2QLxKmMidNXySlW5D+QYS2YWxUGFuJTz4QhoJnKnUpwWG86nHQoDPr0Ybx+yBo3R
         rg87MmgLymKpupx4u42/jwT1/3z+MgF5rTuVCdFpRv6X99DWIAH0oxIyYmzPzcnp3O
         SPxJlE5MMV68Uk3cMG5mlAaAkLWDQhnM+SpMIzAxJOqQZ2o2FiOF0rYA3aOMBHqz0C
         1utlq/EQdAEPp++x3nsCFWfBzuTH21hRiApgSzxzYldZutRO6AukItaEt8RB3DdqUS
         q2ZwyiCp1XUL0gurVloZ7d/I4ckFjbDA5EZSretnVuIcTyXhUInB169+44vGx9CwDg
         feY9t+uYYLkiw==
Subject: Re: [PATCH 7/7] utils: switch C to C++ headers
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200429040627.27859-1-rosenp@gmail.com>
 <20200429040627.27859-7-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <792154c5-ee89-f467-cd4d-29a4aad7de5e@xs4all.nl>
Date:   Tue, 5 May 2020 10:55:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200429040627.27859-7-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBIoadFiEwntdZ6epYmuL7WkIYRzbrzItrq3o4IMDAjao2yAj61kJ5541iKev/GL9alJwzwiAKJii5xp9WHMkN3kOjbbJ2SACe1wMdENFJqLYUGK68Lw
 QTlCGeicK8+/61+wgAzNDRKb+Fzg9PLfurCQOAHNll3WJIiKsRgnGNSOMiiV7PO1JDE8YZUAEY+XV4STYjGGnCkMnM2hDbKnCYU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/04/2020 06:06, Rosen Penev wrote:
> Recently, I changed exit() to the std variant, which caused build
> failures on older platforms. Switch all headers to the C++ variants
> to avoid this.
> 
> These C headers are deprecated by C++14.

What failures exactly? And on what platforms?

This patch changes a lot of files, and I'd like to have a bit more
information before applying this.

I'll commit patches 5 and 6 of this series, but please repost the
others with better commit logs that help me understand the reason
for the change.

Regards,

	Hans

> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/cec-compliance/cec-compliance.cpp          | 10 +++++-----
>  utils/cec-compliance/cec-test-adapter.cpp        | 10 +++++-----
>  utils/cec-compliance/cec-test-audio.cpp          | 10 +++++-----
>  utils/cec-compliance/cec-test-fuzzing.cpp        | 10 +++++-----
>  utils/cec-compliance/cec-test-power.cpp          | 10 +++++-----
>  utils/cec-compliance/cec-test.cpp                |  8 ++++----
>  utils/cec-ctl/cec-ctl.cpp                        | 10 +++++-----
>  utils/cec-ctl/cec-pin.cpp                        | 12 ++++++------
>  utils/cec-follower/cec-follower.cpp              |  8 ++++----
>  utils/cec-follower/cec-processing.cpp            | 10 +++++-----
>  utils/cec-follower/cec-tuner.cpp                 |  2 +-
>  utils/common/media-info.cpp                      | 10 +++++-----
>  utils/common/v4l2-info.cpp                       | 10 +++++-----
>  utils/libcecutil/cec-info.cpp                    |  2 +-
>  utils/libcecutil/cec-log.cpp                     |  8 ++++----
>  utils/libcecutil/cec-parse.cpp                   | 10 +++++-----
>  utils/rds-ctl/rds-ctl.cpp                        | 14 +++++++-------
>  utils/v4l2-compliance/v4l2-compliance.cpp        | 12 ++++++------
>  utils/v4l2-compliance/v4l2-test-buffers.cpp      | 10 +++++-----
>  utils/v4l2-compliance/v4l2-test-codecs.cpp       | 12 ++++++------
>  utils/v4l2-compliance/v4l2-test-colors.cpp       | 12 ++++++------
>  utils/v4l2-compliance/v4l2-test-controls.cpp     | 10 +++++-----
>  utils/v4l2-compliance/v4l2-test-debug.cpp        | 12 ++++++------
>  utils/v4l2-compliance/v4l2-test-formats.cpp      | 12 ++++++------
>  utils/v4l2-compliance/v4l2-test-input-output.cpp | 10 +++++-----
>  utils/v4l2-compliance/v4l2-test-io-config.cpp    | 10 +++++-----
>  utils/v4l2-compliance/v4l2-test-media.cpp        | 12 ++++++------
>  utils/v4l2-compliance/v4l2-test-subdevs.cpp      | 12 ++++++------
>  utils/v4l2-ctl/v4l2-ctl-common.cpp               | 10 +++++-----
>  utils/v4l2-ctl/v4l2-ctl-edid.cpp                 |  8 ++++----
>  utils/v4l2-ctl/v4l2-ctl-io.cpp                   | 12 ++++++------
>  utils/v4l2-ctl/v4l2-ctl-meta.cpp                 | 12 ++++++------
>  utils/v4l2-ctl/v4l2-ctl-misc.cpp                 | 12 ++++++------
>  utils/v4l2-ctl/v4l2-ctl-modes.cpp                |  4 ++--
>  utils/v4l2-ctl/v4l2-ctl-overlay.cpp              | 12 ++++++------
>  utils/v4l2-ctl/v4l2-ctl-sdr.cpp                  | 12 ++++++------
>  utils/v4l2-ctl/v4l2-ctl-selection.cpp            | 12 ++++++------
>  utils/v4l2-ctl/v4l2-ctl-stds.cpp                 | 12 ++++++------
>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp            | 10 +++++-----
>  utils/v4l2-ctl/v4l2-ctl-subdev.cpp               | 12 ++++++------
>  utils/v4l2-ctl/v4l2-ctl-tuner.cpp                | 10 +++++-----
>  utils/v4l2-ctl/v4l2-ctl-vbi.cpp                  | 10 +++++-----
>  utils/v4l2-ctl/v4l2-ctl-vidcap.cpp               | 12 ++++++------
>  utils/v4l2-ctl/v4l2-ctl-vidout.cpp               | 12 ++++++------
>  utils/v4l2-ctl/v4l2-ctl.cpp                      | 12 ++++++------
>  utils/v4l2-dbg/v4l2-dbg.cpp                      | 10 +++++-----
>  46 files changed, 236 insertions(+), 236 deletions(-)

