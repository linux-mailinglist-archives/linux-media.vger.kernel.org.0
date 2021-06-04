Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181EC39C1FB
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 23:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhFDVLw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 17:11:52 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:44857 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhFDVLv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 17:11:51 -0400
Received: by mail-lj1-f169.google.com with SMTP id d2so9107842ljj.11;
        Fri, 04 Jun 2021 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WiwJSnK8PAuXp6pcKKltkr6PRSG0LzCFtrc76AFzj68=;
        b=eG8RnPY+xeDru0TP5q+WVf6uhm62b8h8I1A+AwNbV5hqdvQWqFCwQfCnzaxVfRu6LU
         5H+jVL2jcqCPPoT/LuvH+a/3xHlVBUZcz9BSrZrNUz3kQwEasOWbbb/coW5W499eUyBB
         1ENPahXXQktjC1zMvCyxVqo2LjWFYoD/W++L3c/UnW6kKGFFIMm7+pseNEXLr9HfiLHp
         cNCioI/06W13YOBwSZWJaURp8k9pFHru5+E++RD1yc/84ONaki5IivHCOJ6aaXmZpsqU
         7SMFMpfcz9Sqx8WPDw9WzoYcel9POtiMcx7ZdGrItJNt6+j3f8liN2c4POi62qmh1/cW
         eWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WiwJSnK8PAuXp6pcKKltkr6PRSG0LzCFtrc76AFzj68=;
        b=ecnDcwrk85ATLi+vd85ylF+G0aCen9phRthDYaMjfbyj7N6LgjWL9qcrqblh0KaKt6
         E6eJ/hIAgHRQH8sDoT2MR6Q189GBhDJReJcWHy9KDb2PxNx7MCV7dEwDd2iFwRswA2Ze
         7DUPyjeTP8HoZbulrmUE/zMD0G2PTOim2s/uLEQ92mtYijXfPQq+Dcqn2fSR63MwA+tS
         InYwd+j1TLz6bvhhoj7JrxNWZcrLiVhxdP6Jdfqw+e1xMKgu9mK2v5CSKTWAswnMdy/6
         qjXupaE18sOXW6BSuGO12QsTQZ2uTEvJJPFUosnMnbaOYfJVz3X8thNquHCBMiYsNYwX
         X7RA==
X-Gm-Message-State: AOAM530Kon7RiDuImp3V8P0lDlx+qYzRcZ7QN32zeEBJ7NBfiWVCoBkx
        3VfK9K4241Ey9x9wCuRPftAhUSe/tNU71tmFmPo=
X-Google-Smtp-Source: ABdhPJz7wailIeZEAfKipyeKwSLAY1Kn0N0M0v1HC4kNLSbn00blAQZfJO9o0oqS5sGU0rOyOkmvUkehOCOmAMmhqT0=
X-Received: by 2002:a05:651c:1193:: with SMTP id w19mr4772104ljo.264.1622840943184;
 Fri, 04 Jun 2021 14:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210527173209.3874124-1-festevam@gmail.com> <20210604205430.GA3895085@robh.at.kernel.org>
In-Reply-To: <20210604205430.GA3895085@robh.at.kernel.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 4 Jun 2021 18:08:50 -0300
Message-ID: <CAOMZO5Cj+g6yS-3cctdt0Qp-3y59QWtObMt9ssbeBwZf=fUYSQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: adv7180: Introduce adv,adv7182-force-bt656-4
To:     Rob Herring <robh@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Matthew Michilot <matthew.michilot@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Fri, Jun 4, 2021 at 5:54 PM Rob Herring <robh@kernel.org> wrote:

> I'm confused by the part numbers. 7182 or 7280? In any case, I'd just
> drop the part number from the property name.

Yes, dropping the part number from the property name is less confusing.

Will do as suggested in v2.

Thanks
