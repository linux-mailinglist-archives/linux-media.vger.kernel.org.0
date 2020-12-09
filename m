Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB562D46BC
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 17:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732007AbgLIQ1E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 11:27:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgLIQ07 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 11:26:59 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4775C0613CF
        for <linux-media@vger.kernel.org>; Wed,  9 Dec 2020 08:26:18 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id c7so1767047qke.1
        for <linux-media@vger.kernel.org>; Wed, 09 Dec 2020 08:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XVLc98DQhJ2RhbASrdU6TG64quTbCFDjmnDbLTKlXEE=;
        b=Tf9KA6ipZBSJgX24h84XB+4RNZheHbQPZb3mOEVXURIjOXpfowMWLUjlzJK0fA9ZLn
         Lq/i5ayekJQ1eB6oMKmgVwfQLSnojuylZ1OOcBJP4/CDbci6cl+H78JTcyUL2bkiZFWL
         Y37WCjiX5x0iyU1NCaUuDfGnfJQSYADidbK3CfqKMTRqCFx3vjqf3u2xFgZLSPzxpHgz
         CPI073e8N6ZYhI/736yva0STVHbpi1D1XUcazga11xCMOc0VOm/pbdLaxfAct1cgAgRF
         By1HJRD/ITNo6MN8F6wT9UrGOiOtMvDFjxAMFzFHMldnjZM5jVi/xdaTU7i6YB6zDFUU
         QVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XVLc98DQhJ2RhbASrdU6TG64quTbCFDjmnDbLTKlXEE=;
        b=TbzGSnRQ5Imc34XYHhWpOn2ZCmoWKMXiE3N/4OUsT7GobOc+o7SSFjFMIdwKRw4mr9
         kOPOCuQh5+qTP5TmoNE96Ml4Qm1QIiH5G5I8VSbGrjR1hIY06XYKplbpicXlUHHDzZDz
         e3kMar0IN1fguhzJEUnp3Ni+3iAJyz19aiwoBZC0QoyvFmcfPX7dZSPmCw1e+EmWvGoy
         ec4L3ZawF7U4EkGN1dDOxdNfKX54lAOxlXeRkcbfpK8FydGLiQa+KdDpG7Cd2XeoO1bd
         d1xi5eKSrLJgYFJLZaqkmDPr87CTp/jLSZrNrHO1D1dbBMhSLfS3mKWOmm4CQxtK20T7
         glGg==
X-Gm-Message-State: AOAM533095MXbXrEy7rO+A2YrD6IL0OIpZeJMLS6tNL7OwfDk9EUrPKq
        H0ejBS1wrvyRqo5iPttBeVB5Qg==
X-Google-Smtp-Source: ABdhPJxSyFhoU2fvGQKQJopHB7uDlQGxcsED1qIyqr8YpEZt5RtKlyGxatBUUc763OhToNWkSJ7leA==
X-Received: by 2002:a37:6403:: with SMTP id y3mr3866061qkb.204.1607531178014;
        Wed, 09 Dec 2020 08:26:18 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id 9sm1342198qka.118.2020.12.09.08.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 08:26:17 -0800 (PST)
Message-ID: <3d8e7798dfe3ed96526b17fc0451862430f5a735.camel@ndufresne.ca>
Subject: Re: Changing encoding properties
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Fritz Koenig <frkoenig@google.com>, linux-media@vger.kernel.org
Date:   Wed, 09 Dec 2020 11:26:15 -0500
In-Reply-To: <CAMfZQbyxZPENgRans0KS5sHTLCj1dXRMcE8ewyksoSNesaa+vA@mail.gmail.com>
References: <CAMfZQbyxZPENgRans0KS5sHTLCj1dXRMcE8ewyksoSNesaa+vA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 30 novembre 2020 à 11:10 -0800, Fritz Koenig a écrit :
> When can bitrate, etc., be changed by VIDIOC_TRY_EXT_CTRLS?  Any time
> during encode?  Only before VIDIOC_STREAMON?
> 
> My understanding is that VIDIOC_STREAMON should start actually
> processing frames, everything before then is configuration.  If
> something needs to be adjusted then VIDIOC_STREAMOFF should be called,
> changes made, and then VIDIOC_STREAMON again.  Is this correct?

Bitrate is paticular is expected to be changeable at runtime (in STREAMON
state). But a firmware may not support it, hence a driver is allowed to return
EBUSY (iirc).

Changing the bitrate without producing a new keyframe (whath cycling
STREAMOFF/ON would cause) is a highly common use case while encoding for live
streaming.

This of course should be documented.

> 
> I didn't see anything in the documentation about this.
> 
> Thanks.
> 
> -Fritz


