Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03E226C280
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 23:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727361AbfGQVWn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 17:22:43 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:45471 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbfGQVWm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 17:22:42 -0400
Received: by mail-wr1-f42.google.com with SMTP id f9so26305458wre.12
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2019 14:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uyoNNdJhQMlz23HC8O9cWicyt52zoMB4P2QhBV8/ryA=;
        b=pcKKrv1Hj/6StuBqG89DS0UlmbqiYf5Mq3VFovK3l5Elb8vqmGgja4ToYgnKBp5d4X
         YkN+tstFJVLL9nryyEClLJGoDgkm4aqLSoRnFDvRl3lAPToLt8KBcNLX/mj/K7QbdK/e
         Rwt2GXwk7ADGu5K/BTOYpGP/BtKvr0tGwRY8qNd8xaxAdZFj2PZjOv9zM2jZm/CDaVI0
         3PoDPwhKL+ohCPOu2+k07usk52nQOgHgdE4y58biXj/qVq5F/EGMDpKhtMKKfBjRKad/
         CXhwwZ1m15sjxw1Jwcv9e1QQt928w3WM0snGfOmim+IktzPWQ8pI2NUBR15yWm1EeDLB
         xrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=uyoNNdJhQMlz23HC8O9cWicyt52zoMB4P2QhBV8/ryA=;
        b=jQfR6x4uk7Kki+UYdRhYHn4fVv+wgq9lEjkf+3XulCqHQ/167yP/FxV2pcD60rwXPd
         Vaj+nNmFLR+tY7FNoZOgoKkPReSnrBhtTRpDZ78SKmdkcrF5Faiujc9FPALrGz2+7uRR
         vAJs3b822zM+QJ63V7fnMD9GnC6Hiqn6R+legOMFfvxTo6f0lHB0SO/r50JiOuRhzID7
         4ocQQTSie71jhmpPNxeChq0GGKM4MBvFt7Iln1kMYUEE/iPNhaXsbiqnrXnbPMnEWFV6
         Sgkjj8ZU5JYtitf2/iCZMbKO6d5uWRP1Ketpi9XVpRP4e5OGy3jlBBeCLNlStilVpHYF
         3y+g==
X-Gm-Message-State: APjAAAVdzxvTCMxzlXYgOUxvP+GYTD4Pwu87AheA2v41tHFBqM654dOU
        yJWVUqGtdXm7A7tTbfTMxEGiLuQzkA0=
X-Google-Smtp-Source: APXvYqwh0W9Xu6WdRt+c3jvoGEtG246bCJDGE1irS0hsjjKs+tsD3OJpOcq1N2uzA2ndaJeSX0+TIw==
X-Received: by 2002:adf:db0b:: with SMTP id s11mr44780539wri.7.1563398560302;
        Wed, 17 Jul 2019 14:22:40 -0700 (PDT)
Received: from localhost (p200300E55F2F960000000000000001A1.dip0.t-ipconnect.de. [2003:e5:5f2f:9600::1a1])
        by smtp.googlemail.com with ESMTPSA id z1sm27361087wrp.51.2019.07.17.14.22.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 14:22:39 -0700 (PDT)
Date:   Wed, 17 Jul 2019 23:22:38 +0200
From:   Thomas Hollstegge <thomas.hollstegge@gmail.com>
To:     linux-media@vger.kernel.org, crazycat69@narod.ru,
        mchehab@s-opensource.com,
        James Hutchinson <jahutchinson99@googlemail.com>
Cc:     JP <jp@jpvw.nl>
Subject: Re: MyGica T230 dvb-t2 data corruption since commit 5fa8815
Message-ID: <20190717212238.GA7654@googlemail.com>
Mail-Followup-To: linux-media@vger.kernel.org, crazycat69@narod.ru,
        mchehab@s-opensource.com,
        James Hutchinson <jahutchinson99@googlemail.com>, JP <jp@jpvw.nl>
References: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi James,

I have both sticks (v1 and v2) and can confirm your observations. I
also pinned the problem down to the commit you specified. I am running
on a kernel with that commit reverted for some months now and didn't
observe any problems so far.

The easiest way to reproduce this issue was to force a complete
network scan in tvheadend. With that commit applied, the scan always
failed after ~50% of all muxes were scanned. And it was not just about
some continuity errors, but a complete loss of signal that could only
be resolved by rebooting.

After reverting the commit, everything runs fine.

Best regards
Thomas
