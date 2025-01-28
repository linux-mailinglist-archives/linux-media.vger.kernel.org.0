Return-Path: <linux-media+bounces-25389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7367A213B8
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 22:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A324B3A4F4F
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 21:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF6D1946B8;
	Tue, 28 Jan 2025 21:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arcor.de header.i=@arcor.de header.b="heZJGV8J"
X-Original-To: linux-media@vger.kernel.org
Received: from mr6.vodafonemail.de (mr6.vodafonemail.de [145.253.228.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD83878F58;
	Tue, 28 Jan 2025 21:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.253.228.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738101055; cv=none; b=WvlEoOtl3XsmZ+Itzc1EWvRqoaHPhQot/9L+oSxhqXWm3RIAZt4+ls/L32asqZGBeTbMrgFVU/VLjvfmCE0gX3XMNiToUkzEt/LhLH9xWK5sUaP9SLvLkphEd2U+ng/ZUIvxQcRxmlrCsyT2BPYGplSnYu0RZxkU1MWbYQlaXGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738101055; c=relaxed/simple;
	bh=HKMbHG41kO96ZF2P48iZY660NW4iqDPvky++tHvVjE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKGko+iso+tg/amLVycvpiJ1dKemJnwoMgUhKKTIKlicdiYEaLVIwzrhMI1V1VLnBloolB/e2sdbF5LiVxVHFknDZ5Mc8vDKEXEw6v4Z4spxep7hChgy2OjrFhEicbOCxP+mKujkcmP+rQ+noGyJwfkfXSzrBmDG8mqlYrk8+6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arcor.de; spf=pass smtp.mailfrom=arcor.de; dkim=pass (1024-bit key) header.d=arcor.de header.i=@arcor.de header.b=heZJGV8J; arc=none smtp.client-ip=145.253.228.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arcor.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arcor.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
	s=vfde-mb-mr2-23sep; t=1738100684;
	bh=tGbpeM79xiFk5lp0rBzeLonbHibRpHMeiZL0TF7ClVQ=;
	h=Message-ID:Date:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:From;
	b=heZJGV8J+vPNhcQzzlETPmmSiTlBizcsmYUW+lKUe46CVMEbFLGR5yYtzDzk+6iCe
	 dcZAg33greGdgjO0FE3IemqWlsZv3l3+XDSPdGbPBnrxAiTtWTEjpSDUuRuH4B+YQH
	 CjVk8Dokht4vNahB2wCpK2t27hhDwB9LMsJ0UAvA=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr6.vodafonemail.de (Postfix) with ESMTPS id 4YjJj82c6tz1xqh;
	Tue, 28 Jan 2025 21:44:44 +0000 (UTC)
Received: from [192.168.178.41] (port-83-236-36-1.dynamic.as20676.net [83.236.36.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4YjJhm5f97z8snN;
	Tue, 28 Jan 2025 21:44:21 +0000 (UTC)
Message-ID: <6c663851-52f7-42fe-92a4-3e33f46a8dd5@arcor.de>
Date: Tue, 28 Jan 2025 22:44:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.12.10: Regression in Hans' commit 613f2150 leading to excessive
 sysfs entry recreation?
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, stable@vger.kernel.org,
 linux-media@vger.kernel.org
Cc: regressions@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Farblos <farblos@vodafonemail.de>
References: <6555309b-830d-449b-800c-55306c19c659@vodafonemail.de>
 <D69CB9C3-AF3E-4E60-B35B-FBBE1D363207@arcor.de>
 <0c8c26e3-f806-4238-80e7-14ec0a288589@xs4all.nl>
From: Jens Schmidt <jens.schmidt140@arcor.de>
Content-Language: de-DE-frami, en-US
In-Reply-To: <0c8c26e3-f806-4238-80e7-14ec0a288589@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 506
X-purgate-ID: 155817::1738100680-837FD465-FE86B99C/0/0

On 2025-01-28  16:45, Hans Verkuil wrote:

> Well spotted! Yes, it is related to that commit.
> 
> I'll take a closer look at this tomorrow since this test against
> cec_caps needs work.

Thanks.

Only I feel that I messed up my first ever kernel bug by using
the wrong MUA at the wrong time ... if there is any "reported by"
thingy to attribute to me (no feelings hurt if not), please
attribute to my "Open Source alter ego" 

  Farblos <farblos@vodafonemail.de>

Thanks again.

Jens


