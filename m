Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78B75680DFC
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 13:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236676AbjA3MpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 07:45:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236669AbjA3MpH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 07:45:07 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E60B29438
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 04:45:05 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id fi26so10802463edb.7
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 04:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w/76GHi3uabgdMqnuRmCOkjZvY4HmreuXUaN6Z0z71Y=;
        b=WS+lFW/5B7cDx05UswfbfNwvGYommhBASCx1jq33NGTpkK6q0ueJVc7BL3hibyEqGI
         KNExuiOAE8jkIKRJlOnhJbPzNVt3EMcX0YyClIPYbn/W03abWnxjInqLVLpCcsh02yUt
         N+yT11kuBfzvkLP3LYAk0nBcbznpTG9fsBVfFLMOzdQQB4hNSZJq0Y8s/uyEadrfuGEt
         0wLt305mqqtwHDQq04mW28MeUlriWRgk2KiDOdwFGhMzFb3DPVBu8GRUvYCeKJhBO0xt
         PfjqrKgJP9YfURRFNdqrL/dla+UNS4bjq4aQAB386+2sayg1BXsFWt2XHxhdB1JHO6CE
         WBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/76GHi3uabgdMqnuRmCOkjZvY4HmreuXUaN6Z0z71Y=;
        b=eeMqYra1CGLHbgdbLdjWypjjSfowNs9By242T5Se8UEl0p8vGoM+e8IQwDiFdsKuZI
         nldlgvC0t4QWXepsy4XblFnmuuuJLSrm0srEyI2jyFnodRXZIe7DevnLGqB2cT9BQAS+
         ZyCJFaxXaV2T26mR1IDwzkcRknijqOMBHM8gtDVfFzfM9/j76UNlFdpZJhdxKP/rpIP2
         tsngCrFCGWFnwnUlitKBxYYzTQ4Gx5gAiWE8PQH9CE2JhoNgHY4r+aCKz9BBvTW61GyO
         YvYaruNgc/fs6kxX3tUB5D/kAvzrLXjATWtNVkNCPgqmIEuri6ntqO+ZiVgvwUQqpF47
         byUg==
X-Gm-Message-State: AFqh2krWzF6gE0czUOMr1CY2ZzpGAL3QeJx2LDxCTkYymaGZti8MfM9M
        GfhP1RlpS0xtckfoMYq0LjSN+ZXCRR/yN6XTjUYHzw==
X-Google-Smtp-Source: AMrXdXuff3GG5Imu2lLyrhogifSr2Z6cgADUrGqTAq9wg46FDZC5x6huR96P/m42GrLmBRGQWJwtBMOo1zJ7uzH2+jI=
X-Received: by 2002:a05:6402:e9a:b0:497:382a:6a7 with SMTP id
 h26-20020a0564020e9a00b00497382a06a7mr8497219eda.9.1675082704061; Mon, 30 Jan
 2023 04:45:04 -0800 (PST)
MIME-Version: 1.0
References: <CAFyCYyNyfrwG6bVB-u+0ZQXg7HpVkvbaLQk6RRZFctPdn24k-w@mail.gmail.com>
 <8ffc56ec-b008-9bf5-5dcd-4fc89ffe0d82@xs4all.nl>
In-Reply-To: <8ffc56ec-b008-9bf5-5dcd-4fc89ffe0d82@xs4all.nl>
Reply-To: jc@kynesim.co.uk
From:   John Cox <jc@kynesim.co.uk>
Date:   Mon, 30 Jan 2023 12:44:52 +0000
Message-ID: <CAFyCYyO6caMBsMb4wYi0rf-rpfSZhou2prab18yGyVXvqDrpYA@mail.gmail.com>
Subject: Re: How to check if a profile/level is supported by V4L2 stateful decode?
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Nicolas <nicolas.dufresne@collabora.com>,
        Dave <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 30 Jan 2023 at 12:35, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 30/01/2023 13:23, John Cox wrote:
> > Hi
> >
> > How should I check whether or not a given profile and level is
> > supported by a stateful decoder? Chrome uses VIDIOC_QUERYMENU to test
> > whether a given profile is supported by, say,
> > V4L2_CID_MPEG_VIDEO_H264_PROFILE. Is this "correct"? Certainly a few
> > decoders seem to support this usage (qcom/venus, mediatek and possibly
> > some others).
> >
> > The documentation currently suggests that
> > V4L2_CID_MPEG_VIDEO_H264_PROFILE is only an encoder control. Should
> > the documentation be extended to cover decoder use too?
>
> I think the documentation is out of date.
>
> For decoders this control definitely makes sense, but only as a READONLY
> control. After all you can't set it.
I think I saw a decoder that allowed setting using it to produce
sensible default sizes for the coded OUTPUT buffers so it is not
completely pointless.

> Ideally it would also report which profile the currently decoding stream
> uses, but I don't know if that is always possible.
It certainly is not possible in all cases (rpi stateful firmware
doesn't report it).

Many thanks for the swift response

John Cox
