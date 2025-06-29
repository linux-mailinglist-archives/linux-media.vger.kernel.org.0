Return-Path: <linux-media+bounces-36184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2E7AECEDF
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 19:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EF243B4045
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 17:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B4D236A73;
	Sun, 29 Jun 2025 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="n1H276Sr"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D761EFF92;
	Sun, 29 Jun 2025 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751216718; cv=none; b=iO2V/KDRig5u6gRukoK59OFxOIPCUiJ/erxa0zNF2qfWhWykaXIrcgTHDVp/ELB06zfKS81Nrr3mcXJkxfh41keR4jiK8Y9jcZmlIsNukI7fLaGJvt7BY6qMXLjpZWcrX3tOyaqbahdlelKP/nehYKzUoIxmk+SuPuGX4B3xWMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751216718; c=relaxed/simple;
	bh=VUwk1cKpTXzAjLmGHrn2PCp5/Ta5DzPdb03GWWG0XC4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ptPp0Vj7cpLenr8gHKneNR8EqymFjTy6waTnn93dfSsOic1hPlns7NAbcJUjs1981oIdMx9op/ZshMwf4Q85xfpl4D/+OTC81czacfmMgQqZXHFznaGmF3w+EHOehvUHy4dai7+3LylmJBePiU3UXBaJvl2VFD+vpZKqDuRUAQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=n1H276Sr; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1751216710; x=1751821510; i=markus.elfring@web.de;
	bh=VUwk1cKpTXzAjLmGHrn2PCp5/Ta5DzPdb03GWWG0XC4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=n1H276Srr5OhfWne3g2zjl+F8Xn/3Vrd36eZ7oBRRZOzSCSqf2U0XYUYZ9lnozY6
	 SjidPYtGZ3d/xuPFpVqbNL+qF8QzJsVNskM6vy2LS2hz/2Qe3iGzDScz8jdHYrbAt
	 1wc0Ha+NEsLr+B64rSDe5saiT9RL8uDVN8HPATLH8jQccPyLD9yto/ZzqVzbr+guK
	 GiFfb/1ty+krcSgx2E6CFJv7tOj78bh7OO4ryXdXgVUGqvTgEx8q/k4R7FzvuchTO
	 BhO1e9acNrLCpQsfjQtZPiqdbjFAG/Sn63S5IzpHJXkdUkJgF8zQL6Qzgf8bF9H4V
	 bT6buhDsSzeRKJwhSg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.227]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mae3q-1v81Ai15Z4-00oxcY; Sun, 29
 Jun 2025 19:05:10 +0200
Message-ID: <199ab7a0-7f06-4448-beee-48e67063b36b@web.de>
Date: Sun, 29 Jun 2025 19:05:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 linux-media@vger.kernel.org, phone-devel@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20250629-imx214_fixes-v1-5-873eb94ad635@apitzsch.eu>
Subject: Re: [PATCH 5/5] media: i2c: imx214: Separat legacy link frequency
 check from PLL calculation
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250629-imx214_fixes-v1-5-873eb94ad635@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:9mshQ/YJJr/0tEBjR8WBi6fROpeRdoV+sMZ/9B3O+2qJw2Wgmu2
 0oM7B6gEzk9TWuaIQ6XIxvs9KRTbZ26q97ipNQj9kT2CpAX5uCQtdNo+GDn5QfOUika0MvZ
 1Y4Ld93G5wOYafPWTD4uw4VM2AkXdOvr/YimIXBYFnY/srhywoWfVrIk5SwVlirlxhpH7B5
 g+TUw+RvbS/LosXluzsoA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yreo6TPkN9c=;WqcLiOPeDxTx3d+YzFE9LUelsj+
 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
 3k7h6wqSnRdnDTQTf1Tf9MI=

> This makes it easier to drop this legacy support from the driver later.

How do you think about to avoid a typo in the summary phrase?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.16-rc3#n94

Regards,
Markus

