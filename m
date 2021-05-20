Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76FE338A04A
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 10:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhETI5x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 04:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhETI5w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 04:57:52 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9BCC061574
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 01:56:30 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id o5so9499932edc.5
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 01:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=NHo7EOcH6zakvLRkkwiuD2TngoKB4qsV+psQZ5fh3JI=;
        b=ogw6vZQD84F0m8FkNXocwSnC82UviXpTnghgvXA4MkG6AXUGS1e9nOUxSCY/DmpewD
         SGqpxbsmaq1ULfzIDT1NhSI31A56kstmiyOyOwHQd303tXkA03ZUzIrEfgA+rYIrZzfj
         APzIqnPhgC+MQrTfa1Sw0aVdgxWz0HJYdicu1IYptxSRtgpxQ4WfqbNM3/HX/IqssohY
         JBj2buZS4+5dArFpoDYSHBRtWjPm6Cl+B4mem6nl639z7vzCM4Tlea+LEgfhB3Ad0+Zj
         /GKGrjsOPSu/NJHcn1aIzCAVHJ1TW9Mghqzk+e0N/hrpeGG7sqUWfRpC7cpjks7JJq9p
         VbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=NHo7EOcH6zakvLRkkwiuD2TngoKB4qsV+psQZ5fh3JI=;
        b=qcdVthW9BMKDgg6TMsZivr9hDjt5KepDkeeoBBijsMWio23GG8sr8WinelovjJupqn
         pDEU4jTVYnl1INDXeuuPLem5t9x0g/aZFaoyYZS5lwQxbADe9Noqq+68LmeO8DdwSldt
         GygRIyKhthDFQT5VUe1vph3uIzZJqCvJZ5pcHLK4A6HItMzGJrCzROGCgN0LV0pc0WBU
         qdqnSQpzE2z5ansiHhj6P5ammP+mcJJkdYTReVeRoiVbNmVVZhDkZ0/YTdE4Y6b1QIZN
         AOQ0BsGXZDoT9N129Rx1P45d6uUvm6zUSZtYJFCBNoaTTSW+xCzvyHp+SEjMLjvEyh1y
         OyuA==
X-Gm-Message-State: AOAM531JK599k/xnM7dUykZVsJVOqs/usc4ACo0+sMdnMzzbQlLj2ln9
        A6Y9N24UdhcJvI+rHfTKUO9YVcKeNcc=
X-Google-Smtp-Source: ABdhPJz92MiPaM3EJqLiN3HXL84f2ZrT58AwCLfUetNFKW5STimmMURHHH77MxFIJG5jsGT21YRcCw==
X-Received: by 2002:aa7:ca0c:: with SMTP id y12mr3800875eds.380.1621500988868;
        Thu, 20 May 2021 01:56:28 -0700 (PDT)
Received: from coco.lan (ip5f5ad500.dynamic.kabel-deutschland.de. [95.90.213.0])
        by smtp.gmail.com with ESMTPSA id p25sm1039062eja.35.2021.05.20.01.56.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 01:56:28 -0700 (PDT)
Date:   Thu, 20 May 2021 10:56:26 +0200
From:   Mauro Carvalho Chehab <maurochehab@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: LinuxTV IRC channels
Message-ID: <20210520105626.00802e5d@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Probably some of you already read some news about Freenode, like those:

	https://www.phoronix.com/scan.php?page=news_item&px=Free-Software-Exits-Freenode
	https://lwn.net/Articles/856543

It sounds too early to take any decisions about that, as we need to
wait for things to calm down in order to take any decisions that
could impact our community.

Yet, as concerns regarding privacy could be real, I'd like to remind
you that:

1. we use the IRC chat channels at Freenode (#v4l and #linuxtv) on
   our public discussions.

   As such, those channels (either at Freenode or on any other IRC server)
   shouldn't be used to discuss sensitive information or to expose data
   that could compromise personal information;

2. only the server owners could ensure that information exchanged via
   a chat platform is secure;

3. The LinuxTV community doesn't own any servers. So, there's no 
   warranty - either explicit or implicit - that any information
   posted there would be kept in private, even if exchanged via
   private messages.

On other words, only use chat channels for information that aren't
sensitive. Also, use private messages at your own risk. From my side,
I recommend you to not discuss any sensitive information via IRC  ;-)

The media maintainers are following closely what's happening with 
Freenode and, while we registered some channels at Libera.chat
(to where several Freenode operator volunteers moded), for now,
we're keep using #v4l and #linuxtv channels at Freenode.

If something changes, we'll let you know via e-mail.
