Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83806D6A61
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 21:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729864AbfJNTxj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 15:53:39 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:36540 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbfJNTxj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 15:53:39 -0400
Received: by mail-io1-f50.google.com with SMTP id b136so40583428iof.3
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2019 12:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=pN6kIFfaK+gxG5WLHedp3k0LHGvKHn9kK+6DizRvKUg=;
        b=bDn1a6r42tLhMb+xYWjmTARu/4Qe4HD6CnPShw/szLGk7w1CWfzB5blZqocmRDWG1V
         1KdEt71TB1PMgb91z8Boo3KkqorD0xld+2l9OUG1iskXrlmFSzPkH2BnRqXuD1/xqppn
         cBvMijI4zOU2Z3KaMBM3x20GaU4dhaz5wi3FBZECJKL0FmxAeIb3UkIaXbTK6bHjqzDA
         7L9kUYOXvULFssLGbZbw+C52eMGsYHUZHsaOyGNPRQ0g6g86N5jiJUrP0Abd/M26FxFT
         c9IZ4T5gmoDCxBNnVoL8NhwQmcR3jkN9+GkPxiawlxzMp6ELoSullwhpglLu+tBTfwTh
         LqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=pN6kIFfaK+gxG5WLHedp3k0LHGvKHn9kK+6DizRvKUg=;
        b=jJEigEbWaZckjlUUfrYr5XuP/4Q17aPW57vd03RP5mcG3wovs8vEftk7mgugreyy7Z
         +vARcgZaTLUdCb5NYb3+/iukNRu9XrbNmM4MRAz2XXq4aQp25/6ViYsXN0FIUd8B9AVg
         /CY6Wpi8h6xVIN0WDM6XhH8uNpU0RvD97S+jKnelqFRNJDKDD5yrPuZyvpuVP2JpagVx
         TQOx5o/Al2pr36hvFyENd/TEqXH3sIYtO9fbAw4Dx5toI2n3EiuZzc+ad5rTuyjkeLpo
         uRMOheQWu9wazSoawUee7bdIdMGO3fvmoVeofBhNAfJqrutjam0+25WLqVdm2bA9Jzor
         AipA==
X-Gm-Message-State: APjAAAWM760zHzAQFngCZaN2LtP9XVMbohm5Y26EE43a3Qiu0SbBkeZf
        SfzBlH+FUtFyNKVnFeyZkCt8c+rjY4pTTlurtLhvxrj6
X-Google-Smtp-Source: APXvYqy7GSon5JxkScQq6+szXVW/fHBAG13vY0RPlwXNHGzF5VhRiaJA0vDQ695vfiXvQERFeOqbTRo7kNqS2uRfK2s=
X-Received: by 2002:a92:8384:: with SMTP id p4mr2241492ilk.276.1571082818040;
 Mon, 14 Oct 2019 12:53:38 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 14 Oct 2019 14:53:26 -0500
Message-ID: <CAHCN7xLQkJ=4kh+a9jcMu6DXxET5BHxz6vV1GjHkEq5LcmiiRA@mail.gmail.com>
Subject: i.MX6Q + ov5640 CSI-2 Framerate (on 5.4-rc3)
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I have an i.MX6Q with an ov5640 connected to the mipi-csi2 interface.

I am routing ov5640 -> ipu1_csi0_mux -> ip1_csi0 -> ip1_csi0 capture.

I am trying to go through the steps to attempt to get 60fps at
640x480, but the best I can appear to acheive is 30fps.

v4l2-ctl --all

Streaming Parameters Video Capture:
        Capabilities     : timeperframe
        Frames per second: 30.000 (30/1)
        Read buffers     : 0

 I have tried setting both the ov5640 and the ipu1_csi0 to 1/60 without success.

Can someone tell me if it's even possible on this platform?  When I
stream the video to the HDMI monitor, I am only using 3% of the ARM,
so I don't think it's processor limited.

adam
