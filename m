Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0811133DC1
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 10:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgAHJB7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 04:01:59 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35647 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgAHJB7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 04:01:59 -0500
Received: by mail-qt1-f193.google.com with SMTP id e12so2215353qto.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2020 01:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=WHSYiEZw5wlSC7tUwmcTwZpPtavvDB2Fab3d3t9x1NE=;
        b=OPOpuuPRQW4jTCBDS2skbSJYwdnxsh7R1ASm6+2ERzVa2g1BauUlMddybPbFUl/RV/
         FaL9PoBhjG0B+vWi9/8QfWxIPJFl0R8VLwTyG3EVn99BAN8aBnTf3RQ2ufA+HcL3+Gsi
         OMfyzZVZ6o/5OfRDeaTE7xiMwYYeZRi+oqz6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=WHSYiEZw5wlSC7tUwmcTwZpPtavvDB2Fab3d3t9x1NE=;
        b=n/mS4P3mcV2/PBH2Ug/B9ZAWlAAdgqd8bOBOUiPO2W+cXjerLUzykM5gRiOe6h//e6
         CJVSFYPgphCoyycwJytL3BdezZd/UuOj0xqxrTLh5ENyDUrGxe2kW0hXfUzd3jZRlzez
         1HqK13+mHQQmOsWthCJRBVfzHMGL8SklfzwZTnK42qPbyVfI2r2CGxNhvZtBmQq/SWwt
         OPwqE4DSWGHywGzsGDtqQ9MisyxBLvBj571eYwWBSbqQ6GHi+ndPQ8pl/b+FQZw9E9r/
         0Bo5JbsAJVCNDVhDk64CqEQAeuLtc+MlNf1Bnk6S/GrMHtBwbf+I3lk7EMbdmRyE65HB
         lHEQ==
X-Gm-Message-State: APjAAAUNWOwon4supCNO91bvx2DeNVsEoL7FMjmk5NffKtxKKuAGbn5a
        0wVtQfJrhY15JFIV7eVJ1MgL/JKrcre74kWYko06uQ==
X-Google-Smtp-Source: APXvYqyBRzVeZYL41+XIKfp/Un2raJtMLZFvgW5CdRGhgYmtwbPbqLeuphryWP5P28vmQPxTxDDUC09sPeeUH1PKQXA=
X-Received: by 2002:ac8:65ce:: with SMTP id t14mr2684487qto.72.1578474118231;
 Wed, 08 Jan 2020 01:01:58 -0800 (PST)
MIME-Version: 1.0
From:   David Stevens <stevensd@chromium.org>
Date:   Wed, 8 Jan 2020 18:01:47 +0900
Message-ID: <CAD=HUj5AsJSw0rP8YVa2jmK-aK6R3=OyppwcRh5aJw_i=eP-SQ@mail.gmail.com>
Subject: [virtio-dev][RFC PATCH v1 0/2] Cross-device resource sharing
To:     virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This RFC comes from the recent discussion on buffer sharing [1],
specifically about the need to share resources between different
virtio devices. For a concrete use case, this can be used to share
virtio-gpu allocated buffers with the recently proposed virtio video
device [2], without the need to memcpy decoded frames through the
guest.

[1] https://markmail.org/thread/jeh5xjjxvylyrbur
[2] https://markmail.org/thread/yb25fim2dqfuktgf
