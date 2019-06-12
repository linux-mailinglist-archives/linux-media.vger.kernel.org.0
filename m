Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B061D419C4
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 02:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406320AbfFLA6h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 20:58:37 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:37258 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405529AbfFLA6h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 20:58:37 -0400
Received: by mail-qk1-f193.google.com with SMTP id d15so8937729qkl.4
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 17:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=lCyIvXUF/KVDLpAYcUT+Ck5ZH0kz/HDS3rHiDVetioQ=;
        b=KVoUy7zQH//7/UopVPM441Ud29XCSoOL3F993oSS4Aju2MULAyOcmNN1ggtBuDt5wd
         dOKY1LEltzP9rNvjuAUtL4rTWo1rVE/dMmU6311VzxTBvXevWRHkTZIOlFOIG00r7BCU
         ZVhfMWYEx22jcetcnXnMGuttdFW4pWXCRrrJTCxYlOFKqW1ZQ6YgppnX3KVqxGsbCdf1
         QhvP5VIxeUshfA9QA+bUbSq3m6jD8uBDucMEXNGEdl6JrBrKJzJZWVHsskqpyS/eWyzP
         O9nHDuHfAcr2Ysfr4F/kgtxJysGn67Dfh5QuXab+86bcIaafX5I2OG20jz7FlX8fAaHU
         OP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lCyIvXUF/KVDLpAYcUT+Ck5ZH0kz/HDS3rHiDVetioQ=;
        b=P971HMnRGQ/SDvYkH6uhcH0XbD4Np10z4jkKcuMgPV1t2l/1ssWQ00ViEe0hnHHMGv
         5hOsLOUuQLRtNZrIvZ1RhC0T2UIfk2K8KUZ9dQhmGx10PQ+iS7ziOZz1InBGBdmDiONt
         +BD4wODHGdU//Bd1H2TEHwfe5gtYB499ucIchQIHdC0iXgbW8o/enQM4U8cNbLNxzROW
         p6cz3hsyS18Rpy9MkTlf3/a8NrzCo4UBRvUgfKcOKfe+PVN6ro00KsWqifbKVM4ugI6W
         sixN0iXMuguewGordJQUVvdd6cKRkBRxr6gM2HOkPi974NUJuV6j6CRJuNyq4ZulFzaD
         RLtA==
X-Gm-Message-State: APjAAAXIjgMAbca6dDLyVcBFBHC+wSScSbKsb8NBIh8JtiFzujxSO+Qe
        jh/4eSuwd8HgDGg1VDmuYxOL5w==
X-Google-Smtp-Source: APXvYqxZR85xJdgsXY+YNlNTC3iOdxqJUmzjZIfm3dI75Ue5eLolzP3t9Y33Jnlpbd7riDNlFijOCg==
X-Received: by 2002:a37:660b:: with SMTP id a11mr62787324qkc.342.1560301116293;
        Tue, 11 Jun 2019 17:58:36 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id u125sm7255907qkd.5.2019.06.11.17.58.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 17:58:34 -0700 (PDT)
Message-ID: <1d2adae2b6d0f370f17b9bac94ae4e9207dccbad.camel@ndufresne.ca>
Subject: Re: [PATCH v7 2/4] media: videodev2: add
 V4L2_FMT_FLAG_FIXED_RESOLUTION
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Date:   Tue, 11 Jun 2019 20:58:32 -0400
In-Reply-To: <1560243127.13886.3.camel@pengutronix.de>
References: <20190531093126.26956-1-mjourdan@baylibre.com>
         <20190531093126.26956-3-mjourdan@baylibre.com>
         <9731b2db-efd4-87d0-c48d-87adec433747@xs4all.nl>
         <1560243127.13886.3.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 11 juin 2019 à 10:52 +0200, Philipp Zabel a écrit :
> On Wed, 2019-06-05 at 15:39 +0200, Hans Verkuil wrote:
> > Hi Maxime,
> > 
> > I am wondering if this flag shouldn't be inverted: you set
> > V4L2_FMT_FLAG_DYN_RESOLUTION if dynamic resolution is supported,
> > otherwise it isn't.
> > 
> > Can all the existing mainlined codec drivers handle midstream
> > resolution changes?
> > 
> > s5p-mfc, venus and mediatek can, but I see no SOURCE_CHANGE event in
> > the coda drivers, so I suspect that that can't handle this.
> > 
> > Philipp, what is the status of the coda driver for dynamic resolution
> > changes?
> 
> FTR, to my knowledge there is no dynamic resolution change support in
> the firmware, as there is no signal (interrupt nor picture run return
> value) to indicate that different headers were parsed.
> 
> I am planning to add the initial source change event required by the
> current decoder API documentation, but I am afraid there will be no
> support for source changes due to mid-stream resolution changes due to
> firmware limitations.

I'm far from familiar with this IP, but at least on CODA988, I can read
from the manual that the workflow is to first guess the allocation, and
if you guess it wrong, an error is returned. What seems to match the
SOURCE_CHANGE event in that version would be in the picture status
register, the bit 20, which is documented as triggered if the stream
requires bigger buffers sizes, or more buffers. After fixing that, you
should, if I read correctly, retry.

It does not notify if the buffers are too large, but you can detect,
since there is register with the output stream information. This
basically means that for V4L2 restriction, you'd have to bounce the
buffers on frame size boundary or something like thisé

This workflow is very similar to how OMX works, but V4L2 is even less
flexible on allocation vs format, forcing more re-allocation.

> 
> regards
> Philipp

