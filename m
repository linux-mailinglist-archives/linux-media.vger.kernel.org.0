Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B32334593F
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 09:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhCWIF4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 04:05:56 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:54771 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229574AbhCWIF1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 04:05:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Oc2UluUsMUzyrOc2XlOeQG; Tue, 23 Mar 2021 09:05:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616486725; bh=y+KIGMAyS7vJPgQsHPA9ypI1T2SiRO/FTNILOpZM9CE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LG01DywxGjaRwVOmztDUCaw9RUMt4psZBP+oz3vDj7y+9b2WaTZqcSvQBNHpV9TvC
         +Jg+nk2JNk67xnEw+Sibn/iKA4W8U18jpvRXS8pjMWoCmblH0aG3FSFmdY5mb46hKg
         5m/l0oz1UqytCeHiixbFSPPBgarA4oPC/ne/nFFtYj06iTh1/kAuLfB3HKCiM7qBeV
         tcC5ec5ce3J4X34m5I2W4WkylCtgf8rLQtTPsypvQuTF0Zm4/UIq3sc4zEKSvTDVuO
         k3fCvqIb7LgU8TYFB+PXuwdwt1lr+KwmmWsLh2cbmSOb3xkF9p3GyNS+rJYnKUAKEC
         Ah+uZxt2Yv0FA==
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Can you fix these ccs and ipu3 kernel-doc warnings?
Message-ID: <81829d9c-6ca9-0d64-108c-54afdd0c0ebb@xs4all.nl>
Date:   Tue, 23 Mar 2021 09:05:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJs4Vx9n7qpLQ5t41LzEqYltex2Rh/I/3/5cWYwLuMZex5EcceHUoRqU+HoPSt99fZv9OVqfpfhFBnSwSfhvG8VdSob+FR070aeh8VWQtYy19RGJvgAt
 q5rkjE5UH6elhpmtQRR4XsGR1e/rtBqC8ZObuKVVFdo1rBSXAwoxGiiqIFdcQZAZZ13rz+Yk/d9issUGVB11muFC88PbQNbevGDBgt306g+oSWlSG/6M3c/a
 78F4KDpeGpt0Tv/VkoLMBQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

I've been cleaning up kernel-doc warnings in driver headers. Any issues are now
reported by the daily build, but there are way too many, so this needs to be
fixed.

Can you take a look at the following ccs and ipu3 warnings?

drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Function parameter or member 'post_streamoff' not described in 'ccs_quirk'
drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Function parameter or member 'flags' not described in 'ccs_quirk'

drivers/staging/media/ipu3/ipu3-css-pool.h:24: warning: Function parameter or member 'pages' not described in 'imgu_css_map'
drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'name' not described in 'imgu_video_device'
drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'output' not described in 'imgu_video_device'
drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'enabled' not described in 'imgu_video_device'
drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'vdev_fmt' not described in 'imgu_video_device'
drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'vdev' not described in 'imgu_video_device'
drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'vdev_pad' not described in 'imgu_video_device'
drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'pad_fmt' not described in 'imgu_video_device'
drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'vbq' not described in 'imgu_video_device'
drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'buffers' not described in 'imgu_video_device'
drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'lock' not described in 'imgu_video_device'
drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'sequence' not described in 'imgu_video_device'
drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'id' not described in 'imgu_video_device'
drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'pipe' not described in 'imgu_video_device'

Thanks!

	Hans
