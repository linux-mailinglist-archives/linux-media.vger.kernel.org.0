Return-Path: <linux-media+bounces-20783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1F89BB0C1
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 11:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A12FC1C21583
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 10:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBDE1B0F39;
	Mon,  4 Nov 2024 10:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="knjvg/P1"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6616320ED;
	Mon,  4 Nov 2024 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730715359; cv=none; b=gHzJ5OXJ3oBXeKHcZfmPwTBmEwrg+LBx7O/NLk+uYGytj3bidohRWGdK8UZZXXsGIkHJUR1dS4kDhiLDoQfwdNwDJsLkYYPGNeOcBG1Vb6qSNJ1QwimM4MF/bxQXOjm/5jSZQcfhW+k+ms19ESQlXz5iU4vDDQJXrDF0Kc3xQ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730715359; c=relaxed/simple;
	bh=NQ1fsHIaIHmGq0j/3qRfROeTwLYWzazLpuIXXxQA82Y=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=EzhbMR7YlGsnTUOY3BOkvCxHyF7zcBt5trpceb/QpBRQ4QpbxgJd2NWAwsUJA6bGIutGmfl59LIoFpWQKby/7ae5VOyA1FL75HwXOirmvaDcNjLElABLy9FmuBUqWLs/ZZll37BYMmHm6lVaVd9Neic0d+L7RvBOpAPa/f3SErE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=knjvg/P1; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1730715323; x=1731320123; i=markus.elfring@web.de;
	bh=NQ1fsHIaIHmGq0j/3qRfROeTwLYWzazLpuIXXxQA82Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=knjvg/P1ZncQoGKlgJrnrqH45eDlrZzwz1AcO/saXxx4wSIzx6zioHC9jO2DYK2z
	 0Khw89XODrbwK8KvRL1xpYKV9VMXSb7ir3Jl207l2R978ibPyzkDzo4KQlfPZhe93
	 OZEPddjLUy5z5NtMT9yaJQS4zFmscTCHZtMNt8fc/0TN4qLLxlwCT1CpvR9qt0JMG
	 Nu2eYLy7Sy+Q/NQ4OWEnpgq95Dt4f8+GVLPmyPk8YD5x0bwRFkaPpXD54aCDfFtvm
	 ZoGQVlCvLyUedHt3iqd01c8vRQgFrPUbafWedGs/t4dE1+k90+MfxmM76se7+q2xn
	 qJvzz0MKU7ZmDlblTA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M3m9J-1t8jCC26GR-00Exdk; Mon, 04
 Nov 2024 11:15:23 +0100
Message-ID: <621ad79f-8a8f-460e-92df-c3164f30e46a@web.de>
Date: Mon, 4 Nov 2024 11:15:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Li Huafei <lihuafei1@huawei.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, Alan Cox <alan@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20241104145051.3088231-1-lihuafei1@huawei.com>
Subject: Re: [PATCH v2] media: atomisp: Add check for rgby_data memory
 allocation failure
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241104145051.3088231-1-lihuafei1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UclgB42S5V1YLaM5QUM06sXODsMAg/7CediUb9KGB8Rry+dLoNe
 RCH/t88339qmRNLHUNJRT5c+y1rU+ET9Th8BfJTwVKAZ799NM/QGZCnL/HdF95YLX9q1CoP
 Bn6YUZsyp/QwdAdIOSxdAFIIOz9rQ8efGNbJzNeOFBZUEV/RtbgvBygl9eN7zahA5RSKlz9
 reJHNgBIjIE0LCtX9ON5g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IhRTea/ZbQM=;pJv1edYOIjWdw7XWEJn8YVDuE0Z
 /HrYUbiyH1soTe4GuIzVxRA+ECwkqxwb97wYyPJmTf8072v0F7sDWbVvwpkbXCKH+YhdSduRu
 TJ12oQ/O8abP/22+0nhs7am/rzHAQyr8zrIQDyORRR/ZQ2qWwY2CYoogZKmREkNGxVtd0Tpu5
 M9ukdLmBaZqtfjyovzXChcuLYA+tbLS703hLF0KKzakBY4yqqrzHNHaMcEpdWvm5cbJgqwRby
 VSCLUpYXzbXPaWyWkracd0oluE2+nAmK6DYXaK0Q83bfm+mpWGN81PD0gxNFAQF+aIZqoC1b0
 4VpG1vLFv2T4Zf55XM7P4tNCXtrkXbqXaLoOqg5LucF2xAbgHkBYPRNzmPo8ICPEsHB638QUM
 EFChZXjK7QXHFZ4sHHBTJDfcg5RbDzktpmk9x8fYNNxr5lr/X6qDOp6trCUDkVsTF6jHE73i1
 Wv5zq5sC80FQYPHMfI4Z+sA6yolM9qu546GEV2MoZkxuBgKKQjWlgOwsY+RE+LszZ79TeTtA5
 dHpD1TbP1S7YeJ2SG7kD72t/ueHXDNkKtDs2kAEsTG5NZ/NVMPPwTqrOxv4h5zvpaybf5yDMV
 emae3iKK8Wd3Qx7CRMw6RsDU8F9YVXfjFKbwiOH/ejeImOs8cQDix7LOBlaXSbsZAGG6Y1z1c
 MVBsILOI0F7SwEZ9Co4OrewVcoZguQFKrwJQ5Rz/bFN1VWIREnITXP3FaoPYE9f9gMcSD9O2N
 B26RFPum/QFdeBOodwNoFHPExe3Tf0Y276RNxeG8KOHPwEXm+tCNJhwiI7R2Y201PpAdASlfv
 OGiyxs7Xrj3wlCM0l16g8H5A==

=E2=80=A6
> ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.

Please choose an imperative wording for an improved change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc5#n94

Regards,
Markus

