Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23A14797FC
	for <lists+linux-media@lfdr.de>; Sat, 18 Dec 2021 02:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhLRBJ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 20:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhLRBJ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 20:09:58 -0500
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050::465:102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE42C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Dec 2021 17:09:57 -0800 (PST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:105:465:1:4:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4JG7736qH3zQk3V;
        Sat, 18 Dec 2021 02:09:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elbmurf.de; s=MBO0001;
        t=1639789790;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=nCWVrM3gVdLOvIu4KIRoGk+PSvXGsGkKC7lqJrVq+T0=;
        b=O266jj7/e6YF2E3hWkRBY5yfpRLEXxsGirYlxm/5uxMQy4j2JSoWzNeD2NgsX37WHcbwRw
        eiiQFlnYmH7RFll8bFvUaH3IWRpf2/CdOp/uFE9nhWyBFJjlu88TRpP4cme2mjn37NQm37
        Ag7w6volCHgh9BQQTtd70JG6AeU7ZmrrYN9Q2ah4NZ/mkf/7HV7/WD4o43uN/8cBxFXveV
        /4qjef/V96eKpBxTILhkaGEtvItKIMFf0FUb7K0/PbcFZ0UjKQBNg9QZ+k0FfysnfPM8eY
        LHhI5Ha6p9CLJMkP4FzD1EB0M+MNPviysS5JcehiYIXjBVykmU6rIq+57byrNg==
Message-ID: <6a72a37b-e972-187d-0322-16336e12bdc5@elbmurf.de>
Date:   Sat, 18 Dec 2021 02:09:46 +0100
MIME-Version: 1.0
Content-Language: en-US-large
From:   =?UTF-8?Q?Maximilian_B=c3=b6hm?= <maximilian.boehm@elbmurf.de>
To:     paskripkin@gmail.com, hverkuil-cisco@xs4all.nl,
        mchehab+huawei@kernel.org, sashal@kernel.org,
        linux-media@vger.kernel.org
Subject: Kernel hangs after DVB patch from July 2021 with Hauppauge WinTV
 dualHD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Paul and the other people involved,

I’m a user of a Hauppauge WinTV dualHD DVB-T2 USB card and experiencing a bug since Linux 5.15.3 of which kernel bisecting brought me to a commit by you from Juli 29: "media: em28xx: add missing em28xx_close_extension".
My problem: This TV stick doesn’t work for me after a wake up from a system standby, so I have to use the little helper tool usbreset to reset its USB connection. But if I try this after Linux 5.15.3, I get a severe kernel error in dmesg, system hangs and I’m unable to proper reboot or shutdown. I have reported this on the kernel Bugzilla, including a dmesg log: https://bugzilla.kernel.org/show_bug.cgi?id=215241

I hope you have an idea about how to stop this problem from occurring and I‘m willing to help testing a fix.
Another thinkable fix would be to directly fix this TV stick’s standby-wake-up problem but I’m not savvy enough to determine if this would be the better option than to fix this hanging issue.

Best regards

Maximilian Böhm

