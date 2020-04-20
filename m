Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2ED61B08B5
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 14:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgDTMFM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 08:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725944AbgDTMFM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 08:05:12 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05226C061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 05:05:12 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id u16so2449826wmc.5
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 05:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=lEAZNLmOpNDatDnPb18ODtlhe5NbV82BP0MRpnz2blc=;
        b=KPg0zJNJGbpZZkDPTnUeN2jPrp9qqmBOGWmsdCCKloQ2a+x62Hw+PEKdTv++CyAcYT
         QdsIoJTg7lQ04ujaC/QvSEuSyLMq+vjvrWDtdRwx+8V+WBC90dXTZ7JEt0vS4deC/ofM
         Rsm/2OBFPJVJPYFoLnfsa/9JN6DyBcPaWJniiU0TT/mIteNMlmChVXcTkBJ/ddKeu1uB
         F179GBuLzJP2fT9tLA3SHIj2VPn07N2VZGoVNFzuDt+Mm1g3+uFJzPZZPg2NqMGk583K
         qo54msicXMp3RGbz/J54RrTUlQCPKiTJ5tYhlECkGBUaeQ/ByskiLN81HIuD9w/UMxXS
         tn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=lEAZNLmOpNDatDnPb18ODtlhe5NbV82BP0MRpnz2blc=;
        b=ZkolhcvFbH5AVtcgtHeqx1OBzvmNvncwYOiC9utKf3KOj9/iM8ppCi0bHVQo5yhs0+
         21AJMkL9Mc19eqgNffpxMU/E7eS1636pJy24S3QHhMb8VL0ZdCxlIQ4Aw27UT+d0rgRF
         W+cNw/tTB0JUwIgPlMG2FBC8+mcYFsKtFViUu09igc/WeUhTLCqEtZbU3ErlrNxTeuBL
         RoNgQEOrtllO/+mmc7ctc8kdwmhr/TLoqsPjctpT7TJ5fNrnTGkn2QsCEqvBUY738zLm
         GwnWCEPE4LBVGpRrgNw4UvLSepC/p28/WPhvThi/spqsE+b7Ws8DH+RXHGGXB6TSr6Cv
         yFqg==
X-Gm-Message-State: AGi0PuYMyOUVc7B8SIXw11VHDMEMCpf6Lp+lJkDL2vWsA9TnPKfjpzIP
        KB4a8Is2OenZ/WalhyH6uPjSsyH5
X-Google-Smtp-Source: APiQypJRdXPKAASrtSuRAU14Gdy4DYZ4HmejOkGRqMrkOK1aGq1SrwtDVy3NeXOXBng6Jt2di0LxZg==
X-Received: by 2002:a7b:c213:: with SMTP id x19mr17135910wmi.53.1587384310243;
        Mon, 20 Apr 2020 05:05:10 -0700 (PDT)
Received: from ?IPv6:2a02:810a:8300:1c48:eda6:62b:69ce:d1f? ([2a02:810a:8300:1c48:eda6:62b:69ce:d1f])
        by smtp.gmail.com with ESMTPSA id x18sm995132wrv.12.2020.04.20.05.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 05:05:09 -0700 (PDT)
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sean Young <sean@mess.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Gregor Jasny <gjasny@googlemail.com>
Subject: How about a v4l-utils-1.20 release?
Message-ID: <818465d4-3665-5af0-0136-2090edbb4eb1@googlemail.com>
Date:   Mon, 20 Apr 2020 14:05:07 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

It's been a while since we released v4l-utils 1.18. How about a 1.20 
release?

Do you have anything that should go in before?

Thanks,
Greor
