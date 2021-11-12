Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E16EB44E5E5
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 13:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhKLMGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 07:06:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:37810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231147AbhKLMGd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 07:06:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB4E460F5B;
        Fri, 12 Nov 2021 12:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636718622;
        bh=ffeYzujj/IeBGfwFbKhdA6/Hu6ySBnlErnYWQnW5ztg=;
        h=Date:From:Cc:Subject:In-Reply-To:References:From;
        b=Pa/P6Mjt6y0jGRIeUabLvDYYvZmYYeesUzo/AKHgFTDLjZTNuyr2obUPEhqzx1dku
         HfYlYiq8eXB92REdHRNGxEaDRPhrai69Yx3BUrzfAJskyU/kdCq8/Qan4CSCIzgs4h
         csHzZQnHIRUiaXH6afxAMDKnorG/KghISaar+4X3b/nVPAjjdI5Ya8ptalZTS4z4B1
         ea0r2bzvIRY+6LTjxFX4c2v9gVl6Bx5CDl8B4Vr8vk3H+mBLFchOvwpuMWFqiJfrdd
         YYyzT5YQdn0J6S3H2W6P3sKc6Cdeb7m8SWpaaNTSo4iWU3kl2oLuW+J5QjnnGXWRCV
         lI3P09jhsOOjg==
Date:   Fri, 12 Nov 2021 12:03:35 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hdegoede@redhat.com>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/3] atomisp: add support for enum frame rate and sizes
Message-ID: <20211112120335.74e437db@sal.lan>
In-Reply-To: <cover.1636651027.git.mchehab+huawei@kernel.org>
References: <cover.1636651027.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 11 Nov 2021 17:27:55 +0000
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Adding support for those two ioctls are trivial, and allow testing
> different resolutions with the driver.
> 
> Together with some improvements I made at camorama, it is now
> possible to change the atomisp sensor's resolution at the GUI.
> 
> Talking about camorama, I also added there an option to disable
> the Gtk cairo_scale() calls. On my tests here, placing ov2680 on
> its maximum resolution, I'm getting a framerate of 26 fps, which
> sounds reasonable, as the maximum would be 30fps, and I'm not
> using daylight.
> 
> When letting cairo_scale() to run, the rate reduces to 8 fps, meaning 
> that Gtk is not using GPU acceleration.
> 
> Funny enough, when resolution is lower, atomisp is giving a very
> bad framerate (around 3fps, even with the scaler disabled).
> 
> This is a very weird result, probably indicating some problems inside
> the driver. That requires further investigation.

Ok, when the sensor's resolution is not the highest one, what happens is
that  the frame is retrieved via some timeout logic:

[10447.865064] ov2680 i2c-OVTI2680:00: ov2680_s_stream one
[10447.865491] atomisp-isp2 0000:00:03.0: timeout recovery handling done
[10450.029956] atomisp-isp2 0000:00:03.0: [WARNING]asd 0 pipe ATOMISP ISP PREVIEW output ISP timeout 1!
[10450.030099] atomisp-isp2 0000:00:03.0: pipe on asd0 timeout cnt: (0, 0, 1, 0) of 2, recover = 1
[10450.030137] atomisp-isp2 0000:00:03.0: pipe on asd1 timeout cnt: (0, 0, 0, 0) of 2, recover = 1

It sounds that it can't properly detect the end of frame when the
sensor is not on its highest resolution.

Basically atomisp_wdt_work() is triggered by a 
IA_CSS_EVENT_TYPE_FW_ASSERT event. Identifying why this is happening 
is not trivial, though.

Regards,
Mauro

