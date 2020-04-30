Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2F071C068A
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 21:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgD3TeF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 15:34:05 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7110 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgD3TeE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 15:34:04 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eab281f0003>; Thu, 30 Apr 2020 12:33:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 30 Apr 2020 12:34:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 30 Apr 2020 12:34:04 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 19:34:03 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 19:34:02 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <34a49a30-71f2-5b24-20a4-7d98ae37cefa@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <1b23178b-0e5c-c97e-434c-f9cc3c02805b@nvidia.com>
Date:   Thu, 30 Apr 2020 12:32:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <34a49a30-71f2-5b24-20a4-7d98ae37cefa@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588275231; bh=GY/CNLV+BgJwAKvqIbKk5EEYMo+/L77QbQLJ47q90Ao=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=at3ZceOczxU7IZKT34/R0fEYLH8JgPAH7kRCYOknXCpShLAVvgNQsAVi0STgeBgo9
         wooJ13kFjAe7Yqrvh9YqiGnw5DX4vUTO0MaHIR/N7VaPu5hDnk9meWGT9k1fvSyEc8
         NH+PEXNG5x+Zqj3fKdG14U+iuEfocBH32Bs1hYXon96aXvXG0dFZIJQV/6lxRKOCbD
         csF8UmhACnt0un5fHokUFT4AH+FqogWkGKH36flviJ0kgNa5J4t2np48VEBLgh9GOO
         KpshMldWjC0Li6eQpENmyA/VpX8OEUUgHJYCjyXppWFaHzK4BNNVfCR80I8qa7/gS+
         5t7YcV8L/WTxg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/30/20 6:38 AM, Dmitry Osipenko wrote:
> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +/**
>> + * struct tegra_csi_ops - Tegra CSI operations
>> + *
>> + * @csi_streaming: programs csi hardware to enable or disable streaming=
.
>> + * @csi_err_recover: csi hardware block recovery in case of any capture=
 errors
>> + *		due to missing source stream or due to improper csi input from
>> + *		the external source.
>> + */
>> +struct tegra_csi_ops {
>> +	int (*csi_streaming)(struct tegra_csi_channel *csi_chan, u8 pg_mode,
>> +			     int enable);
> What about to split csi_streaming() into csi_start_streaming() /
> csi_stop_streaming()?
>
> This will make tegra_csi_ops to be consistent with the tegra_ve_ops. A
> separated start/stop operations are somewhat more natural to have in
> general.

vi ops is for vb2_ops which has separate start/stop so has seperate=20
start/stop for vi ops.

csi is subdev and csi ops is for v4l2_subdev_ops which as s_stream=20
callback only.

So, created single stream function for csi to match same as subdev_ops.


