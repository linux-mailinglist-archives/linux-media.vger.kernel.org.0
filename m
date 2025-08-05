Return-Path: <linux-media+bounces-38928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64720B1B413
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 15:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 632877AF9DE
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135CE272E71;
	Tue,  5 Aug 2025 13:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="nrD8lX+c"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D7326B2AC;
	Tue,  5 Aug 2025 13:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399232; cv=none; b=UaDWQATBmXDFfUQ93zJ2v3HkPjaFTcYiZ8CN0+pO6Cw0YtA+UnRvxOmxtyBqSE8zQazNTMEgqdIndIO6MspnCzK4eNqgYcJkao9w9m95yXXgMSPrXH7yaplL/7UkdXnZ7nA1BiR6wz42/nuLPujUHb5KtuNqNncxQPJsRzJagzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399232; c=relaxed/simple;
	bh=9GUMbfBnqIHCDnl3z+oX++PW72s+Imflt7F3hAYeMCo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=t8NKSf7NcKPwiqXCwfnV+DWg9/qerc9nCzAcqhic3CXpSfXDdvpiNz7wZ3Dft8r4XjQ1MnezKOsMrewHB9Etr5Tp0jM9JZjnQpqLN9HY8aLMKyeqUW1+DGN9uS21AijBcvSNv57WpEweqB08d0QF2nkqym20DzxMno5hwa5lJbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=nrD8lX+c; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754399208; x=1755004008; i=markus.elfring@web.de;
	bh=9GUMbfBnqIHCDnl3z+oX++PW72s+Imflt7F3hAYeMCo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nrD8lX+cv2M24IWj+axNGJqsHncwo51pw43bNyD31V02rUkhBP9DWGZn6XzbXsN6
	 DmzQPGq6r1du0/er/ZqbZA+6W66rOuqze2S3ArEzG9TRbJKnC3vH9KehldOJPeb+P
	 RBxmzUuDDihilBw3yohaNlR/FKk8QbLvoTnOGPwv3Ku5NG9qVIdW/MRIPRAQXUHZF
	 Kr/+xF/rDS0+1Zwn4lBr/TseiPdMckCT1VApd9DuXpXW3rzsw6I1STFG1zmwyB7xi
	 nFgykonpe+sU3QWt+P8O3u3FazLGWGlLZmh4Lsn7DLxr6ubExkhQVyTM0qM1X6qCc
	 HbublSi3RwgZUvy2Pw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.245]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M6YJ1-1uhNZJ0iML-00HBKB; Tue, 05
 Aug 2025 15:06:48 +0200
Message-ID: <9f0b868c-47f9-4c98-ac99-86bfbc6a432d@web.de>
Date: Tue, 5 Aug 2025 15:06:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qianfeng Rong <rongqianfeng@vivo.com>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
References: <20250803135514.118892-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH] media: mediatek: vcodec: use = { } instead of memset()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250803135514.118892-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i+ctfpUnk9v+OA93ozPwWFRQ1HMHTONEAOfCEr6ki5gDIbd/Y7N
 s7oIAAhtWS3WOk8M7ZQ+38iLbmtTnw2HSLPHogecw5ilJV/JOrUO+XdodczvXuzCzWg4DjR
 qMxzz/bZxIJkQ2lc/nkJqBM3hKM/IDBiTbLUMO2FBpLNjIRSoJXzTMqc9BVmmLaYLC4LZtI
 3c+XJ1W+InBhI5UUcYDPg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5MzyQ8MbDmk=;oMOnD1bnPESEhYRSX+M5hE+lVRT
 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
 kQaHpnJyQHg==

=E2=80=A6
> This patch converts =E2=80=A6

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16#n94

Regards,
Markus

