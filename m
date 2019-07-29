Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD7A78B30
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 13:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387789AbfG2L6e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 07:58:34 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45474 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387637AbfG2L6e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 07:58:34 -0400
Received: by mail-lf1-f65.google.com with SMTP id u10so3089862lfm.12
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 04:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=CiZtcoF2OB9oki5yMbRahP13kzUX7U4aEIpmg6Y5C/Q=;
        b=UVfXFC700WQZaD2PZBTnOlwKZSNUTFTuvE/gauhjP0mSGFdm24m0zHR5izncvoag/1
         249qY+JpZjvtKrIegWIM6nn/3PVPUC1uwTyMqRfWhFiR6GoE9d8uXFHq3jy8hly4sxFA
         GJnNxVDIjGxpVKVKQGX5sTv5aoAyfJkgSkF8oKaaRDUX/t4viVh9TDwSDVPCnWy3wws6
         DgHKyhfxy4u99aOw4DxbaxaJuSsKP3MWJmcK5JeP/5Tbwi8k4kpGHkoyXa04UDqegSCC
         2ZWWjFV2An11204EKsrJckh0EAx8fg0V2to35/rXDQBizfY3nHmzh7KqX3bknM/s72Fu
         WMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=CiZtcoF2OB9oki5yMbRahP13kzUX7U4aEIpmg6Y5C/Q=;
        b=QVXRsa2F8S4f9TkalAzxJmYRUyJnOPHMSlz8WzmfhRh75iO+9ffqGYou1belMP+N41
         iwqDJIdI5jjaX8SIX0TU4nbSUjRgCKoFBsa2AbH5LEmhwxXhdJle8M7rl7VjS5c0gSki
         Vcuw+zt7hbyQbhr1rMj/jEcZIE1HDlASUV++9IboYxZBkV5TV3UqU3OHdcpt/7pEuCvK
         tWE7y3KHEgT2/aLtxPFxX2sHKY6hieq4jswn9gJClHz7stgmKNnweqRMqX7q4QgpfGot
         oS9wmDbofvKjogJ5QFW0Fs18g+ZbP/Ml8utT7GFG8XvYWcJyGKQVMDz+SDvrTIHcMLTD
         A6lw==
X-Gm-Message-State: APjAAAUzfLN3VQb4KKF17BOzWznW88aI4uN07SukbEM35jbmsa4cowLr
        eQBnzVk1cFPLO6ECiWNnAvqK8+ilFHFkD4ZroSk=
X-Google-Smtp-Source: APXvYqzPjmskjrEPOifFbrkU/H9hkSwQPGYW5gpWEWV3tXF4dvfSYBrLtBexXuknz4druU8c/cYBHpXPQOa+gtXzJts=
X-Received: by 2002:a19:8c56:: with SMTP id i22mr51446969lfj.105.1564401511935;
 Mon, 29 Jul 2019 04:58:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac2:4186:0:0:0:0:0 with HTTP; Mon, 29 Jul 2019 04:58:31
 -0700 (PDT)
In-Reply-To: <54473f8a-2164-6350-5721-9347ec3630ad@xs4all.nl>
References: <CAEsFdVMFa3qY5TdUTPqQ4=_cCx6ePzMOw31FLC+erR7_39hgFw@mail.gmail.com>
 <54473f8a-2164-6350-5721-9347ec3630ad@xs4all.nl>
From:   Vincent McIntyre <vincent.mcintyre@gmail.com>
Date:   Mon, 29 Jul 2019 21:58:31 +1000
Message-ID: <CAEsFdVOXVozQnmF9UJRgPB4brJtywvTmPiLh7DY9RViSXyoEMw@mail.gmail.com>
Subject: Re: build failures on ubuntu 16.04 (4.15.0.55.76)
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/29/19, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> On 7/29/19 10:54 AM, Vincent McIntyre wrote:
>> Hi,
>>
>> I am getting build failures in v4l2-fwnode.c. I'm sending this because
>> the daily build logs
>> are not showing any errors for this kernel (version below).
>>
>> I've tried flushing the git checkout and rerunning but I still get the
>> failures.
>> I can send a fuller log off-list if you like.
>
> I just pushed a fix to the media_build git repo. Hopefully this will
> fix the issue.
>
> The cause was that I had CONFIG_OF defined in my tests, and you almost
> certainly do not. So I never saw this failure.

Awesome - the build completes fine now. Thank you for the quick fix.
Regards
Vince
