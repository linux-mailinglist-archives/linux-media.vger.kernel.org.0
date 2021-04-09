Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E2835A5FE
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 20:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234478AbhDISov (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 14:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbhDISov (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 14:44:51 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE159C061762;
        Fri,  9 Apr 2021 11:44:37 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id s11so4825024pfm.1;
        Fri, 09 Apr 2021 11:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=/jVQn4FxU4fxpi2T0y4eI85ApJK3DaVIVyJkZkXHH7M=;
        b=kWyeTpw99ycAvjxWhma3rw6GSVDwt9hQ+v7XDhhFgtY8JOeS/Mn/Mewk4QfQMhMNnI
         5dPlWaCOurOQ6J0ZhFlDB0uDF2goJ8f83VJEgUCEVy9xe3BiqVYYqAVIcTUyzBGOIfzX
         bf6c/V/SruMtrp4ARjZp6Ecd0CXQF6FZG6C6SuxYPtdYHnjVvri60Px+A42g2EfQp8pN
         G2Cc8H6CalMg9XOB2mEwr29jHtwlFJqXRi5rH7xduu6f6g9jnMlvx462AR//KfwRCqXq
         lb7XvuktdHfGtMBoF18mEwVPw2ezvKx1E2qrvkmV1b45HgDD8zKTl+5p08l5T+z/i7Ns
         hGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=/jVQn4FxU4fxpi2T0y4eI85ApJK3DaVIVyJkZkXHH7M=;
        b=cBdjXxxh9/D1fZ4hUXcS+LaY45rZJhr/9y8SLfFjRDOTLUfTAHGIIAfMQN/r2aX6Rn
         GfAa3JKiUqbXvWstpXosHHlf1Y8Oqi2M7kRPBXzoMFJ7BjUrcLFwX172OCxj4T897jw8
         f6yrniY4FJYcY0IcGrHr9pMH1LJ4VNQ4a/Qv7mwutEZfPUIsCi0osCZrEpgekyqjQse3
         keS07ZBhIo0nZJ6r2+g1+WzazUnOLt0xv4SKY/lvgnziWZ0Qz7YZlWQF+5x4fRvB9mBx
         SkJBkoxIDvd5Z3X93vW40sLFHtGRS20cwoQNJN0MfOdVSA03rgGUpEt+c22mJEcRd92T
         MRNg==
X-Gm-Message-State: AOAM531/TRtcDNq6SVpgiyeXAGwYSgAxAwjfVlXpcusGFBnylcKZXJ2+
        307Wx8Nju/MXwbst//pHEl4=
X-Google-Smtp-Source: ABdhPJzedWEpfZvZQo56PxoXHLPSx/DmYDNPMfEO+n/1MowbJZP1UxvcdvsCDDVoN3OZeM6LDUHErQ==
X-Received: by 2002:a63:cf55:: with SMTP id b21mr15395836pgj.126.1617993877325;
        Fri, 09 Apr 2021 11:44:37 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id t205sm3263243pgb.37.2021.04.09.11.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:44:36 -0700 (PDT)
Date:   Sat, 10 Apr 2021 00:14:28 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v2 0/2] staging: media: zoran: aligned the code and block
 comment changes
Message-ID: <YHCgjJ1rSxlVxGGh@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes the cleanup style issues.

Changes from v1:- 
In [PATCH v2 1/2]:- No changes made/required.
In [PATCH v2 2/2]:- Aligned the code using tabs and spaces and
readjusted comment line.

Mitali Borkar (2):
media: zoran: add spaces around '<<'
staging: media: zoran: remove and add comments; align code

drivers/staging/media/zoran/zr36057.h | 293 ++++++++++++++------------
 1 file changed, 162 insertions(+), 131 deletions(-)

