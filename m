Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 630031A1626
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 21:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgDGTm1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 15:42:27 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12898 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgDGTm1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 15:42:27 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8cd73c0001>; Tue, 07 Apr 2020 12:40:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Apr 2020 12:42:26 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Apr 2020 12:42:26 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr
 2020 19:42:26 +0000
Received: from [10.2.171.175] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr 2020
 19:42:25 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <430efa4e-5435-7e2a-fe07-c3a0d0dc967e@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <4e076538-fe8a-7dae-e82c-663288e78b79@nvidia.com>
Date:   Tue, 7 Apr 2020 12:42:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <430efa4e-5435-7e2a-fe07-c3a0d0dc967e@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586288444; bh=gwStW42iTjtYuWG2APVBmVs9+lmbI/E4j67xiFEJvKc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=TBxmEao1mD+DfVVt4FCqB9Idyfsci+Oe1byYlOSXQDBEtdOTYofw2EiBYrwnCc6E1
         9XJeTWWGLmYz9+L1DVH8ZqGsLdmIu9qqdogAcAhmo2WWx97KvWAXGtMMiym5rJ46xT
         1AKL9M59t5o0X5tFLbC9/ECwf4R0GXB55IYHVssUbe4gXxJkfiqzy2l7TM6cjIDJtz
         jl93iUOJWR19gzIA6tcvisKwuk/+ZUmihr42egj3+kuBg54L1/wsQf9aHDUmfLULL4
         f3+72gcPpYH2WGfRdPKDIPxyKC1GDbALtDubUbiQyD2LGGhXJz4bZw3FOxIMSEpefa
         SEhOSo91YOLug==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/7/20 12:39 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +static const struct dev_pm_ops tegra_vi_pm_ops =3D {
>> +     SET_RUNTIME_PM_OPS(vi_runtime_suspend, vi_runtime_resume, NULL)
>> +};
> Aren't the suspend/resume ops needed?
Complete driver suspend/resume will be implemented later after next=20
series of sensor support
