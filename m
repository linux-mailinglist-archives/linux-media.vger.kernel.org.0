Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 121EE2E98A
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 01:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfE2Xw6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 19:52:58 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36901 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfE2Xw5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 19:52:57 -0400
Received: by mail-qt1-f195.google.com with SMTP id y57so4868724qtk.4
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 16:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=L1sm1/zy55IwsxX2fUvje0VQ1zxEWyptyn479+62rIA=;
        b=WmWu6lgGuOvW68nLYmxzz9D3Xzjhc2fEQFD+BuhmqHC3yFCEFomtQP+2Jy8SfjCTXc
         J1QbO/ErUIeuiRge9XKlojExWQgWeoLVKCLWnkqdK0X11ge0r17pYNfAvkx2pgyNoP5u
         9c0+SvWIb6iw9JB00Q9oK+44wVco8PTy/Q7dnd0mtzwQdkBOxyN7SVgzV0xnXESM+Yrw
         S3G+5VhF2BNwEGLxR3lWXgod4J2ZOxL9KLcWYwI+6Yez6coyQrUfQi91agQXrkH2roeU
         BQ31EaVWUXDddM/cssGw8b0cq2+W67K3r0NNLJcV7VTWYDeI9b+4Jq7JC0UTV3sgvLa5
         zE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=L1sm1/zy55IwsxX2fUvje0VQ1zxEWyptyn479+62rIA=;
        b=nq9+UXv+L0rb5nFc2b+Kds3xK20K/Zj/RGQLv6xNzVVzaJTd52q8nTotvUsW9vHaV6
         wfUjQe63nmcAyRz/ghRSHFH6PAOPgK08wtMtsqCxQhwizdsx46n51O/kZgyxuNMdIvwt
         dVOzuYqZwqsfZex8XKUULtPAkr+g0yzcX3Ik0F+UKFrAz4/GbvBTEziC99Ly4UzOhwRb
         c6YaKnBP769nu6QIKCP0eaP4ff4XO2romD+y+KUxS+t0wo9hu+IxjqPhjNDVRrbgBfhh
         smVfNhnHgwXp6PXJdljzM/RKc+aok/3ywNZrxeRFyoqkhNYOujgIhLINPIzYButhd+5Y
         zqAA==
X-Gm-Message-State: APjAAAUglJg1jiHUajkaZ8w7lDwubxqZB1TADMcZCtKWa7wZL4uadB8N
        lov45+OY9iNWIoXNytMmbGBk9g==
X-Google-Smtp-Source: APXvYqxfed8AmZAGc0qXqBgHyPPt/IFcy33qADjBWz1tohaNeEqcS0CvoU7f/cGBAvmFH+QVlNBZpw==
X-Received: by 2002:ac8:46c9:: with SMTP id h9mr690893qto.345.1559173976960;
        Wed, 29 May 2019 16:52:56 -0700 (PDT)
Received: from skullcanyon ([2002:c0de:c115:0:481e:e17e:2f68:43f8])
        by smtp.gmail.com with ESMTPSA id j37sm523651qtb.76.2019.05.29.16.52.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 29 May 2019 16:52:56 -0700 (PDT)
Message-ID: <fa48a38ee8e370c195a872ba302f70329d52dca5.camel@ndufresne.ca>
Subject: Re: [v8] media: imx: add mem2mem device
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Sven Van Asbroeck <thesven73@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 29 May 2019 19:52:54 -0400
In-Reply-To: <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
         <20190529154431.11177-1-TheSven73@gmail.com>
         <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
         <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 29 mai 2019 à 16:55 -0400, Sven Van Asbroeck a écrit :
> Philipp and Fabio,
> 
> On Wed, May 29, 2019 at 12:53 PM Fabio Estevam <festevam@gmail.com> wrote:
> > Does this patch from Philipp fix the problem?
> > https://git.pengutronix.de/cgit/pza/linux/commit/?h=imx-drm/fixes&id=137caa702f2308f7ef03876e164b0d0f3300712a
> 
> I am now running 5.2-rc2 with Philipp's non-plus imx6q patch.
> 
> Performance is still much worse than the Freescale baseline.
> 
> I am not at all worried about vpu scaler performance, after all v8 is an
> in-progress patch.
> 
> I am much more concerned about the CODA h264 slowdown. My 1080p30 test
> video runs at half the speed compared to the Freescale kernel. The best it
> can do is 28fps, which results in visible 'jerks' in the video. Note that
> this is without using the scaler.
> 
> Questions:
> - is the performance slowdown a known issue?
> - is there anything I've missed in the gstreamer pipelines below?
> - is there anything I can do to help?
> 
> A) mainline 5.2-rc2 with Philipp's latest non-plus patch:
> $ time gst-launch-1.0 filesrc
> location=/home/default/jellyfish-10-mbps-hd-h264.mkv ! matroskademux !
> h264parse ! v4l2h264dec ! kmssink can-scale=0 sync=0
> real 0m 32.01s

kmssink element still have some issues as it renders using the legacy
KMS API and makes an synchronous vblank wait before returning. In many
cases, the proper workaround is to do:

  ... ! v4l2h264dec ! queue ! kmssink can-scale=0 sync=0

In order to measure the decoding performance without having the display
being involved you can also do:

  ... ! v4l2h264dec ! fpsdisplaysink text-overlay=0 video-sink=fakevideosink sync=0 -v

In order to benefit from the best of this driver, you should also use
the latest GStreamer 1.16.0. It contains latest fixes from Philipp and
I, including some performance improvement.

> 
> B) Freescale kernel:
> $ time gst-launch-0.10 filesrc
> location=/home/default/jellyfish-10-mbps-hd-h264.mkv ! decodebin !
> mfw_v4lsink sync=0
> Running time 0:00:14.781129554 render fps 59.941

