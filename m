Return-Path: <linux-media+bounces-48138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D309EC9E723
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 10:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BC7D4E1865
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 09:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5005E2DC776;
	Wed,  3 Dec 2025 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GvqY1b+q";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="EegJXA4R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E16D25B31D;
	Wed,  3 Dec 2025 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764753700; cv=none; b=KoM5PZYVd5QkTVXvk+CZLZitv2dqHxvNTWuveWOJESFYMAmsOLlYoxpVrWLr/ZcDpbWvhaORbC032uVHCkH8nbqC1EPQ6PUHV1taSv3oI4PrExdKFqjPAOTaJG4tFFzZLiBh/+UxpLnzDXw9MXCS82ou/YyGFVcliImxYqeGZck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764753700; c=relaxed/simple;
	bh=8/DMKispPhVOB48ghh6Kz40cgrCCwGXbb/Q2gzGcmj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RP5kaSFPzmQDcFPrqM6c95hh2sCjuBU+nZtfr5TYRileZC+AydIzSWXFCGKbN8J311+2rMvo4/6TYplLr+fzwqHNBFF4utTgQxoJv3Sy+SF4ijU+Nq+401g/C8hk2L2RB5UUOFa4NtwhENDMbceWJID/O4KHoiv8db7sKWqhgoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=GvqY1b+q; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=EegJXA4R; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1764753691; bh=U0/PwUkJsw6fA82odH8GggG
	uGT/E7RXMkt0H6HrI1yI=; b=GvqY1b+qnYFHpoE2du+vVD/ygmhcu4YySyfDamMik5A70CCigt
	2h68Ee+ZxC3GMM7BauMYT++gJmaRrlCC5+9CDvVEYixfZYVSL6h96HOzz69SM0pGzMKk+up5LEj
	ZF2t4PTmhQOhFUh7CsQWQCN3lusYTaiviBh9n7EqAXXDroYE5m+bjzDepv1050egcnX5TFpIGQ8
	R/UsxF3UQO4stvKTQsBYXcn0QCx633C3vldXDzpvGMWFvd/YIfR6V9XOb2I07h6ApGuwCDkkPL7
	Nsz28dbiRJyBdizAyMqblqRRybJeYrV4jYv8zHFZjMIvFNjSpoSEJZhvf5/Y5R40OGQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1764753691; bh=U0/PwUkJsw6fA82odH8GggG
	uGT/E7RXMkt0H6HrI1yI=; b=EegJXA4Rz3wO7qaGPXzLqokh0Fm+GKre2gyA+l9NtoDDyJq/48
	rxzTVF4zAgH5cIPpQORCHVUEWvWSUUUBINDQ==;
Message-ID: <dd83ca81-83eb-4347-b4cc-839e1a5a7f90@mainlining.org>
Date: Wed, 3 Dec 2025 12:21:29 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: i2c: Add driver for LC898217XC VCM
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, david@ixit.cz,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 Vitalii Skorkin <nikroks@mainlining.org>,
 Antonio Rische <nt8r@protonmail.com>
References: <20251201-media-i2c-lc898217xc-initial-driver-v3-0-46e23897e921@mainlining.org>
 <20251201-media-i2c-lc898217xc-initial-driver-v3-2-46e23897e921@mainlining.org>
 <CAPY8ntCKfGX_5wCSnQz3YAmQD_pyeF+q3EoMDxyXA4Dgg9osmg@mail.gmail.com>
Content-Language: en-US
From: Vasiliy Doylov <nekocwd@mainlining.org>
In-Reply-To: <CAPY8ntCKfGX_5wCSnQz3YAmQD_pyeF+q3EoMDxyXA4Dgg9osmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/1/25 5:42 PM, Dave Stevenson wrote:
> Do you not want to restore the current position after resuming power?
> Potentially use  __v4l2_ctrl_handler_setup() to reset all controls
> should any extra ones get added.

I want to.

Should lc898217xc_runtime_resume fail if lc898217xc_set_dac fail?

IMO, It should ignore this error, but other drivers returning errcode


