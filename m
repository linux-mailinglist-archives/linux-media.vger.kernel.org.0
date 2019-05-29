Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8F182E168
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 17:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfE2Pol (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 11:44:41 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:53298 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbfE2Pol (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 11:44:41 -0400
Received: by mail-it1-f196.google.com with SMTP id m141so4656684ita.3
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 08:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LTWj5bCGA0WDBiaBdUfUmFRNgyPmS+xq/N7Z3ARP5Xo=;
        b=m4AayAYnhYMpJJrFLUSVVjdziXek7Jn0BxL67qQlAtUOpcyZJmAsWam0maYxq1kLKd
         7zw5+c9fY4Gz2DTh7XS5H24rMkg/a1sfh4mGaFy1dZKIDLBCKauHu1VJRZvbMjQWRe8r
         wfuf4tiayfdS1bZMlWEkzlmhYZ1Pa0AcOvqt8XTyB2Z+K6e8BBkam4irA+Z4VYVZE3PT
         Q2WBajcHhsQYXnDN/Dr+YtnIE62rweN5EEZqA0+yE9MIOpzLEaRrlHnI/jsFtqJEyLV5
         rIN4tIJXJcBf3RwoQG0U9IVim96mWTFhGQEP0N7oJn7SgiUgpnj23OgIsQCdgOq/0oGV
         gXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LTWj5bCGA0WDBiaBdUfUmFRNgyPmS+xq/N7Z3ARP5Xo=;
        b=FPq/g/lQzgTAdfmFZb+lOrvDtIa7GyQv4kDY5Bdm7zFxQTXcPsNsSCAm7pTHN9iuBK
         vZ5LjoDpBywujEJApdGI3BXVuQpO4N5/JvcoesKYrv+f+gKqIa2awUzL1PVQbz/wgghG
         e0aEeYgNEf2Ok2ULVEUiLOClcidfW3DftzfTATi82/sWOQkLbhKg4Z0Am2n05Ssv02hn
         84xD5/9g0JxRzjaGThrXghQ3GjG+aUWtWDMwzNAhgocdpqShw8cSv+bbgM568bQutAfl
         /6iKVQXaFDJvIqXp0mAVFoKCw44EpHh5bEzz/YtYZ00Qo8IbV0qtfxvV/kfzhvolnXdV
         fQ6A==
X-Gm-Message-State: APjAAAU2L/hYjDNhSQQFP4SM93OCYKG4SIkYYH5QMC3tA1W7PD6sKII+
        wJKf/U5YJ5gsgQkZseSf68Y=
X-Google-Smtp-Source: APXvYqwxDSefy42SJXePzOyvJxUhFwCzd10ASC/YaOv67YSuAF3Nfq5JYk/9rQ8xlUZQG8kZxugAzg==
X-Received: by 2002:a24:4d1:: with SMTP id 200mr7295141itb.92.1559144674807;
        Wed, 29 May 2019 08:44:34 -0700 (PDT)
Received: from svens-asus.arcx.com ([184.94.50.30])
        by smtp.gmail.com with ESMTPSA id a2sm50997iod.57.2019.05.29.08.44.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 08:44:34 -0700 (PDT)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>
Subject: Re: [v8] media: imx: add mem2mem device
Date:   Wed, 29 May 2019 11:44:31 -0400
Message-Id: <20190529154431.11177-1-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190418164414.29373-1-p.zabel@pengutronix.de>
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you all (and especially Philipp) for this amazing work !

One of the main uses for the VPU scaler is to convert from video file
resolution to display resolution. E.g. the source video is 1080p, but the
display videomode is only 720p.

Unfortunately when I connect CODA/h264 decode to the VPU scaler, performance
drops to about half. But on the non-mainline Freescale kernel, even with
the rescale, I still get 30fps.

Mainline kernel + v8 imx rescaler patch:
A) 1080p30 source video -> CODA h264 decode -> drm 1080p: near full speed (28fps)
B) 1080p30 source video -> CODA h264 decode -> VPU scaler 1080p->720p ->
	drm 720p: only half speed (15fps)

Freescale non-mainline kernel:
C) 1080p30 source video -> CODA h264 decode -> VPU scaler 1080p->720p ->
	v4l2out 720p: full speed (30fps)

Question:
- is this expected behaviour ? A regression wrt. the Freescale kernel?
- perhaps I am missing something in the gstreamer pipeline ?

Gstreamer pipelines:
--------------------
A) gst-launch-1.0 filesrc location=/home/default/jellyfish-10-mbps-hd-h264.mkv ! 
matroskademux ! h264parse ! v4l2h264dec ! kmssink can-scale=0
B) gst-launch-1.0 filesrc location=/home/default/jellyfish-10-mbps-hd-h264.mkv ! 
matroskademux ! h264parse ! v4l2h264dec ! v4l2video8convert ! video/x-raw,width=
1280,height=720 ! kmssink can-scale=0
C) gst-launch-0.10 filesrc location=/home/default/jellyfish-10-mbps-hd-h264.
mkv ! decodebin ! mfw_v4lsink

I have tried various values for capture-io-mode/output-io-mode.

imx6q
v8 imx scaler patch backported to 4.19 mainline kernel.
GStreamer 1.14.4
