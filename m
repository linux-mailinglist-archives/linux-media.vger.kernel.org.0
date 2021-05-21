Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7139038C8A1
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 15:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236206AbhEUNtX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 21 May 2021 09:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236606AbhEUNtW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 09:49:22 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1803AC061574
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:47:58 -0700 (PDT)
Received: from localhost (unknown [IPv6:2804:14c:1a9:2978:fc03:8702:eda1:a1f8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 970641F41981;
        Fri, 21 May 2021 14:47:56 +0100 (BST)
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 21 May 2021 10:47:18 -0300
Message-Id: <CBIYXUHIO2UY.Z2ZEJCSV5RES@notapiano>
From:   =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
Subject: [RESEND] Running libcamera on KernelCI to detect regressions in the
 media subsystem
Cc:     <kernel@collabora.com>
To:     <libcamera-devel@lists.libcamera.org>,
        <linux-media@vger.kernel.org>, <kernelci@groups.io>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(Resending since the previous one didn't reach KernelCI, sorry for the noise)

Hello,

as part of an effort to detect regressions in the kernel's media subsystem that
affects real use cases, I want to present a proposal and ask for feedback and
ideas.

Why?
====

There's been increasing interest in catching regressions in the kernel early, to
minimize the impact on userspace, and the media subsystem is no different. The
main test tool there is v4l2-compliance [1], but its focus is to purely exercise
the uAPI. There's currently nothing in place to test real use cases.

What to do?
===========

libcamera [2] is a library that works on top of the Media Controller and V4L2
APIs and abstracts away the hardware-specific pipeline configuration from the
application. It is a real user of the v4l2 uAPI.

Just recently an initial implementation of a testing tool for libcamera, called
lc-compliance, was merged [3]. It currently has only a few tests, but they
already test the capture of images for different purposes (raw images,
high-quality video capturing, etc), which exercise different media topology
configurations and pixelformats.

Although from the point of view of libcamera lc-compliance is a compliance tool,
from v4l2's perspective it is a real use case test rather than a pure API
compliance test like v4l2-compliance.

I'm currently in the process of refactoring lc-compliance to have a better test
framework [4], and make it ready to be automatically run on a CI.

By having lc-compliance run on actual hardware at KernelCI, we can exercise real
use cases of cameras and catch any kernel regressions that impact them as soon
as they happen.

Feedback
========

So, how can we best ensure we catch real use case regressions on the media
subsystem using lc-compliance? What kind of information should be present on the
test results? Any other suggestions?

Thanks,
Nícolas


[1] https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance
[2] https://libcamera.org
[3] https://git.linuxtv.org/libcamera.git/tree/src/lc-compliance
[4] https://lists.libcamera.org/pipermail/libcamera-devel/2021-May/020382.html
