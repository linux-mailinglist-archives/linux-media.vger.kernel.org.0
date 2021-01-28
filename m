Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F33307F4E
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 21:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhA1UQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 15:16:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbhA1UOq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 15:14:46 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98667C061793
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 12:14:06 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id a19so6609979qka.2
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 12:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=17segdp+uikKZKVyOFpvIRxoa/UbxNz085ktkzI8x7Q=;
        b=SgvfNtp7p+4f5GHbfrFv0NEcGPW70CPsByJCD826gbdGo6rMdBJu25f0aXEbmL6tmJ
         SsD96oDwDBJbpUDC5u47HVuQrgetUQmX0f28AulAZfKYOHZBUqRIFeeQjfkteY+58p+w
         /FY9LVBdDY3kyC1EPVqL9hBdX9RVxFypjUqEkCcP7CSBeGK2NCTQEgYPzG+1Hk0i0XDy
         mn5lST0BY+OOxdNxEQ5x3E8ML3Rmbzl9Sz9ehVLyck1pzfNXpTX6FWzM9MFgsEXQa34+
         WpAXiYrio6/Fask+aPmvxJcQ1FG7sN9jlFtfpb0me0Omfe3KExUrSp2gsCS+90J0a3ju
         o+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=17segdp+uikKZKVyOFpvIRxoa/UbxNz085ktkzI8x7Q=;
        b=LetRsFLoE32hSUvdTxSb1C430koo22niitEcnsKRsn2dAOboOVNRij1N7EaoRBbdar
         qWl8bV1r6mshYFELOKCwXssFPzdOn9ux74Asis/p1SOVQZSxLgt/q1uKnV3c91kttGMl
         0iYk5jru0Fe4MR9rJUTtvLJ8wDrJDJgFYImLxidKhotkCOjbPXCp05j/ruZIRDiuByRn
         4cX61phnz1nzQ57hKTn75O1ybI+vLXVJwuZiJITqhKr+JcKCTpfynwHWYfFJxBcgLJri
         h2zgTewptHZJOEkTe6wAzjIvgVV6cu820TpvExZ+nIomS6y7+NB5Dd0XIxfmHvpJAPNz
         JhJA==
X-Gm-Message-State: AOAM531a/20uosLICh8h11r419A7rekbkYMc0zS5e4B1HoEGe3WQKgko
        4WufpfECQcaKy7ERXVkC4E3T5lt+zbESwf6p
X-Google-Smtp-Source: ABdhPJy1PSBHmjAFPcoMkltA1j/fYo4nAkx04/IJgyfU6shV0ln0WoOUeErKhqUdRPt62bU2ZJYO/A==
X-Received: by 2002:a37:555:: with SMTP id 82mr978321qkf.320.1611864845786;
        Thu, 28 Jan 2021 12:14:05 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id c15sm4030925qkj.129.2021.01.28.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 12:14:05 -0800 (PST)
Message-ID: <e3c363b505cef5a7310ae293bccf6fac43fa71c2.camel@ndufresne.ca>
Subject: Re: UTC timestamps in v4l2 buffers
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Philippe De Muyter <phdm@macq.eu>, linux-media@vger.kernel.org
Date:   Thu, 28 Jan 2021 15:14:03 -0500
In-Reply-To: <20210108125334.GA30740@frolo.macqel>
References: <20210108125334.GA30740@frolo.macqel>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 08 janvier 2021 à 13:53 +0100, Philippe De Muyter a écrit :
> Hello,
> 
> I need to have the v4l2 buffers of my camera sensor timestamped with a
> precise (1ms) UTC timestamp, in order to be able to match images from cameras
> from several computers (that are of course synchronised with NTP, GPS or PTP).
> 
> While I had that some years ago and still have in computers running
> freescale's 4.1.15 port for imx6q, I have now discovered that 8 years ago
> a decision has been taken by the v4l2 maintainers to switch the timestamp
> of the v4l2 buffers to CLOCK_MONOTONIC, which is useless when one needs
> to synchronise timestamps of images taken by cameras on different computers,
> which of course were not booted at the same time.
> 
> At that time a new flag "V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC" was introduced
> to tell new users that the timestamp was no more the old and not standardized
> behaviour for timestamp, but the new CLOCK_MONOTONIC-based timestamp, but
> no other flag for UTC or way to choose which kind of timestamp one wants.
> 
> Are there since then new standardized or work-in-progess flag to tell users
> that the timestamp is UTC, and way to ask the camera-acquisistion driver to
> give that UTC timestamp instead of the CLOCK_MONOTONIC one ?

Considering the CLOCK_MONOTONIC and CLOCK_REALTIME have the same slope (respond
to adjtime), you can probably just sample both clock in your application in
order to maintain a delta between both clocks. The more often your sample it,
the more precise you can derive. Don't forget to read REALTIME/MONOTONIC and
MONOTONIC/REALTIME orders, so you can averate to the real value. (GStreamer
needs to be improved in this regard).

> 
> Best regards.
> 
> Philippe
> 


