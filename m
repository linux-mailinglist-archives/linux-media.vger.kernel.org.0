Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA3A1B8DE5
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 10:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgDZI1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 04:27:43 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8346 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbgDZI1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 04:27:43 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea545870000>; Sun, 26 Apr 2020 01:25:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 26 Apr 2020 01:27:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 26 Apr 2020 01:27:42 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 08:27:42 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 08:27:41 +0000
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <sakari.ailus@iki.fi>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <6ca93ff9-ca59-544f-767c-4355d01a5c20@gmail.com>
 <62546d1f-eca5-06be-2bc2-e45ccd53830a@xs4all.nl>
 <50fd1016-ca8b-ec5d-e5a8-f257138b152e@gmail.com>
 <658c4232-94d9-3051-8c93-bff7046cf5f2@nvidia.com>
 <03426915-25ea-69b4-bc64-f87f3046d33f@nvidia.com>
 <aabaecc4-3494-0137-7d2b-853304bfa68b@gmail.com>
 <09f20441-fec6-7496-2edc-c69db535e441@nvidia.com>
 <61799fab-858c-8b0d-ba7d-846cd041e044@gmail.com>
 <7dfca778-e402-3a6f-617c-dd8448187a13@gmail.com>
 <be48a991-3047-6ee3-8d6f-85979752d86f@nvidia.com>
 <edad2953-ff4c-7c3c-4550-a3638a714c65@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <78bc2a89-d570-34b0-87b5-78d161d11315@nvidia.com>
Date:   Sun, 26 Apr 2020 01:27:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <edad2953-ff4c-7c3c-4550-a3638a714c65@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587889543; bh=O2FyQJa75n11NYmNXq86zgUw7lxEjvNtxEQBNjA/0lY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=MliPMSo4xAXa8zc2m33os5Uq1L4i8Z8tS4H16pEd06ERovvXtkFvKDS8RiW10QhAv
         uk3Qk/Ty0PShwKoMzndRJdHuiWUfycxUoQzBAIZEJeQGrH7fmV9qEPI+opfZGnAo/j
         FASAT+jETw/phnUt+e2UV8bYXpaBqo+jczsuCb0pD0kpaDbK62pXYH66/UWXpseNv3
         xr26SBJpbxkfwpGh2/ryi+juSUU8sIAp8l1l2TOsNKkXaAlkqJjwxZftqL2VWNo83x
         Y/4QLpOdaS9hjMdd0Xuy8uE83WUONAlUEDAx229wjO0lPw5Caqis51nqdfol71BSVv
         i524P9A5u03Cg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/25/20 10:51 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 26.04.2020 07:47, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> So, probably what we have regarding structure is ok except video formats
>> I will move to Tegra210 and change defines to use Tegra210 prefix.
> If those defines aren't reusable by T186, then you could move them all
> to t210.c.

ok, will combine defines and soc specific programming into tegra210.c

Also will then get rid of common.h with video formats moving to tegra210

