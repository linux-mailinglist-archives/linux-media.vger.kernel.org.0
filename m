Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95506468655
	for <lists+linux-media@lfdr.de>; Sat,  4 Dec 2021 17:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355365AbhLDQuz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Dec 2021 11:50:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234749AbhLDQuy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Dec 2021 11:50:54 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A6DC061751
        for <linux-media@vger.kernel.org>; Sat,  4 Dec 2021 08:47:29 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id k23so12446544lje.1
        for <linux-media@vger.kernel.org>; Sat, 04 Dec 2021 08:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=DK5LS1cdW9EPSiWepbC2OMZvwpULgseVCohPSb3AJ5A=;
        b=dqIoBIFtNfl7jWD9EAFi/DqHX22oLa00jBV347Rr6NvRYejVvAwgvUKXztm3VNYIvp
         yHBOkBd7rIctlVejathxN2fE/yOKG0Z33DRgIf4LyZPhoB2tSR1ipIEP1FnzE653wGxg
         3mDSLQGKLeCgXKZcFoJbqrR1jQ5XllDSATBZIpEFqqi/qIfiso4yT89cunbRvofRhiZv
         QVfrAtoTSS39gR42kn9U7WEZ9gH+fPynfxN5Uvyfcp/O39Jvt1JNNhnevnutftpnnLvi
         C2xFQCD0vIqq5+Bp7n47BaLeJ+IZN3Xy1YkDcViBkSYwtXPC1C8XqiCz9WusXdvh5iSI
         oGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=DK5LS1cdW9EPSiWepbC2OMZvwpULgseVCohPSb3AJ5A=;
        b=3JCF/+tP5z9q9Eg1/BnzZU1FTKdxw9FzEA6NX99Na3q4g/vGWzYEGFfbOAIEg9OO4D
         p0RpPyRsgch1ESd2qalGQI/GGUWI8Wzyue5gP7EwQwfvWS/XGaWlgmNHk5PTUcJAdnXo
         blloSmnClQAmCkq1qbttBnR0KXFkH9Y1AYM0XYfE0CpeDt2VjRgnJ12Jjrn4yy9vlPzs
         qdNN+3v5XMIj4Klml34pd2uCFmSokgZc7odp/xk5UPRbTT/D4oOofk7kebqGNlU6tDVo
         kqqt+LGU7e5sm9UkaGked7coBhGgWcPt4qDmQbFKBHgjKA51b8e1z+IlPlzI9ZKK/A02
         jzGg==
X-Gm-Message-State: AOAM531cOgoalogfT0IvPZCU4olXqYoeeXvjVddSOzWLyeHn9Cj/uRtd
        1h8QnCUkJ3gS+MXQZK3B3sBaWCGz5p0=
X-Google-Smtp-Source: ABdhPJxHzgTs2Jf+f+4l6uNX157HXo2HmzLScDvryAxxSfuBPkLmJM3ufLMOqTgGbA4k0rlvX8EGzA==
X-Received: by 2002:a05:651c:237:: with SMTP id z23mr25781877ljn.108.1638636447374;
        Sat, 04 Dec 2021 08:47:27 -0800 (PST)
Received: from karol.home.prv (188.146.98.135.nat.umts.dynamic.t-mobile.pl. [188.146.98.135])
        by smtp.gmail.com with ESMTPSA id k43sm812697lfv.177.2021.12.04.08.47.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Dec 2021 08:47:27 -0800 (PST)
To:     linux-media@vger.kernel.org
From:   =?UTF-8?B?S2Fyb2wgxZp3aXRvxYRza2k=?= <bgueas@gmail.com>
Subject:  ID 1871:01b0
Message-ID: <bc992ad5-bafb-c1dc-93ac-7e7ec6d39ff7@gmail.com>
Date:   Sat, 4 Dec 2021 17:47:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, this device is not on the list.

it is USB microscop,

Bus 001 Device 031: ID 1871:01b0 Aveo Technology Corp. AVEO Cheetah3 
USB2.0 Device

can I count on support with drivers. Thank you and best regards.

Karol
