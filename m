Return-Path: <linux-media+bounces-18155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6695E975169
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 14:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A0AA28B540
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 12:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141E4192B88;
	Wed, 11 Sep 2024 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Hco7YKrU"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D9613AA3E;
	Wed, 11 Sep 2024 12:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726056212; cv=none; b=i299KGUj19Sv7m4yOkZO3T3kY5+1PZIMrQPaJMUcMdkrFIi/H1uMcWRZhmfqLZlIc8Zrp5gYaBX2KGI/j+fW4fR4VMO6rXls8v0Qh0T/LCyQ60jCgBDItW5aIQM5xR14QIZS8Z2L9NCgQj+wIJD9BX+7TMhFllTA29bmaHBDmLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726056212; c=relaxed/simple;
	bh=to/dI+U8c82M6OElNphf9TFg4NuIv4FJo3rnED38GM0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=qyo6R6X+0OrSonWS/Zz/d5FwTsrO2hwVNIC3KZvoI1aJx3d1VpAr6HxcObhAefsxD5YDL8RPtGgTkKUx4NRU0njWLWmMw7OgNmjtalwp8tyuC7Rw8ROdSHzUtXJp6bOMt/+l7DASv2+ohPk1OpqRNcUlRP7NapiFOFidYEHOnzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Hco7YKrU; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1726056179; x=1726660979; i=markus.elfring@web.de;
	bh=to/dI+U8c82M6OElNphf9TFg4NuIv4FJo3rnED38GM0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Hco7YKrUwUPLHLTI+twaLWbzmwXkV0mINsS6UdWH0Ao4XcME4uYbNUftJ3kU1pHV
	 3TnV+338SIWsnrYLfBGOePElSld13/qNvlJzwiGtQ3iGlpC+H7hbOvZM7TyhO7fll
	 j6Igv1gKAJbFpN3QKa0DoYV8pdLnS8gvG7G0jL1s1BVle1excKCC5rDKt/mV5bfOz
	 uvSA1U51+g6XacpRV91OjjW5OTJibj9W/f6N4h3/N6zkoGazT0xycNsGIfmfsW0ZA
	 q7TFkNuWXMuarFC58jEqaiUmN3y9MLvljDU9RCR47gd9+K6X1cWrd2Up2l+TQ8H9R
	 y8sK5w41dgaVC01TgA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.86.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mq182-1sBDbl0Two-00cfwJ; Wed, 11
 Sep 2024 14:02:59 +0200
Message-ID: <ba285b99-96a6-4fbf-b72e-b264a300ce6f@web.de>
Date: Wed, 11 Sep 2024 14:02:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240612-6-10-rocket-v1-8-060e48eea250@tomeuvizoso.net>
Subject: Re: [PATCH 8/9] accel/rocket: Add job submission IOCTL
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240612-6-10-rocket-v1-8-060e48eea250@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gBOc2VelSGYN7vMulw3gUfHiDfi7Fce6hUGRA3ig0e7CkPk7ctW
 02fliq1YqKL5NKGvp3rgm2vGCmn6B7aS1N/nr+h0YbeeRcbBWnwr7+rO2Hwhq057gL31eNi
 LR1cvkK0e+qFvnrh0GnTB7rpMSh2/emhZOdJ2z2xi7Ae1r7gPW55kJ+Yp8MMxUhxUlDXyUk
 vYuXx5zKe7w6f1ZlWKmSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kwUCKjmSRow=;GXfTPl9KFQxzuxjHbnw0svEf0G3
 Uctcq9Kr/ho6Y0LyjZNPPDYlzYjtlry3asr8W82jx14bpGu3jCx2WlCJNwLO0/RybxYvHtqyt
 0eJR2xvpk1mD3BfD6ES4G4nPghEA0Xe0VmyS/bOP3h7e5ccgwFG6rh5+NcRay3ifHOEpc2dJq
 3lz97Wz4Jwb+bX9qUxV2p21EKo0fk/MGTTw+ic/kF7yL3Hj0qMX55emMFpldoG2w1wb3XZSas
 NTbXmQfGKosykNVgoNLaRCy92S00vVSewSAIGc7NLaQksiPebe2x0I0CrEBOSyFKCiJ1lRKHs
 sXoJDShFfVErAk+ftvVPr/5f+uwSALx5Rn4ga/tYXitIuOicPsv9lctt2RJvUUeu7CopQY/J7
 x3Gm3cmwjHVs4GpfTV5F3yUxpiX6gHTwl420nPg98AEQKnlw+9G56/eEv/UOYcHYRq3Plq8xo
 3BzcllAiZYFg/2VEUN85RXJ8nvHYIV6O2UPR0dIeVS97RQfqr5ZDQ58q/KjOl2l2TTgvLYDwo
 9z08q7kvWwjdKsZp7dfTFcdDRsL54w4z7bFZ9Pri6T9YrKUSbIdKGaElp2z7CW+1e4YP0L3Zz
 RkpV3P0IioN2RRARyS9Q4KgwspVFg+nS7lYw/QAgc2hYLa4ve7+kGrWH+XeYK99OXePLIThWj
 oIhQy4AkUaIfiAw2vIr5HWObE/R3WDhulqPh2xWizhETqAPkKZJbRPr6v/yopUUdtUnQB9Kwg
 3id6Oi229ubAiXjr8QtfEw3lsksciZSnl8UuBNhEEOYXyXsNd/B84HnV1Z6/QUqaoKJRztkHQ
 Al0RJc+9fpFxCgs5ckOfnE1w==

=E2=80=A6
> +++ b/drivers/accel/rocket/rocket_job.h
> @@ -0,0 +1,49 @@
=E2=80=A6
> +#ifndef __ROCKET_JOB_H__
> +#define __ROCKET_JOB_H__
=E2=80=A6

I suggest to omit leading underscores from such identifiers.
https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+d=
efine+a+reserved+identifier

Regards,
Markus

