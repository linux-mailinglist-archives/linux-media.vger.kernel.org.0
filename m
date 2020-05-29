Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25AD1E7269
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 04:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404686AbgE2CHM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 22:07:12 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6594 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404550AbgE2CHL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 22:07:11 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ed06df30001>; Thu, 28 May 2020 19:05:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 28 May 2020 19:07:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 28 May 2020 19:07:10 -0700
Received: from [10.2.169.153] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 May
 2020 02:07:10 +0000
To:     <luca@lucaceresoli.net>, <hverkuil-cisco@xs4all.nl>,
        Frank Chen <frankc@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        <linux-media@vger.kernel.org>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: IMX274 driver
Message-ID: <4184f80b-eab3-c512-dd99-d24c7af4b45c@nvidia.com>
Date:   Thu, 28 May 2020 19:07:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1590717939; bh=lpJT1iTKWt101oukUYdPYwX6xoLFF46HudSV0GRZ1SE=;
        h=X-PGP-Universal:To:From:Subject:Message-ID:Date:User-Agent:
         MIME-Version:X-Originating-IP:X-ClientProxiedBy:Content-Type:
         Content-Transfer-Encoding:Content-Language;
        b=PoUa1PoAc17+iCQ6dxciUXWmHpLL5u/EiH4hQmhjQJtkWO4iWRH3a99VrjVK7t38H
         N/AvRs2Gq0qqlPp5DX9RQ9jUJbFoHu8xD7WkJC1ZZqa677ysTQ9ih5M/ZAozPCnz+Q
         rwRLUwGRW431gjv5w5tL4H/a63GQSOzW19d+1jBgaMpZIddBOWTVaTGy+Jj+QHnJ+t
         MkS7PLnqo95/mO3JMCUYHXrvSZdpMuLhevwr5ruSmqnLCC19YmMTGRecaYIZlvJJUD
         xLEjKBUKoOuIo/ggmeOHxZ3mX+83PawdYYGoxjBKL06fjknwO4+IpQQ1o1uhHv8gMZ
         W8sN2T9E2Cmsw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Luca,

Quick question regarding IMX274 driver that was up streamed by you.

Upstream IMX274 driver programs Y_OUT_SIZE correctly based on IMX274=20
datasheet and register mode table for Y_OUT_SIZE where it includes 6=20
ignored area of effective pixels + 8 effective margin for color=20
processing pixels.

So, Y_OUT_SIZE register value =3D height + 14

But somehow with this we are not seeing full frame on CSI.

In our internal NVIDIA IMX274 driver, we are programming Y_OUT_SIZE to=20
exact height=C2=A0 Y_OUT_SIZE =3D height

So for debug, followed the same and updated upstream IMX274 driver to=20
program Y_OUT_SIZE =3D crop.height locally and I see all resolutions=20
working fine with this.

Checking with Sony on whats causing sensor not to send full frame when=20
Y_OUT_SIZE is set to height + 14.

But thought to check with you in parallel if there are any known issues=20
related to this with IMX274 driver.

Appreciate your response.

Thanks & Regards,

Sowjanya


