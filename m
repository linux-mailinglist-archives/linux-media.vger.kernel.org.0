Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126321AD58C
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 07:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgDQFN7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 01:13:59 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47440 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgDQFN6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 01:13:58 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 69C2E2A009E
Message-ID: <7faaec92dc9b5870b33c6dbb440de0698b5a70e7.camel@collabora.com>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Date:   Fri, 17 Apr 2020 02:13:47 -0300
In-Reply-To: <20200417102226.11d54815@canb.auug.org.au>
References: <20200417102226.11d54815@canb.auug.org.au>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stephen,

On Fri, 2020-04-17 at 10:22 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the v4l-dvb tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> WARNING: unmet direct dependencies detected for MEDIA_CONTROLLER_REQUEST_API
>   Depends on [n]: MEDIA_SUPPORT [=m] && MEDIA_CONTROLLER [=y] && STAGING_MEDIA [=n]
>   Selected by [m]:
>   - VIDEO_VIVID [=m] && MEDIA_SUPPORT [=m] && MEDIA_TEST_SUPPORT [=y] && V4L_TEST_DRIVERS [=y] && VIDEO_DEV [=m] && VIDEO_V4L2 [=m] && !SPARC32 &&
> !SPARC64 && FB [=y] && HAS_DMA [=y]
> 

Ugh, my bad. MEDIA_CONTROLLER_REQUEST_API can't
depend on staging, after this recently merged commit:

"media: Kconfig: Don't expose the Request API option"

So, we should fix that with:

diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
index 7c9628f37196..4815b9dde9af 100644
--- a/drivers/media/mc/Kconfig
+++ b/drivers/media/mc/Kconfig
@@ -14,7 +14,7 @@ config MEDIA_CONTROLLER_DVB
 
 config MEDIA_CONTROLLER_REQUEST_API
        bool
-       depends on MEDIA_CONTROLLER && STAGING_MEDIA
+       depends on MEDIA_CONTROLLER
        help
          DO NOT ENABLE THIS OPTION UNLESS YOU KNOW WHAT YOU'RE DOING.
 
Mauro what do you think?

