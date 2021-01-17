Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC802F903D
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 03:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbhAQCrH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jan 2021 21:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727629AbhAQCrF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jan 2021 21:47:05 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B8AC061573
        for <linux-media@vger.kernel.org>; Sat, 16 Jan 2021 18:46:25 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id c7so15746871qke.1
        for <linux-media@vger.kernel.org>; Sat, 16 Jan 2021 18:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=x+t/ftQdtgEVwQsEshQxni+jp2GlE9JWaMXd6gAM9Dc=;
        b=Ggy9qa0+uH5Q+SwmaMDUdxSwwJ6lk6aXUkov2CdtUQf74WDHm2ZVQkTUQB5/xKQACS
         AE99qExayVDACjkoDyEjK7zTijETZlJeOJjxCLfLZQQuqkdI8QKNVqCDXPuU83KKAHMt
         2X2nBDG7s7xLRsHQs/bwmX1204VbCjkp/PQghiewTwTPZTXicPFPnshsbw+S7lPRqZQQ
         KWxgHBLbGUwaOpyTX44APQlDFApFy0lNajiU4XFUtldAsNDPTr8cWR2+w8Bg98dFAvRF
         VZROvfnxuq/BPYo6D10vJ9F6dg7sJrHacD2M+NGgUdJdTDmHALCACReAcezFjeIbyQrR
         gxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=x+t/ftQdtgEVwQsEshQxni+jp2GlE9JWaMXd6gAM9Dc=;
        b=D9UN52EFWZigJenam59dIFKk0VldNMkB5EvzO9Prb9I2TjJPlp3xpTkULpHAMqM+cE
         /onVodJynv60pYituSMcCS9/Pef7eqyCZKwlM5T+0OqjPms3l8tg3779g1Gpg2D71suH
         pt/BtLmA91pdIZQ/lnd9IEzQRPFfzhpDxOiPNm+ZwohQX8KwhIpJmXTMrV7lrKtRMuen
         biwqBrAkGke5VYbQH1L/nveVw/LOH00svciUgwB+9yrCMcTB1E88jrhVEuqKcS2UR/pI
         8sXiJ76VP5bhZsHqBa4K/qpDXQTMFq2Od5R1Un5q3Bdx8qp3h4RZCSpf/ZXUD58y02ZD
         aRSw==
X-Gm-Message-State: AOAM533Bq+KBj6zrjQEmaVkcWcBt26EcRbmAfVppPtxLdtgMN04/O9wg
        J07jgzOVo0V9Vaa/vCnM/2zJMw==
X-Google-Smtp-Source: ABdhPJwy6Z8WjmepV1CF3MJCoHco9hi9qLojO1qSDGTMmrl/bCYVz3rY4HrEifBtQA/atzwFFbSKKw==
X-Received: by 2002:a37:c92:: with SMTP id 140mr19115906qkm.152.1610851584558;
        Sat, 16 Jan 2021 18:46:24 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id x130sm8266545qkb.78.2021.01.16.18.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 18:46:23 -0800 (PST)
Message-ID: <f8d2536fb5dadf7b7bdb4bfb6b3aaadf68318a88.camel@ndufresne.ca>
Subject: Re: Coda: imx53 plays video with incorrect colors
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Tim Harvey <tharvey@gateworks.com>
Date:   Sat, 16 Jan 2021 21:46:22 -0500
In-Reply-To: <CAOMZO5B=2z5sHWQvb0872v4f7YYN8Aq4ptf4YuDmoebJBtEY+w@mail.gmail.com>
References: <CAOMZO5A3Dr2SF_u9z9p1dAwBrrPXTqkdVqZuBR0v6iYRPcJEig@mail.gmail.com>
         <CAOMZO5B=2z5sHWQvb0872v4f7YYN8Aq4ptf4YuDmoebJBtEY+w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 14 janvier 2021 à 12:36 -0300, Fabio Estevam a écrit :
> On Thu, Jan 14, 2021 at 9:20 AM Fabio Estevam <festevam@gmail.com> wrote:
> > 
> > Hi,
> > 
> > I am testing video playback on an imx53-qsb running 5.10.6, but I am
> > not getting the correct colors in the TVE output. This is the result:
> > 
> > https://www.dropbox.com/s/a4ifivpoi663dkd/mx53.mp4?dl=0
> > 
> > The original video is this one:
> > http://cdn.clipcanvas.com/sample/clipcanvas_14348_offline.mp4
> > 
> > I resized the TVE output to 1024x576 so that scaling is not needed for now.
> > 
> > The Gstreamer pipeline I am using is:
> > 
> > # gst-launch-1.0 filesrc location=/media/clip.mp4 ! qtdemux !
> > h264parse ! v4l2h264dec ! kmssink
> > 
> > Gstreamer version is 1.18.2.
> > 
> > Any ideas on how to get the video playback with the correct colors?
> 
> I forgot to mention that this incorrect color behavior is seen with
> other video files too.
> 
> Actually, I was not able to see video playback with correct colors
> using mainline kernel on i.MX53 yet.

Perhaps you would explain in detail what isn't color correct ? To debug this,
you probably want to inspect the caps and the colorimetry negotiated between
each element (use -v in gst-launch-1.0). It's quite possible that the decoder is
ignoring upstream colors and get badly hinted by the driver, or that kmssink is
pnot passing colorimetry to the driver.

> 
> Thanks


