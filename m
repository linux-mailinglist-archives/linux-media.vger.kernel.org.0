Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 881321A3640
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 16:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbgDIOup (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 10:50:45 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44620 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbgDIOuo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 10:50:44 -0400
Received: by mail-lj1-f196.google.com with SMTP id z26so7632072ljz.11;
        Thu, 09 Apr 2020 07:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q4v9rUwodHK+n75mx+eCJ7ZwO8R88Mb5/tApAMFDSTo=;
        b=dmyAeQgYSO/YZrU6CKasyEg8GJab178Tx6rckPt9JWLNY9a4QkaZM+cqAiqM9s1djC
         DktV8Mn+KCvHzRA7EuCsF29x4HCJcZrTULzOwwfI0AOfwQZNUXuWPKn1KvHmGXhy+Pty
         iQRnOr+a5uZabgG+xV4bAgW/XrpFmeVNuNduBk/4u73QF9WfPdC38tgHAtS1EbuNlDBG
         57t//ZhHWTbnVyzm3wkVU3yRajomcKKsVbzQG3bkFPdb1jXLMspmn9QdN0/OEu+3vCcJ
         ZFtqMHMMwjlkRX1Mw5KHvKkEZp3xJLEfcRMuOuPPKglrPVAQoKgUe5+k9i0y/Em9DfLn
         d9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q4v9rUwodHK+n75mx+eCJ7ZwO8R88Mb5/tApAMFDSTo=;
        b=Uq7+0zNPMUsGYeFxcB84PMXjGou22ZMVFMi3jS3zG9Uu4ljpXyWI8zjbSZNb86t7av
         PGe7fRM+kfcIU5/RFz1uZiYmyD5RboYktthRuaLA/mCbV0IJmZgQneCHD4BEsbw1i16p
         g/EhH4pgCflD1BE4NuzE4DLrHXIMVCGBtg0kYnVCP3AkbdegELHqTOonDJ/oCN49VhTm
         wciUMQAXUIVLl97BdLkkYm0oZ78Bg2Wjn43YVWI+0hYptIktrnBMAFLTB1vidPyYROQH
         IjEvnwe7o5E6X8sj1eo4ctK21qYhK6JL83fa5w68mkUYUltXwArb8Lls1jknoCN06jvc
         1y6g==
X-Gm-Message-State: AGi0PuYz34ZOIP8/X8phJBQA/iqqEVhBHSsRR/tzsyt+tUfYKPWmd55u
        tdjYuiu+xS35Ug1QhrySsHGEPvsy
X-Google-Smtp-Source: APiQypL5/qfqfNmB6bTHUaHBUEIWQAm5mk79vdrTxi98rxkD5Iz0Zf3V24CkGUlbnftqYsE/h8tanA==
X-Received: by 2002:a2e:905a:: with SMTP id n26mr119665ljg.58.1586443840801;
        Thu, 09 Apr 2020 07:50:40 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id u7sm1243199lfg.20.2020.04.09.07.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 07:50:40 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <dd16c560-ba8f-e7df-5dc4-5227e0043196@nvidia.com>
 <fea4f0a1-4a20-34d4-9eda-e4a599eeeffc@nvidia.com>
 <760d071e-0cbc-b3eb-9231-fb9f9ecb44a6@nvidia.com>
 <9e317f65-8a02-3b15-cfec-8e0d8374130e@gmail.com>
 <97b35910-4c93-123a-43a0-eb14476ed0f3@nvidia.com>
 <84ad4e2d-6ac1-e1f4-1c55-5edaae850631@nvidia.com>
 <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
 <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
 <db7c7051-5674-cdb9-0aa4-ee94125b3024@gmail.com>
 <1a31cd60-739f-0660-1c45-31487d2f2128@nvidia.com>
 <603084a5-249a-4fe2-3646-e9335ef9ab43@nvidia.com>
 <7895b9c6-f27d-8939-73d7-67d785e1a8b7@nvidia.com>
 <ea60b489-990e-4b15-e215-d93381a1371e@nvidia.com>
 <b2405c2a-73c0-ad69-ccea-0388caf8045c@gmail.com>
 <15d8b525-67b5-b437-f7fd-89f80cd0d9f6@nvidia.com>
 <a638bb8e-bb50-7aa5-05a0-8de1c6207ba7@nvidia.com>
 <ced73258-6f4b-e970-4ca5-ecdf1808a4c3@nvidia.com>
 <ad646fde-2eed-eeeb-4d85-ec36d6613eb1@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7288cacd-badc-cb01-1f4c-286dd024ca10@gmail.com>
Date:   Thu, 9 Apr 2020 17:50:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ad646fde-2eed-eeeb-4d85-ec36d6613eb1@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

09.04.2020 06:38, Sowjanya Komatineni пишет:
...
> Tested with 3 buffers and by checking outstanding buffers in process by
> VI hw and holding to start capture till one outstanding buffer in
> process by HW.
> Also tested with 2 buffers without checking for outstanding buffers.
> 
> In both cases, I see same %CPU for the kthreads and is < 1%
> 

I don't see where buffers queue max limit is set to 3 in the code, but
should be okay if CPU isn't getting hogged. Looking forward to v7.
