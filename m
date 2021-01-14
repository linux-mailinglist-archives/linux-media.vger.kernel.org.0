Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA962F60FF
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 13:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728537AbhANMVL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 07:21:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727315AbhANMVL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 07:21:11 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2890C061573
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 04:20:30 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id x20so7687192lfe.12
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 04:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=v0BuXy90466SIyOVryIYEdeRDMkJ4OxmnvshBX5VFZI=;
        b=GA68sssfpMhRzYRqLp85uvJc5FoLAckW+8hl1NbXhY7v9b1iubWwrg1UTFo6Twq7vV
         3Txmlg1+K35if5GhE0oo16QcXS/ef3qVUfpqpoIG6iBvCocsLe3d7bOFg9DffC6U1cjY
         WsEJJmh5t7PzsIFxQ5ia9IdfchBWidvEXKcUQQylzvpSYYbGHg9IdzuKbG6w33hnpbbX
         f+GV690ZCXlGLpbabEOu/c5slDrnxdORrrzD//xoZfaHcDbq62s819nbWxcZ/MhxzfER
         scXDblC/C+eYhLoNmUbB1M20ykT2imQXNKkSDMswIL6RLODIoiiAcoPqtOTZfQnwtYyA
         6TQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=v0BuXy90466SIyOVryIYEdeRDMkJ4OxmnvshBX5VFZI=;
        b=rHonwKCKjkYA4JD4UY/DBxKc9y8SG+wDogTIqNWEDDE/cX9QkUIXRW9W71x2hBSjem
         x9kbp9VmfPRFfxEEAyT8b6AxXvZ8hvClrn8ysP3VKd7dXS+HLzSrsGBsbw/ObwsqEhSg
         fyOlgkyUxobuvaFzMWWjQiOcBtzvLtk365ahaEggZwUjeMd4k4OI+ESuIdb6CvH8cj+j
         DH4XZXxQbrjL+aDhHSner8MKyA6aIzB7b2n+uwWhLu3pKzbGUi99tiZF7GDKg9q3W61q
         MMwR9PDEpgAhT1S8N4w7Cr9dKiFI3Z4/usYLmaUvip9BhmwebHZjTzmts7QlJmwGfb0Z
         ettA==
X-Gm-Message-State: AOAM530yhWSD4uwruSVLIVxjByLKSg7MtOw8CfSs7FTzjzIDaqSvSwBY
        uXeYsSLXXH2tXM6ged+OQtzcttqfnZcEggBryG1634ZkRou37g==
X-Google-Smtp-Source: ABdhPJzZw6JGOQ8xjV+x7D5/B6U44FwZ2yOkPOuIl9PfiuuCtq560fhTUeA4v6TDVrWrILgUpPY8ydL/fivwMMZBuTg=
X-Received: by 2002:a19:4856:: with SMTP id v83mr3056957lfa.583.1610626829231;
 Thu, 14 Jan 2021 04:20:29 -0800 (PST)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 14 Jan 2021 09:20:18 -0300
Message-ID: <CAOMZO5A3Dr2SF_u9z9p1dAwBrrPXTqkdVqZuBR0v6iYRPcJEig@mail.gmail.com>
Subject: Coda: imx53 plays video with incorrect colors
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I am testing video playback on an imx53-qsb running 5.10.6, but I am
not getting the correct colors in the TVE output. This is the result:

https://www.dropbox.com/s/a4ifivpoi663dkd/mx53.mp4?dl=0

The original video is this one:
http://cdn.clipcanvas.com/sample/clipcanvas_14348_offline.mp4

I resized the TVE output to 1024x576 so that scaling is not needed for now.

The Gstreamer pipeline I am using is:

# gst-launch-1.0 filesrc location=/media/clip.mp4 ! qtdemux !
h264parse ! v4l2h264dec ! kmssink

Gstreamer version is 1.18.2.

Any ideas on how to get the video playback with the correct colors?

Thanks,

Fabio Estevam
