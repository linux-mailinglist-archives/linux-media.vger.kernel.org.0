Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6641DCC7E
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 13:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbgEUL7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 07:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729002AbgEUL7F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 07:59:05 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB18C061A0E
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 04:59:05 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g9so6467066edw.10
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=/0cSOqQOtATxbOaNPAOcfsLwxJ0O4gpdXivQ0WydxDQ=;
        b=gM9beF8q53GmO58wKHizsfjZmg9Odme6gdeor0lzQRw6rDgtzYQRL+J4PU6txydjlK
         hrrXZkRdXTH97VDhRC/UYelCuX9RpdTGg5/BD5G2h5JxaGYWt7+qPtocwHiZXAbuBq5b
         /P2gYfTs2cPB4a+rqQIm3n/i967eWgQ/Kbf3wBagipBACzelQUZCpAxkzLN2ho1uXjYD
         Lm/n7TY5+pYh7Plx3b2X+9kI1fTAgxnBe1XPSbicxklvLej9YdWDEPEm24m+egbRhtWA
         nv0T8abDTALGIg7xgvwRm8aWMjbX7vByRl0NxNwE7ycpj+vp9MCEzlQxTxs7EmR83n7F
         WSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=/0cSOqQOtATxbOaNPAOcfsLwxJ0O4gpdXivQ0WydxDQ=;
        b=k4MAMnhYCWCkpjEhu70mk+2ozmU5SXD/NWZ+tXt50QoRb8XFmWuiU4kSc5YqgyvTI0
         tIiXiEpHwxNVWSIYgi2BGiNS3CkkYhYeaiWYsqSuEnh+yUZw9m/O5edQgaI28RJ+RU7Y
         liiicFJyrQ3/HSyIANi7WL5CKgYNTKTZyQ7QjHlNit/0QWdFzcVLbzrP2jFq7BFq7ufP
         4MBf9l5daHiO0nRBJAxUGve3AIthNUnqNiHroVRvfdlvFpm+Wjf0PRpS0dCUt3S6XGus
         sfxk3ZMw4n5FaTHd8rmHJIua9b/SyNCU8sTU+VsNRywNL9fPETRwSAQL7+sLo7St/Dc0
         hgdg==
X-Gm-Message-State: AOAM530ycMkihHHowVAPPUuKCFhfOtFG2asEi2dYIWQrXMNxk46YodYA
        eZeKO6aOrg2sQ7N8iBOOHio3ob/+
X-Google-Smtp-Source: ABdhPJzGi1zt/Njf93LI0+aFxidQjT1I8zbt7v32jXQD8Fhoq4RKcT3D9ULWEwCPiABrlLzVdn2wwA==
X-Received: by 2002:aa7:d312:: with SMTP id p18mr4674124edq.88.1590062344106;
        Thu, 21 May 2020 04:59:04 -0700 (PDT)
Received: from ?IPv6:2a02:810a:8300:1c48:e13e:e99:f3a2:acc4? ([2a02:810a:8300:1c48:e13e:e99:f3a2:acc4])
        by smtp.gmail.com with ESMTPSA id m2sm4740746ejb.33.2020.05.21.04.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 04:59:03 -0700 (PDT)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
From:   Gregor Jasny <gjasny@googlemail.com>
Subject: v4l-utils: how to solve troff warning: "cannot adjust line"
Message-ID: <aafd4840-a7c5-558f-7bf9-fe56c95e7bb8@googlemail.com>
Date:   Thu, 21 May 2020 13:59:02 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

while packaging v4l-utils 1.20 I noticed the lintian warning about the 
cec-ctl.1 manpage. It is easily reproduced by calling:

LC_ALL=en_US.UTF-8 MANROFFSEQ='' MANWIDTH=80 man --warnings -E UTF-8 -l 
-Tutf8 -Z cec-ctl.1 >/dev/null
troff: <standard input>:264: warning [p 5, 0.5i, div 'an-div', 0.2i]: 
cannot adjust line

It is caused by this overlong command-line options line:
https://git.linuxtv.org/v4l-utils.git/tree/utils/cec-ctl/cec-ctl.1.in?id=ae8dd398baf927bc5bc18abd1677a5c4e118034e#n264

Does anyone have an idea how to fix this error (while staying 
syntactivally correct)? I tried adding zero-width break points with \: 
but the warning did not vanish.

Thanks,
Gregor
