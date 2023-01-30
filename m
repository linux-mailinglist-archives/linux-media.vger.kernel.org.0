Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB9F5680D8B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 13:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236674AbjA3MYH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 07:24:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjA3MYG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 07:24:06 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C11CE1E2A0
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 04:24:05 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id v10so10747112edi.8
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 04:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adB6QFgg0MDd4S+1emwif0whdBS3zm9aqmkGzEq7K6w=;
        b=URd65TVPiIYxKJl0z/RGUvbRMCHdvHyRgjavr6QnR1fVdG19uXmWyTNyAHNmDyNLGy
         XlUXvBSaornrXRqehoFZOMPTuLdq4mC/5YlC/tkLHHRbeXEkLx7vJtfEflnUx+I7VFix
         I/5HqhSyKZ0X/tLq9g8AcTTNA+w285YHJfqtHYGvU5zglvEXCdkrkmgSO4axodtY++6B
         qg/WMPkWhLy3Ue73q/+5BGr0DuZhcQV6PsQqYiYGS/8dqPlIqiGs3i3lGodqaEFwa69k
         qTht5D2csgLiE/DnyC2wzw6rhSDgtisv9DilHtn6wGsHwOKlST/KZy+hhDju/jTHiCxf
         scoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adB6QFgg0MDd4S+1emwif0whdBS3zm9aqmkGzEq7K6w=;
        b=Szb5LQzvIEu9sWKF5XT2yMuUPV+ykTxeA3stN199jzFVwH3ket9sPlnU4Lx1DyepPC
         j2NsdwNZSZ2CgoyFyPuexbYCI2kL4kBN70uu15lOMW7+xr+kOrIklzAqo7kZqp88Rdgx
         37dYLwRZwvPqT4cKR4eljS7xIlZLujYIxSCqV/YX/HU3Za0QRDUvXW1abyfIHXTEwCDa
         xAtnnw+nX5rdaXTRIoICUMrMLKfMIx9CxwBBilCy1bYersxqWIfun1Z7a8Car8gK0gqP
         1mIsBuJYgbJYRBmqKVbmPrd4dLTDg2j5iDfzVkrNs5wACtINZr+RTBnmVdl/uHUoGjE9
         OBPA==
X-Gm-Message-State: AO0yUKVO27EFjv/FfXf0kFOdlRDFh0D8UmZiqEo0dD8M25yKJQnybnOn
        +ZllXHKjse7Br8HH3ujhWmiKuscaC7SszmQhEUnuVg==
X-Google-Smtp-Source: AK7set/0wdaK7wNr85UV1f4FdwTfB1GgZuCSsmhcKE0UDocD5tMCk9sydJR2N+NU+eGT37Oh2IQpL0b4/nSNTVq55Bo=
X-Received: by 2002:aa7:c399:0:b0:4a2:58f5:ddef with SMTP id
 k25-20020aa7c399000000b004a258f5ddefmr363298edq.0.1675081444338; Mon, 30 Jan
 2023 04:24:04 -0800 (PST)
MIME-Version: 1.0
Reply-To: jc@kynesim.co.uk
From:   John Cox <jc@kynesim.co.uk>
Date:   Mon, 30 Jan 2023 12:23:52 +0000
Message-ID: <CAFyCYyNyfrwG6bVB-u+0ZQXg7HpVkvbaLQk6RRZFctPdn24k-w@mail.gmail.com>
Subject: How to check if a profile/level is supported by V4L2 stateful decode?
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Nicolas <nicolas.dufresne@collabora.com>
Cc:     Dave <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

How should I check whether or not a given profile and level is
supported by a stateful decoder? Chrome uses VIDIOC_QUERYMENU to test
whether a given profile is supported by, say,
V4L2_CID_MPEG_VIDEO_H264_PROFILE. Is this "correct"? Certainly a few
decoders seem to support this usage (qcom/venus, mediatek and possibly
some others).

The documentation currently suggests that
V4L2_CID_MPEG_VIDEO_H264_PROFILE is only an encoder control. Should
the documentation be extended to cover decoder use too?

Many thanks

John Cox
