Return-Path: <linux-media+bounces-18054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A54972CEA
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 11:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5F012843F8
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 09:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13294188591;
	Tue, 10 Sep 2024 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Wpw3QA3B";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="RqmRS3xh"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-44.smtp-out.eu-west-1.amazonses.com (a7-44.smtp-out.eu-west-1.amazonses.com [54.240.7.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF66B187560;
	Tue, 10 Sep 2024 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725959285; cv=none; b=JFKDj0g3gSZcQNirOasB94VnAGJFAlcWMDJsw6+W4kBQ2wC6AQOBYNspPbMLrsipw/dtz0o1tv9e/0AxlqPIuvyB+MmhdH79ndyHbpzU5Q/ONpRQuuNC8JA1E74fhuZYaNqvItNVBerBWJsinyxzuMuGb0Fl3yNS8xw8oa2Try0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725959285; c=relaxed/simple;
	bh=4MGTJa48J1CqPLOLp7MjUqO5NfFHXXNKzWSU5StJO/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e0NShfMin9hk6ltH8PtvGroRHm0R3IqkhFoT8LtunpNc+AE/dUA3TbpwaTLTv9PvAdEdhu3WEuwt4ONHJ6bNS2KZIheI7opmSksb9hOq57MTO1VHHH0QKTTjdKte7LhdjPDupn4kK6PbKHviiw34xBA8KMxXipnJmerYL7Idn3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Wpw3QA3B; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=RqmRS3xh; arc=none smtp.client-ip=54.240.7.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725959282;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4MGTJa48J1CqPLOLp7MjUqO5NfFHXXNKzWSU5StJO/c=;
	b=Wpw3QA3BviVlwoK2hCxxDKhj03x5AD417aOlfMpWU1BsuJHGA+/zcrkzSbhp3FAq
	4bBChX1F3l4HN84Qe7EIxuYbZAhUqkdd+BfZuuRAIrEFf9dBSuKQYvxxfJXhenKA8nF
	JYZoGTS+zHFiSfZ/wZdPETfFge+677U/BKCn4ofvbrR2ge00PIiDW4HK/W5OZ6GbAoY
	3HWEX75tyPdAEnLDw2zeu/qwjR6UbN96B3GRObi79IZx4h1c4vrBT9f7vYduPxOzpP4
	OZ7i2bWE9LmBfQ8SGN7OvH3AQfzwKVrAGbKAykUo7Xp/ACKkqOodfomRUFsh4JJjVcR
	sAAFizqC3A==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725959282;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=4MGTJa48J1CqPLOLp7MjUqO5NfFHXXNKzWSU5StJO/c=;
	b=RqmRS3xhAewkHeNL0yr4Af0zFSCUi/No50VqHgA2DscUeSgybcHdHgiSlLGylsHL
	8FFWq/B+Ggwfjd7MSfaLI8IeoyyYeznEtVHjUCLdeZ7jIMOWbSt75Lr2taF5ZalQ72+
	l3+Q1sycoKTCHm88sII9p71Gnqq0h1EQr+un7tGs=
Message-ID: <01020191db309dcb-22192dd3-993f-45e4-9bf2-1997ba46acb5-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 09:08:02 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: platform: mtk-mdp3: Remove mask parameter from
 MM_REG_POLL macro
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
 <20240823-mdp3-comp-cleanups-v1-4-1f8c1395ecd3@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240823-mdp3-comp-cleanups-v1-4-1f8c1395ecd3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.44

Il 23/08/24 23:31, Nícolas F. R. A. Prado ha scritto:
> Just like was done with MM_REG_WRITE, remove the mask from the
> MM_REG_POLL macro, leaving MM_REG_POLL_MASK to be used when a mask is
> required, and update the call sites accordingly. In this case, all calls
> require a mask, so MM_REG_POLL remains unused, but at least this makes
> the MM_REG_POLL macros consistent with the MM_REG_WRITE ones.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



