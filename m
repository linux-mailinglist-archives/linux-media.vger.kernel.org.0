Return-Path: <linux-media+bounces-36394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDEDAEF30A
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 11:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C55C1178FA5
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 09:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAE426AA8C;
	Tue,  1 Jul 2025 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="iVpcNRk5"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29184266B41;
	Tue,  1 Jul 2025 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361533; cv=none; b=NeAalLooSnc+C/lwa/nCbsRTRyrtn1Es4to+inOoyJtupFjpMzdIpUYqQJUBFGlJmmhAfaA7mtUG5T1E/KbplIWBBU4OVmExaBwnOpEUyjoK8Mw9V5guGPpHOP151EScxXS0uaqPwFzhWMkMLr5i+wEXF2zbvyIOHuxkXJb0mZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361533; c=relaxed/simple;
	bh=rf4CGdCHUYs1dOhweYzyYABZwQzYP0vkcgLdE2l/Kzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAZOEgmIX7lP+A6vm1JSuYvC2WwsZJEl0GknqSzTOOA1TZ6I3mEE6jB1qzc93Zi67f9N/T6ZjF9CU5K2+/4YBgKGPIJYXAS22na3roNBR1hjdCzui9b36x6HCFvjFIS4jSm0x8zp62KIZbA39kzGgwhfM3CDDYVT+jyerfK4OdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=iVpcNRk5; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1751361497; x=1751966297; i=markus.elfring@web.de;
	bh=rf4CGdCHUYs1dOhweYzyYABZwQzYP0vkcgLdE2l/Kzw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=iVpcNRk5sF1p84NA1BzyN7RdA6bVU1D52ORf74wrZwsJHXlUmxO5vtzryIUT2ivn
	 fKhDV+n1/mDAx0Lbstq/JQZ47wpRDabiSPHyAwpPer7UThijYyG206exxwiCSOUc6
	 1l3Exam7tTGW+7jZB9p7J+pHgoy77zbf9OqynnRnQ3/kPn5Ntp+5tAz3KCMNthwsX
	 BzBn1mrz9K6PPxrPZbQt19UYjT3juVBH+a6B4zK5wj31GH0wORcASKGihq2z5AHE3
	 OCcASwy/xduYhtMc+iuhe/BTxqrdlf5ewXl7n3C1w77M1387eRt2+C8RslU4u9C6N
	 qkVwan+gXx3hHGjZ6w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.242]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MGQGH-1uV91Q10of-000hlo; Tue, 01
 Jul 2025 11:18:17 +0200
Message-ID: <35924ff7-4703-4cac-88da-dc01d22c8dd8@web.de>
Date: Tue, 1 Jul 2025 11:18:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 0/5] media: i2c: imx214: Add some style improvements
To: =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 linux-media@vger.kernel.org, phone-devel@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20250630-imx214_fixes-v2-0-cd1a76c412c0@apitzsch.eu>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250630-imx214_fixes-v2-0-cd1a76c412c0@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dhr0VNQ99MR4kUX866Kelg7mQlii5oZLe86NT+j7lKybosK1ez3
 Glabh4DZj0pxiSpapz0aT1QqEWpVyAp19e5bLNn/ZJ8v7GeYkbAnP6doKY7lQ9CrJdKSOkD
 sn3szAJm1QHkZAKo36LHPuhiAZnhZKpMtZ4/0svUB27mU6e/FHYjnghj44tTs+H6jm2XhFQ
 xbpL4X5XMxd2UAeA+Eomg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Hwzo/Mfj13E=;0/qKqkeTsQibfMaoSz9biGyBu9P
 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

=E2=80=A6> ---
> Changes in v2:
=E2=80=A6
> - Use imperative mood for commit message (patch =E2=80=A6)
=E2=80=A6

Will this review concern become relevant for further update steps?

Regards,
Markus

