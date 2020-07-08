Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CCD21839A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 11:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbgGHJaW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 05:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgGHJaV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 05:30:21 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA21C08C5DC
        for <linux-media@vger.kernel.org>; Wed,  8 Jul 2020 02:30:21 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b6so48091537wrs.11
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2020 02:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f6Ah8qBiUDwokUFiVaBsuWRqDVhY1k0s4UHtgUSc1h0=;
        b=CXzTj/F0BlcOzj1dSzR5KRUZgT34nVcTujaaYTboVwKu4a44g9jFVnISsDNc49M5lf
         HBfWxitcsvGjqr+wcdHdJemcaQ1RqIRZL5CK92pfpiaX6QebtQF3wchjyqA/Yfyxq9MY
         d1HNJ1aVcwzPkrEUN4KjAC9GahcPySD+QK+AlbgF84lviWvwuJpELdXQl8edb20zuNqB
         NSceFPeQK/z5BF/iMjeXhCq7tAQjx7jb6/nl6QI3OnhcORSEKF+LWdLqzp3lWBqWXWMP
         gaatbBRhIxsrVlurvWDhwkkuXVXCL7Wj0N6R/AAgCl9KJp/yKSsiyAc1RZqB18Fpawdy
         n6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f6Ah8qBiUDwokUFiVaBsuWRqDVhY1k0s4UHtgUSc1h0=;
        b=WtD1qXPfbbyxKXwZdftf+n4snJThvb0shbjsLc5dN9C+tKv6XBv5XIXSwj79FRL9UR
         EZei96jR2aLmQJswK9z2ONMUOSvBa1fdtEwyWWZkJ6rvBnAqg+Jpqz37SoSHkT9P+crW
         IbayvZJT2QJPTsLO/VzfujLPPgB1tOLCn7pg2G+63v2z7YhDOHKa0wmtNumM/+TdXxW8
         Z8m1aWwEvW7j5jjka3n7GyZzntlpJfH6UUl82wfQNSHIipF8thtcBeoOzg764cFQ0rqX
         kPBIFoBN3XYM5Tr2kOn8+45nV5CsY70r/BIE25uSZ4zTvDkRuY2WnljlbmPiTJ61etd7
         RMyA==
X-Gm-Message-State: AOAM532RQ6MTSZmdOp5IdCLBkhUt+Ztkm2SQgOqBXG7TM21HXsveYEyX
        uAC9SxDx7BH+rGBqIsTwVq5ihAAVD1MI9t4h8IJp3Q==
X-Google-Smtp-Source: ABdhPJyrwpdAOJGgLsg3IwGesk+JPxgYXu8nlIpsYysonc3Qltu3eSxxpUyi3yufpzKgAUbuC4cAgPwyzDdmbJaIU/4=
X-Received: by 2002:adf:cc85:: with SMTP id p5mr56765886wrj.273.1594200620323;
 Wed, 08 Jul 2020 02:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntAogTZHd7Oh_7L+ghh4_DP9AzZ4DuJ9xChN_EmVbGXb1Q@mail.gmail.com>
 <34df23a8-6ab1-aaba-19f7-5193d18a60b0@xs4all.nl> <CAPY8ntAjV7vxpb2qFQVY+EYk3Mb0nBfGovYcAvw+0NMFH0j5PQ@mail.gmail.com>
 <20200708035940.GB571@jagdpanzerIV.localdomain> <01fb82b0-a1b6-9cae-b462-46cbe33491ce@xs4all.nl>
In-Reply-To: <01fb82b0-a1b6-9cae-b462-46cbe33491ce@xs4all.nl>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 8 Jul 2020 10:30:03 +0100
Message-ID: <CAPY8ntCNrwzO0XQg+iFOfft1LzfH9Zmpg6QZXZMyTzd_8iFe9g@mail.gmail.com>
Subject: Re: v4l2-compliance tests for cache flags
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey & Hans

On Wed, 8 Jul 2020 at 09:22, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 08/07/2020 05:59, Sergey Senozhatsky wrote:
> > On (20/07/07 15:41), Dave Stevenson wrote:
> >>> v4l2-compliance tests are in sync with our master and it expects that
> >>> that kernel is used.
> >>
> >> Thanks, I'd never noted that restriction. All previous times I'd used
> >> v4l2-compliance against any kernel it had performed as expected. This
> >> is the first change that causes a major failure of tests due to an
> >> older kernel.
> >
> > It depends on Linux UAPI headers, so the restriction is sort of mandated,
> > but probably not widely recognized the by the distributions, looking at
> > arch, for instance:
> > https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/v4l-utils

Except that v4l-utils has a private copy of all the headers in
https://git.linuxtv.org/v4l-utils.git/tree/include/linux, so it builds
independently of the distribution's kernel headers.

> > Adding a Linux version check code can be a bit intrusive. There has been
> > a whole bunch of changes all over the place, for instance:
> >
> > ---
> >
> > +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > @@ -381,8 +381,6 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
> >         if (g_flags() & V4L2_BUF_FLAG_BFRAME)
> >                 frame_types++;
> >         fail_on_test(frame_types > 1);
> > -       fail_on_test(g_flags() & (V4L2_BUF_FLAG_NO_CACHE_INVALIDATE |
> > -                                 V4L2_BUF_FLAG_NO_CACHE_CLEAN));
> > ---
> >
> > So running newer v4l-compliance against the older kernel or older
> > v4l-compliance against the newer kernel may trigger various failures.
>
> It shouldn't. It's (I believe) just the check that those two flags
> are cleared if cache hints are not supported that should be under a
> version check.

Indeed, the only change I need to make for the tests to work is to
disable the two lines in the else clause:

--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -1272,7 +1272,7 @@ static int setupMmap(struct node *node, cv4l_queue &q)
                if (cache_hints) {
                        fail_on_test(!(flags &
V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
                        fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
-               } else {
+               } else if (0) {
                        fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
                        fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
                }

I started looking at kernel_version, but currently it only gets set
for 2.6.x kernels, and is set to the x.

Hans, would you be happy with taking the kernel's KERNEL_VERSION macro
and using it to encode the whole version, eg

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp
b/utils/v4l2-compliance/v4l2-compliance.cpp
index d0441651..c372a15c 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1497,10 +1497,9 @@ int main(int argc, char **argv)
        printf(", %zd bits, %zd-bit time_t\n", sizeof(void *) * 8,
sizeof(time_t) * 8);
        uname(&uts);
        sscanf(uts.release, "%d.%d.%d", &v1, &v2, &v3);
-       if (v1 == 2 && v2 == 6)
-               kernel_version = v3;
+       kernel_version = KERNEL_VERSION(v1, v2, v3);
        if (kernel_version)
-               printf("Running on 2.6.%d\n", kernel_version);
+               printf("Running on %d.%d.%d\n", v1, v2, v3);
        printf("\n");

        if (!env_media_apps_color || !strcmp(env_media_apps_color, "auto"))
diff --git a/utils/v4l2-compliance/v4l2-compliance.h
b/utils/v4l2-compliance/v4l2-compliance.h
index ae10bdf9..657f5a2a 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -61,6 +61,8 @@ extern int kernel_version;
 extern int media_fd;
 extern unsigned warnings;

+#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))
+
 enum poll_mode {
        POLL_MODE_NONE,
        POLL_MODE_SELECT,
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp
b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index b0b878c1..7e6fb30e 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -1272,7 +1272,7 @@ static int setupMmap(struct node *node, cv4l_queue &q)
                if (cache_hints) {
                        fail_on_test(!(flags &
V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
                        fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
-               } else {
+               } else if (kernel_version >= KERNEL_VERSION(5, 9, 0)) {
                        fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE);
                        fail_on_test(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN);
                }
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp
b/utils/v4l2-compliance/v4l2-test-controls.cpp
index d81dddb2..dde661ed 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -411,7 +411,8 @@ int testSimpleControls(struct node *node)
                        ctrl.value = 0;
                        // This call will crash on kernels <= 2.6.37
for control classes due to
                        // a bug in v4l2-ctrls.c. So skip this on those kernels.
-                       if (kernel_version < 38 && qctrl.type ==
V4L2_CTRL_TYPE_CTRL_CLASS)
+                       if (kernel_version < KERNEL_VERSION(2, 6, 38) &&
+                           qctrl.type == V4L2_CTRL_TYPE_CTRL_CLASS)
                                ret = EACCES;
                        else
                                ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);

Actually isn't the current test of kernel_version in
v4l2-test-controls.cpp wrong?
If running on a 3.x, 4.x, or 5.x kernel then kernel_version will be
left at 0. 0 < 38, so we fall into the ret = EACESS; clause and skip
the test.
Is that what was desired? Presumably the bug in v4l2-ctls.c referenced
is fixed in all >= 3.x kernels. I obviously don't want to alter the
behaviour in an incorrect manner here.

Cheers
  Dave
