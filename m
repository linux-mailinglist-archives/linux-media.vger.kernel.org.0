Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79CB01A39CF
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 20:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgDIS2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 14:28:18 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9757 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgDIS2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 14:28:18 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8f690c0000>; Thu, 09 Apr 2020 11:27:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 09 Apr 2020 11:28:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 09 Apr 2020 11:28:18 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Apr
 2020 18:28:17 +0000
Received: from [10.2.171.241] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Apr 2020
 18:28:16 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
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
 <7288cacd-badc-cb01-1f4c-286dd024ca10@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <77c88717-618f-b366-2b6a-f8b4abaa66cc@nvidia.com>
Date:   Thu, 9 Apr 2020 11:28:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7288cacd-badc-cb01-1f4c-286dd024ca10@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586456844; bh=J/aG9q8CC/oWgBUBz0DhAt3fXvAn/5D8wg8H/6egt/k=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=YPzLgxQABUqO8OPEPQuriGTYqhWKxRFVQrPN++BwMsEhM6J9i6K8noQnvD0TY2Knu
         RiBq8AfHissKuS2udec8T94gBVNUEIdF49dfKr0zhbfzVMgl+IgneaUjB6vIlJqvow
         qK8v9s3lxrmlKiTI9Ow6XuZsKHp6Ig4oSqJJCnziLNupWfqC/z3kUSbkdKRPLlIDNO
         h/vRsMsyimqOCe6d1PfptFD6mGbK3Z174Gwhdgp3Fdwy2I4ZxkXFgkEgzO57j1hE+g
         kqtVlEcahsvxGcs8vH+QZvais40AOL7k/7vszJlqJ4A1IxGLDp9UXAY+qMWoNJvvOM
         vX53TCKI0iRcg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/9/20 7:50 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 09.04.2020 06:38, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> Tested with 3 buffers and by checking outstanding buffers in process by
>> VI hw and holding to start capture till one outstanding buffer in
>> process by HW.
>> Also tested with 2 buffers without checking for outstanding buffers.
>>
>> In both cases, I see same %CPU for the kthreads and is < 1%
>>
> I don't see where buffers queue max limit is set to 3 in the code, but
> should be okay if CPU isn't getting hogged. Looking forward to v7.
Sorry, correction I meant to say pre-queued buffers before streaming not=20
num_buffers.
vb2 queue min_buffers_needed was set to 3 as part of one of the issue=20
debug in earlier version which actually was irrelevant to that issue and=20
should have been removed. Will remove min_buffers_needed in v7.

I added checking for outstanding requests by hardware just to be safer=20
although we may not hit this case of issuing more than 1 outstanding=20
frame capture to VI hardware as capture_frame() waits till it sees frame=20
start event through HW syncpt increment before proceeding for memory=20
write and issuing next frame capture.

So issuing frame captures are synchronized with frame start and frame end.

Will remove min_buffers_needed and also explicit check for outstanding=20
buffers in v7.


