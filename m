Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CDF23DC6A
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 18:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729601AbgHFQvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 12:51:46 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4118 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729247AbgHFQvM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:51:12 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2c34cd0000>; Thu, 06 Aug 2020 09:50:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Aug 2020 09:51:11 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Aug 2020 09:51:11 -0700
Received: from [10.2.172.190] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Aug
 2020 16:51:10 +0000
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <20200805134600.GA3351349@ulmo>
 <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
 <dcd58ae7-58ed-11d1-0e10-7f522b651b30@gmail.com>
 <addb92e5-7c7a-6fba-117d-c7880b2d4597@nvidia.com>
 <ed80bf2f-213f-286a-59b2-fc85e4181b3d@gmail.com>
 <6eede805-80fd-016f-22f8-b6d25f6587af@nvidia.com>
 <1c12e40e-de7f-0599-a941-82760b4c7668@gmail.com>
 <9ef0b875-e826-43e2-207e-168d2081ff6a@nvidia.com>
 <4689cfe9-e7c4-48bf-217f-3a31b59b8bda@nvidia.com>
 <0e78c5ca-c529-1e98-891d-30351c9aae81@gmail.com>
 <b2098a68-d02f-b406-fc57-56e3ff5d8d1a@nvidia.com>
 <309e3b66-9288-91ef-71b4-be73eacbbd62@nvidia.com>
 <fde2431a-0585-ac32-ac25-73e198aaa948@nvidia.com>
 <4025a458-fa78-924d-c84f-166f82df0f8e@gmail.com>
 <4f15d655-3d62-cf9f-82da-eae379d60fa6@nvidia.com>
 <b5612e93-f1c4-4762-baa1-5d85eb1edbe1@gmail.com>
 <412f8c53-1aca-db31-99a1-a0ecb2081ca5@nvidia.com>
 <04413bc8-8d89-7e57-9b34-84bb11ecb008@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <60c38774-05d6-2825-bec5-be5eee9c3dea@nvidia.com>
Date:   Thu, 6 Aug 2020 09:51:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <04413bc8-8d89-7e57-9b34-84bb11ecb008@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596732621; bh=jxf5qoZrAj9URSn6k3q12ygKmhPO93pb1oZSR7YNgBo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=hrgQXlLLYX1tvXU8WgTmMPKkkvgfHIokcrsmyF8UCj8N7IqaVdLjRkkRioRUtXJux
         sSNwTWH7LztC6mnqUD8Fat+LduSpL3aqNxkXOr46Dko8VcGbxjqD1zn0KSUzGhqi2c
         GBv8/tlcV1RgGHDHHUF+FLgCQNpYb7zDd2WkpUdO6mBniDYv8ebEOXucSYKXs7WQnd
         08rbyM3lRaPjiDLhpPShPJFuSDU2ar2VORlC49HVtxMB/SdhdsYyPTCzHYRqBrv1Ly
         jhLjLhtN6TjVlYCoLRVReDcAYWdjluOGU6rBktjLIIN1+nzqVCBJa7ntJ7ld9n5SkT
         T10ygZjDKiA8w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/6/20 9:45 AM, Dmitry Osipenko wrote:
> 06.08.2020 19:41, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>> What about to add 72us delay to the end of start_calibration() in order
>>> to ensure that FSM is finished before LP-11?
>> Why we should add 72uS in start_calibration() when can use same
>> finish_calibration() for both pass/fail cases?
>>
>> Only timing loose we see is in case of failure we still wait for 250ms
>> and as this is failing case I hope should be ok.
>>
> You said that calibration settings are applied to pads on LP-11, but if
> LP-11 happens before FSM is finished, then what values will be applied
> if any?

No calibration logic will check for LP-11 only after finishing=20
calibration sequence codes.

After that if it sees LP-11, it will apply results to pads and DONE bit=20
will then be set to 1 indication pad results update.

Unfortunately like I said we don't have status indication for=20
calibrating finished before waiting for LP-11.

ACTIVE bit is common for all PADS. If multiple 6 streams are happening=20
in parallel, ACTIVE will be 1 as long as its calibrating any of the pads=20
and its not for individual pads.

