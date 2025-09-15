Return-Path: <linux-media+bounces-42564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68980B58109
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 17:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D67461884AE2
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 15:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5327215F42;
	Mon, 15 Sep 2025 15:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="WXDccESt"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0517D1E4BE;
	Mon, 15 Sep 2025 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757950558; cv=none; b=T0QSLzOAKLMcwuA2zox+Q7Wh1NE0EO6PXcZSlAdC+iIiIn34oJk/YYgs81QxUgn+tlIWd3WZmKy1tPvVtFaAgVUhoGtJQz5x0JghW9Hl6GrAVVmysrrN4WQu6HaznAQhOSi/3uCrFHNBZmFXzLh2Qs0w0r9Ht+auQOPL2EfmbSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757950558; c=relaxed/simple;
	bh=PxGo7kzl/T2s9qu0TsdeGJcTqn+JdLL61q41vdO9il4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=JJfshq6HspBqj/UzDkEOOLCC3XCk3/xAc+QHMMVQEhB/eQGpO3Qv8L29V0k7aa5x9Ta31aYcV9NEI72+Zwei5LZBmiEe7LvBkgJhUvYFMZOXjMEXPH2QtWsajKUOrxy7nTGKqXQ0k5kFsZK7rr/936QSMBAlw8C5j+H+WrsI1nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=WXDccESt; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1757950526; x=1758555326; i=markus.elfring@web.de;
	bh=PxGo7kzl/T2s9qu0TsdeGJcTqn+JdLL61q41vdO9il4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WXDccEStW10SJoelt1vAGHJp9LDzubDn42yeT4k8DFFc7yG/hc1POpjzRrzzukfX
	 BczdPRcrq/jsImVifeFEPjO+TMtbNRDQapOciSX8OvOZeOalldbb5WPoxzf11hb/q
	 JbT7xgmWACl8UjiCKerd7HzVC5sQwmy8J1DfJWx4DlxCTw7QjsPb3uyxKQ4up+0IU
	 ILkZTcPMfOCvYhsOu2tjobALf5dN4L7/Wo9LPcPAM9eGwWVIJBj7D93CdKqY7ekho
	 ZB69yRRXVP1TK/EKXCk1R18hctCZwbNFNxCK45bnHghlLxsL8cBxLnp/WutnDGuaK
	 lO9EfxbErP8Ar3KltA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.188]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MuF8x-1u6mOp2pKv-00rfY4; Mon, 15
 Sep 2025 17:35:26 +0200
Message-ID: <f1e106c1-f441-434f-a69c-55348163435a@web.de>
Date: Mon, 15 Sep 2025 17:35:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Haoxiang Li <haoxiang_li2024@163.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>
References: <20250915120938.177691-1-haoxiang_li2024@163.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Fix a reference leak in
 mtk_vcodec_fw_vpu_init()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250915120938.177691-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R9VKhmOH0+oLOPpLvX8CgduHZG20PP6w2bHj9YQBmaa3U1sf9P8
 9f/3y4vsr67zJjLI8r9QKVQDi6KC+2bKfiotz2NvjY/wbJAgs+O04SduaP3ooQyw12rhE3z
 dCk7f72BO1vJjkfDuIrXsLzGvF47fi83g1Ofzd/II4F2C6h6HNXVUddqalxKhrtqLlxnFnh
 p+jImSkp5xD9GL2JpBo/Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+VmF3fcdpNM=;o4VsCfF/509KeeS3TGBYH7vImt2
 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
 hWMRnWGNU+/TR4h5nX0

=E2=80=A6
> Fix this by calling put_device() on fw_pdev->dev before returning
> on the error path.

How do you think about to increase the application of scope-based resource=
 management?

Regards,
Markus

