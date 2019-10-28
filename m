Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 543D0E7906
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 20:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729871AbfJ1TMh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 15:12:37 -0400
Received: from mail-il1-f181.google.com ([209.85.166.181]:36239 "EHLO
        mail-il1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729857AbfJ1TMh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 15:12:37 -0400
Received: by mail-il1-f181.google.com with SMTP id s75so9186846ilc.3
        for <linux-media@vger.kernel.org>; Mon, 28 Oct 2019 12:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=v4sgx6tchij8udDll/f9f9oHOKU/r/ECQQ/X3jh4Gb4=;
        b=JulU5Znpy+o0szi7aWndZp50W4ha9IcjoKHmC6Pex0hJ19Tf7BBpz1hiyTYeBAYzpx
         90xsZEzOu3UangkCcPwcy0MZkcs0ko+ULIXUEOSw4HZKv01KCrG2t2qpnXjBv4ZCy6er
         b5AIAqEvAPTJwb1+Kfjp2/4HZRbPUfWEgjSGkXKhOZZX0o1d+G9RVGT53aSxjch+ZxeY
         rpupSfUP35MDZYhVHPa32v8GXZOyq2UvPjuL6zHEqe+NKUzlWOatKDNGdmRktspOTE35
         lmjjgitPRGPgtfDL2lc4ntCy9aqW6T11UPQK6SOmg9XPf12S28y1GMbbdPTW77Z5AQkb
         iX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=v4sgx6tchij8udDll/f9f9oHOKU/r/ECQQ/X3jh4Gb4=;
        b=gt+yvxly70P7tWyhEIguf95dOEUXwwGhteESeCh7xf6G/QsM0V/U5c1lP9D1LWd3F5
         6YEwTALWjl5oy2oc05icrcbQrLrMBUGRzYs72dNo4IQVC1y3dKzGXEwAWgZLdNjWbULJ
         Goiq1LuYhHK1bxTePju4Xnvnoe6chbVN0T0j6mVwnBTO1Ql0nhCLdckpKdE11/r+JvYH
         GVuueivPFJvoiOHjJoImJU/q3qVpzvJqQn4+NLoMCk1Bi6HCEz73oba7fHltslc8C/us
         0LL/DJhe6xTon+jRSGLd9Tz+C2yj3ymTH1yN8wu5hf/hmoCnwp59290qPjWYAKwhXowL
         klhw==
X-Gm-Message-State: APjAAAWeQjVyZ+c8RM/6hNhQsslScqOP++NNDDe4gtWVdCuST/dDy2FT
        1jqiG/Ed23zqH5CJhHifT7QXxeFlPBFiIP2GbrtGd+Vs
X-Google-Smtp-Source: APXvYqzucp6wZcJ3FHkZhEaKy/z937yKsX7gd/OWChJ2SLqyjV0cc9vVVCVy3t4zI4ol7ZZ76p60cLKq3gv5rhVHeH0=
X-Received: by 2002:a92:5c4f:: with SMTP id q76mr21239271ilb.158.1572289956128;
 Mon, 28 Oct 2019 12:12:36 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 28 Oct 2019 14:12:25 -0500
Message-ID: <CAHCN7xKr-8DDt26RmQpVcfa4fj=vuGY1H-_DD4UWpsaPq6wH7A@mail.gmail.com>
Subject: i.MX6Q LVDS colors wrong when HDMI connected when V4L2 Streaming with KMSSINK
To:     linux-media <linux-media@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I have an i.MX6Q with an OV5640 camera connected via CSI-2.

I can stream live video to LVDS just fine when HDMI is NOT connected
with G-Streamer and kmssink.  However, when HDMI is connected, I can
stream just fine to the HDMI, but when I try to stream to the LVDS
using KMSSINK, the colors are wrong.

If I use fbdev instead of kmssink, the colors are correct, but I would
prefer to use KMSSINK.

I have tried using v4l2convert to change the format, but I keep
getting errors that the format I try is not supported.

Might someone have any suggestions on how to stream to both HDMI and
LVDS without having the wrong color on the LVDS?


# display on hdmi
gst-launch-1.0 -v v4l2src ! kmssink name=imx-drm connector-id=54 sync=0

# display on LVDS
gst-launch-1.0 -v v4l2src ! kmssink name=imx-drm connector-id=56 sync=0


thanks,

adam
