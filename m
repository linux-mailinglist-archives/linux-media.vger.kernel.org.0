Return-Path: <linux-media+bounces-17870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D7397010D
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 10:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9FD4B23864
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 08:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8757A154C10;
	Sat,  7 Sep 2024 08:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="kduA/FtM"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A549A42A96;
	Sat,  7 Sep 2024 08:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725699142; cv=none; b=D/6h/KrsG5hTi807Dvcob99KKVRup1c5Zt+ueEfu7ccjMifzbBsnNO7lxshe788SXA3ed5oxjn0r3USlGwdt++WqdeLKxi1MIwZxxaUdGvu2LWBGf8YeVxP9VOp8Tzehblo3nOoS3X+KRaEUKyZzIkFS3h5meBDwoPFufYhnLK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725699142; c=relaxed/simple;
	bh=pjrV93iPRdrrx5VHqRXoPjQvj8ExvW1rekDeQHuUuY8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=tD0wsS7B0HtzL8r4PE+EbltwqXrv8QJIDSeEpjfDnORXsVwItqfgqa5+VA1tWdmIvRKO0ziHG4tQuhzI9u1OED2UCAMVJNUgijr5DwPiitlbKKfNII+cbk5O1ACWNAAHuXiTT1Hteb2GXsu+eI0ZBLWrwmY3yhfUNVjkjH2isxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=kduA/FtM; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1725699127; x=1726303927; i=markus.elfring@web.de;
	bh=pjrV93iPRdrrx5VHqRXoPjQvj8ExvW1rekDeQHuUuY8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kduA/FtMco+lRQKB61g0UxzRw5OkpRgmJHVliq4H3SLkuOqUdzLmyPtwjSRTBvmM
	 XiIdDc/fZnHzuL3dFCM5X7BimEP9DnD64yvgJLG5Z5qxhXaw/YpZYyzHlw/hCAULZ
	 e0gfaJU+fB90+Kbh9kh+khhzbUTLBSLg8r5yb9GItbwkjZdQmY+ejXUfDALWV8fC9
	 6CU1Nm/+flEoFEKuHTE4Fx7NF7GMeis/fQt6PSrgrd9zk06X2omUsfYDO9gVqbc9D
	 K+2MQ0JLOmXQ4na/5qy2PmTKlvovqGFltXcF3323GKZ0VSNV+UM1NEQPIRWIOHHjR
	 TF5Ah1TCASfawobj1g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MumJF-1rx5y0392x-015h1T; Sat, 07
 Sep 2024 10:52:07 +0200
Message-ID: <1df7c433-5e25-4bd8-b8fe-547d66984832@web.de>
Date: Sat, 7 Sep 2024 10:52:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240827-iris_v3-v3-5-c5fdbbe65e70@quicinc.com>
Subject: Re: [PATCH v3 05/29] media: iris: implement iris v4l2 file ops
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240827-iris_v3-v3-5-c5fdbbe65e70@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BZrxj9QBCWf6FdROIregyd7V26nTuUrF5mSFSXmvGzjKThV077u
 eWcs+EpDFa9idjVWTtV7jBJ0kE7rkc4uGqvqp7kCF2cVMxxNOT/qKv1RiHoWOnTp2TPRB1L
 aw8OhuefUZI5W8Xpt7plqJvmaYthPgYW6hBRhmQrGuWCkkEJ9P4CJ2jKvAPddo/fYJRcP3D
 RkDk5KANbTxJrLB/9sKMg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FMeaFPTIjns=;r+kkv/9decl4Pf7BmXCLXnQ62I5
 ePbCfODK1xs2l6xR5OBAOlemvZbwd1Xe5Cv0x+84+QG26ApLTM4x6i/bwQK0o2V9tvxJoAKhB
 BZQcqlRm1B9ZCG6HcF5LCOMQLiUsialJ1YzOHJdplGiCSFbMiTEjPbuLr0CbFcanc5AAu+OKT
 eGsY0ZE79kpCi7VnF134XXKxWJ2uiScuhufMkcs7uKiO2HMgI1kkjexEY3O9E3/ipY0V0Ij+O
 zQ6pj9kWzke/BUOgwwnjak5zC2piod5BR1jh/F94z8r4vOQUfU85BUrZthQJjrPySsPfuh86Q
 jz9OsrxrwIYQT8b7zfKREOF/2QYoNPKv07XypJMSuQmprGpXWSy6rJ4TOZaMWX4NX7VodJHiK
 ZHVcP+rudTdaNSY6nAJdvJFNQ7jSfranAvOmsferPimdHsCr7Wpn/tkzT9eO6MO+7FqZ6NMa3
 9aONDHdYBl9D6Itt7xbdmwzjDWuhP+hxdZbQBuPGsNo+sGJpQoymR6dTX5NvknVRqkQCgVrmm
 gS9BnT2enHgki3f+c10iXKgADKuYrgTlp5t7kZyFNoOAF1VNkdP8T5G5AUCtKTPzrJ1t+6Y/T
 nkqA8l9aYOtrnWWETjLsN3eAgasDZETiJ9JCGEVivDm/GNF4ekGhWYR+sV69SiS64RvA8ClzQ
 wVPIXamx/JXP1Yo6IfavWBh6+l0rtnzc1Y3N+Cp5j1DOMsmBwtAOTLvdd1hQbr9rftdTSeFjG
 GFDL1ZPlC5mjxZklqqvmMh4UYrhEyDDE/vc0u3yHl/1357mLlQoVWxwpfFdEFHcWXPFyPki1D
 UF4GASeaxAHsArtqavabzosA==

=E2=80=A6
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
> @@ -0,0 +1,13 @@
=E2=80=A6
> +#ifndef _IRIS_HFI_GEN1_H_
> +#define _IRIS_HFI_GEN1_H_
=E2=80=A6

I suggest to omit leading underscores from such identifiers.
https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+d=
efine+a+reserved+identifier

Regards,
Markus

