Return-Path: <linux-media+bounces-28986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C989A755BA
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 11:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B15B13AF753
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 10:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10E01B4153;
	Sat, 29 Mar 2025 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="wsaGJWT2"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FD0DDC5;
	Sat, 29 Mar 2025 10:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743243851; cv=none; b=rSpb6L+rcWdnEiR0s3sDSf4kMR4LtLXcTWk2+ds/ItNJGtOMNVtk9TZbsJ0qVanHv4HCQFkV8wJ6yJbEOxlQv2tFPQ0Y/FgIGVKYkrluzUr+bZi9mHO3i5mQD4j//XkqlmgKYJJcBC1uRXGq2UluZIiEjrGBxt8S6beCtC8FbbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743243851; c=relaxed/simple;
	bh=TrP/Wn4eGdTF9dtf8nunHsdhuK0sv13xjOztlIjAtNM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=trVZkvN9nrux5TjaQaFEsIITyeXdl0foL0MmJuElKa5z2U1iQaB27bilMAV52kmG78ILp9NjYjpryrBJ7a8InkU+ftFf9SHnxHWnkzpKRsXuQgEBbTRKjtqDKdFnbRwdhRZ8MpJg7q78fPay6TOCzIOBJsA1d+xh7F/WCqZAlio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=wsaGJWT2; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743243829; x=1743848629; i=markus.elfring@web.de;
	bh=5LdYBXjWs0RyPdcjUc2Be6rWzStGoVEOUQW1Riy+q3U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=wsaGJWT2jLlmHkroDUKYzkhpUHqTOaXmezvlvEioH7x1qIquKnTPhyHNlZxx8JDI
	 AyT3LS6cOF9vhfEV/kXuI/QzPC4hWXX3ekouWMa88TtArnC6FlYNAo/S5N23QEd2I
	 lPx7j8xjmtWsCyPJI3EbSQTo4YQqm9HKmGPigZ8oubjJA6v/1BumJUiDNUZKog67y
	 Bv1e9Ftlc70HksOvjQCVdnaF71SyAM2IR5kXSDczWeTDW+XVjAJVRFxcGj8+0CKOi
	 lmwpSzEp5N8pjHVnFQjrjPcOafgRyoin68ZiYiWTQ7LQpEu5XV36TD6kXLwZy1kT0
	 eWDAOVV1cY9jQ3M7zQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKMA1-1th4h81HKx-00WiVs; Sat, 29
 Mar 2025 11:23:49 +0100
Message-ID: <6ff5acac-4d41-4d4a-853c-9902e9673ef0@web.de>
Date: Sat, 29 Mar 2025 11:23:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250311-c3isp-v7-8-c3551bed9005@amlogic.com>
Subject: Re: [PATCH v7 08/10] media: platform: Add C3 ISP driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250311-c3isp-v7-8-c3551bed9005@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:riFjtPdbDedxzsNaYtyXo2sh6luU6tuyWJXs0z3HvNwCQBLzhxp
 065KY/dRCY5x3GJfxAN6znLfG5OqoW3fS447hGBLX/5krmf8rk8J7fEntEsRLGU75aosVU2
 l1YsPoP/Ko3nAtUDQEVizVJSA23PGAUczp6NUia+wNo2ypZgxD8xC8avM+KKPsIpgz4spL6
 1gBONuD3929yaB+ClTPfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DGlqtvh/EY8=;Ddz7mg13dgziraSgEKsDLx1bmaB
 XphbsDkuHCJiOBVKYf8j6LxY9XuYN5vksxveD3Zyld4QGG9awoWG4guLP5VekANWHaBfrG9sP
 jIVbZ0OZpVpW/vfit7+KFbWAGkKcbqla/fn7fKzdH+HE5JbCHfV7nDFbytfyN4hcKXrpW5xRP
 yAQ2InOfdvSN+sHp1RfOf+xWe3U/HuA/rQxTwqWZ151irQ0XPZGyjMh5h1glo236g6Ed8nf4+
 f+JSBvgzPEBSCb/ILtwDTrJR9FhE/fPlDmL1JruaPvew3ZlWVvCg7lpm+t+lks8D/+il3YnGr
 uMer4eoYNkW6b8h/OOYyNIqcIaYnqWHtQCDhptlowo3yuYQp2DDUubSRQjANG9JdtdGMJ63dG
 FihBIyVufuhd0avNRxQHGS7eo1BpxL5R6/siuCKeScSafMxs9LRwwKgJpz1CD3BL5U/NwSwZn
 0s84TcZg33A2Q/a6xMNR/8YYb4yhGMUQHz83GLdhO1PmCvxRYEIzBjHupPfph5bl+XG/suLW4
 lWRGlgJdPgXEqbjBEM76QEplRF4Ay3YssQKz4+PzgQJDQN2vDpLXq2f+ZLMPIbU/LeTxLyH1G
 1QXFCKNTlRsehS6M7c/DvZJ6VY+RZkPkbOrT+ulyAVfGQcUegtnikR/MdXueqtVeKJxgBLOmh
 HH8zbJPAzqD44NyED3dilUiVSWEd7zgrXh9Tg+aO4cca3+cWN5nGB3s7+RDwuW0/ePG9t49i2
 nuEOBKOGDnEQalYPcX/BDRkPYo8aVWMmPTMDiNhS1Wkc29LbbnaNkE43MnTd8H8lOMsrEDJn9
 p03XAXNmZtA8BDwtmFIzejIS6wNH2eaVCzpp17kQLvQwCDcwoxEUA4FS2MfWimsN0GeT0RO3U
 Zhee6BgP7A4L9E4YVJOGiT18A6hJjABniB+t6bWf9MmJtHaou5wF0Nnd14X4pdBPF7mPrDpf5
 nXK27Fh09354zKnsYqd4CdSBYHtMpRiHJf+pOL9bJKwbHva4C3L2JkwIMc7uEt5uGf2NycjxV
 5TMLyVjET7af8XVvI4oJxuuj8Dfg+LTPrtvZLiS14DZyYY7NudFKyPyLinRI7/8eIG7XWc8+d
 QrFWAak8TKMCaDuOPvWjFib747NPQrfImfcfNgWSKyrR26HEq6R+kqctMn/zNfuWcIFFhCvW3
 fdP3ZjI+dq4HjSJzb0hPeB3x3YEhhbCh4Kt1dwhn4M/60KU5l1pAVakSInE9QDz1y830/iScO
 o0jTnQC8Af4ltUYreUaR+sCoapI1T3ioLsh+AyoAuU2D3Z3azdox6Ga2x9cOGtRgjXHjqT+ks
 xKOFmy3tWLKLvQ9jX7X2ywuWY+CIeU2x3zmyq8C/Mmbt1Ia21j1xEBbXiwdidc/rLP7ci7SGW
 MDMuOAcq1WdGhvaTG4TKBoz8CCO/0IBD6ldKYFuxRKUo1Vl+s8c7gmic795P7E4XiwBnyjk+d
 bYadjhnPX5AXLuibo0OBHMARnO5eyV1GEAzQZ7sklsbeTtWd9pW6HJIQMx5OScPoqFTVhSw==

> The C3 ISP supports multi-camera and muti-exposure

                                       multiexposure?


> high dynamic range (HDR). It brings together some
> advanced imaging technologies to provide good image quality.
=E2=80=A6

You may occasionally put more than 60 characters into text lines
of such a change description.

See also:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.14#n94

Regards,
Markus

