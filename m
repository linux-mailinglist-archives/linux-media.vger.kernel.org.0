Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAFC1C065D
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 21:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgD3T3W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 15:29:22 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8943 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgD3T3V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 15:29:21 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eab26ce0001>; Thu, 30 Apr 2020 12:28:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Apr 2020 12:29:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Apr 2020 12:29:21 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 19:29:20 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 19:29:19 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <18d457dd-17cb-633e-cdec-e0abfe73b0b0@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <10286a40-ed3c-1999-68fa-7099130a2423@nvidia.com>
Date:   Thu, 30 Apr 2020 12:27:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <18d457dd-17cb-633e-cdec-e0abfe73b0b0@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588274894; bh=+3lStLw5yssQ0AKxd+sc1j1usFslZ6/M/9XZ4GHBV9w=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=VgEzGXuHYNGSQ+lgeTnPiB/xxffHbRX9bSPslEoyb5hWTxK4OHySD9I0srZBKKBTm
         Vep79jUMJmlAkESyVFlbqjXU0n7RN2HsDJOqdzui7G9QMu+Rw/DKjINMx/O3eA8xo6
         FcGdfSV4vaoenWB+ItVETxBgdxBIy7i/KEX3eqoCFeyP3zJ24nLq+3WPN1nDx0U60B
         SIEI529dw2XeiX/M1JCov7c6OPz4DKKd9FJeMVajjS8z1VexD+5y8Y09VPBAVtr6mV
         AL4Vd9qcwTRQCW3F8VNB3sx6kiAAbz06kC6uJjFDczETj9v4/T4+MuXwjNSG+Cnsto
         I/+RD7azUQunA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/30/20 6:34 AM, Dmitry Osipenko wrote:
> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +static int tegra_csi_init(struct host1x_client *client)
>> +{
>> +	struct tegra_csi *csi =3D host1x_client_to_csi(client);
>> +	struct tegra_video_device *vid =3D dev_get_drvdata(client->host);
>> +	int ret;
>> +
>> +	INIT_LIST_HEAD(&csi->csi_chans);
>> +
>> +	ret =3D tegra_csi_tpg_channels_alloc(csi);
>> +	if (ret < 0) {
>> +		dev_err(csi->dev,
>> +			"failed to allocate tpg channels: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	ret =3D tegra_csi_channels_init(csi);
>> +	if (ret < 0)
>> +		goto cleanup;
>> +
>> +	vid->csi =3D csi;
>> +
>> +	return 0;
>> +
>> +cleanup:
>> +	tegra_csi_channels_cleanup(csi);
>> +	pm_runtime_put_sync(csi->dev);
> This pm_runtime_put_sync() should be removed.

Sorry, I had it correct in follow-up patches and missed this to remove=20
in v12.

Will double check all changes before sending v12 once all v11 feedback=20
from you is done.

>
>> +	return ret;
>> +}
