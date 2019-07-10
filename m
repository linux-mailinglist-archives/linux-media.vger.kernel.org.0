Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91E2C644FE
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 12:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbfGJKMn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jul 2019 06:12:43 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:34769 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727203AbfGJKMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jul 2019 06:12:43 -0400
Received: from [IPv6:2001:983:e9a7:1:8d1:5ef:6c45:bece] ([IPv6:2001:983:e9a7:1:8d1:5ef:6c45:bece])
        by smtp-cloud9.xs4all.net with ESMTPA
        id l9aah3xGCuEBxl9abh6xaE; Wed, 10 Jul 2019 12:12:41 +0200
Subject: Re: regarding commit "v4l2-ctl: get fmt after source change" in
 v4l-utils repository
To:     Dafna Hirschfeld <dafna3@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <CAJ1myNR7stUdFmnAnnWLdE008p5_BvXkHnr7au+TH3HW183X1w@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <946d0dc5-f039-f591-3e1f-484f5499dbe8@xs4all.nl>
Date:   Wed, 10 Jul 2019 12:12:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJ1myNR7stUdFmnAnnWLdE008p5_BvXkHnr7au+TH3HW183X1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfECBY51THNIVeUkvJ6O8QLhiQ6osppsIUhDw4BzW21xrI+P5UlcU3EI2SA7wcDuUQib5FlVM+4JXPUsvI8GA7clmdMqmlOe582glIB5I8DF8aMI2Wq7g
 IwTvJ+ezzm/G5ssY3QKcd+ybcKxga3wojljKCw5ehVbR6HaAWF84SJY6mIKMbqZTvfzk1yzl9LpTM3lUHz2EQUU9XrlrjOgDzEPBJ2bTkuI1cTXzn0p7fWdn
 SvL2u2hCQpXkk449T/gpTlPTOEQ/dIrJcMBlCH8AqWA5Tcph2UvF1OkUzkpUT7d1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 7/1/19 12:30 PM, Dafna Hirschfeld wrote:
> commit 84219e2b5d013709ee5259621715966c46eec746
> Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Date:   Sat Mar 30 14:16:25 2019 +0100
> 
>     v4l2-ctl: get fmt after source change
> 
>     When a source change event arrives during decoding get the new
>     format at that point instead of after restarting streaming.
> 
>     If there is another source change queued up, then when you call
>     streamon for CAPTURE again it might send the new source change
>     event and update the format for that one, so reading the format
>     after streamon might give the wrong format.
> 
>     Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index bb656584..3695a027 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -2363,12 +2363,11 @@ static void stateful_m2m(cv4l_fd &fd,
> cv4l_queue &in, cv4l_queue &out,
>                         if (in_source_change_event) {
>                                 in_source_change_event = false;
>                                 last_buffer = false;
> +                               fd.g_fmt(fmt_in, in.g_type());
>                                 if (capture_setup(fd, in, exp_fd_p))
>                                         return;
>                                 fps_ts[CAP].reset();
>                                 fps_ts[OUT].reset();
> -                               fd.g_fmt(fmt_out, out.g_type());
> -                               fd.g_fmt(fmt_in, in.g_type());
> Removing those lines cause inconsistency when the user send the wanted
> capture pixel format when decoding with the `v4l2-ctl` command. In
> this case the value of `-v pixelformat=...` is updated in the kernel
> with the capture_setup function but it is not updated in the fmt_in
> variable and so the command will try to save the decoded video in a
> different format from what is configured in the kernel.
> 
>                                 cap_streaming = true;
>                         } else {
>                                 break;
> 
> 
> Dafna
> 

It looks like you are right. Can you try this v4l2-ctl patch?

Regards,

	Hans

[PATCH] v4l2-ctl: let capture_setup return the updated format

Just getting the new format after a source change event isn't
enough in the case that -v option was specified by the user.

Instead let capture_setup optionally return the new format after
any '-v' changes are applied.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Dafna Hirschfeld <dafna3@gmail.com>
---
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 28b2b3b9..470fa766 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -2146,7 +2146,7 @@ enum stream_type {
 	OUT,
 };

-static int capture_setup(cv4l_fd &fd, cv4l_queue &in, cv4l_fd *exp_fd)
+static int capture_setup(cv4l_fd &fd, cv4l_queue &in, cv4l_fd *exp_fd, cv4l_fmt *new_fmt = NULL)
 {
 	if (fd.streamoff(in.g_type())) {
 		fprintf(stderr, "%s: fd.streamoff error\n", __func__);
@@ -2168,6 +2168,10 @@ static int capture_setup(cv4l_fd &fd, cv4l_queue &in, cv4l_fd *exp_fd)
 			return -1;
 		}
 		fd.s_fmt(fmt, in.g_type());
+		if (new_fmt)
+			*new_fmt = fmt;
+	} else if (new_fmt) {
+		fd.g_fmt(*new_fmt, in.g_type());
 	}
 	get_cap_compose_rect(fd);

@@ -2367,8 +2371,7 @@ static void stateful_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 			if (in_source_change_event) {
 				in_source_change_event = false;
 				last_buffer = false;
-				fd.g_fmt(fmt_in, in.g_type());
-				if (capture_setup(fd, in, exp_fd_p))
+				if (capture_setup(fd, in, exp_fd_p, &fmt_in))
 					return;
 				fps_ts[CAP].reset();
 				fps_ts[OUT].reset();
