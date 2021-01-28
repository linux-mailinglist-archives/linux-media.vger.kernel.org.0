Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142443080B3
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 22:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbhA1Vpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 16:45:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbhA1Vpn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 16:45:43 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A961C061574
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 13:45:03 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id l23so5250547qtq.13
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 13:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=YF/RNO7zGlHoKw6cNshOeKvgZXKcZcRT+nuonWaulxQ=;
        b=YQlU58LX+xrKw4gUmc79anLRoX7ZQhB+MS0rUAnvEi7X3wHRQFaeo1XTCugjBtd3J6
         XN+IUshoQDbKzVmWTiB3/oIyTQJqDPoXfjosg53chxrAG5MjaL8Y+KnG3K+YSuDmRC5d
         4bkKVQtr/0VDshIjflcRD70e3qQObVj35aJ7ld3dUoBuWAMBQGBwSTbnMFhN5xufLL7J
         PhSjXvx0ZntdkHt7TDhYLuwD1PpK7H6J/myQS0mehj4eO+3VIGEAI+sNkdBpwrjz/J8/
         GN3bopQSENhjmHvab+cjUYVf78t81hB8lV2/0y/M/K2oYu4slGghjs0ft9myS4ypAp1q
         KTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YF/RNO7zGlHoKw6cNshOeKvgZXKcZcRT+nuonWaulxQ=;
        b=alfBrfTiq59LkC0Dm2S9oet1LaV53wJVQC/OflDiHfDfLeF5WhKmezF96ab/VJN6ic
         9SOjuxXr4VaPr9BHd46GrqF0gKy3xzxt0FYTB7UjGpE7fSPpL/ZxHVN7gYQ6r+6znG7j
         gUEcgkMACc/a7XwydtPeJs+BG2FSZPFwDXkkeouDwzfJcqN7JpUmvpcsHFFY17dhIY1a
         M+cFKsq0DnYuuBPPafeQ5/6Yell5BJZg0KFf/6uIsJITy1Yi8B9lzrTl7y5rRYCv5f9j
         m7WkKWg8oSEHgLVhcPq9Ro1coCoaQHWyefs6bNiygElYC72LsklWQr6c7TKuhma4HrLd
         p8VA==
X-Gm-Message-State: AOAM533D4FOgTQqWshPIvL4+HDp5l8EbbirSnVlj7eE0ILs4SgcXbaeE
        WdzVp0Bj6ABYziKaVLSDHvFtJbf1O6sUCpca
X-Google-Smtp-Source: ABdhPJyG8MQmZRJtMunfL69yBxKTm9COOyM0GORNiuw/+FmiPkmyBgilUqbYycpSMtW83DOhneNF1w==
X-Received: by 2002:ac8:5bc2:: with SMTP id b2mr1642343qtb.98.1611870302273;
        Thu, 28 Jan 2021 13:45:02 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id y68sm4317890qkb.132.2021.01.28.13.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 13:45:01 -0800 (PST)
Message-ID: <350a927bafbc6cf3e690db6f33bebbdafeb96d6d.camel@ndufresne.ca>
Subject: Re: V4L2 logging for multiple streams
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Fritz Koenig <frkoenig@google.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Thu, 28 Jan 2021 16:44:59 -0500
In-Reply-To: <CAMfZQbzay0+tyYvZmF_L=iYfp+F02iz3qz=a=J1Yuf55P=RebA@mail.gmail.com>
References: <CAMfZQbzay0+tyYvZmF_L=iYfp+F02iz3qz=a=J1Yuf55P=RebA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 15 janvier 2021 à 20:33 -0800, Fritz Koenig a écrit :
> Hi,
> 
> I'm trying to sort some issues with regards to decoding multiple
> streams at once.  Logging can be helpful with messages like this:
> 
> [105188.500450] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
> 
> but when I have:
> 
> [105188.498697] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
> [105188.498715] video2: VIDIOC_STREAMOFF: type=vid-cap-mplane
> [105188.499116] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=0x5, id=0x0, flags=0x0
> [105188.500450] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
> [105188.500467] video2: VIDIOC_STREAMOFF: type=vid-cap-mplane
> [105188.500611] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=0x5, id=0x0, flags=0x0
> [105188.501879] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=0x5, id=0x0, flags=0x0
> [105188.502276] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
> [105188.502331] video2: VIDIOC_STREAMOFF: type=vid-cap-mplane
> 
> I can't tell which stream VIDIOC_STREAMOFF is associated with.  Is
> there a logging option that I'm missing that would help indicate which
> stream that ioctl is associated with.

I suppose this is m2m driver ? I think it would be nice to trace some instance
ID, otherwise indeed, if you have two stream on the same m2m device node, the
traces get confused.

> 
> Thanks.
> 
> -Fritz


