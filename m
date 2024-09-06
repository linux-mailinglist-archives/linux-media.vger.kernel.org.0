Return-Path: <linux-media+bounces-17739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE7696ED92
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 10:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A7EA28345B
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 08:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1F1157A41;
	Fri,  6 Sep 2024 08:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RcHa/+l+";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="VTzYYLNu"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-44.smtp-out.eu-west-1.amazonses.com (a7-44.smtp-out.eu-west-1.amazonses.com [54.240.7.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637B0156F4C;
	Fri,  6 Sep 2024 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725610660; cv=none; b=dXgNgjNIOve5dJgJnQ82NM8IotTow/kgHHQ6/DtifMLbZhOMPeiU7GJ2x2DDfF+58GdDL3fMJSSHOv8JiVfNFtaA2nJznqEQpsoio6UQ6HIjdpIchyVTf9+YpHpHQr+aMz8tCH1YDg2IcPf1S+FhDCK3+USFi63We8qmp9XkrJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725610660; c=relaxed/simple;
	bh=5Wb8fP1SEMFE6J1hco629bsm8w9ZG7Mlhn8OcjaJNVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ogNAIY81vtrxSK413GQHVvsiwM/zOaZecR6zCGXPxs9sTB2D4T9XGM1t3aHhnyNrx2V609EnoIA4GQTqTZ/X7tSO80EPjr7urFWXP+3IGgdZ1U0++6YS9Am/OMD+KYgSA9DGxXYzh6tvH9/Vs6nFyTvEeoXtfHu17R6j24ES6HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RcHa/+l+; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=VTzYYLNu; arc=none smtp.client-ip=54.240.7.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725610656;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5Wb8fP1SEMFE6J1hco629bsm8w9ZG7Mlhn8OcjaJNVo=;
	b=RcHa/+l+DOBAVoa5TU8sKEbZ2RoOrayZl6FYJIZpncFsGRSW6hkVqo8X0X5pbg/c
	ySnV1UBHh71xdIlqyh+C1ZpotRBts8tbHFwD3Z0T+UZeAcFCMdatoJG1BBrHmOOSLnW
	UKmp1gD5Z6NdMmpZhjjKU5bnTMK17twPYiZY+HmY5gJy0Lbgng9lqFnLtrZt81J0MrH
	ZQDQsLIguCzeS7E8mJBNi7bh96LLLSa7XIQ5C3VM/sibaWjSQhAiP7ZRiWrWohwPb9k
	Imk8Adthfr/s/egcEx7iPaPN97ZCW/uoWF/TtsO+heNo7EH3A7ySj58bsd0TkZiU6SN
	dnD8pPNtmQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725610656;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=5Wb8fP1SEMFE6J1hco629bsm8w9ZG7Mlhn8OcjaJNVo=;
	b=VTzYYLNuMnj343jmhvymhUF3UBDLYeg0IHWy/sjm2BenIgksQrOOtJ7rXr8A5LON
	pn0/0SDI8fGzrMP87AZ1WscwGB7B96cneacJ2giOcf6v71S9RNqeYJ/368NJHIKvVg7
	9hgxLLKYn1AKxHZd7YqGlB+IzrzG+L/FmTIW9VDw=
Message-ID: <01020191c669040b-0320e5c0-d4b2-4241-a403-09ec32f7ef35-000000@eu-west-1.amazonses.com>
Date: Fri, 6 Sep 2024 08:17:36 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] soc: mediatek: cmdq: Remove cmdq_pkt_finalize()
 helper function
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Moudy Ho <moudy.ho@mediatek.com>, 
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-4-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240901143259.16849-4-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.06-54.240.7.44

Il 01/09/24 16:32, Chun-Kuang Hu ha scritto:
> In order to have fine-grained control, use cmdq_pkt_eoc() and
> cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

I'll pick this one after the media patches will be mainlined to avoid issues.

In the meanwhile, mainly as a self-reminder:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



