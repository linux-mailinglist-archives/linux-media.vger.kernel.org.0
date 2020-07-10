Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D8921B837
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 16:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgGJOSr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 10:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgGJOSq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 10:18:46 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65ABC08C5CE
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 07:18:46 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id q198so5352769qka.2
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=Ecwp4qeE5AwW/CIS7eF6biTzcUuNGn4IxHz8o2Cn+8g=;
        b=ART99o990F4DLuj/67fKjkWmOG0L3NvfKepr4bmgXvov8eInQTVa38Y8b5ZmZDoEUu
         9uSLm4O6E0+tObPqBYW1HOXGQImC3vuYUATZ3YWeC9SgLmsCyKtZJeeHfY0yPCsEkNJ7
         h/Dd74M5V0Hj2B4H8xVqhPGtFfdZgXxa+B1RS4aiR6QYvLIaxeo5l1/dgkbTMSfUPAqG
         V5fhUPhBu5K2QbhaAgXJKTmeUdEOaWAQ9nvLaIkBrFm9G6et6zopPV9F1RvvfOVAuaD8
         tbDQgSEBlSWNviFmPeMTMqZL4Y237NLRafsct3shRYOM3VM6faL1/707Q/MjKYPUfEvN
         ia0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=Ecwp4qeE5AwW/CIS7eF6biTzcUuNGn4IxHz8o2Cn+8g=;
        b=rVkOxNrrOv+gS0fQMtk5MpD/yt1UDleYNYPOwL71PwpnAYU4bYQZRncPOX0uDSv2eg
         NM+ui3aaDXchqhIYTeJshGEc13kJGySvXYpq223ouIm0Pf//DewwGhTT282fTCm+UfQH
         THCYNgDtuus6zocXsCAXJqVUIMeGCTrpssIjKSSzSx7EV0b3JNqlfTYajSvMF6dHXm+w
         TH0BPa8gQhJ1ifwHDhzCd0BuHibmd/a5FJjlI5I8ltwkB7tXPC7OlkAup1+1SF3vpi2E
         6z+zQgt1Ac5mMTtFg2VLUNPARB9G0NPwW8fWENdRvzWa8j5U9e6YUqk4MBVnbAZIO5j9
         +WeQ==
X-Gm-Message-State: AOAM530/G+Qx2r8MCIe3jEwhLGQoPiIFkvtJLuP2r1dd+0gvnH97A0Bt
        tx01+1WZblqoojNFlZcwD+1nzA4GQt0=
X-Google-Smtp-Source: ABdhPJzmUMWLFik/M2uan1ric0EV5eV5mILFhD+7JgxRwake/cqW7TOUe7otHJnu6KKEgUcUM2Eugw==
X-Received: by 2002:a37:88d:: with SMTP id 135mr71047731qki.390.1594390725808;
        Fri, 10 Jul 2020 07:18:45 -0700 (PDT)
Received: from [10.0.0.101] ([177.86.199.79])
        by smtp.gmail.com with ESMTPSA id i10sm9613788qkn.126.2020.07.10.07.18.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 07:18:45 -0700 (PDT)
To:     linux-media@vger.kernel.org
From:   Lucas <lucasavdantas1992@gmail.com>
Subject: Range values for V4L2_CID_* commands
Message-ID: <ab88a3cf-bc05-d43b-dfe2-5f9e78422132@gmail.com>
Date:   Fri, 10 Jul 2020 11:18:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, how do I obtain the accepted range of values for each V4L2_CID 
command? Take V4L2_CID_BRIGHTNESS as an example, how do I know what is 
the maximum and minimum values accepted for it? I have tried to use 
'v4l2_ioctl(fd, VIDIOC_G_CTRL, &query);' thinking that would be stored 
in the maximum and minimum members for the struct v4l2_queryctrl but 
that does not appear to be the case as the values for those members are 
always zero.

Thank you.

