Return-Path: <linux-media+bounces-15578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD149414FF
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 17:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA33CB2743F
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 15:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E801A2571;
	Tue, 30 Jul 2024 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="SZ33MQPc"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7F42A1C7;
	Tue, 30 Jul 2024 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722351660; cv=none; b=m7iz83h+akRT+ib8XDvyfpDrasptagcwnwyVjVzB/Mtii+GIpS2VpfL1RuB8pAbpn4/ZN+dMGezr8d+CVm498nOqGedSVQ60ghkRc2325giYFFUSbrUvCps76S096uOfl4wZR+SpNmoN9wqx9bZgGtXd9i+gUwn84tCFtBvkbJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722351660; c=relaxed/simple;
	bh=C46lnTgTdEUHa4MNm/fgHHaaUwl9VVGJLeuJ6XjMX7Q=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=qtLYoHdgyKOp8e5dZm8h97LyEHM8XmE56utyrMIs/IrGQwR50WI5oJvFZmY1SriiwX+MUgGmeea/P/FtEJjQfDsUIzCZo/CIOazUmKFHy1Ze8twB3C4c0GVz5ViVSDIKGu99/0rbevSGkOAk+8VHw3iY3qRJXzLXQ9G0VCNOKx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=SZ33MQPc; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722351619; x=1722956419; i=markus.elfring@web.de;
	bh=fzQR8FFAK3t7+2p17buzYuiThMVwwBizpzlOP3GSlj8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SZ33MQPcPzwuLTVOaAuIFcUXcJ/beaQl8rUgcEJZSQ5g6wEB/pg5XVTiKNkT/NPP
	 LxTt9N5eJhGyqskFL/xQzclyRO6ZC63gLCfRHpZVmu1yDs8IGERT8yUZTRzB7ENsS
	 mj9X/Kh978YrttoI7vqhdy5BjzztdIXWVzGnCReC6eD3Kw6aVNvpsudMBYRxGSGhI
	 L/QLEdPFhZlC2V9z10GpKi0zOGXKVkRY3ClhMeAebY5j80ZyGGbtJtYBxONv7qi7J
	 0HljMTJh7mDJwyxLa8rhdGYU6I67l0LbbUihAjcDzkvNasg2WfR3d92DZUJ2ZxSVW
	 SEsSDe7p9Pi2y3luiA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MFJnh-1sRzvG16PR-00BmDG; Tue, 30
 Jul 2024 17:00:19 +0200
Message-ID: <f88557ca-536f-4ea4-ac13-e20fb296195c@web.de>
Date: Tue, 30 Jul 2024 17:00:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Sylvestre <fsylvestre@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
Subject: Re: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4Zb/x/JAgneBRKvvPm7xyrFIbDn22ofBuCL90y77rx2Jfy2Zbi2
 RJ6KHcqJfBXMxBGJWCexAO8OMDdoKFRK0ClzvdKoTH97oQgYRBc9P7FLWwOrTuRJtNCkuIA
 bLSAeCcxrEr5KQt/mJ33MA2xFGWiFIVU96M6cIcgW0f9M8b0eYeD+itSGxBveAzdkk2xagE
 c3CinLYom+6K7w6U8YTOg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bHM4AXgBl7w=;lD6T+yVR3keWuF801q7VmAjs13/
 gwxHaMPiF66h5qf0tryLq2OfzWDbHh6meIwbYdkSypjLUV3BOnLeorO4UwYI2iWQsx4YHs7Rv
 /P4mnaDQZFDRCDr+Vywxzz5PalF1juvLXQEXXHrnoKvFNPA3DDcqX+cXZsn/Jx228jKPMbjoe
 GWqRDT61JvCoa2lqF5iMciRoIlvyVVH+pxxbw/olVwe/tLgsbz7EGgBXhXnbm97nO7ZnoAay3
 6mufhXoq7vynQNx1Whg50Iuv5c4tIPxJrLACcH3pjaLxFFHyNl6/+BpDqtdPIHjaMFAuoViju
 USpyhAY6LiryeON9/rh3j8fARMaccC/sMtxDf/B4DB2Rdd4OArxvffZnwA7U9BVaj/nRTt2ei
 TVWCftEzH2BaKLq50VZSAfMm3NBpCD6RVUs8TpLaLgTuKQSoqXdZEUCjREHL2dGzA9k7vybml
 4pHlZxYv3XA1Mz+R0AERoK54ESzsBXT27YMflMGGKHAXS/stlgNJ9X1HyQmm3hr/9zIOHdDzM
 y1PcCglz0zdAyVE1apYyqAMjdjXFhoM3n9p4ltiewazV2tMc4ZMnreQxSaNaNTzN0M5e4jXJ9
 YyB8nK6+zoSdXpXC9dXdGbyGLW8vjcTzn+cY9oAi2Ff53WIbbe9iHAEcf0dmoD3gZECjTwDez
 m4duuqDqN9KFcx6/nGDGWD0MFz4MNY/iVYTkkx0IVulRQxOF45P0EapBtEdq4tfgh+9WCLfbc
 8b26+A1XqGrHiCaGZuFavo3brp94dq/aX724fQSMBdsgAu3ukpuZHbYbFgPEBMgPZfZu09GrI
 8jdThC2m+7BJIeO7fBQD4M9w==

=E2=80=A6
> +++ b/drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv30_hw.c
> @@ -0,0 +1,413 @@
=E2=80=A6
> +static int mtk_camsv30_runtime_resume(struct device *dev)
> +{
=E2=80=A6
> +		mtk_camsv30_setup(cam_dev, fmt->width, fmt->height,
> +				  fmt->plane_fmt[0].bytesperline, vdev->fmtinfo->code);
> +
> +		spin_lock_irqsave(&cam_dev->buf_list_lock, flags);
=E2=80=A6
> +		mtk_camsv30_cmos_vf_hw_enable(cam_dev);
> +
> +		spin_unlock_irqrestore(&cam_dev->buf_list_lock, flags);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&cam_dev->buf_list_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc1/source/include/linux/spinlock.h=
#L572

Regards,
Markus

