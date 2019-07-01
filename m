Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAEF5B900
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 12:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfGAKaZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 06:30:25 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:41255 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfGAKaZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 06:30:25 -0400
Received: by mail-vs1-f65.google.com with SMTP id 2so8548025vso.8
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 03:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=IHX+69SaG6p2yhg0r5EPi4ytgF/KynZ9G8D4StwVSO0=;
        b=afu7G7C6mpvhxDgO0OcI3XQff47FGlklaawMSBNibU3Hewl91X/l0ee6gQHtAtl4W5
         fxfOzC2AayhJFZ+Aebja7jtXD+ONOoLR7R6OV2u5wXitWaDeoKIGwM807dbweUUh4bO9
         67Ho8GchaVZa7hAndMd/x+GXVv1mMQDtpIaBZrq3uPUDux54Hizya6X9jxmKyjNdllXF
         LaTQcx1XqOuKRGemWjKeo4Ddf3ZGtjI6J0LQlXh/qVMFdEw0XNxnfxGLQ9SlCe/5bEgz
         VlVkZo4Uh5xDsO+quOhcrdmjPQJWbOpwIk091zAf/FCgvxASosE842oMv7YEKw8vwDc4
         Dj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=IHX+69SaG6p2yhg0r5EPi4ytgF/KynZ9G8D4StwVSO0=;
        b=krzVSby4J53Sp3IMwpJLlgrFJh/QUVkNlUtZvrA5n1RHngiOZqBhmRf/+TB12visgu
         HYHhJQW9mZn5DQmFJRoywXBzq/vDgDFRCObuVBQ0G6gx5I0yMK0c/8QnGPCqfFoBWLiw
         bEO8kuP3zPHJQinZWiB/ewwAteTaiNy3y9d+jSK1Zymkv5E1UHPjHz2k2L1AJJgmYzBm
         BGXyu2NrDNhrsyLgJwiM5hpOuSwTSgTKCLu+EIjrUwwLFqD6m6SqlNJNz1PUIjr1m/fz
         y9xT3aB4PSJXksa/CnhZb4eVRHcbmD6/UDm4TL3q9uTT3u928xgBAZ171D8NPpl7HDMC
         rnsA==
X-Gm-Message-State: APjAAAUsgAywDLB+KvWMYCRw73UUchQwWWBapGQfN7XH+ThBsZa6JlNw
        UehQ6NtswmS6wcRkmLxW+33GZX4zlt9iom7+5jM=
X-Google-Smtp-Source: APXvYqxOWvMj6TeYGTd/zOOSNtF+Q+R/7RJSzdClfiO+1mjtfGTb9IzWhj05mXee9s7tjcDkT9cRV3jGLQDkT1c4nMM=
X-Received: by 2002:a67:e244:: with SMTP id w4mr6362023vse.176.1561977024409;
 Mon, 01 Jul 2019 03:30:24 -0700 (PDT)
MIME-Version: 1.0
From:   Dafna Hirschfeld <dafna3@gmail.com>
Date:   Mon, 1 Jul 2019 12:30:12 +0200
Message-ID: <CAJ1myNR7stUdFmnAnnWLdE008p5_BvXkHnr7au+TH3HW183X1w@mail.gmail.com>
Subject: regarding commit "v4l2-ctl: get fmt after source change" in v4l-utils repository
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

commit 84219e2b5d013709ee5259621715966c46eec746
Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Sat Mar 30 14:16:25 2019 +0100

    v4l2-ctl: get fmt after source change

    When a source change event arrives during decoding get the new
    format at that point instead of after restarting streaming.

    If there is another source change queued up, then when you call
    streamon for CAPTURE again it might send the new source change
    event and update the format for that one, so reading the format
    after streamon might give the wrong format.

    Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index bb656584..3695a027 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -2363,12 +2363,11 @@ static void stateful_m2m(cv4l_fd &fd,
cv4l_queue &in, cv4l_queue &out,
                        if (in_source_change_event) {
                                in_source_change_event = false;
                                last_buffer = false;
+                               fd.g_fmt(fmt_in, in.g_type());
                                if (capture_setup(fd, in, exp_fd_p))
                                        return;
                                fps_ts[CAP].reset();
                                fps_ts[OUT].reset();
-                               fd.g_fmt(fmt_out, out.g_type());
-                               fd.g_fmt(fmt_in, in.g_type());
Removing those lines cause inconsistency when the user send the wanted
capture pixel format when decoding with the `v4l2-ctl` command. In
this case the value of `-v pixelformat=...` is updated in the kernel
with the capture_setup function but it is not updated in the fmt_in
variable and so the command will try to save the decoded video in a
different format from what is configured in the kernel.

                                cap_streaming = true;
                        } else {
                                break;


Dafna
