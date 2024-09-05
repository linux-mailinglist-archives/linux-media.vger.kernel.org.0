Return-Path: <linux-media+bounces-17635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE4B96CE32
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 06:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7127A1C21E2C
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 04:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF2015539A;
	Thu,  5 Sep 2024 04:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=basantfashion.com header.i=@basantfashion.com header.b="jjcvR9TP"
X-Original-To: linux-media@vger.kernel.org
Received: from mod.modforum.org (mod.modforum.org [192.254.136.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C5214E2E6
	for <linux-media@vger.kernel.org>; Thu,  5 Sep 2024 04:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.254.136.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725511511; cv=none; b=F7YHGMcapUnWc4qaYOAO87kDeOxh1eTpjbYEFGX1NmR1tYLvLa7gpW2JXAHQ0ezdeqNVn52ZZAWOQJRYwM0rkM2lVte1vIyF37M1W85Pn49+R5UyFz0dtusCpJaIQj2gYbzXIMCSCXF+Kmz/CAnRmyqHOvSvSA759q4AVx4NEOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725511511; c=relaxed/simple;
	bh=G4BItOc8k/hB4suOfWWwTOg/U0FTlHwyCNnKCLPge2w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z+NvvQy/4fT1Gv2iGUKe8RMii+ekTBD4IN0al+9zOZ0V4jYeJtY9Y4Dwyxp4wqYbJBAcqqq5iGCXxQSZmYsIZLQRFYkeg1N22COxpn5YE4knSX8p0VGcGJdn1Rmp06SqMeaRu50Tf3zTf7I5+uU1yEyRQgNBwiFTfNTHmZ9kekU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=basantfashion.com; spf=pass smtp.mailfrom=basantfashion.com; dkim=pass (2048-bit key) header.d=basantfashion.com header.i=@basantfashion.com header.b=jjcvR9TP; arc=none smtp.client-ip=192.254.136.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=basantfashion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basantfashion.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=basantfashion.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G4BItOc8k/hB4suOfWWwTOg/U0FTlHwyCNnKCLPge2w=; b=jjcvR9TP3WnZzv0oCNfS2pS38h
	iRq/VEAR7lQcuLpxz4p82yl6ky7srKCkOlGHRsseGi2sYdnYLbhc+nGc4RLvclxHcRbvjwZxoUfUq
	Z1qlq2b5GTZqSyvAoe3lFGxtYixRp+6yxEyJgZTyEbEfOD0DWhKrmVbCCrLXBfekgwxUhLmQoqUCp
	bAKK1UXvkTwKfUXV3jUMxpcy2Y68l928iPZ6KtYSXpx4m+CVgRKMQ5bfsMoyGX3d60KodzPO5cQgD
	6dorTwRhIobk0pQKo3mpn9vy1vKWTDd3siZpO2TXHZVp5i1MO/MUJ6GvQ4YLAAv1yUoI1TNTuxmMM
	1ChhSAXQ==;
Received: from [162.244.210.121] (port=60834)
	by mod.modforum.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <kuljeet@basantfashion.com>)
	id 1sm4Ls-0006kv-0D
	for linux-media@vger.kernel.org; Wed, 04 Sep 2024 23:44:12 -0500
Reply-To: procurement@mercuira.com
From: MERCURIA  <kuljeet@basantfashion.com>
To: linux-media@vger.kernel.org
Subject: Request for Quote and Meeting Availability
Date: 4 Sep 2024 21:45:07 -0700
Message-ID: <20240904214506.F0F6E90FBBA39A1B@basantfashion.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - mod.modforum.org
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - basantfashion.com
X-Get-Message-Sender-Via: mod.modforum.org: authenticated_id: kuljeet@basantfashion.com
X-Authenticated-Sender: mod.modforum.org: kuljeet@basantfashion.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Greetings,

I hope you are doing great.

We have reviewed your products on your website, and several items=20
have caught our interest. We would like to request a quote the=20
following

Can you ship to the United States?

What are your best prices?

What support do you provide?

We are also interested in your services for this project.

Could you let us know your availability for a virtual meeting on=20
Zoom to discuss this project further?

Please advise us on these matters so that we can prepare a=20
meeting notice for our company executives to effectively engage=20
with you.

Thank you for your attention to this inquiry. We look forward to=20
your prompt response.

Best regards,

Nina Petrova
Procurement Manager
Email: procurement@mercuira.com
12 Marina View, Asia Square Tower 2, #26-01, Singapore, 018961
Phone: +65 641 1080

