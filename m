Return-Path: <linux-media+bounces-18055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C47CA972CEE
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 11:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B9FC1F260CA
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 09:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A92188CC6;
	Tue, 10 Sep 2024 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fqNqOr4n";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="ekRH7SVV"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-43.smtp-out.eu-west-1.amazonses.com (a7-43.smtp-out.eu-west-1.amazonses.com [54.240.7.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2E1188588;
	Tue, 10 Sep 2024 09:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725959287; cv=none; b=d60qEydyaYpAfIPUh0fc2ZD+dQZr//5VnRrF/CJixj0aYVK0vcPkDyrM/fTzvgdHYNWo5UHfPPk4PGM+FVzoxlGdw4B7nuRwNpXa5TAKXWyBuhfkuO0k380kHLHCP6UkkNao85SPggAUrCOXhYK90gk6p+nwHjRypgvOUAgB6ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725959287; c=relaxed/simple;
	bh=WH9kVZysmZNMRDwXp4grwWcs4nQAIudKkDgd3CUuEZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NvcRroOYZIyIvWuml4kLHUk/HkDikzErAF/w/cBhGVvIRNN2c1tdsrqQtOZ9bt1Ygncp+Zw64LWtXsJ8KazABkmjyOIjCSG+T1Ims3x1njLHpCeQOA7NM5uvLoozzWr0wxEFLUAGN5VDL1egtKlOMulh0/6xWOhOsFWM2kmPnRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fqNqOr4n; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=ekRH7SVV; arc=none smtp.client-ip=54.240.7.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725959284;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WH9kVZysmZNMRDwXp4grwWcs4nQAIudKkDgd3CUuEZs=;
	b=fqNqOr4nXf4A+hn8ibVShcL4kwFD89Y1P93+Us30+DrWl0VPalhBdr/SGM6HQFjW
	TMsDpXtkdK29OLc4HOXn48kUbij8ouzdftnUnkBFRKphyENpe+Ow++pyrmUCr/I3xEY
	4DBbS3gT4FO7UNngblAqy0kFyF4keV2YaYIckCchK9kTR+jk8DtQN+2BDfufkjWc/wd
	HM3v9gAt6jIZm/0l4Vjy1GEa9Byku2gSYA2etudFkgvSt9tYH7TmpvijM0uvWkiX//5
	YTvrfBJosdYcVtCIUIdlZbnd7oBkeidhOBRy1o81ccxqj/wEfi8bxNtWidkIsVcNfPl
	BeWL4tfZww==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725959284;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=WH9kVZysmZNMRDwXp4grwWcs4nQAIudKkDgd3CUuEZs=;
	b=ekRH7SVVIJ5L/mxPW7f+vC/XT2x1XxTJRETS7BC7Yj/8U2Fkh7miZ9fF37CVm4y8
	VIsSwagX4ejafJg9f4W5zYGIEZoYIhFtDSzGniIY3SdNfZVC1hzJkW3QToVljG4GKrP
	yOfs+V/to9USTVDK8eh94jeP+avUU7T4L+25CbwY=
Message-ID: <01020191db30a663-da080c6b-23b4-4a2b-9e3b-b32c2f1318df-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 09:08:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: platform: mtk-mdp3: Remove useless variadic
 arguments from macros
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
 <20240823-mdp3-comp-cleanups-v1-2-1f8c1395ecd3@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240823-mdp3-comp-cleanups-v1-2-1f8c1395ecd3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.43

Il 23/08/24 23:31, Nícolas F. R. A. Prado ha scritto:
> A few macros declare variadic arguments even though the underlying
> functions don't support them. Remove them.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

