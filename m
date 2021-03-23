Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90610345DC2
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 13:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhCWMJg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 08:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhCWMIx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 08:08:53 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883C6C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 05:08:52 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 400D61F447B8
Message-ID: <a9edbf3cc7a253343f1fbce72053eec7008885b6.camel@collabora.com>
Subject: Re: Can you fix these hantro kernel-doc warnings?
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Tue, 23 Mar 2021 09:08:44 -0300
In-Reply-To: <3e517f8d-3e62-0bf6-0a8d-e82cf67541ca@xs4all.nl>
References: <3e517f8d-3e62-0bf6-0a8d-e82cf67541ca@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, 2021-03-23 at 09:01 +0100, Hans Verkuil wrote:
> Hi Ezequiel,
> 
> I've been cleaning up kernel-doc warnings in driver headers. Any issues are now
> reported by the daily build, but there are way too many, so this needs to be
> fixed.
> 

Yes, I've seen that. Thanks a lot for this.

> Can you take a look at the following hantro warnings?
> 
> drivers/staging/media/hantro/hantro_hw.h:149: warning: Enum value 'RK3288_VPU_ENC_FMT_YUV420P' not described in enum 'hantro_enc_fmt'
> drivers/staging/media/hantro/hantro_hw.h:149: warning: Enum value 'RK3288_VPU_ENC_FMT_YUV420SP' not described in enum 'hantro_enc_fmt'
> drivers/staging/media/hantro/hantro_hw.h:149: warning: Enum value 'RK3288_VPU_ENC_FMT_YUYV422' not described in enum 'hantro_enc_fmt'
> drivers/staging/media/hantro/hantro_hw.h:149: warning: Enum value 'RK3288_VPU_ENC_FMT_UYVY422' not described in enum 'hantro_enc_fmt'
> 

I just submitted a fix for it.

Thanks for letting me know,
Ezequiel

