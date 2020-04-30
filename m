Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC041C0772
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 22:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgD3UKJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 16:10:09 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14149 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgD3UKJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 16:10:09 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eab30240001>; Thu, 30 Apr 2020 13:08:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Apr 2020 13:10:08 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Apr 2020 13:10:08 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 20:10:08 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 20:10:07 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <eadf3a5a-f305-4561-10e1-1b9241b9c5c2@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <bfd82642-9648-96f1-737d-4b9a869d34a3@nvidia.com>
Date:   Thu, 30 Apr 2020 13:08:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <eadf3a5a-f305-4561-10e1-1b9241b9c5c2@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588277285; bh=bU+Gy6O+uYdQwdtawNbqdmqoPb5HNcT3EKUwg12HVTg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=HyHQiCKccOmKDCyjff09+lV+ozUKZQWBN6MvpgIuXiK3zzsPD+iaHW31AJVM9WEf8
         3MhEAYDuFgWjAmTiA2nyp5hm2cWXDXRr9huwo4ka9jmDEav+j+9KjV1OrWK9rMtHxf
         E13nWbrEMddT8yfbF1Zr+3D7YdUemyLDzPNp2b4282gI3lKPWS5GuoLeJX2RnhV5/H
         IYXVJakraLOdk5gznQvw3PPuV5QkXip+u7ASm/aNrOIijgkG1NIZfujf5QR4dZxlBX
         zYBFFYvAZNw0VBi/9VeVTx+5vkDlhVSRa1WiX549lhJhvQ9RL/SVRQhMFsg4yWqdPy
         AKedr1Sv/TXKA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/30/20 1:06 PM, Dmitry Osipenko wrote:
> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> +static int chan_capture_kthread_start(void *data)
>> +{
>> +	struct tegra_vi_channel *chan =3D data;
>> +	struct tegra_channel_buffer *buf;
>> +	int err =3D 0;
>> +
>> +	set_freezable();
>> +
>> +	while (1) {
>> +		try_to_freeze();
>> +
>> +		/*
>> +		 * Source is not streaming if error is non-zero.
>> +		 * So, do not dequeue buffers on error and let the thread sleep
>> +		 * till kthread stop signal is received.
>> +		 */
>> +		wait_event_interruptible(chan->start_wait,
>> +					 kthread_should_stop() ||
>> +					 (!list_empty(&chan->capture) &&
>> +					 !err));
> ...
>> +static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
>> +{
>> +	struct tegra_vi_channel *chan =3D vb2_get_drv_priv(vb->vb2_queue);
>> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
>> +	struct tegra_channel_buffer *buf =3D to_tegra_channel_buffer(vbuf);
>> +
>> +	/* put buffer into the capture queue */
>> +	spin_lock(&chan->start_lock);
>> +	list_add_tail(&buf->queue, &chan->capture);
>> +	spin_unlock(&chan->start_lock);
>> +
>> +	/* wait up kthread for capture */
>> +	wake_up_interruptible(&chan->start_wait);
>> +}
> The V4L doc says that buffers could be enqueued before streaming is
> started. I guess it should be a trouble here, shouldn't it?
>
> https://elixir.bootlin.com/linux/v5.7-rc3/source/include/media/videobuf2-=
core.h#L379

what trouble are you referring here?

I dont think so as we set min buffers needed as 2 always there will be 2=20
per-queued buffers.

But buffers from this queue will be dequeued only when ready to=20
processes in the capture thread

