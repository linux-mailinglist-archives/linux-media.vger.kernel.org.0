Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9465114DFD3
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 18:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbgA3RUl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 12:20:41 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16987 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbgA3RUl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 12:20:41 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e3310590000>; Thu, 30 Jan 2020 09:20:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Jan 2020 09:20:40 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Jan 2020 09:20:40 -0800
Received: from [10.2.164.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 17:20:39 +0000
Subject: Re: [RFC PATCH v1 0/5] Add Tegra driver for video capture
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <a6512e1b-ad0e-3f59-e775-418db4865994@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <845c362b-e164-58eb-118c-e779be8dd4e2@nvidia.com>
Date:   Thu, 30 Jan 2020 09:20:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a6512e1b-ad0e-3f59-e775-418db4865994@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580404826; bh=VvGI4mzL1+D2T1N0XX+UlimGE29f1CsZgH7u4Tm3tQI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=UPPHupye+Yz8JTINjMcHQNHBYPrRzgHvy3kVPYf8ek8dbqNs/OhIKW+uUIaZp8WSA
         KvFGL5KiIutVz+9vwOBk1ZUnJXXBG+JPhhRW404mwP3ZFyk4OQZA+MJZ81bSss01p0
         9A3S1KQ3tmp+ruZPauZGSYLA4hv5MRRa/NPSKfCC7i4VKbW7zmbnVEqnioG9t0ywy6
         Di1jonjMX/3v3HiLdupWP5ZdorVqq9oILzadc1GOs3O8WV636rlx0BNvluz+LCUBLQ
         1nBq/u3OSqYTYepdmhNKGlrXI0m++gHSXpjgcmJgwXHBx8UuIL847cIcDEfJJbYm7J
         LqFsQx1cV8amQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I noticed the warning in queue_setup and will be removed in v2.

But errors are related to not using latest host1x driver. latest host1x=20
driver changed parent member to host.

So vi/csi driver also uses new member name host. Probably media_tree=20
don't have latest host1x driver


On 1/30/20 6:41 AM, Hans Verkuil wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sowjanya,
>
> On 1/28/20 7:23 PM, Sowjanya Komatineni wrote:
>> This series adds Tegra210 VI and CSI driver for built-in test pattern
>> generator (TPG) capture.
>>
>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
>> CSI port is one-to-one mapped to VI channel for video capture.
>>
>> This series has TPG support only where it creates hard media links
>> between CSI subdevice and VI video device without device graphs.
>>
>> v4l2-compliance results are available below the patch diff.
>>
>> [v0]: Includes,
>>        - Adds CSI TPG clock to Tegra210 clock driver
>>        - Host1x video driver with VI and CSI clients.
>>        - Support for Tegra210 only.
>>        - VI CSI TPG support with hard media links in driver.
>>        - Video formats supported by Tegra210 VI
>>        - CSI TPG supported video formats
> I'm trying to compile this patch series using the media_tree master
> branch (https://git.linuxtv.org//media_tree.git), but it fails:
>
> drivers/staging/media/tegra/tegra-channel.c: In function =E2=80=98tegra_c=
hannel_queue_setup=E2=80=99:
> drivers/staging/media/tegra/tegra-channel.c:71:15: warning: unused variab=
le =E2=80=98count=E2=80=99 [-Wunused-variable]
>     71 |  unsigned int count =3D *nbuffers;
>        |               ^~~~~
> drivers/staging/media/tegra/tegra-channel.c: In function =E2=80=98tegra_c=
hannel_init=E2=80=99:
> drivers/staging/media/tegra/tegra-channel.c:518:55: error: =E2=80=98struc=
t host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>    518 |  struct tegra_camera *cam =3D dev_get_drvdata(vi->client.host);
>        |                                                       ^
> make[4]: *** [scripts/Makefile.build:265: drivers/staging/media/tegra/teg=
ra-channel.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_vi_tpg=
_graph_init=E2=80=99:
> drivers/staging/media/tegra/tegra-vi.c:157:55: error: =E2=80=98struct hos=
t1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>    157 |  struct tegra_camera *cam =3D dev_get_drvdata(vi->client.host);
>        |                                                       ^
> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_vi_ini=
t=E2=80=99:
> drivers/staging/media/tegra/tegra-csi.c: In function =E2=80=98tegra_csi_i=
nit=E2=80=99:
> drivers/staging/media/tegra/tegra-vi.c:213:51: error: =E2=80=98struct hos=
t1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>    213 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>        |                                                   ^~
> drivers/staging/media/tegra/tegra-csi.c:259:51: error: =E2=80=98struct ho=
st1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>    259 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>        |                                                   ^~
> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_vi_exi=
t=E2=80=99:
> drivers/staging/media/tegra/tegra-vi.c:246:51: error: =E2=80=98struct hos=
t1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>    246 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>        |                                                   ^~
> drivers/staging/media/tegra/tegra-csi.c: In function =E2=80=98tegra_csi_e=
xit=E2=80=99:
> drivers/staging/media/tegra/tegra-csi.c:286:51: error: =E2=80=98struct ho=
st1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>    286 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>        |                                                   ^~
>
> And indeed, struct host1x_client as defined in include/linux/host1x.h doe=
sn't
> have a 'host' field.
>
> Does this series depend on another patch that's not yet in mainline?
>
> Regards,
>
>          Hans
