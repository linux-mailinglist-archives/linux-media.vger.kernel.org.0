Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFC72DE53E
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 16:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgLRO7v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 09:59:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgLRO7u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 09:59:50 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 424E5C0617A7
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 06:59:10 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 23so6091345lfg.10
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 06:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=iR7mh/Etq7pIqGZ4JvtPE/kUhlcgpEh8KVHQRZmBh6I=;
        b=sWa4QEkc9wskgdZDAzJr3+aEbyThDxGDG46C+P5W8Nb027OIkXcHte6N02WreGNP2Q
         heC33+5jGK8s0L4LCcDB4QuXc1uKVKS1xwxYJJk6OyJ4PKZ6vMcJR0OgclV4WDBi83Vz
         zRK196FSili/I8p1U83KXhv/WUw8opPcchokSZINeUBh//Jso1XzySDrnMa3BNmmBmWw
         uPbeA+uVpQOuyDcQbl2aLDpJ2vjEljVNADNpGmCQyPNDDcaiJSWfIZjERjABHxyuoLUf
         hE+vCDuGvC1Fvsc2aKhqrY4JMLjz/T3q4VTVk8KG0Eeolvh3dlEzt9Udg/+HsOQdmwYU
         r+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=iR7mh/Etq7pIqGZ4JvtPE/kUhlcgpEh8KVHQRZmBh6I=;
        b=e6Z6GnVgiCrQTfvm3/hKXDW9f3tsn3I5i/d/4iPpWHjpMxI+BrBfHROWRdmjI/awfX
         54DeUm6rInyTgL1onXA85prrEkY8hTrAS+tc0vNLvX01r0Pkvh8EzwrBELfn2pRtVlGf
         u2re4p6XxUlaK5zpldKY03lcwFEoVacZIyFbUBQmhCg1DuJY8khjvg0OkPA2LCA24RCL
         MMXxWt9DTHt8zDG0UX5m+BFPhP0rSCKIipqXl4JDNw5Qm2Fw3FrVvQg022Wx7L4UsL4M
         KPs02teWoa2/JoZ0OBlriyuE5vlReE44MCaJ79KH+Xo8fmupp5BXHdTLsk42m9Xo8KVi
         81dg==
X-Gm-Message-State: AOAM5329C+bGrHjVGQG4P+kbsWA60VYoZwZmU1FU1CQA+3wp+TbuV1yB
        0DxVeJTEum+nlnbzWpxku9m7PweOPkbbZKTPIg9ADMHEw+AMlw==
X-Google-Smtp-Source: ABdhPJwPNjPQcKFpm8o7cofvPdp6Ry1Y8uLwRqfSmF1o2EUZx39vVtvklkw9/A9KVrl75qyaGLFyijhrnPp5UGRC7LM=
X-Received: by 2002:a2e:6c0f:: with SMTP id h15mr2117092ljc.305.1608303548559;
 Fri, 18 Dec 2020 06:59:08 -0800 (PST)
MIME-Version: 1.0
References: <CABJpdbjMNKKw55KjJH-61Dg4L1vAa1_J91tfkL_iFt6PGDboBA@mail.gmail.com>
In-Reply-To: <CABJpdbjMNKKw55KjJH-61Dg4L1vAa1_J91tfkL_iFt6PGDboBA@mail.gmail.com>
From:   Andrew Reed <nefarious.aurifier@gmail.com>
Date:   Fri, 18 Dec 2020 09:58:57 -0500
Message-ID: <CABJpdbhO=-icjEshgEeO3rid3dv8dPMsAq+S=zu1fsrQkxfi0A@mail.gmail.com>
Subject: Fwd: Working UVC device
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good morning!

I want to report a working UVC device not listed under Supported
Devices <http://www.ideasonboard.org/uvc/#devices>.

046d:08e4 Logitech, Inc. C505e HD Webcam

Thank you!
-Drew
