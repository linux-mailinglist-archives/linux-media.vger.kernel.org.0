Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1344B27C130
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 11:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgI2JbG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 05:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbgI2JbD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 05:31:03 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35624C061755;
        Tue, 29 Sep 2020 02:31:03 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id h1so1926342qvo.9;
        Tue, 29 Sep 2020 02:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=e88ooWjiQOpOfrYhw/usNSInJRrerniRy68mBsluY5w=;
        b=JjgPLYvoltS6sWy/za2uzHaIBNrud4/BS3Vm5QhKYWCqbJ2P8aKmDxi8vfFhkDQfTF
         +FkXDgTjMH18dFRZL86qG9+rJNnJTf4mT5gC84OYcwfzAY+noRkiCfKaMQlVXA0wshV3
         leGYCH1JktWA9+SXmIO+R3C2ZcBVDACW5esf560eO4jHisN7mN35DrKdzrNI2jL4++gx
         zE9PVioRz2DFPqsVI8hlZEwNkKIs6g9+myvmQrA8oktzdzNLfLjf1J6JB2kQI7iZauKZ
         QQ6JJVSrZiDySo1nDfd/0aIhzClTiDiSMjwTv44Zl7riuUmCPwe7OkfrI9aLhDWJTJc0
         n8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=e88ooWjiQOpOfrYhw/usNSInJRrerniRy68mBsluY5w=;
        b=RsVHWY0MWJdVDqokGFOlieqzdMwhuqEaTGCrFudiOuj+TsTThRfX9nNCFumcq8GKX/
         0nzSW5RQjAPZeG64TNi0umINKklLsQm6H7715HgKJRBxy75gV0KR5ibXvs3JKbyIL2sC
         RS6L5pXSj7El1LXnd+7XHyCfSWcSsGg6ywBBTGpKjV3MmqnrFx0yzQOu0/JDyE02xR9v
         8mivNhQg2KBtyQ2zsqhKJTJ8VgPr3eKyKz6RboLDGjtEbAVUDfN6FDQC8OQ6SfmKexdc
         XB7tJyfXr/9mwaNLM73HKXUdMNTlO5RGpxq0ESotKPBbX8ZXe9hV32HtVlNIyjVIoOq6
         cYjg==
X-Gm-Message-State: AOAM530X/bC7RoN2pR+MnTy4g5mKad109BjokksXLDc01QVEj0wbAKP1
        ZBkFpkQh9jLYzJ0xpO6Ptcw=
X-Google-Smtp-Source: ABdhPJx1Pqc440fd2iRFZdbR3F2yN1SfkCsG1CB522H21jDXh8P3Q31UfvawAyYM3uhxIbGbq8onMA==
X-Received: by 2002:a0c:b396:: with SMTP id t22mr3662524qve.13.1601371862291;
        Tue, 29 Sep 2020 02:31:02 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id u23sm4167715qka.43.2020.09.29.02.30.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 02:31:01 -0700 (PDT)
Date:   Tue, 29 Sep 2020 06:30:56 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     "=?utf-8?Q?r.verdejo=40samsung.com?=" <r.verdejo@samsung.com>,
        "=?utf-8?Q?nicolas=40ndufresne.ca?=" <nicolas@ndufresne.ca>,
        "=?utf-8?Q?linux-media=40vger.kernel.org?=" 
        <linux-media@vger.kernel.org>,
        "=?utf-8?Q?skhan=40linuxfoundation.org?=" <skhan@linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?=" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" 
        <linux-kernel@vger.kernel.org>
Message-ID: <8397580E-7905-4B02-B9F5-C3B09794A742@getmailspring.com>
In-Reply-To: <20200929071918.15c018ac@coco.lan>
References: <20200929071918.15c018ac@coco.lan>
Subject: Re: [PATCH WIP 1/6] media: vidtv: extract the initial CRC value
 to into a #define
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro!

> Next time, please add a patch 0, specially when you tag something as
> WIP, or RFC.

Sorry about that :)

These are almost good but I came across some weird kasan output.

Can you test this series in a kernel with kasan instrumentation turned on?

Should apply just fine on top of your latest changes in mchehab-experimental/vidtv

-- thanks
-- Daniel




