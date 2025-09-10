Return-Path: <linux-media+bounces-42216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0768B51824
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 15:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69C53178720
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 13:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6943C31E101;
	Wed, 10 Sep 2025 13:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=yarny@public-files.de header.b="uBqfoe1a"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFDF31E0E7
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 13:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757511793; cv=none; b=AgPAJ2LLqfc2i/NIP4NpVlheT1yfwZ3RusS8xDhmrjfTTPoFTvvpzb2AORtcpzzw/0Fs+C1eK9Iei2dZ1y1kKUUnnqheZnihAL1+WmQFuaAnTujBzvZz04ipjNchCpJfQWWe6Spg+PPNll9feBw2qtcZx27uoChmjY/v0luE1zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757511793; c=relaxed/simple;
	bh=T2DfuItDyfK7TXheXRtzQFZbwIktnjt1WYOp+EFG8mQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QVZifmQH0ZQm781rhkXk++fIA8z/d/Yg85FterqjaCoOfOtTYS7AFu62X8+NRSzkX6DHm9sqMSpKTROwsDgMv0JuVBhLceX/yBkXiE63OIpIx8TKYhCTxQnJ0SX1LuAkPOckmeCp7VQcjat8+0rQBNECub8gZZf3DFWBYZM4n90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=yarny@public-files.de header.b=uBqfoe1a; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1757511784; x=1758116584; i=yarny@public-files.de;
	bh=/nSLypluWCO1rxS+Uxrz1eDEuD6iu7tSQ1IexCyLwXo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uBqfoe1aVS5w7U6AyIVMtCH08EayWD0AMNl08VX/wbn21lqeJeDyOZKolsvH31PL
	 bGOEhKhWjyMKhq3OEk4Ij8iBTkWZID3pdjAlx4JZYaBRetf9GlRo642PSahvLVDx0
	 9osne1nsJAUbR34/4wugZSpFuzMZ84q0LX1Q7BmJkNt7PmUOGu9rzNgGyofLpNiAm
	 UJnGKgx0kN+Y1/dY0HSX8ElKLe+nXV+NwsmRTG4HQ1YTpnVSJpG2mnhDgQFC7froj
	 W02t8KzNYPTFdKvojNojKbNv2VKsh5bLnr74R1FqKplwKqZGfe/wwPAVrhs4bVw39
	 TuKM0PlKkV8/F+jYXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([146.52.47.213]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mq2nA-1uao7W2EEc-00fnOl; Wed, 10
 Sep 2025 15:43:04 +0200
Message-ID: <6e715f4f-4eea-467a-9584-af4fc58c6e1d@public-files.de>
Date: Wed, 10 Sep 2025 13:42:00 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yarny <Yarny@public-files.de>
Subject: Re: [PATCH v4l-utils] fix meson target directories
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
References: <867c4d2e-7871-4280-8c89-d4b654597f32@public-files.de>
 <ef93df83-9eaa-4cf8-8449-f41ce9a23d79@kernel.org>
Content-Language: de-DE
In-Reply-To: <ef93df83-9eaa-4cf8-8449-f41ce9a23d79@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pw4R9TKzNcrbgE6Yz0LpjZjMIclyfORz7V5Q/yeIp3aIiZ3eCNa
 GRkRl6ii93kk8vFYHlJJWxWfjVDMQjXgR1lf1wYj9Bmk5HfXifaM3AlGh0W/f4D7brf6wzT
 N9j+Rf04fNm9coG2jrJfEPFdG65RK/FBKhDG5duSCjoeZ2nR0FDrm4JMEpLF0UpnzGJahPq
 MXtlURUULAimFPLBuFAog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x6+lsOPyDuo=;6ZD0KpIOZjU1Sg6C5w3ilwH5evr
 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
 yumw==

Dear Hans,

Signed-off-by: Yarny <Yarny@public-files.de>

just like that?

Thanks -- Yarny



Am Mi 10 Sep 2025 um 10:38:11 schrieb Hans Verkuil:
> Hi Yarny,
>=20
> In order for me to take these two patches I need your Signed-off-by line=
.
>=20
> Just reply to this email with that line and I'll add it.
>=20
> Regards,
>=20
> 	Hans
>=20
> On 22/06/2025 17:35, Yarny wrote:
>> Hi linux-media,
>>
>> please find attached two patches for current v4l-utils
>> master branch that fix packaging errors with meson.
>> I stumbled over those bugs while I tried to package
>> v4l-utils within the NixOS linux distribution.
>>
>> Thanks and best regards -- Yarny
>=20


