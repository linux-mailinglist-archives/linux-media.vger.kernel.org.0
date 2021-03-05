Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E1A32DFCD
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 03:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhCEC5G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 21:57:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhCEC5F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 21:57:05 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF3DC061574
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 18:57:03 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id d20so692800qkc.2
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 18:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XqvfZaruEqUUua6KRXNJABdE+FAjr3KEqMg2GZ/42/o=;
        b=pL0vedWnyrtjz42tswNZ1PSlJqoP3tyIdkFJPKRIBjvCM/qUCXNW9VfrnrmVmiivHN
         2cQz+PL+8hUpDmAa3S3tRINb+WhyU6rkLxAZSjppbnq9Ezs1DIQwiOAx/V/eIhF5twft
         XLPN4S5uuZaQ4yeXfGR2AcvOveEVvYWcFo8iOGB24Vv9XvTwUb7n+/nB3BKoQFomyFtH
         fnIB1SFKCXn1Ceuii6TAE6uv97VfNPM0A83g+JUzl7w5jQIeTCeVCk2wmjaAUNsNzr1x
         N5+uEVGP/3RaiCotdM7MxEHSXvXzU+R1IFX5165f7dMIq2x9HfKFyMt8LF0nDF+gjw8k
         0BwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XqvfZaruEqUUua6KRXNJABdE+FAjr3KEqMg2GZ/42/o=;
        b=H5Cj3Km9mkQJtFKSef+gORcOHzzfJRx7C6PWx20ok4PjYN+GGNlmVCNuOlz2mzI0Jd
         Y/yGopcPNnVOHLToAa2/zfHRfC2Qq7ZcUfGq9OlRX0j4MER3YPhMHkrWwJj9Qj8CBLcQ
         ZoNw+MR/tKxdSx9u+ohh+2jMJnjvnta5fiSKzyLvOnYk9kgO1TmLqi6aEKeAe6FDnXpu
         +VR3JnBIQ8aBNZ6JVd4voyvn9gqLit2GRL9sgDyMtpLh2Y5DtD9kAXwXRSj4oNE1pwCo
         0P8KztuXGH+kTwsEZoVfdBYko+jYS1Od2V0GYGeL/KhmrfAyi/Ts2Qeti9LIGrRQd6LE
         diCw==
X-Gm-Message-State: AOAM532NRe5sUDxrlKfNkwz55f0/1+4eBcnn5CFkJ2VS7ypl4h8Eot3s
        i7Dcw+gXZD82be1tJst2SHMaSe7GJYwZcXdv
X-Google-Smtp-Source: ABdhPJxDUF+6yXz1R8Wk1tdFriE0GwpRmUZR6xZYlCaVoRPNkkIQAIpiXoTyF2nusvadCIkSK6vTMg==
X-Received: by 2002:a05:620a:b02:: with SMTP id t2mr7474085qkg.128.1614913023192;
        Thu, 04 Mar 2021 18:57:03 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id p126sm876855qkf.110.2021.03.04.18.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 18:57:02 -0800 (PST)
Message-ID: <5b9de81ffc46b0faf4d9f9350efa4ecc1113cb82.camel@ndufresne.ca>
Subject: Re: Support for the Logitech Brio webcam?
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Greg Warnusz <gwarnusz@lectorprep.org>, linux-media@vger.kernel.org
Date:   Thu, 04 Mar 2021 21:57:01 -0500
In-Reply-To: <0db861b4ea8c69239ac0fd7955891ebe@lectorprep.org>
References: <2d32b42777e171ebcc77a74c9a09caba@lectorprep.org>
         <0db861b4ea8c69239ac0fd7955891ebe@lectorprep.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 03 mars 2021 à 15:26 -0600, Greg Warnusz a écrit :
> Dear open-sorcerers,
> 
> I run Ubuntu and would like to use the Logitech Brio. Most attractive is 
> its selectable 3 fields-of-view.
> 
> Here's the manufacturer's own blurb about its other abilities:
> 
> Brio is a remarkable piece of technology that streams crystal-clear 
> video with superb resolution, frame rate, color and detail, including 
> autofocus and 5x HD zoom. Brio delivers 4K Ultra HD video at 30 fps, HD 
> 1080p at either 30 or 60 fps, and HD 720p at 30, 60 or an ultra-smooth 
> 90 fps for outstanding clarity, smoothness, and detail.
> 
> More info: 
> https://www.logitech.com/en-us/products/webcams/brio-4k-hdr-webcam.960-001105.html?crid=34
> 
> At US$200, it's still popular, as evidenced by its sold-out status at 
> many vendors.
> 
> Is there a chance that developers smarter than I can make this work, 
> even with limited features, for Linux?

Not ure I understand, the Brio is a UVC camera. In fact, the one I've used works
out of the box. Of course, it works better over USB3.

> 
> Thank you.
> 
> Greg Warnusz
> Saint Louis, Missouri, USA
> 


