Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 882C277C50
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2019 00:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbfG0W1e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jul 2019 18:27:34 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34100 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbfG0W1e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jul 2019 18:27:34 -0400
Received: by mail-pf1-f193.google.com with SMTP id b13so26146510pfo.1
        for <linux-media@vger.kernel.org>; Sat, 27 Jul 2019 15:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:user-agent:mime-version;
        bh=q0ohRG8KPZZembNBbfR4oRg5U5hHqrJ4dMg+pIu5hds=;
        b=QlRnfauc+oZ/i+8GFU7nDsAXrzNTBTTPMoU1BebmnbbQ1du+lL55esGSsAD3IZJUzU
         V3KzrdVALtKb0VQTcMumjHvko3hfysWlz3qsnyJ/KqCPVuaxvVTJeic6qfaVmo/MYOEJ
         CnkgIvYDBS+miCCIFYX4yoUGejdKMNki9KL8+Z883gMu2IOW9494jQIElYxPwO+MWc82
         pyoKUBveGTBJyWU2+zUgeyW0PR0e6XYekNGMTwW5kpektN+TwARCg9LgyHETwAu1FzIx
         qkwswoJF9q5s2E4Sar/OpkIN0WHOKRP9dlHJppmvVzQ+4XKDCihLIz3C+iAe3O75a66p
         VH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:user-agent
         :mime-version;
        bh=q0ohRG8KPZZembNBbfR4oRg5U5hHqrJ4dMg+pIu5hds=;
        b=SMM9hdOGQiagf6ZjOt0RB+aWyPZ3yv2aMkVZg8pXYdNe5KCof2mnLJSWWVSdQ3j8eU
         sCEeCcBfENL1crIqDOHC97n1gqBvdakN6H007JPoScFx9REitT1xGXUcTKcYDCqSaSRw
         W0Cu7+K9UduXcuj9QQ0JTcSYVQbZOOmV6d3J+peG4TO1AAqfYVD6x8tUX13XfnDluORv
         Rf2wVAc8wwZDjnm4BQ0udZN76oDKz6SofvpMNNgQjUL9RNWM8tWWFVCNeBi7s9M0Om9M
         mCvCfQMwBFbKOK76Le3MujlUHxPjU5bMlJznlsN+UWpQz9tvqC6QQZRXu/KcUbTgiTop
         SpIg==
X-Gm-Message-State: APjAAAXOVQ+of0OHcA5+D5sj7kFdsE80gm9YOS9ZF62bXfsqAlYvnzQG
        WX2fMn//+f0JojGZPcZ3YVrk7/mbdTg=
X-Google-Smtp-Source: APXvYqyO3/bRJh+IczWt4EKrcpxJuIe5PzklevpLZSWruWinO69E16TnlPW+JMEL4ENEFcrlHed9oA==
X-Received: by 2002:a63:d555:: with SMTP id v21mr74897131pgi.179.1564266453575;
        Sat, 27 Jul 2019 15:27:33 -0700 (PDT)
Received: from mbalantz-desktop (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id 4sm67110493pfc.92.2019.07.27.15.27.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 27 Jul 2019 15:27:33 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@mbalantz-desktop>
Date:   Sat, 27 Jul 2019 15:27:32 -0700 (PDT)
To:     ezequiel@vanguardiasur.com.ar, hverkuil@xs4all.nl
cc:     linux-media@vger.kernel.org
Subject: Finally figured out how to include linux-media in prev msg, sorry
Message-ID: <alpine.DEB.2.21.1907271524340.17208@mbalantz-desktop>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

After going through trouble and half with trying to get the following 
correspondence through linux-media (...):

>
>Who' calling this ^ ?
>

Oops. Should it be video_device_release (not tw686x_video_device_release) 
and then should keep the line vdev->release = video_device_release? If 
that fixes the code and potential race condition, then our correspondence 
with Hans can move forward the possible patch?

The compiler complained about incompatible pointer assignment when I used 
vdev->release = tw686x_video_device_release in a notification email I was 
sent.

vger.kernel.org keeps flagging my messages as viruses and rejecting them. 
Apologies if there are any ensuing duplicates on your end, just want to 
make sure my messages are sent to you.

Further, I didn't have a clear concept of spin_lock_init when I asked 
whether it was intended or not. Apologies. Rectified.

Thanks,
Mark
