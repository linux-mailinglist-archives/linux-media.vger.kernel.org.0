Return-Path: <linux-media+bounces-38941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF918B1B4EF
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 15:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB83A182981
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C28274FEB;
	Tue,  5 Aug 2025 13:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="G6TtpqkN"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CDD22CBD3;
	Tue,  5 Aug 2025 13:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754400783; cv=none; b=YDb2dpyZZSMlrNFK2CM4CuARjIwD7EKHjUSs875dJipKEMXrWey7DzGuCeUsalYhbULLVDLddiwq1g1pTO3991RRi0ID8I27slbJdb8o7pb46dr/JO0/M3eCO+wrqmV/E9fPEytvKmwxoGL4vUgiTDg1dCmsP2shIjuYui0v+3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754400783; c=relaxed/simple;
	bh=OttJ4edm8UFQhTOi4nJFKmsxngrug/VcNMIUMJ3K4dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PEsNkUJ6z3WX+/MDNSZ13dVHGPC2LRedEMjeSYxXMWr7pob9C8y8L2mZJyHAjqWMGZFOCuFXfaMB+Q7WpbgJ5GObol2/TedxfJkSei6liG2j4HddX3wgmq9TrBXquk+T+WllR/DqNrJ3D9jpMFEaUHS9cRtZOeYuY/UwE8E9OMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=G6TtpqkN; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754400772; x=1755005572; i=markus.elfring@web.de;
	bh=OttJ4edm8UFQhTOi4nJFKmsxngrug/VcNMIUMJ3K4dQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=G6TtpqkNvB3Q3Gz372yIbeu/K1PNbDqqRXwITVh5qQIJxs0zn4LO1g1WMINqTolD
	 j+0awfjBMPG1Pyycizwkzeuf9lnIBuJroZPa6QzhWl5PJlIszpZYIORBhCaa9rhSF
	 0aYbMYaDQVBw6C+6O8GmTqDFHJzy3OPmEvYhiyd1fjYk6iN2Mipp1N+dCjhIR2WIr
	 RpRPi12sINVx+Pvr4yYFlHItTT8stjr4XCIEJNNk5mWFVxSxmEoE5225KscWmxiJx
	 hR8G7rBdHLsX8XEi0VgelmTEtomWweTgnlxhlNwNoSBsCJ2tEq/C5yhTPA6JJtAth
	 O90C8+6DpBt2OvviDg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.245]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MMGuC-1v1Vgq15sc-00QOIc; Tue, 05
 Aug 2025 15:32:50 +0200
Message-ID: <887bfbac-0e16-491b-ab0b-a0997890ff2d@web.de>
Date: Tue, 5 Aug 2025 15:32:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: mediatek: vcodec: use = { } instead of memset()
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
 <9f0b868c-47f9-4c98-ac99-86bfbc6a432d@web.de>
 <e3903e95-3659-4d68-86ef-0f3d6b2c8d90@vivo.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <e3903e95-3659-4d68-86ef-0f3d6b2c8d90@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZHESRNeUe+wthbJ4102OINdJusMUaOy4eDlPqpCyT6lm7AKnqel
 G8olTU6WYK67JQND2h7POtsw+vi1yuTmeBMHR3yiUBInSoGXQ9RESgtrvW2hZ+u3rDC20ko
 OpfydNnZVfwZuqTadwUJkUztLcNxNsvbWDHngxtAUnaavwCsgj6SiVS2v1gA40StMF2F+9J
 XnSC+c/rb3yW9sF56MvmA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:50KokDcRDK0=;9eF2ETINOePgtV0+qm/X3cjEOC8
 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

>> =E2=80=A6
>>> This patch converts =E2=80=A6
>> See also once more:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.16#n94
> I don't think your point is a problem here. =E2=80=A6

Will any contributors care more for the usage of imperative mood
also according to improved change descriptions?

Regards,
Markus

