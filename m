Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA79B23CF71
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 21:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728867AbgHETUn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 15:20:43 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:4528 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729002AbgHERrb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 13:47:31 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2af04f0002>; Wed, 05 Aug 2020 10:45:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 05 Aug 2020 10:46:05 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 05 Aug 2020 10:46:05 -0700
Received: from [10.2.172.190] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 17:46:04 +0000
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
 <1596469346-937-9-git-send-email-skomatineni@nvidia.com>
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <b2098a68-d02f-b406-fc57-56e3ff5d8d1a@nvidia.com>
Date:   Wed, 5 Aug 2020 10:46:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0e78c5ca-c529-1e98-891d-30351c9aae81@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596649551; bh=wk+Mna0/VI73TEW7qI+h1geiRlSoJNyeCelXdGiAwi0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=YJ5gkWInFeVRXM3LB3k8bi+9lMpQBAvxigcSUtTmpnVLcTq4VeNnfN3bzQ9Qgyd5L
         ix8LHukf8weSxmB2QOv61ed/docMCPsuuqcYZRg/EcPTncOJpdzL5gB0+3XvmVkNkS
         oL8RDAt16pKlVuVCFHsGziMocCj+8PDyD/YkmcySrksfQq/WFBDNK+vE8Lgia0bk8H
         NayOeLZevJvnZkhVlvVe9k5OIXhUC0sQZGS3G4QSzpN93b5cYE7tkALrd0Z8s4HisV
         bvVmqXgFRoLh3pI6BAg7AR55KFDz1Wc9Y5wSFB0knEGfmHXSlnSYUFV0t57adMkTke
         B6mrYvnGNoKbg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 8/5/20 10:34 AM, Dmitry Osipenko wrote:
> 05.08.2020 20:29, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> UART_FST_MIPI_CAL is the clock used for calibration logic which is FSM
>> that goes thru sequence codes and when done waits for pads to be in
>> LP-11 to apply results.
>>
>> MIPI_CLK is controller gate clock which is also need to be kept enabled
>> as incase if it sees LP-11 it updates registers so its recommended to
>> have this clock enabled.
>>
>> We can cancel_calibration() in CSI only when csi/sensor stream on fails
>> and in which case there will be no LP-11 so we can unconditionally
>> disable MIPI_CLK.
>>
> There is no guarantee that the fail comes before the LP-11. For example,
> some odd camera driver may have a complicated enable sequence which may
> fail after enabling the hardware streaming.

MIPI_CLK to keep enable is for calibration logic to update results, but=20
like I said calibration logic uses UART_FST_MIPI_CAL clock. So even in=20
case if fail happens from sensor after having pads in LP-11 then,=20
calibration logic will still be running but result update will not=20
happen with clock disabled. But HW will not stuck as this is confirmed=20
from HW designer.



